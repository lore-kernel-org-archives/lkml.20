Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A746EF79
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762155; cv=none; b=rcBjqVI6GqyOdSiLf7UiughxAPaNw04I+O7Fea2r+6GWDOayQyeeshavyP+kwqHDcAsbdIWMr+p4fSfkWjJxIZCln1evZz8RLfGu0PAPm7n/SZKq8U/e5uSOcU0PmqPUViN0qhwDOXV4BMwboM6nWc2Iu8YvLa+xjyuzvqDiDH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762155; c=relaxed/simple;
	bh=OVIPP94ZLD/y5HONx5GsCRP6mP9WCiWDuBJr3UIPXIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yfn/yClU9BoNbCDlrM1eggq51WEUu6ZtUN09Lh2fJeQ+a67nerbpP/AMyScG4y9395KC3AQAKQvs6eljJCtlk64zCk1fHkxXCFl74FJcPpUJH8VGJO3+HvHoA9FC1vCOhBSTa7y8efauwpBzI2aEDijsAq2+e7PQFyYlUqsJ5mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=AtLXygVL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="AtLXygVL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49978908b35so7918255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762145; x=1788366945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2OUdL17iweLbkwDhh4IsnYuPIiYki9paBB+a21GlgG8=;
        b=AtLXygVLGPdhr1+oyJQZfBkm4TSMle0gnZXuras/TtO1YCldVgg1tEXHxQXbovROtR
         Yd9VZESJ4QzRAdBxkZhawZ0emO1vAeZIo22EopwzC00+9u0KwnITz4eai30AcKwK/Z8i
         mR2ekfQiNMvwLiA6Q70euUw5ZJaJnr0KKBZe9mkzRMpnbaF/mQkDW8nl7fPudt433V2S
         PCAdVgCNK5nScOD5MvyMwKH26L4KuYY5g3JEc1+bTIHB2iMe95NvnuOnDHetqWGYkWCQ
         11m0eS27PStXAhoXOC8W0Iue/zCfLwQ067NNIXkvJS+iRZc8x7IczKnwIaw9NIl4za0G
         5k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762145; x=1788366945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OUdL17iweLbkwDhh4IsnYuPIiYki9paBB+a21GlgG8=;
        b=si5OILnfOZw2umeQKTeytbCLEx9bHVo3aOHMYNlEkiVujFkJgc4YWgTRYm62gs1Wal
         2TbdCjH9Qe6UEEr8Th9qyGRsrNAyyej/Ui7Ck0kUATYMnpNvtSeuRQ/sBD7uRw81WETB
         BMlsKBsv7jGltvhAakZZkYXPkf1k5WAWufe+N4gsni+1XNLqNo/ZrCixCgDu1NlP2bZF
         jcvRY7nvH6UYQJ1jbap1p4jIMx2BHc2G5/XchymvtfgH74Z9ZzVlUSgz4gj0avGYYx2p
         QJOJttEIIEieWsMQnlr1G1u/ONCZDianQoiLTxl/vTo/xh2UvvYhb63Q7XaPrayGYrPJ
         OiOg==
X-Forwarded-Encrypted: i=1; AHgh+RqHAEt175zz8GYFXJXxqeCELeFRmJJuQo7kWkYYDDLXTXF9e6mnDCREgaHkASRKH+VCvbAYg3GUUUflOzo=@vger.kernel.org
X-Gm-Message-State: AFuF++nF6jF4wPx0q1U26VmWtpDXuc1FCxUmAWlKVDBZ25kCqdl1sdDz
	qmL6X1mKXGNTkpMxcZWZNvFzHWGchSIuCFLgZ4Fq1an3IeP7elxBtTXxs6Z0zKerHQ==
X-Gm-Gg: AR+sD13m1424txY7/ahggjUwxq/iRjAg772+Tz4mCx5k1CJcVRtzjztnyf8uGyEzg+9
	nZ4H+FECj0rntSkbQd2ontZ2TpOKOmtyuBvsIZr+DKR+4lJCZUqq4rBxVyDJqFGWZiPXP6FJCGF
	ifHf6YlV/6tulb8zyh6CUArm2WTLWi17f9RWzeekQmTou6DZwMhB/db/EtS+/09rzTD5xrjTo3X
	IbQ6CRbNIcUxYYECSzam6ypX73tnwMcgPgcTUGGqfL0Dy9+upogkM1+6n4gd4YuDzUJfwtehYtt
	/7kA5Ub23tfVR1wrRZOdGmxI3tce/KH46/A6a3rY15NNrF5OAiTi8gPgp4JURMNtC3yb+IdIU+J
	OXM1Te/wHWJNDNUs1QQDG9TCDExFUcOqM2Qmvsi+h53ik3MwB4z5Dh82N6vgf3LdR/L2yIRMEs3
	G8TULW8tlnQq6p2YBN8oLIj4/4/JI3KdrTDQeznDKgaXpbrm+pTDgZgxJ2QTkzAf/kmWLfUwnfD
	CE9zqe2AYCkMh7OarTH7qZLfcshSWcet7r6qliofR/jtLDY
X-Received: by 2002:a05:600c:3f0e:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499dc825cfamr95483725e9.14.1787762145530;
        Wed, 26 Aug 2026 09:35:45 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:44 -0700 (PDT)
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
Subject: [PATCH v3 11/23] rust: drm: kms: expose checked plane geometry
Date: Wed, 26 Aug 2026 17:31:42 +0100
Message-ID: <20260826163359.4998-12-mike@fireburn.co.uk>
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

Expose the requested source rectangle and the visibility and clipped
rectangles produced by drm_atomic_helper_check_plane_state().

Keep 16.16 source coordinates explicit at the raw-state
boundary. Convert helper-clipped source coordinates to integer pixels
only after rejecting negative or fractional values, and return the
clipped destination in CRTC coordinates.

These generic accessors let Rust KMS drivers implement cursor
clipping and validate full-frame scanout without reaching into
generated bindings.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 3bff4091abb2..bc830503b142 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -758,6 +758,65 @@ fn crtc_h(&self) -> u32 {
         self.as_raw().crtc_h
     }
 
+    /// Return the requested source X coordinate in 16.16 fixed-point pixels.
+    fn source_x_16_16(&self) -> u32 {
+        self.as_raw().src_x
+    }
+
+    /// Return the requested source Y coordinate in 16.16 fixed-point pixels.
+    fn source_y_16_16(&self) -> u32 {
+        self.as_raw().src_y
+    }
+
+    /// Return the requested source width in 16.16 fixed-point pixels.
+    fn source_width_16_16(&self) -> u32 {
+        self.as_raw().src_w
+    }
+
+    /// Return the requested source height in 16.16 fixed-point pixels.
+    fn source_height_16_16(&self) -> u32 {
+        self.as_raw().src_h
+    }
+
+    /// Return whether [`Self::atomic_helper_check`] found any visible part of the plane.
+    fn visible(&self) -> bool {
+        self.as_raw().visible
+    }
+
+    /// Return the helper-clipped source rectangle in integer framebuffer pixels.
+    ///
+    /// This is valid after [`Self::atomic_helper_check`]. Fractional source coordinates are
+    /// rejected with [`EINVAL`].
+    fn visible_source(&self) -> Result<Option<Rect>> {
+        if !self.visible() {
+            return Ok(None);
+        }
+
+        let src = &self.as_raw().src;
+        if src.x1 < 0
+            || src.y1 < 0
+            || src.x2 < 0
+            || src.y2 < 0
+            || (src.x1 | src.y1 | src.x2 | src.y2) & 0xffff != 0
+        {
+            return Err(EINVAL);
+        }
+
+        Ok(Some(Rect {
+            x1: src.x1 >> 16,
+            y1: src.y1 >> 16,
+            x2: src.x2 >> 16,
+            y2: src.y2 >> 16,
+        }))
+    }
+
+    /// Return the helper-clipped destination rectangle in CRTC pixels.
+    ///
+    /// This is valid after [`Self::atomic_helper_check`].
+    fn visible_destination(&self) -> Option<Rect> {
+        self.visible().then(|| Rect::from_raw(&self.as_raw().dst))
+    }
+
     /// The plane's rotation/reflection (`DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*` bitmask), for a
     /// plane with a rotation property (see
     /// [`UnregisteredPlane::create_rotation_property`]). Defaults to `DRM_MODE_ROTATE_0`.
