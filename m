Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C88470E8B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762177; cv=none; b=YhF853vKvhch6oCBmpCrIhT65CdN7+ag77Eela3FGuckwBEGwTaCS+5F+jDELBEeTiFhCorQ7jyCFVZXAmFcr2gs27rF+x/+OlqXthxImKi6H1q1vqyuwBBMOT2b805KyUEcx1UGO+3aRc3jOlSxFyfBR51uy4l8kXq/HEZH5qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762177; c=relaxed/simple;
	bh=yQ0pM9ZOnPii4Sm92oul1R9mC3eiZPYkUd6ztoSoOec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9xZ1qzLrQ9NfUEnW7+rKevXCNsjYHCbNtY8T3Bc0qz3CHdSTcGnJd/b1fhG7Wm+D2oQ2uBrFCOKriVjH4xxh5rJRV/WQDEhsgv4BTD2zyPl8E/FwCuOyMVGHba8VXQaRq0DwoQk/Enp5u1Wsl6SH6VMWKZkoeh2jch+SQJAcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=h+xZeIqz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="h+xZeIqz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so9735385e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762160; x=1788366960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nvAIuzjWICzRaerW41m6ADpOsCWM5ip30oIcAiVpx0=;
        b=h+xZeIqzvbTs/nnF+GfCKiP5t9mAU7Pj99LHVua4tW0ejjsaOt7n7UuVM+Q39wsnib
         jKXhSHxpEXh83xEf6jg+6cCCSfsgi0tnUSVs1ahcjFc9sZ/SjTKppG4BrtgcPB2hq69J
         z8zj3e4uo2GJPCgaCxpkkShIjgO9onPrwx9pgsIVrlXMspWoYO8JcKNYxPaLWCraBcgl
         xtHpQoj2Jj2hohH5iiqUNdbn40mohy0BZDiibucOkd9t9llaKdnvFdkiKsH46ry/jNP8
         uIUYNw8qStW9e6LENfYDwcrcOfHX9D4+KfEVlTqXTIWxwD/n7uWyLW1iCcNO3uNA9SwG
         nkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762160; x=1788366960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nvAIuzjWICzRaerW41m6ADpOsCWM5ip30oIcAiVpx0=;
        b=oACrfWcjlZwe9XDXsU5PW/kJDQrsuqr+MthVvRSF8XIDD1ANz4TPyA5OPk+KLzihZD
         eLvfLxVqiOjNwtVUf+vU7gFLpY/5MyJL0ZrKEIWpHTR5uAfuO+f693CuwlW1SZTcLND8
         8rEJi8eNwkdQ+jVe+iYgjPepIsotcJBJ2dvu2s4Mki6d0w9DrLzGgf+8n1DhauNu9Zaf
         3EjWU2nJ9GInahHUfbK+PcdBkUbkX4k+j3k4/+ZW9rM/Uh4LaVbC/RClz+jkOBan5nt7
         /E4PTPy/ktHtDVCAHmyiMkcknjTc/HPD1ZR2eseQQ9wj1d2KXz6M8l++nF32VVMunaH8
         mkfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNPhK7iuFbi/8d8ZD2R7GRp79Zhk8Um+VXHvIOuOU6oZUtiHQ6MnH9GfCxCT0YdW4h7eEvDRia3XkGVmU=@vger.kernel.org
X-Gm-Message-State: AFuF++l0zZrR0NUvVIXMXBlQGsC5nvrclmtANxc3L3EY7djIRV/l+ZX+
	RbYmF7TKRSZ5DeJ2gsBrIDzw4eVtTFswpcKGK0zRIW2z0wdJBH78IqoncexAKw0yzQ==
X-Gm-Gg: AR+sD10zRp9OzFScmsBzcv8RuDGmhAojJRkEYPyUMFj1BDlP9+hEaqKPkHbBW43aEXN
	7XRgWetRqRZDBpHrj/h9i2NDJtziGBNslequ6prgt03cgAyeTWaPN3j/teJfWeX7jkrKDBHrsI9
	SateJt64GksuVBbiTsKkPoW6hU0ZZpPzsXASvCyXtt/Q9pW4XEp6y1gno6yE6TcpCLmrAY0IhyM
	YtzbQC+gmU/RJ5RidnmJh8XxkcgwDS4P5jCuGV4m79b71mNS2aJeI/4dHoIVhr+jyXlyJgVU7ff
	I8/d47vX667C0DJ8+UhQIMAeNvyHVwDDIbOktW6OXfg96T6O7DSBfYYzMETeMO6f9Kms3IA89B+
	/4GW8vIaRuIgIARwTF/XYhnMjXWzIUNQdgs1MSeUFmTU5R0UAF+zejSsiMQ5N6iovP1GWWoGn5K
	41B9y9ietM3VPiV7pDKypx9HzquFOR8w/e1ypzggvfQ+/B5qUqfEpLJ4PFzj8lQ19W8FBAwE5tF
	HpfowV9QI0Nx/g=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr83360345e9.4.1787762160620;
        Wed, 26 Aug 2026 09:36:00 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:00 -0700 (PDT)
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/23] rust: drm: kms: plane: add FB_DAMAGE_CLIPS property support
Date: Wed, 26 Aug 2026 17:31:44 +0100
Message-ID: <20260826163359.4998-14-mike@fireburn.co.uk>
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

Userspace can only hand a driver the rectangles that actually changed
between two framebuffers if the plane advertises the FB_DAMAGE_CLIPS
property. Without it a compositor supplies nothing, and unchanged
commits are indistinguishable from missing damage information --
which forces a driver either to freeze or to re-send whole frames.

That matters most for drivers uploading their scanout over a slow link.
Wrap `drm_plane_enable_fb_damage_clips()` so a plane can attach
the property before registration, alongside the existing rotation
property helper.

The consumer is the vino DisplayLink driver, which encodes and sends
only the changed strips of each frame over USB.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index bc830503b142..62de8a1dad19 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -438,6 +438,27 @@ pub fn create_rotation_property(
             )
         })
     }
+
+    /// Attaches the `FB_DAMAGE_CLIPS` property to this plane.
+    ///
+    /// Userspace can then hand the driver the list of rectangles that actually changed between two
+    /// framebuffers, instead of leaving it to infer damage from a buffer swap. Drivers that upload
+    /// their scanout over a slow link -- USB display adapters especially -- need this to send only
+    /// the changed regions.
+    ///
+    /// Without the property attached, a compositor cannot supply clips at all: unchanged commits
+    /// arrive with an empty list, which is indistinguishable from "no damage information".
+    ///
+    /// The clips are read back through
+    /// [`RawPlaneState::damage_clips`](crate::drm::kms::plane::RawPlaneState::damage_clips).
+    ///
+    /// Call this during [`KmsDriver::create_objects`](crate::drm::kms::KmsDriver::create_objects),
+    /// before the device is registered.
+    pub fn enable_fb_damage_clips(&self) {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane; attaching a property before
+        // registration is exactly what this helper is for.
+        unsafe { bindings::drm_plane_enable_fb_damage_clips(self.as_raw()) }
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
