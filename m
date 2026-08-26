Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017345FFB7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762090; cv=none; b=OCVgQaEcOJCAAYyjPVsKVyDaEQtWLskpb9o0jqL3hYa0ev2pdgZjaJ5EIKnG6HIkVaaOfHR9AfkDgpFEEnNqudPCP1A/Y4TGYsmXVzgRkM/6jP229XAp//MpMwKgItLPXpOD6povh9SaCwEjxNLr+2GiElN3aNEhtp+kEDtNnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762090; c=relaxed/simple;
	bh=dlRNEACxpSNYAJ6OKzPwgLHWrnB/CU3HE8nxvpBhJfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSYEDs2T5cBn5JELty15pq+P+zoryG/fuo1XniTDhvmS+JKsn5I5vYhS9EMXMULeWYBoE1dARZ0+D449hcyFIksgsBOiiE+sS0MTbENv4JJY4GXg+YKOwOcYbfhMtzzSv2K+9idNJsEpd1MImU5jQmkv6lVPcOypu4sx60dZ3WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=IOMdPqMV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="IOMdPqMV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so9723775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762079; x=1788366879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC7WCQ5+0/9fPzRSyKMQ9auLD0V4hXZXAOJafRw4jYQ=;
        b=IOMdPqMVr6InVTNHIBKW9QxudoJIqoUvowHWuPVFvDWorAyYnPs/1mJZAHJYfz0XxF
         1JLxEXUf0K58UdSXLklNZZB1aDkBHlRcRzyoiyZtdgsKLcZF1EgG3XeOwIp9HfkstzsE
         V9+htuIaJXyGncqnkglEdjPIJD7RAHWJCtI5MNjD5675i+0BuzpHwjCpB5lQJIaL7UYH
         31UUPtS8DUTE5Ip8YYQGQuofwaBpAsf0IxD0iTOH43M5L2zxQR0aVJF/h0N2a/Dqe2cF
         2MaNBBB2VJl1fvBUUlMZK9qhZcyywMfukc4dtzI3BUAllf5xd1twswJLWlRbSovlKApP
         tFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762079; x=1788366879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZC7WCQ5+0/9fPzRSyKMQ9auLD0V4hXZXAOJafRw4jYQ=;
        b=g0j5opSHcdhNVfSDheMmyWjBCU4L/AeZfk0s+WDWM4nG6QhaPBBNd982kFYCn0Upqj
         j/oV7MEkfJgppaTEFAw1q03kKAon4X9nIpM6RFzLnJ9z2wzCYcdnVDg7Ua58LQOHImN3
         JmCDxJgVFjNNTvRHfxq6/86seMTZa27mbIt9YuZPVjsx6Jrv6j/MRw0xIyJYXlNAiyEE
         z5m4FonVZdnmjJIDOtfpHds8Z0GesA4Qki6T1XnlgL9UqhGMYCMqB/H6xvLOg/Cnusn0
         OUXVt7Uu7rZ8bEBzPICuaBzu/VoLg0iAT/7c72OtxmjVwZNhSmFknoX7hFfUOieVjkk6
         WC7g==
X-Forwarded-Encrypted: i=1; AHgh+RpwiNUJx/8ahmaac55cc+7TPOukVRcEz8fWmBjN3/263qf1hXPepjmCOBbM3avv+gqqbRKL6fyKCy71kic=@vger.kernel.org
X-Gm-Message-State: AFuF++lPBp7HDWGJycJYco1EnfYfMW8Dzncg1J8/XSvzqmXwJiJn1r2x
	25EjC9skNIJbXmn0z6DYxNq691hgK5UXKIZQjlTIvR/iuLiZVhqk+GXU+I3siAs0Hw==
X-Gm-Gg: AR+sD12lf8grZD0AUcrsrzbg2ds1/ReAkZp2VZcdRh1dw70uP1zKaAATApOSzODrGqJ
	LnCGMeJSq8592vjHL6/29D5QzD0PWgsm61LZ35ECCSH6ZUWx5G4RIpZZEy3CqLj7OGY92ZhNq49
	cNOzI65GJ4WOlRkr67LioOqO/7elhfEjKsS+ouJWjGYY4eAwf3vLEXXjk1n90hP4s54kSXDu4MX
	E7QbG5J5BLu/cvfrGg2Pp+YHdQo7sAxtsr6BXv3jCs9QUU9K3PFO6LIXpLTravAQSZgZfuKe7NS
	QjDjNKCl/Wq4JK6g5cv61H5yN+h8eWpQILKVxUuVLFYM6SF9CKdJnP42DsSsNHHPM0Y8a7rzIpu
	iLCGSgWO+JJP8zrgbECnGnK+QrlJR2qBTBPU+6V28J3HY3O4lkd+CQnAFESN12by6nL/vpcd7hq
	eX3s0tKv7CrcB6aCUgypSrf2p7/u1RsR9xDy0AYAotGuOC8/FhFol9hXoIcXQTxPTvWUod70vRT
	xSdxWjYtVsTsG70hy/AvWtJn4xTFQllJqLj
X-Received: by 2002:a05:600c:19c6:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499dc7252fcmr78303615e9.9.1787762079446;
        Wed, 26 Aug 2026 09:34:39 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:34:38 -0700 (PDT)
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
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/23] rust: drm: kms: tie mode-object references to their owners
Date: Wed, 26 Aug 2026 17:31:33 +0100
Message-ID: <20260826163359.4998-3-mike@fireburn.co.uk>
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

The plane and encoder constructors accepted a caller-selected output
lifetime longer than the unregistered KMS device borrow.
RawPlaneState::crtc() had the same issue relative to the state borrow.
This allowed safe callers to manufacture dangling references.

Return references with the input/owner lifetime instead. Remove the
unused second lifetime from the CRTC constructor at the same time.

Fixes: 4b14e6e6259b ("rust: drm/kms: Add drm_plane bindings")
Fixes: c07f528ca38e ("rust: drm/kms: Add drm_encoder bindings")
Fixes: 8ba1abe0de4b ("rust: drm/kms: Add RawPlaneState::crtc()")

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/crtc.rs    |  2 +-
 rust/kernel/drm/kms/encoder.rs | 24 +++++++++++++++++--
 rust/kernel/drm/kms/plane.rs   | 42 +++++++++++++++++++++++++++++++---
 3 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index b1c68838205e..683d9ee4ec25 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -302,7 +302,7 @@ impl<T: DriverCrtc> UnregisteredCrtc<T> {
     /// construct new [`UnregisteredCrtc`] objects.
     ///
     /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
-    pub fn new<'a, 'b: 'a, PrimaryData, CursorData>(
+    pub fn new<'a, PrimaryData, CursorData>(
         dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
         primary: &'a UnregisteredPlane<PrimaryData>,
         cursor: Option<&'a UnregisteredPlane<CursorData>>,
diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
index aa6f9fbaa5f1..f90d139cdb04 100644
--- a/rust/kernel/drm/kms/encoder.rs
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -273,15 +273,35 @@ impl<T: DriverEncoder> UnregisteredEncoder<T> {
     /// A driver may use this from their [`KmsDriver::create_objects`] callback in order to
     /// construct new [`UnregisteredEncoder`] objects.
     ///
+    /// The returned encoder cannot outlive the device borrow:
+    ///
+    /// ```ignore,compile_fail
+    /// use kernel::{drm::kms::{encoder::{DriverEncoder, Type, UnregisteredEncoder},
+    ///                         UnregisteredKmsDevice},
+    ///              error::Result,
+    ///              str::CStr};
+    ///
+    /// fn reject_leaking_signature<T: DriverEncoder>() {
+    ///     let _: for<'a> fn(
+    ///         &'a UnregisteredKmsDevice<'a, T::Driver>,
+    ///         Type,
+    ///         u32,
+    ///         u32,
+    ///         Option<&CStr>,
+    ///         T::Args,
+    ///     ) -> Result<&'static UnregisteredEncoder<T>> = UnregisteredEncoder::<T>::new;
+    /// }
+    /// ```
+    ///
     /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
-    pub fn new<'a, 'b: 'a>(
+    pub fn new<'a>(
         dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
         type_: Type,
         possible_crtcs: u32,
         possible_clones: u32,
         name: Option<&CStr>,
         args: T::Args,
-    ) -> Result<&'b Self> {
+    ) -> Result<&'a Self> {
         let this: Pin<KBox<Encoder<T>>> = KBox::try_pin_init(
             try_pin_init!(Encoder {
                 encoder: Opaque::new(bindings::drm_encoder {
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 0c549dece483..f52f9c872de3 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -255,8 +255,29 @@ impl<T: DriverPlane> UnregisteredPlane<T> {
     /// A driver may use this from their [`KmsDriver::create_objects`] callback in order to
     /// construct new [`UnregisteredPlane`] objects.
     ///
+    /// The returned plane cannot outlive the device borrow:
+    ///
+    /// ```ignore,compile_fail
+    /// use kernel::{drm::kms::{plane::{DriverPlane, Type, UnregisteredPlane},
+    ///                         UnregisteredKmsDevice},
+    ///              error::Result,
+    ///              str::CStr};
+    ///
+    /// fn reject_leaking_signature<T: DriverPlane>() {
+    ///     let _: for<'a> fn(
+    ///         &'a UnregisteredKmsDevice<'a, T::Driver>,
+    ///         u32,
+    ///         &[u32],
+    ///         Option<&[u64]>,
+    ///         Type,
+    ///         Option<&CStr>,
+    ///         T::Args,
+    ///     ) -> Result<&'static UnregisteredPlane<T>> = UnregisteredPlane::<T>::new;
+    /// }
+    /// ```
+    ///
     /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
-    pub fn new<'a, 'b: 'a>(
+    pub fn new<'a>(
         dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
         possible_crtcs: u32,
         formats: &[u32],
@@ -264,7 +285,7 @@ pub fn new<'a, 'b: 'a>(
         type_: Type,
         name: Option<&CStr>,
         args: T::Args,
-    ) -> Result<&'b Self> {
+    ) -> Result<&'a Self> {
         let this: Pin<KBox<Plane<T>>> = KBox::try_pin_init(
             try_pin_init!(Plane {
                 plane: Opaque::new(bindings::drm_plane {
@@ -597,7 +618,22 @@ fn plane(&self) -> &Self::Plane {
     }
 
     /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
-    fn crtc<'a, 'b: 'a, D>(&'a self) -> Option<&'b OpaqueCrtc<D>>
+    ///
+    /// The returned CRTC reference cannot outlive the plane-state borrow:
+    ///
+    /// ```ignore,compile_fail
+    /// use kernel::drm::kms::{crtc::OpaqueCrtc, plane::RawPlaneState, KmsDriver, ModeObject};
+    ///
+    /// fn reject_leaking_signature<S, D>()
+    /// where
+    ///     S: RawPlaneState,
+    ///     S::Plane: ModeObject<Driver = D>,
+    ///     D: KmsDriver,
+    /// {
+    ///     let _: for<'a> fn(&'a S) -> Option<&'static OpaqueCrtc<D>> = S::crtc::<D>;
+    /// }
+    /// ```
+    fn crtc<D>(&self) -> Option<&OpaqueCrtc<D>>
     where
         Self::Plane: ModeObject<Driver = D>,
         D: KmsDriver,
