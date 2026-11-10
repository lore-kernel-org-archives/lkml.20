Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284514;
	b=PcknoPRM7orlxPSz96f/O11d4BTWyf+iNHLgC7MejjvUXB537PUN2yfuoyNQ/cPvNtpZ
	 pSwz+fLmpE9Vy1TIrde7Vx+fNV4GOLg9/hezqfO8FM/lou2SZ3Ijc2WbfiQ2NttsqI7kt
	 oWsk8XUlnG3vo0YUvDpu092al+7KKoZhrPUtXGgJwohQg2i4WK9hI8N01JojOHzulkTq3
	 uoPyhRVaEoyHKpsIM9xr5QhZdjZ23vO+tkp3FCO9k8172EI6G4lP23QSM/bMnY0h/zTjx
	 HUjVM9FhzN+0RJ8mkpYS6pFEpKqDwA+YFK9NTn/EeGY1bmRwZbiuqISmH+HLi6BSCqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1UrPtzuZOU8w+NOzsFrYP3iAkuGefx7LxxeJF/PgmNU=;
	b=4XVsAClWuNq4zuW0mL5GxCFe/lP9tho/wnNeRbBVWnLrVpfw2KTftLJLEiQ1CR1gTmjO
	 HpgH6uQq/E59C4EdfF1cxv5LOFWCqIt/fVYe6FTlefgmS0CkaLMeDC1Xd8g8EeSqiE5EX
	 qWx6SyIesVUKXijFYOLR8tpUIs+f1G5NS910q//QorjM5MUCQTjRS01lzGM1fTJ2ucgbq
	 rH6hPXN7XzZVcUk+QNbf1eWZNb/GVIaetbE3nTyFYapD0rledL3gKBVh5ez/3zluvYevp
	 8RXdqnIyj0RpkLNN05kYkmG+ZMDolpNMLjWg2pyTRvYgxPv+tQzy6mwn2gEq1useZPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IY8cwLTA;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDA60A261E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADDA60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IY8cwLTA
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944abeso695612c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284512; x=1794889312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UrPtzuZOU8w+NOzsFrYP3iAkuGefx7LxxeJF/PgmNU=;
        b=IY8cwLTA/ajLi6TVtJ4Pu5m5CZTq57Pdd1+rp2M+yhgNceS7HolUdis1g0r3h9YGx9
         +T7bBQJgStKbgOHbMxw5uBEbnY91ZAXWC1xus9cOoSJwnJZWJmaZq1BiF/sfdxCeb/qu
         gKcePPbpt0RPdVDgQQq4A4LlHXdBRfE8EFEUhP/sRzczsHKL0M7yNrmu2WSs0qyjqh+3
         jHSi2YqEA60+dqbajJswde5OBtJY3NMhQ56ucqZqiWsWV7Ur1/3Wc2s7dTf9keIyrXKD
         xl1wDFw2wyAFhzUEfwuA9QJkzMKVan/W/NlTcz4tjBjjkXa22hSHngboVdhVuAelOF4X
         7etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284512; x=1794889312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UrPtzuZOU8w+NOzsFrYP3iAkuGefx7LxxeJF/PgmNU=;
        b=WTlh9qNSBo6V4qzysZKsOANHjYtfVHuLqUfT/qCWaZPoRZ2UKB8a48q7LkAyB6xSfS
         dFtAH0FfidACJ8SV/tRMGiO9iiHa4N6r8majR6W6QwfMVc6747bdkz1FmDWxLikXTynR
         LkZ6y9X01IqgtwClfJDly0g+7kswQjPzIrSIIKNSNkEwgHCI3PQQXzrSlBs9D4CkJQ6w
         TkOBQc9gDxDOJ9iNJ52FGSM35OnLZKRBejHNbTmgE7qFwuF9RdvLIfp/gcLkZdeXamt6
         fjXd4a7HkeN8ySkqslYPmZRqJbSGNzKXAf9PCn35TNWbY8k22NT0fma565maMzq2v2G4
         MV7w==
X-Forwarded-Encrypted: i=1; AL+hErFZAVhsUnFGd9txhNmdMk/pjBr/Xr55K1ITGXMaljniQZsb8BoBeswwdGFLSLzvs6mhwm761DNT0LZTzpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9utRFkguZusWM0CpNHVnIlKFdP1wh+olbTSwn6EtTS6cC9aJkH
	CwG+wmoQtrfS1rhiAvdjazbKj1l/w4rhi80q4mnWz/GRsL3+3T638LNY
X-Gm-Gg: AYBFou3MdGjCCkTaIpPyh3OHJlrp3RcHRL+RLvIXCWylu90qAhEFmz43CZ/OrL8SJF4
	3K73R4Ormf6aLtniv4EGIiTzpfwohW7+L1+oLo0rEmUAlxgFpn6JJdLpFTUY03u9rQrxnTbG6VC
	XJPcuY8gG+67uTUvXiri9UFR2rrsUAbJ/Da3Hsbbo0CEhPEGGBxeubc/V4uVI+MTJxsoinhH180
	tL9U8yGkL0ijonflj0kzfKE6OA6iccqHke6oYxTq6uy/FhJmyZ/S4gcfyzq3y4rywcNgVLw8NG1
	AkjWNAv9WuOTGK5zj36c5GAoW69iS/Ci9uCgBvpER9Zqvf+zI0XzNp944pRjLoE0OlTLcZBap56
	fNzcT/918SdnYc9WmG6iIXV7xXmOryAaMevnyl1noXKLp/NfuYfVatNdir+b4NL8gayHQ3vZfTF
	4sFKF1r3fkrrNEupIrs96WYPpsnnl6/comgR0XqtzdEopbgu1HqOqZMRHvkHurAmuhNV2P8jzGm
	9Ah0+U7H28CbNaWFJ5qTthGidlO8UlmqcK1OPhLCFnoFJ14fFtn1r02d2oiSjV/lWclToB3X/BC
	+yJE2OJ3Fy3b6QSBJM6fkEhGIwk3dAo7DzCcVHahqaiA5+Y=
X-Received: by 2002:a05:7022:5f06:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b3b605ff4amr1715031c88.8.1794284512191;
        Mon, 09 Nov 2026 20:21:52 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:51 -0800 (PST)
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
Subject: [PATCH v6 22/25] rust: x509: Add X509 certificate bindings
Date: Tue, 10 Nov 2026 14:18:29 +1000
Message-ID: <20261110041832.1730924-23-alistair.francis@wdc.com>
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

Initial support for the kernel x509 parser bindings,
which will be used by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/x509.rs             | 236 ++++++++++++++++++++++++++++++++
 3 files changed, 240 insertions(+)
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
index 8ad9e61d1a6fb..19a5cb7bec0af 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -153,6 +153,8 @@
 pub mod usb;
 pub mod validate;
 pub mod workqueue;
+#[cfg(CONFIG_X509_CERTIFICATE_PARSER = "y")]
+pub mod x509;
 pub mod xarray;
 
 #[doc(hidden)]
diff --git a/rust/kernel/x509.rs b/rust/kernel/x509.rs
new file mode 100644
index 0000000000000..56369ef520cd1
--- /dev/null
+++ b/rust/kernel/x509.rs
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel X509 parser APIs.
+//!
+//! C headers: [`include/keys/x509-parser.h`](srctree/include/keys/x509-parser.h).
+
+use core::marker::PhantomData;
+use core::ptr::{
+    self,
+    NonNull, //
+};
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
+pub struct Certificate<'a> {
+    cert: NonNull<bindings::x509_certificate>,
+    _data: PhantomData<&'a [u8]>,
+}
+
+/// Key extension flags of the certificate's public key (`key_eflags`
+/// bits), as defined for `struct public_key` in
+/// [`include/crypto/public_key.h`](srctree/include/crypto/public_key.h).
+#[derive(Clone, Copy, Debug)]
+pub struct KeyExtFlags(usize);
+
+impl KeyExtFlags {
+    /// Whether the CA basic constraint is asserted.
+    pub fn is_ca(self) -> bool {
+        self.0 & (1 << bindings::KEY_EFLAG_CA) != 0
+    }
+
+    /// Whether the keyCertSign key usage is asserted.
+    pub fn key_cert_sign(self) -> bool {
+        self.0 & (1 << bindings::KEY_EFLAG_KEYCERTSIGN) != 0
+    }
+
+    /// Whether the digitalSignature key usage is asserted.
+    pub fn digital_signature(self) -> bool {
+        self.0 & (1 << bindings::KEY_EFLAG_DIGITALSIG) != 0
+    }
+}
+
+impl<'a> Certificate<'a> {
+    /// Parses a DER certificate from `data` and returns it with the length
+    /// of the certificate in bytes.
+    ///
+    /// The returned certificate borrows `data` (`x509_cert_parse()` keeps
+    /// pointers into the DER buffer), so `data` must outlive it.
+    pub fn parse(data: &'a [u8]) -> Result<(Self, usize)> {
+        // SAFETY: `data.as_ptr()` points to at least `data.len()` valid bytes.
+        let len = unsafe { bindings::x509_get_certificate_length(data.as_ptr(), data.len()) };
+        let len = usize::try_from(len).map_err(|_| {
+            pr_err!("Invalid certificate length\n");
+            EPROTO
+        })?;
+
+        if len > data.len() {
+            pr_err!("Certificate length is larger than the buffer\n");
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
+        Ok((
+            Self {
+                cert,
+                _data: PhantomData,
+            },
+            len,
+        ))
+    }
+
+    /// Returns the raw pointer for the X.509 certificate.
+    /// This is what is returned from the C function x509_cert_parse()
+    #[inline]
+    pub fn as_raw(&self) -> *const bindings::x509_certificate {
+        self.cert.as_ptr()
+    }
+
+    /// Raw issuer name of the certificate.
+    #[inline]
+    pub fn raw_issuer(&self) -> &'a [u8] {
+        // SAFETY: `self.cert` is valid per the struct invariants, and the
+        // parser borrows the `raw_issuer` slice from the input buffer, which
+        // outlives `self` for the lifetime `'a`.
+        unsafe {
+            let cert = &*self.cert.as_ptr();
+            if cert.raw_issuer.is_null() {
+                return &[];
+            }
+            core::slice::from_raw_parts(cert.raw_issuer.cast::<u8>(), cert.raw_issuer_size as usize)
+        }
+    }
+
+    /// Raw subject name of the certificate.
+    #[inline]
+    pub fn raw_subject(&self) -> &'a [u8] {
+        // SAFETY: `self.cert` is valid per the struct invariants, and the
+        // parser borrows the `raw_subject` slice from the input buffer, which
+        // outlives `self` for the lifetime `'a`.
+        unsafe {
+            let cert = &*self.cert.as_ptr();
+            if cert.raw_subject.is_null() {
+                return &[];
+            }
+            core::slice::from_raw_parts(
+                cert.raw_subject.cast::<u8>(),
+                cert.raw_subject_size as usize,
+            )
+        }
+    }
+
+    /// Key extension flags of the certificate's public key.
+    #[inline]
+    pub fn key_ext_flags(&self) -> Result<KeyExtFlags> {
+        // SAFETY: `self.cert` is valid per the struct invariants.
+        let pub_key = unsafe { (*self.cert.as_ptr()).pub_ };
+        let pub_key = NonNull::new(pub_key).ok_or(EINVAL)?;
+
+        // SAFETY: `pub_key` is owned by `self.cert` and, as it was just
+        // checked to be non-NULL, valid to read.
+        Ok(KeyExtFlags(unsafe { (*pub_key.as_ptr()).key_eflags }))
+    }
+
+    /// Name of the public key algorithm (e.g. `"rsa"` or `"ecdsa"`).
+    #[inline]
+    pub fn pkey_algo(&self) -> Result<&'static CStr> {
+        // SAFETY: `self.cert` is valid per the struct invariants.
+        let pub_key = unsafe { (*self.cert.as_ptr()).pub_ };
+        let pub_key = NonNull::new(pub_key).ok_or(EINVAL)?;
+
+        // SAFETY: `pub_key` is valid and non-NULL as checked above;
+        // `pkey_algo` points to static kernel algorithm-name strings for
+        // keys created by the X.509 parser.
+        let name = unsafe { (*pub_key.as_ptr()).pkey_algo };
+        let name = NonNull::new(name.cast_mut()).ok_or(EINVAL)?;
+
+        // SAFETY: `name` points to a NUL-terminated C string with static
+        // lifetime, as established by the parser.
+        Ok(unsafe { CStr::from_char_ptr(name.as_ptr()) })
+    }
+
+    /// Length of the raw public key (in bytes). For RSA keys this is the
+    /// modulus length; for ECDSA keys the uncompressed public key encoding.
+    #[inline]
+    pub fn pkey_len(&self) -> Result<usize> {
+        // SAFETY: `self.cert` is valid per the struct invariants.
+        let pub_key = unsafe { (*self.cert.as_ptr()).pub_ };
+        let pub_key = NonNull::new(pub_key).ok_or(EINVAL)?;
+
+        // SAFETY: `pub_key` is valid and non-NULL as checked above.
+        Ok(unsafe { (*pub_key.as_ptr()).keylen } as usize)
+    }
+
+    /// Check that the certificate is not unsupported or blacklisted.
+    #[inline]
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
+    #[inline]
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
+    #[inline]
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
+        // SAFETY: `key` was just extracted from `self.cert`, which no longer
+        // owns it since `pub_` was cleared above, so ownership is transferred
+        // to the `PublicKey` exclusively.
+        Some(unsafe { PublicKey::from_raw(key) })
+    }
+}
+
+impl Drop for Certificate<'_> {
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

