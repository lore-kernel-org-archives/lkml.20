Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837845;
	b=RV/RIS8b/HcrfSEJ0or1ooVd3FuEg9l+8u3+zvKolRZ6Kk4odXRYKzvL2qkcwdB4zq8I
	 CMGXpj5Sr1oqm4FzZtEtBmlGMa2AKpNN1PsRsS0jfg1O9nFA7tw8T2j9Suh8KSrnx5iRy
	 JpunY4UyaIv9RRty++suQV5LYDWhc2I2lZRLQuiiVv+FT3nKkuGxn94DESovAWhbBonur
	 1x/bcgbCdmKj9iueEN49U8uULEUQB8bqgtXna1/MzPN+Y/8CcjYrXRAaBccXPd/WMISpB
	 PPn+ocVxKKZneqJTFALRCoxZ1lclRtkc397O4+TdTEjo6WERVgygfnbY13Jpa3TGb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j94BsXEDA7Y1sr27o39tNrIVO8VP/cqZsrlA9BINVVU=;
	b=NM/QS4A0WMVucckwHeJRgSqdn21HwaXYklijbvRCv9Z1HVnwZLhQsgHmmaWG6GPwPrGS
	 dvu0Ba0q70jLjxbJr9gM3f/knfn8VJGoPNVLFG3D/Ir+1GrbiKwaI/NkO4wLY7yrUSh6/
	 389dYeHwMgS+6qhawChZQU+VfflkFz2A/p5auYiVx3nzir07ef4hZkWiMFOAxVvgeAbWD
	 QJu7DFl2XyZqHsQisZ3l+Q9aFoxEoVDxE6qFasCyqU7KQWAlpsGMQnc8MgRdvXs0Ej/ex
	 IfSYn7EUwbZ7OsyWnZpYaSH1Y0VB3XZ9qslt9Ry9hug8Qi+wEZVfUPIB0OWyUJBF+5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nVceZx+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ETcEQqHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A42606A328
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A42606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nVceZx+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ETcEQqHX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o2I82209316
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j94BsXEDA7Y1sr27o39tNrIVO8VP/cqZsrlA9BINVVU=; b=nVceZx+Oaxtl/yF+
	rwF9rjyA8ux6Mh0FvrAXnPM+l6DRVSpC6BmuD0SL2fwkzv353uXQwvI7YL1wgRHF
	mrMTGdfC0ocmKg9NxblJ/3qdn9LbmPqKE9h18nzGLHe3Ks/GUPSrDgpBx5UaRUba
	q1qt/476MZXdfLmAHo8ucKguqctLBFbhTlBNRVoyopmF910B85hSmZPw3IKQrgL3
	MAMGc8+N5IwEjwzNycScEZHlfoEe31DGhxudnBumyuQyfzhHssINMviOI9x8qBX5
	70FQCT08gHxtwmuZMq/DOS+Mf2jitFT2lexQBm4GGGB36UVCBIw8ymW33pgOQiX+
	zEZzzA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms8v9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18b5ee75447so6377200c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837844; x=1793442644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j94BsXEDA7Y1sr27o39tNrIVO8VP/cqZsrlA9BINVVU=;
        b=ETcEQqHXHCEi239kPbR5L4obrg6CQvLLibV0/iNcPmVsSUDmVzKkNnEp2wvwRg985i
         yAb4jpeNSFwkyriHFS/XYV7OTv7Tm5p3TqJjTDCkWBV50wvIvv3SeGI+LCNAxEPq2Zdl
         1nnYu0rJJi6JVpev602fLw0gh/0f1FOXRpWrL5Y2pIXG4p8E69xHU/tGvgMuK2dtwyEF
         hiX9YavHCrAgwCL/bxLgRW2UHIM+OCJesVkGeirSKG7triinkg8Ucybjf1nQtm6zlWc0
         usbMpw0cBMOz6QvS1EzAzfiwM3VhDgUBTYRrErjDNk0Bw8vmPlcGogWFUij69gXu8pcS
         RxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837844; x=1793442644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j94BsXEDA7Y1sr27o39tNrIVO8VP/cqZsrlA9BINVVU=;
        b=lLXBA212vdN/zit6b51Phnk3rEGbJBOgQO3GoxEoVqFBLWSHK9zTq/han2ZvkJMT1B
         J0H04Kjst7/O7WQVlRCjd1Zfhvnv2CQoubxkP7B+/s6EJ5IMYpHVk0S0W+7I/9CBupdL
         q8qahAPooAC3+G/ewulokXy7vJUniKlyg7osVYyidInG8aHcDgXZro5J/G0DHFeRY8RM
         Vwy44gxKHcygojHiktUDrtALiCQTco0uGzEMVYHMgS0cUqWfEYFPPzq2PwfRwt6Qo4yo
         7Zrh7AWqBa1PGaC6liycGRy8ns2ZQ4MveHwNsaAxrY/5wVHH6VeLaqLCnLilCbnCzEZO
         31EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGUIHBmb4Uctk0cGjNZ/WmtZkSFSXngw1quMdJOSnV7UiHtyQq39V9LzneTHh9TDMTSjzVlPxEBJJdBnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUOlErlW6IRmmqUbyVbZFhP/tmM4kdG4jnHE3/w4MrnccOgAMY
	XhqHb2M3HkJ7mo0VeB1imPSvMc59LhseLblK/68iZKM+/iUHP15r04Dxkx5GGXtcFq3/CP/veJE
	LA/SGU6JmKrHzFMKBCaEqXfb7qXfiDmZPn6258lz9XaIMaC+a3tN6ndIgVVBU384iI+M=
X-Gm-Gg: AYBFou01kirWKb16B7YvEZmI1WBbZ/0S93QxBTYAhYhFv5qS5KxYlv59cweLIQsFy5+
	i4r80Q+zO8pYjWx1DIa327XpUVB4CXDCLS+5oRxrcZhWTimu0EXk79sKmzULulV5FMgQNZdmatj
	m4EyHCYVsVfqavTNQiXf/J4iUgjrx+ZOOhnKwLcjZl4EMnjm+f129foXhmxJgcXWKqUZi/ylHTx
	ubvFN/6uYmPvVWR4sqx28EABwTuoYSeC0wyKufbSW209AF4MasomV5Cp4PW1035256/7+uNCT56
	mXKJ+tkxVx13Tsbx+Suum3niDYco+Gi1SA89li0czOqEbcOdZtNDypzzukwMGBUNVCnAm5YJdoh
	JMDrntISCZ+pb6VsmbrzdvWI=
X-Received: by 2002:a05:701b:4192:10b0:193:8116:f5bf with SMTP id a92af1059eb24-1993571a391mr2354242c88.16.1792837843871;
        Sat, 24 Oct 2026 03:30:43 -0700 (PDT)
X-Received: by 2002:a05:701b:4192:10b0:193:8116:f5bf with SMTP id a92af1059eb24-1993571a391mr2354211c88.16.1792837843365;
        Sat, 24 Oct 2026 03:30:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:09 +0530
Subject: [PATCH 3/8] drm/msm/a6xx: Fix stale boot up BW vote
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
Message-Id: <20261024-assorted-fixes-oct-v1-3-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=3775;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=voH+JkrR9QIo+7kjwDUt48OKHwoMp5q/sdC06buV3JQ=;
 b=gJ33HT1NFi3QtbiCd69PZDhwQT3+LvJ4P8gpJokrgedWIzmsFNZ3OH32KpgHg/+bCx6vhYX+U
 Sk82RMQNEA4DmaWZen2Ox3AVyt2QqTjk0DFcpZ1GVaFzu1e78kgoiTx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: naf2qHf6G9qlW4gjaRm4pNe7qBByjkYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXzLvxj2FHq7SA
 9r+du4O93Oc3/Gup6/W/ez8fkVj/hyb1QnHCYARpAKt7T19gnNBahL/nbjMloMtKRLGus+gBWZn
 gfg337kXLtsV1DwOfu0G/eu8fSDBmu9Oqkfg1PXJlPfAfJIVLJidEqf/lTxdIJHjah4c/l5sdmr
 3Sa6xAK+jbw12zoaimFxKZ+fpowwYtddYRaDrzrZ4YXwd5mMIHUWBmbXDZgv0vZU2e9zTjkZ/TA
 PfD7CaFUeqM4WNyZ/nl0nb9kCaT9oN22Zr7vf0uRTMhtlIQYX8oIm5xK//jwibYayLK+p+cEIMf
 7l3O4Bvb4nKoCkbP82vwmFhp2XP7ljGcVSTm8yo/7rUiRN5gfR3MMDw0ToKOJIkd5rqCva3q1E7
 U3LKNs9xR4o/c82QYrzlhgNvInWzrgGaI53/m4VkXZUM+U1/4R6OZFMNFowZuOMh6pKGo7H7xps
 kZpQVTensu/efnJiy2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX6WDY0BjUnxqL
 8n9G6CwgnYPb5DJvYlyc6mav3e2C104nTr6Bta3Irmq9oaFg5Cfnx9AC4yumg4TMdnIDje9Gy9+
 T5FqKzKPQr5/Zuzmkp0X9HM1z9Kg3+A=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adc88d4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=mfC4Gle6AAAA:8 a=daYzuOo6NrLquwzkd_0A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=aghUjlmjzLPIEfOzDLpx:22
X-Proofpoint-GUID: naf2qHf6G9qlW4gjaRm4pNe7qBByjkYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

An initial bus bandwidth is voted during boot to bring up the GMU. In GPUs
where the GMU drives bandwidth scaling, this boot-time BW vote is
redundant and can be removed.

Fixes: 7047e655a567 ("drm/msm: adreno: find bandwidth index of OPP and set it along freq index")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 +++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7e80670736a6..991db3c9cd96 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -76,6 +76,13 @@ static irqreturn_t a6xx_hfi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+bool a6xx_gmu_scales_bw(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+
+	return a6xx_gpu->base.info->a6xx->bcms && gmu->nr_gpu_bws > 1;
+}
+
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 {
 	u32 val;
@@ -169,7 +176,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 perf_index;
@@ -187,7 +193,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			break;
 
 	/* If enabled, find the corresponding DDR bandwidth index */
-	if (info->bcms && gmu->nr_gpu_bws > 1) {
+	if (a6xx_gmu_scales_bw(gmu)) {
 		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
 
 		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
@@ -1393,6 +1399,10 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
+	/* Clear the boot bus quota to allow GMU-driven BW scaling */
+	if (a6xx_gmu_scales_bw(gmu))
+		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+
 	return 0;
 
 disable_irq:
@@ -1913,7 +1923,7 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
 	/* Build the interconnect votes */
-	if (info->bcms && gmu->nr_gpu_bws > 1)
+	if (a6xx_gmu_scales_bw(gmu))
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index d3f6cd8b9741..b9e966e602e2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -239,6 +239,7 @@ bool a6xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
 bool a7xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
 bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+bool a6xx_gmu_scales_bw(struct a6xx_gmu *gmu);
 void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
 int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 6b34e704a70d..ac684d72d2b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -810,7 +810,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	if (!msg)
 		return -ENOMEM;
 
-	if (info->bcms && gmu->nr_gpu_bws > 1)
+	if (a6xx_gmu_scales_bw(gmu))
 		a6xx_generate_bw_table(info, gmu, msg);
 	else if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(msg);

-- 
2.55.0

