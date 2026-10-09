Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C04DE716
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551981; cv=none; b=ov/KeMsRZwdZJFus2RtULBTkwfkW7AEbwDBi73OqUCSoBby5ZpR+ANOw6ahNKwI3ERABanxElCMR8hhP17ykU6ZIOJOsFryPUjpYqv6CjBoD0dVt7X7a+AsI1OdIteoeUUI+Fv+Bd/LJI/uuQ3HgCPBFsaH0qFFANLHf3jbdV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551981; c=relaxed/simple;
	bh=8F7ncVJr8+D4X0wcIsfrKdILXvhgsSXVVg4EjjW9Izw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iv7ZufPg/EKDfQClGrMe+oWP0WuFBW0HZtsLyj7+hL3ReQrRksgun5Q3ljHTtd2UM3G+n6u/xACNB7GGgwalY91HMP0nHc07STiGByQP4pdWvNUhVWZxQrPzRo67VXf0xQn7aCnGNQuDaDIjBTucQqhFVLmqQuo8/h3YcgJIkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIfJ0SSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBGj9/sf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIfJ0SSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBGj9/sf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJpQ404419
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lHYrzeSQljh
	SXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=; b=SIfJ0SSeg8QQMpGBVg6tkyITkrf
	L17Z8hEmZWj5tPCHzCq1hRM4hgh9cGB2/y3BkKoT/7ODn/g4KOll9QXGiLR5Qbce
	n+U3GZtlvY/ijAdPsCWrF4Q42/XxIByRdWWHY7B3QAvQ82zeWUfBhRl67PTMRJEs
	RrTxGEM6MFAQ96bwAisAtXZc8GjxLL5wmUETLYDqP4e3OkL23oTYHuxKfUTY5xg3
	bGnJ3D7JwloyM5mC/BLt+z4KUCmrzADiT/8/s50uMZHK6d9GyCxpDTVKMLYiGXl3
	mZlyHFWmESuhxjN4fGLGJmKdIgYAGq0amzc1FsTft9fv/i6TbQc++EHh5dg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk3q29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:19:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so1448086a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551977; x=1792156777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=YBGj9/sfamZJEQZUh0gy+u07PcQu9zpPRCYGMJDDeqCW3rHZ67hBv5Hr5wvL0UDbD5
         6A+KnUqEoDGvqR6L5HMTM0rp8RHUrWfPccgS6K11rYyk9x/gvwOjGb4LMnFK5xjYSHqG
         N3hN8TMOmKweWMFbABCKPye32tSEDAWe1vPU1NAjpNBWFZZVLiNDOOtG06g3pm+ghbch
         MOATpuqLV35MaMR/tB0DFaW3myvDR6feA/rRsXRKmPtaeUR8UI8oAU3mP4dLyI1HB7E9
         3H+HmsgKt6PFWA9XwD8TCO/UJphRbIVih6Z2p7TRmrSmSvZAM1vBLPBWLPXt+Wek7r0U
         WnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551977; x=1792156777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHYrzeSQljhSXcWIfXDm+2yArtTaNKlLE8yfNxhVQTc=;
        b=u/sx01iih6OmAOW76E0IFkfSGTiIPtzLRuKKrGP2W/siohQmT5pMIweA4JpqE4RgXH
         /OY9zdT9L1I+BX/cDm0QpJpd10QIQHsmNl2c9xr6D+mxTAEBD68cP4UHY/yzCDZY3Kmt
         FHq8wo8LVno9A4gtOc3kpDTuvJtE1TtCkVgbno2iMCW05n5GxZC8ew2CDGZkSgsruT2v
         SQssbCfItTWN18AngD4DfwlpDxyg83wg46nmsvM7N84pqd2rLLQIJ37UJ3n70ikqH/u8
         tbKraz/LvP/EhnWswfo82E0lswqEbQCacYYYYn4kCsBHpGO+W1DSIVL2vPqgKBGR/A+4
         ps7g==
X-Forwarded-Encrypted: i=1; AKwUvBwT/LmL/p5J/O8RybLYxISbrcKgMAGV63ILbjBhlIl2buS+Fxwv6h1x+2G41PTIkgyjVsEW75I+uXUJrx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS+aoPKLhRqpdKVtlmD5D9e3cNNmmrcwL7Xt4hAhRDRbbglzq0
	A5oYSlKZAg6SzfEcjEDg7kGC/9tQyXnLm5Gcosxn2ohhJl2FnYObnrwQooIV3MHcWZtFPN8Mlm5
	MYZpjU1f2hmaxzfOsml5nthLBNHHw6h/jpbqXzXjYkcayVMpwA8KgfXqwVXSA7fEPkOM=
X-Gm-Gg: AYBFou12wRI2Se9rq2Adqt4doxGSbrA/mWvLQIZE6MiCUsm+rH8h4OnTrFxv3uEmndI
	0YAeWgnIUN7pjSD7KDVyNTDmRfdKWNkMSX18J2FmjEctT+pQ1HLGDC0QrtMSgtJBGfx7DVGCBY5
	Dbsod40NERJvOjKjORPtvcJNluXtMi1t7HT8+9y/hngYrH0YKcAq9JC3iJ2NUEuTlQ+XW9oR4jF
	DDhQ3tndrtdZiHeE2PADJClhAWNZK5yFBmblMI0XGyJSsuyQclzigT1oWkCkI40xTsaBmcVnyzt
	Yq24AeZRsXBGNa1lqF/zJfSOlLHZopDYqhXmjnPAGLpTXK7QS6lQ52z4Rc2GHkj4wqEGHuFPDjw
	LS35NRS10rrwPqPcjSoqTmfB1Xcr2DtDUiWdpVKdOVWlPTXM=
X-Received: by 2002:a17:90b:3a43:b0:3a8:23eb:d1d0 with SMTP id 98e67ed59e1d1-3ab36f0dc09mr1733497a91.52.1791551977102;
        Fri, 09 Oct 2026 06:19:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3a43:b0:3a8:23eb:d1d0 with SMTP id 98e67ed59e1d1-3ab36f0dc09mr1733470a91.52.1791551976557;
        Fri, 09 Oct 2026 06:19:36 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e082e4sm910227a12.10.2026.10.09.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:19:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
Date: Fri,  9 Oct 2026 06:19:21 -0700
Message-ID: <20261009131927.551319-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
References: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8e9ea cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lSLAbbbIx1VGLg0Ku8YA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zj8_IYdvyxVCz92cOGNlF4LanUNOy7YK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXyUtnirk38Cxr
 fS6Y6lPVlT+W5H3ug4jBB4ZEmRhp1mzONeT2J2JcE+MfYAfIJ6zfI2rXnNbAaTaykiyRjBxcEyQ
 3VpXmyNBrp2uXCMlph/jm+G9NgZ+rmM=
X-Proofpoint-ORIG-GUID: zj8_IYdvyxVCz92cOGNlF4LanUNOy7YK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX4/TMxZBvOdeh
 4adyCv2xfRpGh6G4sAU8cr9NKfuveDfMRvfBsFQR/kRU0owLDwby0cGjiZFsj7EpW0Vo0YINb3m
 GpUzzcen84x9Y7rYwSvPvv0gFCRlSIt3PW7ntCTJ1BA3TQSmg8aHyxlmPUBTJi1zFABQRh85Z8A
 jeqm6oQplG99vA3OqwFDL8Kgd8R/2+PaDjcr4k9HuetojErI9qFfu3oDqEpgsQzu+wXL1AvYfQv
 ICebUPHLQGlVEsVFx5pGOKbPvYVFSZyBlnCHu/GKeoPEY+h6QZkGYRDhLSiMfy9A5Er/QLMYN/X
 fCTAeRpE49uX+UoiyOJfrphKmyA4MTLcWbvLLbsNfqbdVnjW0/vnydKWSovL8+uCqsnGZi65jyZ
 WeZUTwiwfKaNtI5vFu+gxOMKwMPxPB1ykwYR1EluqpAWMOzZNoaunJMGotF9rJCrOZPToF9q0Dp
 vIrRysZO8ylb34DgVNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

It is a bit more a6xx than a7xx, and this simplifies the next patch.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 168 +++++++++++-----------
 1 file changed, 84 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 7319f3ed6968..b44b0fd916aa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -678,6 +678,65 @@ static const struct adreno_reglist a640_gbif[] = {
 	{ },
 };
 
+static const struct adreno_reglist a702_hwcg[] = {
+	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
+	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
+	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
+	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
+	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
+	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
+	{}
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1129,69 +1188,34 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
-	}
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
+		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
+		.fw = {
+			[ADRENO_FW_SQE] = "a702_sqe.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a6xx_gmuwrapper_funcs,
+		.zapfw = "a702_zap.mbn",
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a702_hwcg,
+			.protect = &a650_protect,
+			.gbif_cx = a640_gbif,
+			.gmu_cgc_mode = 0x00020202,
+			.prim_fifo_threshold = 0x0000c000,
+		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 236, 1 },
+			{ 178, 2 },
+			{ 142, 3 },
+		),
+	},
 };
 DECLARE_ADRENO_GPULIST(a6xx);
 
-static const struct adreno_reglist a702_hwcg[] = {
-	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000081 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
-	{ REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01202222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05522022 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
-	{ REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
-	{ REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_FCHE, 0x00000222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_FCHE, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_GLC, 0x00222222 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_GLC, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL_MHUB, 0x00000002 },
-	{ REG_A6XX_RBBM_CLOCK_DELAY_MHUB, 0x00000000 },
-	{ REG_A6XX_RBBM_CLOCK_HYST_MHUB, 0x00000000 },
-	{}
-};
-
 static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
@@ -1454,30 +1478,6 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
-		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
-		.fw = {
-			[ADRENO_FW_SQE] = "a702_sqe.fw",
-		},
-		.gmem = SZ_128K,
-		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.funcs = &a6xx_gmuwrapper_funcs,
-		.zapfw = "a702_zap.mbn",
-		.a6xx = &(const struct a6xx_info) {
-			.hwcg = a702_hwcg,
-			.protect = &a650_protect,
-			.gbif_cx = a640_gbif,
-			.gmu_cgc_mode = 0x00020202,
-			.prim_fifo_threshold = 0x0000c000,
-		},
-		.speedbins = ADRENO_SPEEDBINS(
-			{ 0,   0 },
-			{ 236, 1 },
-			{ 178, 2 },
-			{ 142, 3 },
-		),
-	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
 		.family = ADRENO_7XX_GEN1,
 		.fw = {
-- 
2.55.0

