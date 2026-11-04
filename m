Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821989;
	b=ydkVRVuSTvYe+TtSNbFfK9fZzdORtq8La3EWxVSa/N1lWgTt/7yqzcwRLXN+qrM/rlP/
	 jhRM4fPaMWr0HU/nFe+OxZLishlSJQvfgFbLLO8QiTOcpbvCEThjLvv9GBiWd8ywDdcc9
	 hO87n3tCyocpzh6hWbMIxYsbQxOTlpFiAH8bLmTewxssPnfpdLI/mM2iDScnYt8ErK8Lq
	 ufYPXX2QKf99RQdKSDsWsKnoIZaw2MNKh7fv9iCF+hw6kMW3au6HvgRFK12XKQnYYFi2C
	 9nqSw7rjhl9cVfNNuUcfxjgu3JeafED2xzSKP3TW6zArryp/Dj3j9Iw2o9ArV39vR6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
	b=sGbv4n740b1A3nX6m5OOOjDlj3GrEF7LqBG5mw/SRWcS/mx898o4BhZ+O9DdZiA20RTE
	 Zd7eZzLCTzsBLGM3hgvyMONAZtPpnkepplzwjhAbKkQbeuTepzROxQHRNWvv3+izivOYk
	 YTjVmVa0wzLhNfa9A6XEvMg6xhkRFpqLpcNVlww5676cHlssw08yRyKfQ7eR1glyzvD5n
	 /47cYekVE3fgIomYPtAUGGDqw9u7QW5WOeDcrnigeWxpgh5M4g7DqHCxwDB5maJhNAqqy
	 CjMIiUjYIxCK0B0T9nklI+diudjFHXaGmK+GyHJTkRvau2wiy1avlqRsWy6d6GN5GLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWFct+A+;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF160DAFF9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CF160DAFF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWFct+A+
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso649232137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821987; x=1794426787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
        b=cWFct+A+ENABxpltFW4OvhI2UHyMJ/SPh5Kz3Rmmp8mMhmCIakKCOzrc6AOAn5WOWZ
         dkoCi0ffd785/WBlo+c1R3WXHPjyZeeR0V2sLlmCfnZQuolJtot3WT5Up6UsBWvpJjLi
         QBHV19jOszQDfRXNEPwMMgi6CMFs1uJu/lJ+3Yb1ukXhqKdukk8PBnq7kyJtcyOHyEa7
         +fhRWjjwJOlNHK4jIUejARhd3n+l0i5fboUbqopKescAOkZBSJUAn4IMcVtIZtdEGbJu
         PhMPsly4rP3RzCcSUsO1+wYTjYufB5X4fWRIeWMcoLGJYMuy3gQPOF3l9ykAmT5Ig2tq
         KOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821987; x=1794426787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMjeWv+UkvYo6nLDJ7Blb/ve8ZddA4qwyDrBgZSxLB4=;
        b=e644AuxVlCOkXcvBIn4rZpNwB8A+/rKtFe9JBYQk81mYykkCRHuPOU9btixDHq3XCJ
         AJX7vH58YKi5kUCPlyjhMpFQihqBeAnyEG/qpar+Y/RJxD/2Zd9tjTOkS7lpCm9fVDMG
         CYRDtimEecxAJBurJYe3PSyF9W/C0Sm3wdRQU2Q1sMLavMq2sGEqEUrbfh1oB6jf1jRX
         x0M1vNOh4m+/nO6iwbtGV+EJXKH7+oHhwtO+T9uYquAhcArAzUQQ9avg0fytgMkF5Ay1
         j25WwglW9S7u9eBZnB7FNaZRXEMWT/c1+61aZnR56I79rvnvSneEzEcdhb6QxUXxE/w3
         +dQA==
X-Forwarded-Encrypted: i=1; AKwUvBwJjTkyS/J26EcZvRTwyNGxOxUih96jC2FX00PUjV4of8i8uiIF+iHI1moxfnfqpofDSJHbAzh2oQIR1Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z94mU0jx3YJWDICN0CCbJSXekFE8Oz8vj5Q1QjE4PVWkbJyR/Qp
	iZGamZw3V8S1/ThPMoh7HwGT7r1bS22ELT0VQm2DpMMP+WGLClgKjt0=
X-Gm-Gg: AYBFou3hszfIFILbAPmJX7r0UBg/S7aTAtrISNfmYk/M+Y+6P6IVH+WOQdSQ92Zgeo0
	2qTF4taVks2ozI5ARIFdEZA0YDsSnBFwOj4g96foBonbpPTFLZdFqKWlzig4paHbO5IaoBAUMme
	Bi+/f58Z/E15rTDAFdIOAVQezBau1Jr6sXnCUDbhq/6nX4G4KCvvr0eaLsuU8lw2R9PKKsbkdQt
	vq+rX++Rtn1Ajg5dIth1BHmxLtdYdS9vem7StHXFMnp4fjupZ/ntnnhgwRN0FuKMQ2nBXZPXVCG
	ncQrUsfHTmeLdzw5VBv89/v+LvLb5TwZ0Qtt1ThGEKkn6e3dlMtEYZAANAmWeMUUjhR1nFfKewT
	/4FPY52o/I3+yivsALPLwaWcTcFHYnfjt9hr5QW3FNZst32tWHhUq9Nj06zWLgG7UDuWePcQ760
	6ew4UOJ56dvvaZbKyZyw64ACNpMPRBvHXC+oXbDtsO1KN2aZvezAgX5HJ5khNgFrwrcdG6oDhh+
	TCYpFwgkacKquEWgZfd/5m93bexvIozSbDmE0cjfGx0WkOmKi99qkr7dXoq9VKoqAlQ/efpD8Bo
	wW2UwhHXcKzvK4uXcP4yftb1CiCsqilXdQgEX/ecuWiW8CN0Wm8zgWoCg/0+kcdEZighKlVECnk
	b+3ZL
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr7768916137.1.1793821987289;
        Wed, 04 Nov 2026 11:53:07 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:06 -0800 (PST)
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
Subject: [PATCH v2 1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
Date: Wed,  4 Nov 2026 16:50:14 -0300
Message-ID: <e04f96f1fb2af818d64d2d6061eb6b6ae793b594.1793818280.git.nico.antinori.7@gmail.com>
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
`&Device<Ctx>` since it has no remaining users.

This removal also eliminates a pre-existing lifetime soundness issue:
the input and output reference lifetimes were independent, allowing the
conversion of a temporarily borrowed `device::Device` into `&'static
pci::Device` in safe Rust. Removing the device could leave a dangling
reference.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/helpers/pci.c |  5 -----
 rust/kernel/pci.rs | 21 ---------------------
 2 files changed, 26 deletions(-)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index a8540f90b13c..3822b7f47c57 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -25,11 +25,6 @@ __rust_helper unsigned long rust_helper_pci_resource_flags(const struct pci_dev
 	return pci_resource_flags(pdev, bar);
 }

-__rust_helper bool rust_helper_dev_is_pci(const struct device *dev)
-{
-	return dev_is_pci(dev);
-}
-
 __rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
 {
 	return pci_irq_type(pdev);
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23429..0e9455fd544d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,7 +6,6 @@

 use crate::{
     bindings,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -535,26 +534,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_pci(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals `bindings::pci_bus_type`,
-        // hence `dev` must be embedded in a valid `struct pci_dev` as guaranteed by the
-        // corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::pci_dev, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct pci_dev`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

