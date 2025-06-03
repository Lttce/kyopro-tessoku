#include <iostream>
#include <vector>

using namespace std;

int main () {
    int h = 0;
    int w = 0;
    int n = 0;
    cin >> h >> w >> n;

    // 1-indexed
    h++;
    w++;

    auto snows = vector(h+1, vector<int>(w+1, 0));
    
    while(n--) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        cin >> a >> b >> c >> d;

        snows[a][b] += 1;
        snows[a][d+1] -= 1;
        snows[c+1][b] -= 1;
        snows[c+1][d+1] += 1;
    }

    for(int i=1; i<h; i++) {
        for(int j=1; j<w; j++) {
            snows[i][j] += snows[i-1][j] + snows[i][j-1] - snows[i-1][j-1];
        }
    }

    for(int i=1; i<h; i++) {
        for(int j=1; j<w; j++) {
            cout << snows[i][j] << " ";
        }
        cout << "\n";
    }
}
