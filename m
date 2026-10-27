Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078769;
	b=Wap7zuGUeZdQ7c47/Q+kAB3UvDIE4nT4CZw1JsQbTo0uzsU7DeQ5yzBIvYgPC5rSTa3d
	 verAHK2QM0yE1/gY69AopbKUaynhnOGncR2uJPnwwzzZrdv0Xnzf+XtQMBvmNVc0mIfi1
	 zFhFTbWwu3d37J1579fmaBfT/lkwKRzrgHm0jN1O41YtaFh0HZ/yirnHrIZL61N8Y1GhB
	 xLRQIM+fbhnIUnusDVi6PSKJHiCktlZ7aLRZcE9+T49Y9N5qmaGZLD/RpJsHgSmE+knKb
	 +i08JU4vDFEowCQVxYShHj8ofG0cy4xpv5iqo29Ac973oMwbkXXEbiWszSHIDrJSIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
	b=CFkEAQ7aAZAAZnYiBYlPmUXhlonUzmsDTkqAK6PdUhSicb+TnMfgVZb10bABVK72x43p
	 rpVb+MKU/u8U7fwjwecF1nwaIFa4h7CU80wkUPw6iuz01jQ21CzeausoQI/RX59RByasz
	 VzJZjI7XN7Pk2+OVVmLo6dIeczS7bQe41u8zUtLQwZvKZHkpnFMlnCwEZrXfOfv4iYGvI
	 uWH4aLn1Ikvft9cRqkecqDEB49kUu2QHpoQc87agIRIjpbZuBlLr5K8EBTcXp1FFMzrX8
	 hI4Iw85LmJ5OdbuRvLqAdNsZ3Gxg9fV1EObaW9lTYY13FlsaJ46PUi5ITm8n4h5KKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="H/C1bj0T";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE685606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE685606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H/C1bj0T
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2366907a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078768; x=1793683568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
        b=H/C1bj0TDgjnC8GPypZRFILRml3B0fcwWkwh9HJFodsXetyf3QYY7hYT7aE3UAA7iH
         NpcUsHkwq5tIVfMeIWX8EyD97R+Y+2kdS8/H5ts2Nwni9FaM6t13N4vF5Q71VrQpe1TU
         RruVcKusMiOprAucGuOBbsLxXRA6UJNTTshPovKcdv6mSCJoaBL6wCYNDCK+8M+kBlo6
         OonCx4f10IXEP6oGydwdokS8NzrgyfXV4vAxG4qI/wF4YvmKv4S+kG6LTXDrETA8GoaA
         MiM4ZcKwxKhp3X8Ctc87Gh1q0gpk7+Qq392DuUEY1JGu+t9IRwGBfearOgXFpZ9WW2BC
         qJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078768; x=1793683568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTYRu2Y1roqXLFBUgarJRm+ifHHaPTOIT3dhmjarsSs=;
        b=X0ERJdfhFzj64NB6lXp7SgEEHcpJ/K1aciwjPEOq55gCiUPzEtIpQ3XzHb9iapBk6H
         YaQPv9rBZYYynNHzMJMCjEirFTH+ZelcS06351f2OFUJ6yAzEfGcOo7S6+fVArMp1aTt
         SQVULmEvkS6x8wBwZhk0Radlo4MbqDUAXSQMAKEzj2jhtnQa+SMrqzZyYG+oIl/MoKZU
         5oaFTW0ewE971XFmBn5mDG5yH+cU7mzeYpnUzZHdv+qlCWGTcaxb3IEVPrnDq+VNpsW3
         lV+btyM+skGi8Nev8V4DM4JTjF7orNhTnLrr8wxzozuka4yyWidsIqLzIUb/ehMByMtk
         AAHQ==
X-Forwarded-Encrypted: i=1; AKwUvByMoKt8QA4dAW0pRvD2AZJ553FGX2bRwlFJ0fEmaZ8e548HMnuR5hIdTkrim5cqUkQJyebnYKcsD2GXQvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnahYMZsgNfnufv6JyL9ZF8eM6s2AZRsbD16yzV/ONFPHDfSAG
	m9hB+LXTG6wzrWgid04AYxeUSEOVDXaYCu2L6rHZyW1OFv9f4Stq+lAI
X-Gm-Gg: AYBFou3XvzwIgoW6d3KDDisWEB8xq95gK6EyoBOsFdBKawdkkc4Wd62O2ZvsljFQybi
	71n84jT+H4dAPf40vXAdeXBVFWjsJVlo02OEnmHcBBEwavM+SL2NYmmkdxntHWahSBg33tEwJmX
	ZqB/FTTGE9HS9yRhC2X/Tz2tM4ZYungfO3UA8fKdxgpgL7KNpTne2FohhO7K9dhe7EhDubCyJDh
	A1wCObYR3RW2i3Y+ELBfOGzLzt90ri2O+Wn/KikTNIPeu+DbFXg3u26XtuEmzbCZkm+mun+bea/
	hgVZXXgoK8cUh+VdklUYH1Hv0rqIIsI1L/+5sz7B6OYSm/CQhQfrReBKuan4SasGwpIuKalmtOD
	ORonrfZOPWafbPj3+47TAdcRIub/V3i6O7kvnXUpxWpU/J5NOn0tGxyYiu3A7lemIatbqQs0XAO
	VCqB8YipzhFX+8bVVPVDSMqDrehJP4BcnqrMbrKQx8t43T0516PXTWfX22pZHu9KELwwqevtX67
	IhAsmQizttDZXa4cNNNLypreE6jhfjBHAIZCDfNv5b5A/2u3eDeYjR7JgxNaXUcWwNrIjn8mA==
X-Received: by 2002:a17:90b:1407:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3adeb4c27b0mr4785981a91.23.1793078768021;
        Mon, 26 Oct 2026 22:26:08 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:07 -0700 (PDT)
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
Subject: [PATCH v5 03/23] rust: validate: add `Validate` trait
Date: Tue, 27 Oct 2026 15:25:16 +1000
Message-ID: <20261027052536.1722081-4-alistair.francis@wdc.com>
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

Introduce the `Validate<Input>` trait and functions to validate
`Untrusted<T>` using said trait. This allows one to access the inner
value of `Untrusted<T>` via `validate{,_ref,_mut}` functions which
subsequently delegate the validation to user-implemented `Validate`
trait.

The `Validate` trait is the only entry point for validation code, making
it easy to spot where data is being validated.

The reason for restricting the types that can be inputs to
`Validate::validate` is to be able to have the `validate...` functions
on `Untrusted`. This is also the reason for the suggestions in the
`Usage in API Design` section in the commit that introduced
`Untrusted<T>`.

The `Validate::validate()` function allows additional context to be
passed, which can be used as part of the validation process. For example
comparing data against already negotiated information.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-4-lossin@kernel.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/validate.rs | 85 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
index 3c1fe37624573..3d1c4107fa8fe 100644
--- a/rust/kernel/validate.rs
+++ b/rust/kernel/validate.rs
@@ -11,6 +11,9 @@
 //! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
 //! direct copying of untrusted user data back into userspace without validation.
 //!
+//! The only way to access untrusted data is to [`Validate::validate`] it. This is facilitated by
+//! the [`Validate`] trait.
+//!
 //! # Rationale
 //!
 //! When reading data from an untrusted source, it must be validated before it can be used for
@@ -56,7 +59,7 @@
 /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
 /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
 /// derefs to `[Untrusted<T>]`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
-/// totally opaque.
+/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
 ///
 /// # Usage in API Design
 ///
@@ -119,6 +122,42 @@ pub fn new(value: T) -> Self
     {
         Self::from(value)
     }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate<'c, Context, V: Validate<'c, Self, Context>>(
+        self,
+        context: Context,
+    ) -> Result<V, V::Err>
+    where
+        T: Sized,
+    {
+        V::validate(self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_ref<'a, 'c, Context, V: Validate<'c, &'a Self, Context>>(
+        &'a self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&self.0, context)
+    }
+
+    /// Validate the underlying untrusted data.
+    ///
+    /// See the [`Validate`] trait for more information.
+    #[inline]
+    pub fn validate_mut<'a, 'c, Context, V: Validate<'c, &'a mut Self, Context>>(
+        &'a mut self,
+        context: Context,
+    ) -> Result<V, V::Err> {
+        V::validate(&mut self.0, context)
+    }
 }
 
 impl<T> Untrusted<T> {
@@ -190,3 +229,47 @@ fn deref_mut(&mut self) -> &mut Self::Target {
         Untrusted::from_mut_slice(self.0.as_mut_slice())
     }
 }
+
+/// Marks valid input for the [`Validate`] trait.
+pub trait ValidateInput: private::Sealed {
+    /// Type of the inner data.
+    type Inner: ?Sized;
+}
+
+impl<T: ?Sized> ValidateInput for Untrusted<T> {
+    type Inner = T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a Untrusted<T> {
+    type Inner = &'a T;
+}
+
+impl<'a, T: ?Sized> ValidateInput for &'a mut Untrusted<T> {
+    type Inner = &'a mut T;
+}
+
+mod private {
+    use super::Untrusted;
+
+    pub trait Sealed {}
+
+    impl<T: ?Sized> Sealed for Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a Untrusted<T> {}
+    impl<'a, T: ?Sized> Sealed for &'a mut Untrusted<T> {}
+}
+
+/// Validate [`Untrusted`] data.
+///
+/// Care must be taken when implementing this trait, as unprotected access to unvalidated data is
+/// given to the [`Validate::validate`] function. The implementer must ensure that the data is only
+/// used for logic after successful validation.
+pub trait Validate<'c, Input: ValidateInput, Context>: Sized {
+    /// Validation error.
+    type Err;
+
+    /// Validate the raw input.
+    ///
+    /// `Context` is additional context needed for validation. The `'c` lifetime is the lifetime of
+    /// the borrowed context (`&'c Foo`).
+    fn validate(raw: Input::Inner, context: Context) -> Result<Self, Self::Err>;
+}
-- 
2.56.0

