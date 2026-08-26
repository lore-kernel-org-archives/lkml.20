Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E1470128
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762171; cv=none; b=dtytbheeTaXdrOLdLLbE/tFyq7mVxujPRKmYlAjpqjoCv5t/MNb7qSCzqwwfde/F9CKd/NC7sSt1Y4WEosz4F7joRinlpPWgfsrouUYzsq8BofKMPaOQEeCtj5sdiSXtP4wgNH2e5NLGqRASajdGcGTlA84MMqFfSNsFp8ZsasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762171; c=relaxed/simple;
	bh=PnV897J9lscqn2R2xeSYJAiMO7un6OzkQpczXfTd41Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSgjUcdbffAfrerUlbPc29Nq5XPrv3d7elqQ6IFezYDKqPN/ePDnewy0lnUQZhzAHlcj33B5YIYcgRQwUEg67/5R2qupLIPixXF7AdUXbIXatPTojav43Q9C1SjswVWrTDV9m3jJMYY2QrSVcQJblf2m6CUNY4qU89rmXxDPfuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ZuyulKxY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ZuyulKxY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso10774005e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762156; x=1788366956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/APfKcEeEW79JrpN5r3Qjg5PHNTQvqkRfD0//AqN/6w=;
        b=ZuyulKxYKCAqoSBgti/Xtj69MAuxyahuTgbIeSJcdtDoB+LjVvpzaiHlguJQEfYmfF
         +gENFHLgDaxxFDaJbdqb3knfrThG6bEFe0CT6yojQnUuP8NdxAR6ADRnZAABGBRnQj3u
         0ZBR1h0jC/mcsxTEcoMopbPHqfiSiDb8kuR30M1jrkCM3JcylBkJZVL4N0Vfrf+0esT9
         IpM5d9m54BbGln+hXPw2p9YNuos1E2icB6I5GMgft6M4dao/ZXWRMYe4JRRYNV68Wrih
         DZygusTdbE1QYUjMXsqSw9Yv7wphEZ0uPEGP6XSlO/Wg37fEpsSdCppA7/wLV9mPLvH7
         pKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762156; x=1788366956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/APfKcEeEW79JrpN5r3Qjg5PHNTQvqkRfD0//AqN/6w=;
        b=PaKdZt9MioXGqdFmEGZBbbAR5py5Yb80YrJdLZ/0nr9f+Dv59c8lMPefax0Jc0HUiW
         4hNRC7yFkMd02RuBL0dAcn+qdzOU9+BGRRCYwdMM5c7mUDf3QEw6eMWop7umw5ykA0n0
         t2I5XTVRjaPnaLPjxylVYLMGOqkPbReFp9fubdvHG1ErTKfB9M+S64KU9KpAsNgsjir2
         HJCj0Gm0j+ioTJXJrlGICjDXkO7mkoCo9hQKGzaBUXbQp1fWt8A2ReLO9qlooUWsibvU
         x6X2EPjG+8ghJOjdHCNBCGUX9PvkNHmuKtUgKfajgXU9/fvL1TCai8aRHTnnrX7lPvcs
         pG1w==
X-Forwarded-Encrypted: i=1; AHgh+Rolqor7yp5DtMPsd3smF2UC4Vat3vxsnrQRLuU23iIfSCEol7KKKYprllrqNs1jbs02rjdCczGCVJ6qAoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nO9WvNuIgbUBbzy6gFBhG/40H9+b80sREG13Uua/46mYHVwwd9
	D4HNqO5EStnkZyz8xvPiLFtjHfWnXMDbAdEYZaUTHi1rEcRlhNJRr0P4dPFz9YZdWg==
X-Gm-Gg: AR+sD10YfdHt5aeaL6R3nIVnVJHHlINJdoqmKmaPP17IVxdqdRwBs/dYb4oM2uz1XmE
	c+CG4vRjHm1oiYO2slXcm375HDHuaAIwFbL8TUaJNHksoJx+7rKMl1XFSamo+xAWqdrPvOWqrJi
	wxJgnU4rrG9bgzAjRFEsq44kD0Wo0YADpxheAreFJx4Q0/MRdMl2nxTEBw96xEHaf5fDfOc1tJD
	Ad6lPJsMbQMwzOfXRic7QooeJLcIOg06l+AjHWzbaNqKmL5oYlBxPULAd4wiHfWHMUtGz93Ric8
	biK6ppuQAZBh+26PmQMWA6ubrYp+RdyoyG7HkP3ysgwZmEpu1UFq/uBpYwxBj4lDlJN/Z5QTrfd
	7fFnc/muVTqOJgGKBKOclRC/vHUFhQQjVb3uSIYZgo1q4TSkby5BIcwJdGNH/C+zQ5731DQ1dNK
	LujF3KDkL8tJCCnnOekA1Ou/wv77bEoGVndJvq/ZZWAPeqY+egrnJS8awCTWZMTpQWFgU5DWBgw
	JImXHy1OcBksLCm64LbZYurV1Qb3aQLXDQT
X-Received: by 2002:a05:600c:a418:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-499dc82073fmr78367735e9.11.1787762155817;
        Wed, 26 Aug 2026 09:35:55 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:53 -0700 (PDT)
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
Subject: [PATCH v3 12/23] rust: drm: kms: add owned CRTC and vblank references
Date: Wed, 26 Aug 2026 17:31:43 +0100
Message-ID: <20260826163359.4998-13-mike@fireburn.co.uk>
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

`&Crtc<T>` is only valid for the callback DRM handed it to, and
`VblankRef` borrows one. That does not fit two common shapes:

  - a driver that enables vblanks in `atomic_enable` and releases
  them in
    `atomic_disable` holds the reference across two callbacks,
    so it has to `mem::forget` the guard and hand-balance a raw
    `drm_crtc_vblank_put`;

  - a driver with a software vblank clock must reach its CRTC from
  a timer
    callback, so it stashes a raw `drm_crtc` pointer and calls
    `drm_crtc_handle_vblank` on it.

Both are safe in principle -- mode objects live until their DRM device
is freed -- but neither can be expressed, so drivers reintroduce raw
pointers that the safe KMS API exists to remove.

Add `CrtcRef`, an owned handle holding an `ARef` to the DRM device,
which keeps the CRTC alive and hands back a `&Crtc<T>` from any context,
and `OwnedVblankRef`, a vblank reference built on it and obtained by
converting a `VblankRef` with `into_owned()`. The vblank reference
is still released exactly once, on drop.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/crtc.rs   | 54 +++++++++++++++++++++++++++++++++++
 rust/kernel/drm/kms/vblank.rs | 47 ++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index a7024d8921ca..892f04f04e22 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -14,6 +14,7 @@
     drm::device::Device,
     error::{from_result, to_result},
     prelude::*,
+    sync::aref::ARef,
     types::{NotThreadSafe, Opaque},
 };
 use core::{
@@ -304,6 +305,59 @@ pub(crate) fn get_vblank_ptr(&self) -> *mut bindings::drm_vblank_crtc {
     pub(crate) const fn has_vblank() -> bool {
         T::OPS.funcs.enable_vblank.is_some()
     }
+
+    /// Returns an owned handle to this [`Crtc`].
+    ///
+    /// A `&Crtc<T>` is only valid for the callback that produced it. Drivers that must reach a
+    /// CRTC from a context DRM did not hand one to -- a timer callback driving a software vblank
+    /// clock, for instance -- can keep a [`CrtcRef`] instead of stashing a raw pointer.
+    pub fn to_owned_ref(&self) -> CrtcRef<T> {
+        CrtcRef {
+            dev: self.drm_dev().into(),
+            crtc: NonNull::from(self),
+        }
+    }
+}
+
+/// An owned handle to a [`Crtc`].
+///
+/// Mode objects are owned by their DRM device and live until it is freed, so holding an [`ARef`] to
+/// that device is enough to keep the CRTC valid. [`crtc`](CrtcRef::crtc) then hands back a usable
+/// reference from any context.
+///
+/// [`ARef`]: crate::sync::aref::ARef
+pub struct CrtcRef<T: DriverCrtc> {
+    /// Keeps the DRM device -- and with it every mode object it owns, including `crtc` -- alive.
+    dev: ARef<Device<T::Driver>>,
+    crtc: NonNull<Crtc<T>>,
+}
+
+// SAFETY: This is an owning handle to device state, not to anything thread-local, and the
+// `ARef` it holds is itself `Send`.
+unsafe impl<T: DriverCrtc> Send for CrtcRef<T> {}
+
+// SAFETY: The only shared access offered is `crtc()`, which yields the same `&Crtc<T>` that is
+// already freely shareable between threads.
+unsafe impl<T: DriverCrtc> Sync for CrtcRef<T> {}
+
+impl<T: DriverCrtc> CrtcRef<T> {
+    /// The [`Crtc`] this handle refers to.
+    pub fn crtc(&self) -> &Crtc<T> {
+        // SAFETY: `self.dev` holds a reference to the DRM device that owns this CRTC, and mode
+        // objects live until their device is freed, so the pointer is still valid.
+        unsafe { self.crtc.as_ref() }
+    }
+
+    /// The DRM device that owns the [`Crtc`].
+    pub fn drm_dev(&self) -> &Device<T::Driver> {
+        &self.dev
+    }
+}
+
+impl<T: DriverCrtc> Clone for CrtcRef<T> {
+    fn clone(&self) -> Self {
+        self.crtc().to_owned_ref()
+    }
 }
 
 /// A [`Crtc`] that has not yet been registered with userspace.
diff --git a/rust/kernel/drm/kms/vblank.rs b/rust/kernel/drm/kms/vblank.rs
index a725a46110d8..672968c1d3cb 100644
--- a/rust/kernel/drm/kms/vblank.rs
+++ b/rust/kernel/drm/kms/vblank.rs
@@ -359,6 +359,53 @@ fn new(crtc: &'a Crtc<T>) -> Result<Self> {
 
         Ok(Self(crtc))
     }
+
+    /// Converts this reference into an [`OwnedVblankRef`], which is not tied to the borrow of the
+    /// [`Crtc`] it came from.
+    pub fn into_owned(self) -> OwnedVblankRef<T> {
+        let crtc = self.0;
+
+        // The new owner takes over the reference this guard was holding.
+        mem::forget(self);
+
+        OwnedVblankRef(crtc.to_owned_ref())
+    }
+}
+
+/// A vblank reference that owns a reference to its DRM device.
+///
+/// [`VblankRef`] borrows the [`Crtc`] it was taken from, so it cannot outlive the callback that
+/// created it. A driver whose vblank interval spans several callbacks -- typically one that enables
+/// vblanks in [`atomic_enable`] and releases them in [`atomic_disable`], or that drives a software
+/// vblank clock from a timer -- needs a reference it can store instead.
+///
+/// It wraps a [`CrtcRef`], which keeps the DRM device -- and so the CRTC -- alive, so [`crtc`]
+/// hands back a usable reference for as long as this object exists. Dropping it releases the
+/// vblank reference exactly once.
+///
+/// [`atomic_enable`]: DriverCrtc::atomic_enable
+/// [`atomic_disable`]: DriverCrtc::atomic_disable
+/// [`crtc`]: OwnedVblankRef::crtc
+pub struct OwnedVblankRef<T: VblankDriverCrtc>(CrtcRef<T>);
+
+impl<T: VblankDriverCrtc> OwnedVblankRef<T> {
+    /// The [`Crtc`] whose vblanks this reference is keeping enabled.
+    pub fn crtc(&self) -> &Crtc<T> {
+        self.0.crtc()
+    }
+
+    /// The DRM device that owns the [`Crtc`].
+    pub fn drm_dev(&self) -> &Device<T::Driver> {
+        self.0.drm_dev()
+    }
+}
+
+impl<T: VblankDriverCrtc> Drop for OwnedVblankRef<T> {
+    fn drop(&mut self) {
+        // SAFETY: `crtc()` returns a valid, initialized `drm_crtc`, and this type holds exactly
+        // one vblank reference -- taken by `VblankRef::new()` and transferred by `into_owned()`.
+        unsafe { bindings::drm_crtc_vblank_put(self.crtc().as_raw()) };
+    }
 }
 
 /// The base wrapper for [`drm_vblank_crtc`].
