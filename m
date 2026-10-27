Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793085284;
	b=mWQJIwJMOV/OdYZQ/X0mIIrl1tSeVMqIrgcFkuEy/u7L/UGDwOem5uBN6t5hMBtsCU9L
	 YrAyQ81BV+WVz/EUpjq1HRt02KmbrFw1UibqWMeeYi4AmxMs6kjMJjqh2WNIggRmb+1Ke
	 Q6TPlelgCuT+UBehdXFVfTMuUeerwWLLjteDW7VytYSiyM0h9AShwtEnO0nJ5tHz/aNsM
	 G+EyVwzxjeIu7yoEBs6mNfs0XN90EGp77FlbK9+a5DQQv1RN+IhZDY2WIFGQZfsUeOhOa
	 mYBqgUVx7AXvxn+EuS7Y2OiDIOcVK0LsgaJrryS9XyUiR3V+zt81mjsSMpFCz2zpzOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085284;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QEOkViwPvA+ovkRTT/O+7cSGGL37fIKYHlGUm9vQRrQ=;
	b=jeB/wGs2G+bgkJ38yf5n03GRkK3+GhEoM0Io+bToyyNwyvzFRdvtALBO076l0u6Wr6FN
	 m95JqlGDr6jHNf4GnjvJcEorPXx7OEyXKEUMBQg1SgB2RMGsXTih6NomNJ5vNa5Kntiuo
	 LrJ15F1EAXaKTv5xGEwhCKU1ikxeFyWfA5B1fmdJrUqOc3JnvZ3M9na3x/Ve73TR92sP4
	 poyzJZJoN0WW+sRU/t/6Nox4XQ+3Aq3nzOT2F+4Oa5V/yYyhmpDo2VYWtI/u9roPUGyDH
	 XSI81cIbV61DKzvs7F2HyHzqxaKzOC/9bEt7QPBEIo7YlU752pIFvoHk6ZeWGKUksCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4athBve;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FF606A322;
	Tue, 27 Oct 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4athBve
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793085283;
	b=eiDAg0zO9DAIrxFMl9BgCi06iv73JhTlCHSmLxTOSyi7/q3TwYR+F8eNHMBREHsoMuOR
	 JD8mXy7UIUgHu+r5wnHJqx8NthDoAo9Qg/3TH17pxMLPSdv/MuU7Lys0FBbiRpovS/NSn
	 QEOYGyWnbfsATpb/CxLMpDy+mKcWhwIUnfN2553QcjLHCfrCnJ2Zk6oys/0Pz5M8m9oL8
	 olJgxW4YEyNDp+n+QbwIh6Ml3HT8Am/WpqCK12wWZpn14eRRc21NOCHgyyTxJGUoG6JUh
	 T/M2v1RUR6MiyhXhaT519tP2MGwCRgPdo1LREtV9PPW4t5iT2IqUFFs2T+s/CXgmKFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793085283;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QEOkViwPvA+ovkRTT/O+7cSGGL37fIKYHlGUm9vQRrQ=;
	b=vEdKmTY3l/QPtMN9Tc+Ajk91u6TZUGGGg/b52HC20qAYtEJE0M/lP1ydVJR2jK++1ycT
	 ZY6TvKlNg8e0zsLtcPFkPyXNB0PVSUw4u48KucKfpeh3aiDIknmJ852Lh+RxRlSAh755h
	 7g9VXqgdgj5/a13OmZd4ocP5oPNqSTpF6GgagXnrcg01cM/YyaEJvk63ARz5dayB5R2uH
	 CQ1FpzL65FbBt7WadGCgtDEQNcsqRCEyvXp43Ll2yRr7wUux3eFo8Y6RYodyhujQJcTdJ
	 Iudb4HjHB4EOG1GAeYW8CZEKT3ccs/UIR50/djPAaYNAOEAYi9gHVN22qrrTL4RwNfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F3311F031E1;
	Tue, 27 Oct 2026 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793085283;
	bh=QEOkViwPvA+ovkRTT/O+7cSGGL37fIKYHlGUm9vQRrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l4athBveir4fPeSUZnyBiCTRrGGf+aZCol1IQznLES2Jb5KsNxrVXlCIyVoHcdYho
	 V+zlNgQZGwjhachlERr3gl3Z8SHuOYjYHIBSV8KtwOWHM5qOfMtvfFFa6C90EwDHpM
	 Cbig8sVK6dJ7Uy0DJD1mPKRKJS1WDUtRWxWqHtFDykPuuo+HsgCmVp4d2OIiq7EzYs
	 ZwALa105FN2CKF1W9h8hvWBZwEtOxOIfiQ2UrxTqaEKXI50Uo35zHphf6xMTAQx10d
	 piCHtA2VwNEaxLYNM8R94otVHU7dBPAWc8tbEwvZSlcsOQ6AO+TFmuUvAV7N++MQLM
	 F2vUaU/KTPVIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 33F8045018;
	Tue, 27 Oct 2026 07:14:42 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Tue, 27 Oct 2026 12:44:37 +0530
Subject: [PATCH v4 4/5] drm/msm/adreno: Add Adreno 620
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-adreno-a620-v4-4-b0095e028c76@brar.si>
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
In-Reply-To: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793085280; l=1990;
 i=patches@brar.si; h=from:subject:message-id;
 bh=75tuVdfu66JoRRPxrf3B1Fh+ea+aX99Qpqxz70g0Nuw=;
 b=jjb6PgPudbzoq870ERCEhEKcDebLaVZ+wVHcWIiWdt+lvQnduiwga36o4RhYdClF+7y2gnG4h
 VgSEfOQAxoTCJrRoKRqZqwWCkuhdxpIKLC0hqjXdJCGGH3+p8byxOgn
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add the catalog entry for the Adreno 620 (chip id 0x06020000) found in
the Snapdragon 765/765G/768G (SM7250). It is an A650 derivative and
uses its SQE and GMU firmware and protect table, together with the A620
zap shader.

The speed-bin fuse values map to the OPP bins as in the downstream
"lito" devicetree: fuse 0 is the default bin and fuse 132 and 115 are
the two alternate ones.

The GMU clock gating mode is 0x00020202, which is what the downstream
driver programs on every A6xx except the A612 and A615 family. Use the
shared list of Bus Clock Managers so that the GMU bandwidth table is
generated from the bandwidth levels of the GPU OPP table.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index c4d332f48f6f..6cdc3f5a2583 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -954,6 +954,32 @@ static const struct adreno_info a6xx_gpus[] = {
 			{ 169, 2 },
 			{ 180, 1 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x06020000),
+		.family = ADRENO_6XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "a650_sqe.fw",
+			[ADRENO_FW_GMU] = "a650_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a6xx_gpu_funcs,
+		.zapfw = "a620_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a620_hwcg,
+			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
+			.gmu_cgc_mode = 0x00020202,
+			.prim_fifo_threshold = 0x00010000,
+			.bcms = a6xx_bcms,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 132, 1 },
+			{ 115, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06020100),
 		.family = ADRENO_6XX_GEN3,

-- 
2.56.0


