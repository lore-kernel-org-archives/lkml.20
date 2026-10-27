Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078912;
	b=mUAY72dz14agRzg7h/jny2UFOUe5nG3tfyLc8LHmvnZBFuWpM3yURqRf+pcHlkt46Sjr
	 h6XVyVBrJycFzv+/08AYYBhihrpo2RoTuz8Bq8C7IwsXHtSNCbp5MGtLaxZy4oTlb980v
	 7v1XMEio6WK+TUKOrO90vd59SLIHrbPL6UpTSK8jt1OXfpbvdyRRyy3rwk9tNgUTyUs8h
	 BmCQMXXN9/iQ4+nbAW29ZWy/BpBQJgX8bUyUZSOt6eODEMTHSqvrK6gpLAbfDui1qoiGb
	 EG7gn6Ju8CXcb9pYpHwFw3d9c41K72PXNC2N4gsRDua9ZBKLADORyZRsiET+KOtDurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
	b=h0CNSL78zqJA0WnvTuOSOW0DboEt3f+/j+JvnL/cGCutGofJIfRzk1JraokXQu6KY3Et
	 UbyWh7/wjtu3iB40LPeuEgPqlzYV3ruDaIKDhgzN58zxMvMifHAgeqkRqnJIojCzzWi9M
	 yogl3itTO/v/zKYmrKTQZ7SDEOJtFnYPo1pLS6lg4bLB/G+23zcbQBqHI+FPBgIreemGi
	 j6iDLKYDCRm1Kdb7vPJvV3C7sfl9/wLNVw3JLBDddM2JjPJEtM/Farts1GhORsvr7R4lM
	 UFu3do0gVPoyQjwqgWV6SAgWEBmSsnDllDQleBDUzfcKbOD0cHXMg2/gtAe9xL8AfRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTmWG1ES;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E86A606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E86A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTmWG1ES
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so32264905ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078911; x=1793683711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
        b=YTmWG1ESwbN0XwH51gxbHiAuUkW+mAIjKpnvoqopHe1qhUg7eW+lbxcGz5XtZKcgkx
         LjZ6d5vGfifkLR8MRVuS5vA/rUcu627XdWcN8RkBDYq5ieXionVQSJScJ8j3c8CUZoGU
         EdkIY6SXnrOXzpf7VqU1dEg+LVQki3PVsHtAUF/CHyTkbzItIdhw/uiU6mKI5dw7CeC0
         uasVCFfjdntyQqjf1CoMkMxNuMUT4d7rU3IRh7vKIWTfxpODHg32T2UiL5iiq8rMqinB
         ViZG1BEZfHodPejx73/d2VK2f34fbW3KrBEd2ZdZ8j4tqyTVhKkUpgDYpexibRKXN8Kb
         XKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078911; x=1793683711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
        b=btUZPJe/yn6u3s8puF+QQzLzM2EBtz6AM/R+DFmo9WZsPcBg9Ztha2QmJONJOBv5ge
         gko+03v3mnuJEXvQhYzDaoGmeVf5z35fDW1p1Jrv6ZGY1IykstkjVCc+2uW3IkdiduoT
         dug0XARglJS7u65t3mbZgmyLWZCE+NMgD+A/Z5/+Cl6yC7H3XkcsOxgpPm44QZ3ANb8X
         uvqemvs2EhM9Rv6yNnoxCIVsQ/ZA+RV495txc68UrdWvn53AtWzdCZINGuvAhm4rSNjE
         aeAnGXsCp7yY/TG6I+QBqo8IruOt2BlCQ4LtIQzQAX0xmItndnIcjYac5uCid49BDoSR
         11mw==
X-Forwarded-Encrypted: i=1; AKwUvBxCDfCPK/XGD0UjKvajlv0vIfGjKXE7RmPw4tturYeX3565JG4FCrANVrWwzz6Si00Q+23Vk9xxANbePfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMlPJ02hsDkXZf0aH4FhS+z9aZc1+q6EXSp5tSUrm0S+LaiI92
	18ogONPD+sv282h5Id7bXsShzh/8BBGszdyrdBuB4Btd0a4ewfaJv71c
X-Gm-Gg: AYBFou1EScYM4ZaX2tNVF5rK+PqwwdxTx+0jhg6k7mgXgRf/j01dUpEaqDhRKZmv4bD
	Q9NXg57jTi8ESK9PU6SLSIkiLHP14OtDrD6uxV6GLtiPrTJyiWsStGvdNvCoKMnoAaegq/+bZLx
	MrxzpHwJ/ZGguItJV7MiP8kxkgFo6bz0Gz/2n0ZB1y7l1NcoTNr1mzOi1KtiMeZ2DHtY1tum+5x
	z+dvFSODaO7bSqBny2P//sT0sY0WFPOqHKdP02w9NinVIH6EGTK9QQ9m5231sIv0y+GcoHRvrvA
	y7Cy6Sv8O5XJncsu6ZGaYDSVf7Fy/0bQpRpIaudXz54vcR7NQnwmPnJlB8qgE2mcfAr60xWMr/V
	Vqoip48lQdsxTIy2t3Lz2fP5RT2A6Vzr3STOpASSJ5sdY4KuRV0HrggIPKlBpUxQH3EkI5Ca1kd
	QeSj1nptt320v3EGXHwT1T382HRUp9DoUl7YeAd+QkrIN9XqARVUyuhyXg0eHNVeIiuxxQuCqh6
	ekPHQjc0ByIgiRaW3cCq1xwvB0Z8Knb1O9JccSC7rARioN/sZUTX4QPt4xbu1APtWvgphaiarqi
	wfjPNQvRNm3tYjObwp8l
X-Received: by 2002:a17:902:ce0d:b0:2e9:7b4f:b994 with SMTP id d9443c01a7336-2ea9c7c8254mr73796515ad.33.1793078911484;
        Mon, 26 Oct 2026 22:28:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:28:30 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 21/23] rust: x509: Add X509 certificate bindings
Date: Tue, 27 Oct 2026 15:25:34 +1000
Message-ID: <20261027052536.1722081-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

Initial support for the kernel x509 parser bindings,
which will be used by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/x509.rs             | 118 ++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 rust/kernel/x509.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index da8855899c530..66e18819d52b0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -39,6 +39,8 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <keys/asymmetric-type.h>
+#include <keys/x509-parser.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e8b652faa3b49..aa95aafff8c49 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -153,6 +153,8 @@
 pub mod usb;
 pub mod validate;
 pub mod workqueue;
+#[cfg(CONFIG_CRYPTO)]
+pub mod x509;
 pub mod xarray;
 
 #[doc(hidden)]
diff --git a/rust/kernel/x509.rs b/rust/kernel/x509.rs
new file mode 100644
index 0000000000000..1b5bc2a99c91c
--- /dev/null
+++ b/rust/kernel/x509.rs
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel X509 parser APIs.
+//!
+//! C headers: [`include/keys/x509-parser.h`](srctree/include/keys/x509-parser.h).
+
+use core::ffi::c_void;
+use core::ptr::{self, NonNull};
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
+    public_key::PublicKey,
+};
+
+/// Owned `struct x509_certificate` wrapper.
+pub struct Certificate {
+    cert: NonNull<bindings::x509_certificate>,
+}
+
+impl Certificate {
+    /// Parses a DER certificate from `data` and returns it with the length
+    /// of the certificate in bytes.
+    pub fn parse(data: &[u8]) -> Result<(Self, usize)> {
+        // SAFETY: `data.as_ptr()` points to at least `data.len()` valid bytes.
+        let len = unsafe { bindings::x509_get_certificate_length(data.as_ptr(), data.len()) };
+        let len = usize::try_from(len).map_err(|_| {
+            pr_err!("Invalid certificate length\n");
+            EPROTO
+        })?;
+
+        if len > data.len() {
+            pr_err!("Certificate length is larger then the buffer\n");
+            return Err(EPROTO);
+        }
+
+        // SAFETY: `data.as_ptr()` points to `data.len()` valid bytes and the
+        // caller has already checked that the DER certificate length fits in
+        // that buffer.
+        let cert = from_err_ptr(unsafe {
+            bindings::x509_cert_parse(data.as_ptr().cast::<c_void>(), len)
+        })?;
+        let cert = NonNull::new(cert).ok_or(EINVAL)?;
+
+        Ok((Self { cert }, len))
+    }
+
+    /// Returns the raw pointer for the X.509 certificate.
+    /// This is what is returned from the C function x509_cert_parse()
+    pub fn raw(&self) -> *mut bindings::x509_certificate {
+        self.cert.as_ptr()
+    }
+
+    /// Check that the certificate is not unsupported or blacklisted.
+    pub fn check_accepted(&self) -> Result {
+        // SAFETY: `self.cert` was returned by `x509_cert_parse()` and remains
+        // valid until dropped.
+        let cert = unsafe { &*self.cert.as_ptr() };
+        if cert.unsupported_sig || cert.blacklisted {
+            pr_err!("Certificate was rejected\n");
+            return Err(EKEYREJECTED);
+        }
+
+        Ok(())
+    }
+
+    /// Verify that `child`'s signature is signed by this cert's public/private key.
+    pub fn verify_signed(&self, child: &Self) -> Result {
+        // SAFETY: both certificate pointers were produced by `x509_cert_parse()`
+        // and remain valid until dropped.
+        let (prev, child) = unsafe { (&*self.cert.as_ptr(), &*child.cert.as_ptr()) };
+
+        let prev_pub = NonNull::new(prev.pub_).ok_or(EINVAL)?;
+        let child_sig = NonNull::new(child.sig).ok_or(EINVAL)?;
+
+        // SAFETY: `prev_pub` and `child_sig` are valid for at least the duration
+        // of this call.
+        unsafe {
+            to_result(bindings::public_key_verify_signature(
+                prev_pub.as_ptr(),
+                child_sig.as_ptr(),
+            ))
+        }
+    }
+
+    /// Transfers the public key out of the certificate so the certificate can be
+    /// dropped without freeing the public key.
+    pub fn take_public_key(&mut self) -> Option<PublicKey> {
+        // SAFETY: `self.cert` is a valid certificate pointer.
+        let raw = unsafe { (*self.cert.as_ptr()).pub_ };
+        let key = NonNull::new(raw)?;
+
+        // SAFETY: `self.cert` is a valid certificate pointer. Clearing `pub_`
+        // transfers ownership of the public key to the returned `PublicKey`.
+        // The `pub_` field will not be freed by `x509_free_certificate()` in
+        // Drop
+        unsafe {
+            (*self.cert.as_ptr()).pub_ = ptr::null_mut();
+        }
+
+        Some(PublicKey::from_raw(key))
+    }
+}
+
+impl Drop for Certificate {
+    fn drop(&mut self) {
+        // SAFETY: `self.cert` was produced by `x509_cert_parse()` and has
+        // not been freed yet.
+        unsafe {
+            bindings::x509_free_certificate(self.cert.as_ptr());
+        }
+    }
+}
-- 
2.56.0

