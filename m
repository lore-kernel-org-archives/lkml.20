Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499133;
	b=cCzm/k+289z9tUnXzp59VUIi6QH2dFQBhc41rV5m80S2URrubcNIpGflXso4d1r0ijqy
	 0Uk3/RIRHT9xahun1WOr71HyvJg53lDO4XN6YeCEROj73Ih5cv+g4qWUJN7rcCN6+c2i3
	 Co1/uQl4jxpvrb6v3422hdHLeW27VYDlwJ8Gid/g4ebh2nDY4eLk3IdlDwPsF3JI1qpwm
	 0zat3Fe015ssw/0NezNMEm6tGoZAfaG6Sc7VvxkYlJUlOIYMaX2chODQNdexolSa1ODWs
	 wbcQHHc1UH3ooh6XDsGrMPu8D6fxXKIEdWB1jc8XBrzeCi3L+eYNFc0WjzsuZtktIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PBaR9YGz0f77rnkIf9yudCqFA3ukRsghy48xQHT8H54=;
	b=kJEKue1ur/sHHNQQzXnViazhCs7uDTuSkZ/xnHZGjV80nCQ5QGTaKPOTTP/fDfJQVuI5
	 K4CWS45KloJsRGyyKU/6rnJq46ySDQgRHpPtrmC/q6y1SRAC/aK3xzInZv7IMeS5BzFK2
	 Ose9zMBVMf7B7RJ+bKi2U2ZWWZTCUXNGFey48VQEhYmlblhWDnE1j7HCsHuVHN9q6QZjy
	 NPhW604UftXXjmm497eq8kKevnfFRbevJW4eFSs+za71/rsminVihY6JBp7GRLkSvpeOf
	 deRH2cgpQrEPVBpXDRtLoVF660X88Fss1NhfBsYUUyHJEqQP01TKcnN2cQE7gK8Ps3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnU+MoXS;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF972606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF972606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnU+MoXS
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb0f1b592bso52235ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499132; x=1795103932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBaR9YGz0f77rnkIf9yudCqFA3ukRsghy48xQHT8H54=;
        b=EnU+MoXS44HQLXPGBABwOGgBbq3c/nv5MuPJfzZlrr/XKHLepb1X78Pnh8fPHsxkzD
         eF+3SR2T2DwQgDpPtf/Iqu5gNPyEm9bmGYFwsxLbyczhxYdAyZ3XM13vtfP5OTEEjdzA
         QtpNA+inIcu8z7gy1eaKGvmYviOKDAG9yX1A+7dIeHqdAqaICHagzr0IeHR0vIF8XzkS
         aVxKmP3DVAvWF4yCVoP+eNL1WvNVZ2dQyW8L5u5Yr7evcaZwQ/7Xy515SsTJESndl9ye
         88jf8q2bp/jkRaKJPvTamApHbJad6QVCoS7I3D8+UOpC2eOLA09DnjbVFUVcaqAfIqGO
         wahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499132; x=1795103932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBaR9YGz0f77rnkIf9yudCqFA3ukRsghy48xQHT8H54=;
        b=NiUP67RTUlG9uO1sofvSDu0pmhm4ISt9bKpmioZX6wufO4RebDfUzSfRDpEeNn9XOS
         LR7BMauR9ErXUq08jYdo80cdrOCI/c3t4ixdKt/pwIuSp9WbdmZgOlrA+g+mPCE6fjvY
         +5JBH5Zh+vgTwNOWJtRRurldCgIYyElbCxfjck4hb8vDNyd6gEMuq/LKMBQddhrVE+N+
         IQRnLYsjGq90JRceIudBsDqLaRU/5mL5DEhu9rVRCC0rvyqVuLfCaO8URPKVMK9CQ9LE
         QAM3IQJ/rfj/q9v+DzPvlLqcKu+Upx1APcm3R6SHPFXxvoc6wIdDSPemSIhYkieoHkPM
         CDKg==
X-Forwarded-Encrypted: i=1; AL+hErGDsImdREV09xHkPsu8Blw5uHjt6ceDiZWOfnQXgBDM8x4/OntAjy8Y4TyO2iAt9yWDbS4wiG3e4XyoTpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GMwYhQyGNSVnbGncS511VeHXqWsov8bOc+xnrF48QHqZTQMnb
	pbpTzJ2hw5PuAfcCvUj91/AW2nZK9098DW7blg0ZYbk459f6ke74tcVe
X-Gm-Gg: AYBFou1du4AVQElqYOppTQAWj5LNkzX4BWAz+QagegYeXqvSI6/0HMnZqUq944hIRFV
	wEUczzDPwqdq7GooG4FncphE+8KuqzydyHAOfxMG4Jfc0PGDeENHlSOUCmZMazJ4DdZSDRjpiBR
	k5xXcEczNRhorzNaxuLdekmqPYsr5qvJe5+Au39mEmElmpiyxasljHMAm6sdRYD8MJw7FwzR/66
	LFVa0kNW1wYMYqKXccNoOgHMP9Ej0Kbox/wEuOEYemafXHG1motEsSPCR3eazHVbG6+vwoG9qc0
	9YGSQe8oKu336QTpUIWSGkhxiayAo6+KCIRYHmwYjgEylRBHaMHAsOn7n34lMTnjSS3K9W7ky87
	WTUl108k2wPLYLdnwVw3dSa6o0BFIZxCBMD2nYu+6keNtfaEl6Pchy1wGzV3NFzLMmE2MvERnEx
	2+eVFqkhY+7emAT8KTuAOR8TeiIElbt/ijVHOnM9e7KFZd40VHnQx2To5NBeYLiC0AHamh44mX3
	9hi28APPGiyw73+5d33N9FeOkWc+AFkz3f/Et+kXjwFepgwTH94LfX7CGrQ/7ZUeCzjWmWmSFgI
	Hk/kywzL8XmZVXNv/IA=
X-Received: by 2002:a17:903:1111:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2edd788d0bemr62363735ad.34.1794499131728;
        Thu, 12 Nov 2026 07:58:51 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b93csm35556945ad.14.2026.11.12.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:58:51 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: zhenyuw.linux@gmail.com,
	zhi.wang.linux@gmail.com,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] drm/i915/gvt: Fix NULL pointer dereference in slot switch
Date: Thu, 12 Nov 2026 23:58:22 +0800
Message-ID: <20261112155822.1336713-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The running slot is updated to the pending slot before updating the running
context. However, the condition checks the old running context instead of
the newly assigned running slot.

When no pending slot exists, running_slot becomes NULL. If the previous
running_context is non-NULL, the code attempts to access
running_slot->ctx[0], resulting in a NULL pointer dereference.

To fix this possible NULL pointer dereference, check running_slot instead
to ensure that running_context is updated only when a valid slot is
available.

Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/i915/gvt/execlist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index 29147a9f162e..763c310f2aaf 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -73,7 +73,7 @@ static void switch_virtual_execlist_slot(struct intel_vgpu_execlist *execlist)
 
 	execlist->running_slot = execlist->pending_slot;
 	execlist->pending_slot = NULL;
-	execlist->running_context = execlist->running_context ?
+	execlist->running_context = execlist->running_slot ?
 		&execlist->running_slot->ctx[0] : NULL;
 
 	gvt_dbg_el("[after] running slot %d/context %x pending slot %d\n",
-- 
2.43.0

