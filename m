Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821994;
	b=pm/m0PfoaOqiYXWm+qyOYtpF6YjspmXuFgvm5glOBPGuXqYDnXrhgakC7dDgfC4Tuy0e
	 yHBj9S0Bv+6Binosr/Fa44hU5ZHjxWdNZyhqmr0A/9Ke4jpGl3PVuyGwIOpktYMIrPD78
	 YymxamGFiDSzo0ShSitHxA+vDw1WGv1HIBC2lLAsVfSQdkqsy+MZN20Dqxpe89tLz9Qz+
	 PIOhylk/Lle1iPHaNLzu28QGEIOJatVgwPBPrS1kbUgck2EUTnIp3W7jvmljbXkLH0ww7
	 DJoE6KZQKSDwJh621BKhwxJSOX/AZvvptElRIg4BUyN+MwntqWCr2Nf8igFzKsNnDQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
	b=COs3txsDOYfFxMkzLdFCOYsqQr3lCDRUiDOzwUPNiH0P4sN9MHo62SUz2L+2+om933XA
	 RFwO4XQOX0j5TUzAlkhCOxF0VBqCXRuPCZ5ofGwNdKXr020w/mbMFtqMqkWWU7rbCRKy7
	 fh5tqa49Bq6gArZBAbgIQSStX1bwPilEadFGifbVBjsxPEimQig4cShCYGPXaGFJjZxD5
	 r+bUHiKr+C3UVhWSUQHij9ZXzkIgfYyV0qWh1rxDwNO/yT7mvmpNue6xogJi+5K5YtxhM
	 6u+xViqYLTXMAId0uv4Xe2S38+C8tlXOxBwfDeLmlBQMIqd21Svey6yq8YJ4CFt9epg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tBHUKu/L";
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2060DBA71
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E2060DBA71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBHUKu/L
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so363451137.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821993; x=1794426793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
        b=tBHUKu/LnasYdYAU1cvEDaQRvA/Z484rVSLtxKLBECgB51adJInJ4xjk7UZDtbOpGl
         GlOOnYgKZaUk9Qsgd8vxNyJ9s9fQqO1B4uEKW70g865fssUla6aZB8Y+T5VE8h/J0BaW
         te2GZrXa5037Np8XziK41bhGVsN2epuONd1tRwHmRujGBU7dSmwjkBJsCGwn4OgCQ8xy
         eAmrkP1eg20lydkOg5bl0AVgqs+LbHWA6IhYhfq+LEzk625Ri1KrYZCCFgIU5DYw+DGT
         FR2TcoDH1eX+30MkzprEYvVsnW3ZY0cZlnFRV6VbBTu/lESmX+yovd82RB8WPWe7Ccv5
         CVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821993; x=1794426793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgMXGwoDfcCa/yJ887xjBK4NIqHOZAB7bCFC/enAXGE=;
        b=Hx1StV4qNRoGtGYx4MPpnxJ56LS+K08UO4CqokR36QAE5M1ARfsvXRKYiG4u0MZlfC
         FUJIW8oXPx35jc8Ui/0G5WtPCC2uWMTZw4Y9WnLY7DL4Si7j2unZNqxHD3++lJsbIr+W
         YcDCE9AzVoFD0H++8khmmhdumQcnZdXdPyz9F/Q/gD0dHLpL5CcVPGOCAlD0t0gjfxzT
         e7VJHg1J8fagkv6HaEo24x/x2gIIm8O/B1GWldGQS0b7Lg3mIyzrsqV6FLBIimrDEQ13
         NmzjMCERKHl1YS4Kvk8pO64zBH17UN2oBcaMsIlVf/Xav2b5k8CBGIPrC28MAxSQUB3h
         QEBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx92byCFTEaC4W4uo/Y7w1Pkfd9wJq1jrfdDH5et2/6EZkIbj8LE3n2YwL02cr8/FqS1skCYGLKcCEfhMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aoTSaTZ2S9BjPBvR3o8WHCRCPIoYMnX6HcgORNrBvtmqURgOB
	2kzCfS82J3Y13hOpMABwZjH4rr3qg9AezSxnd8FV62cSwoe/dS+tbj4=
X-Gm-Gg: AYBFou2fsFZwJooq45wgXij5HXgiMgHVy56FbdjWkOLQ3FQKOKSPDrOoAJvokmKg91Y
	b44Rub055mspqyG6sFdqggYFezGMhAo9RH8nsmWkboxFEkQiBXRSiwUIfbjR6unx9hSVagPdEwK
	lusSbavDVr5QD+qMdd9xdUyHuJ7VKw8g2onqu9lmTIdydm4CBnNp6HEjzoza2Uh397SNEP7JRQj
	9Gci7a2k5kaTEZ7wgl2as7QlBwS6+M4k4gyZj4T0szhUfgVAJmMOfMRbDSTzZMisuuFJCt+aTcC
	UAO17ynLweMHkVwvSGcFuLgxyu0R6CJPwjH9D3Z990c/+dTXafgBUct22vfx4UtSmfgL6ES0XG1
	4rXqIkMGuYNIWIAv7UDDD/934SK4Yoe+/wDAVn8W+eoqB00x1zFmmXCEIgoY3yab3q/AGCS03qZ
	TKBLMfdNN41JM727+2zBe9sRd6TK+wAfEgb74dyOq7unpvTCYSMSDf3Riq2+MH2798PTpCf8W8o
	0U5CX2srGtXQDLvSl8SUAGnyU6guQMn+y2+IJwS6u9oWU1RZqvWNSwesJXaDStApKjIzOpBUvIC
	sqIXzMz0m7dZJ05WREzAgRhOJGS7jEIZ8V4AEgNAUWRumHmdBns7qVYlsRUHfni3qMwdluBsOhJ
	2fTUw
X-Received: by 2002:a05:6102:5126:b0:7c8:3b8c:82ba with SMTP id ada2fe7eead31-7d072719a25mr5768547137.32.1793821993196;
        Wed, 04 Nov 2026 11:53:13 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:12 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
Date: Wed,  4 Nov 2026 16:50:15 -0300
Message-ID: <f5edb8f2f92eff139eeabffe1acbb22354af5137.1793818280.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793818280.git.nico.antinori.7@gmail.com>
References: <cover.1793818280.git.nico.antinori.7@gmail.com>
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

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` as it has had no users since its introduction.

This removal also eliminates a pre-existing lifetime soundness issue:
the input and output reference lifetimes were independent, allowing the
conversion of a temporarily borrowed `device::Device` into `&'static
platform::Device` in safe Rust. Removing the device could leave a
dangling reference.

Fixes: a38dfd60fe53 ("rust: platform: impl TryFrom<&Device> for &platform::Device")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/helpers/helpers.c  |  1 -
 rust/helpers/platform.c |  8 --------
 rust/kernel/platform.rs | 21 ---------------------
 3 files changed, 30 deletions(-)
 delete mode 100644 rust/helpers/platform.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7b..787dd8ff8c6c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -82,7 +82,6 @@
 #include "page.c"
 #include "pci.c"
 #include "pid_namespace.c"
-#include "platform.c"
 #include "poll.c"
 #include "processor.c"
 #include "property.c"
diff --git a/rust/helpers/platform.c b/rust/helpers/platform.c
deleted file mode 100644
index 188b3240f32d..000000000000
--- a/rust/helpers/platform.c
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <linux/platform_device.h>
-
-__rust_helper bool rust_helper_dev_is_platform(const struct device *dev)
-{
-	return dev_is_platform(dev);
-}
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae1bb..f49aedcc94b1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -7,7 +7,6 @@
 use crate::{
     acpi,
     bindings,
-    container_of,
     device::{
         self,
         Bound, //
@@ -557,26 +556,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_platform(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals
-        // `bindings::platform_bus_type`, hence `dev` must be embedded in a valid
-        // `struct platform_device` as guaranteed by the corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::platform_device, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct platform_device`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

