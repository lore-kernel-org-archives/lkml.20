Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529274;
	b=0TwiI+i/a5OAyuhJa9zi7ZVudV6KHdOUciS0EGpojn8DsCGqeI5b1WsNpO3j4PmUgMj8
	 s+1jybrQqmkmzMtnyMN/5aQGmWoeiavrUQHejSDfBdB3X4Mg/rNKklWPKfLv3wVWnDmYu
	 Vm+uhkAWrcBerLfbgLJoEkYV8pSF1cBLOSsPhhK1gjkd4tPHip09ew9xbXRnMukEzza71
	 roOT+RKxj62jp5S2wY3GqRvkxnyOV+XObuwBQ98dgQlzsRUUqJtHzHt2b3FvWp15Jf1Wo
	 DU2NZuUZuMi1lZznvAd6bC6DRT/mKXdB2nQ2SrL2+/1sjFp9/JVPDd9SvDM1ZwPanMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
	b=rhpXsuMlPhyLcadTd3aaiUNmanWLk0jqrlzjfbX1Mw+oaVPrB6fXsWOucnccPBcqctxI
	 2CX2wlVv37rQ3Cd89mRCgxmaZZ0WhiFBCDfpGVcziWG6mKqIqzT6XgeQRKRVKlH/Cf3pi
	 lqiOTpSEkAKW24wliGbQBLl9bFmcOyWVK8TmqQMe8cLh5mbwr1fUIAKzxlj3XRSa0IT26
	 uQsrnJMhyQ5gYL3YOoXjdRdMBUp33QzQ7Tif5dUTtnCXI8ENCd/jlSudwziuibDor3xcb
	 B96+8xVQAMXlWqk8AB1MTXuE5L2cB5zN3fnmboPEq51+N1qYs8AqmPbusnuy41DiH1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDd7Wezt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1KQiu7a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE966606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE966606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDd7Wezt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1KQiu7a
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7mMI3499203
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q5GkNVNRfPw
	2zEKJCJZ4tInEwatTood77UzHJkknqQ0=; b=GDd7WeztKU3UZnBIFRu1ZuACveS
	4ewjnJv4KN+MFiQZysoLK/tX+PmITOMIx12VKCVPliRitgjuBjvViqGXkhXOOFgx
	Kx937NgaOYnMNf33EYVoceR0CvipZ6xXdQJ+u7wbok937Aq7VzCpIxsZ7wpF6ytI
	+zTGbVX/WtEOqWoHjCGIFtYRYE1nxNMNCJebfVxRw9dl/VBENlcUgmm+kczqsEnK
	V7RvZ8YR+dcNxLcUT7fR2WK9DXdX7IxuTTuaXp+dgRwOWIYUmN88mb1al9LxVCCS
	Dm36ze9r9PyFUb5G9Gx6uH9e9QoOYguzjL63WaKlNB+yQ9HX1jfA2MaHXbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabghhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f67358eso176935ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529273; x=1793134073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
        b=N1KQiu7agxlOWfVYL3r6ojmLkRRNL9lzVTUaH2cG3zKeev67N200amCYOtd7p6q6pK
         ZmftlERSlDPAO7EIXRywxD1YC++Fhq5Av60+OVjkAUS8K15cCzXl9ash2TsjBU0neffh
         7ZcSJetA7hHYi0mUED/RFblnmANmLIllXekrEkmHADGE1zQ8/L+k2UeKG6Ya8Dv95NqR
         K90uYtUusKmQ3DgkxIFc047l/hjg7eoRs+JYVBfn0L7EWIGt9gwz51Qeymup8LkjgWni
         ppbg+yj0blEwnybDuMy0472zCjMkRkP342RxJ0CrlmqUs2LyKaU63Nhx1dRBhSdywa9T
         YlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529273; x=1793134073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
        b=WdXcNY3+ZsCMbCYIXBI+VSYWWQHnjrb6dTTUNKc1RbV2/ElMCsMogvD6kg50fievf9
         01fJ7SzilI3CuPBf41yfJDnBQ2lQdk1CoB/220Aw4pbd6QiOmyqTnSyY8EZhyaOVU17u
         6skPOqHuDCwmuLWqru4OPtp0j32B+w1rvclCxM+5rRr1OxhigASaVu/0s5uA7rPb6VEN
         NaDL208qnjPfl1nt2E2qhiYH+oR1HSlD4xjQj3+7wvSJ/suvcDb+zs+epSclwEC+CMwc
         Cdzj+WAc8W9DSFv7jaECL4KkbByEySF5qUgcj/s2EW+wyCB6JS/QHAaCOhiXrqMhAGNs
         eibg==
X-Forwarded-Encrypted: i=1; AKwUvByLs8ZpWmXiU9NDyRgdTLWf7fubLrXpvAxtzVNF2NkOb5QUXYTNwugJ2on+9nrK5Q7/gArdI23SNDOES68=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZeQkebcUC6P3r6TNfDivrrgrJtnR3n8kORHPhCRIl74UIeQ+
	BugIU9UkEs4j17OzrDYqQXmJgmxCkxMtRQn1gcwTAuc5s7Ao41v1fko6DTm7BIT/eA26AKLQ3Qo
	louLOj6DMs4qoZvX3E/f8H6+foSgtYwsH3aFg0C0JraWH8TvEkUG8Zb6AMbK/oryMY0E=
X-Gm-Gg: AYBFou3Jk4gr9G50I+CBOow1qncAIREkZcSMJZeHLyGDP0844AesIWTN5KBCKFcsdQs
	9/GCfhTegsIpCABEdGOIuPz3p8UkltTbys2zmIiNuSDzZT5GlQsfpZYwyDoMQ06gk9Whvbg9fEN
	6MQUIQhU+6ex7faE7fb2JBA4fi5uMqL3RoXVulwAYZaSVilVrt8IDZjAKWlPu8uW9KEpcXZahsL
	mz27XR/9Ffi1tq+Ncs2jrzExtrtGPhuE5SOVQTZvWWbVAjhZ/teLlUQWK92ATh/OaGb63bTl62W
	M5XPlTHH+2i6zqfg79STYqLZ3B8a4WFZwtWqhBGRKZlVB7fjDs21rWrTyTKehwaO5qIWPZ1Wuxr
	OD2d7Yv9ePga3WcFKp9G35l7bXnmQu/K6x8F4/fZYCqqsGrRChw==
X-Received: by 2002:a17:90b:2683:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ad86d1d122mr98445a91.20.1792529272783;
        Tue, 20 Oct 2026 13:47:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2683:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ad86d1d122mr98424a91.20.1792529272304;
        Tue, 20 Oct 2026 13:47:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035c42fsm1003438a91.17.2026.10.20.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:51 -0700 (PDT)
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
Subject: [PATCH 04/12] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Tue, 20 Oct 2026 13:46:18 -0700
Message-ID: <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXwoNy/25n+NVl
 aw4XGZ8F33OUT6xOC0fdaY8kO0/JT5JS9p5e1vcwI7UhYpgMzI5MSS1zYX7VK8c/QzUY8WKk4I7
 ZuKNucC1Xuk5zSUBALna3uL5ij0LCmI=
X-Proofpoint-ORIG-GUID: 4umw4oOmnwL_VRE8xLPdptK0Nmb30I0t
X-Proofpoint-GUID: 4umw4oOmnwL_VRE8xLPdptK0Nmb30I0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXwdDf9TfdEcft
 2zpgZc52R+dH15WneOkAH7U8At9vkYSIekytJMQTLLt19cX3ZKd5wcfvbiKvPhslZap2crmyVqL
 0nQtV/k+8gwc5nofcHqpW3K9gCxnkrD82mQQpcAkb92oEJNBiQqc6gcLRRmcj9sbjyKUamaHfPf
 oyr90Hzqlte0M/oxK/1KcKczBV/3ClztXt5um5tvQadadu9jKbjJIS1h5REm/HkinT+g3cSauFI
 qx/0F7zSNtvTS7c1lKUSpwbi09m+KhiLK58fifuTJUY0hD+DQoiGd5Rl1fJ7xv6hUCgP3CsTYra
 Vox7MTrdH7zX8mPCsi3B58hnW837PviHwqMiAKu8hCN4uKwM3fnkh2xa7lRt5dFi8c67scF4rpG
 MSbqUfnA5Y7TPYUJ2Ihrcs96mSx9uvhofJ7lR+qJ+SOpM+m9YmtVDH73j5k6ggYfMlyIQw7P+mV
 Sg82a+/Ew3vl3oehC9Q==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad7d379 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 72c84f73157a..3e22ef788f2d 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -376,6 +376,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -395,7 +396,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

