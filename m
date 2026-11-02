Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657105;
	b=XPfJa94H36CRiONc85AgFLSxrq23bfC8uVlu6IeRS26+CRv2pTlWVwZ1A7dNVCrKWy9n
	 Qg6055J8yxIIrdQdCt87dEBaF58hHOEDtQstQ1fq4wuNgi6Ll3CU9fgyqezz/aEHUUDKj
	 ORpAU55/H87rM7Ghu0mmZJdkIuJMsxTM4RhWqkvqZKA40H5z4Aiq7lJsbfbThhjF9O6+N
	 V88FbREzgS+nUOgMabEFn/z7P2NqoHSneDKvXgS4ys+e4M1yhEpBGXFtzu7yz2f+rPLDn
	 /Q6PWg9+ZABVqkEKhm/+CMOMyj93lkgaTT0vMQ34oc5IpOuXExqwqO4K4bCoONjxyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtO56gsUOoaTL1zmCg+YLEyJHGzsm5OYIr2H6Fpnghk=;
	b=RFW4T+wiiPCpQg1b91hiVpwsARFcBopp9zRK6eyul7rX5zXZb0I7k6HJm6pSJCbMYZgK
	 TjX7N4osFw6S8zsV7q2pI2LTXhW098evlzr2VQpyg5CbPnx7bn5UOFy/euQo0NX3tbV1X
	 9QXJVkiOjvoPxFf6F7qRwGpulN9ELOExJxd47vIPywjjCy8Z7VW49wp8YUdL5GXfpN6gO
	 zYsyBgZBt9oz6+X6bxBvWb61dm6rJwIpmCn6UoVUjoK0CD5ta9BwOzEHp+DPahJd9LdjA
	 NDRduaLcq7JfBPrXfA+UlULBdjk/jlWO97VcyXcTKNQIdc61nxSUnPuLTWjBC1bnm3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4Ide8JD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsX4R4NQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F552606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F552606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4Ide8JD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsX4R4NQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6JbA166494
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OtO56gsUOoa
	TL1zmCg+YLEyJHGzsm5OYIr2H6Fpnghk=; b=l4Ide8JDCDedtIzLRje79CwA0Qg
	keR74VRqPtkSxebzt3wWM71vArKleaVdUJvCe1kF6+D1/DzAZF3AiDS/Bw3NSYNX
	x3VLEtmffrG+3E01Hq6mDq4DOpgfY9EbU5+bHNenXgNUY62bSs8R3ezqAqGc/YHD
	JwsOP7I2Y2FRaS/YEC0i84dhiym6cz14gmyM1XVvtjc6z5kgBeov8srMK7ByJzk2
	row5SwskKC9W/rp+zusafruuk8kkx9Cq36/rIgeTlAo0aP9N+GoFmu1zpPeNWwwX
	WHliYrm8nuo52HWnLBk0qz0/+7Oa7rpPDFQroC+JCB6RHVCJ/DSKgNqlRqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrk4ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:05:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so57640235ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657103; x=1794261903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtO56gsUOoaTL1zmCg+YLEyJHGzsm5OYIr2H6Fpnghk=;
        b=VsX4R4NQSPXBtMItLYBaqMDew+w8b3cCyU2Zboa1o0fcyHRukrUbVB2RKBMCEZjPar
         XdFQYMe6SMc6xcD/CyKtjbDIBnp5rcwgjbEDQObX5WweT0CDbmHzXK14e4XA+xQISEs9
         gpuHaxXIT/X+dNVgjniYC43TR9GzCu+favCGdxgDhOwUc4BZbUfQnlVy/IhFeU+Yua9H
         /S21z4cLlkO/gI3XZGQS4gc0KLyv2663UUNy6Z2iqnVMCSNgN2kgwDXkWw3L9R2o27GT
         fkS0iycH0ak+AOeiv28pHKZoFTaECgxa+LtmGZ3wMRzDhYIGgEABxuePrFVLUuAfaj78
         OcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657103; x=1794261903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtO56gsUOoaTL1zmCg+YLEyJHGzsm5OYIr2H6Fpnghk=;
        b=0ohChZCZzhS077k/8LAuTcImY4i5xGKyDcBfmjN/Hf/zV0J7AnB6bJq37wIxbVDPY9
         JHXUVtnGPAUx/dw8fWEg4mmUWj5zSWLaiOSYxQ7oDahoNIubRMgylFaowcYhz8/Gm1v5
         7D56cao1VM9Ewy5X+qKzLwvXKWw6ha83hsy36FTwiRx4iXJ87P+SfvQ2z6P4X6Oqtuil
         x/x+N3dpiKPZKAibrb11/mNx/mcqjrRzFfeiX9iIbEvnQP2sXalarqf0Rx3ieZ5Ohk6V
         4fwcP6GwdKmr1H5xPEASSX1VLkKjeNZlvqp2S/3+re16fBI2Os4E3podAA1s2e8GfxuO
         CZlA==
X-Forwarded-Encrypted: i=1; AKwUvBx59vdnMeONh9052T5/rCgfl//rBWD3viTrHaVjM/o9Zc3jLtgn/PDcPtY3FuiubuHXrqgO3GThYzboem8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ZNBMITaryXfgXCXAHsfGbouDgse1FittDBofmONo+xSFUb08
	/6aDZucCMplg+ZN+nPb8+TkMUAE4WQ1Pv5K2n9KlnGnh4WyRIM1r0iMlVMkaTz+NxRHx4Z2GjsY
	1iltmdLl+yLO8X8TISUTAISYt5w1eb5uI/wVa2xbgPgQkhHkFeJfxyLSpVrODrzCiE1w=
X-Gm-Gg: AYBFou0kMXa1HEW2TBMYmx4H6EuW/7tfHN5PDFY8nwh3JvBweLeKhGIbvOtKORDfm1F
	ZwR7K5jNVW7J8H5W7QH4kPC+9xBriBTRMe579bhVys5t5SvHB4rCSR0hdoJR4pGS2OztLCf07B6
	2WP/4H8pYjGpvsFRp2cyCdodJY2FZMyGg0zTyQSbRrIQXQzB3FkAZ2snO52Ph8B+zGD29973BXl
	Drdtj/ECK/gEtwLehizdZhZq4SjFOGbS1BN2nULBwnC8EEwX/8G2cEfrd13Q11OEoKsxXLPAFfv
	U4JSI3ewu4o0Yn3IcR6W1fLogRMtquLYDem+UmhbBz5UPJVPGtJ7WqKoERFZ3Zpnp6lQXWq2xze
	v3wghVPIo5hwrd2aFwAU26DI/gq52ljzMShLzLtsqzy9dsRKuiGqq/nYOdV+TSUx4Ijc+/IOxI8
	1PcdrtugBhR5iArMdr08dXGA==
X-Received: by 2002:a17:903:1b2b:b0:2e9:60fb:5e2b with SMTP id d9443c01a7336-2eb364e5a41mr108152595ad.44.1793657103037;
        Mon, 02 Nov 2026 14:05:03 -0800 (PST)
X-Received: by 2002:a17:903:1b2b:b0:2e9:60fb:5e2b with SMTP id d9443c01a7336-2eb364e5a41mr108152085ad.44.1793657102541;
        Mon, 02 Nov 2026 14:05:02 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928d821sm31906705ad.56.2026.11.02.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:02 -0800 (PST)
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
Subject: [PATCH v5 12/15] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
Date: Mon,  2 Nov 2026 14:02:56 -0800
Message-ID: <20261102220405.30730-13-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae9090f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GwKEIKth3DexCsueK50A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Mg7uDV3lUzfvX_V6-XakX1UupLUx46L9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX1n8ShoFWQWp7
 wRAm0DHldJzdorO5/Ztr7dd9+7ThLVgmccglXG3y6220NmAHt3dgOwORNVfTGynCGE2BuONu2Po
 DStrjeaDSbGTmbJQO4KWnfR5J2Cuya8=
X-Proofpoint-ORIG-GUID: Mg7uDV3lUzfvX_V6-XakX1UupLUx46L9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7tNa1NuYofbK
 Jiw8LlQ5Fz8BZ3sikITDtxKkRbKJ183w0ygDqnXEnCOAyqPHbHhn1WaEghYux0HmD0xjeLsbDco
 5N+xeKQZSWRWNX3MMD3Q6vvUYhkmn69wTeinuO9SYvpU7RotqdYNsaaD1/1oJcESkhMPHONdkbJ
 0Y21fg1/9LTR3VhJJaUrV0Ht+OH8p/ukh8+ojRP3SBUWEXJAqqb5c+OnO9s1AdcahkOQB0vRxq6
 yWQ4z7ou0Yv58rsJggh2o3ucLTN+9RgVoUxpGRLiU2aJJZqQAGxs4BiO7vxgRfDqb3noX0Bs+Td
 ZRDXGOUcoAifKNs2RO4xyJKW0RmQUqIzhweXcjzn0U7dgjKERj8lCCFUNkfg0WxqGBD6MN6bNd/
 Y6o3QuzhB8pR7czmbOlINlIj0a0IeueN4KK+A0+Cr37qiRkGQoEDW17pQf6UzZQVWxZEP5JJo+p
 rPRSsyKNmJn5MMgEgkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020087

We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
than missing to restore one somewhere, just add them all to the pwrup
reglist.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index ad9141f76d88..6fb35db73db3 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -276,6 +276,21 @@ static const struct adreno_reglist_pipe a830_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -437,6 +452,21 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -670,6 +700,21 @@ DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
 
 static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -1083,6 +1128,21 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
@@ -1532,6 +1592,21 @@ static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] = {
 		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
 		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
 	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(0), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(1), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(2), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(3), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(4), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(5), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(6), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(7), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(8), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(9), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(10), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(11), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(12), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(13), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_CP_PROTECT_PIPE(14), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
 	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
-- 
2.56.0

