Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114916;
	b=Vb75Q62HHuOM+wiT6+rRXjRqZRV6aqbKND9t/342bP13a+QbumxH1cd/DbI96dnWIheD
	 R8HjHstime2fXkH3/4ydMaSOvS8CpNsQU8JwhgZJmlmtTWQdyVrS/mqAN0HrsanicIweO
	 6/09SPV50mjsZpqAf62gH66hNV0Tw1CaXu/FlnAFZpZG9cT9L+355j4W898lzOm742tNl
	 wI6yXDxZPfsP4DxIeUJop7/0CMzMDUaGjPvK7CPPauuQR9vCla15QUDY8iKMXpBG5FuxX
	 0Ia83fDMPB41v0Fai7wWs3JXqgRSWpJErcIMRxQvG1N0BVh/2zgYnxUiG08zswL98qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
	b=GOLOsX706Dvx4cFERllykvzV152yYFd+4icj6hmGLBn/khZ/18HNBFdILTtVAjbA+dVl
	 7oxmBkVp1x2B1ksjSWWpU4GT/clnGUPKDTslRU2mlqSY0E30KnBcinUmmiinNo+KtdkPG
	 rA2A64sdRAKUuhx7mpHxromTGt8F0b6uw2L//9isdmFB2Ordam1x8Iv4vGHXpZSJXJ08l
	 lYSk7WE7qasIveGhwRSe+4KWh+sZ9Bjd4ZLQllrUaP+Nl9n/T5Bm7qzLJQeZx20/A5AAO
	 r4sKhVpBFXn4rBHa6bQQ+/0fZOQ98/Lz7IQl8zVrW2NQdcY0mKLOoqcV+y37TORzTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qge6OcY8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5BJbzX7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A760A2633
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4A760A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qge6OcY8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5BJbzX7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL9p63153567
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rWJwiQL2/XF
	Lm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=; b=Qge6OcY8n9kSqehNikiFwmdi56Z
	BWEWL4C6y+D9bNAmQiufjrIZs+IxdGHISmUjApkeOKONT6UEJusp8TaiidQ711aG
	A5Gpqf7YerUThimUk8VVtNHrPpBKWw6z7x7SBgaCLG9zL0FoZVsBj+SoX4Bsi1rX
	n+lmxLznfKlrXYDXW2sxBO2yssxwjO6KqR2zSQz0ovJ/2VrVEVRK4+m2O9CzTLqM
	U4ym0v8iUi/mjOtqgDoN1MVV01Sd+aGRLlDwYwQvaQmb33iHUl5XA2qVs2jdDrRk
	rlaLe8/I6rzkI7vEnXzUEFaV7ZMEL3O/gSFWe5+HRBgrButVrtWi+4t4KnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21uea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso13798a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114913; x=1793719713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
        b=W5BJbzX7fwX/2tR3tkBC6p5whWO1RlLNQ/884xSOB2Dp9IJnkPnRHSA4xd6/mLknv3
         RiK28baSp6HRI/SpncvNO4G9PvuQEyselLL/hL4tnrzuqGR6m1sUhH2CPGTUgAaFHVFo
         EmbRdGziNpR0vZ6SvJhPzCiucNPDYowxVScedKiAV6dObVMzOGK7aUKd4gUImkLQllI1
         x445ZIFTVGmKcyn7EDIualWSe3XWgTU5/5JR0hqVIGTPBg8cGA5/rFQXDJktVr0XyAHu
         quNOiBGShLuUH2Ef4qDzEdDErh3tcNvRAWkO31Px+rhIi3YsgaEMtuwf1eNEnxrCVA4m
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114913; x=1793719713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
        b=dvTl/AHbuXpm9GDMG4DYhwafr8Bf08xzLNZLLd/TriBIrqYKVVAnVKBdl+s2OFmU96
         tm2UzSKKY1yXCdku8Km34J207PYuRcizjD29EQhalDpFMeqjOzjaYWmTXtX5SaIHSmos
         gmxJQbZFXjjpxBbMhAeeJUWgC5XTUBP99jQNQowVgGgNpjKNG5+duRfgI4IHoduGPNB5
         rrK7wiAnkKAnfDzexWReMkSAnoFh9aaS989lI4L8sEls7OSLDLIGqofArvg2gyN1sWZ0
         RX1pyNs02eU2kN2jFPaMBXDJU1ry3K6cZ3zaWG8OSVW6UYnatBHwAniAakapZbR/YCC+
         xPPg==
X-Forwarded-Encrypted: i=1; AKwUvBzHd/KUK9K/yNCftAIfM0u7BSMqengETeSxfwwbbc9KKGtgZsO/rcyNvcRGxfIV9NHdQfi52nPLcfVgZQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Hg+Kc3o0uWok/+OIWeJRgayW27Snj37jtPlzijspwHFmGNlL
	jLn4c/CQM4tYuTy1LKpItKHkBzZOUylQbu1QPDXRpLP6yWiSbRebzIxmkYQ3/YHt6jJ6FK9oA93
	+jJi8r9bg6SlmW244RKjPCU6LtGbPh/xPkraZARkLR+UFSDAxWhihn2+ktEu602FUPf891lFNvv
	g=
X-Gm-Gg: AYBFou0ZBrmXShda5/6c2pRNpROwrAEYUPe/BO7Z6mgk+VdrTzbOy4yjTeB7M64845Y
	ZReldng1nLIokNx57pwoNEKnddWGt6oBtxNjAitOMcFtoH0Iq85juMt9O4PrcRyY9Pt4IvKvi3Z
	ZQDRHjwyKv/a/VX0IDwlDTIRkQyAHcWkWynLt4Ec+w7tRhEWW3Rxz9Oi88S4lEAIJAz/AnF6WvS
	uqPSLHYS0U5ghHy6HZ2ulkvN0TFHWxObQP9ewjNgAdNWtIyygzMI5JBa74RzYELM54iUqtKhw2J
	/mPVp+WIsukixJb3sFZWxSbfSP3IFrrCjINojmodGBoOAa3P35iCniHfVSPCpMTZqgkDV8zbsxs
	H+QQucSheFmo/NR11TOzpSjBBmxznKqnRZR2ogoyUXysAQj51buKcCmaZNhvGJ+33rvDAOP42t6
	rK1WXbAqUkAnFLg0pcmQDaCVw=
X-Received: by 2002:a17:90b:224d:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3ade9b30a3emr8433508a91.4.1793114913246;
        Tue, 27 Oct 2026 08:28:33 -0700 (PDT)
X-Received: by 2002:a17:90b:224d:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3ade9b30a3emr8433490a91.4.1793114912711;
        Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm4256128a91.11.2026.10.27.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/5] drm/msm: Convert map helper to use dma-address
Date: Tue, 27 Oct 2026 08:28:19 -0700
Message-ID: <20261027152821.51144-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXzdX86JH8JhCz
 IlqCPfIwQXeXYEa0FpUflaaBLCJ0wGDUrPBeTd/be5EnATcrBvnFc/4+9+JCWBM8+62s7BUnAci
 JOJ7N7ZlO77x1EsojkSHw+/7bgOahHc2M63Ydnfm/ek1yBnCRde5TpvVXA+VoVmLGSyCpDRuHeV
 7/8azCsQO8Pj0cymgt/LvLk6RX+PgQG9cX4uMMayfZxwy0CXI4krb9qd1Mr46VSlhPuBLNiB2gE
 bNJID97yn2huuFMt/3dGW5UWmLvqIr3eN4DPIrMe7aF80BZ1vg+gOgZYTPlly7LmLaeM33pQU1M
 eQxHLq65t+rr0zDjG1/GvnKbIh8Tnok7jAMT8HujRlPfgPjCSBpJkfGmMts6/cvfeLIcZPGZgUT
 jct+xuFrEq0SxHbKmJxwdVEF91kBCfJ9LWT0fgydpbBVVlSPGFhTGPZRMXPWDLil2X0zuvKSAFO
 6LHbpHNWUjWc33xVd7Q==
X-Proofpoint-GUID: MMPy5hBls3lZouvzq86glTRFKwWAnG6N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXxTnxToAMyAjP
 2XqPVUCtmKqYKe0PApNwK/T+PBqcKY+apOT01NbSkRfUsgd/Yhs0kFGZPN1b2njXU/e4DfHVuHJ
 RY1FXU7F/wGM5pPbQsjM7Mn8LZEhWAs=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0c322 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=I_bc3XnsTyL_mMZFCHAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MMPy5hBls3lZouvzq86glTRFKwWAnG6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 435736c8d715..6258c942e66a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -148,9 +148,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.56.0

