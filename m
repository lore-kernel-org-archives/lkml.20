Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529282;
	b=GVwoZDZCSAqn/S8MKmip18P1cIXPIbGGwAt2bH1eDXFWLq9LzqBk1yE5/YcwLRPgagw1
	 CSe6mJKp4d0vbBCqZx7q4JesB10U+Xn8MWYl76xKJAW0+tYw5fH5Y9Jd3/vwKgXdrY988
	 YWB09ZL8HOops7HS+vVyFRz/z83631ghdwOJ3/kvLH+4wWZfJAcnugtrBdmNrcm3KFqUx
	 4wv4oskQ1ATjNYKy+coQjkpL/ML1y17LIuJvexVXyjf0nZA56/Qb3nqjIYCbl8v+lcfBU
	 MwIKzxlB47SARYG5AhdDWkz3LKuB4iBHc9BwNhnSrW/WTYY0BTnBEgauLqZknWTinsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
	b=n+cLUnY1pYX3vVkXvw7jDv1RuknVvb+CDMqfuUupR89BG9yqFCMifbk9DbmVc86p0DvV
	 Q6hxYIQeOFVqfavKhROUFCOqncQgXLteLvLMOwnT8UarFwZeiJa7YlUV8b/oNo4UKwGjC
	 pLnscTeBup5mbV9XifkF9EAOEkpEm4+WYBLtHOKrB+1U/dUUQI07iIi8lco4hcnMtl9S8
	 TNmCSY3D/P1+AepNJyfSirqt10VpHVhW5dHM0X6sv1p1VaiqGUsyKyZb5raAz+ESJ7mo/
	 uVmHe9jeaatCtOFOtB0TmuudmPXamUOTI13RrHJMSQ2dxbHn9onPlbIqFG8XF+V7wjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WwUKLnKN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIh841XO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134860A2622
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3134860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WwUKLnKN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIh841XO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI70fZ1862515
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2h2stUViSIN
	xP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=; b=WwUKLnKNOn8wKVLRNQZsNCxIPpA
	a9W0Ab0JzUbeaylgYMX9g1dhnGA53wG10T+OmyeeMsJrVEjn+ylwD2xKFaPzuFx4
	9+TCzmZPzvYfoPCSOavfLNBYRTfzT33O4B676xiXXXvkxbXS+jKJC4ko+wNaktqO
	RvyXpwnw+0A9keCVH+LUIXKZH3AXOQoJBjPfOhZ3ce1xwUT36mjTonNXpPkdzETh
	G0G1N2T9wOpXc5lRp7QdBpq036kWmG1EQicGyVqpbpDQ4ILAJ0m8WnDCpO+C6tHw
	KvRl9dSc8CjYU6VMoIXN1aGe/blQ80x7eWa5GPnm5gdER/0Os8MC4DcjyJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ghhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so93471a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529275; x=1793134075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
        b=kIh841XOH3CsMS1gbuZXACfatyx61h+N/vNH7LllRl/3yiDicm8VLxJN7YrIygSo7K
         JF4mDLJO0TLaLdTUmDcltQvBTYgJaxQRNF8L/B+W5kYDKpWxQ6f4GxzTRQM8V8FbLoTE
         kljA4izEFEo1BX7HyEYY9lqU6CutKGIQDLLhilF/TxHVWMUlUAWhmUxYd3j8y2a3qOQH
         gI0cj9iLfPWLKjHmpDlY37QSj48Jm1SA3MXeg5peSJ3PCs4DJGwqP+8rM2P1LGChagi3
         +M4HrCio5qaqTuCOrwklTr/PRsJ9dxBETlDiIGS+pK3sqKVgsDbIEGNgm8PRDu9gUEFb
         n5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529275; x=1793134075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h2stUViSINxP5B7dXQjREMT+lAKurPPQoFmUpl9jSw=;
        b=fNdaAzDgOHAVqLxQOWvOHM2rYJgc1fzHOGHOkbPI883pmG9YaZ9njZQAQvZ9AvgJ4y
         wPpUafnOa6uOvIjeXx+bzS914INTyAIfskFWfDQAnvjAUuS/hbXZxu6PhUhAIZRxrPfL
         1MAXTn5kqHZGAxGtUNz4SrR8GmA9GZ/lrBobbo/eXFDcN7pJCfNtt9IDb4IvYm3eS2tv
         AbsTKNJSfoZJ4DzDtVQnp+ABlRo0b5ywcXMVWXauDbAVjGQlJjQK9Iqcx/hpISvZXgHf
         YsYU7/P6OBCMnbokwATT+o+rQ9nEFmKeON1c6OwIQiXAH3ZWqi1zquyDY8IaV1T/l1xO
         fBmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuDtwGvXqJL6exvxPr721JbV1zP6DiXEomAeMwym+38XIDGUNedRytsbDmqVZ5n8c/oIzPsB15Ib2hWUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGsj/R41cU1QhDuwFJvwSr4UDM/ILuy6a0zwkCtzgOv1wCmD+X
	4pe6ylTk0v1L6hfzVO59h/wX5i17YCxe2A7mJL1oEgaSGkOnGMRKsNuZuwxze+N2nuEdL9WA8aC
	DfjO2hNl4Tf/tRXKHUODEp4FEgS5fX6/JClf7XP8epI5EKfJisEnxxFu+npPBbDvZX5Q=
X-Gm-Gg: AYBFou0CzsXMau+PVs4QcJr7JJjj6LkDIobPzXwH3VJsFRXep+VYnMSCUk0O6elmqYc
	7mvHrp864uNVg9ukYJveOHo0JR0eEmM15OnGMRNQzE1wqvnYgg/D1jCoWg7KNv81uYoacbCsVCI
	D4Zgz7EpyflKGm4+054ahmSV6I5XIbBaV/g9dJgJt4PCh+6DHc1HV5LhJEDQ7byAZ+QH015JrGh
	5D9USmAQeRRND0FndAeBgjGhvB076DYTVQ91Hb+i0IdfzFKtcnUjOnaLKxdgsNVU+2CIoa6MElT
	Nbrkz6lVYicPyoZE9a+CSiFYXulRIAVqhgPiwl871ignahriCLP8KaxE5wyW+cqJ2jW51SWi44f
	lf++7DAE/wTs5FnVFO0CFLqZh5aKnYFbXmoJe6OTvGMBLSGbx
X-Received: by 2002:a17:90b:3b4c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ad86cd5f36mr107557a91.10.1792529275510;
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4c:b0:3ac:9463:83e6 with SMTP id 98e67ed59e1d1-3ad86cd5f36mr107525a91.10.1792529275060;
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021d29bsm1052180a91.4.2026.10.20.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
Date: Tue, 20 Oct 2026 13:46:20 -0700
Message-ID: <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX7ZFIL9iQ3g1p
 pzgY7psT9pMP/vj4Wp/ys1wYFA3nuJb03ctFA12C5z5StK4Cmfn+Pnvi5RTWaoW6NInyOjPlBj2
 /D1xqpGOBGqefbUWgTvfxM1D60h2g8BOnJwyDgSnNU31UPsSptx3JFJ96IJRy1suwiidnHmJkVT
 I2q/ckC+ZkPJ1AE/fidbSsCsvEQwNLQozkwMfEOKMEge3uZe20/qZErXZ0D878OHSDZ9+cCDLfI
 y30RFBehx5N/SOsjyTZS1VhRsvyVgyPJqRWOFIIGMAiBxeMcXACIqqtnEkzF2DcHIJ1Y9LBtYQ1
 AZNVRZooItR2VdilV6aqSkmLA/V35BkhEsvKJhXcVaMWqLz985DddfLZ3bZxSjqg4UOhhUhx41j
 TPOGH0YKogVIY8rcN8aPa41jnA4+IGSbrhtSgRRDsV9uQyjKw9xC5CZPm66tYPpQWWmBD+XOfG8
 lPweksbGh95I/3vXA7A==
X-Proofpoint-ORIG-GUID: o6xyAk-MWtRp_y4MGyvtztKf9L0bXkgU
X-Proofpoint-GUID: o6xyAk-MWtRp_y4MGyvtztKf9L0bXkgU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX5vjS3Iqry5eB
 UWVHN5mhblA2sMrvbiOBHaeu3C2NLDQrhkJJXb6A6JLelwgwLQ3IEgorK2Njki5zC2JLQe60pXQ
 w0JWVGmyoPoL9tboTL+PewabO+Fetck=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7d37c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index d60cbfaa0d8e..5e1f35c83d63 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

