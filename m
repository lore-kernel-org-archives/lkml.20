Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305080;
	b=UdorgeddJ1J6mnPOVn0G+wKc4MK9Fuz0L8kITM2HIPWWEWW3xaBklGTXnuZY5imMmJf/
	 1urA64mPTGVc8nvVFUMqSK4YvloHfEmicQIiU4xWB1gwfr7+njcF2z8A8AWcrPjgrZvdg
	 FJrNvWZt4zNYAOoNzOJJ9fgBE4ljYIEyrKwF5OGGNIvbrKrmYIOEuHF7syc7FVEm48ukh
	 8WPj04h0nE8WsLtYLrvQbDKEPi0z93IBa5Nj2lCxod6CV+Q7OLpcACiFcfXcRIAF8Rq6+
	 2ubt3vvnQzAQXaauebmM9EFJFwSi8bMBdQ8yILA1crFQCmUm9xgg+9J3xF5pdIEXOiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
	b=4SmNI5KYJS0A3J0UYQSba9fv/DuZAS8tkRtlfaJac4LReI/3yNzR1Z1F5T79+rolu96Q
	 i7lNZ7OijRfK6icrMzagMK3nnywErly5JDhzBAVsrKl/e+8EOskEHJJRRPicEGd1goibc
	 c7rS73+Yts7ztjgKpVNS7oHnhm3T8WbURFkDICqfxD0gQErUnAcYtdIJ4QLWElXU6vCE6
	 /LXOmlONqpIWdIbuxQ/3mcQSsAu9o8YFMK9aBAR4yemXkiPlNwbh5o3ch4DyVOlV+m4ob
	 alEYGDnvbCKVzaND5U107ileiTe5m1cw0GUVGYed+RxUgDF3BetlZBZjzdtVll1JZNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyIkzQ3y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElWuLt1a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0B60A2607
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB0B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyIkzQ3y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElWuLt1a
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjXWd2102915
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+oVnjuYPbq3
	UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=; b=cyIkzQ3yCSbYHnDpcmxjazIyPdB
	mcPma2N5phCwcezKRESZjY02YApPc7vnJQf4/SBEdB7SMAucaKciuW/JLZMuvQ6t
	HlfrB9/+WUbIJWrYs81v03jZMoFpqqYBni0GymzGdG7lROR6qgHtIF8KpXRSumUc
	Vip/gszIFo4hY4xhIMEdsBIyGnwh2ghbGbBMeKVrtf5WP12kbrYAPjulfvLcgJhP
	2xetnQ0C+ghTCJKp54uQSldFLbQp8Qh47TRaTIyt8HBCSwKLjxozbqcMhDOiDSFF
	czB7zLdM/otkeXZuA+w4JIvCOLu5ZFBv3FOs/GLGAz+0Qp/b9HpHSwHlgVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qamuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1618443a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305078; x=1793909878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=ElWuLt1aJZK8JxogE9wXfGKM4GB9kkvgEw8xl1TashX0grXoYSUCrh6bm6tVcFstet
         biki1UM9gyZa8n95ve8W44clKmvObxF+Te57B/4KnStxsZmPYyh37EgUPnjVNtSzTwC/
         tzJakpFZVIky5ZnlQV6HiMlDrURZzY2t7L7+eR5A8eXE7gjSdYpxuCsi03graNxR1Cfz
         7nO7jn3EgCEEqZIWThpgq4XDGS5ohdZRGptrS4xUo7RcJWMWoqEVnIDSYZTf9YRYwKqb
         o5VZVrMwjWADHFmDAuDQvUZa6R4RbI9Cho9LuZkAZrqLp0xKPgq1XxRRkzfKmHLAdy1x
         GaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305078; x=1793909878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=QlZMCwrl+Uj7bAfHWGF04cwyB4p0GgDVr2OOXzGoNzM2XLWrj91eq3Tg23S24MrMDt
         JmflMbALhkIRUPTgdFyaVXTm2SiP7MTJt1iHJ+j8Rr5YzLn6CceGzVJlFrOinAZCrX9k
         SgQoSKxQLspNYtBbNpGwLYdKBwKF+JsCb+GordJm30KxXIwc1dflHuhoc+QyJYKot7iL
         h7vlGl354FqGo3P69NF1ZVB0dEB8Rgjz25a6q5hXYjO0lEfPdTLAbJ85QQRW2mV1zp4u
         O+spGoaPLzCq3hJaUmv9MDUyAbt4cQ7bZe8qJ7ARg8NnvIJz8Ll5OOqxyZ+G0sXhf/+/
         c1UA==
X-Forwarded-Encrypted: i=1; AKwUvBwXs2moFbUbeFJmK1i8AD6bjSi4M93xiBcmQIsubj+y1AaOsB1U5c1VtoC/GOuSZnYWEV8GpkUlI2OLQDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUwv1lC4ygkPcwktjVYuTwxhUTXOQVb9ulUNH1MbNVeeKxkXUU
	a9pYyrK7J3eNaZH3YrRyPRHsGv1/fYeYrIkeovQkPpwZ117qAszYNi4uZiL7y15EWaaa4OlG+Rz
	/7n6cvMMVIcFDTmr57Cyzr800hWD6z+ItI588mCUYs+YTCu0F/1C+7zAIjzwg9ndQ93E=
X-Gm-Gg: AYBFou316d7RlnLZqXmVIC+Bsi2loeeOATw1HusU+UvY5ig7bWcxAxF+88rS2IlrP1U
	mpYlKibdSAAduQpVrZG4Iafngj/8Z2LKP0qPHMuCI6ewJs6AIqvar2qUfZf6/b9LHGgI8UTJvjM
	jzhrw/+52383YIVxJJQX5mnb5E2bMe2GelAE2WT8ecGpTkdqbiqjkRXrtwopr382h6LISxw+f2w
	vUt5FUwTKZ/AAmGQd3qu9i7rjg1vDY2yAimgWbo6zAONAAMzlOIgeiDp8+jzaEGYa5gr15T0440
	m+oqS5DySrV0yWO2BiEaIOll/vIdZ2Fmj50Aj2hNrD77+C5L+DGqZtsX+vDnTAGWr3TigvyRuQv
	IUoymV35Qn9xRElRB61s34fOsTRo3kekoJa7wUPdgzKNBThlq/7FBW28xlduLmb8u9W2hTRc0hc
	9d8sbqH3B1v8qkN09PKGfvxTw=
X-Received: by 2002:a05:6a21:7e8e:b0:3e9:f2f:a6fd with SMTP id adf61e73a8af0-3e9287523f6mr297167637.5.1793305078497;
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8e:b0:3e9:f2f:a6fd with SMTP id adf61e73a8af0-3e9287523f6mr297150637.5.1793305078023;
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb05474fdfsm197528a12.11.2026.10.29.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
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
Subject: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Thu, 29 Oct 2026 13:16:17 -0700
Message-ID: <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXwT6fpTIzLxP6
 8Z/ZY+c+iMlgAqvzzbyrW7QmHzJp0667C+4ZZsiGwfjBIIs4yrV6Ed3M+NDY2BMOWJF8VRtkUY/
 xZEdACo9XeFOR4kiUQ0zPrMDaRaBOOA=
X-Proofpoint-ORIG-GUID: 76pmKFWHBL57JFDXETLMy2krQl77byPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX7Th9IfwfgBmD
 qMoycz8HzjkhcD7qA8AF23b1cppJHUTJsAJw0GWoasXzYunZbZBa9YEEYoy3Cxd6sSx0IdfOenv
 X8t2IBq6s5tn2rw2j6WD7Ba1B169EtsYbgVeH1g8vBRpfNt2XMU1oRvF20Fz0szv3OBI65Ubv1T
 ejXRH50PI0NUNLljOYI8tbtgM8J1L9WhefmqI8hIaM+2d9+mKClNmwWash0AOMwnkW9uHvQh/KL
 FqusIwSnAAHGqRzWkJ9y1ZDWer+am57f+bjgbDo6QWedEqxr9CKgIZFv4/OxhAa98ZfcuG6qcVe
 C4ZucRk0mSLW5bZ8GoB9f3KXSihi5WJesIhyyfMbOS/x7zqXE/5tuMPlAt8sV2WUM2X+aRYKx4G
 K7dLxQfjEI8Ovi97vunr/V+qHtOiZMcAxqhFVEOZcPhReUWiEZaIepCb0vpvo1pqNbkWMlZ60rd
 7dALIjxZf/WN3LRhiNw==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae3a9f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 76pmKFWHBL57JFDXETLMy2krQl77byPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 795c16d88f45..a6146372cf7e 100644
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

