Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078762;
	b=ZCi49c0IiVwxEV/aqVF8Xy5e9vwh3j20TyTYvm9dXS6bsB7+8A55OIgb3w/MeQeXz42k
	 3uUa3O6XZ9MTdPODCfJbuBkd44ZAcY9DEgRMnfapCnMWqOgqfV4JWvE4O86togod2BVX7
	 YBt7pd1LAyPihPxUpRZUxPMprGUPhj794q5USp5jX6btHEPqbRyaN8CdJiyvPsZr8SP1S
	 rc6PTD3bHQFh6GourQdYSm525dxbbgg2gkbAbuaM4cgb7Mn35hFTQe8ty7rl5itYrpF0b
	 HWmJBG1Msy6ipyEz2L1bYQtXZJDboIT00NRtibYnA3lO5PnRyfT71Pue0dVW2b9X+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V3MhTwMZ6Q2SenAScnAgXH8rYKIfU3CHRZax1o7/L+E=;
	b=IHE4BINwsuAg4ZFh2qkd2Vrq6LFIaN2aqOJPL8pLt/bZKjbRk1FS6VNAMt8ZHJtjsVHI
	 nmVaCYCwmS72j5LzKWX18Rbc5fok+hHG8pBqQ++f2eBplXztXZ3zrlh3bR8wtFoTCZGpc
	 RfwrAKk5NzxsPpQtkmBplW+iLOkW4upeBKb8PMaL5x7ouZVnITWsGdwufIEEQdFo3DjoP
	 6AzTfbmczTxi0ekvN/DEbbo+5E9iVJs1KnxRR4xqBjvL9caEZHR2nOA9D7nhbWuZkT2SS
	 PzNy6txssyT5YChhQLNKQxRnbl0ImOh3QNoByrUwQ2jsnjWKrAz+GXjj2UwAsqF+8iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YwK0xbVg;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE42606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE42606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YwK0xbVg
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea94541adbso11905915ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078761; x=1793683561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3MhTwMZ6Q2SenAScnAgXH8rYKIfU3CHRZax1o7/L+E=;
        b=YwK0xbVgVGoc1KouW0ErgcJgF/kS4NGBKPQCHdvOe5ZTiU+mWTo/Glw6soeVpTeP46
         of+watNb0nSDtu6XF1jl2CwOmU1K7dw3vaQOapVOKOo23kxAH4ZYKx5gbxn3EWf95XSl
         QAlTbEwfDjwpOlG23axmJq+q6bmtwpNEXhJtgsg+WNGY4yCvwiKyScXeY1n3rsuXRqYk
         BQwKZND3vY+vcHU5YqM8r6pEfQE3rgibAlN5M8iWUEKvTC9T9Q+LihUDS/pBK630xoMI
         VFQTRrBv3y20zGCUA81DSJC06ddEcfuVkHw4nLxkwBOZMXIsJ9um6tpmGhD5yt3bA2b7
         kL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078761; x=1793683561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3MhTwMZ6Q2SenAScnAgXH8rYKIfU3CHRZax1o7/L+E=;
        b=jXoDWUTWW+EXLUmH70ADK1Z4nP58fehINEWG/JdKOwx86asyYt/8LfPkKY9y7JoqVy
         bSPB7TaBhDVs4JaDPbDynWsEQtPzSYRV1YK41eJqsWl11zPsZQr7Mzaa4yFBerio1YWH
         fCaEg3J5qxWehkm350a2TUPKc6LNbutZ+bOXJcJ4suYVyGZwSaMJ7nfYxmIpia29pAI2
         FyrQ3WKZ/oUXMzXv+8CK6uGlWa2/11xH03RnpUE9gnOiK7bTcbpI1fmlVNkX4b66QqR8
         V1eYXDdH/R2QIJ0keIU6E456rMfB3HC+2i1e5CFC0/zZdnDWItznj5Deh1h6411GP4Dd
         gRSw==
X-Forwarded-Encrypted: i=1; AKwUvBxCeIVMNvvY2vCZWfsyqQ2tHSVWpJcrt+5Q0FLwzq/jUxXfeDbgRRdG+DFUKedqCNvNB53vQgHfhdDFoYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4p3/e5lj+pX8brmOnKyLLzHQyHmIgv7WgebmJDfb7jOOubUpY
	qmdDiEMC2+3fdOE4AAz0Z9u99tIdOikTUdwGD4tff44ri6jJlhGDabO3
X-Gm-Gg: AYBFou2NilcAxk+o6U8qqsqstb7rUpOcSSNe+5CtcABeN2VkjrAt9J19MA7oeGYGxQc
	+g+9+cbsyBc+1EgpXEeMT6PdZpb9z6hiCHbn+t01XTOKJpOYYKtMrlkdsS3oIr2HBdOu3vkvjDa
	XQMmloVckqSNUyHyWpJSgIu1fquom7bJL1yjNNziL/hvg1unuU0syp62g2pECADiar17zesMBEo
	g0j8g19wdiqlWZxe2Cl7szcrioRji62aXGczPHEFFRCjX9nZgV8nYNWZze4dNw9swSpEfQ1AAj5
	SfeVRzOSygHu5Citi9Rh7nVoTmA+2N8bZTYg/g08+LzY2AbkFTX3UJHR8r6+UIlvWhiszboJ0Q1
	8vj0bBZoEPxXCMYHRLKRguIgD6ew0w89LAoD3DrYv0jlHn0rVMHHJV7/xzWmFcGYLopVAecZ7AZ
	uOuHy24OBWwcRnbv7gEvbGp2i8e+7VtCaRsMteaX6UiHH3J+4qbs0KfveRXX79bGiQLyaevg3s8
	lMwolmnvqG79XBVru/vCh64A9H/wEiCdNMWMRR64p0WZ5nZ2hXVrn8KnS65oUHZI9dJR9SPtA==
X-Received: by 2002:a17:902:ce0d:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea9c7f6e25mr73027335ad.23.1793078760839;
        Mon, 26 Oct 2026 22:26:00 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:00 -0700 (PDT)
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
Subject: [PATCH v5 02/23] rust: create basic untrusted data API
Date: Tue, 27 Oct 2026 15:25:15 +1000
Message-ID: <20261027052536.1722081-3-alistair.francis@wdc.com>
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

From: Benno Lossin <benno.lossin@proton.me>

When the kernel receives external data (e.g. from userspace), it usually
is a very bad idea to directly use the data for logic decision in the
kernel. For this reason, such data should be explicitly marked and
validated before making decision based on its value.

The `Untrusted<T>` wrapper type marks a value of type `T` as untrusted.
The particular meaning of "untrusted" highly depends on the type `T`.
For example `T = u8` ensures that the value of the byte cannot be
retrieved. However, `T = [u8]` still allows to access the length of the
slice. Similarly, `T = KVec<U>` allows modifications.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-3-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/lib.rs      |   1 +
 rust/kernel/validate.rs | 192 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 rust/kernel/validate.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557a..a3c54971e9dea 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -147,6 +147,7 @@
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
+pub mod validate;
 pub mod workqueue;
 pub mod xarray;
 
diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
new file mode 100644
index 0000000000000..3c1fe37624573
--- /dev/null
+++ b/rust/kernel/validate.rs
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Untrusted data API.
+//!
+//! # Overview
+//!
+//! Untrusted data is marked using the [`Untrusted<T>`] type. See [Rationale](#rationale) for the
+//! reasons to mark untrusted data throughout the kernel. It is a totally opaque wrapper, it is not
+//! possible to read the data inside.
+//!
+//! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
+//! direct copying of untrusted user data back into userspace without validation.
+//!
+//! # Rationale
+//!
+//! When reading data from an untrusted source, it must be validated before it can be used for
+//! **logic**. For example, this is a very bad idea:
+//!
+//! ```
+//! # fn read_bytes_from_network() -> KBox<[u8]> {
+//! #     Box::new([1, 0], kernel::alloc::flags::GFP_KERNEL).unwrap()
+//! # }
+//! let bytes: KBox<[u8]> = read_bytes_from_network();
+//! let data_index = bytes[0];
+//! let data = bytes[usize::from(data_index)];
+//! ```
+//!
+//! While this will not lead to a memory violation (because the array index checks the bounds), it
+//! might result in a kernel panic. For this reason, all untrusted data must be wrapped in
+//! [`Untrusted<T>`]. This type only allows validating the data or passing it along, since copying
+//! data from userspace back into userspace is allowed for untrusted data.
+
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::{
+        from_mut,
+        from_ref, //
+    },
+    slice, //
+};
+
+use crate::alloc::{
+    Allocator,
+    Vec, //
+};
+
+/// Untrusted data of type `T`.
+///
+/// Data coming from userspace is considered untrusted and should be marked by this type.
+///
+/// The particular meaning of [`Untrusted<T>`] depends heavily on the type `T`. For example,
+/// `&Untrusted<[u8]>` is a reference to an untrusted slice. But the length is not considered
+/// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
+/// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
+/// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
+/// totally opaque.
+///
+/// # Usage in API Design
+///
+/// The exact location where to put [`Untrusted`] depends on the kind of API. When asking for an
+/// untrusted input value, or buffer to write to, always move the [`Untrusted`] wrapper as far
+/// inwards as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_from_userspace(buf: &mut [Untrusted<u8>]) { todo!() }
+///
+/// // and not this
+/// pub fn read_from_userspace(buf: &mut Untrusted<[u8]>) { todo!() }
+/// ```
+///
+/// The reason for this is that `&mut Untrusted<[u8]>` can be converted into `&mut [Untrusted<u8>]`
+/// very easily, but the converse is not possible.
+///
+/// For the same reason, when returning untrusted data by-value, one should move the [`Untrusted`]
+/// wrapper as far outward as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_all_from_userspace() -> Untrusted<KVec<u8>> { todo!() }
+///
+/// // and not this
+/// pub fn read_all_from_userspace() -> KVec<Untrusted<u8>> { todo!() }
+/// ```
+///
+/// Here too the reason is that `KVec<Untrusted<u8>>` is more restrictive compared to
+/// `Untrusted<KVec<u8>>`.
+#[repr(transparent)]
+pub struct Untrusted<T: ?Sized>(T);
+
+impl<T> From<T> for Untrusted<T> {
+    #[inline]
+    fn from(value: T) -> Self {
+        Self(value)
+    }
+}
+
+impl<T: ?Sized> Untrusted<T> {
+    /// Marks the given value as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::validate::Untrusted;
+    ///
+    /// # mod bindings { pub(crate) unsafe fn read_foo_info() -> [u8; 4] { todo!() } };
+    /// fn read_foo_info() -> Untrusted<[u8; 4]> {
+    ///     // SAFETY: just an FFI call without preconditions.
+    ///     Untrusted::new(unsafe { bindings::read_foo_info() })
+    /// }
+    /// ```
+    #[inline]
+    pub fn new(value: T) -> Self
+    where
+        T: Sized,
+    {
+        Self::from(value)
+    }
+}
+
+impl<T> Untrusted<T> {
+    /// Marks the data behind the given reference as untrusted.
+    ///
+    /// Unlike [`Untrusted::new`], this does not require moving the value.
+    #[inline]
+    pub const fn from_ref(value: &T) -> &Self {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`. The cast
+        // does not introduce interior mutability, as `Untrusted<T>`
+        // has interior mutability if and only if `T` has.
+        unsafe { &*from_ref(value).cast::<Self>() }
+    }
+
+    /// Marks the data behind the given mutable reference as untrusted.
+    ///
+    /// Unlike [`Untrusted::new`], this does not require moving the value.
+    #[inline]
+    pub const fn from_mut(value: &mut T) -> &mut Self {
+        // SAFETY: Same reasoning as `from_ref()`.
+        unsafe { &mut *from_mut(value).cast::<Self>() }
+    }
+
+    /// Marks the given slice of data as untrusted.
+    #[inline]
+    pub const fn from_slice(value: &[T]) -> &[Self] {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`. The cast
+        // does not introduce interior mutability either, as `Untrusted<T>`
+        // has interior mutability if and only if `T` has.
+        unsafe { slice::from_raw_parts(value.as_ptr().cast::<Self>(), value.len()) }
+    }
+
+    /// Marks the given mutable slice of data as untrusted.
+    #[inline]
+    pub const fn from_mut_slice(value: &mut [T]) -> &mut [Self] {
+        // SAFETY: Same reasoning as `from_slice()`.
+        unsafe { slice::from_raw_parts_mut(value.as_mut_ptr().cast::<Self>(), value.len()) }
+    }
+}
+
+impl<T> Deref for Untrusted<[T]> {
+    type Target = [Untrusted<T>];
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        Untrusted::from_slice(&self.0)
+    }
+}
+
+impl<T> DerefMut for Untrusted<[T]> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        Untrusted::from_mut_slice(&mut self.0)
+    }
+}
+
+impl<T, A: Allocator> Deref for Untrusted<Vec<T, A>> {
+    type Target = [Untrusted<T>];
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        Untrusted::from_slice(self.0.as_slice())
+    }
+}
+
+impl<T, A: Allocator> DerefMut for Untrusted<Vec<T, A>> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        Untrusted::from_mut_slice(self.0.as_mut_slice())
+    }
+}
-- 
2.56.0

