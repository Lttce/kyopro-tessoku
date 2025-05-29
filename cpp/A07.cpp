#include <iostream>
#include <vector>

using namespace std;

int main() {
    int d = 0;
    int n = 0;

    cin >> d >> n;

    int size = d+2;
    vector<int> imos(size, 0);

    for(int i=0; i<n; i++) {
        int l = 0;
        int r = 0;
        cin >> l >> r;
        imos[l] += 1;
        imos[r+1] -= 1;
    }

    vector<int> ans(size, 0);
    for(int i = 1; i < size; i++) {
        ans[i] = ans[i-1] + imos[i];
    }

    for(int i=1; i<d+1; i++) {
        cout << ans[i] << "\n";
    }

}

