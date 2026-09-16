Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676AD47ECDD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593530; cv=none; b=n/61s8HdWI8v2JySvoRJrlJXb1En64GkalAdAtBJHYN3ZWGyjHhGo6MriIbC6akzC9BsQKk08/sleYVXEPC9a5EQz4XNRoC/xkytkJ1P1RbFyZ2ZYjXrI096EvI2ERuRQzdiVQbgTLJKFhoTa0h+pUUZtvuoGB6xChCHfSpCpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593530; c=relaxed/simple;
	bh=vOjv+oaZ+5xB8NjtW5/t7ANQZBpuoikuprd+/++G5ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ur9mbXi/h9m0492EJd1Fn264bpNIBBuIWtBr192GWn4PFd19NMGRrZVCJ7hy5pqnhkKdo9wdmQURTALgf7ZwYgcisy/8U9ZjeBCV+ZYIyZfr1gsb4b5QCmVSZSw8dRdJ+g056FXV0pRyObMHVdnixN3Q1pN9nHYADjft0REf/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=Ypo15nlP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="Ypo15nlP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so2451835e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789593512; x=1790198312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
        b=Ypo15nlP6c0UWOLpjw/sA27p9+77k/IQ+Gr7G3Vez1uFXbWKopzOpeJOy67s4gujpa
         r0RnSP1Udup71JVgOWdrZ4TcHPh5waoAPibWeGIJgJi2URWKvE+HCS2KJy2NPk/YEm2z
         NYPPlaUMJSeys7xiVmyCrc2BCTr9Lz0pQWevnFjt6nYoGr3uS6ngfmc2zXnvwYWioGpx
         kVAK7H/qq4X6y6e4Cc8s006ulH7Z07fv/Di+smm9D3lyFxm1UiGMjKy8Vs6eN23ve4bT
         IPnj+q2mLNcr0IAG6rP1h0HF++X0oXImKoR/oC6DD1tf8f2cH43DH4+vTaxp1o1rxI/G
         HtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593512; x=1790198312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
        b=IGjny3qCFTb6d1ShA9FLwReRkTXQw9K4ykDvcpYgDd0qbdpylzX++6M3PHAu3OauUb
         eZZvJShkwwFdFEnrDVh1Zr9J5iVF09N8piYIGj2plZrg0x4yTai1R501Ixuh5jnHxZ0M
         M/cP5FTHrcYgz8HzxTqR1gRzLdLuswOcFBoByWV4Dri7wRK1VPFCYNQaVyT/1HfufNO6
         u9xKewtMh7Lki1hLQM+r4SebjJj5o4hv0HY2PejbCdDqNwlrlAuT3VsniUoW/s1ByUHb
         ww5SR1wsRweI3WNkZZ1hBvpaklpN8On5PpSbuS0l956TMia2GTURSiekME8FnO9l2i1u
         J9UQ==
X-Gm-Message-State: AFuF++mhEIHUPeSNJ2MTKjsof+tVumVvs414WBmvIFcCHl+BFI5qZ7eC
	2VMJwhJm/VZeemK88YBbA0HweBdZ1VUdnNDW61kQqcbdHneDAcZJ7Kc7/fVc866FLtPk6LAl9lT
	T75XBoA==
X-Gm-Gg: AYBFou07IXm3YDdsgQWFHVrZHQD3XQEXVAoklm1H2/MiktlatlOC3UH5kKZyNlPLKgb
	LZOOb0hRf/yPR51oo2gko5lDiGZUuN0qGFUm8IDo1DVFiVxUzC3O0C7B1x3O6EqetUtoHR7x2uJ
	4dKKylKrVan4/oeq8eOjlAFAT1VTrm1jo2X3cOYJYFdzIzsXMPH4qqPehrfAaF/Sek53hxslUCW
	RifKCReDnX1lr0qWx9P+bC4iWsMpatvV8KtB7M1uRN7veOeSF0mfVLvRFZeOBecRIh3o9o7MbQR
	lklWTdzS1wnzGI+ArnSduVItGa3Dt17tYgLaTov9h7GppT2Pp5LQkwqA+QU3zVBSi3jBB3Gh1kP
	QX/pIEORMHTrlquDHQMr72ZP7SUnmeIdEBNA9M2fMT/rBLBMKqHe3PZ7fLL73laf5BFLoEZjOTj
	ec0wX7BG/Ha5T0/ijHALkSPujkSi91SKKJfkCmqoyR7kWWvRN7gQxjPQNVgqAk8nnLFjmDE98o1
	dzAuWTTph5VFLObtFoVgJH5yQ==
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49ebb4297c4mr52763795e9.24.1789593511641;
        Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbd83e39sm46567695e9.4.2026.09.16.14.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/drrs: Ignore sync polarity when matching modes
Date: Wed, 16 Sep 2026 22:18:30 +0100
Message-ID: <6436114aa461b08bf0abddadf2c091c45dc81075.1789593508.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some panels advertise DRRS modes with matching timings but different sync
polarities. is_alt_drrs_mode() currently includes DRM_MODE_MATCH_FLAGS and
rejects such pairs.

Commit 2bd0db4b3f0b ("drm/i915: Allow panel fixed modes to have differing
sync polarities") already made is_alt_fixed_mode() ignore H/V sync polarity
because panels can declare alternate modes with different values and
Windows/GOP accepts them. Apply the same rule when matching DRRS modes.
Continue to require matching timings, 3D flags, and all other mode flags.

Tested: BOE NE160QAM-NZ1 (3840x2400); DRRS reached low refresh.
Tested: Huawei 23040676 (2520x1680); DRRS reached low refresh.
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 81e638d0c7b3..e79c51a1c33c 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -144,10 +144,13 @@ intel_panel_fixed_mode(struct intel_connector *connector,
 static bool is_alt_drrs_mode(const struct drm_display_mode *mode,
 			     const struct drm_display_mode *preferred_mode)
 {
+	u32 sync_flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC |
+		DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC;
+
 	return drm_mode_match(mode, preferred_mode,
 			      DRM_MODE_MATCH_TIMINGS |
-			      DRM_MODE_MATCH_FLAGS |
 			      DRM_MODE_MATCH_3D_FLAGS) &&
+		(mode->flags & ~sync_flags) == (preferred_mode->flags & ~sync_flags) &&
 		mode->clock != preferred_mode->clock;
 }
 
