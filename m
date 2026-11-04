Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810195;
	b=Yw48p/ZCTgDQDcS80fTMGrQt5D2YLfUt4IG/jj3KaMq7V0LfBPk9/+Z/OxTZn+Wgj+HQ
	 cvtz4yOtuTV6Ek6HZS0/S4RhaST81lKlsxN5toSPTjbK9zYqxsY06USMF5jT8Rf8nEQj6
	 /ZhPadEmHe2UPrYi+lvVjlp0DRmQqZjVoctvAX841hZw1dX7ibyGSUzebY+347YmEmTH4
	 cupcqCGDWNWvH048hfEAHz2YfjS+rltP6B6/53qvwAjjLyDxq86f129A9haQHcgcNjN6P
	 n+tmsL7m8IQeALmIpgmcMp7ySy4yeLDngNYM7ayRRGs5bXs1NcjAxadYLTEPuga7pzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
	b=4WuRejrzV4Byn+XEwbnpL2IooLijMuv4n8XYrkzCBhdQHnUilMadV3zyTtez/sgd1Yz9
	 b40bBn5qWsv1hEVn8x7zvuwsEgIHLKR/omngl6GsudVJLm/IktSipTMcuEaNOP8hNemmh
	 YeTXCoXIHaMctWR10MG3MQVyKgODhr4pa5s6mxP0FCENnWUysCHCWrcM5yrFEbeOZoD+Y
	 2VfnObgxGu3dcs3oUfAy1dF4hQaGWDBWFYx8sy9bfKZKz9FFivndUfsoewhzt8eV1Ih6B
	 5NM0H2+vfsRKCB2d30z1BmnY8JSOSep2E3id/sPqGLD1bGyRSMxl7BJ5Is6d2PXWwhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP7Bpvk2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1Fxh9BF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DC606D838
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5DC606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP7Bpvk2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1Fxh9BF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FipK91292213
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=; b=jP7Bpvk2XgpNT4vZ
	wIu0A6jDZUDNWqV9TJQ8/ScmE1SrzWCJEGMCkuPhZnUqqsnCH9/iRSZD9q5YD4p6
	2Vpsk8ooOl69g0EgjS2Y+hjxj4T9rOOUseg+DLHyG/DX9dOTtMtHdcQvsuoXYloq
	JH1CqLReCHPzY91KBWamyNdGMBKqpjfC11XZaoySD+73+gAVlEoO0xK0hHMtlWOn
	2JzP8JXCcPuYvRA+BmNfR5Mub0pRSOjj+G6UiQG05qpO6fBfXnml/O4Tqp75LC3c
	0swoYMt143rBOTWficYoFvLw7MjhFcKimYBOTpvhBorJRW2gs9It53MmGaxIe0Mx
	v0vljg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hxbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso142703185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810193; x=1794414993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=R1Fxh9BFBxjYG+cGBh9Ci7XZyRE4xGG5SYefBvnIhQRfDJBhVI28tw4Rr7A8qDUHWK
         yU6iSNEz6alyCjw9wh5POMEiiVVO/lyhW16/mtdCptm2Mu1S3yibolFeIWftSzNjQ/53
         uxHy8stjRdrhaY4OTjGUn5VwV/6eYqjzqO0hfV5clkan5MPDQNXF9AEmQVX5PcRdKjNY
         Z+OE8PWWWyxjgoV6mP14vuypcDNLCCHP0hDxB8IKSVUhyS5qPK8CCNmTOrLR6D/Ix0o7
         eqV7b0cfHM4iRMG9G7VDoOJhFMZMcixDrY5CpSVIqi08stTz35ObfC3HDUR4pbtp07hU
         nIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810193; x=1794414993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=VZxI6X1tE2o6O9GYLyhJyaQ7SHPQH9Jj7nSrAgtetvuETjq/39oPsg62v9/1MTkACY
         POEKIqftVwTINdisjfrEeqib1fhCY/wZQ84EQLq/QEGYX/z8Mo4kQtVGEHbWxGmeAcjy
         kCaNdEsuIKL9ZNFMSMibbGcCS7nxSRdWJoAn31+sUveb5MXV97+leZu5kSMKea4XiH4h
         unbMi4h0+IUZW9M2oygXiYdZMIqFJ9OIJOUrjWvGeY5CgyKixkQxGSpWUcmTPswqMaU4
         hLdFI1hSPTEKvlbE9oZueU8mb4AYmrcEj6DECtOF5mktTNrq7B+em39ROaJbj/YUZpLy
         tJyw==
X-Forwarded-Encrypted: i=1; AKwUvBx9n1VLxko+nmUyEmpfSZ12wY2iG3+1OCmJDeJ5/cumaWf0ldY0J/vUmWuaX7Azkf03j9/tUqgN8Wsezvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FQti8f33R3Fiiiqewq2eRNfHVYKsSFR8vLB+A53Pb3n07LzsL
	TjYSrf67I/8faUw3hqXI5UGTM7BXtb7h92rxeDr1liZGh+1bjRsKkVWRW3nKk0gkp/Dg9b4z+jN
	gA6vlRDuou0QwMPjgDygN4rGA5SqeBUfSGHKRvDt+JwlqYL2nrVT1zkzhQw5OHvmIVSw=
X-Gm-Gg: AYBFou3lxhSvn003CogDupl2oPJXRKl1r4mG7DuvEAczh3yJfn7iO1dIczOxZREVpdv
	RZNP4fNrWLGwJVLusTJum2P6tW6gqIyEm4BTt1GC3uvTYZFdY0RETp6oA50KmQQ/G2E/Cyjtfhu
	fOPZjzqVxkaD4S81ZZz6x3ehuCf8IZzlaAvJ6zuFqQGPxMhJSONmj31wviEQd1pEx/nfoFyJQBK
	hL/tlkImxj8JmbsbgVtuq+7gmydjBpI+kosacriPa3H4w7wUgsFvIqhgASG2IaQb6srMvuBHLBH
	jGeJfPooorigoATVud9LhBKfpmPFRAYwuLXkX+IiITth7gsGk1tWYTsTDpZKR4iL5L0CfjgqTC/
	IzL3awxEC+mWbh3kn++cXhNOvs7q0ZpfvBPZ9IdO1SmbE/Y5UekSuF3jtrf2SF2xLerXk60pZfA
	JfujOHwVcB2MHnJy5S161L6MiET9ZYMG+A/yJFtVG00k0U2shd9tLorL5T+sBP+A==
X-Received: by 2002:a05:620a:8907:b0:939:6de6:9518 with SMTP id af79cd13be357-944216ed973mr2970785785a.47.1793810193213;
        Wed, 04 Nov 2026 08:36:33 -0800 (PST)
X-Received: by 2002:a05:620a:8907:b0:939:6de6:9518 with SMTP id af79cd13be357-944216ed973mr2970777785a.47.1793810192681;
        Wed, 04 Nov 2026 08:36:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:07 +0200
Subject: [PATCH 3/7] drm/msm: check UBWC framebuffers against their layout
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ubwc-format-docs-v1-3-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6xPvBKvXF4Oj5ER3IOirKs4PSww1szDN0iEI4yJmcYk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618AE2Tl00L/YEMEv4dxHfGBuWN+CB2e3ikuQ
 fxCGeK05k2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfAAAKCRCLPIo+Aiko
 1ZbGCACaqv83336QYPjXUNoQwg1h/nFN+er0jSNcAhRx0s4e+WhQ4CzrIeqAWFtjDW8qffyGZ02
 WcJZGlgtO3VFacOiOh2FvGRAqQD3hC81B3RCr3eytSr8iiClpa1FdxLKRsVCf6NOpWepX3AYs0X
 EK8Hk0P25tnrX6GqMSgvnT9GITrMrWb8+xeP7iJ+ahScIHeWR61RwSkw5ubkev2DLlVAnzvWqzw
 yDmGVCtKGJucVDgAaIrg1HUYE+tbIfSMcHsIA50UzgH+CB9F1OpxqmaYQbB1ynGIqVReY7OFrR1
 Jx1if8K+frhXX184L5mOE4GVxGcg+27mcchUFj1F8YSfgrV9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fXcQAmyD8paLomDCJ4fNJdugjKxCGDxU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX4XuT+nJlCfxp
 orzx79/MakKylIeheOy8DxQTTHAsCVP4zQ8RTE60yQMKchSHYG62iry3E5pGqOWDrYuQBEQpyx9
 G17vXQZKtxOHEeDXsUg/ONpZsvH8fyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX6BL8ZiqbHspe
 a0UabS7HNXf86bFyf6CzMuyeb1/1zK5iMQLkYmHfx4JtkDfTF7Q2qc9wlZsxKTXkg2UStBon5Hj
 PLGkLKQeGGACF26mjZl0JqXpMTUGYd2hUmm8FJdQeqTNmraucuNsOexz1J9lmjsu+Wj8dK7tNyx
 TBrGccfhCANHC3C0/THbrogYF/98UUF34NFxS76FDOhT7dMw9Rg3CJms2nvE8rpWQwDCCYgdSL1
 MH3GUlgfss9/zYraZ5D9GmrA7QslKXrqpH+9rKxO5OVCXR5Je6D29WP7wCVkli9to4s8VsCELIG
 3n3hqCZ7zXCZ4rQeTPc5tjvxmyhI0N+GnZZEHquIBGONZVFq0tdAtjh5HqvPW4s8R5zCuWHGiyK
 q5lkQ1s8avIm6K5TyjLXLEs8eGjl8q0pPkG6TMLduTgK+PZyqNaVPwuJ1t2li8tMO8hxdZYmj2/
 8wMGhXQzbBxtNKsRHYg==
X-Proofpoint-GUID: fXcQAmyD8paLomDCJ4fNJdugjKxCGDxU
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb5f12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gedFiD_-BdM4RCKrvjUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

msm_framebuffer_init() checks every framebuffer plane as a linear one:
(height - 1) * pitch + width * cpp + offset must fit into the buffer.
For UBWC this has nothing to do with the memory the DPU fetches.  The
metadata and the scanline padding are not accounted for, so a 1080p NV12
framebuffer whose buffer is 15872 bytes short of the UBWC layout is
accepted and the DPU reads past its end.  The CbCr planes are checked
where the DPU does not look: it always fetches them after the Y data in
the first buffer, ignoring handles[1], offsets[1] and pitches[1], and
userspace relies on that (turnip reports offset 0 for both planes).  The
pitches are not checked at all, as the DPU replaces them with its own.

Compute the UBWC layout instead: require the first pitch to match it,
the CbCr plane to be in the first buffer, and check that the metadata
and data of all planes fit into it.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 1e236416e15f..dd24aa7a5ee8 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "disp/mdp_format.h"
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "msm_gem.h"
@@ -146,6 +147,7 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 	struct msm_framebuffer *msm_fb = NULL;
 	struct drm_framebuffer *fb;
 	const struct msm_format *format;
+	u32 ubwc_pitch[4], ubwc_size[4];
 	int ret, i, n;
 
 	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%p4cc)\n",
@@ -177,14 +179,41 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 		goto fail;
 	}
 
+	if (format->fetch_mode == MDP_FETCH_UBWC)
+		mdp_format_ubwc_plane_sizes(format, mode_cmd->width,
+					    mode_cmd->height, ubwc_pitch,
+					    ubwc_size);
+
 	for (i = 0; i < n; i++) {
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
-		unsigned int min_size;
-
-		min_size = (height - 1) * mode_cmd->pitches[i]
-			 + width * info->cpp[i]
-			 + mode_cmd->offsets[i];
+		u64 min_size;
+
+		if (format->fetch_mode == MDP_FETCH_UBWC) {
+			/*
+			 * The CbCr planes follow the Y data in the first buffer,
+			 * offsets[1] and pitches[1] are not used.
+			 */
+			if (i > 0) {
+				if (bos[i] != bos[0]) {
+					ret = UERR(EINVAL, dev,
+						   "plane %d not in the first buffer", i);
+					goto fail;
+				}
+				min_size = 0;
+			} else if (mode_cmd->pitches[0] != ubwc_pitch[0]) {
+				ret = UERR(EINVAL, dev, "pitch %u, expected %u",
+					   mode_cmd->pitches[0], ubwc_pitch[0]);
+				goto fail;
+			} else {
+				min_size = (u64)mode_cmd->offsets[0] + ubwc_size[0] +
+					   ubwc_size[1] + ubwc_size[2] + ubwc_size[3];
+			}
+		} else {
+			min_size = (height - 1) * mode_cmd->pitches[i]
+				 + width * info->cpp[i]
+				 + mode_cmd->offsets[i];
+		}
 
 		if (bos[i]->size < min_size) {
 			ret = UERR(EINVAL, dev, "plane %d too small", i);

-- 
2.47.3

