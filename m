Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284394;
	b=ybkEv7IUotOQrsQh5+0g0qljsGbfsH0OV2LvUfBeopgKh0mgXb3ef2Rl7QQhXdZbYCC1
	 iqy8j4I2BdBTCAJYSf1Ud3nNiVkTKaLzvaycmp41DI4QOO67ftKPLKb0nAplJhGdxAFaV
	 UZ0c7Iiq14g22KyNVZhAqyxeC2NDLOMDhpyKDlUSd5GmEh6XJK2mzkYXPvZdpG9YS2pJO
	 vHV34ZDC3jGhCq7jKH8CEy1grxVM54zxehFYa8KTFHGERH/falP3T07/PL6cNaGxe7HdC
	 oyYDpgZD4oGO1qQAgVVj73pOItQNsn00ZVjLX6FvSF8/rX7oqWeQ9L9aqKhmjRgblXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
	b=iTFgBmwVrCRqCiYFyW0Xh6Zf8GXkEooq1CIxBe69DrThLicFZnHjgscKJ4R9V3k7+gXQ
	 pm6ok+BzB/CkjZlKeq68csbEIjNQgMf1GnRKYVszzJzOaxrJPAnN87UJzrEomxZycpa6M
	 hVHbG/WkLd4Au91imqU2qlUzrxLauHnSyZ0KjsMETTp59MYlfGz0mGpEpl5gbqR4dVXW8
	 EAeY/BeYysTA9K+ixJybMK0X2DmmA5R0HmImBO9OU6pLrtQstyG8ofpwfe6IDlil+jPGE
	 QL69XCQkk9n+iEoeEinP4CK2mmRPY08TXlaRMiZxDQFHxUvZ62R5CIxQe8XkcnuoIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAdLG6I0;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA160A2638
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CA160A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAdLG6I0
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3720addb068so2720677eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284393; x=1794889193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=bAdLG6I0SEmoBfqYyUKe4jfQKmj4cvRp+anU2Oj5X0c+tjnjU59+VA8jKT18ZQe/my
         1NrBxCtLGndpR7JX52vRaLI/OHEVVmEBDmojm8MthHWn6SR3kGWvFZ44fCtuACa0sgDA
         6QsIpWMMPsrPsXtwmzjWeN0K+kXepme8doarva6YuCZtrU7O/N/BXDGI/28Ae798vZYV
         slUmkSL+oM/WLaktRkrd/0TFjbDoJYl+8vuyHhX766Ljbk6SztVXDT96+gpuH6/Iu9Kc
         c/h49WO/AxN8dbZftCq5H5N5bEBhro/po5jMkc72OtKLfwrKmrsGz/n11bnhfJiQSS7M
         XeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284393; x=1794889193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=pJAKlkaF1CnpogVEVYjIimKnL4g+cpzHlTwQSD40I5LRJLZdUkaXwy/8JiwoKRZlNP
         dHEMTmw9AID517YeP9ONrvKRJHPm6Qo6HRrwFWwwQaLX4g7hHMTMGIG+8imvEDFzyI92
         Tm1FOXpzJZ/Xrcevd+S+oaY84/sYSTsHXnBgF/T7PIo8cYLZBiShh0zZjI7upuHb0tsI
         eFF7Yp09LT0uAaI9gE8ENvcXGDOo1bxLA1D07U95xGvZNm1wbbkc1eQblg+7Y7ewfXIl
         lAEcppiM11Hp4r3zuuAhB1/uvcNNwef3jww2BPB4ZqA7FebQlcDtKh1/VrG/2JW9U8yC
         4OQw==
X-Forwarded-Encrypted: i=1; AL+hErFhTl5ti5PCpjWoY30nj1FObMrN+9M29b1FN4ni0FFIlid/NIP1Ui2WKyLw9mHytXvYXA4qtKnNFoR8LZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DvbwivhAKlHemDTdVo5tMwVDL6x/EbwHTh34fXFLhq9wnfxa9
	hE44PzYSsQnjBssmXs5BroBxqo/61PKs4kFjCpM4n1REXQSZRWfDhBNj
X-Gm-Gg: AYBFou1RSxU0UTrug1HyyUxqX0G2xL0N3xfDXsIoFPh0DJbbOqCpUpNEVGz/L0c+8VX
	fqYpUXGiB79gLTWi0UDEQoA6gDC1LspJcm9uSVRlel+Crrkug69M4ygmnRgce5TzBVbLX0rhzLE
	B75V2IFQJ3w6I7B7x1fbkFUv9CEg07JYnLyG0ERLPela42AvpufE+ubgsiEQfWwEie9XZCaD230
	lnXhfQXSmmkqmnmc1kH9SETpcpOQ9hALSoE1kJ8IIDaonH1hYR9xjZ5onLIG22d3Uz0RINcAsSw
	b2puAY1XLS2MpsQFewQb0kCFRa8onC+IwJ0ItWNQxX+kB4wvIYlUx4QckSxpr2L+jzXRN5RXyPg
	EbvS+nmtzDiGGwjepJkMqWQg0orqMuc+FWIrZqVhGPwFYOYXifElINzJinMmsEKzrBqd0Kozvjy
	zsEJf63Y7Kgnei6t2SyZAdSYaiRo179MwnDNhCBwoTZteYBhsU8a4gdIjNwD5kfTDMQfqzQ4apm
	jrKIzSAJohFgpTP3Wr/jlZRELBXtu/PjUPq8VBvhAI7Y5jkdVqSQhG0ry5jdkaaGij1/xBT9SmD
	sGs9OxzwFgUcrh4kjUoZw6EKElgkHZZH6xQ+qwr1Osj53vg=
X-Received: by 2002:a05:701b:2807:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3b61860eemr1668909c88.47.1794284393237;
        Mon, 09 Nov 2026 20:19:53 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:52 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 08/25] rust: device: Expose Device as_raw() publicly
Date: Tue, 10 Nov 2026 14:18:15 +1000
Message-ID: <20261110041832.1730924-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

We are going to call the as_raw() function later as part of the SPDM
library, so expose it publicly.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/device.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..be89e9023b09f 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -262,7 +262,8 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
 
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
-    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
-- 
2.56.0

