Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657071;
	b=C1Zpow6UG46eJ1KISH2h0RcNt+3vx7MvVLrIL4Bt0x2cVMrzG5zIRDC/IPJXA1Q8lpZu
	 1ztub6ulWiXoIvJSWrukjx9Hw0Tpum4Jm7f27avn8x7FhHhgISZXR60kNlpTrOwqp3YSB
	 fWypHKEoiLyJ5TGiUJe+fx5+2zOy0vIOU9/vjUDUkLooalYygPfqKACmveuttngeYRsrU
	 NlqXn6SWhxMNl65RK2+i71QVhI9x2PcXZmQ2n9Vwew7yg3Q+G1Zd+wY9zHiuTSsmS1f8a
	 /x4ZcOOZX+LN4I4tvgo2Y7ENDPbnh8yZCDIWkH0VwNZq2EPC4RknuvAERmhk9yMRDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
	b=yrbQnWQNCTSUAHeORi04zPRoPniBhoBFY+KAZWxNsqkPStpu0G9TPeMpSQ1mw+htNmDU
	 BA0wml9TRGzyLsseT4pmoa5DkOAgNWFLSIE728VY40f8ASpFrWYixO5q8EXd3fKlk+1sc
	 +tqYOgFOdHNXkcNe4E84AIsXipaDX6yYnM5d5HxOfsiDv5H4Gy5pcNbteM9K5CUqal15n
	 BnTJMW5wZB/NI6EQCGepfjIFFPFYhl4LHJ38kCrPeDkVtj0ABwTAt37MONFM3xnYwE4YI
	 nEfoIEm4SFCXPxYAiAva6aDnJWv2FZh3TlJHOVNdC9gvbJym60w/ZilXzpQmGTV6N6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCVkhmNj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vfLvo3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D178606D82E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D178606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCVkhmNj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vfLvo3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5r1l3955548
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=en+kx17O9Hv
	lGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=; b=LCVkhmNj7EOpMCgvx7D/X0eBjq3
	yfbkY2qbTlsMy5Gz56dOrdeW9SyZ5MUE7IELjLMlLk1INQdZJcfH7UtRxPftcU4p
	PaSXp6i5KsKm9MdvHsyk9Z9blpEeQk6iCUeHfTDTQYr9nASDdqYcgYphE7a+BO3d
	mwAMfrKrr0hG5QitarJwLh4yJXNDtPQ+r07s4q8OLr1JPW3t/PZzAA0a16LxZZa1
	gKYTNS38qylBPaSlTVIZesjOjU54pZc1CAzX45FlvJYIXlpRvHvMoSmInG815W/j
	I/EwsaysM9iD8QZsDCWPb1eqgokXunYdvB7ZaeVqezItFCdzETKeLNb3Ysg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rntq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so55736375ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657070; x=1794261870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=f1vfLvo33htHHj7oCkCNaXD0UqlnBFZX3sSlpr9V0fAlq2ePZ1Oqtgmr+Vm1JgGEB1
         WDzTS2+cuQDit3roKNUY1OF4In6zs7eSMsQGe506CnyMoMqbdzlwRsVOwwZQL3KN10zZ
         fY0Vmo+bhzkDpbYnuEBUggaQbh/You7vw2gmWCFPO+LYFqUSu9kTs+skW+crZ73ctmwD
         6aj8q2L9jHqQgdrjHQRuzRq5/oREXWxt+JMJRxvWRZob6NrbUASousCSV2jzoa6MUVoa
         4j4CmLUAFaRNyId7/WZ1rSy/2HpHOibv5mvh0oybKpfKy6D1Pxo+7Jsv9uC6umHqoVeL
         6lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657070; x=1794261870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=U17BYq9jnY6M2+CYPqOPkZLt0bzJHNpszdVqMaBmObZO/KWG43aTt4HHh9exbHHSO7
         WJjxLTycLwUGBvIchMAjCR3Z3qod+Ac3tfuhf+3NbmN6sfQ01WoUWjPyr3tEl2D6DR+2
         xFm2xaHKizdJBTuSWBzpVvn0u7vIqDi3yiLosRXktfvOQWMneth5nNVWwVnuVy6GAmSQ
         UllMy76BHZOvgLWuNJFugd3ACIF9qW9Rw1QJ+89griWWhyBPOhtf4wjXmUNElVJPRknc
         T3s45+LMSUKhXmL/UewM8DvdE4jz1wJ4GyS9ajwjCTjbv1CybspOGLy3mASpzvfuWyeq
         GDJA==
X-Forwarded-Encrypted: i=1; AKwUvBxXi+KW6K/Yq4WtiG8BVUz+2NfNswPnH6vdahuVVhtA5G3Gp6tAGrpyAgdYRF5oRhR2jGcruQ5LRcG2meo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nuS3httF1nPmiiUeR6bkXEhXzT5XWN5Eh0EVZeYZRMHjmYPJc
	hSLvq6pECTEGvjv5IFZGu8OtFJioefw0vAeKPs+Q9U3IcrF6L9h2h2ou8lm6SS6SOPvYwdtptrl
	QTiRfsv3ZMP02NRaLMeN2mu7hQRW8WepeqmPV0HzsnW7rD9yvFkr3OZcE4zN6EnVaZI4=
X-Gm-Gg: AYBFou0oW4pHeQgBt3hl8QRqoYIniOfNcGDU3I5J6u+eO7K43X5gA6XzmfHYnjS9/Gp
	wmByKzOYuoG3gG1w5q824WoiApwuv3tL6QBLpzcF8h3f8wXS68qwcUlsR/I423kZpmakjNNGryE
	V21oXRVKZfaKsxFWv9GWDXos5XA8VEUpHDdItqekz/Bok9HornMatUR0I+++jtjY6mbeo5/MpwA
	YhnR3YnQ9eUv0Ip8BPsyB9gFv3GArondGkMDXzl5bgIK2gWmdn0+UCJrg2GN4Q21QbBY9BeixqO
	RXJcGzOYasiwygFk73RDBj00NHQUuUs+hZ4zj3pVtA1xnqb5MFZ/AxMxUuk102xDb4/pWE13UiB
	6OWC0HVxJUgLnXkCHr8l2WGinSHbZulaov+el4Cota1ubbt1YYc2Puno0OYOxvxlFwa3ii3ED/V
	nVWG0Hz+8JZLljF5jxEjUsaQ==
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr107112975ad.48.1793657069866;
        Mon, 02 Nov 2026 14:04:29 -0800 (PST)
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr107112705ad.48.1793657069391;
        Mon, 02 Nov 2026 14:04:29 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm31871825ad.28.2026.11.02.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:28 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Mon,  2 Nov 2026 14:02:49 -0800
Message-ID: <20261102220405.30730-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXwaklWfuasXtQ
 blHhtRFN9iyNxKY8Zk4rFl29ue5YqBop3tLhpFOTHxulLiE8TvFSvktXsHamWxcndpTXTCad3rA
 y6icl4AtGGb1aVXUl7fTVjPS7ZZIYA4=
X-Proofpoint-ORIG-GUID: VSJle7nw5x8FwQfL7vzfr_Tn0_d50uYa
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae908ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VSJle7nw5x8FwQfL7vzfr_Tn0_d50uYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXyd9+/1Pu/04O
 KzY0opH76BzdEDPE/VfI+98qzJjunHql/s2zLGAQgGV2Ye/MsaXoXuV39QMY1iCDHqttVD9wlsk
 uLxA/8FlwRXuaUjt+XhYj4tIOnrkptrJCxM2aRifc9z+T1i6eLZMeu82Oh0JZNWL5moq0p+r//e
 aIjRHuaDz0TXgAiv1S++A1g2Txx0edYWxqDv/d5dg5CKnrruTaZxcWnAT9Isp9I65MnGhFYo59P
 FgIizmYzlV2q1tqBeyTnwlZbsKowufBoxaZxQ1Zi/uV5nZw0e71DGNLCBjdwJ2HBMZmiSSL9R49
 8rxv8ztRbuKnjkHckq+3taf2QVDiQfrisQ0oIKqQ4zBPrZd/JudWbC/P3dAhEp9cMn3xw1BLGx6
 mVMsF/HUhvQpkxGn6CP3nWGYnnVeYwjmY/CpbJXGZPcsH7legC1JroObwgaHpLbBTutoPbswkPY
 7Y+sl20UXL9hPyx+XWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

