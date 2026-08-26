Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8BF46D541
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762174; cv=none; b=r5xQYhWGoVuwgCeYEJd9Eh2xHogN6Zryd1pvCgnwWKZe3cshssDNct0jJz6KDQvgqshBlDvLwB3A4WzMLfh4cANd868Qck+TQPDeUJ6JWnsq8IVnZ/ou7mZ5qRf3X2OoFdZ/5sqxBx9xUyT56SdOS9kkl07T2CpkPU1wn2yCiKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762174; c=relaxed/simple;
	bh=Vs381P+yDLBEfeWg9LKiEiD4QqJMYspL8zkTd4AUo3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIMhA2TbyfK3nn05gF0CWWf0IfoBvKYcYRwhMe89/Ksc3A1+UkAKdEMelyN4djVAiafRNtnnW1xFeQZnL9lpaZntVj42YKALSnKc24cpEmJKlNPoPDgky0qE/uoWq42ndxBfOM93PICyJSykwCrJ+xWLzoLj5LfP0qwlwCyhqwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=06haMXJ8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="06haMXJ8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so524415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762163; x=1788366963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EL6Jw26lW1z9BDf8CloPoJWlkDCbIL/77zIh+v+UO4=;
        b=06haMXJ8gW4Z9s9lZ165sObzthnmwgaDG4cJTOQ29Ybpu44+eMFBbGMSds4ZD25yfF
         7bv3Xh+E4bnByWP5UT+3M9QBTaX5GjHvudjhSWy9hhQ/dpb7G6wKKSlhHUMFLQKDjRMc
         7I5KBEVRIDI3F/6I7xcria/OLykGtisLQO8zbmNAH9MM+sB6xeuM26lSKygJdbe6JdhG
         idvrGFhlUmOVVsAAX/lVeqihcHnZNcTv3ipy4WEfcRphCNHTxabCLnB3MuXzcsRix7TJ
         sWLESginLUNNVaRhXmp2qT0QyHNvxSjGVk26L5lOsHNBiPxsQDVemY4gZlJSuJPTqN6W
         KMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762163; x=1788366963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EL6Jw26lW1z9BDf8CloPoJWlkDCbIL/77zIh+v+UO4=;
        b=dW9kWuirKb4xN0A3vDZ1Mtn6w5tfb7nSU6zztjwjOhhvB2Epw1s0NA5j5Z4Gx/MAbp
         S2BIkSpN0xhS4lY7dhp82zjPiWc1t2OCgmtDzOnnNLodPpBXjOjwTmZdQs7l6CEqR3r5
         jRgRGbqtBnZUhAJYSk8t73sJowlXsiU1ksqhBVUc7GEjvkn71gOZlZI5cj+yNSXyBwxZ
         w76741vQshrykYD+7zLuJIYTLZGp8LYCUQxPXMcEunHe7fQ5aCBqI1WbROlvn3OcoQg/
         iyMInaahXrm39DFl2CZeicuttiufAmhNr2yM7UAebpWK3ZwHkQ3VSQbPkx0zOO2S1cE+
         7YxA==
X-Forwarded-Encrypted: i=1; AHgh+RqkXn/dPoVVFm9e2VI88jl3sgD7Fm7OK0IqLlMOxASqG1I8z0oiGEsWJafBLTMns2mM21g00drhZuyc6Ic=@vger.kernel.org
X-Gm-Message-State: AFuF++mh/jri4AegIRWQs+3+KrF05AGINV2CbNtDhddeByu3osRBSfTU
	fmTA0Gbsb8TAO9WRvjzjrQp3cpUFjmDeE6rt9K77Xjrhk3MCLYSOnj0yMwzPzSBZeg==
X-Gm-Gg: AR+sD12yd2XUJWwWmkDIUu89xXyDEoAF//OzK9KEDGoT27MvfdaebbNG21wb8X1f6/q
	1HY1xkVVJUf8DybePE7isvAVnlI9rgwFkzNjGV0zna42SxDhbvYclsT7Q1S4c9I87F4uiqEOaDL
	ewxzmyW2IXZwgIzIfkq+Dm1ccNhyQBVrRnMdMegpl8P+4uzxHBqlc+3uecllKEH5NoEc7UUBYRr
	F6YDyl9mZOe4SxAVKZjfmKf7M8zpwIROUPADefVj8N2uo2n3qYSv8airSTWBFWZ2fyrME9WzzN4
	1jYVmaCQwX+VnQ+VXMa+Gdv+mJNswJCAccfcihoPCRS3ruHElZkJF7Ch7XLwfANj2/pSOrYFeyh
	0LpCOxftX1H2lR3IzAn19nk32tD0QIj+cfC0e1R73dwvaaY6GvKEbOXfp6BGWOKDK3EeIsWi9tI
	OW2sboWKVDTHZUPqvPsrjqqE+qQWkHOzxjMqsEVDiJ2Mx3ng7PNROycjrQLc2RlPMPniiEapF+L
	rPIxNoR6JHMrPBXF9j9DtczKL7Fr5Kvtocs
X-Received: by 2002:a05:600c:800f:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49b0dea9491mr4564165e9.1.1787762162730;
        Wed, 26 Aug 2026 09:36:02 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:01 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/23] rust: drm: add a safe constructor for owned registration data
Date: Wed, 26 Aug 2026 17:31:45 +0100
Message-ID: <20260826163359.4998-15-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A DRM registration whose associated data is 'static cannot outlive any
references held by that data. Add a safe constructor for this common
case so drivers do not have to promise manually that their registration
will never be forgotten.

Keep the existing unsafe constructor for registration data which
genuinely borrows from the bus binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/driver.rs | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 356be329a2b6..2e7987a71a7a 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -169,7 +169,8 @@ pub struct Registration<'a, T: Driver> {
 }
 
 impl<'a, T: Driver> Registration<'a, T> {
-    /// Register a new [`UnregisteredDevice`](drm::UnregisteredDevice) with userspace.
+    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) with borrowed
+    /// registration data.
     ///
     /// # Safety
     ///
@@ -177,7 +178,7 @@ impl<'a, T: Driver> Registration<'a, T> {
     /// [`Drop`] implementation from running, since the registration data may contain borrowed
     /// references that become invalid after `'a` ends.
     pub unsafe fn new<E>(
-        dev: &'a device::Device<device::Bound>,
+        dev: &device::Device<device::Bound>,
         drm: drm::UnregisteredDevice<T>,
         reg_data: impl PinInit<T::RegistrationData<'a>, E>,
         flags: usize,
@@ -243,6 +244,29 @@ pub fn device(&self) -> &drm::Device<T> {
     }
 }
 
+impl<T: Driver> Registration<'static, T> {
+    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) with owned registration
+    /// data.
+    ///
+    /// Unlike [`Registration::new`], this constructor is safe because its registration
+    /// data cannot contain non-static references. Forgetting the returned registration can leak
+    /// the DRM device and its parent reference, but cannot leave a live registration referring to
+    /// expired data.
+    pub fn new_static<E>(
+        dev: &device::Device<device::Bound>,
+        drm: drm::UnregisteredDevice<T>,
+        reg_data: impl PinInit<T::RegistrationData<'static>, E>,
+        flags: usize,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        // SAFETY: `RegistrationData<'static>` cannot borrow data that expires while a forgotten
+        // registration remains accessible.
+        unsafe { Self::new(dev, drm, reg_data, flags) }
+    }
+}
+
 // SAFETY: `Registration` doesn't offer any methods or access to fields when shared between
 // threads, hence it's safe to share it.
 unsafe impl<T: Driver> Sync for Registration<'_, T> {}
