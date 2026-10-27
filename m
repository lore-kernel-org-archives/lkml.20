Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142319;
	b=umY5Qa0Z15eZUSApaRz7fWDZmAPpwlDkOzd316cOUgyXt2UiUkY4aoqs0oaHPOA9qFnZ
	 98e+dzj6tc6raRt245zHa5TfoqqEBgzynzPiTn5mhhjJCR3zmIS4QxXlzQ3RoQrBNqT4k
	 jLT4I5X2twF64MVdWKAVFFs2FfW4H+3mnGd1v4QFN4J/ml4A6ai32y6ytWKZIxBPspBkf
	 eE6wmmL1YNGZiMiklxcuvaUljyzZ7G72Eixd0ShNRkigtZgx77mHdF2gnaZY2sTGTfBef
	 yIKJYScAJGu7bezfCS5pEp5xELOdiTXbwkQAV9wpGw8HOvr0fa5mEszG+kFEpRw7bdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
	b=po4+hz7CBJS85DLd4DH3SUqQ691lTJU9klR45bmeoMTkIcCYc1KbD9yH6FI/0+x5IPDm
	 mHPTp2Y4fDiUluBgrDZyJaP58F6Rw2G3Doe6TFo2NiHMDBpSFJpbsJFjSDydA8YOhBvfK
	 +CHTx7gTYjgpFdqHLP3biqf78H0D/1STEd934uuieGlFhWpAEa1ZZkvFMbDS7z9jPFWW6
	 mEhrVzoAvG7xm+VG0wIVqdRX5lUvAqLIjU28C481UOnvIreD30Xw7UadPGu7SwcAjh3t7
	 iEDbkLoBAzDhgGHrB8Soiywsyc07tb5yyc+1HskG1xieJMfIOpU7eoulUcZYCghwWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FdWgw+Pp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K1H4yb/+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E2606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505E2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FdWgw+Pp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1H4yb/+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtVfY3285576
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vX8c2uJChbI
	30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=; b=FdWgw+PpXn6J/CF4tNwu9METkaf
	QOA+pcwLyluXjhQF+3OJS0UDlabDf2o2G7FeMUNyckMZmcFpNrv4p1XCVqjux15W
	sScjrlgYJH3nh0atMIn2Iqp5B2Lb3pTq5pRijRh6z5Yw4v5dvLR8yjDXroRSWkF9
	KZkG/u9ITM0/UiQg22jZP4pBTq9n+AiaCQuy+Eab/cd2RySO1XXJCxelOzCDHIRi
	GQxSqFlXMH0FgOyNm9Bj7Cq/svdlKA2//r8N4lZmrR2SxLv6gYwdhW8BZazEuvQC
	sGXdyc8SH4grJKVJ8ZmTQFIo/0d4E64Nvabgtnkvqzh/EXZ7sCVYARIlRpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6bbfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acd21ba24eso227725a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142317; x=1793747117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=K1H4yb/+tpR/xSU7qOCjNVJxIHpO3Mn2adhoIb8Gdc5MNVVrAjE63BdTWF04XDRLA1
         QYa/u7YlzSMC/d2X+1tv5gAPMX70jmqAk/X0yBTdZgQE3PRg9CP023dUe3WJYMXkaC3W
         qMKeQc3bMb5yOz5dXayhpV4gZUQgonm5aHsqv/JMpFjg2YMSQZmNDux/GUHYuRL3UQS2
         Z9Czqp8VO8euChLylL5AieXusRlcUv1s+9LlRDj+8y6o3NROUIjsPKnhQCPnTdEuyKVJ
         oAP9t8C4bdkUOR19GogjpeRg3IdzgjP7n8XSnf2GipyYWnQBGMT5TtJ5ooYC5XQTIxkA
         KWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142317; x=1793747117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vX8c2uJChbI30GlGQJ9D3SlnpZahwcNedt7ptpVKARc=;
        b=mjgg/diMTKaWBKc0dTFNR2xcrGNLsQlbFvD4BT05uusX7CB/ILGXWnnGVhX5F1DVTx
         mVd24v0zlNO8pT9qhKWD07MZQHiWWSHIwpAHnUARhxxXtrzf6BDEgT61b/dWUQQguDJ/
         P9985VPTYQsHfk+B7h/G0zLoGlCim8C1X6ubIwFx2s9BchI57t1TAJHHs/YrvQxVgIN0
         HQ3v1Hm1kKMQCuA+mr1TvfMReCMtbtUDoCvEz2p6cfMm2uPpruG6wTeGA82MPgMWexoo
         r04vFzZO6Nv+m++39Ql/4AmzAU8p4weeZ0eReDknpuh97cEhWO0r+CnsCtAwgnmYmPo5
         iImg==
X-Forwarded-Encrypted: i=1; AKwUvBwEfqWeWw+4t0ZDQ1Q4mVCdMOgCC8R81uNCePqIv4hx8Sv0ORtRp6kC58v+T0QDfOcMZWuKMIcg91eqNKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbWFYKYr8Z6JxpTj2C9KPqOZlfYFqyZjwzSRIbx8nPe3lPMCLH
	daKDaiF2kkr6DBQ453n34nAgGeR+tojs2xrZNzpM/Yg/FO8RYCA+WFx0FgJyzlVIbLq9VDDigbk
	vt9yA24lTxD1fAZ3I2CZijXQIY/gSAIkNDM89QBIaSZyIZgPIAxOtCdh35rrZn9mGnoM=
X-Gm-Gg: AYBFou1Ck0roicA7DJLWHFK0HpMp38kvFTLiOlg74d+nRKhSvMXx7N2PLmpKIIwX3oy
	zhswRjkT69kpOsEz71fb2c7xEGXMC5PqCX7GkJAO8qzjJvPKt+r/Z8XJqFamXNG0gAYMHMnD2hz
	O15eDoOsteviCHo42p29rCq73YxsLPlnTlQ7YFaMKSRtvFeyccDZPqKkiEkRSpU1DItvuRbsf0j
	/xrpSTEB830V8z9qJEoepPhik+PRWnwQFkrqHD5h1/v6OYA48aKiskuHZEWVu3qdlhnRHk//TO1
	MfZYFZSe0kkoIrK0JuS6hlVb4NM0/wzh2ZLTQMUh/ifjNXlfaXLfHboIgvW8XA8LOyAp913okWx
	HWqa9gQGTbsSxRpuZHGDpAKRaQlNCDoRC7aRERr0YrQ+S/bPVpw==
X-Received: by 2002:a17:90b:3c12:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae57f9b47bmr336480a91.19.1793142317212;
        Tue, 27 Oct 2026 16:05:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c12:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae57f9b47bmr336461a91.19.1793142316753;
        Tue, 27 Oct 2026 16:05:16 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55a6859bsm510639a91.0.2026.10.27.16.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:16 -0700 (PDT)
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
Subject: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
Date: Tue, 27 Oct 2026 16:04:48 -0700
Message-ID: <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae12e2e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=I_bc3XnsTyL_mMZFCHAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Iu3I2-Qk8wbLmNEMy6xXQGJ-Z2jHjRHd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX7Sn9VKmMjl4q
 9yj+lYJc6nBKGDbUr3Wpx2JLTY84ciK6rmUkiETAZARNIbzb3bcZQPHOnc4e3okfhQKDnDL+VDQ
 0nhIf9DSJKbQcA6vgqTWRGJbU8iWaOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9wOOEyAU83s9
 i+Za7Cpagelzd4/eXVzjaQG1DVaEcNfcM4HPo9cPVpOCP5T+VOEp5ZObVCD3s0PoibwAk+Md+hh
 YBtIi2Yaqx30g9/qTzxoKPdkxWcK3HCCs+/6PbmC3oPz1XCUGAhnj7+YOLAoy76tnZbbQcfP8ln
 16rii4BIoHWf+mjd5k8aFQK+ceg5295N6/an593mStOrfG/oEg05BvTwU7Pk4qBvkr7sc2fUmEQ
 WgVPUg6I/wMvgrib6UpKnyllrSFMQKVeb22p+GlvMMRgcR9N3YPfTWeJxuzbrzDxFJJhwcFo3qK
 9I4bMm6VG7VPRe9y3BpZH50abe7OWEMqpxSzpVtg1mWuzCiuqeBAi1m2ko99uWxgLVspvP99oa/
 azm1WOSFONYFmtQeb/LVCgJSf20qU/uFsLnKucJrEgWOSP606P87wkozMf8C/8GCZiAnbG4REWZ
 Ww728gz/Ikom5XKH+Ew==
X-Proofpoint-ORIG-GUID: Iu3I2-Qk8wbLmNEMy6xXQGJ-Z2jHjRHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270093

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 479e5450a4dc..c2950d32c507 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
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

