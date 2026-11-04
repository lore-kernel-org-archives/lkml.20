Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810194;
	b=j86bMKcmgel6WTCtz6bM+TAZen8kAOnGKB3tF+M5rWxOpuINJtljm71XsYWXz3JPWr3H
	 mvjKVUHqUqhn0GAmn1Jnv0HF3uaWW7ZyYQnE8gBeWrRc4l3HpTyhH4raud++o4U4UFtlg
	 H+Nd8hyuu41PGGRWPQwVmcUo9GBd66pqZfjWlxtRbXO5r/uYK7qZ3NC23Fj1MFvSqWLNq
	 VRReepxZ3KxNd50Ed0uPr2jgUaCo2Gzk/88ZdO/dxde/ANryxmK/i+I4UBtscfX6S+jwo
	 Sxpk4Asm6xifJ2TDqaTIF2kaiRRYw6MriVr+K2ujddQHaOOum2STcCX93ytq7CpKLHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
	b=jjGDpX39KzW+/tAv2khproKTdC6/pdRkHoMiPgwarIFa3cQWkYTq3aICHfWd2UWMTtEG
	 fnh8+LBI/ZjN0ARDc8t/7DWC1SjaUKS8Ijgae9U+1RcIkQTKJDcWo21FkVr8opIQjOEFq
	 APMrdpqVtwdxxtFGA3KfGS/ANoej9Fu9unHa7mF+0gCqZMbd7Ykjj0r27pNhi0ezCWEt0
	 PDCUU3cYu0nGvi+Wtr2Iu6Qrh80hwgu5WWlAdyATm7WkzJg3RH6FAGm52tfYylSu4asX2
	 XhSEhw3fYWZbexh6atqDZURpWUySPZb2F64g1nSqFwUupkVM/hSp2qu9xa/vNgB4i2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BC606D836
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59BC606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fisa92210743
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=; b=UPinxDa4Nt2UZpDl
	TulAVH8nVYovHQv8fzAwCsFuXWeZMNZBhUR08kP3gZo0c0P7cyhzuhQLLTk+nZeU
	yiZ1LwoNHZJvHqa74xHsBXe8QCAMRcuGRJrK3uY82QAya+vCtBk9bYpBXTBGKmRG
	UJqnQCcJIQ02x8mF6aj4WSd8c3gPbSRBJNmbeWqiEQp0Eg3I4ZAn3yxPAX0Fn+oK
	3N8JeOsyhJqlbOrG/0G3o2mfYzxqJHmqC47MhKpPIemBzSuC4w9B8db6YIIUQiQx
	8UnXCThSmdBDFj/kazThMI+FfKOqbSJ1STJQkW9IcpMM4N6KSwqD3OU7RuBG2wdE
	cfVasw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdrjcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944101e6367so140926385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810192; x=1794414992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=Yptl6ZB8cZpRJli8EqKpUemjXR9ou+Qk1/ebLnrtTxG8c5w9ZgrXp+Fm0QVBdxOItf
         X6wITRKqm4QVxyIORl1Qh9jl06HL9XO62Jn/kgT1ZtwUuwMB9Ra3I9G5lIv4vaEe4ZBO
         CLaN1hkFGdlqu/uMwY5FjUkQKUJnmvDh8VANpHh5j5VmfT8Vca0Qq/IKe9ysM2HMVZAJ
         kawkNsroO/9trdvWyQZomR11HOKNHdGOzaDAyRZQoSGzlbWuHSZ+iZS5v2nzV8V1ugZa
         emDNxMPWAKnVIBXhcfr+0p2yKNjLi4B58ofhrsFrqF+vmv3OcUgtVCHXZAcL0FvHYb+u
         o8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810192; x=1794414992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=kssnKyVbEn0vnv5v/rb8+y/mw15QzWO65Y4S2+ithC2MjBpNcHmf6CwrLriD1HRsm0
         v0dhRPMoyrSb3f1M0zF0EE6wfAsxw7riHE8pQGhyvlYPITHv+D8CpOtBT5QVd7XzEoOt
         nSyT3m56/3YKF4+sM0KuhCS8jFo7MsMyLF5n3rCnA/av/wmDkU6ROYLNtM8JoGoeBHKW
         TlJcFS/QgVLTPcfatr/aBxLcZOLOtBvL/rRJ2X4nlrgJSqhlqwllGxmIh2G8Pauei5Br
         2J3LzmaOr2yJ7YHZIQ2uzXaLeRdnkUZ1FR5ldZe3/vAbaJ6Zw67e5KIjNRIUHQRW9oic
         tSDw==
X-Forwarded-Encrypted: i=1; AKwUvBy4p1ck1HrzICFFdTuGKFSpJ6c4EFypWkQwAoqHTM8nB90oumXU756WfG7eCSlToQH52GaiG2BstR0hf4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nlKPg0miVGFh2JeO4by/atP9Qo5qmURYmxXCrkLsgjWEPIXLT
	M+nBAREHsjJQe2pa5be5aZhDR3Jjp1Msi+Dgm1WSytkSsPpK6qE7SCCY/7MGQkAkAD/2OQ2T/sM
	FMDX7pbBAvESMSOVkYL1DFMXIpxbxOPkP4KnE/boROMrzHsM6d3fPcUxO8nyPEqq7ccg=
X-Gm-Gg: AYBFou2N7FVLUn2FneZHV030OscZRWJMD5y299aQQhcJA5FVZeDv4gSX7BfZldGdKbz
	XOo8S4Ye5YU0VylK4haRDh2pREb2yA0FiJOWgelgqv+QH6AkcxysxELoAwPYkkd5to0IfP8vMHF
	Z/AlJqqsIFygm8JEUn7KSazDpc8otj4TloNzNwEbnXrDjU6TEiLogCbqIJb4Qs1GaLOM+A6PPnk
	Cdf+FVbFcoUUSrgtwyA3V5ISQEQ7lvJ/l2u0V3MBOQJZt0FZqOVlbxFiZlkrdPYcu5BbaTe0mkd
	nz6vSrULbEMykK8gQv1Y13UQBJhZXb/1V/SXA5zrfufnUGhL+C6SWSf4E3HTWKaORJ13+lJikvG
	gzCe2RXQ3oKV56jAmZEgSDVWKhHExzQYzVbnMRNohruF2JR8BZafOMRz5pBP4eNn3hOtkdOmeNU
	Y9h6cuh5j2w0LchbXk1P8RZglrwURCK/fUtHmtE7VUV/xGTWRHLsu4CcmjtpZobA==
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr446885a.13.1793810191829;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr438885a.13.1793810191159;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:06 +0200
Subject: [PATCH 2/7] drm/msm: move the UBWC plane size calculation out of
 DPU
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
Message-Id: <20261104-ubwc-format-docs-v1-2-389044012b4e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8736;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AmdZZg62etbzqZIgQV9PfBSP69nkwN0xIASVNbPOxK8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq617+1qF+R24xmUAxP2TrQLUwrFxFuOgmulHi4
 q+hyZuqzDOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute/gAKCRCLPIo+Aiko
 1VhKB/407uGmM/srEr7Xg12peHhJqPs7IvflofwSqDUSAHpCjEkv2nnWGoXqOXZ7YKXL8m3F1gS
 bAxd4PsxhqbAAjs174xGvVx/IS3Vpx0soEM04oSGvToWxLM2T8AAkjDF2rV+f/jrbgIhQiMNiLa
 zVXlTtX7U/BTu2WmHVdo6HykTJR5BgcL7C/CI/oExjTg1MQgiGJ4J/ZbcZbm8T98WGTbsYPXA6v
 92EsAOO5xaC2FjUU5rgsA7Ukjyy5APjya8pPCklsW2TidqrfZm8CcW0ctR5w73TSkIj9k/FmGy8
 v2N1w8DQHcmyh9+4gSrp3YZ/UU1+ZR/zYI44q65GSHvqy8OU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX3EIjD+Foj10l
 319/2O68PRVSXS8kJk1SfsRjAlYdVyQL9ACcdzl8KYoohmcLu8uzSH9oVzP4UIGWF5CyYYF2cnM
 xIATg84ugfasFtI+SpKqEQ6up5Z1Ugs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX1GEii+nzQgNF
 tVLZ2/1xZFgVBZ3InSt1rkczIRUd5h9jhKY2rbZAUqqRfg1pEX8oLdw//YDgMvc5VbGWP372r0M
 MfwIZUIRdNjmp1+zc95jg1j7Q5aWuc2d494W47Md6WNFJs+MgVPlBuo2v5X9BddHbBN85yUzGQt
 ohjT33na05HZvrVBddGpD0PCaRNiiKc9+xU3YMbWaLGFrzcqXoap6a7NWAN1eIW8PJVHBDvrqOg
 7n577xuMkc80+OcOhEvzYvCtVUtAFGuY5WoS6nY86spjAM8VeOAj7oD63t7nF3j/ogIVwT5VnfW
 s/wsWWvTGVwma5hWMUdBalGJbjJSxckQeFpJikbxzmCVBXGATpART6zzArrlA8wOcCjqTMvTcby
 W2AYFtVNkLygqbGqsU+pdO4KuACiqWxQcsio/TBDbeEzOL3PKpmI/4wPzT3UPXTaIsVOtjqtFO+
 hddty7nJb9efCSqod9Q==
X-Proofpoint-ORIG-GUID: i6AYq0ZTPy5ZsULhp_ef8AqFlNuQQtaI
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb5f11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iK4Z-rw_lK1HlppuerAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: i6AYq0ZTPy5ZsULhp_ef8AqFlNuQQtaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The layout of a UBWC framebuffer is only known to the DPU, which computes
it from the framebuffer at atomic check time.  msm_framebuffer_init()
cannot check such a framebuffer against its layout, so it applies the
linear size check instead, which neither matches what the DPU fetches
nor what userspace allocates.

Move the calculation next to mdp_get_format() and make it take the
format and the image size instead of the framebuffer, so that it can be
used before the framebuffer is created.  No functional change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c |  84 ++---------------------
 drivers/gpu/drm/msm/disp/mdp_format.c       | 100 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |   3 +
 3 files changed, 107 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index a8e9a69834af..06903325e7e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,8 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
@@ -58,87 +56,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	bool meta = MSM_FORMAT_IS_UBWC(fmt);
-
-	if (MSM_FORMAT_IS_YUV(fmt)) {
-		unsigned int stride, y_sclines, uv_sclines;
-		unsigned int y_tile_width, y_tile_height;
-		unsigned int y_meta_stride, y_meta_scanlines;
-		unsigned int uv_meta_stride, uv_meta_scanlines;
-
-		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				/* can't use round_up() here because 192 is NPoT */
-				stride = roundup(fb->width, 192);
-				stride = round_up(stride * 4 / 3, 256);
-				y_tile_width = 48;
-			} else {
-				stride = round_up(fb->width * 2, 256);
-				y_tile_width = 32;
-			}
-
-			y_sclines = round_up(fb->height, 16);
-			uv_sclines = round_up((fb->height+1)>>1, 16);
-			y_tile_height = 4;
-		} else {
-			stride = round_up(fb->width, 128);
-			y_tile_width = 32;
-
-			y_sclines = round_up(fb->height, 32);
-			uv_sclines = round_up((fb->height+1)>>1, 32);
-			y_tile_height = 8;
-		}
-
-		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
-			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
+	mdp_format_ubwc_plane_sizes(fmt, fb->width, fb->height,
+				    layout->plane_pitch, layout->plane_size);
 
-		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
-		y_meta_scanlines = round_up(y_meta_scanlines, 16);
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
-
-		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
-		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
-			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	} else {
-		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
-
-		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
-		rgb_scanlines = round_up(fb->height, 16);
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	if (!MSM_FORMAT_IS_YUV(fmt) && MSM_FORMAT_IS_UBWC(fmt))
 		layout->num_planes += 1;
 
-		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
-		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
-
-		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
-		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
-
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 33da569eae5e..c0121d709110 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -650,6 +650,106 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 	return NULL;
 }
 
+#define MSM_UBWC_PLANE_SIZE_ALIGNMENT	4096
+
+/**
+ * mdp_format_ubwc_plane_sizes - compute the layout of a UBWC or tiled buffer
+ * @fmt: format, which must use MDP_FETCH_UBWC
+ * @width: image width
+ * @height: image height
+ * @pitch: per-plane pitches
+ * @size: per-plane sizes
+ *
+ * Plane indices follow the hardware: 0 is the Y or RGB data, 1 the CbCr data,
+ * 2 the Y or RGB metadata and 3 the CbCr metadata.  Planes not used by the
+ * format are set to zero.
+ */
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4])
+{
+	bool meta = MSM_FORMAT_IS_UBWC(fmt);
+
+	memset(pitch, 0, 4 * sizeof(*pitch));
+	memset(size, 0, 4 * sizeof(*size));
+
+	if (MSM_FORMAT_IS_YUV(fmt)) {
+		unsigned int stride, y_sclines, uv_sclines;
+		unsigned int y_tile_width, y_tile_height;
+		unsigned int y_meta_stride, y_meta_scanlines;
+		unsigned int uv_meta_stride, uv_meta_scanlines;
+
+		if (MSM_FORMAT_IS_DX(fmt)) {
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(width, 192);
+				stride = round_up(stride * 4 / 3, 256);
+				y_tile_width = 48;
+			} else {
+				stride = round_up(width * 2, 256);
+				y_tile_width = 32;
+			}
+
+			y_sclines = round_up(height, 16);
+			uv_sclines = round_up((height + 1) >> 1, 16);
+			y_tile_height = 4;
+		} else {
+			stride = round_up(width, 128);
+			y_tile_width = 32;
+
+			y_sclines = round_up(height, 32);
+			uv_sclines = round_up((height + 1) >> 1, 32);
+			y_tile_height = 8;
+		}
+
+		pitch[0] = stride;
+		size[0] = round_up(pitch[0] * y_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		pitch[1] = stride;
+		size[1] = round_up(pitch[1] * uv_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		y_meta_stride = DIV_ROUND_UP(width, y_tile_width);
+		pitch[2] = round_up(y_meta_stride, 64);
+
+		y_meta_scanlines = DIV_ROUND_UP(height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		size[2] = round_up(pitch[2] * y_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		uv_meta_stride = DIV_ROUND_UP((width + 1) >> 1, y_tile_width / 2);
+		pitch[3] = round_up(uv_meta_stride, 64);
+
+		uv_meta_scanlines = DIV_ROUND_UP((height + 1) >> 1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		size[3] = round_up(pitch[3] * uv_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	} else {
+		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
+
+		pitch[0] = round_up(width * fmt->bpp, 256);
+		rgb_scanlines = round_up(height, 16);
+		size[0] = round_up(pitch[0] * rgb_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		rgb_meta_stride = DIV_ROUND_UP(width, 16);
+		pitch[2] = round_up(rgb_meta_stride, 64);
+
+		rgb_meta_scanlines = DIV_ROUND_UP(height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
+
+		size[2] = round_up(pitch[2] * rgb_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	}
+}
+
 struct csc_cfg *mdp_get_default_csc_cfg(enum csc_type type)
 {
 	if (WARN_ON(type >= CSC_MAX))
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..02fde07eb6f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -204,6 +204,9 @@ struct msm_drm_private {
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4]);
 
 struct msm_pending_timer;
 

-- 
2.47.3

