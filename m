Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469975;
	b=fTUPfq8/dXFahE96iAoOTG5CBFeEr/WAz92ERNgbt8dMEt4CFaeOjoBgvgeT9+QXXSC0
	 JkqHZXVNYPpCGo8VtCk3uhxnYP5ZbfNzdbnd0CvbnKbpcFyFCoodF88btDUycAuRxAb6d
	 X3XPj28oXJZE3A598WNDMzWIByCE+XYJjRZxlMk9LE52CT4PZlV1L1f2CmAKMXcidmFfI
	 L9Tdk0dnnQuH2c+KfKdEt/fPFwrX3Lne6L0NYb0M5Ru6/ifHM8H759cDxXuYefFEhlUmk
	 xzNZM7F4wKv4+lafGPIxJMcoK/PW6vTvjrluJvKsCShq8KWSY3ztVfPRIUUA/ObNEdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
	b=UMYiWemI613a04y26rgx1FjJdMi0qZV2ybkEKrwiTFU1uhrTlQMJT8AjHEbsSF2PdB2N
	 89fMZmmMnuZavdTqqECpXEpuxr39bCc6u9KEBX0wU3BUnRe37CWRCugI1Zt/DMXs5Stba
	 i1K7zcAEvpdYq9z31db0a7AaPXJJQdOxgjSDxPgusfHTmWX/cBLWSaYQPsE1cnEQ5iAkv
	 Z4UR+FL7t9A6IwjBlClcZ37vLzZo9whcmxUVXfhDGrnMTAIngxVGJdmjuSDydPOiOo09l
	 lRdoT9qurIJGiZ/2l+ThHqeZyc/tmDDE4g3rQpblC6wD78kjxAhK6xe+okakCzFcDrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="nXIA1/dw";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C68606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C68606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nXIA1/dw
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2226900b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469974; x=1795074774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
        b=nXIA1/dwI8aBbje4oneHVZT0CmWxD4hmB4d1XEqasuK0bcXE2qU4Tjj2oF6TVcSUtL
         FtNxJWzA1w9INeeR91E4XbWrqnx7wXu6+cfmI7orv5MZFvneEo76RCm4KhJmrTdrFJ7z
         P28JGNGD6XAf8v9drbWrYUQie0SOc3/r4LVJBVl5srLW8sPlRGOCI/6IMNbIodMbErAj
         nTiKDwAmFTvu1kwXXvKSQHJQyhjeq9ry4899ao25WXbhumCGIxFGgmcQSCLNVjxRAW4r
         XW0gCHIeTxvzHw7NqtSHi6sof5BZZczO6S4lSnVEA/doVeqjY7fo4PbrZ6C4Nye9C3wk
         MlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469974; x=1795074774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxZOgh8Tz9Rs+HuyIZTWtrxpzparsBej/GhOgMZ7srY=;
        b=vuqLhgRaYTlKpNFASstoqMMYC7t2CRBey75VjC5Yh+lq856AF4CupyLzzShlIfMcA3
         zoy2PQ9qO3HLMaQB+h3kxkCIisqp7zxT9NY29jDiyQoJwg6d8O/5ax3tupGBHY0eyW/q
         ImIfnUsi2UQcevilO5KS+vzZZba84Bq59RUkLUzbVUwf4MI3tYLyBeebqo/AwZR7pTRo
         CkV6PdUFMx7yyRGdBCOnR9IctrRdloxDyLTdUFXC/txRAkscemGcXBBPgzb1HNVXYsnz
         cUclxnlC7YVmgujl0Lh2cjHuwEqvfp3QIlvMPjOOc664MtI3IGY108eQrNqipfdBCCtU
         9HHA==
X-Forwarded-Encrypted: i=1; AL+hErGASb3PjwABnEoR5IZuWLauT5NqinAHeVjTNGoj7KuSQ7mVkRnMeUja5QB/n9f4Puqs1m0d7wHJjdRC//w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pmx15o0Br3prlDTzBP+QnzY5UHzHVAOJljj46y6EoFcsbMsXU
	T5eBfprA/BpT+OvTnkebz4NGai1Uxgr9GsXkBB9OFiONbfwbB0wU6a1wE5ILV+wER2M=
X-Gm-Gg: AYBFou2dfh2dUfshLsPZEtjnE3axbUoqrril9VyLuRcFs1Bg0FE09wIC3rcCA0f0yxN
	XzjBxQTvQDzHtWG+5JM0/wp0pvgcTjxzWGENgGUvTv4vTWON9hpsEJZFtpVdyGyquUEE6Xq2Dyc
	wO+J20i6kGuG0bVPSSrC9rQmtRilSMsa4hSRTz34O44yjuQwktHjN0KFBIqusihWkv28bJL50MD
	pVKkzR5997E4wKKuwxBoy0m6FDRKMO8npeXkROibJjYgU5VgciwVNTEychv1W3dQa7FjFZKEqtg
	VJue6XtQViQcFl26wwqO3skrLQkAa2X4k/mSPDs868UJlV+Vuy+SC8B/e5SSyd06rcIcrjTqvwg
	hRr611Cg+OzuXtujGgk9b90tPUh05qVnWCv9XcqXZUyBYNCI/cIiFDCtHqvZykKp9oWchqMqcgN
	FyyJUP8FVuWY21e/iiEvGgK48PXkqU1g98cjaPfEY/4lPnxPRsnMk79bvZ4MHZb71+5jHBUE7Cz
	nt3Wr6Gki4i3f1rfVsLeFEUP4mKd6+15DQlZVDd2CuRjrCz4rfK1pidmESSiddtJdTAEZQhZkT9
	7wn7eA8auOiZ753dxy6Pt6aWn4vGPQ==
X-Received: by 2002:a05:6a00:17a8:b0:891:6d3e:3992 with SMTP id d2e1a72fcca58-8bc1cc6884dmr4894574b3a.46.1794469974348;
        Wed, 11 Nov 2026 23:52:54 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:53 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 15:52:08 +0800
Subject: [PATCH 7/8] drm/msm/dpu: ignore merge_3d flush bit for non-CWB
 INTF
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-cwb-upstream-v1-7-a6a88d928aa4@linaro.org>
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=2914;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=9Xse6MQZpCn/nWHqVpI3yh8n18tnb7floW0gWgsrbFk=;
 b=i7Cde9Pr5WbrvmOjjlemGCENIVjn01Df8Sd/E/sUaTSMCbGcBNbCN53IsaPLoFcCriyFLRaqk
 8xM0X53dmrNC7YVgZiskcRaKzoD0TPlSO3Tc/LFitAjwMcms3SQJjYF
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

merge_3d flush bit is always asserted for DSI interface vblank
wait in CWB case, while there is no visual defect actually.
Ignore the bit for now.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 17 +++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2f19ecfb6020..1a294f817972 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -3050,6 +3050,13 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 	return dpu_enc->dsc_mask;
 }
 
+bool dpu_encoder_in_clone_mode(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *encoder = phys_enc->parent;
+
+	return drm_crtc_in_clone_mode(encoder->crtc->state);
+}
+
 void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 			  struct dpu_enc_phys_init_params *p)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index b8c8222a03b2..34cde9a64d25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -354,4 +354,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
 
 void dpu_encoder_phys_wb_deinit(struct drm_device *dev,
 				struct dpu_encoder_phys *phys_enc);
+
+bool dpu_encoder_in_clone_mode(struct dpu_encoder_phys *phys_enc);
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2ac517db50fc..7b310fd5db34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -534,15 +534,28 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 {
 	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
 	int ret;
+	u32 mask;
 
 	if (!hw_ctl)
 		return 0;
 
+	/*
+	 * For CWB case, DSI path always report timeout. Workaround it for now.
+	 */
+#define  MERGE_3D_IDX   23
+	if (dpu_encoder_in_clone_mode(phys_enc))
+		mask = ~BIT(MERGE_3D_IDX);
+	else
+		mask = 0xffffffff;
+
 	ret = wait_event_timeout(phys_enc->pending_kickoff_wq,
-		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
+		((hw_ctl->ops.get_flush_register(hw_ctl) & mask) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
+		DPU_ERROR("%s phys.split_role %d vblank timeout: %x\n",
+			  phys_enc->parent->name,
+			  phys_enc->split_role,
+			  hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0

