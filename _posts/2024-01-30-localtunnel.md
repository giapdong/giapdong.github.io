---
layout: post
title:  "Tự build ngrok cho thoả đam mê"
date:   2024-01-30 20:40:00 +0700
categories: product
background: '/engineering/background.jpg'
---
Làm lại cả thế giới

# Giới thiệu
Khỏi dài dòng thì trong bài này mình sẽ nói về phần mình đã làm để sử dụng công cụ để có thể giúp mình expose local ra internet và làm nhiều thứ theo ý thích của mình.
Quan trọng hơn là nó phải `cố định`, tức là bạn luôn có 1 đường link cho mọi lần sử dụng công cụ đó! Thú vị không nào? Vậy thì nhào zô nha

# Công cụ
Thành thực mà nói thì mình cũng k hoàn toàn tạo ra 100% công cụ này, mình dựa vào thư viện có sẵn đó là localtunnel và mình tự triển khai và có một chút customize cũng như fix bug để có thể sử dụng mượt nhất. Các bạn có thể xem lại hàng real [trên npm](https://www.npmjs.com/package/localtunnel).

# Dùng nó như thế nào đây chú khủng long con?
À thì nó cũng k khó lắm, bạn [vào đây](https://www.npmjs.com/package/localtunnel) để tải và cài đặt như một package npm **GLOBAL** bình thường. Sau đó thì chúng ta sẽ có 2 usecase

### Expose local port ra internet
Trong trường hợp các bạn sử dụng ứng dụng nodejs và đang chạy local với url dạng: `http://localhost:3000` chẳng hạn rồi mình muốn hứng request từ ngoài internet vào local thì các bạn sẽ dùng command sau:

```

lt \
--port 3000 \
-s mylocal-application-nodejs \
--host https://tunnel.giapdong.xyz \
--session-connection \
--session-timeout 10

```
Và bây giờ thì các bạn có thể gọi api `https://mylocal-application-nodejs.tunnel.giapdong.xyz` thay cho `http://localhost:3000` rồi. Và thế là các bạn có thể dùng nó cho những phần kiểu như gọi webhook từ internet chẳng hạn.

### Expose local domain ra internet
Các bạn code php chắc hẳn đã quen với kiểu mà ở local sẽ có domain dạng: `https://app01.marketplace.beta` mà muốn expose nó ra ngoài internet giống usecase bên trên thì chúng ta cũng sẽ có command tương ứng như sau:

```

lt \
-l app01.marketplace.beta \
-p 443 \
--local-https \
--local-cert <path-to-certificate-file> \
--local-key <path-to-key-file> \
--allow-invalid-cert \
-s domain-public-internet \
--host https://tunnel.giapdong.xyz

```

Như vậy thì các bạn cũng sẽ có một domain public cho nó đấy chính là: `https://domain-public-internet.tunnel.giapdong.xyz`

# Lời kết
Đến đây thì mình cũng cảm ơn các bạn đã sử dụng và trải nghiệm, đây cũng là một ứng dụng nho nhỏ do mình triển khai và public cho cộng đồng sử dụng. Rất mong được sự ủng hộ của các bạn nhé. Nếu có thắc mắc gì thì hãy liên hệ lại với mình nha 😉