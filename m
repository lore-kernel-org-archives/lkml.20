Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657076;
	b=nfBmAEhSHoQOG2iW+IFvHcE+8Qr0XTmbMlI1AGAtSpBE0afou3H/+dDATMvdIywTYA4A
	 Fa9OLorvgTbLFH5Z+PzTlTL+Qlj7/SgOjXvprJ22/1tlybQb7kCGwO27/x0fav+07lAhz
	 7XspP2ZJNDuH1pW6KN3kMWNvgYGSeLualLxxvYvk4kgn0QhRMFIpqTjLcUnUgrQgsC/d3
	 Hp3hi3rLnyDnvOlsdrhKAy9KzneWt1TGfz70XAvTwu9IYHr7gMz4+bKgN1z33kl/hP3HG
	 e8fUij+PjjdzGsfkHbZAnRsZg3tqikQ0WO2H1NpJ5pQwYajSkgTV065rpgRjdhzSgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657076;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R4FMlDFuy4XPwa+EjTfNvoiohThuilBlfKwrrVx7kUw=;
	b=N1uxR7LGkA6P/iP3+XIoZRsi0caMbawILD1pyw5Xca2jTiu0x39ZhGq6gs0r+i+tTzsR
	 ykrx3qX4c6zY/xnby4XyNlAAemP6okk79r6xnZ5y1CuJdfuwymRZDTNAuX1DD1BL6yzS/
	 AIZ8qM8XtOTOFpcpXcb8Wmy53ActXr/MvCdNE3ciKVs2OfpM76P9xDMC4szR6Q0mfGZEk
	 /jHbkyH5GD732BY1BlllnA9+FQ3BjsH9b8djhsOsWYwJhfexNvtcI3fG+5Z29lnS5KTFL
	 JJdI1oga5gx7K94SFoyh7CPqJjzl7MTMEkYKhnhL8568E42Jkr0LHZFzTWuPV8TqqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LzTdjSaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V4G6GDmT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0665606D814
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0665606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LzTdjSaB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V4G6GDmT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K63X9688272
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4FMlDFuy4X
	Pwa+EjTfNvoiohThuilBlfKwrrVx7kUw=; b=LzTdjSaBRu5/e4/nNqO7X1f4qZV
	q7RF0ICB4jWsuqRpfs0Fj1+hf0tM86Zx6nH41/fR64NHhh8dsjPpG9VKSSbr4bm6
	1qqYWZbp5wSUu88QGhkB14JsO8Te+f5hVtjMYHkPrduYN4jeumJ1GF0P7BY5MZdl
	ZoDvcDwCGWbiEKPlzG0lH2S+9oxZiofmQ1RctoFQo9yknRdU3vwbdyMuofSUft6W
	aHXpoXpLXENQdT7fdJXme80L7mhpnpkcdVF2/fSUIbd7H1IoJRSNKxavZR6uy+Cl
	ygdQwHByplWcQTM9RP+xOgPEl9V4IfYUvBal7CvJknCI/20af7MNewCkEhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfebdjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2904561a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657073; x=1794261873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4FMlDFuy4XPwa+EjTfNvoiohThuilBlfKwrrVx7kUw=;
        b=V4G6GDmTIiN6X/Vr3xT22eqgki1zfA/7SJ7rvN+F+17Sa2ecVcWRTOGg9LoXkYDt5e
         kMZVtK4FWKNuBEnDbKMFdtK1IJFCqsfAECKxrr7iU4nDc1V8MWtev8aHN35O3BmWlq5A
         21Izfp7TNxDjQdhZfpNcA+fCHJA9sVoDmG8hH96jtoiUbBO/4EpiPmjvfYdg4AeOHYed
         Uw300zE+VgfdfAxAMOmV/38UyRQMvcZ9nMeclNhtyi5i6Q9LzilMj0mhQEL9q1yemZKy
         tlvSfzDdfJeIEyJBj4ADd98K6TLzyhawUxG9H9IEYJ8upxyqdUW1DDOiJmuPhc705yNB
         cmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657073; x=1794261873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4FMlDFuy4XPwa+EjTfNvoiohThuilBlfKwrrVx7kUw=;
        b=PUVB1EdQXCzx58flGIRPvHrpyi6kD27JruYN9eVWcri7CgovNJ4xCiAN9+3SQIVxw9
         PVIl+y3lXpWhWXgSUbKf8fi2vGhqd/CmdAMQ58PVQawBKbhsZY6qwbv7XX8b3TrDZ8ze
         RnopXL28SNnQ7oUYqGVqGCMO9MyN9D0sheFRdUu1SZpa6cflTn/3FYvAzabo6k4chnAA
         K8albf3cfBYxDYtQ5hTq1P05e22LUIK4lZ+Pmo5C59UjRBJT8XG6r5rD7RrPPoc6lrxe
         wQO753g142dWpv0daeysI08f4HjHUHGCkqeT/ATgw62eM45HriZ+01UzOa2A0OdY1Q4F
         7Jlw==
X-Forwarded-Encrypted: i=1; AKwUvBxvZ650RscUOr+3WaZJ+z7SW/75y+DIiLYulSdKOytXXZx8rwiBDjJNoCYuSAKfaEZaUCu42MEX6KbjTD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DpMFiPh7FKEkRVhwMItsavLqJrzHu9wPOTTpPNdyi1u3rqtQe
	HLn0Kt9PV9H7D/I11RnctSvc7vztmP/e7Z17Rpm1IRehSKwKntniR0AhWAvjbOv2jXMWEjLbNbD
	cu97nJjOkKMNYKRG/khGSREgRrubgLbkTdpv/O/w9Qko2e6lcugqK239TOfxC0qBPMYI=
X-Gm-Gg: AYBFou0qAZCGIZz31etCvt2DHht5nor1zos5lUU9o0y5lB4SZhOcPnU8I8xjOYAePYs
	WXhTYSOhDY7itsuzCMPhtQWvACeDCuJ+DAjV4tGcUltgijjYXcIA7C7FeZVOXdRrXT0yDqGkQ62
	XZTIsQNStOeuF2S9JEoxsXInq8PDma4n0cO8DW3Au9zY8rCeqqTevM9Jhj7YaoSdCdOYMBLYHFe
	S3faZqq/+X/eh7KtJac7O79Kt/co+VC5MCan4CKORmv6NvIVQn+fCvGTt4vMQDRbP2bLbP8m6LG
	vVMRQRARVGYU29ETQU0kGSaTYmWj/dBuPCIYF3cj2tfR5XX4fLPmNDLqIhpN7fzoiY/9SSdvQOJ
	on00fd/JjWtwqt+UfzJGbz5R8Gdh8FNEoYVSVsU/J1Qzu11TRPrLqDev97dhto40ZmycemegCpG
	Zt6SzXUYi+9JHUt+mdcf1f7Q==
X-Received: by 2002:a17:90b:3d8e:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ae8979a140mr8180954a91.40.1793657073381;
        Mon, 02 Nov 2026 14:04:33 -0800 (PST)
X-Received: by 2002:a17:90b:3d8e:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ae8979a140mr8180934a91.40.1793657072902;
        Mon, 02 Nov 2026 14:04:32 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm938308a91.9.2026.11.02.14.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:32 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Mon,  2 Nov 2026 14:02:51 -0800
Message-ID: <20261102220405.30730-8-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae908f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX2FEQ7YeWDQPd
 V5S21p+sd6E+lSDp2CpeFg7jxltlWcnus0/QCZrWWmNNeaDO0wz6JTeKx3h1PZERRawguL5KRPk
 2hJMmY/FiMg99pGLLaHwG5IIdtQPUS6PVjGSnylsdhtaxEg42AhwSeM0Iu0/GRpxmA4ZJfB9gl8
 rwt4wXGjv6EGvGoe2ZvU9WI9a9+xVYvYOrRpPwrR4RVYwhTDaG3qEPUShcQo33Il1+Yp34BIjdT
 dnTqFkypyc6AbYpNbNasUwtUbYe07ELrqOf2ByUT/vG/HxeMDvSlWkST4lJW0DZGqVVXmlW55/t
 /rcnKah5VZWqcauDMGfjEW///y61a3Ff3GyqGnrTlPLe/4lqhsWQwnHjXhTO6pbVuWRVT2RJa2c
 oAeeq0wv2XZk9iHj/LXid7KApaLxIzofQqIqSw0YsTUfAXuL6MvqwwSjIoalulCACIGK/QrDV4p
 PIJfkgnfBwo3xQ3ZzgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX/JEPP7TxwZB5
 FmpfTCfEUx32t2rhGnlyHkucR/TL9bYXowz/0mTssDsMwfICdXUxg8FXj3EBer1q1yxzE1I1LLT
 fkxTRY8djTluGZyVYzDoI+OF6SLYGdw=
X-Proofpoint-ORIG-GUID: OFg4wmu1h7VcHssPvOlQdKeA0tQEVgZW
X-Proofpoint-GUID: OFg4wmu1h7VcHssPvOlQdKeA0tQEVgZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 45cd986ad4b5..8d85f6cad960 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
 	/* Configure number of outstanding transactions to 32 */
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
@@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
 	{ },
 };
 
@@ -793,7 +790,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1186,7 +1182,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1245,7 +1240,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 59546fc636cd..952c46f08d2a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -367,7 +367,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -387,9 +387,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -635,7 +632,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -716,7 +712,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -835,8 +831,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

