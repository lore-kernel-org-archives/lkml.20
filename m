Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE125471436
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762226; cv=none; b=ew2PMQVT6ruvVbdRZAh1zgda7NwD2PZ+yZBvWEq5mIAKcB8n6MbrcuF8qsxcqGiKfhIE8PhXRMzWGUafHVYZmzZo9dgc3JKREoCUIztjHk+mlo5DjwNerLYU8a0JHyex4Bjv694NV2ZluDZpyjsasMzmZ4KlpL61vvtsIQdcEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762226; c=relaxed/simple;
	bh=xFLUg7d1jW09Kc6ycwH31P/6UvJCBP6okM1TptmSXfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGAifVlkEReAY3+XuuqxMTYpgctxtHhQLteupOVsW6/TKiGag+DbSk5HRAsAuBRozSg9Fyy+0naxKclG675y1IZL8/6Zo3Hfew9t9wCxc0rkNObvGcxZia5Jn+4dgP/3yRZ4Vo/DVxES2jc533DeRkMNRDPEJclA6IhxXg5FjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=uIi/J3YY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="uIi/J3YY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso1347665e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762190; x=1788366990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2OHbwXA2OvxO/KGmpi5z3jM0ajQdXHlh6ANlHWfPkU=;
        b=uIi/J3YYeDMhG+sOBR6YJmpwt8HtBGRK8rNjBfHpAWOIjOMXLL2mg6iREoZFZI0d3f
         CeyvnAuiTT6YnDb99tWKN7rMi9B0LtZPS1MBUt+YcyEUAgDCxtqVXuCMGdMyXSIzN8C/
         Z0+OXk7LFIVwpAtkyhVvf7Z7bNfsqZnHuDwBo/qrQXdPNReThSgk72huqriweVimqvHE
         xCxwJYFVIsfBSk6UNAmnNu9f578D8dlzQ2iHwzwE3BVgVGY4owVUMQE0quzzz6INbd0R
         I+J3ZPYRkex2O4C60N8Xha0ElsTx+kKd2Lz5VS4ZydF8gppIlaLw3h8h/p5Eap5MYrg9
         xb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762190; x=1788366990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2OHbwXA2OvxO/KGmpi5z3jM0ajQdXHlh6ANlHWfPkU=;
        b=WvrxKcDQA2O3uBqkwFQoxTzvg7+/FkAFXpz4dnKhyr/RER5+I6txT9aUBFn8W+h/hF
         dRrlgqe3MHRBOQpqZmlLvDapYw67bfjrofGlVw99uz8b15tDfARh0quFH4BykP9ZpT2O
         eYaKrGhayOej9r1h7E3Ba5gjQSaZ9afxjRBLCccQIAq5M56xc8Pe2NGllXHKNGh7eVT6
         mcnG+oodvbzUkjDwc+yz5qd8FuhwkBA4AE27R4oQS/sUPM7D+bwr0rtqh1srVoo7gAUa
         5YDs/pY9Uw0Wwp+7IluedcRwwPIqWjl5/91RKSBA8RhM3W1++THjYlP/lLrEOLtqwIWW
         eABQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYM6G3nwXuUTYu5zR64GX1yN2KRZ3r6a76+tJvLRdI0tev4LsLrc4hIYm+/mvnKe09TQ81YDORcayDftU=@vger.kernel.org
X-Gm-Message-State: AFuF++kEUFvrdCi+3iaLkgutd+CWVhbdj+0iNfvExSg3S4YEsU8Y95gI
	Q7S81c8Svz30vbEq8epNRREpKVJcaPmEi8uGJ4Tk7BJOyS5waoG8115p+R1es6YxKQ==
X-Gm-Gg: AR+sD125TpxIK1TQ2PTmQp6dLd0p0STyqduU+H37ieyTxAE8c9MTzT+u+1FkGexzkZ8
	zCV9B7+BcqWpgQgnZDbWlZC6BHeddN9GpVB5c2iSHTIka4IoAVfiVz5elkwWdeL8VAPbBRL7quk
	UtO74wM8DQ9o04e/I3o6pcot4kxaWrd2fP1qjzkADTPaLn3vOQ34acghqh6K+kRfa2ewT1ajTub
	87scmWsGeMpPDHuqYmPGRMrzgjTgQeRuK5uEJn9c3hWf17d77lKgMhbONWXxgaSocIGOsGTvMZp
	yW9ArQwgYJB5RsoREeTBTonvA8+qOOdIbqXj6hg81vbQxB09hN+ghAwCOy3J/TaqfGNM+3ER/Hv
	i1zhbqcHP4NLauVpnA9I7oKUGHM5ulpI1aDm36MPpA/Hh7GN2tBfcYp512IIdHSAljPGSXZuyLr
	8/HOtXTiKLu32kEMW0O6YsrMZ+txK1l1C2iIKGGSlkxcUlwVoqGxEMYRnf/pTNRbmm4UKWg65FE
	y7IJJweWU/AXhunIN0iOBsR0PzHcaWMB3inwGFrLcAgxi0=
X-Received: by 2002:a05:600c:19c6:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499dc7252fcmr78430185e9.9.1787762189623;
        Wed, 26 Aug 2026 09:36:29 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:27 -0700 (PDT)
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
Subject: [PATCH v3 19/23] rust: drm: expose CRTC mode changes
Date: Wed, 26 Aug 2026 17:31:50 +0100
Message-ID: <20260826163359.4998-20-mike@fireburn.co.uk>
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

Allow Rust DRM drivers to distinguish a modeset or enable transition
from an ordinary atomic page flip. This avoids repeating mode-specific
validation on the page-flip hot path.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/crtc.rs | 139 +++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 892f04f04e22..9e888c4e2f68 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -31,6 +31,17 @@
 pub struct ColorLut(bindings::drm_color_lut);
 
 impl ColorLut {
+    /// Build an entry. Mainly useful for tests and for drivers synthesising a ramp.
+    #[inline]
+    pub const fn new(red: u16, green: u16, blue: u16) -> Self {
+        Self(bindings::drm_color_lut {
+            red,
+            green,
+            blue,
+            reserved: 0,
+        })
+    }
+
     /// Red channel value.
     pub fn red(&self) -> u16 {
         self.0.red
@@ -47,6 +58,65 @@ pub fn blue(&self) -> u16 {
     }
 }
 
+/// A colour transformation matrix, as programmed through the CRTC's `CTM` property.
+///
+/// The matrix is applied to the pixel values that the degamma LUT produced, before the gamma LUT:
+///
+/// ```text
+/// out   matrix    in
+/// |R|   |0 1 2|   |R|
+/// |G| = |3 4 5| x |G|
+/// |B|   |6 7 8|   |B|
+/// ```
+#[repr(transparent)]
+pub struct ColorCtm(bindings::drm_color_ctm);
+
+impl ColorCtm {
+    /// Build a matrix from raw S31.32 **sign-magnitude** entries. Mainly useful for tests.
+    #[inline]
+    pub const fn from_raw(matrix: [u64; 9]) -> Self {
+        Self(bindings::drm_color_ctm { matrix })
+    }
+
+    /// The raw matrix, in the UAPI's S31.32 **sign-magnitude** encoding.
+    ///
+    /// Prefer [`Self::coefficient`], which decodes an entry into an ordinary signed value.
+    #[inline]
+    pub fn raw(&self) -> &[u64; 9] {
+        &self.0.matrix
+    }
+
+    /// Return matrix entry `i` as a two's-complement S31.32 fixed-point value, or [`None`] if `i`
+    /// is out of range.
+    ///
+    /// The UAPI encodes these in **sign-magnitude, not two's complement** (bit 63 is the sign and
+    /// the remaining 63 bits are the magnitude), so reading the `u64` as an `i64` silently turns
+    /// every negative coefficient into a huge positive one. Decoding here means no driver has to
+    /// remember that.
+    #[inline]
+    pub fn coefficient(&self, i: usize) -> Option<i64> {
+        let raw = *self.0.matrix.get(i)?;
+        // The magnitude is capped so it always fits a positive i64.
+        let magnitude = (raw & !(1u64 << 63)) as i64;
+        Some(if raw & (1u64 << 63) != 0 {
+            -magnitude
+        } else {
+            magnitude
+        })
+    }
+
+    /// Return all nine coefficients decoded by [`Self::coefficient`].
+    #[inline]
+    pub fn coefficients(&self) -> [i64; 9] {
+        let mut out = [0i64; 9];
+        for (i, o) in out.iter_mut().enumerate() {
+            // The index is in range by construction, so the fallback is unreachable.
+            *o = self.coefficient(i).unwrap_or(0);
+        }
+        out
+    }
+}
+
 /// The main trait for implementing the [`struct drm_crtc`] API for [`Crtc`].
 ///
 /// Any KMS driver should have at least one implementation of this type, which allows them to create
@@ -440,8 +510,28 @@ pub fn new<'a, PrimaryData, CursorData>(
     /// Call this during [`KmsDriver::probe`](crate::drm::kms::KmsDriver::probe), before the device
     /// is registered.
     pub fn enable_gamma(&self, gamma_size: u32) {
+        self.enable_color_mgmt(0, false, gamma_size)
+    }
+
+    /// Enable colour management on this CRTC, creating the `DEGAMMA_LUT`, `CTM` and `GAMMA_LUT`
+    /// properties that userspace can program.
+    ///
+    /// A size of zero suppresses the corresponding LUT property, and `has_ctm` selects whether the
+    /// `CTM` property is created. The programmed values are then readable from the CRTC state via
+    /// [`RawCrtcState::degamma_lut`], [`RawCrtcState::ctm`] and [`RawCrtcState::gamma_lut`].
+    ///
+    /// A driver with no colour hardware can still advertise these and apply them in software while
+    /// it has the pixels; compositors that colour-correct through the CRTC properties (rather than
+    /// by rewriting the framebuffer) otherwise have nowhere to put the correction on such an
+    /// output.
+    ///
+    /// Call this during [`KmsDriver::probe`](crate::drm::kms::KmsDriver::probe), before the device
+    /// is registered.
+    pub fn enable_color_mgmt(&self, degamma_size: u32, has_ctm: bool, gamma_size: u32) {
         // SAFETY: `as_raw()` is a valid, not-yet-registered CRTC.
-        unsafe { bindings::drm_crtc_enable_color_mgmt(self.as_raw(), 0, false, gamma_size) };
+        unsafe {
+            bindings::drm_crtc_enable_color_mgmt(self.as_raw(), degamma_size, has_ctm, gamma_size)
+        };
     }
 }
 
@@ -766,6 +856,12 @@ fn active(&self) -> bool {
         unsafe { (*self.as_raw()).active }
     }
 
+    /// Returns whether the mode or enable state changed in this atomic state.
+    fn mode_changed(&self) -> bool {
+        // SAFETY: The atomic-state API serializes access to this state, including its bitfields.
+        unsafe { (*self.as_raw()).mode_changed() }
+    }
+
     /// Return the display mode programmed into this CRTC state.
     fn mode(&self) -> &DisplayMode {
         // SAFETY: `mode` is embedded in the CRTC state and therefore has the same lifetime. The
@@ -793,6 +889,47 @@ fn gamma_lut(&self) -> Option<&[ColorLut]> {
         // entries valid for the state's lifetime.
         Some(unsafe { core::slice::from_raw_parts(data.cast::<ColorLut>(), n) })
     }
+
+    /// Returns the CRTC's degamma LUT for this state as an array of [`ColorLut`] entries, or
+    /// [`None`] if none is programmed. Requires a non-zero `degamma_size` to have been passed to
+    /// [`UnregisteredCrtc::enable_color_mgmt`].
+    fn degamma_lut(&self) -> Option<&[ColorLut]> {
+        // SAFETY: `as_raw()` is a valid `drm_crtc_state`.
+        let blob = unsafe { (*self.as_raw()).degamma_lut };
+        if blob.is_null() {
+            return None;
+        }
+        // SAFETY: a non-null degamma_lut blob is valid for the state's lifetime.
+        let (data, length) = unsafe { ((*blob).data, (*blob).length) };
+        let n = length / core::mem::size_of::<ColorLut>();
+        if data.is_null() || n == 0 {
+            return None;
+        }
+        // SAFETY: `ColorLut` is transparent over `drm_color_lut`; the blob holds `n` contiguous
+        // entries valid for the state's lifetime.
+        Some(unsafe { core::slice::from_raw_parts(data.cast::<ColorLut>(), n) })
+    }
+
+    /// Returns the CRTC's colour transformation matrix for this state, or [`None`] if none is
+    /// programmed. Requires `has_ctm` to have been passed to
+    /// [`UnregisteredCrtc::enable_color_mgmt`].
+    fn ctm(&self) -> Option<&ColorCtm> {
+        // SAFETY: `as_raw()` is a valid `drm_crtc_state`.
+        let blob = unsafe { (*self.as_raw()).ctm };
+        if blob.is_null() {
+            return None;
+        }
+        // SAFETY: a non-null ctm blob is valid for the state's lifetime.
+        let (data, length) = unsafe { ((*blob).data, (*blob).length) };
+        // DRM validates the blob length when the property is set, but this is the boundary where
+        // a short blob would become an out-of-bounds read of nine u64s.
+        if data.is_null() || length < core::mem::size_of::<ColorCtm>() {
+            return None;
+        }
+        // SAFETY: `ColorCtm` is transparent over `drm_color_ctm`, and the blob is at least that
+        // long and valid for the state's lifetime.
+        Some(unsafe { &*data.cast::<ColorCtm>() })
+    }
 }
 impl<T: AsRawCrtcState> RawCrtcState for T {}
 
