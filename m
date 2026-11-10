Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284463;
	b=kdzimqfV5WcaeGLylve3ppsQ9DrhjOMOmOdI7pdiQCild9vrZI7ne28vPaxH/QkUgjJ7
	 5Jr+UJcehv+UZRt8yu2MxbAYqQgnz8m1Tb31Dbsy0CKosu/PdJSYTtwjfVw2Cm0ig4p3z
	 XNKq7aOzuVOiV4vlpAAL6zmMJKws3N6FXDevAmibklzWVkRzOuHdHlgGp8pdRwGLLg1m7
	 BoYQ7LveOF3ozix7utV2CrVeFFJG9DHrlF2V0dGYxMgLDmU3+WK24u8D/wT0aUFxEDQ4I
	 z+N6Oi+xvuI4bGUqaOvQajfswAgPtCLjE6APo5IpU2iB/LavYR75mz4+RuidOJe9uCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
	b=GkgbnwsB9gm7Cny+IRAPZ4pOxriTfs/KbInxgm37Gi+FCWQo5Cj/zFO0rfSBKZnqilW9
	 M71OZgqphRRjLlz1oYFk2cq204yLHzYxN30WaelKtfgGLWT42ne1eEFX24PAlTt6Yzn5f
	 tZFQ+wfszbDsac5fWaoI4GvbGAdjigWnoJ3mFQOAbMJANi2yZnQKseHEGKvSBKq2xbecv
	 j5Kh3NSO+ESoAQP6M0OwnD+X+KEXouluqLQnqGMXNke6ygsvq+fw5K77UVM8kNzlb3onK
	 pjWz4/prAXhTmJNJEuDWiDuNGyfjsmB6/HmNdmRRehUUerdvyklqDU4IvrMszUpFcQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBBRbkGU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D659C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBBRbkGU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2462301c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284462; x=1794889262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=lBBRbkGUOdW39g7/KHjzlpnPJ6GtmuwJmyhcwaeYU9cYtJ1U4OdM/6wro7fwsNM4dn
         NIDrMoph7FdUIlhIVgwtVg+QNcoB/mq7nkS9Y7XPzhfPs8rdwMh6UwahvluHZJhIG/T3
         dpoj4AwGkYNgCu/slIxtdwWHNXw4a+ZZqxjCIE9hwbu8/56Pmwv+UqIgdlxP5Bxh5H2b
         3HXC4N47LYS1xRXzmdGKj71m3/FSrUrnehSwiDNTDwzTfLM5tnCfiwOWw7gJ+1s79QCY
         zZOEjMO6w6Li+KkewbiY+YUs//7gkTNcS/p5NEKunvqSqMjtTWytwmVYgZ/dnkmGY1aF
         B9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284462; x=1794889262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=uPlhCv/D1DYFRXfIldrODi3RUpxN5NK67htgsy7hMN3n3cmBiTk+yIDY8UF0LZUzlW
         yhREE0r3JTw9NrNuqHoDYCSnrSaPrzFTFQfxGMrMZqFBvrRbPomkMFTqvh3b/EiWrtR3
         61jYlsK9k3eHCF0hwEGZ0jEuvscnw/XzBuIitzGRcJ1W8KGlj7i7rgRwmNpx+oTw6Wln
         phgw+4it7otOU46nXvfpvYSNi8BdYwDQNmMnfunxTLrZVDd7LEr3uj4bB26UVxGd0G9H
         YcRTvsJYm+Tvsa+ZiAOAxfFSEPjBGATPr8hOX4yBlis0SAdPG19nIIPnswVJlhWS3b0m
         GYkQ==
X-Forwarded-Encrypted: i=1; AL+hErGRylIAoU8GzlpjLi1fP8ZyaABXpVChmLan6o7iQZMmYS8UjCE43WB5rtIeKKYmmrqdnF+8E/pVu4kcokw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bo6gTowVJDYf1jwT2xY7ezSho5IfPFkoe38pMqerGqynKSFDB
	BmJU5uTgYCu2vOQjkBcK2Vc/tnzMciO8fNPDsycZfQ3xtamUuakL9JWx
X-Gm-Gg: AYBFou2ovH2fNXk6cYsfw/K5dz38hbdA7o1yYzRK1SZXAWfHJg+qETjO74wa4WbvbNA
	vs/EBSofHuwieJWvF+8Us8syKCJSfp70KgBn50gvjgq27WGAc96ZeJLLldrhs3RSmdWNte2z3rh
	l5nllIjv9y6aTB5o7ZiqOZB/6XxuHbQIGuWmNw4MrIm/0bx5hC5o6aGDUs03zRYod1gH+fbDi8/
	gT6b3Qe5nn6l2LMHfK2t93T3GHt23z4llZ3Yk1biYwXuC+o66BOiMBujXDlVs1LYnmDUrDW05DZ
	0+d/eB+cbDPQtpnnhSc73yaGmPua3hGCd8qPvdppbDJqj8m/x4rlPI3OOuzWxOgRNo6ybY9XG/h
	u+gYdRp9gzlaDuOP1SDGioX8IvH5FRXyn7K0uojXTCRdD63+Zk1Q1l544zvE46EcNykDqg1TIbu
	KYt8xYPs0MSDkKiWI7bCCn0Ipa1ecksjrO4kref/ww5Hr45bX8H1gsDQ3eZToB8hVmYe8umq+G0
	UBz3etFWhADUq+oKdxIPI3SyJkKPc1EWxs/k8b/zPdlfDym1qWxjvB9iPdraHs6AkDUV6o0Jha+
	QFK5XFhBXa8arUy8N75z+/RW6DcVRz4PBUUifXSCL8S21u4=
X-Received: by 2002:a05:7022:f8a:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b3b60039e7mr2636172c88.10.1794284461889;
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
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
Subject: [PATCH v6 16/25] rust: kernel: Add crypto hash bindings
Date: Tue, 10 Nov 2026 14:18:23 +1000
Message-ID: <20261110041832.1730924-17-alistair.francis@wdc.com>
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

Initial support for the kernel crypto hash bindings, which will be used
by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/Kconfig         |   1 +
 rust/kernel/hash.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   2 +
 3 files changed, 144 insertions(+)
 create mode 100644 rust/kernel/hash.rs

diff --git a/lib/Kconfig b/lib/Kconfig
index daf219282f441..7b1952c5d5c18 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -593,6 +593,7 @@ config RSPDM
 	depends on RUST
 	select KEYS
 	select CRYPTO
+	select CRYPTO_HASH2
 	select ASYMMETRIC_KEY_TYPE
 	select ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select X509_CERTIFICATE_PARSER
diff --git a/rust/kernel/hash.rs b/rust/kernel/hash.rs
new file mode 100644
index 0000000000000..84b3c79a2895f
--- /dev/null
+++ b/rust/kernel/hash.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel crypto hash APIs.
+//!
+//! C headers: [`include/crypto/hash.h`](srctree/include/crypto/hash.h).
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/crypto/devel-algos.html#hashing-hash>
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
+    str::CStr,
+};
+
+/// Synchronous hash transformation plus its descriptor buffer.
+pub struct Shash {
+    shash: NonNull<bindings::crypto_shash>,
+    desc: NonNull<bindings::shash_desc>,
+    desc_len: usize,
+    desc_capacity: usize,
+    hash_len: usize,
+    name: &'static CStr,
+}
+
+impl Shash {
+    /// Allocates a hash transformation and its descriptor buffer.
+    pub fn new(name: &'static CStr) -> Result<Self> {
+        // SAFETY: `name.as_char_ptr()` is a valid NUL-terminated C string.
+        // `crypto_alloc_shash()` returns a valid pointer or an ERR_PTR.
+        let shash =
+            from_err_ptr(unsafe { bindings::crypto_alloc_shash(name.as_char_ptr(), 0, 0) })?;
+        let shash = NonNull::new(shash).ok_or(ENOMEM)?;
+
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let desc_size = unsafe { bindings::crypto_shash_descsize(shash.as_ptr()) } as usize;
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let hash_len = unsafe { bindings::crypto_shash_digestsize(shash.as_ptr()) } as usize;
+        let desc_len = core::mem::size_of::<bindings::shash_desc>() + desc_size;
+
+        let desc_vec = match KVec::from_elem(0u8, desc_len, GFP_KERNEL) {
+            Ok(desc_vec) => desc_vec,
+            Err(e) => {
+                // SAFETY: `shash` was allocated above and must be freed if the
+                // descriptor allocation fails.
+                unsafe {
+                    bindings::crypto_free_shash(shash.as_ptr());
+                }
+                return Err(e.into());
+            }
+        };
+
+        let (desc_buf, _desc_len, desc_capacity) = desc_vec.into_raw_parts();
+
+        debug_assert_eq!(
+            desc_buf.addr() % core::mem::align_of::<bindings::shash_desc>(),
+            0,
+            "kmalloc alignment insufficient for shash_desc"
+        );
+        let desc = NonNull::new(desc_buf.cast::<bindings::shash_desc>()).ok_or(ENOMEM)?;
+
+        // SAFETY: `desc` points to an allocation of `desc_len` bytes, which is
+        // exactly large enough for a `shash_desc` header and its trailing
+        // algorithm state. No explicit init is needed as
+        // `crypto_shash_digest()` re-initialises the descriptor on each call.
+        unsafe {
+            (*desc.as_ptr()).tfm = shash.as_ptr();
+        }
+
+        Ok(Self {
+            shash,
+            desc,
+            desc_len,
+            desc_capacity,
+            hash_len,
+            name,
+        })
+    }
+
+    /// Return the name of the hash
+    #[inline]
+    pub fn name(&self) -> &'static CStr {
+        self.name
+    }
+
+    /// Return the length of the hash output (in bytes)
+    #[inline]
+    pub fn hash_len(&self) -> usize {
+        self.hash_len
+    }
+
+    /// Computes a one-shot digest into `out`, which must be exactly the digest
+    /// size of the selected hash algorithm.
+    #[inline]
+    pub fn digest(&mut self, data: &[u8], out: &mut [u8]) -> Result {
+        if out.len() != self.hash_len {
+            return Err(EINVAL);
+        }
+
+        let data_len = u32::try_from(data.len()).map_err(|_| EINVAL)?;
+
+        // SAFETY: `self.desc` was created by `Shash::new()` and points to a
+        // valid `shash_desc` with a valid `tfm`. `out` is checked above to be
+        // exactly `crypto_shash_digestsize()` bytes.
+        unsafe {
+            to_result(bindings::crypto_shash_digest(
+                self.desc.as_ptr(),
+                data.as_ptr(),
+                data_len,
+                out.as_mut_ptr(),
+            ))
+        }
+    }
+}
+
+impl Drop for Shash {
+    fn drop(&mut self) {
+        // SAFETY: `self.desc` was produced from a `KVec<u8>` allocation by
+        // `into_raw_parts()` in `Shash::new()`, and `desc_len` and
+        // `desc_capacity` are the exact values handed out at that time.
+        let desc_vec = unsafe {
+            KVec::<u8>::from_raw_parts(
+                self.desc.as_ptr().cast::<u8>(),
+                self.desc_len,
+                self.desc_capacity,
+            )
+        };
+        drop(desc_vec);
+
+        // SAFETY: `self.shash` is a valid handle created by `crypto_alloc_shash()`.
+        unsafe {
+            bindings::crypto_free_shash(self.shash.as_ptr());
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a3c54971e9dea..0cf6eab448d08 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -82,6 +82,8 @@
 pub mod fwctl;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
+#[cfg(CONFIG_CRYPTO_HASH2 = "y")]
+pub mod hash;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.56.0

