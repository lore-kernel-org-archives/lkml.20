Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797953;
	b=UriAZAImlopg+mCc7ECRzXr081khojwZ4t7fJdJT6SvFuB9oqWdohcnLf/mxDqf9nDGN
	 2fAoTki+xUBG2/stVDHk7w6lyy7eor86ws1BX51XjmNGcFw0h71EV51xo7wsumTE4BpGL
	 YGo43kxb9tzbK5B0OOUWlJMKtNziPx+oYxdO5uLkbumOxFHdPGImZ6voFbeOHpvJgOv9w
	 jgPTl71/rnmuIc0tu0OBQ9aA8JTGlgE9w7WiKQIPWYwxMr2S4WGK5TKef/XlBrtdMRfHH
	 MoT9nQiqUjhpX6jY3tRAC/dL7I2978m0EsjZH063IgR3iomzwivwhloF4ewW1pLuvng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
	b=TMOh/tS5c1RYD2aQRtuvQmeibLjF2SxfHPim0rgB7PwJdoTG15iGiPwTAn+nzuhClziK
	 bsGyel4QdFh5CNbmO89ylm0F6+krKLkxegUagv7lZZGavFgEIsJWDu7yCYmirv+hv8Ao0
	 9I7HOku6r+h0K96Bc74fX3V6cpshXODGca7zALO5GJGvlswmhFMfVQGq42MPpKUm6c4qf
	 DjxBbFpz9YsGnIuZ9iz3cPYC9k33/5qapqfQqF9go4ezkLiqnPyQX6+ZVprH3URn4hwh8
	 8AgPtTaZQGGwAVU3TNxZ9hgkAcbYuQcbvpqacArVq0O9Gm14gsMiy4SHzNRb/NUrM0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SD8QxFZb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DWdkhjuX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B7606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2B7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SD8QxFZb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DWdkhjuX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvCwf4006342
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=; b=SD8QxFZbI7BBohKo
	M5rFrARfWHIClZmIvVfqynSCHQeeT0RlEgmuKcX4OA+5E/0o957vUxeLrFkvM3fF
	ElniuVdD97Th6YQDHk7YLOzxdVNK5fq2RgY4I2m18hcqRuUpoMceDH58ogcySv20
	v346Flya/ZzdYdF1q5PhkOePp31NQQFjumGh9k4TTSfB85HPrlIrNdFTIAfIBdNd
	Ko7FgVhzc0bERukLHj2rM5L4jvKUFwpGfuVpUj6G7Vne16GiFUz2+RtX9w4BwqCH
	U3tnX/c33yxSpRzTjvf2ZA7ZMzsbC8Lt4gQbkgIHvLeXQvgSVAaD0HloP87XW1aL
	f1T8Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn26e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so251981085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797952; x=1793402752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
        b=DWdkhjuXD/KcI7P03nwNfZUdy6uUwULMGuViSy9rDflwNchiCGtk/Tw8hyZAKyEd+A
         eyOcf0ZXaxyG6/yaTyLpdXHKbkseHWqh1q/jqq7x4bSA5hLAdqK/kCoEb/70XvIWxuA7
         6CP3I8xt+STOUAN+SM3WbEmIP2c1ypiOJPNHP5/zOhyn/OzVtW68BKDrNS3dHNCKTI6N
         8/4VSVV5r/Pw+sAmuYOR62JE9jr9xLlFKydA7FmZ76GLVTISfie3Ep3F41/C3CYr+rdl
         WPAC31aLJX+5ConeH0aeToJWbBXnIotoqOghU05C4fMer8W5PMrfgsnme7wYAEAsmTmT
         tiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797952; x=1793402752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=In1IJDjKvKLncIh6SA1OcK638AZD04er/Z2SLZZrgPU=;
        b=nuEK2dTGtvO6tkrxYtoewGcT5avcSs9COU7DiO9wjZJ81yZlg4DJIV/HCPjr0iRNwo
         gZqBZjeVMywEMUx7emnfJzNhk074P/jhD4CwOiM8xTjeIoHplik3Z6kwUzHGNNhvpteL
         yaFM1vNzac8aln2XAJt7flusjlTi7zxLCEaB17Imkn87mPyHVBYNU7QCVqfFgHpk68FJ
         /LOh8hK9D49/pt2TVqE+el4IMrMk+G1xM28aCAkYRWOFREnya/w29cYIe99b2WosR4MY
         TxJ9zlt+g/ZMo3ygoXi+o/MW6UN1XrOMEZvulGmu7XW/lgAzifiL3RCtJNVpYP2AwsW3
         /O0g==
X-Forwarded-Encrypted: i=1; AKwUvBx9Q1j3Q2Tv5UrIgX0lylyMom1ceTpOqpLOu8A9bEiE8Q9g/Q6r9NXxQb9iybN2hDwLEqEGVtx3lronzzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSseodaGprgYzUd9LpzAPq3vsK0lmWeaB7oJA7TrJ7j4/3yLHz
	/SzakpObHO+bSPR6IE/FcsG/24g7Zs15K2eY2TdCW7tnYsxgB9JPaJP/gziP8exxXcliQT/qsSM
	6dFAYFhfTnQPakBv3dC2y/24Pwvcs2S5n9Sn/33BbjV7iWF83RVQDOTXkrZiCmORh048=
X-Gm-Gg: AYBFou1dO4EU0bboRUTEKX0b3ZkjRrH8yltLtavXsz32jbcTLBeUNLO5pEWZlJLCjVf
	ocMlQGeooyeyVdyDZFPCH8O4Wmtx/xE5Wyte2CxpXEgn8lVj3JaK+MDKSGz3mZBVpwu15lbr8el
	BArwD1pWRe1uCt6soJsKryroI8Gw2wNDislZj+Ep/UlKWyfLOmFZIIYrZvP6mMODCJKhl5raG5f
	Iv85QUbDr+4iamvV2mTP1+yvd9c07zUzSmiTh/6xhIoOA8IoS1y7Uz3RudXPe4cBI6FSJxE2rIv
	aip92gqGnGb8MO/FHMtIXokfW7AfSTA/Cu5ObrSUAYi6EpO51hTH7LbOb5A2jIbJwduaF2uRIhZ
	1MUM6axCyMr7lKbRGeZpkNPpZ4a6UIzE0Q4COhXszio+IVUqzMaf6H+xzoWSu2tDMY/4ZWgGWG3
	TMvD9+zKSNQmUr
X-Received: by 2002:a05:620a:280d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-940ef7cc968mr88719885a.4.1792797951905;
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-940ef7cc968mr88716385a.4.1792797951395;
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:27 +0300
Subject: [PATCH v5 06/10] drm/msm/dpu: clear the CDM block left by a
 previous reservation
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=td4pH6mKFwySyF+P0cdOuWY9YqmqMRtTvJGeIm7xLVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zpabaLK6RAXYgWPGaIvXugxOiOr2TU8umJk
 3PC0bG8426JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6QAKCRCLPIo+Aiko
 1Qp4B/sGWUAq+a3bP+1MbYAIjv/RYEUh1NRtMdlTj1TMI1K0XPzYCtUy35yys0yXWPHIehEYFw0
 Q5bTrWj6d0zfJ8WfHNI72At6m32XH2BnbuK7Lwlf1dz9HrMhYZKjSzyAdzNAWi0QjJ46Cjh0GRo
 A8r+p6sSu7fjt5z8t5T85xQR4guEPvC7S9pnfMLxs7aslbgzLbyovIk1nec4g2G0KRNyFsuyNKO
 UB9R6neO1XMEmxcVnh8OsBO2+OZElGvArmrYMh0KOZylfSM+X/S2ggnC/nc11CaEICgF1pPgkJt
 E5uKvtF/mArPU194baroCxZdC87QkOKwkeR4ESnN70uKL3Wp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/ehTGnicK0wP
 27wl+WhWJw86nkRyax1tcyw2CpESwxhmmazNd9czhVQLbQ7K4aHji5z8hAa9X50SYBYpuFnkhSQ
 9euUIELyQeLF4AqtauMFXCz59j66HEmv10c3pB1shGUPCue+v9oLrkLX8nE9KKGEULD8FWAyi0d
 X6+y9J8cJmkPyt3ZoSPmOfGXdAJhs3aO4/bo3HKIuJzB/qTo0i/QZYBVc/F0szqD/RQU5iKnQdL
 UANET/eYGK01ickbqN+4N3AuqN4C5yLmHlTNOuU1p6Swl8gqP79FePxYe25v8GB2nXD8FKfJAwJ
 A2P9KQIyrcLbjPsniE8+ElHYSM+Ryw1jU87ppskhejjj2oX2kJ9u1i+F6FcZNV0QL3ABRGMguyI
 FRbiiDf/xVn3Zt7L7CJWgfUXWtx3YQAjnRFK5h0iN0to8C87g7OHG9ZdtmP/BArUAQr7JiDDL81
 QOTQP/tj3sj6uSwm9Ww==
X-Proofpoint-GUID: LPkCmybJrRqXp3G5AtfmFQp7MHlZ74c6
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adbed00 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lW-OXhpROnvg2TLzoksA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LPkCmybJrRqXp3G5AtfmFQp7MHlZ74c6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX5iOhHU4/jmA0
 DkyqmiDy+hNO6TrWI4RzrbIu3mFjHRngw3TSqJyVad3ELdlcq6rvBPT3ifpBDvGBIXtG0fDoY86
 +ueCl2JAEmf4+g8crfbyMkgXyRo6M9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() only updates cur_master->hw_cdm for a
writeback with a job or for DP, so a modeset of a writeback without a job
keeps the CDM of the previous reservation, which the crtc may no longer
own.  dpu_encoder_helper_phys_cleanup() later unbinds that CDM from its
pingpong and flushes it, changing a block which may by then belong to
another display.

Store NULL when no CDM is assigned.

Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8fcd0b4e266c..b337f197d3f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1160,6 +1160,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_cdm = NULL;
 	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
@@ -1231,14 +1232,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
-	    dpu_enc->disp_info.intf_type == INTF_DP) {
-		struct dpu_hw_blk *hw_cdm = NULL;
-
+	    dpu_enc->disp_info.intf_type == INTF_DP)
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 					      drm_enc->crtc, DPU_HW_BLK_CDM,
 					      &hw_cdm, 1);
-		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
-	}
+
+	dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 
 	/*
 	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not

-- 
2.47.3

