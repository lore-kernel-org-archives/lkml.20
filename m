Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50227381B1C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440563; cv=none; b=Hb0VXY7ZJ2UMBGfV5rSYTnWhUwM2UaLkJox29sveHK24ey7JEeiv7gHtBKYEkK3kTyG0hYyOHqwW+bU+9+GP+RqWAsJ2rpBDxIP9O/DLgD4MUhimpy8zwAsqfcEWi+6wJ6+VehefNP62uYVyTmlDEhJEOUyds1UDOopT1rgsrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440563; c=relaxed/simple;
	bh=WrDFYcSEi8mmKbs/PbalUMt2FcpwePnaNlDgkKerblM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ei3/BMJMfMUVBGLjt3P3jL8PAc0kg4SRTvmjmDvN887ACbI1B37PZIjN2ca6rLHWl60aytRtzjXx3S9ere9QeM3P+wEon1jvUdkg/Fg2HM2DrGahdY/dD599Ui+RvMq6MW99opKQ8zdVKtydok9PMeX6klriLUBCES64C9a9JBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLr5B0nE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLr5B0nE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so13067425e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440558; x=1791045358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO7O4QUZWD5NpE5omykRWv4rfNxkme+dmfp6zOtWq0c=;
        b=lLr5B0nErLcvWheRidWJccnjRE1bRc0yfOiNJSBX3lx7wGM77z69S2/D5cq2upZUPY
         sfa9IDGTzKne1A6rL7GgZ3nJEDXlym4Gy0emewzYV/YHx1i8aJ9298c1Qso1fJYJoZ7t
         dE8gZL+r/LTT6s4uHZTg9luAuklBoOnyChCgMYk2j8o2pQJzJtg6sV9ibqXdxbF5G+rf
         hgtyRcftMZMNERT44FoyYAmZRZpVWR7A1EIu1QQ7PtNktQQu+duvNxXLqSAUx6S2eOiw
         NAK+T7puUP3mumVcfUiagRr7wTwMQEA6J7EJAEHIUxK+mBarzOo4eVEKN8VgoyrJfnZl
         o20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440558; x=1791045358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO7O4QUZWD5NpE5omykRWv4rfNxkme+dmfp6zOtWq0c=;
        b=vCVXgL4T8AYGVWE5GprHsPWnFRei162Zzccu6qTCocrIi110e2+Uzb76zSfHDjp3u5
         fc/UGSZrufAnNaQ9+Vjs1+gZCOem9rZnPl6u1saWWsidNYHs4LYpo2+XU816VM6JOxqi
         UUu5L8LYMFriJ9XA9iU8iFSi54D7dJMqDsM3TpqWzmF1zExsQd/5AXtjgUhXMiV3wp0R
         VCKDVGktQ59MhgSj/8PsCBGHr86AenBjQpRvi/MsrRezKU2pqTgU/RqZEe6yqqweeUtW
         13eIUkDFFiFZtgJ/tSJdPBdm269G0QN1HWkbxOqgHrOCvqnE2sF+0ftNnttcxQqleoOl
         V1tg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sMjF6RDwMDxYeWgXGH7QTj7ozY/Z4yHJef9Z/ks5dn3gbiomSn6V9hCwEqS5Br3D0MzgtmVrzRVe4vo=@vger.kernel.org
X-Gm-Message-State: AFuF++kNJKA2pgoofZVW4McanlXvBjpci0rRZYywwLbdD3Mr6gP6v7oz
	rGG9MgVqb7TpTEmV+9nl5/A97ZONjWg3Ofpwb9p5FWXBWmJXU8Bm9fh9
X-Gm-Gg: AYBFou0wD/MzXzOcRWCVAlS/di+mLhsMhxbxmMIXSSG45iBhrYSBqVAa+5hG+X1XudH
	Hpp5I09nh3quJIzqiRxXJTd9hswPSkC/PSNu/7ldy55W9PmRDgXWCydQLl1XSaUx7VdrqjzqWjn
	P0UtC1zeErskGMgT8JEgtguFQCpBB7v79XKsY+llXBe/V8Y3Fp19CYsxyaxDerCj7VRb5zeua3q
	7t7II9Ln0zz1aNkwx89BNgNRnVPuDpBZ1WXx/qPLymaNhAayGyXrhpWWU5vGk4rAXD9OfOpNBrX
	CaI8VJMLvCVjWoC9EfZlhNwMbkxhcrX63d+D30K+rbmRUbHXG+n7EaxsgJwfw7uQvahcE4l4mQI
	1BX96xDtkXKJ1NNf26thGTla6dJdM8YPZyPUymlVtUCeLcjNU+hO/2dRrp6RnQrLhhxX6vGHOjh
	cJ5nvdL5cTBAf1XrohRE0eOJdhYiW9EW6E11fBDnBcYVkqPvoAnuBPbq16FvkArta4Nb6sTOEus
	fOaqjaLd7eZfVE/4nxjU7ZWQw4QaKWQlZCw7jyFFR4DtjRBXJ21h/flzFCUBiD7Okk=
X-Received: by 2002:a05:600c:1d29:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49fe66eeeaamr181452975e9.24.1790440558058;
        Sat, 26 Sep 2026 09:35:58 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:57 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] rust: mem: add DropGuard
Date: Sat, 26 Sep 2026 19:35:48 +0300
Message-ID: <20260926163551.52371-3-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DropGuard to the Rust kernel memory module.

DropGuard runs a FnOnce callback when the guard is dropped and provides
dismiss() to take ownership of the wrapped value without running the
cleanup callback.

This provides the Rust kernel with a scope guard API matching the
upstream Rust DropGuard interface.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/mem.rs | 123 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
index f2d4cdf87d00..17807c8e67ac 100644
--- a/rust/kernel/mem.rs
+++ b/rust/kernel/mem.rs
@@ -4,6 +4,95 @@
 
 use crate::prelude::*;
 
+use core::{
+    mem::ManuallyDrop,
+    ops::{Deref, DerefMut},
+};
+
+/// Wraps a value and runs a closure when dropped.
+///
+/// This is useful for running cleanup code when leaving a scope.
+///
+/// The [`DropGuard::dismiss`] function can be used to take ownership of the wrapped
+/// value without running the cleanup function.
+#[doc(alias = "ScopeGuard")]
+#[doc(alias = "defer")]
+pub struct DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    inner: ManuallyDrop<T>,
+    f: ManuallyDrop<F>,
+}
+
+impl<T, F> DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    /// Creates a new `DropGuard`.
+    #[inline]
+    #[must_use]
+    pub fn new(inner: T, f: F) -> Self {
+        Self {
+            inner: ManuallyDrop::new(inner),
+            f: ManuallyDrop::new(f),
+        }
+    }
+
+    /// Consumes the `DropGuard`, returning the wrapped value without
+    /// running the cleanup function.
+    #[inline]
+    pub fn dismiss(guard: Self) -> T {
+        let mut guard = ManuallyDrop::new(guard);
+
+        // SAFETY: We have taken ownership of the guard and prevent its destructor from running.
+        let value = unsafe { ManuallyDrop::take(&mut guard.inner) };
+
+        // SAFETY: We have taken ownership of the guard.
+        unsafe { ManuallyDrop::drop(&mut guard.f) };
+
+        value
+    }
+}
+
+impl<T, F> Deref for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &T {
+        &self.inner
+    }
+}
+
+impl<T, F> DerefMut for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    #[inline]
+    fn deref_mut(&mut self) -> &mut T {
+        &mut self.inner
+    }
+}
+
+impl<T, F> Drop for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let inner = unsafe { ManuallyDrop::take(&mut self.inner) };
+
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let f = unsafe { ManuallyDrop::take(&mut self.f) };
+
+        f(inner);
+    }
+}
+
 /// Transmute between two types.
 ///
 /// Use this instead of [`core::mem::transmute`] when it is known that sizes are identical but this
@@ -232,3 +321,37 @@ unsafe impl AsReprMut for $signed {}
     // `usize` is not normalized to particular integer for portability.
     usize isize,
 }
+
+#[cfg(CONFIG_RUST_DROP_GUARD_KUNIT_TEST)]
+#[macros::kunit_tests(rust_drop_guard)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_drop_runs_cleanup() {
+        let mut cleaned = false;
+
+        {
+            let _guard = DropGuard::new(42, |value| {
+                assert_eq!(value, 42);
+                cleaned = true;
+            });
+        }
+
+        assert!(cleaned);
+    }
+
+    #[test]
+    fn test_dismiss_returns_value_without_cleanup() {
+        let mut cleaned = false;
+
+        let guard = DropGuard::new(42, |_| {
+            cleaned = true;
+        });
+
+        let value = DropGuard::dismiss(guard);
+
+        assert_eq!(value, 42);
+        assert!(!cleaned);
+    }
+}
-- 
2.43.0

