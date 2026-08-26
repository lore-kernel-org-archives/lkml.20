Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B241D23D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762182; cv=none; b=DD9sXLreUBLj+XEz0gPkTQMlJmccyBzpMlTuxR2QWEv9rQOuqQa/CzNPIsmGHCWqYwG9ORcjTt3UN3nqi4LbTW+312ez45zQ1DXThQSnZRdsgFx8oIWsKWqMBFxn5rHvUYkpCQPi3cr80E7C5QcLgvYMTSDYzbuhe45G0SZZOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762182; c=relaxed/simple;
	bh=DIRCM2vMm7i3ZVyuxGIELlK0tOle5gnrlFzbg0DGhDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpFIGOX7BnkN153H+SQTNSbilTXHfTQjNiHFbMp1SuHp8ABWZr2bfK00QTH3qZ5U0FkpdYzExgs/nq+rufyS1ho87qQXDdVBv5j+WGP3Nmw9nUc6mvNrmkL3fmMSPM92q0qcXAsoMVs1DNV1wx87mgcFhSZfs/YO7IxDWAa89zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=tAijGIgG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="tAijGIgG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so525005e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762168; x=1788366968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etS7dDlMuCWd3+VoKkG/reluEY3jsEXWbjkOvSEBEgk=;
        b=tAijGIgGPna1S2V++eRqVnXVqXsqTZiy1phKGaiHqJ9ATXWQF36C5UM5v8of+W1exS
         qwUJ17ynNl63COp9VjHOWSWddLrMosXOXa7+WPczqGnx6czdT8/9+ayf9H/mSCc7ww0q
         Np0ddMeWTJnvJu+H7ssdgSMCVwae9NtA0N+ZCOfK9gq7E/bW+0Bf7GnM2oSwkpcVjj02
         XJ++i4VmPxxHXdpvJQ3+JM70ZeVep/lGC22mpsYqDn0V/+dV2ZWGSalodj/E7LI9/Yv0
         o+5SPVyijDReXI64xznQlMqTsqy+advhv1gY2eZwvzLxPbxA5Km6O5KzFSe9hc6f67Cs
         ZMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762168; x=1788366968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=etS7dDlMuCWd3+VoKkG/reluEY3jsEXWbjkOvSEBEgk=;
        b=k3S9HTQkQNAKVT/C3qw3OXrF15PBTySfeVdoLLIcdQ7FH80jTSbR5wAesxP4uvjBwP
         abIt9Q3bev9Jcqdhh87iP3LiAgbCzZAkVhh1nBbKb/dHDvexxCgzqykrDHzUpdFlJLmY
         xVRLySKenIr8A8K7Tp/+fRN4ci/6Tw0aIHO0P+yilHpavkut/SYjfKHKU73mIsKLYRK/
         pavboFVO9QRO7Mu4vYXJQl4kninJbQXHpoQzLJ2ijlmbUzwmUYkUOGrvY4wPEMhKgDzL
         0szpw8VIwl19YDJ7/7LXLBE9bVIOVw9bLMyg7UozILxC0/76Oq5FSySbtPwg3PMEkE39
         OFDA==
X-Forwarded-Encrypted: i=1; AHgh+RoS1ozrBjfTziNWqGkEMgZ3XSKIFuqdN+E/xJ1XQsfX2coZaxxLMQFRzIhZPf6DHaLaoP7vGjXB4whbIfA=@vger.kernel.org
X-Gm-Message-State: AFuF++kZFlsXYDAYIVQyvkfH/KACc9irFbaEWjO7aJm8ApMpZ4krCWWF
	pVEeEGrs8RtE4WBmvLrsGh09KJs6/AeS0OgZ0uu2a93Fs70pisWUXr4oNrezBDMc4w==
X-Gm-Gg: AR+sD13HN9Ryn4JGFAUP4Usyyp4pDQU7cKklWjMt/kQvgKTNj17NXdIbYViRdLlhMhV
	wk+VGwVi4TXKwcmWddDrEzwHVz+PYxEg5ZX8NK4hcj3eQO0Y/WlHAhpVNRamZgwCWr9dSze365W
	uhlP+l6gowj3e6BsvwQEyIyGxoIxLcGlcDtRxqFw9nJDAR3J1v1G7EsLooZLjprT2T6PBRf6FVd
	ivwOtX2AGkdAcIzdPckaV1Zdbfwrc/Lvqd77/ggFrIA0Bxk6lfm4B58qC0HlINuX8rSEVfDNDF3
	BDGtd1LUuo/5izdV+1zpjj5MIriU1i1DcLtwkAlEF30K2L2rgY68XEiJsnhb2gki7apjPndqjSW
	5KuEl9oEHgzJ5Mtr5ojza5ggr1y+ZCfh0WRh91lcE/fLQdPFyKlWQrsypDdXAKWLSNxjFmbNn+U
	24UX4za7Oy7nZQNGyX+Si/7I7cFfpCsNBejpYBAzNjGtzosbDl4FRo5RPbIVslVuS8YUwjsgmWX
	b8soab55AF0uEOnDyjSmMnOwFQVzlCsezEOx2ZkwKSHfiQ=
X-Received: by 2002:a05:600c:3151:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-49b0deb14d0mr4919895e9.3.1787762168128;
        Wed, 26 Aug 2026 09:36:08 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/23] rust: drm: pin the owner while DRM files remain open
Date: Wed, 26 Aug 2026 17:31:46 +0100
Message-ID: <20260826163359.4998-16-mike@fireburn.co.uk>
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

Give each Rust DRM device its own driver and file-operations tables
so file_operations::owner can identify the module that owns the
implementation. Open DRM file descriptors then hold the same module
reference that C DRM drivers receive through DEFINE_DRM_GEM_*_FOPS().

Pass the owning module to UnregisteredDevice::new() and use the
built-in null module for the shmem KUnit device.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/device.rs    | 46 ++++++++++++++++++++++++++++++++++--
 rust/kernel/drm/gem/shmem.rs |  8 ++++++-
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index bc2cdcd2b695..efbec3f42bda 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -208,9 +208,14 @@ const fn compute_features() -> u32 {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
+    ///
+    /// `module` must be the module that owns the driver implementation, i.e. `&THIS_MODULE`. It is
+    /// stamped into this device's `file_operations::owner` so that an open `/dev/dri/cardN` file
+    /// descriptor pins the module, exactly as `DEFINE_DRM_GEM_*_FOPS()` does in C.
     pub fn new(
         dev: &T::ParentDevice<device::Bound>,
         data: impl PinInit<T::Data, Error>,
+        module: &'static ThisModule,
     ) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
@@ -253,8 +258,37 @@ pub fn new(
             unsafe { bindings::drm_dev_put(drm_dev) };
         })?;
 
-        // SAFETY: `drm_dev` is still private to this function.
-        unsafe { (*drm_dev).driver = const { &Self::VTABLE } };
+        // Give this device its own `file_operations`/`drm_driver` pair so that the owning module
+        // can be stamped into the fops. `fops->owner` is what makes `fops_get()` in
+        // `drm_stub_open()` take a module reference for every open DRM file: without it nothing
+        // pins the module, and unloading the driver while a compositor still has
+        // `/dev/dri/cardN` in a poll set frees the `file_operations` out from under
+        // `do_sys_poll()`, which then faults on `f_op->poll`.
+        //
+        // SAFETY: `raw_drm` is a valid pointer to `Self`, still private to this function, and
+        // both fields are plain data that need no drop.
+        let raw_fops = unsafe { Opaque::cast_into(ptr::addr_of!((*raw_drm.as_ptr()).fops)) };
+        // SAFETY: `raw_fops` is valid, aligned and points at uninitialized memory we own.
+        unsafe {
+            raw_fops.write(bindings::file_operations {
+                owner: module.as_ptr(),
+                ..Self::GEM_FOPS
+            })
+        };
+
+        // SAFETY: as above, for the per-device `drm_driver` copy.
+        let raw_vtable = unsafe { Opaque::cast_into(ptr::addr_of!((*raw_drm.as_ptr()).vtable)) };
+        // SAFETY: `raw_vtable` is valid, aligned and points at uninitialized memory we own.
+        unsafe {
+            raw_vtable.write(bindings::drm_driver {
+                fops: raw_fops,
+                ..Self::VTABLE
+            })
+        };
+
+        // SAFETY: `drm_dev` is still private to this function; `raw_vtable` lives inside the DRM
+        // device allocation and so outlives every use of `drm_device::driver`.
+        unsafe { (*drm_dev).driver = raw_vtable };
 
         // SAFETY: `raw_drm` is valid; no concurrent access before registration.
         unsafe { (*raw_drm.as_ptr()).registration_data = UnsafeCell::new(NonNull::dangling()) };
@@ -277,12 +311,20 @@ pub fn new(
 ///
 /// * `self.dev` is a valid instance of a `struct device`.
 /// * The data layout of `Self` remains the same across all implementations of `C`.
+/// * `self.vtable` and `self.fops` are initialized before the device is registered and are never
+///   mutated afterwards; `self.dev.driver` points at `self.vtable`, whose `fops` points at
+///   `self.fops`.
 /// * Any invariants for `C` also apply.
 #[repr(C)]
 pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
     dev: Opaque<bindings::drm_device>,
     data: T::Data,
     pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
+    /// Per-device copy of the driver vtable, so that `fops` below can be referenced from it.
+    vtable: Opaque<bindings::drm_driver>,
+    /// Per-device copy of the DRM file operations, carrying the owning module in `owner` so that
+    /// an open DRM file descriptor pins the module.
+    fops: Opaque<bindings::file_operations>,
     _ctx: PhantomData<C>,
 }
 
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 86797ab39ffd..8751000c92bb 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -642,12 +642,18 @@ impl drm::Driver for KunitDriver {
         const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor] = &[];
     }
 
+    // These tests only ever build into the kernel image, so there is no module to pin. A null
+    // `file_operations::owner` is exactly what a built-in driver uses.
+    //
+    // SAFETY: `NULL` is the correct `THIS_MODULE` for built-in code.
+    static KUNIT_MODULE: ThisModule = unsafe { ThisModule::from_ptr(ptr::null_mut()) };
+
     fn create_drm_dev() -> Result<(faux::Registration, UnregisteredDevice<KunitDriver>)> {
         // Create a faux DRM device so we can test gem object creation.
         let data = try_pin_init!(KunitData {});
         let reg = faux::Registration::new(c"Kunit", None)?;
         let fdev = reg.as_ref();
-        let drm = UnregisteredDevice::new(fdev, data)?;
+        let drm = UnregisteredDevice::new(fdev, data, &KUNIT_MODULE)?;
 
         Ok((reg, drm))
     }
