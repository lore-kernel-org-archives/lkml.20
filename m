Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172411;
	b=gIDugV5kMixtjVl9xDkiavKSq36aAyBQurYR4SEbFbWoTkDVh0BDXqvJl/tIJ2pwPUYO
	 RrI1qtl9La0xowSf/4k5+tVUui8pNPftedw3HRh/uZ0sDOp7096OXQ3Pel27TCyAlAm0J
	 R1qzwVYy0f18A8KRkavKJpH/yk9GAqFf6PPshYoAIiteXAafJsyNdtIYfNsQjoxCiv8bg
	 Kw7v9hHWarNc2GEC/gqYlr4zwk3KVriolxBJW5pT9YTgPfkr0EdQw7IxHdiMlCmLPuKIj
	 LQHC6OXSf58vqxO6KZLeE4MA5MxCSC/5VxGdWyxk9cPkxA1BlujlVNsNatqd/Ek9rrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
	b=CzTS0aLoQxcyn8BX0CrO4uvmz/Hsj/0xFMNIXMXIMgK8LnoAvdKVGOk/NIyks4vnvaqM
	 xDMG35/5AFb0nodkDjQluwkIiORf29PIyPolOflFvnKaVD3beUR5106AKMGQRJgLiTiUX
	 Y5sanE/Q6CS1FDHlh0+zIMqQC+Sav0YSwjY3cD5CZlu/afa2tRvDZlzTp67l0xB+Q2ZNV
	 xaFKkkz6NdvZc1BHNYKc3yZO/NKp9xZiuOdebhAgtdEwuOnxAMba0rGLA5ekprpm5pWQ7
	 QgRfbOpIpIAEq3ItAhKpNfAvN7TTrDXyDzTHm4HtZmnVwz7wZVRADLrKJjAlcx0H7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTxc01Xt;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D028E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTxc01Xt
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso97298866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172409; x=1793777209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=KTxc01XtexAWBJr6OrZOfuAvgMg+gEOwA5+7/Mcz13J4YoEvTeIaMOw/5roWGCi8Q5
         k5OtJRjb+W2CttkG8CkChCJRu/be7C/QHocZuXAaqRlPK3aS9eDvJKeduDIjBA38AyQy
         0E3FSb/4LbLMrt/2Wxs5rRhxnk5Rs5d2tVoh//HfpgxjVocdlCO6V72KvO1NMTXx7Uxv
         3YntGDWu1wdpttTfCC2iE6MUKKi0cDZnyu94mB5WMo1DiPp6n/d3q8GBPDnd3LpdP6J+
         Gos8dm3b/5EDRffG5o4oUWqYfPPCwK6n0+y4t1X5zSFn0gDSMmWSgJSyyYmrt48Nt9L6
         vTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172409; x=1793777209;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=iddgr8MFiNu95WNkUVy1HthtIeWCMoOoaaLHHwKqc6RUuBg4ztZNv9sa1DvTkez2o0
         s4bgiBqy0/0n4357pDCdUUSmcvC82x21WRu64ALrAURPIVJRPSVrM/9iHTEuW1+s5pbR
         EfJGCm2okOrMt7XcnIGJini7BaP/0G20rKBGPmAnSmNhNRPR+TMkX62swVTVLvTrdt8I
         lKYx3cYCYIYXQp+mBr9WjfGK8TcNVt/MuvxLGQJAbZsSO89tvNB9WWJHkRb7YBouNzyD
         aLCFb5ufRVEHFLOXnp+jnSLfuZFAeWVkZ4Q68HKNF7Bic6nu1G3KAPY1RADmKThXhtBP
         xOfw==
X-Forwarded-Encrypted: i=1; AKwUvBx9HUfnF5nJOYXCkPgfT8gqBMTatOYTsKBwwPA2rVoEdhYtEuu6cfk89nkfn8eQBhxxsM/fHaOYaaKhMWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhTVa/G2EyV7yHayd5z8xwmZMXKECwzw1z6NJirwwCgybkU3U3
	7vpJJhikHu26cOLIkKVljMIwfSkZU/QUDamX9VI+sePNNghvlcQcaNfO
X-Gm-Gg: AYBFou12rcuc4bAOghr1pDvmXSX5I1alBe0v9Q8zFrcjcrWwo8bXWNTcwZvftCeNAKJ
	xfEQOv0dkRSWLhrrSAhN09bYd/TCt4Ny6pVuOsOGdUPh+G5kYhvkV30NGoJ7r6xc92qOyef1dHK
	e3rLFqMV0ns2YIWOH6OSQFA6mWfbiTaMkPGO8PcdtIHiI9FJiJKXyN12Ikapq7dpw0CSAcPWEOd
	Ome7bFhcerEnTgXMKvv+4c0BY1r3pyc5O/wx6lGSZaC/6yPsx6/pNNkTcedvjzkJCAPfoirqgE6
	LIFkq74Wr8K7VjLrxDpQBmIGOuGqiultK8eeGQUXgV3/irlpS2xmUflzzB1hiZeKY0QZ1p31loj
	3lMFSCE9Z7Jwfvgky/01MkGLbcu+l4nkQFOaBrwmE6pUGTJYjQ43agJoQzJew1P5HjUtveeGIZD
	oJnqGY7q/3UikAvp1RwQvYZ8Rpj3ToPZsWhIemcJRFWmqknamqjy+ZjSD7QagV5HLy1gl1fWZaK
	Yu/IVZOoGUv17h4RwN/Y++JDv9qEmfl5fn2B8ykbwuxPNBazYo16a6q0WNNCE8fQwI6d1lXaU/+
	LYOg1EKkwv3vQr31gjdqUN0b7tPtBcKhN0Hc
X-Received: by 2002:a17:907:3f11:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c49bdf2b6ddmr121255066b.9.1793172409029;
        Wed, 28 Oct 2026 00:26:49 -0700 (PDT)
Received: from RuiTian-14.guest.local ([2a09:bac5:303b:28c::41:144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd795bf8sm564019566b.70.2026.10.28.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:26:48 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Wed, 28 Oct 2026 08:26:43 +0100
Message-ID: <20261028072643.32250-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Changes in v4:
- Replaced spelling problem.
- In your cited discussion [1](https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/), I still would like to keep ':翻译:' line.
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
index 000000000000..5f2bc7b41f29
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
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多智能功能
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

