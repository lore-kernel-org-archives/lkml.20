Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582916;
	b=VqlASfM7D+YTdPALt1ge8VaEQ/GCH6ARzN+gknuWbzH76WCqs3tdTCNPfRCYOsb8Tazf
	 G7CT10JIiyxjhkGXFoG82mWXTdkyyBfmiguwTNk9heHNtuFJDjtAlLaaSbB/3TXTeDtp2
	 /byNeVJY1F/66KHyLEiGYVC7GRod9Mgw/lpPqFpAHbtGK+i9EbTR705p6pq8I2AfRMm3T
	 2W/b+RqM7S12lmS+i5g1en6b46HY5Zm1nV7SDYj1/3wX/7P+SLotwrbEh3m5lG4CidUcn
	 XV0uNAh1exFp//dd6r6BkYzBIM4hQ8Qmh5kJokay6Jjr0xh0ZtsumHmlrvaA+S+5ayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
	b=BbgFmCbKkPvtx3jZWCQ609mCqdcuxHmpAJs+v6ncWnhYIn/iX9r8f3Hc9VRjz3i74P0+
	 r6nd1MJOTzZpFbWuQtXQF2piFP8IwkhXlYSU2xzG3fR+OA4okiBfqmdQDAekY641IiSHi
	 W3aGF69zRJXAhistC8GAViUPYHvjrGf8mkZNplrA8Xc8yw8iyVOsfjKEdD/C4oPVP+fyP
	 jj/TZ5MvYasJpFsMMf0UKZm2ay9kKFjwwjvusQqpoYdUjjKMcsRD1K/hOZnJQOGRauhBW
	 5mYRhel2jVYuUEaDETv96nkbgoK+QdKEOaeOeBVtIvyG0tnjpJBPO6Fh2tKGZlrvg+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DWJB/3lE";
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4EB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWJB/3lE
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c33cc572e6so487529137.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582915; x=1793187715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
        b=DWJB/3lEyJDsK5CVCdVimSRiQ46qp9ROGxJw+cLeNYUR5pFdN/XgUCEB6oOSejCjdh
         UHmmSd+z3ZcHEscSt47kDR4iVFebj/QOCPd0zwMDVBENJhbDZxL7d6u700pU2E9sWb2x
         l0XGwCX2QxIJcr/FrwEgpVMBllHF0OxGgiMUqZlwfFxsvEWh7qYCFHJ/LVYphapALAmr
         NEPqS+huX1W4OwEa1nWeuD3WP8gpMJxsL40r+0XCFchlCqBFUhx/NSkQbWDduZ10CVzU
         BZi5eURYEx/IvyaEi6XRkNNQlC6yGZuk5FC9N0C8u+s/7OVsR8EtkKeG21Rx+tPPr8Jh
         A/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582915; x=1793187715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzvnC7BX4lHpgCzhnJO5oI/EjW4Sy80MjAmOtqEc83U=;
        b=z5cYbCZdd0xlIV/ZCJWv9mOBCBbUUMlawj98AzqtoSsUhsL/i6JVr2v1FoM+xxlogj
         C/59p+A/gbG3iMWLQF1bEIgEIbJ9023qMR9BV2AzCECcPfNWAUN2uxyH63k0qrgjAeGy
         7OViWSSInDUUUOrVjJiH4otyuQ18Pu8+8dl1LVlvgrB7t8GM+Jfa6O0f6oIrhOl1Uzsg
         xWNoSI3cDtPummhi3dONgG3XSQpHwJjuURxDqCFzQCtEpiW02rGWeG/T9MXGcWQojgDv
         z28z+0y4WGUrB+dc1aBPDe/oCWYvggG/DolonBYCB9xB+mJVSJaOzO2QNwTu86ks9elv
         EJfg==
X-Forwarded-Encrypted: i=1; AKwUvBxsWYMYKwRXI3PwMVUEpLSliuV6xfK+ULv8yRQwT/4NnTiuNM1X+z3jbW0hIjvSV7tp01DIwl5iR2iVCxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKwloNLsrpKtF3acpLXlknVoP/8jPgR4pWzQMUH2iE31GcJaY+
	2uadGtkAKZrF4s1YADdXUidwZXsprWRZ6rEDQGonw7+rtAVrBZmWhDlk
X-Gm-Gg: AYBFou0GVWnWZAsK7dJT4pPwUcQ6abHL8JiPsPxp83SJUK0Jrwt+dVPaYkpz6+TSUwi
	AnX8iFEyls3Cae/emU74/yDDs6X3rkTAwQxzpjfLQy0ISycgxIX+tdElWKT8UjzYxxq53LMuHwa
	y/YqmvB6st+mHP2L8/ZSsYzP3SRvfCSPzllIYHOGrI3Jr3R43KfTQPrXJaIoms1Qu/Ed7ChQKnn
	mbHXztcOEjgbUohmzr9eWbDN/6lYY7u65HZ4ntKgQ+CSOJVkzJlNTZFBTFAcbgLYUbXW+skC5W+
	q25Q0kKUsqb4/T0AyUYzVvLGQvMw0Q8tecxn/L6j8+lQtqsp0wHIFuE+U0ZMpW4OjYzVPB4A3MM
	f8ggUPan+7UqhzAmqK6dpG2bsfu6GWyDc/5ePIFrvZAH1iklC7IznaNbETSp4mKWK9U1I903ocV
	DA/5BU1s1Xm3wekYp6AUW7rr8c/ZuBjGa9brM6RHideieisAkveM6kVrcVeuSDg3R/kDuN85bIO
	x5ChGIT0OfhZPwLin0E1ceBqckCujf7IgQ4QxJVQj7nbQZ318J7jzq9OJJRh8TY9Kom2b5b9X15
	LNVCyzpb6iJyA2Yg
X-Received: by 2002:a05:6102:21cd:b0:7ca:9674:a58f with SMTP id ada2fe7eead31-7cc7bcdf51amr931833137.32.1792582915474;
        Wed, 21 Oct 2026 04:41:55 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc91f9c7f1sm2365006137.0.2026.10.21.04.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:41:55 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
Date: Wed, 21 Oct 2026 08:41:17 -0300
Message-ID: <20261021114122.94008-2-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021114122.94008-1-mptagliari@gmail.com>
References: <20261021114122.94008-1-mptagliari@gmail.com>
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

radeon_vce_fence_emit() ends every VCE fence with VCE_CMD_TRAP, which
raises the VCE trap interrupt (IH src_id 167).  cik_irq_process()
handles it by calling radeon_fence_process() for the matching VCE ring,
but si_irq_process() and evergreen_irq_process(), which serve the other
ASICs with VCE1 (SI and Trinity/Richland), have no case for it.

Add the same handling.  The trap interrupt is not enabled on these
ASICs yet, so this does not change behaviour on its own; the next patch
enables it.

The SI part was tested together with the next patch.  The Trinity part
mirrors the CIK and SI code and has not been tested on Trinity/Richland
hardware.

Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
Cc: stable@vger.kernel.org
Signed-off-by: Matheus Tagliari <mptagliari@gmail.com>
---
 drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
 drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 3cbc6eedb..eb94916c8 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -4847,6 +4847,20 @@ int evergreen_irq_process(struct radeon_device *rdev)
 			drm_dbg(ddev, "IH: UVD int: 0x%08x\n", src_data);
 			radeon_fence_process(rdev, R600_RING_TYPE_UVD_INDEX);
 			break;
+		case 167: /* VCE */
+			drm_dbg(ddev, "IH: VCE int: 0x%08x\n", src_data);
+			switch (src_data) {
+			case 0:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE1_INDEX);
+				break;
+			case 1:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE2_INDEX);
+				break;
+			default:
+				drm_err(ddev, "Unhandled interrupt: %d %d\n", src_id, src_data);
+				break;
+			}
+			break;
 		case 146:
 		case 147:
 			addr = RREG32(VM_CONTEXT1_PROTECTION_FAULT_ADDR);
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 4681ff286..af3c4026d 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -6347,6 +6347,20 @@ int si_irq_process(struct radeon_device *rdev)
 			DRM_DEBUG("IH: UVD int: 0x%08x\n", src_data);
 			radeon_fence_process(rdev, R600_RING_TYPE_UVD_INDEX);
 			break;
+		case 167: /* VCE */
+			DRM_DEBUG("IH: VCE int: 0x%08x\n", src_data);
+			switch (src_data) {
+			case 0:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE1_INDEX);
+				break;
+			case 1:
+				radeon_fence_process(rdev, TN_RING_TYPE_VCE2_INDEX);
+				break;
+			default:
+				DRM_ERROR("Unhandled interrupt: %d %d\n", src_id, src_data);
+				break;
+			}
+			break;
 		case 146:
 		case 147:
 			addr = RREG32(VM_CONTEXT1_PROTECTION_FAULT_ADDR);
-- 
2.47.3

