# Hướng dẫn tải và mở các app Craft trên Windows

## 1. Chọn app bạn cần

- **PhotoCraft**: chỉnh sửa ảnh, tương tự Photoshop.
- **VectorCraft**: vẽ logo và hình minh họa, tương tự Illustrator.
- **PdfCraft**: đọc và làm việc với PDF, tương tự Acrobat.
- **LightCraft**: quản lý và chỉnh màu ảnh, tương tự Lightroom.
- **FilmCraft**: dựng video, tương tự Premiere Pro.
- **EffectCraft**: làm hoạt hình và hiệu ứng, tương tự After Effects.
- **DesignCraft**: dàn trang sách và tạp chí, tương tự InDesign.

Bạn chỉ cần tải app mình muốn dùng, không cần tải cả 7 app. Các app này là dự án độc lập, không phải phần mềm do Adobe phát hành.

## 2. Cách dễ nhất: tải bản chạy sẵn

### Bước 1: Mở trang tải

Nếu đang xem kho GitHub có hướng dẫn này, tìm mục **Releases** (Các bản phát hành), thường ở bên phải trang chính của kho. Nhấp vào đó nếu kho có bản chạy sẵn.

Nếu kho chỉ chia sẻ mã nguồn hoặc không có mục Releases, dùng các trang phát hành của dự án gốc dưới đây:

- [Tải PhotoCraft](https://github.com/storytold/photocraft/releases/latest)
- [Tải VectorCraft](https://github.com/storytold/vectorcraft/releases/latest)
- [Tải PdfCraft](https://github.com/storytold/pdfcraft/releases/latest)
- [Tải LightCraft](https://github.com/storytold/lightcraft/releases/latest)
- [Tải FilmCraft](https://github.com/storytold/filmcraft/releases/latest)
- [Tải EffectCraft](https://github.com/storytold/effectcraft/releases/latest)
- [Tải DesignCraft](https://github.com/storytold/designcraft/releases/latest)

**Không cần đăng nhập GitHub để tải các tệp công khai này.**

### Bước 2: Chọn đúng tệp

1. Trong trang bản phát hành, tìm mục **Assets**. Nhấp vào tên mục nếu danh sách chưa mở.
2. Với máy Windows dùng chip Intel hoặc AMD 64-bit, chọn tệp có tên kết thúc bằng **windows-x64-portable.zip**.
3. Nhấp vào tên tệp để tải xuống.

Ví dụ: `photocraft-…-windows-x64-portable.zip`. Phần số phiên bản có thể thay đổi.

Nếu chưa biết máy dùng chip gì: mở **Start → Settings → System → About** (Bắt đầu → Cài đặt → Hệ thống → Giới thiệu), xem dòng **System type** (Loại hệ thống). Hướng dẫn này dùng cho máy có thông tin **64-bit** và **x64-based processor**. Máy Windows dùng chip ARM cần chọn bản ARM64; máy Mac cần bản macOS.

**Đừng chọn “Source code (zip)” hoặc “Source code (tar.gz)”.** Đây là mã nguồn dành cho việc phát triển phần mềm, chưa phải app để nhấp đúp chạy.

### Bước 3: Giải nén

1. Đợi tải xong.
2. Nhấn **Windows + E** để mở cửa sổ quản lý tệp.
3. Chọn **Downloads** (Tải xuống) ở bên trái. Nếu khi tải bạn chọn nơi khác, mở nơi đó.
4. Tìm tệp ZIP vừa tải.
5. Nhấp chuột phải vào tệp, chọn **Extract All…** (Giải nén tất cả).
6. Giữ thư mục được đề xuất hoặc chọn một nơi bạn dễ tìm, rồi nhấn **Extract** (Giải nén).

### Bước 4: Mở app

1. Mở thư mục vừa giải nén.
2. Nếu bên trong có thêm một thư mục cùng tên, mở tiếp thư mục đó.
3. Nhấp đúp vào tệp tên app, chẳng hạn **photocraft.exe** hoặc **pdfcraft.exe**.
4. Đợi cửa sổ ứng dụng xuất hiện.

Nếu Windows ẩn phần đuôi tệp, bạn có thể chỉ thấy tên **photocraft** hoặc **pdfcraft**, kèm loại tệp **Application** (Ứng dụng).

Đừng chọn tệp có chữ **-cli**, ví dụ `photocraft-cli.exe`: đó là công cụ dùng bằng lệnh.

**Xong!** Bản portable chỉ cần giải nén rồi mở, không cần cài Rust hay công cụ lập trình. Giữ nguyên các tệp đi kèm trong thư mục đã giải nén.

## 3. Nếu bạn đã bấm “Code → Download ZIP” trên GitHub

Nút này tải mã nguồn của kho. Nếu giải nén ra chỉ thấy các thư mục như `apps`, `crates`, hoặc tệp `Cargo.toml`, bạn đang có mã nguồn và chưa có bản chạy sẵn.

Hãy quay lại **phần 2** và tải tệp **windows-x64-portable.zip** từ Releases. Không cần thực hiện các lệnh `cargo` trong tài liệu dành cho lập trình viên.

Nếu bạn nhận được một bộ đã đóng gói sẵn, có cả thư mục **installed**, **Launchers** và tệp **run-craft.ps1**:

1. Giải nén toàn bộ bộ đó.
2. Mở thư mục **Launchers**.
3. Nhấp đúp vào tệp mang tên app muốn dùng, ví dụ **photocraft.cmd**.
4. Muốn mở cả 7 app, nhấp đúp **Open-Craft-Apps.cmd** ở thư mục ngoài.

Cách mở bằng Launchers chỉ dùng khi bộ tải xuống có đầy đủ các tệp trên. Bạn có thể đặt cả bộ ở bất kỳ thư mục nào; không cần tạo đường dẫn giống máy người chia sẻ. Giữ nguyên cấu trúc thư mục, không kéo riêng các tệp `.cmd` ra ngoài.

## 4. Mở và lưu tài liệu của bạn

1. Mở app phù hợp.
2. Chọn **File → Open** (Tệp → Mở), hoặc nhấn **Ctrl + O**.
3. Chọn tệp muốn mở, rồi nhấn **Open**.
4. Khi lưu bản chỉnh sửa, chọn **File → Save As** (Lưu thành) nếu có và đặt tên mới để giữ lại bản gốc.
5. Muốn tạo ảnh, PDF hoặc video thành phẩm, tìm mục **Export** (Xuất).

Nên mở từng app một khi mới làm quen.

## 5. Tạo biểu tượng mở nhanh trên màn hình

Với app đã giải nén:

1. Nhấp chuột phải vào tệp ứng dụng `.exe` không có chữ `-cli`.
2. Trên Windows 11, chọn **Show more options** (Hiển thị thêm tùy chọn) nếu cần.
3. Chọn **Send to → Desktop (create shortcut)** (Gửi đến → Màn hình nền — tạo lối tắt).
4. Lần sau, nhấp đúp vào biểu tượng mới trên màn hình để mở app.

Hãy tạo lối tắt sau khi đã đặt thư mục app ở nơi muốn giữ lâu dài. Nếu chuyển thư mục đi nơi khác, bạn cần tạo lại lối tắt.

## 6. Các lỗi thường gặp

- **Không thấy tệp ứng dụng:** có thể bạn tải nhầm mã nguồn. Xem phần 3.
- **App không mở hoặc báo thiếu tệp:** giải nén toàn bộ ZIP trước; không chạy ngay trong ZIP và không chép riêng một tệp `.exe` ra ngoài.
- **Cửa sổ đen hiện lên rồi tắt:** kiểm tra bạn có mở nhầm tệp có chữ `-cli` không. Nếu mở bằng Launchers, thử mở trực tiếp tệp ứng dụng trong thư mục `installed`.
- **Máy chạy chậm:** đóng bớt app, chỉ giữ app đang dùng.
- **Không tìm thấy app sau khi tải:** kiểm tra thư mục Downloads hoặc danh sách tải xuống của trình duyệt bằng **Ctrl + J**.
- **Vẫn gặp lỗi:** chụp lại thông báo lỗi và gửi người hỗ trợ, kèm tên app và loại Windows đang dùng.
