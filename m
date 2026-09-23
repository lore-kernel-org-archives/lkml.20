Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F1485957
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159240; cv=none; b=prOSllpzIsBmKWkwvVEgW/DsD4nyq+yoli29qMK8QZ4S+2+R5A1Df6G/AFV2JVuTOd39j9RvDUfQz0Jw+ivkFnPjUKsyDUZdG61b4Q/pACGL4l5GlCkxRkaiXCSKx7Y7dRinRdCiZBktULwz0C65J27SS+RdnPC03S1T3wVb9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159240; c=relaxed/simple;
	bh=ly4kXK3g4RHYieCcF9yXfKUK2bcBelfBx2mF2g4Vcok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfSs6iqi6CtsA1aXpUMBlcLoSUCpo1iWVT+01VjdNdsxfemEvApGZbTvMyPGZq7Z8gi/0QwohcWSkPqd5xa6Qfo6BZRlqq+TWE0oYrxNTqdKxMnR78wumbENrg8CVWrW+BSy00/3AIBAiuEoxXnQ4Njnn+Lj3MDbKb9m3LsY+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTKq6dA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DK8TBUz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTKq6dA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DK8TBUz+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2bC82236686
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo+l5njIHZlGj6AVYawalEZzoTsufs6WMa47twyjgKI=; b=JTKq6dA54sZ20vCq
	Ihq6aw436AXVNJZBeJpDjtRf5fVPgXhW/iHyo7k9C2UsYmWbzwJuBLbU4EecpZMq
	p5/hFwK8llY3FmBuhjkmrtbDH0Hxq840lkZRH0+zpbi2ueR30bWflGuNNPe1mjir
	41sYeIT16CBJZM1/5wEX3Jao/kF96vZJeqzzHhdgVa8jEmzlv8YrK1VxK3Hg/zE7
	R0Tzh/52xhOyRLEu7RBI1dbiUOMJDy/gBWqHhBkzsMDbSO6aWDA1uw14gUGsZ80p
	B4moxPJvbl9zgqKx/JfzZjV4hto791mOwijT7rtVr2EvAOS4ZH89L40qkJjiL0Ag
	VV4Fgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gacm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bee712354so928082eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159224; x=1790764024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo+l5njIHZlGj6AVYawalEZzoTsufs6WMa47twyjgKI=;
        b=DK8TBUz+HUrY1wwzKWvZVmCzNxBPPiERkqv3pvBKG+W29VNzMiHYl5vS8Ipb6UKmI7
         //jRO5sp4ws4jJ6z/SO8kSaUkL3oWbBG5YqUAYk/zKDZ2SskEMujZb9o3xHtqus3paDK
         HJJugeAn+SeIh4W8tRQIZtQw9a2HByhc6qPUWkdsgUyyrmeOTCQwW2H0VX3YoK4F0q+k
         5WGEQGOI4fNUAQc7c5ZZg2gnMbyTDhQFiaAraj6HS+SDYXvQc52Sfnw4bzQl96Hq0w4r
         X/pjKzQRxE0UfHnsGQOgYV0tBWMW3F9jyjlDtpyYDzRd/NrDW2axBhmsZw7/r4R3V0Me
         Bzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159224; x=1790764024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fo+l5njIHZlGj6AVYawalEZzoTsufs6WMa47twyjgKI=;
        b=Bcqc2krQ//ClK9WOP7ptdm0YcRlX2TVfHJCNd7mKp+SWlN2Ljw7HQqkI7LpMCxo871
         TXgPcy7gXmptwlew1Ft/STtpCYkMcmy2agg3BNOKVlU/2iKxJZmtKFsuz4l5RqJT/tOH
         YesTPrYKZFtuiBLvI5onUrCQnTbbz40Oyp5a2d1m7kc5KkJvnpv8tZ61/ySQzb6ABJVw
         RjFkhkcH6KIS8If+s+65wqU2L66XQYeqSbrKWSGsAfXWeavZ9opgpzJ9Fb09EjB5PMMe
         KYUWfxdr2MhIUuIKiLvNAfWOPBV4tQU/jjpP4Q/fTEJqcK3lbSMbrYCbYnthBrsyasvD
         +EcA==
X-Forwarded-Encrypted: i=1; AKwUvBzK5uaXOxfPMKtiroKRbGxRDnV17bsvT5lGqJo2kd2UPs311csbVt0O2NPAJhZoudWg8vVZUL0G+dI7hAw=@vger.kernel.org
X-Gm-Message-State: AFuF++malVevK66hlKMhuOLyiGCTu+p/dVGGnA1HMoJXg1e+K2KtsM/O
	0O2oQLUIbEZPqT7knNgazvN6bzmKrQYPTU8qYH05z4dfGKxe5zqnrJ19vusf8ZROL4ED2SyDSfO
	HlhxTW9LvbDqJ3BJNyEFfTJVwbrIXqnXFzUd93rilJ9ib61GyoLFOX1al+LkIzPhaA6U=
X-Gm-Gg: AYBFou0RTD2H1tIFH5HfMvdibrsjOROURYrAT+g1RZU3N1j3KPqWLs5SeuGNLNd9OIB
	/IsvjmhjqvzUCOvYEZyNW3iaqf0sLKrKtvwmAz3NZM3rf5A7i1+3qCA2T06gF5Qs4dbTXkPp2LK
	OEWGvFEnqCQN8TV6i1Hfcw4Y9zmTgMaqG2hTy/c/HalOUE4tllieW18+9+dSsm7d/Ya5zFRJnpb
	0/+ucOtXqT4IR5S/4R+0C+dD974yna+tb2SPW0TRyUe6hAvglbkWiaGafVLAdXWmM0kT8gbNqym
	xX2Bj5rkS0Y4st8Yd0dEkEDIpMdx8LblQXAt5PjoWLLAi0K6eEOpLfdSS+A4wWsh2w8yjFp/rAO
	UUwJKh2PeeTyPoPgUJEYoWSoJzQtLskPBvQ==
X-Received: by 2002:a05:701b:4554:20b0:143:761a:863e with SMTP id a92af1059eb24-144f9c57ec1mr2119994c88.44.1790159223539;
        Wed, 23 Sep 2026 03:27:03 -0700 (PDT)
X-Received: by 2002:a05:701b:4554:20b0:143:761a:863e with SMTP id a92af1059eb24-144f9c57ec1mr2119959c88.44.1790159222818;
        Wed, 23 Sep 2026 03:27:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:02 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:47 +0530
Subject: [PATCH 07/15] drm/msm/a8xx: Add Adreno 850 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-7-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=25643;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ly4kXK3g4RHYieCcF9yXfKUK2bcBelfBx2mF2g4Vcok=;
 b=hfNxDemKXgbZhzpGe1zz3MmPE3P/bYP8sSjLTi/JRbcotg5DHnMU2D6Gb25r7oXYsIn1qKJlo
 gc3nYInZnqnDhHRO3/m9fHvfNztI10RXbKIGyi5yxF/H9rXCUTxCnLK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: g975lELBv28P-cJWLC7gLAR6yz_fo3Gp
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3a978 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kGRJA6_3IbFtNegcoWYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX9zqxb65SeA3t
 LETA8ljTz61wk8ZZy4S9CbOyBikCvlnobleJHPzYuHAvK6gdZdQL1FFsNf3SC6Kgv9xiAcyO1M9
 qFAOJMpTkEhh3aO8QBLOVU7kze0ijCAk3rwic6RtBxkxaoKzCyxayfJ7OQd1Rkgrzm/ZUEvLPvo
 qlkUPZWZTcMYKSQ+hl8t5+RkHIyZNxQn6uvSIlaV6GkBxpExcc2TrmPUPEYOeFH6jw6M8iXfgDw
 gHcaNyTu556GqBqmiv9QXH2N88gDdm/nmr9+bU+6P5BjfJwtoX6OxUEm+z7Zqf9atuaiKlx+auY
 ytbzb2KS6mAuS8ozEVAms3s/SGyvwpDl9YKysxWJz6B4cAQXbWFSqc/v8+/ljH7pbj/8RmwXRMv
 lUstruEE3+dBQQEY1MJGrUDS7DCyMIRhb3T+ySMaFT4paH8LAc9JYN9wtiq5E49LJ0C6QTaZMdf
 OjQfFe4vkHBNtGq5McQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX4luFCJ8gVuwU
 CTSH9j81UYBHNIoOujDgB3moQdVOwn7TpngS92ZGtqYjIKgJUJgZ/bL7GJzkeu7C6A2sS6Ml20d
 ShmwzeBHOkNn/LRA5W0ai6ka3bBMEwE=
X-Proofpoint-GUID: g975lELBv28P-cJWLC7gLAR6yz_fo3Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shares
the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
architectural improvements. There is a new block Matrix ALU (MALU) which
helps to accelerate certain compute workloads. Also, there is a new Bx rail
that powers a part of the GPU IP. GMU is now powered by a dedicated GDSC
powered by MxG rail.

Add a new catalog entry along with the necessary register lists and
additional changes to support the aforementioned new features.

Hawi SoC support UBWC v7.0, but GPU is unaffected by this upgrade.

Assisted-by: LLM
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 343 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  50 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |   1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |  16 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |   8 +
 6 files changed, 414 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 90a0c7ffb3c8..de576816ec7c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2397,6 +2397,307 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 };
 DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
 
+static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_5, BIT(28), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) },
+	{ },
+};
+
+static const u32 a850_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
+	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
+	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df5, 0x0003),
+	A6XX_PROTECT_RDONLY(0x00df9, 0x0007),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
+	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
+	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
+	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
+	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
+	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1ac00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1cc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
+	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
+	A6XX_PROTECT_NORDWR(0x27882, 0x0035),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+DECLARE_ADRENO_PROTECT(a850_protect, 15);
+
+static const u32 a850_pwrup_reglist_regs[] = {
+	REG_A8XX_RB_CMP_NC_MODE_CNTL,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
+	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
+	REG_A7XX_SP_READ_SEL,
+	REG_A8XX_CP_MULTIDRAW_CNTL,
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
+	REG_A6XX_TPL1_DBG_ECO_CNTL,
+	REG_A6XX_TPL1_DBG_ECO_CNTL1,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A8XX_UCHE_CCHE_MODE_CNTL,
+	REG_A8XX_UCHE_HW_DBG_CNTL,
+	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_UCHE_CLIENT_PF,
+	REG_A8XX_UCHE_DBG_ECO_CNTL_0,
+	REG_A8XX_UCHE_GBIF_GX_CONFIG,
+	REG_A8XX_UCHE_TRAP_BASE,
+	REG_A8XX_UCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
+	REG_A8XX_UCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL,
+};
+DECLARE_ADRENO_REGLIST_LIST(a850_pwrup_reglist);
+
+static const u32 a850_ifpc_reglist_regs[] = {
+	REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
+	REG_A8XX_RBBM_NC_MODE_CNTL,
+	REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
+	REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
+	REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
+	REG_A6XX_SP_CHICKEN_BITS,
+	REG_A7XX_SP_CHICKEN_BITS_2,
+	REG_A7XX_SP_CHICKEN_BITS_3,
+	REG_A8XX_SP_CHICKEN_BITS_5,
+	REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
+	REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
+	REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
+	REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
+	REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
+	REG_A6XX_SP_NC_MODE_CNTL,
+	REG_A6XX_SP_PERFCTR_SHADER_MASK,
+	REG_A8XX_SP_L0_PERF_TUNE,
+	REG_A8XX_CP_PROTECT_GLOBAL(0),
+	REG_A8XX_CP_PROTECT_GLOBAL(1),
+	REG_A8XX_CP_PROTECT_GLOBAL(2),
+	REG_A8XX_CP_PROTECT_GLOBAL(3),
+	REG_A8XX_CP_PROTECT_GLOBAL(4),
+	REG_A8XX_CP_PROTECT_GLOBAL(5),
+	REG_A8XX_CP_PROTECT_GLOBAL(6),
+	REG_A8XX_CP_PROTECT_GLOBAL(7),
+	REG_A8XX_CP_PROTECT_GLOBAL(8),
+	REG_A8XX_CP_PROTECT_GLOBAL(9),
+	REG_A8XX_CP_PROTECT_GLOBAL(10),
+	REG_A8XX_CP_PROTECT_GLOBAL(11),
+	REG_A8XX_CP_PROTECT_GLOBAL(12),
+	REG_A8XX_CP_PROTECT_GLOBAL(13),
+	REG_A8XX_CP_PROTECT_GLOBAL(14),
+	REG_A8XX_CP_PROTECT_GLOBAL(15),
+	REG_A8XX_CP_PROTECT_GLOBAL(16),
+	REG_A8XX_CP_PROTECT_GLOBAL(17),
+	REG_A8XX_CP_PROTECT_GLOBAL(18),
+	REG_A8XX_CP_PROTECT_GLOBAL(19),
+	REG_A8XX_CP_PROTECT_GLOBAL(20),
+	REG_A8XX_CP_PROTECT_GLOBAL(21),
+	REG_A8XX_CP_PROTECT_GLOBAL(22),
+	REG_A8XX_CP_PROTECT_GLOBAL(23),
+	REG_A8XX_CP_PROTECT_GLOBAL(24),
+	REG_A8XX_CP_PROTECT_GLOBAL(25),
+	REG_A8XX_CP_PROTECT_GLOBAL(26),
+	REG_A8XX_CP_PROTECT_GLOBAL(27),
+	REG_A8XX_CP_PROTECT_GLOBAL(28),
+	REG_A8XX_CP_PROTECT_GLOBAL(29),
+	REG_A8XX_CP_PROTECT_GLOBAL(30),
+	REG_A8XX_CP_PROTECT_GLOBAL(31),
+	REG_A8XX_CP_PROTECT_GLOBAL(32),
+	REG_A8XX_CP_PROTECT_GLOBAL(33),
+	REG_A8XX_CP_PROTECT_GLOBAL(34),
+	REG_A8XX_CP_PROTECT_GLOBAL(35),
+	REG_A8XX_CP_PROTECT_GLOBAL(36),
+	REG_A8XX_CP_PROTECT_GLOBAL(37),
+	REG_A8XX_CP_PROTECT_GLOBAL(38),
+	REG_A8XX_CP_PROTECT_GLOBAL(39),
+	REG_A8XX_CP_PROTECT_GLOBAL(40),
+	REG_A8XX_CP_PROTECT_GLOBAL(41),
+	REG_A8XX_CP_PROTECT_GLOBAL(42),
+	REG_A8XX_CP_PROTECT_GLOBAL(43),
+	REG_A8XX_CP_PROTECT_GLOBAL(44),
+	REG_A8XX_CP_PROTECT_GLOBAL(45),
+	REG_A8XX_CP_PROTECT_GLOBAL(46),
+	REG_A8XX_CP_PROTECT_GLOBAL(47),
+	REG_A8XX_CP_PROTECT_GLOBAL(48),
+	REG_A8XX_CP_PROTECT_GLOBAL(49),
+	REG_A8XX_CP_PROTECT_GLOBAL(50),
+	REG_A8XX_CP_PROTECT_GLOBAL(51),
+	REG_A8XX_CP_PROTECT_GLOBAL(52),
+	REG_A8XX_CP_PROTECT_GLOBAL(53),
+	REG_A8XX_CP_PROTECT_GLOBAL(54),
+	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(63),
+};
+DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
+
+static const struct adreno_reglist a850_gbif[] = {
+	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
+	{ REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
+	{ REG_A6XX_GBIF_CX_CONFIG, 0x20023020 },
+	{ },
+};
+
+static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] = {
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_5, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
+	{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) },
+};
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a850_dyn_pwrup_reglist);
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44070001),
@@ -2524,6 +2825,48 @@ static const struct adreno_info a8xx_gpus[] = {
 			{ 242, 1 },
 			{ 221, 2 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x44051401),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen81100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen81100_gmu.bin",
+			[ADRENO_FW_AQE] = "gen81100_aqe.fw",
+		},
+		.gmem = 18 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a850_protect,
+			.nonctxt_reglist = a850_nonctxt_regs,
+			.pwrup_reglist = &a850_pwrup_reglist,
+			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
+			.ifpc_reglist = &a850_ifpc_reglist,
+			.gbif_cx = a850_gbif,
+			.max_slices = 3,
+			.gmu_chipid = 0x80b0100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 32 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 19708 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 284, 2 },
+			{ 216, 3 },
+		),
 	}
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14d422d7ab95..f766e5e4c7b5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -145,6 +145,19 @@ bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
 	if (!gmu->initialized)
 		return false;
 
+	/*
+	 * Use the CX_MISC_GFX_PWR_CLK_STATUS register instead of the GMUCX
+	 * register to ensure correct GDSC and clock status reporting even
+	 * when the GMU MX domain is powered off
+	 */
+	if (adreno_is_a850(adreno_gpu)) {
+		val = a6xx_cx_misc_read(a6xx_gpu, REG_A8XX_CX_MISC_GFX_PWR_CLK_STATUS);
+
+		return !(val &
+			(A8XX_CX_MISC_GFX_PWR_CLK_STATUS_GX_GDSC_POWER_OFF |
+			 A8XX_CX_MISC_GFX_PWR_CLK_STATUS_GX_CLK_OFF));
+	}
+
 	val = gmu_read(gmu, REG_A8XX_GMU_PWR_CLK_STATUS);
 
 	return !(val &
@@ -645,7 +658,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	if (!test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
 		return;
 
-	if (adreno_is_a840(adreno_gpu))
+	if (adreno_is_a840(adreno_gpu) || adreno_is_a850(adreno_gpu))
 		bitmask = BIT(30);
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
@@ -2170,6 +2183,9 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
 
+	if (!IS_ERR_OR_NULL(gmu->gmu_mxpd))
+		dev_pm_domain_detach(gmu->gmu_mxpd, false);
+
 	if (!IS_ERR_OR_NULL(gmu->qmp))
 		qmp_put(gmu->qmp);
 
@@ -2314,7 +2330,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	struct device_link *link;
+	struct device_link *gmu_mx_link = NULL;
+	struct device_link *cx_link;
 	resource_size_t start;
 	struct resource *res;
 	int ret;
@@ -2461,12 +2478,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
-	if (!link) {
+	cx_link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
+	if (!cx_link) {
 		ret = -ENODEV;
 		goto detach_cxpd;
 	}
 
+	/* Optionally attach the GMU MX power domain */
+	gmu->gmu_mxpd = dev_pm_domain_attach_by_name(gmu->dev, "gmu_mx");
+	if (IS_ERR(gmu->gmu_mxpd)) {
+		ret = PTR_ERR(gmu->gmu_mxpd);
+		goto detach_cxpd_link;
+	}
+
+	if (gmu->gmu_mxpd) {
+		gmu_mx_link = device_link_add(gmu->dev, gmu->gmu_mxpd, DL_FLAG_PM_RUNTIME);
+		if (!gmu_mx_link) {
+			ret = -ENODEV;
+			goto detach_gmu_mxpd;
+		}
+	}
+
 	/* Other errors are handled during GPU ACD probe */
 	gmu->qmp = qmp_get(gmu->dev);
 	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
@@ -2508,7 +2540,15 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (!IS_ERR_OR_NULL(gmu->qmp))
 		qmp_put(gmu->qmp);
 
-	device_link_del(link);
+	if (!IS_ERR_OR_NULL(gmu_mx_link))
+		device_link_del(gmu_mx_link);
+
+detach_gmu_mxpd:
+	if (gmu->gmu_mxpd)
+		dev_pm_domain_detach(gmu->gmu_mxpd, false);
+
+detach_cxpd_link:
+	device_link_del(cx_link);
 
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 3f96b10b5f61..d3f6cd8b9741 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -77,6 +77,7 @@ struct a6xx_gmu {
 
 	struct device *gxpd;
 	struct device *cxpd;
+	struct device *gmu_mxpd;
 
 	int idle_level;
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index add93c1fa039..a5b5e4286e4e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -286,10 +286,11 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
-	if (ubwc_version > UBWC_6_0)
+	if (ubwc_version > UBWC_7_0)
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 
-	if (ubwc_version == UBWC_6_0)
+	if (ubwc_version == UBWC_6_0 ||
+	    ubwc_version == UBWC_7_0)
 		yuvnotcomptofc = true;
 
 	if (ubwc_version < UBWC_5_0 &&
@@ -726,6 +727,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	for (pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
 		u32 apriv_mask = A8XX_APRIV_MASK;
+		u32 int_mask = A8XX_CP_INTERRUPT_STATUS_MASK_PIPE;
 		unsigned long flags;
 
 		if (pipe_id == PIPE_LPAC)
@@ -734,10 +736,16 @@ static int hw_init(struct msm_gpu *gpu)
 		if (pipe_id == PIPE_BR)
 			apriv_mask = A8XX_BR_APRIV_MASK;
 
+		/*
+		 * A850's BV pipe raises a spurious RTWROVF fault interrupt;
+		 * mask it off to avoid false fault recovery.
+		 */
+		if (adreno_is_a850(adreno_gpu) && pipe_id == PIPE_BV)
+			int_mask &= ~A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_RTWROVF;
+
 		a8xx_aperture_acquire(gpu, pipe_id, &flags);
 		gpu_write(gpu, REG_A8XX_CP_APRIV_CNTL_PIPE, apriv_mask);
-		gpu_write(gpu, REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE,
-				A8XX_CP_INTERRUPT_STATUS_MASK_PIPE);
+		gpu_write(gpu, REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, int_mask);
 		gpu_write(gpu, REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE,
 				A8XX_CP_HW_FAULT_STATUS_MASK_PIPE);
 		a8xx_aperture_release(gpu, flags);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bd5c440f1753..f99cf5962344 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -612,6 +612,11 @@ static inline int adreno_is_a840(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x44050a01;
 }
 
+static inline int adreno_is_a850(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44051401;
+}
+
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 69dd0446f8d2..e6e56969a9b8 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -269,6 +269,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x08b2" name="CP_CHICKEN_DBG_PIPE" variants="A8XX-"/>
 	<reg32 offset="0x0842" name="CP_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg32 offset="0x0843" name="CP_DBG_ECO_CNTL" variants="A6XX-A7XX"/>
+	<reg32 offset="0x084a" name="CP_MULTIDRAW_CNTL" variants="A8XX-"/>
 	<reg32 offset="0x084b" name="CP_DBG_ECO_CNTL" variants="A8XX-"/>
 
 	<bitset name="a6xx_cp_protect_cntl" inline="yes">
@@ -1326,6 +1327,7 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x0c00" name="VSC_DBG_ECO_CNTL"/>
 	<reg32 offset="0x0df0" name="VSC_KMD_DBG_ECO_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x0df8" name="VSC_VISIBILITY_FLUSH_CNTL" variants="A8XX-"/>
 	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" usage="cmd" variants="A6XX-A7XX">
 		<bitfield name="BINW" low="0" high="7" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="16" shr="4" type="uint"/>
@@ -4352,6 +4354,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xae0a" name="SP_CHICKEN_BITS_3" variants="A7XX-" usage="init"/>
 	<reg32 offset="0xae0b" name="SP_CHICKEN_BITS_4" variants="A8XX-"/>
 	<reg32 offset="0xae0c" name="SP_STATUS"/>
+	<reg32 offset="0xae0e" name="SP_L0_PERF_TUNE" variants="A8XX-"/>
 
 	<reg32 offset="0xae0f" name="SP_PERFCTR_SHADER_MASK" usage="init">
 		<!-- some perfcntrs are affected by a per-stage enable bit
@@ -4389,6 +4392,7 @@ by a particular renderpass/blit.
 
 	<reg64 offset="0xae10" name="SP_HLSQ_GC_GMEM_RANGE_MIN" variants="A8XX-"/>
 	<reg64 offset="0xae12" name="SP_HLSQ_LPAC_GMEM_RANGE_MIN" variants="A8XX-"/>
+	<reg32 offset="0xae14" name="SP_CHICKEN_BITS_5" variants="A8XX-"/>
 	<reg32 offset="0xae15" name="SP_LPAC_CPI_STATUS" variants="A8XX-"/>
 	<reg32 offset="0xae16" name="SP_LPAC_DBG_STATUS" variants="A8XX-"/>
 	<reg32 offset="0xae17" name="SP_LPAC_ISDB_BATCH_COUNT" variants="A8XX-"/>
@@ -5094,6 +5098,10 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
 	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0083" name="CX_MISC_GFX_PWR_CLK_STATUS" variants="A8XX-">
+		<bitfield name="GX_GDSC_POWER_OFF" pos="3" type="boolean"/>
+		<bitfield name="GX_CLK_OFF" pos="4" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x0087" name="CX_MISC_SLICE_ENABLE_FINAL" variants="A8XX"/>
 	<reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
 		<bitfield pos="0" name="FASTBLEND" type="boolean"/>

-- 
2.55.0

