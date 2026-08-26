Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7D471259
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762187; cv=none; b=sevz2xvyRJxGv/w9klDM4k68fFQToC11rotmqDG4gc1WxaDdz8Q9t+h7+Vh4Sybr9LfSxLtTIsdbKtj/PZBMPmvSI9i5GDUTGwr9tIy9nPg4oEFM99dE0mzj+BtcVmRID74OKTQOseEVjSkDJe/81phXeDkVKcGmGiecW/sMKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762187; c=relaxed/simple;
	bh=Y7VjXlDQgp/aKeZnfRWcQRiSV5T5cNHT60JqrhFIbK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWaaoBpf3FaOQIMFY+qGPSTfu2aB6NwC9MYuX+r9hYyugObykEVj24pzJEXtpEsqYT58ozM25hRaIySsMzHuYogWP72GmVdJ5Epibj06vs75DPVYwZw7WumZYObp6KNN6bQxTViETGsYdXvBCT9wxu2hXKaIvkmB1sSMixA3Jos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=z5hMej3Y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="z5hMej3Y"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so9264425e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762174; x=1788366974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lg0T4eac/Y9rCRkDaKLkO7bKQ8WziroJWF3w/38eu1A=;
        b=z5hMej3YNIG1eTuTCIN0Nf1XT1p5IqA0IOSE+MGJJdN9q7HpIbUymC1yGw+r+AzCM2
         Uq9HbGV1zt88HfAnlORzptCTkQSCzGm0/MOjDKbSKfZksgGGRMgnlu1NAI7emitzGQTC
         C6Hshcdsj2tkWgVRXSi/1IR4iIOL/RNAaEJv6/aH05tlFOB+cdHaCSVQEzYS+WxNH0cf
         u/IgXwuy90EjBHZvtuvLmeCgsXq4XkbalA+46aKtMufVbCrrR6BAQrxJtYJPH3Wt6uzs
         gHRoSxPsj/4spWZvMK9iNX5s5TrZX4RToEUVqs8Sy3uXOFrRbvX2nLEvgtEZxTqqYXhB
         I0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762174; x=1788366974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg0T4eac/Y9rCRkDaKLkO7bKQ8WziroJWF3w/38eu1A=;
        b=ksmGv+PoVmO+LDleHIp3BV/XIphFmSjmuJo/6h/ycwmKlECe1rGTyMLveKl2aTXCfz
         Oz2RYfTWSgLmPyXm3s/0J8QABDNNOmzzKx09uGU8s6Z4RCtoehEXWBmJ2wXM4owZCaDG
         SHkmCwJQI8alsro6zNAEMuk5I8GquF7lEpcmRG0Ehzmw5xdA9SWQBOsIR+pdf2MDo3lJ
         jYUZTXQrhVkj/ADSaVhAHXwA+NCvbUsl55cJMrXJrWd/DlV00V0wTw9KIiY8a3NK0j4v
         vhyLz1S1Ad4yf9BiZtCR0Pz7+DrILu9Zi+8nt1MkPJGnfDd4LPXt+3DDAXearIFVdFBG
         sQTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBgdt5Dtx3dlsPyhmTSkbOS0yyP+SK5tw9xoezsRKzvlLnLfkY0W3BadxfNl8ArNyJbsda27pY1vGAWes=@vger.kernel.org
X-Gm-Message-State: AFuF++n1x3iqe2huX3LxQPhahXfY/btQe6sX4UE1JrABO4epyRgjOAiF
	jeJJTs5rPLW1UQXQYprf0X8PtOTnEmXUIb3GIjh7Sq2XhSGYEntl3YidAfQqS5LbwA==
X-Gm-Gg: AR+sD10BIQWf+D8js4QTGxdlvz5TRFRj9RlwtCXY/r6Vxsie2E4ekIvHQ2tW7e6ZzU2
	yuQKro5gX4ArT/hydSn/370sxGqd/RKvItLc25WBZojK0Uo1rRFf+NoqAdP1p9VkdE4VWm5eL0R
	0pV0IdgAsF8DvRT0AJUWFUQ7DCXVzmw4j8aPEOZMRcI+REL7Sv0Qtk0TGbRLyUXv8qAGXx9IFJB
	g41XfKPx46PA1FgUxDlQbeIXRT+w/OShsx1gUu3G68YDxUB3bI5rzyr/CbiuMqM13AGPXiVh2ej
	IB4U/OWfW/YTjj8VLXTjYO85XaPuqU7MnK4S72lDrl8DCNuuswe4dy2IWTVy1RbxKh1pCilj+Z1
	W88r+2yHFv0WLBxRpVLq5R2SjGFqtAlc63wv7PXx/3UKz69oo+Myv390rQBWEdpZw+h24gQgZR7
	yjg5z9Wk1nZB2JJ2exhZ6R0IyiTCUnM53REIOaoEKBPh8QfGvLKueGS0D+mZZpsuQE8H9hSDqas
	zR1gQed0enumDGsGeW1eUWps9FYLJa78R6C
X-Received: by 2002:a05:600c:3105:b0:49a:5b88:f54f with SMTP id 5b1f17b1804b1-49a5b890381mr45490455e9.15.1787762174080;
        Wed, 26 Aug 2026 09:36:14 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:12 -0700 (PDT)
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
Subject: [PATCH v3 16/23] rust: drm: kms: add the plane blend-mode property
Date: Wed, 26 Aug 2026 17:31:47 +0100
Message-ID: <20260826163359.4998-17-mike@fireburn.co.uk>
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

Expose drm_plane_create_blend_mode_property() so Rust KMS drivers
advertising alpha formats can declare how userspace should interpret
the alpha channel.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/plane.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 62de8a1dad19..f148aed812f2 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -459,6 +459,22 @@ pub fn enable_fb_damage_clips(&self) {
         // registration is exactly what this helper is for.
         unsafe { bindings::drm_plane_enable_fb_damage_clips(self.as_raw()) }
     }
+
+    /// Attaches the `pixel blend mode` property to this plane.
+    ///
+    /// `supported_modes` is a bitmask of `BIT(DRM_MODE_BLEND_*)`; `DRM_MODE_BLEND_PREMULTI` must
+    /// always be included. Any plane that advertises a pixel format with an alpha channel is
+    /// required to have this property -- `drm_mode_config_validate()` `WARN`s at registration
+    /// otherwise, because userspace has no way to know how the alpha will be interpreted.
+    ///
+    /// Call this during [`KmsDriver::create_objects`](crate::drm::kms::KmsDriver::create_objects),
+    /// before the device is registered.
+    pub fn create_blend_mode_property(&self, supported_modes: BlendModes) -> Result {
+        // SAFETY: `as_raw()` is a valid, not-yet-registered plane.
+        to_result(unsafe {
+            bindings::drm_plane_create_blend_mode_property(self.as_raw(), supported_modes.bits())
+        })
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_plane`] interface.
