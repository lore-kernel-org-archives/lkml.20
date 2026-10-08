Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0133B058A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480292; cv=none; b=EjMUWa58lUOCreIOYOjH6J6czXEQdnXGMw52kkSpW+2DKL+ledKnKUWoh7yFAbdWWrzmxsyyyGsiLQDjqBdHeDv1KwRFGII8DxI2wqRyUVOrBtTS7+A6xZEwt2Yir4BCc/RdjZ9lmz8xdaemakHJIq79qrz2utht8V2XGhDqCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480292; c=relaxed/simple;
	bh=ffK+sgwIxa0nxxdTwedAg7jsF/07q/HMTOzQUsBHFFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IY6jw1qd7Xpet0LAf3emXhWjjraQawhWDg9+rIVEmBqMGbj8JNrtm4XD6RFrEOIw2MKQWC/FEhYp/r+QB7jjbpJOJqpuSF36s2phFuvdbSrJ2ZHtzgk3UaQFlpLcn0h1wsXLFCAQKOuMwDu8iVWRyc73SB+Vhrm/isZR+1W+Org=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Emzi9NQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB0NWegV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Emzi9NQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB0NWegV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698GbsDq1961895
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 17:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=; b=Emzi9NQ66f94ePkr
	eyA8pLJNCNTJl8KPL0ursay6sOlmqUSIH8cfA4wJqXHIYpEK4k2mQX6v6vE/zp4o
	CIXTgsvJVW3+8uQTs07fB0kjVxGY7NJARyNGQ2ud8AdhVzvA0+wgxKFgkJtLV58L
	hc6ouROcwtUYTBAKy115lamD7inVjj15nwLCImMDhlaGGaSZxq8efyCUmztH9uOk
	pLdzHFBHty/c1NS4DZ55rrWfvIEmyX98YNJt1UTUE4sCyqN2lO6OK2YQF3pDmO6e
	unuE3ofUINt6PH6DQzpCLoC0GH2vxi9igfHSsfRxtnyXQluWWX/ZpM3xgR/bU4hm
	rWBK/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5861c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:24:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5732256a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480289; x=1792085089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=;
        b=hB0NWegVfSpM/ALUfhXi9ZEZUHJOuDqT3PhGob4LjDqtgfX/a/dgRMX6lQd8Gu0c3d
         E9s55bdL1YwbIajem5SNjxbp+JPSb7e0VBs8pKhcEM1mf2LTLxJZgTdnGiAe3rKMNE52
         ePsW3phOElUNVSwMucRJ/YvhyGosvfX887ubs/6T2F9td1r+CKnedG3OW/rit+c1aLm3
         v9fPh41BrF2lhxxrMb3icQfpeU3ukgM0OgSRA0L7cDJwKPD+Ll0NKog0lxtB4sTFLPT+
         c9V5Lp3bKiax1j7vtICeRNx3xi/8HYloObRNav5Q/KTNriAbrMhgM59eTwIgfH7Mpfch
         JcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480289; x=1792085089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=;
        b=vphkDv8HFwY8vrr9OB5yeF8Z6+pD2siHDs9Xo6udVJMSKHZzAQGPPDopp17nNPy3DE
         hgNcxTjqREBSGYxe+iDodycb5uzBfaR8w2FQqnrOHiczQAXc7/9ViFQfhtXvLRzDz0Ov
         atyeB1edKPK1b6sHqzxGPIZrezYNZd6L7ze8vtq+2u5mJPsTdc6zFLfkjqbMGJkQIaKz
         L5Q8HTBlyhKo6zB8fRJKhHg8frYA1qVHII0yHni2e/opdeDbVXL59YK4lF4ZvPZL0QOH
         1Iu7iSrXcm9zWKqOxBRcHgs2BuMETHCsglW7GdxYRTuS/qYlDztk/fnfBVh6Uda0wbSq
         CVaA==
X-Forwarded-Encrypted: i=1; AKwUvBw5KK/5/H9y60DMjwc8s5tLNLwePoM+5PBXqHbVT78rt5+BslZod7917jXNmVnyICDjGCqbJVob2ssBeso=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+e4QY3qiXHvcjDxs/nWASoNfCTcoSuMGRM0nrFXy96vY+qDz
	jhPo2iLUmPOCIjy4y4hNgBJXjmgCJ+W5286Xjwlz78tm3f0i5uNOy05m8Z0l73QNGI5pATgvEHr
	VefQjyQso5oj0xY/ekAgsTcw9J8vhYrBsHoo+i2QROJS3It5CH3EPCOPaOm4xGzQHb/sMU0aLx7
	0=
X-Gm-Gg: AYBFou2X6OvtPzqV0isp3Fu/h3YNG1o+sHlFZLgYeKsr62ndaob6qEGQ9QClHJtPv6f
	lT2/cKOMDmjej+i20w1vh3g9yp8Oap+KC1Lmc8noyk1KUaroqgizzAl0XVj28YZqgOUCvCQtp99
	tvVGDA8OwsU+uUehQvMvXROMMeS/VVMUy3BNpWfag9uue7VD2ja8r6hMCLFSHSbz2923Y6koMMj
	YUwi4gxgLkT37xO6PoEDKGgtpEnCgxpopWer8iTH/cjWbi9i8VKmQbPc0cNqOD1o016PrX/mmcA
	X9O+HzG9NLjx/hD8KFut4jV6+6EVAenr7WgFmnsfi4cn2Z/bigQlzstt+9CoYoQbV7cgcYWgpvr
	JmKLp1klnH+NG+AxWzOHExfJW9A==
X-Received: by 2002:a17:90b:134d:b0:3a4:ee64:b880 with SMTP id 98e67ed59e1d1-3a8a0dfb941mr4586267a91.32.1791480287702;
        Thu, 08 Oct 2026 10:24:47 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:3a4:ee64:b880 with SMTP id 98e67ed59e1d1-3a8a0dfb941mr4586236a91.32.1791480287115;
        Thu, 08 Oct 2026 10:24:47 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:46 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:52 +0530
Subject: [PATCH v4 6/6] drm/msm/dpu: limit the mode width to a pipe if the
 LM has no source split
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-6-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=1679;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=ffK+sgwIxa0nxxdTwedAg7jsF/07q/HMTOzQUsBHFFY=;
 b=VM0cIPXc3RlKPNnSljZP7as8ig45IsRGPJpT6qKIh9HH00akRjuibYAvs7G0QY03xQFqfmsPI
 4PZkw+2QcotDKvVpPGBJsqo/jeq6vsDvjrq9KyipQcs/bbwdj05JrHl
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXz7sKHRBeF+xu
 KdGF5bxPF00TEoFMHMmhTYzS6KxTls28yl9z6IqQP4x4FfXbPZcu45Afj1FF1UeZ4AwVR4lbeTp
 gKPxHNrEcfIIJw//SY0pWRxsUHdUvyo=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac7d1e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RCAr_VjVQrktO2oC:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=67skgTjD9neFK7rYSF4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: _XxWlsviRB09PZpVxSzad7_e8qTtb3SG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXxlrMW3ls9V57
 0cZwWMclsJzBOj73rDDkErdkeoiC8bZ0CLtZSCaFf7ToL6oGOoakJsiVWZ0B2ss6l4rwIND7qb1
 1BpYGK86XbV1vuYZnWuWmZMv3K+1yF4Ehw2cdsBKhcMAszw8MhYgXsxoNMVYiTMeTEGEDrTvr+4
 W4WuAMTx7dBUgvz/u98bclveyF/7QZe1V4naRJOmZJLzeNoOdnU39cXAWybl1EdDWsy+CkjVbU4
 sR+zxzcnoQQsJNkj/BmPrU6TsSeEQNTlY/4W152xo52a1tLVTTmBD8ZG898gCVslUByrDVB7IhW
 TRKVZG5FoacgIBmLqNis0oF8T1RsoDWOuY+8Z5MdVRzP9nclwS7xLEXfsgKleaMlxgqk0HXVTvt
 kRxF1NrDR/lAgWTU6ybpLGvU29FwgjkLq0gzECxpkpgW70fN2rZGUKVOOb1c1GhAkJzxaT5xVWs
 N7WaqQuhZbA4gBAn3cQ==
X-Proofpoint-ORIG-GUID: _XxWlsviRB09PZpVxSzad7_e8qTtb3SG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

Layer mixers without DPU_MIXER_SOURCESPLIT stage one pipe per blend level,
so a plane is fetched by a single pipe of at most max_linewidth pixels.

max_mixer_width used to reject wider modes. Now that the mode is checked
against the PINGPONG width (4096/5120), keep max_linewidth as an extra
bound when source split isn't available.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41f986ca2a68..c2ebeef0b01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -791,6 +791,10 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	    adj_mode->hdisplay > max_pingpong_width)
 		return -E2BIG;
 
+	if (!test_bit(DPU_MIXER_SOURCESPLIT, &dpu_kms->catalog->mixer[0].features) &&
+	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_linewidth)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1661,6 +1665,10 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 
+	if (!test_bit(DPU_MIXER_SOURCESPLIT, &dpu_kms->catalog->mixer[0].features) &&
+	    mode->hdisplay > dpu_kms->catalog->caps->max_linewidth)
+		return MODE_BAD_HVALUE;
+
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 

-- 
2.34.1

