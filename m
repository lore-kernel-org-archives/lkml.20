Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395224;
	b=rUWqqzGGsq+tkhZrV5dBgj8m48kINlJEYtC1XbSZVWg6Fhetna1SCvIW8mP5rZOlT4FW
	 GoKVvtahuy4T9IPk46qYeMQwpoy/6oD6+F/+2XnwskS3C37C9zup1Zb40+Cm4SOuBio4p
	 XnEnhk3Ps+/R8N3jrNrYL+m3Y+uR5ZeLR6x+KtgfDggXW3lC5tZEferkhmBwMwDQD4oAJ
	 +X86E9oWxhnfGo5XICHcpttg5CCelUTAqxbliJxxR3EH/KeTkK3ZuOCFXMZl9bcI9rKlQ
	 /Elo6tBo90BWJpH9Vnwi1XLQe0HtXugLRIagFFVTKW/2ZbLQaKpg8Qs0ZXZik7VIe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
	b=Z+lM4EkWInvXgJCBSsWVy1H0/0YCLUoJGAHscYyUWxNfaKXCunOQ7lUrYXIk/aibjgT4
	 0+ydJ3pwmqGxm60pcRdOa0E9sdDclDKZAP02oOuwusylENm/u/S4woLiHC+KuF/wgDx3B
	 +hcZhg0ZocCJBMREHD3PwTEdU4Sl4idAqCNaJHQIzYxewzJbw62WHn8q+4sQwwCChSg5k
	 YE51sVYq52W9jD+y8HPip8TkPVMximKg/xXtsmp5PSY8gZM7iw1q9jSS7gP8MtvG0QQla
	 0htBKbBlCA5HjUsiDtqGT90UvWjBfaLIlCDMJ9erP3lvdRIUTC8gG6Hlbq/PdxWTzHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtTazA1D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhgmTfoN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66661606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66661606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtTazA1D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhgmTfoN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBh2F203767
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9SOSpuyRfDJ
	mYAf59ZWk5HR4noS5hxVrRszr7A88pRw=; b=EtTazA1Dlt333kQ33G9kYc4k1OY
	6jFrUKDmKzfsgUS0VG2bLe9mP+P1awt/E2fgSsi9OgDgc22zy7LuidtHm1Xg17Aw
	EVBQLQJxvBcH8HIgZB1R+3/mPOOt7hKOekxHCtGeuAPf8mtuMXlUgwPx3NwUsZbN
	iexXnpW8sK+XgpR93/5TDPVyKwaQUpCNozhMTOSzjiHymGRhQ6cy1McpUjt7+0lz
	iDXJA/Ma9c2miFHJYFpaPzrKJDVyHfqaN3TRmnOO9J8R73UFKlnXCXxtINkR/Sb1
	7cN+Fwq1IUDB7vFcNvH4BU/efOU8CBD+N+Z5Q5hYTrI1uVfx06Yk+XpsNug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1691052a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395223; x=1794000023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
        b=bhgmTfoNleMwdZxA6OrIbdhjfJ0UUKfJ23o7CO7IsTjdkgI5EFc+pbPghycMENnCMx
         HLI5nmFR2wWOK5ckmSXjys0tw6qCvwYpcFZ0sh+0+0h5lUHaXtaoBUjT/Xm/cmA0lmy1
         E74PpjV7dxmH+hiEbQsKqW9OFo95dkyzGOgFDS/DiDAi4703bhsLSvXWO3Od+W4Wb2vI
         01cRFhhrwG98voW9rlEndly5NuYO8TDr5stv8S5D8VdyW4isG1WfGqbX2eXvZtzL7tZj
         MpRsnzJxqSBMFPYPRh18l0pCflU1B+t6/hOJdGVTcLuImkGqzixNPgz2HW8z5CQUY0EM
         d9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395223; x=1794000023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
        b=K10JdfuC6ld/2+hPp2P7Y+ZkQy7XzPst/If1LX53CvmcfYHuXdVAkwiaxM8uaDPsl4
         7hZxO24JwAdjq32TY0ZZfaunIuphNlm7zuI5Jm3mePayeVqfNqvReLHDzuuED2urHAm4
         b2cHoWWItlqDRV6Hitnz1wHxLxQDwa/eYAQDJaAA4aMlVVTiQ/cRuV3VZeY67AQ9xxvB
         rO4jwlNZaCCnVo0LDCTMwWBS09a8QjEKccJiSPMghi8G2aHc3M2XVPRPFT1he3cUf8c2
         ptLYW6yJMjPM35EON9+AyivMBcqiddqx6/KfMmviqZQym8XoPTkuDQ+amXqllYYqlq0q
         TgiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVfOGbunItDFz+F1oJee56trsniterFtBMlvsqEZtqKmYYWbiKTrh/ABZjyj2/xpATKtStVXVzBscXwBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYInOWzeDaf39Ivr9U9emnNj2Nbifk+Bya9DiTCO94vGBlN2Ya/8
	mJ3zz5/ZkEMWBFv8dNIpdXxbh/6xMbBNx5OkgoTPS0krQ7616O0/AprI+YYBhB7sQkt12NLUGOq
	KWVt5hGOyrECUW7U/XvcRQJ7inGt4JBQNXfElqgkZRbNJCPgmsR1kJklxsJEsxyuyTNs=
X-Gm-Gg: AYBFou3gL6ZWOdywBNVtJcg0FKgXGG1cBhtp5W89Qhy6khUifvuozkixpalyI7mowxG
	NB3o1y7DWXYUWQKN2YRNtxQS7w9N1sFAE/e97hDDxWc2TuUwUQlTVFNihHJaetDqtv1a72BrBDm
	TE9jGEzMMVekhf0hzaQto2Xg44H8oyZEgLlRQ0AIkqZE0pO0pTc/5Syh0hg+km9K6PoOvVt2Tam
	86yhQG7cqiqn9TPTkMz2XbB99GnRcoJ6+uy1oFssAQORmKn8xSRMIlfF6bZpnJbZc5ZpLZi0MJU
	xAVHDq4Huu+ukzCPnh8o0U0r1zJ6chtFeUi+ZEioR5kFp/F1P2exJomwNXiEqRwGxlMizaJNvD0
	FJrflS2X4VBy7jID6Ly2OLoSBtZEDwilLLXvnD6sjf3VHwtxrpd7GvwqhFSJglIuIZUnZoSM3EL
	n2bBakn+Bhll7TUmCHD+Ksig==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr3078142a91.11.1793395223298;
        Fri, 30 Oct 2026 14:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr3078124a91.11.1793395222885;
        Fri, 30 Oct 2026 14:20:22 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm2711639a91.1.2026.10.30.14.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:20:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 17/19] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Fri, 30 Oct 2026 14:18:19 -0700
Message-ID: <20261030211928.45761-18-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: glaPWhbbIDh2m0F0e6aMxQZdb2oj3-Yl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX1vhrtPS6yuDJ
 84b8Aa/rEscVsofrh8G8KW9iAjWMBNfABkuc+E5OsG9CPujCf1qn/mDqn06jjbO6dpXaKJvI39Q
 B7UBA8heymxjQHBEtOivW4EMJmQVKMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX0PA+ZYkpUFb9
 STJqPZlR2g5kNp8qsmUWmqV35/KeeFqVAXUFkDICmoYd54jqojv0RM2nw+rExPofArw0DpXcSkS
 JmDyRhC8+2M+CWd10EaihdSBPFYo6ObRNFKth09CF3Aw+XmhRQLbTkbNr4ondfbwMdEOf+P7W57
 exBfh6fuvXL0/Mp/Q4NGQFMF7j5xiNkLO8j6prV9X6B0FCJe7B/lXeMLfjRs6njpmGcSrEqFmax
 pNX/LTE3Q1NuP1reXLeHfSFVuS4RiHz6R4rUeeXoNK1owrOgLXoWq7ZlLAZO5TpGL2H+rWj1pGq
 AqNNGU2jv4KX6YF86ARGa1CKKSh9pnNVnz6lPWZy66TkT1WHag9olPnd4n24hwdeL6CfYtSb+6g
 828wTGuuD7NVVqWDwFeO9fohQK63dw==
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae50a17 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: glaPWhbbIDh2m0F0e6aMxQZdb2oj3-Yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a6146372cf7e..1f8dd688b967 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -258,12 +258,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

