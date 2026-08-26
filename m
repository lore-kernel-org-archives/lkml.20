Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27246F4AF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762194; cv=none; b=dyX705w9hwVYgC4AEdl2CXkkvxBuXBUe4FuZSxeTgyOs58+SK0YykhmPmuKJDNrfq8pwDQQsGUGbpQq6VjL6UtxkSdxz83ffAFyy6Ko70EGl4OdZLgLab3+Zm/iCe+iVmIZqanvP2z9mvX6w+ljomB1fnNiaJL/wm5rJe5E/8Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762194; c=relaxed/simple;
	bh=uxy81Zi5nQv9TZNXSqJV9XlHTuBekJSMAz2Em3fQbA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRSX1YaMk0NDWhgI2sQFzjJfZZkkjMq55/QHV2jQX50YYSji+cSJVSUAL/sn8PS/oAlcG6YxGDtsLcGoSO4Jbxa325FecZYh81byNWFe7J4iuT9vuI91Hv3FhfU9WVxXxohStCtNLdUEmoY9JZC21IsjkPOus++rDWTmIVLn3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=wRGSrY3h; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="wRGSrY3h"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so8733135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762179; x=1788366979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suzR7ASY40M8VgE4lgqLDHANl8DdGYCBb6jwppDWyAA=;
        b=wRGSrY3hcOzYffPlYKDhiVzQpXHElhT1xfAVaiNO14EHtSgbfrMmtJtSwZGNsD8o2G
         Rvtf9sh2Uy/Q2QsQVyH5dLzGhT29FQbKAjR51Vq+wqR3/APJPPEop+Dhh+6gAPhuX1Pw
         DmFLjdhARJZe/wg65VZLZvg/KjwAj27pdUZDqxhPgow98YQ2a2uegc3TjpgnPhpJhcoM
         WlB+IC3BM3F2OCyodlBVO90xUv7ThTL8dYu90AmI7bu4pW7AqSqPCfPCUaVWHsLv369c
         lK8Rj0quao7WASyQqZfgihJtCuDPKuW++MSicxy3Exhr78FtZwLYURPxBBUQJvdv5xj1
         21Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762179; x=1788366979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=suzR7ASY40M8VgE4lgqLDHANl8DdGYCBb6jwppDWyAA=;
        b=fv+6rvo9ywyMTCjuKVEl1kzZRXguShH500nTo1K0U4Jsgzx+AuHCkyDT5aZ//e0AV4
         TpJsFv5fffgUD3fp2JCv7WQRKzIBoRdFcD1F/q+BLxBpDnf0Gv1pBPC3JwGB8WFVGfyd
         LCMfGOz6jfYdPozaqcTwPCYU5rzm3t4jeEdODv+7iSCu0tNXqlafBtRYuVxTyOzKxbeX
         Q5yYn12S0eOHvphpbwaqwZS+oklUcz9CExP/ofoD1LYLYTg7g9RKmmP13/rBKJalBKqq
         Uk90FxS64SDI9Q5kv6gubHDGFmH8Iglm/wQ2Yus4CIozrich9Rs5gwMdWtfQ+fBiGyNZ
         92HA==
X-Forwarded-Encrypted: i=1; AHgh+RrizW0mAj1J4GFS8d5MhJPpJiJn1lXdjDYSJRwW8/tAQ0IxblHlC3n4Av421DGqp9TirC7qjgCdOSWTN/o=@vger.kernel.org
X-Gm-Message-State: AFuF++lrA038L9VtJLQe51ngQz5yr33l6RCYwxo2IZYKN/RR7IzDTSsM
	858eiZQYdAt3SOUI94zNPgWD0KqIk8YME1GTH7OeMfDr4s2B43K2KXkZXBDzxE1agw==
X-Gm-Gg: AR+sD10rYk1d04idYOf1RHwvV0zkwlKsoar2S7PXUfz8kF23DOnhAh0fSwYnZJJwHRr
	vTpnxPpF/GwZC1xghYfDpjng1TZdy5WyqK97vwPmHJ3w0HBdS43ENBtPOtMM/D4VAMP2mRW/K+R
	Fre8ETST2YHLM/7lgcopWYFH2FIekrMlCdzPdMcX9zJxqCV78xM/pIuXU0B/lgXIuthlRCydLTw
	zHNyiUJ3/WWBg/eXMmiyH8vxREyCPZAXTzQLs2pFtUlR9PdhPblUxbvmzLUovEoGKPNNuLBwfXk
	DIzvjX+DJpVBjmW63sCOGKMOUAVb37ps+CRlKWhE+Yq+D7O8uRO6NYHxG9k69AXz0BgFG72DmU0
	dp+xVrjNOFJl2OEr/TLw4B6JTSPAsLLngAggRW6B7tds9J56I1/8SRomRa2JhNpu2Izwsx1EXiD
	hOw51zn8luM27F2P24mESu4QvFieq7GebMrbShiBidlcprxK9q74InU5FGuEKT4rBaVsVuJbrHq
	yUkgcsO01nK0yvzxvvjnJRHCMD1IVkqjAbBlWCubRRTfYo=
X-Received: by 2002:a05:600c:c8f:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-499dc6f68b5mr69481545e9.5.1787762178738;
        Wed, 26 Aug 2026 09:36:18 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:36:17 -0700 (PDT)
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
Subject: [PATCH v3 17/23] rust: drm: add an owned display mode constructor
Date: Wed, 26 Aug 2026 17:31:48 +0100
Message-ID: <20260826163359.4998-18-mike@fireburn.co.uk>
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

Add a safe constructor for standalone display modes used by drivers
and tests.

Accept the essential timing fields and reject invalid active, sync,
and total ordering before exposing the owned mode.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/modes.rs | 62 +++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/modes.rs b/rust/kernel/drm/kms/modes.rs
index cc3c486eecf1..b48a02edfc13 100644
--- a/rust/kernel/drm/kms/modes.rs
+++ b/rust/kernel/drm/kms/modes.rs
@@ -6,7 +6,33 @@
 
 use bindings;
 
-use crate::types::Opaque;
+use crate::{
+    error::{code::EINVAL, Result},
+    types::Opaque,
+};
+
+/// The essential timing fields of a display mode.
+#[derive(Clone, Copy)]
+pub struct ModeTimings {
+    /// Pixel clock in kHz.
+    pub clock_khz: i32,
+    /// Horizontal active pixels.
+    pub hdisplay: u16,
+    /// Start of the horizontal sync pulse.
+    pub hsync_start: u16,
+    /// End of the horizontal sync pulse.
+    pub hsync_end: u16,
+    /// Total horizontal pixels including blanking.
+    pub htotal: u16,
+    /// Vertical active lines.
+    pub vdisplay: u16,
+    /// Start of the vertical sync pulse.
+    pub vsync_start: u16,
+    /// End of the vertical sync pulse.
+    pub vsync_end: u16,
+    /// Total vertical lines including blanking.
+    pub vtotal: u16,
+}
 
 /// DRM kernel-internal display mode structure.
 ///
@@ -30,6 +56,40 @@ unsafe impl Send for DisplayMode {}
 unsafe impl Sync for DisplayMode {}
 
 impl DisplayMode {
+    /// Creates a standalone display mode from validated timings.
+    ///
+    /// This is useful when a driver needs an owned mode for validation or tests rather than a
+    /// reference to a mode owned by the DRM core.
+    pub fn from_timings(t: ModeTimings) -> Result<Self> {
+        if t.clock_khz <= 0
+            || t.hdisplay == 0
+            || t.hdisplay > t.hsync_start
+            || t.hsync_start > t.hsync_end
+            || t.hsync_end > t.htotal
+            || t.vdisplay == 0
+            || t.vdisplay > t.vsync_start
+            || t.vsync_start > t.vsync_end
+            || t.vsync_end > t.vtotal
+        {
+            return Err(EINVAL);
+        }
+
+        let mut mode = bindings::drm_display_mode::default();
+        mode.clock = t.clock_khz;
+        mode.hdisplay = t.hdisplay;
+        mode.hsync_start = t.hsync_start;
+        mode.hsync_end = t.hsync_end;
+        mode.htotal = t.htotal;
+        mode.vdisplay = t.vdisplay;
+        mode.vsync_start = t.vsync_start;
+        mode.vsync_end = t.vsync_end;
+        mode.vtotal = t.vtotal;
+
+        Ok(Self {
+            inner: Opaque::new(mode),
+        })
+    }
+
     /// Convert a raw pointer to a `struct drm_display_mode` into an immutable [`DisplayMode`] ref.
     ///
     /// # SAFETY
