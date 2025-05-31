#include <iostream>
#include <vector>

using namespace std;

int main() {
    int h = 0;
    int w = 0;
    cin >> h >> w;

    h++; // 1-indexed
    w++; // 1-indexed
    vector<vector<int>> x(h, vector<int>(w, 0));
    for(int i=1; i<h; i++) {
        for(int j=1; j<w; j++) {
            cin >> x[i][j];
        }
    }

    // 縦横の累積和
    vector<vector<int>> db(h, vector<int>(w, 0));
    for(int i=1; i<h; i++) {
        for(int j=1; j<w; j++) {
            db[i][j] = x[i][j] + db[i-1][j] + db[i][j-1] - db[i-1][j-1];
        }
    }
    
    int q = 0;
    cin >> q;

    while (q--) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        cin >> a >> b >> c >> d;

        int s = db[c][d] + db[a-1][b-1] - db[a-1][d] - db[c][b-1];
        cout << s << "\n"; 
    }
}
