Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE7046D544
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762143; cv=none; b=jV3rCsW6kTSr512gVmVgVBmxXVxrk5hOuGeGZXuPUHjwtBu9ZsDd9rAqCIb2uvsMzhspTEZQTrzjKythouTf0/m0UciSp02v0Ymmws8oDeDUoyIT0gVDKmV9n16DjT02EkUPZbP8umiT+cMuSJ6wMX3rvRpkz75/YNGIk6++rrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762143; c=relaxed/simple;
	bh=CGdHbbzDPuxbg433p+h2jNb3pV5Krieikr8KFpMpWGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBA/EdIhn6K/FUXnEz037vVrTfj28N72uIReIyIJQ1XVJ6vHGxbM4iEsbfECGxNhz8x6eGCIEgtihUCAhpuSR46EAfwum8vGIBoOn58A9JG/d3dycyWsgfa9642R/o+bBGwqwiNzR9E5BMuuWZH2Ys55Px9StHxB9O4Z5WljlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=DOMBRBkj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="DOMBRBkj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8922255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762133; x=1788366933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5InOYNyXFRZKVSePul+WGyV/aEo1lwukf/GCH3cW8s=;
        b=DOMBRBkjOsGCEh/38hVY91O3gJrHUTEizE18jeHDSb7lxM/X8df+N/UHsV2S55eGej
         mA6tB5rClu6GehEfAG7eywLvibjsTauZ4n0B3SCr1VmSVpjZZUc2BPs+p7A67QoWuxnx
         GiHMxMiCvMgYLV9BINGxjZfbDGM13t4ixVXsMwuCAqk/QxWRBYJy57LujTBIXgeSUx9o
         D1yN2MUkzlOc/AeZnP4NEuVxXYSNuFH3U4Yyznbw9oStAraoeFeY9upLP7IW3zwqnDIn
         S0EXnX3418BgWt6u+oDtTNZpU0IY2C3RQoH0/S1ThCP1bX9W9z7umLyra2srKn+WlW8n
         paHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762133; x=1788366933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5InOYNyXFRZKVSePul+WGyV/aEo1lwukf/GCH3cW8s=;
        b=ptFWloFpQnxMZON5fEdguI34MsmpDHK1a4abn3sfdBo58NTnVlO4+Xo1xFcjAuEaL6
         9wZi+6qcqBxf/0ho7ao25wYhS8FPmVbQSmOC5KHVRT9A5SYclL7ssTDgfv9blRPZRN9e
         kZIACAFCtGpoE6Riv9D8Vcj+FNvIPksOpK97rqlCMuuqYIj9vbxvVuaaY+0b58Jld81S
         eHmcuG24w1XT5sRHkFK51/k0jWNIqyZBn0lzd0xizgl/c/kmYResDBy/DNx5WOY+oK3Y
         Jw9q9kxt33Fm9I1McAGqNkaXQHNHwKrDzF7U6q+UUeIj4oIsLbb/yh3R21rnbfWoUmLx
         9rpg==
X-Forwarded-Encrypted: i=1; AHgh+RpL5q3DEd0RK9aVYwRqlzDzJ+Oby8UiIZc3Eo2B2IGGKeU5qnras2/ih+R40vHK+TtYYlJ6ct+xXWuUIXA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ5dYFfMQV8zA1ObIeMFpZpH28fqXi6DargOCRdRiW1pX5Cvqu
	RIkMVDHxhyjylTnaADrxSx98z3a1D8EMImMyCguTUCXEvL0FtOuRpbyCBQyxuVt7cw==
X-Gm-Gg: AR+sD12GIfADvSVc9iuhiDPnDEyEoyTfO2oht99eazWs1gzSPWtqXvqrnKkgNNmQQRb
	F5ssAH8pIBIfsm6WpaqXf+Gma+Q+Fmw++paDTkVtduRNPYg2a5Sm9lgOFUjFhZC3806SlDTnJCV
	KedwOqSqE5og+rHfOzX+VA+d7OwJSfes/Jl4yIu33zxkQdLDXeHRSURhLjiP5w2m0ayXpz8Fy7c
	x51YrVsPP2CDleUGM1NP8t0bjuT/auELrfUUoOCiFQ1GaGRM1kTmA2vZXwS1DUGc+p3eYU/bAH2
	/dZq6/SdJYU0HwrFR5VdU19HGLDwRbra2fzJhkw8ZDigsKD1jY4f7Vnxko8TrXdIY4LMi72OPDD
	xkLjUmMMP6Szf0m0H7/sIOBsYXtnzEW62V+R62Z09bfXW1ZcSOWcuiNtXmivL55sX2P+B9Jfu7K
	sjNPlpPgDsImWNEpWC6cEX3IDZ9J5kh4cDu/I7siYOYDsrIce6MCPJSGTC80gxmN1u+w3aUpra5
	dfoTWSlNpNAOvSWzeNemMgCkUt9Ns/+DrO/
X-Received: by 2002:a05:600c:4585:b0:498:952:e276 with SMTP id 5b1f17b1804b1-499dc6f7ec9mr70086385e9.8.1787762132870;
        Wed, 26 Aug 2026 09:35:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:31 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/23] rust: drm: kms: add plane damage-clip accessors
Date: Wed, 26 Aug 2026 17:31:40 +0100
Message-ID: <20260826163359.4998-10-mike@fireburn.co.uk>
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

Add safe access to the FB_DAMAGE_CLIPS rectangles intersected with
the visible source area.

damage_merged() returns the bounding rectangle produced by
drm_atomic_helper_damage_merged(). for_each_damage_clip() wraps
the DRM damage iterator for drivers that can process the individual
rectangles without repainting their bounding box.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/kms/plane.rs    | 105 ++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 38ad80fae0ed..c4abdd887699 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -41,6 +41,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 8e3f711b0767..3bff4091abb2 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -693,6 +693,49 @@ pub trait FromRawPlaneState: AsRawPlaneState {
     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self;
 }
 
+/// A rectangle in a plane's source (pixel) space, as produced by
+/// [`RawPlaneState::damage_merged`].
+///
+/// The box is inclusive on the top-left and exclusive on the bottom-right (`[x1, x2)` by
+/// `[y1, y2)`), matching [`struct drm_rect`].
+///
+/// [`struct drm_rect`]: srctree/include/drm/drm_rect.h
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub struct Rect {
+    /// Left edge, inclusive.
+    pub x1: i32,
+    /// Top edge, inclusive.
+    pub y1: i32,
+    /// Right edge, exclusive.
+    pub x2: i32,
+    /// Bottom edge, exclusive.
+    pub y2: i32,
+}
+
+impl Rect {
+    #[inline]
+    fn from_raw(r: &bindings::drm_rect) -> Self {
+        Self {
+            x1: r.x1,
+            y1: r.y1,
+            x2: r.x2,
+            y2: r.y2,
+        }
+    }
+
+    /// The width of the rectangle in pixels.
+    #[inline]
+    pub fn width(&self) -> i32 {
+        self.x2 - self.x1
+    }
+
+    /// The height of the rectangle in pixels.
+    #[inline]
+    pub fn height(&self) -> i32 {
+        self.y2 - self.y1
+    }
+}
+
 /// Common methods available on any type which implements [`AsRawPlane`].
 ///
 /// This is implemented internally by DRM, and provides many of the basic methods for working with
@@ -774,6 +817,68 @@ fn atomic_helper_check<S, D>(
         })
     }
 
+    /// Merge all frame-damage clips on this (new) plane state -- relative to `old` -- into a
+    /// single bounding rectangle, intersected with the plane's visible source area.
+    ///
+    /// Returns [`None`] when the plane is not visible or there is nothing to update. If the client
+    /// supplied no explicit damage clips, the full plane rectangle is returned, so a driver can
+    /// always treat [`Some`] as "repaint this rectangle" and fall back to a full-frame update.
+    /// Coordinates are integer pixels in the plane's source space.
+    ///
+    /// [`drm_atomic_helper_damage_merged`]: srctree/include/drm/drm_damage_helper.h
+    fn damage_merged(&self, old: &impl AsRawPlaneState) -> Option<Rect> {
+        let mut rect = bindings::drm_rect {
+            x1: 0,
+            y1: 0,
+            x2: 0,
+            y2: 0,
+        };
+
+        // SAFETY:
+        // - `old` and `self` are valid initialized `drm_plane_state`s via their type invariants.
+        // - `drm_atomic_helper_damage_merged` only reads the two states (to gather the damage
+        //   clips and the source rectangle) and writes the merged result into `rect`; it does not
+        //   mutate the plane state, so deriving a `*mut` from our shared reference is sound.
+        let visible = unsafe {
+            bindings::drm_atomic_helper_damage_merged(
+                core::ptr::from_ref(old.as_raw()),
+                core::ptr::from_ref(self.as_raw()).cast_mut(),
+                &mut rect,
+            )
+        };
+
+        visible.then(|| Rect::from_raw(&rect))
+    }
+
+    /// Invoke `f` once per frame-damage clip on this (new) plane state relative to `old`, each
+    /// intersected with the plane's visible source area -- i.e. the individual rectangles that
+    /// [`Self::damage_merged`] collapses into one. If the client supplied no explicit damage clips,
+    /// `f` is called once with the full plane rectangle. Coordinates are integer pixels in the
+    /// plane's source space.
+    ///
+    /// This lets a driver forward each changed region separately (e.g. to a remote display) instead
+    /// of the bounding box of them all.
+    ///
+    /// [`drm_atomic_helper_damage_iter`]: srctree/include/drm/drm_damage_helper.h
+    fn for_each_damage_clip(&self, old: &impl AsRawPlaneState, mut f: impl FnMut(Rect)) {
+        let mut iter = bindings::drm_atomic_helper_damage_iter::default();
+        let mut clip = bindings::drm_rect::default();
+        // SAFETY:
+        // - `old` and `self` are valid initialized `drm_plane_state`s via their type invariants.
+        // - `drm_atomic_helper_damage_iter_init` only reads the two states to set up `iter`, and
+        //   `_next` only reads `iter` and writes `clip`; neither escapes a pointer.
+        unsafe {
+            bindings::drm_atomic_helper_damage_iter_init(
+                &mut iter,
+                core::ptr::from_ref(old.as_raw()),
+                core::ptr::from_ref(self.as_raw()),
+            );
+            while bindings::drm_atomic_helper_damage_iter_next(&mut iter, &mut clip) {
+                f(Rect::from_raw(&clip));
+            }
+        }
+    }
+
     /// Return the framebuffer currently set for this plane state
     #[inline]
     fn framebuffer<D>(&self) -> Option<&Framebuffer<D>>
