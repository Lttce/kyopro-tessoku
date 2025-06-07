#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main () {
    int n = 0;
    cin >> n;

    n += 2;

    auto as = vector(n, 0);
    for(int i=1; i<n-1; i++) {
        cin >> as[i];
    }

    auto q_l = vector(n, 0);
    for(int i=1; i<n-1; i++) {
        q_l[i] = max(q_l[i-1], as[i]);
    }

    auto q_r = vector(n, 0);
    for(int i=n-2; i>0; i--) {
        q_r[i] = max(q_r[i+1], as[i]);
    }
    
    int d = 0;
    cin >> d;

    while(d--) {
        int l = 0;
        int r = 0;
        cin >> l >> r;

        int m = max(q_l.at(l-1), q_r.at(r+1));
        cout << m << "\n";
    }
}
