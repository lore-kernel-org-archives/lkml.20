Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F0443AA3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731075; cv=none; b=X8yqjAdJUsaXa0784x+I/Lge5xNWP5y2wFkE89+TLX+63Axj55NJlOCxO4gmNKN0xDauobSG/esiNnfUhd6LG4Jpx8En6EwpUWgSAdY14Q+181Whkuamf/Z5mk+1X/SuyGQizVab0EjOJ8pwaZhmanAxMo89bS0E6L8ZgBT0C7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731075; c=relaxed/simple;
	bh=D5oJblw1Mk2D0oXCU0ZAWnjEkCSIw80thnwcJYQpFIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rmOgOv9l8pTZVWAvWw9vTKBr3mgNJFHaQg0S95ty9FNNbz6hnJUXsoI7RM0M44KA+N9jlJbr8/caXy74SUi6kpcc3PEnFFVB1XaLy9COD/IUlXVi+PBt7aE9uP//gmv6aZhaSESolnRu2UJQv5EdKnGNWRL91r8+3zZ23iBFrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCcDefz1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCcDefz1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c29c6a3930bso143070566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731072; x=1792335872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=FCcDefz1j0nhXLi1HkLsKO+YTf+XomH5UerjENYsEiRgkylRxAE15oIG0cwSBCO4NZ
         PRCAMVm5HIGp72IBZOKkHHJsHoUeKOmH475icT2X4YB+2kq7JntDRoVAkqjHLx5pdEPF
         +JWWZbSaAwFGcCqW9s9pRcPofaCjl9eRjlCrVhcP+XCUWbfGxs6XsvkVvFgw7fufEehp
         yzeefJjcNP7+Y8hj/GVdOLdGQUjf8HqhBiG2pTnzBf5ull9nEhW4vH4Nf62e2xztq9dC
         vMXQPsUqUZ+W/eARQ0lQ4PRVQrSP1hl7jkOY8NkbASbXpgx5OkaH9/9naeSvFLQi27C8
         nsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731072; x=1792335872;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=ejdzh01Igy+7i0IkNAfG3Qm1dvNYo7GxcmPLcxkZPObJVtrHdEblo9aSxbxiWPW84/
         DN12kjc3nj63GYl7s2SAibBa8VKlU8Lg6RfJrZujJyjQGxk2CRzEDAiyQ4C83U6JF6FL
         Yy9SkuPHA94aog7KbriSVXvCNI2YrRBrcWfh6LHr621Mg9P0TDbLspndEvVwEksoxPOx
         KKh7heoLKRCoztbfj7nxSLBSKNpec6ba4sVsnEjNiACmDn0L2aqva8BCoN+lpiIY7mub
         c/5rDU1XYtF/quzGwCI7RTfcjfofmrqAlMqI91gh5uR+SaevUrw6UgGqE7MpAKonUkjV
         Xarw==
X-Forwarded-Encrypted: i=1; AKwUvBwTcq6uAzm7L6m1j+b8ieNKpBb8jd6B2uFpn8O3guduHB41ZfsiquKNx49B1yaBwTM03fgru3PtDrw/Jak=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDreqlphpHKIG69mfnIPNGi//68qDtWCWQ8iPf22UKCAp9mVKY
	b9LkVgzPZwB2XyRFhnFNkhGoxHp7GS+hCrCuVIRH2GXvufCX7rrBEXwC
X-Gm-Gg: AYBFou1oVdoEdSCBWYdBS2b8rjz9ZYnc6J6EDauFT0DIah0rGp2aiEdG1MFZQwYfNsT
	kQrHcJ99ANg9GIwdaXueuphqP/9lYsK6JQlGTRBu8Dc/PwXEXmTkEqN9oh5l127nUeq0qQJ4Qde
	JuhRAtNuhzFuHQhykVpYlCgfoe1GUaqEtpkoedfjqeKxrTmSWO/d0EFuS6jKNt4LaFUy7JzpRfh
	IeiZsIqGpfDChkqwWfkgX43q9d3Sb9j49D9sh/A/MLzfp6boHTQ6Vb/xNerh0LZBc7LPxDVA5nQ
	+z6P6IIYNSNjSo5z5MyfKdF5bf7NTfBVq1ZgDhHtZw964183b8TLDEoIjr6ddAam3fjSIjZoepG
	ZoiQ1Gzw8AP6mjuPZc0m8Ob6Y2VFeZ7oOxYIvUIuhq5cugHDbt49grDJCuvgnyTdvvfyT+sH4Ch
	mwZ5DxX1Y+me0XjlKMxsHTyE6mllTH7yal58E5YfFd8fFYnOY6CZ27H66S9EdQYg==
X-Received: by 2002:a17:907:7296:b0:c2e:4f16:fbf with SMTP id a640c23a62f3a-c31a9f8af14mr724308066b.31.1791731072224;
        Sun, 11 Oct 2026 08:04:32 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac5:303d:28c::41:134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c346637b997sm62035566b.30.2026.10.11.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:04:31 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wy@wyuan.org
Subject: [PATCH RESEND v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Sun, 11 Oct 2026 17:03:08 +0200
Message-ID: <20261011150310.51673-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jiaming Ouyang <jiamingouyang13@gmail.com>

Translate Documentation/usb/ohci.rst into Chinese Simplified.

The translation covers OHCI driver overview, hardware protocol
differences (OHCI vs UHCI), improvements since 2.4 kernel,
queueable interrupt transfers, and non-PCI support.

Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
---

Changes in v3:
- Correct the docs list in index.rst
---

Sending this resend because last send is broken.
---
 .../translations/zh_CN/usb/index.rst          |  2 +-
 Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst

diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index df99814c6497..c96eacf13e11 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -32,6 +32,7 @@ USB 支持
     chipidea
     dwc3
     ehci
+    ohci
     usbmon
 
 待翻译文档：
@@ -49,7 +50,6 @@ USB 支持
 * mass-storage
 * misc_usbsevseg
 * mtouchusb
-* ohci
 * raw-gadget
 * usbip_protocol
 * usb-serial
diff --git a/Documentation/translations/zh_CN/usb/ohci.rst b/Documentation/translations/zh_CN/usb/ohci.rst
new file mode 100644
index 000000000000..5e36831bf370
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/ohci.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/usb/ohci.rst
+
+:翻译: 欧阳家铭 Jiaming Ouyang <jiamingouyang13@gmail.com>
+
+========
+OHCI驱动
+========
+
+2002年8月23日
+
+“OHCI-HCD”驱动程序是一个USB主机控制器程序（HCD），它源自2.4内核系列中的“usb-ohci”
+驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber <weissg@vienna.at>编写但也获
+得了来自David Brownell <dbrownell@users.sourceforge.net>，Linus Torvalds
+和Gregory P. Smith的支持。
+
+它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能
+注入到硬件中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
+
+自2.4内核以来的更改包括
+
+         - 提高了健壮性; 修复了错误; 减少了开销
+         - 支持更新和简化的usbcore API
+         - 中断传输可以更大，并且可以排队
+         - 通过使用上层“hcd”框架，减少代码量
+         - 支持一些非PCI的OHCI实现
+         - ... 以及更多
+
+“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”
+中也是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢
+失的风险。当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要
+处理，来最大限度的降低这些风险。
+
+- David Brownell
+  <dbrownell@users.sourceforge.net>
+
-- 
2.53.0

