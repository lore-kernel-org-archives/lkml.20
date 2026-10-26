Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042238;
	b=vB/ttvzo2PBm5cj95fANQCg22eFJc/ZchreXY77Ucdb+LfH2WGc4UexfNtmAg8JNs2Ps
	 YmLOT9hVwvEInaresC77+7jch5Ql8h7E0FCwssKnL0Vj0qN/WHW9gnDyLWVSDKPW6D8MU
	 Ca7heGYe9cPl5nPN0O5iMcMrAz9XLzfhc9ivUC8v7BfizGDNWeSThVleCKq2cWo+Dx2cG
	 c2gYeGZ3r/87AAXrzdM6ZR7TonYVgiUDGbdHfS6lIWFpnvFYj8rHOLMujxdiN89sVwlcz
	 tE/1Cmh4z42CUIyFbUhP0eLhYuqAmmmkhI8WL44AGlPaX0D8cnCNKc0MwoYsclrf6dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042238;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9kV3mpo9IDcWJzdmAM3TrfjqAu96cGtkJuIv3p/bUaE=;
	b=WrndTdbNRFi17qFkJMVzak+NPfTDyqcZMMTmfrBgN14bb/FierQ56MirlO1siZr/nyQ2
	 B6S3DVNMJfM40HzcCnCjEU5MwBFH93tkuBZZGRbfZOOlHnpTfFgEQcZ3VeJ+/ZsvS8XHW
	 3yL4QR75jUJnn49l5H9fN49nNCvka+KRNjTQ+FdbaqVHG0lsoV/zT3PlkNBgb1PdwGQ7c
	 el9hu5e/ECq+NKsWCjlXikAJUzvdexApt/yRhzO6Q6IoSgay9AU0HS81FCVjKQ8D53354
	 DnvFzIyEXha+AfdUn6xdZR3nm366m0LOJ0q1RsmN4uKi7gX+wHRExniPZ3KArZMA0Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O0yK9/uZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E160A2603;
	Mon, 26 Oct 2026 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0yK9/uZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793042238;
	b=tk6cDKKdp9Mz3Gya5HP+Fw0wLDqXYXROVxON2M3L1TMm7CBXOjZ+DTXCtNKdtQK5jCDC
	 DXx/pjqhfV7rJAkNmwWRrRlXt9gYEKmevsHvw8kbhOT5msodwKGSWQZ1+uIAsGls9LbTj
	 Zw7+VZNAki1ZpRUWjS+E1H3Ul2PpS6kC1ToTw1HaemtMLvODxz3LmbXZ4A1qgBOHPoo+C
	 K5G5uWnSdZCT6BzP3W9zGlTK+ZR+VeLpEyUhu2rT0rhUkjx3Tz8Y8q4GcHlgHs6sVP+zG
	 SniYhqlPIx+v4T90W0UlMf0G/aZgs44qChIeMVGC4RL9MOWKgEX3PU27PFDiKX9+JZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042238;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9kV3mpo9IDcWJzdmAM3TrfjqAu96cGtkJuIv3p/bUaE=;
	b=mjdLojFehkXDbZsCS+PklthuWqYsUNMnIrgyB24gEHL0Yv6JSTKdzcooIz0R/XwLB5G6
	 bIMWwELdYgDc4zY/KAAbqfR2w2W6NERYQ7EeKPHSujJ8LEXrfVfMo0HQVamQSXEsvOU4e
	 UDHbCadJUBE16xWWl4aw4R/dRBw8bKdgP+uUAT++DwbnyZyUBSDbymXNzfVgbUax8Vj/P
	 F6wzBVt6x2zJcmAwGm8/ivrC3jUhggkDy6nCV2W1WWaeyWxGjZ31uZui86sMhrG+wuxKb
	 xKmpFEq3GGTx/y67nr4hHnNzYMiD5MDgkKO3+P7FDaqYXVptv42xqbPMIiDckq2uvEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 413021F031E1;
	Mon, 26 Oct 2026 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042238;
	bh=9kV3mpo9IDcWJzdmAM3TrfjqAu96cGtkJuIv3p/bUaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O0yK9/uZUT8cnvoTVvbAb2Ot+R0nSjnEtr7wIKCYdnZJGMwNFVvGTIYwYetlotD/h
	 Rd8MpWw41LXMa8m6zol31+sr9qO5dUttZT1zkbbFBY2/EUFDJCzMZQK3pVgjaAuDmr
	 VZqq0EAtI4VCuX5HgHSju7FT7d+btm7qeucCNq3rUcckn3i3DWp994IlI918R0si+f
	 5HHWf/TxwTxp9f2qboR5uiKvi1uZQaqiWBMew3KHukDSRwKYSxTam9CiruZCidiWo1
	 RJHngPCzbilOpB12IVL+pBxtpttctHIMVUBQj6tJC+A5iBzz5bRjlh2Plsu9w52dyC
	 Tme4Iud6lPJLA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A429544E31;
	Mon, 26 Oct 2026 19:17:16 +0000 (UTC)
From: Xi Zhang via B4 Relay <devnull+xz.ca.cn.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 16:16:49 -0300
Subject: [PATCH 1/8] drm/msm/dpu: reset unassigned resource slots to NULL
 on topology update
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
Message-Id: <20261026-msm-dpu-res-clean-v1-1-f46130a8a717@gmail.com>
References: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
In-Reply-To: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Xi Zhang <xz.ca.cn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793042236; l=2413;
 i=xz.ca.cn@gmail.com; s=20261026; h=from:subject:message-id;
 bh=XV5yIGRicisWHnZm/blBrd+eV6OtBhD/12tGnVobzAE=;
 b=s55jsSFGNJ3ReHkx8AMVQSTN6+WwH+fE1jNAXjs8ys3POrRiBNFM/SLkbQeL00+tsbmzalW/j
 5tLQIjH2UBwCk5ifphW1VkW+DEOnolU72y5xsm2yA+GtfW2h7Q/JDm9
X-Developer-Key: i=xz.ca.cn@gmail.com; a=ed25519;
 pk=aRUll5L3eJbwG8Y4BO9uySKGzm+Uy+Ccei9prnRVZRs=
X-Endpoint-Received: by B4 Relay for xz.ca.cn@gmail.com/20261026 with
 auth_id=1328
X-Original-From: Xi Zhang <xz.ca.cn@gmail.com>
Reply-To: xz.ca.cn@gmail.com
Content-Transfer-Encoding: 7bit

From: Xi Zhang <xz.ca.cn@gmail.com>

While this is not currently the case, it may be possible that topology
for cwb and dsc resource requirements change between mode set in the
future.

e.g. when dsc support is added to DisplayPort, dsc may be optionally
enabled and disabled between different modes due to
bandwidth requirements.

Set unassigned resource slots to NULL on topology update to avoid
issues in the future. It's good practice to do so anyway.

Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..8d2b4d2726f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1205,9 +1205,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 						       ARRAY_SIZE(hw_pp));
 	}
 
-	for (i = 0; i < num_cwb; i++) {
-		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
-		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
+	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_cwb); i++) {
+		if (i < num_cwb) {
+			dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
+			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
+		} else {
+			dpu_enc->hw_cwb[i] = NULL;
+		}
 	}
 
 	dpu_enc->cwb_mask = cwb_mask;
@@ -1215,16 +1219,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_pp); i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
-	for (i = 0; i < num_dsc; i++) {
-		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_dsc); i++) {
+		if (i < num_dsc) {
+			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+		} else {
+			dpu_enc->hw_dsc[i] = NULL;
+		}
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;

-- 
2.55.0


