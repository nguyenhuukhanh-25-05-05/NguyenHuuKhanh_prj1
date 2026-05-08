@echo off
setlocal

:: Cấu hình thông tin Repository từ ảnh bạn cung cấp
set REPO_URL=https://github.com/nguyenhuukhanh-25-05-05/NguyenHuuKhanh_prj1.git
set COMMIT_MESSAGE="Deploy static website SaleHub"

echo [1/5] Dang kiem tra Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [LOI] Git chua duoc cai dat. Vui long cai dat Git tai https://git-scm.com/
    pause
    exit /b
)

:: Khoi tao git neu chua co
if not exist ".git" (
    echo [2/5] Khoi tao Git Repository...
    git init
    git branch -M main
) else (
    echo [2/5] Git da duoc khoi tao.
)

:: Add remote neu chua co
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [3/5] Dang ket noi voi GitHub...
    git remote add origin %REPO_URL%
) else (
    echo [3/5] Da ket noi voi GitHub.
)

echo [4/5] Dang chuan bi tep tin...
git add .

echo [5/5] Dang commit va day len GitHub...
git commit -m %COMMIT_MESSAGE%
git push -u origin main

echo.
echo ==========================================
echo [THANH CONG] Website cua ban da duoc day len GitHub!
echo Duong dan: https://nguyenhuukhanh-25-05-05.github.io/NguyenHuuKhanh_prj1/
echo (Luu y: Co the mat 1-2 phut de GitHub Pages cap nhat)
echo ==========================================
pause
