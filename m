Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793539455;
	b=KRCm+/p7e9foycZ4PVs1ZmhBE7SNk/xVBX4hMBOaAKw9IecJRIXVFjeyV4onSTZBESJN
	 cjc5hG8Md/8JsngAy7Tvvrb8EZ0hl6DamGwhZxVxBaZ7hhqUKtSVqAsp8ua/8eB4SN9AN
	 PRFKkJpovTduU1OdnZv87HIDDhhCpbz3LueJxx2Jr3VJecTK7XWLOtYbtmGqQ4V3ZBlz/
	 zZSENs8kRHBvyhxFm9PkVh/hj8z8ZK9kap43nbxONegUtRqEkQ2Lr03qWEFLQJkbHWZHT
	 i9sdSrVqG7Bz8raNMOk+udMWzYAlyVpgdsWGY3fKy3cReEYjAP1pyErOqiihmmHNB8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793539455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LxDX9PzbtJZKyZGuacihFDO/9p8vV6pNspzhtvTNV8o=;
	b=y0MbFfSqFACeph/wb1qNdJZ/U6pQDQL/nczIrDAzxEbMjo516iALiKxCyvSRQebb8thW
	 s55QYGT/4X+XKqw1/J2f/lUdgnIq6RkR0WaeHVupb0X6hp0szg6ALlksurbWo/nOmIu2k
	 PypdzoPiRUL6cQs947aCtaFZ1GVWpAZGU4CkVtlvLbkXbwz0qtebTEsa79vRuHiAO1PEL
	 QSBppuvap/SEbAgc4ir1LijelYyapH/9Jurd1y0zbqL3UgC49KC0oKw+bgXHhFDy70poO
	 k4wJpe4LdpZtTQ5hfbbocw48ZGn0Y6gtR0GN77A0qJoMWy+YE6jT2aSxeNmTBdawwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ClHRboxS;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E43606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E43606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ClHRboxS
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b2d149b483so3245237b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793539452; x=1794144252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxDX9PzbtJZKyZGuacihFDO/9p8vV6pNspzhtvTNV8o=;
        b=ClHRboxSUwvo/QXyIGSiQSdWR0vTAmxV0+69T7rAv9c7YDVRHV0ACu3tY+4mjOBwKp
         Ve5v3MNJEdSzCBccwe6SOkYR8KnEnj3uJ9vIf+4NF3FUQQqOOvg+6b/en98HytGodHZd
         mi0o0CKDZqUcNaYgghikBJNATc7A/XQj+ePsq1nVWYlm7CbP4qu1Evcowl3GO4l1OnRw
         O5mZYHoH5c+tY/a1PXst4jw0zM+Y/Ey7gUwdUO/3IaI6DkN8hcKxXnO0bHo/GeKrW8MX
         qwonO9NILbYTNe/bxS2N2UkJxtnvcOsrZ1KwVKQfBY8bG4zwgmbpbux213k6mQPYAmFS
         s2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793539452; x=1794144252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxDX9PzbtJZKyZGuacihFDO/9p8vV6pNspzhtvTNV8o=;
        b=W4oJUo38YG+mPXQPQ3PrKNAcJ55TdUkgJJxi1zzgCZO4kmBiRrVBRMFabQwen/Ttts
         8qY5UsvkycU9MJP+3zws6/HCwEA+egmdm4ycXrVfImd3Eef6Rumv3FKnNoV4mVQPEwCC
         ZkJRoo74YoJdapXYqBRZGBNBBuQM5q7PcxP5VrQ+okFcEzIj5LA2cDsC0XwIAVQkDdVe
         TRtljivvmCNWmlPlf1scOFfAyZyCeP/5dHTzbiab+M97JfNTIZXi1rzq5RY+xH/tu2AH
         3MncoEexneR3oATxUVJMjveVI1GH/BWv3uT9o54TwLxAEDZ52pPWSMINJnP0QPq3iHjV
         G2jw==
X-Forwarded-Encrypted: i=1; AKwUvBxu+mWdxxbXlv+xcU8fH+amfum4EuMj/DPRIhdm2edLRrx2SKQskhxRLebkqGmP0+34pTT+ZWYVGkfQA7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9a9DGtwSfMR9kkoJ9/Fb5UFIgdcxkFmRKePsOhufdawYQxW/J
	+vCOS3Ohme+tU4TCsfV2oj+uKrHWz6g8wXQa1DRV63sb1DNzMyidx07BvKrcfxggNA==
X-Gm-Gg: AYBFou0YPRDs/4NOpw+IioIzKOkS1pingSh/NCDWhaZtEwOcF9oLMC0ZLl+Eyq/wv+L
	41QYXigJDts3JhGKDR2u8ary4gMg9QeyXfS6IU/HhGkzi6e2zEoxa7jEGvViXI6Sj4VObZhvMmi
	1Rm+KvJGBOTzSoBBIXUfXx4S4pCMbp7XlWA7Ru5F88d1J4HnU0xhjv1MREDDRnEnCEGNaW/SjNK
	iaxydF5gz/WjMGzXzT5wFPCUrCuEZvG5Zuc0jdg6nPmHj2NMVkp2gn8wQ4uDnUidNv29P3EQYqM
	VbCNRfGM0EBgcnLsCopurBqQSIKF3trmqHsKF8+JsteeHnvx3VXDhXUrFg5HyBSBgXvh3twOIuf
	bJoxtbTJPbvHB+TitkYAA5dHw21/HhxswcvKJpJH1uAiYbT5SOX2SCqGU1Eb2Xymdb+ZTP9q6RE
	je6ZCC1+8Fte72bwMJ1fmyJyGaYGdI7Rv16LgYTy+EOaUf+4G1dDcPeW6rdYNE4PpLvlKGxkuC4
	olmyC6BItbK4CYpfbtdbwTkrG6BuvydYuEVP/MB2szWd/3OAvmeJE0z4R9WJcX0hexSl8QvUwh+
	RkdKGunK8Rn4zElH
X-Received: by 2002:a05:690c:c4e5:b0:8b0:8b34:ede3 with SMTP id 00721157ae682-8b2b6594f0cmr48287597b3.3.1793539451749;
        Sun, 01 Nov 2026 05:24:11 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b704e62esm36685267b3.3.2026.11.01.05.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:24:10 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH v2] drm/amd/pm: remove dead code in smu7_patch_dependency_tables_with_leakage()
Date: Sun,  1 Nov 2026 22:24:05 +0900
Message-Id: <20261101132405.1387745-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114163807.2525868-1-ingyujang25@korea.ac.kr>
References: <20260114163807.2525868-1-ingyujang25@korea.ac.kr>
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

The smu7_patch_*() helpers called in this function only call the void
smu7_patch_ppt_v0_with_vdd_leakage() and always return 0, so the error
checks on their return values can never be true.

Make the helpers and smu7_patch_dependency_tables_with_leakage() return
void, and remove the dead checks.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
Changes in v2:
- Make the smu7_patch_*() helpers and
  smu7_patch_dependency_tables_with_leakage() return void, as suggested
  by Alex Deucher.
- Rebase onto current mainline.

Link to v1: https://lore.kernel.org/all/20260114163807.2525868-1-ingyujang25@korea.ac.kr/

 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 117 +++++-------------
 1 file changed, 30 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index bdf1e489369e6..dafe25b1efb65 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -2672,8 +2672,8 @@ static void smu7_patch_ppt_v0_with_vdd_leakage(struct pp_hwmgr *hwmgr,
 }
 
 
-static int smu7_patch_vddc(struct pp_hwmgr *hwmgr,
-			      struct phm_clock_voltage_dependency_table *tab)
+static void smu7_patch_vddc(struct pp_hwmgr *hwmgr,
+			    struct phm_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2682,12 +2682,10 @@ static int smu7_patch_vddc(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 						&data->vddc_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_vddci(struct pp_hwmgr *hwmgr,
-			       struct phm_clock_voltage_dependency_table *tab)
+static void smu7_patch_vddci(struct pp_hwmgr *hwmgr,
+			     struct phm_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2696,12 +2694,10 @@ static int smu7_patch_vddci(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 							&data->vddci_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_vce_vddc(struct pp_hwmgr *hwmgr,
-				  struct phm_vce_clock_voltage_dependency_table *tab)
+static void smu7_patch_vce_vddc(struct pp_hwmgr *hwmgr,
+				struct phm_vce_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2710,13 +2706,11 @@ static int smu7_patch_vce_vddc(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 							&data->vddc_leakage);
-
-	return 0;
 }
 
 
-static int smu7_patch_uvd_vddc(struct pp_hwmgr *hwmgr,
-				  struct phm_uvd_clock_voltage_dependency_table *tab)
+static void smu7_patch_uvd_vddc(struct pp_hwmgr *hwmgr,
+				struct phm_uvd_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2725,12 +2719,10 @@ static int smu7_patch_uvd_vddc(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 							&data->vddc_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_vddc_shed_limit(struct pp_hwmgr *hwmgr,
-					 struct phm_phase_shedding_limits_table *tab)
+static void smu7_patch_vddc_shed_limit(struct pp_hwmgr *hwmgr,
+				       struct phm_phase_shedding_limits_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2739,12 +2731,10 @@ static int smu7_patch_vddc_shed_limit(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].Voltage,
 							&data->vddc_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_samu_vddc(struct pp_hwmgr *hwmgr,
-				   struct phm_samu_clock_voltage_dependency_table *tab)
+static void smu7_patch_samu_vddc(struct pp_hwmgr *hwmgr,
+				 struct phm_samu_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2753,12 +2743,10 @@ static int smu7_patch_samu_vddc(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 							&data->vddc_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_acp_vddc(struct pp_hwmgr *hwmgr,
-				  struct phm_acp_clock_voltage_dependency_table *tab)
+static void smu7_patch_acp_vddc(struct pp_hwmgr *hwmgr,
+				struct phm_acp_clock_voltage_dependency_table *tab)
 {
 	uint16_t i;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2767,12 +2755,10 @@ static int smu7_patch_acp_vddc(struct pp_hwmgr *hwmgr,
 		for (i = 0; i < tab->count; i++)
 			smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->entries[i].v,
 					&data->vddc_leakage);
-
-	return 0;
 }
 
-static int smu7_patch_limits_vddc(struct pp_hwmgr *hwmgr,
-				  struct phm_clock_and_voltage_limits *tab)
+static void smu7_patch_limits_vddc(struct pp_hwmgr *hwmgr,
+				   struct phm_clock_and_voltage_limits *tab)
 {
 	uint32_t vddc, vddci;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
@@ -2787,11 +2773,9 @@ static int smu7_patch_limits_vddc(struct pp_hwmgr *hwmgr,
 						   &data->vddci_leakage);
 		tab->vddci = vddci;
 	}
-
-	return 0;
 }
 
-static int smu7_patch_cac_vddc(struct pp_hwmgr *hwmgr, struct phm_cac_leakage_table *tab)
+static void smu7_patch_cac_vddc(struct pp_hwmgr *hwmgr, struct phm_cac_leakage_table *tab)
 {
 	uint32_t i;
 	uint32_t vddc;
@@ -2804,63 +2788,22 @@ static int smu7_patch_cac_vddc(struct pp_hwmgr *hwmgr, struct phm_cac_leakage_ta
 			tab->entries[i].Vddc = (uint16_t)vddc;
 		}
 	}
-
-	return 0;
 }
 
-static int smu7_patch_dependency_tables_with_leakage(struct pp_hwmgr *hwmgr)
+static void smu7_patch_dependency_tables_with_leakage(struct pp_hwmgr *hwmgr)
 {
-	int tmp;
-
-	tmp = smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_sclk);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_mclk);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_vddci(hwmgr, hwmgr->dyn_state.vddci_dependency_on_mclk);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_display_clock);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_vce_vddc(hwmgr, hwmgr->dyn_state.vce_clock_voltage_dependency_table);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_uvd_vddc(hwmgr, hwmgr->dyn_state.uvd_clock_voltage_dependency_table);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_samu_vddc(hwmgr, hwmgr->dyn_state.samu_clock_voltage_dependency_table);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_acp_vddc(hwmgr, hwmgr->dyn_state.acp_clock_voltage_dependency_table);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_vddc_shed_limit(hwmgr, hwmgr->dyn_state.vddc_phase_shed_limits_table);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage_on_ac);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage_on_dc);
-	if (tmp)
-		return -EINVAL;
-
-	tmp = smu7_patch_cac_vddc(hwmgr, hwmgr->dyn_state.cac_leakage_table);
-	if (tmp)
-		return -EINVAL;
-
-	return 0;
+	smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_sclk);
+	smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_mclk);
+	smu7_patch_vddci(hwmgr, hwmgr->dyn_state.vddci_dependency_on_mclk);
+	smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_display_clock);
+	smu7_patch_vce_vddc(hwmgr, hwmgr->dyn_state.vce_clock_voltage_dependency_table);
+	smu7_patch_uvd_vddc(hwmgr, hwmgr->dyn_state.uvd_clock_voltage_dependency_table);
+	smu7_patch_samu_vddc(hwmgr, hwmgr->dyn_state.samu_clock_voltage_dependency_table);
+	smu7_patch_acp_vddc(hwmgr, hwmgr->dyn_state.acp_clock_voltage_dependency_table);
+	smu7_patch_vddc_shed_limit(hwmgr, hwmgr->dyn_state.vddc_phase_shed_limits_table);
+	smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage_on_ac);
+	smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage_on_dc);
+	smu7_patch_cac_vddc(hwmgr, hwmgr->dyn_state.cac_leakage_table);
 }
 
 
-- 
2.34.1

