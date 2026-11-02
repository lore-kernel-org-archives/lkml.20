Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657108;
	b=mzUkZbbsOQ3M0YXhGhieNRRP9ZvpFixL6UZOxlrVAgh7IykuvDcYFZkmEknV19W9b/MO
	 52AXFp2gaGFt13hACn34o75hOq18SatDUquLQHIGkn9DK8xvcsF9Nvz7/3jX2UL/qU6x1
	 O0kzs6S59zS4pCv340scT9NAEPN1BGL1nDEZq0Xk5gGJUS/2M6TZHWXGhQ0I2934Vbzxo
	 MbinKTK7XkKFMLCmG8RavoV2CZzkEocGA0/2LTU/Wk3osFW/tH6JMh39HWleZfleaVUKQ
	 XFEmQL4F2clmqEmBcjR9jQKoJDU4Ma8Lcr1j2aw/wn7a0x4AnOuaHawtNJ+vuOPX0ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
	b=EIKvAb2yFGar6ZaeMn+a/cwYi19bJw7aH3omU+aKDOEoFwH7xdtUTMCLhm00aEsLzRPu
	 EwudOFVN/CYWaezZBmjsCxpg3e6DXpCpimXBV0hLudY+sXhu+tSN9uHycEB3sAviACfQB
	 iMPWIdfg1X0Hm8rl4AuaHrW1NmSuO5+z4ugOJT1xZR2uJAu3nMZ2a+t9zF8a/JY/0Jjwn
	 QI6VSkL0y6qQJePhqVDjb1OPkLcXIAM8hk2+m3zGC+XF0l/XotVxs6XpfpQ0ESVYF+g+5
	 0nzLQv7gnijXrC20KFYKAaWd/IY3O11Da6rVbwGBdVBrIYfmTyVZ6nHzS05XJJyZxOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XZPrJ/eF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IK/LwzQL";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C89606D837
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C89606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZPrJ/eF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK/LwzQL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K63qY688252
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lD+y/1YnhCQ
	Ues59I9kPAO0opbelgLJYmff3EBA8JLE=; b=XZPrJ/eFgzTlzCNuW5jAm3Z4qFE
	CgWCBgH4Yhbmvrxc5uB9PDLOQwUyHLCnsWIUkxmafifib8ZNxGtPYhHdntkJLBZO
	NDKHeIAetioLIe1lx2MPlEkaue174Th9pk/8qifWuAEQmQVvrvEIJQRca/11HZyb
	PzFd5BAAkCO2LLCIXa5VRp90ciOUQARqglRBBNN0B1IkVvqTUBvoacCkM/Nm5dM9
	tlg+G4Wt2ErCDiOkzKYzWQJHabbaxDUq0W2g4Co4ODZ4iEMeIidx+yXw9PXLZ24u
	DUS4jPxingQJQx1riGS0lsIjhEItDvXFIvtLYAhyqVqEPlaIkFaB1PSFlUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfebdms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:05:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so4561039a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657107; x=1794261907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
        b=IK/LwzQLgadQIrB+4OGIqJ3q7BEqnIvxl2ObjGFImfTWYeDpL3aX1GV4vcoCnsemYk
         T1r4uidDgk0eqco+52mrKLHC4Qt5cWq+K3vnnynydLbG40j9lsmV3czvg/s1uluhUX/i
         jFCA7UdSNSar/eKlwTCpyson6qFY4g25iZtT6DtYnS7mp48YLYK8wE8RDi2fGJPiZa1T
         d6HjBSMRMPoIQ1D8DmfKC8donuy04k7DgGmFamBVUqgexk0XGqQqpw0wipUuBu3B0LWX
         tF+H6wtUjWvt1DtyDIf+PnJHoiTuJVJQpMhEqvjeWOnztF9MNMECJ2rxyGs8Lusag9GO
         R5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657107; x=1794261907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
        b=ozGfS2hFNc4PIXdpImB4ZlUSQmQOrwiUrJj2siQf/BNtaIsUaoncdo4GzagnF0395x
         LCjke6va9XQ9PILsIWJsrL6Urcs7yWRrKkhhYI57ELutGzeLKcYmz9AHj9QXfRQOr9VQ
         kSrnaGJiiEKqHlbsKDqxvbCPvtkbL/W58ndjuX/2cl0XkFhddnH1xeMMDZ3nsb4grjWa
         688I96hwLl/IrA2LFRirFXSYldeEvZn2J5w+g3kpNmn5u0VIWzAEgd0v/qB6F2faHkUL
         kfkaSrH8ieqa2cUBiszNY3jHmnOoEY4SoGV0stMUiu+60+1lMme49nPbW8XThkPNuHUI
         bVwA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/z2knCKNWkG6z8S55L9VQUXVPlOTuOF9Z16CVxboh/YRJXtopsLdQxSImF3Txqs/qG3wqjKMsjmvMdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lcx+C9DfJI8U3gRfF32VcEJJyyAEImQ1NtJ54LLYp9ZQvVT3x
	WPwmHEL6+y0mqYLm6e++TTtHLHzbNzMUe1T/TSBTvnYzOueD/K8iDWzK4JN+N1pxnB7Tcszsj6t
	HazRC0i8uuZfW/Z104kbsWP7J+8Ha1DJsrihjkCTNE8LPAlP25Eztn38dpZcMQEwGQkI=
X-Gm-Gg: AYBFou1jLRvQwwHm4LwK4zxNpqPntxSkspu+GlLskh4x2tcY9zyBhV1ZMgLWAbqYuV/
	xDLiRkziXbG5A1bP72PgMzAymCIsaWvw9TtoC5pwfYNJoIAXgM8VXqs0DERyU0T3scV3Ed0Bb+8
	RxEgPVgKMOy1Lz8cbZfQoIEfREcg8P8STHCoybvkGQ1oMIBdjIRIS0pU7m7dmGs5HH7jee6YRCv
	cn1jdoeHBLEf1yvyEp7dhFWJAV7ERk+iajjgpP76i/Qm83711eolekxLwOIZmA9FCAGt5ZGzm6H
	m8qj5H17LyB7yWHGmzEFa8d85Ud0jk2ECcLITivDGrDmuESaXqQqPz1PM8D1zfqR3cRLXLMlLnl
	u7Ie1KQLaXqvulFTH/60pDHUaZig83Y321mjEW6SC4ZKaLB+XXWrCw/maQVSYt9Kni8AYLQNfOh
	wgh/DXUNxkquOFgxkfPNFDQQ==
X-Received: by 2002:a17:90b:1a82:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ae89797489mr9555894a91.39.1793657106678;
        Mon, 02 Nov 2026 14:05:06 -0800 (PST)
X-Received: by 2002:a17:90b:1a82:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ae89797489mr9555861a91.39.1793657106224;
        Mon, 02 Nov 2026 14:05:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a04b8sm358654a12.21.2026.11.02.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:05 -0800 (PST)
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
Subject: [PATCH v5 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Mon,  2 Nov 2026 14:02:57 -0800
Message-ID: <20261102220405.30730-14-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae90913 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXyjLz5MZMttzE
 fby/gUNyv3MxLaj9a23qW5dzGfrxy2uKUBBq60i42nadZSy2T3VXtxCam4+lekbhoaZwbT9UtzH
 o+hrSUoBxmkV+X22i54WmY/pksL0wiRbFWReJAOXvq8pK7XJqFvif0nWpUcDm2G8MRQHNtFpAWp
 e/eM8y4++1Mf6U2cDo7Fvq6JOdz9Q0N03giS872uz6kgy2dR3a6KS1AM+pXz9tgkC1pd++74dZS
 36zVU0LNWGsXTJwrfU4zBWisfi7SFktO5r7Ynw0wU39PT+EHo6pfXqM9gvvc9A5oytn/IFATHpW
 w1zVS8UNVufbcexBn9c7leJ2OX5zYP6Xv1YoCkeNry8mIZrzyiRGM/V4ykGQXDTWpcrD/+IDMi6
 uemIB3jZc/s4xMoCMIh2yg0b+uL+oaljsC+SelGX8JMRpOuuDMHoLteArTc8iGg/kyV9KHaI450
 XlmLIF9LdqnaGEzqefw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX8EkStk4gMp09
 L23sJ1zWluyuPILBnhDXqw8bH0S2z3cnTkFfIRQ3wFXfIc6lLSLZn77CphsxABFKnHGZ+wf7YUt
 iOAmBoKl5na40ylSFGKeido9epjGiH8=
X-Proofpoint-ORIG-GUID: etby_N4l_LE0MTZK-uPJw47bandjygGM
X-Proofpoint-GUID: etby_N4l_LE0MTZK-uPJw47bandjygGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

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
index 952c46f08d2a..0dd8444cde22 100644
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

