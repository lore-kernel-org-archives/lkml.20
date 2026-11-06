Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972687;
	b=p3f5pf3ZozWZT6VCaJPlO3nfTaL1WvJEQkrDqIi23oe88Ki7vl7ugGq5V0a7UFGh6gjl
	 OyYlw4dEZAdNONeGj+a788iQNc2+K4BOGNka8LXlRJGup/RauOuo4UbJ0XAg1dkVD9baN
	 UhfrEX6BGIbKEeP8LT/86hzyjHcswDg3W/vlUDo+/WnNdFK5eBRUYpE81aenXr3bn46nc
	 N1kVvOXtS2637BKYtXdWD+wnk8TiIqOOVLQxl4nCZlBb3vjGG+fTRGH69lutoLbFEJOHq
	 FfGzIFm7OH+Lkxnl4bhAiQUzhs0XNr1hyrb2/E2YAZSuY2X3JZnPC+vR+44Vfyrbe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
	b=z2ldsiEli3UA1G3J8Sgart3ts0h9jJTPiZiJVPEWcWTWhk78FD99zrP0Y4iXcSwikY4H
	 63jFStxGxmxPw1o5oe8wJJAUKWp7IP+EJnmunUXmRsBiFt0zW60DKZzZNfFJ6blbOwjGl
	 Fz+SlmvXcijUgx6vfTQ6NHBCSufSo5ydS/fMKovgP0aA8RN1FRPvDv+WBXURdOLDlBnqJ
	 XDMuUNWcSt/Y54+UiSeii53lsxi3cwAT9hYWKUbI1Z+kGFCca2B2lasuHSwOmySO8ey8I
	 J88Yzuh07+SMsv9d2OsKwtdp9qywSrpufKmtMS8Qf0+4qWzWh+9OPlB6lPvPNwXWztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8DF606EEAA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8DF606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBgk444196
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=; b=GBZFvIQTGt0yxwew
	VfjJMKC3DWQx1y5HV8xDitYh8SRUZi9Pn1fpydibyFVtI2IqNBQfXH1dXIBmjcku
	hMOREk61sIunKEnxGLoLN8TQjHMXhefPF/9owEwxlCPR/KS7Re7XSj2fHNKlMzsU
	3Ysd+MWT1jXNdpEC1Q58tZCbmcBhH7YfJLe2+uWb30ynIf8VaWMd1UYqLuHo2bJO
	YbJoha7rvUYiQseoBx/kBFyffCpO9tL3NIPq2fWv8RfiUUAwrPCPYNl3MSjrSonT
	ZR4fKfsy1AOCONSQFs12AlKwzlj5LiLD49zAfuK9mkWMQBw/84ovrFC9l7fcP+HK
	eewsfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u1ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:44:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so142303785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972684; x=1794577484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=hDXug8j2X/I4oITO5Xh+cdongdUf8XlXy9n7FuLucoxh8j8ryaqFjJMd1FfWFYCOij
         UQ87gqCVmSqq7YAd+SZHX2nkBIIVjxKr6WzhEXAyZdPXDhvE8KDZJthxPkqHJQ9UNiSf
         f5IXkHTwSvB8Hey2NAhnJuM77Q+MFXEkTuuS3a3mh4QtyC5Y8MOoj+4HtADTQLAbDocd
         ZTNVgM5FP+8P0bb9YOQmkdFLsKn7ewdPWsQauBqrGtZtsB0wgBnCZmxf7FGi72aaUf33
         N332qf/mQ6dgE/AFae+J3VnP9kp2YExa9ccayFUzPbFWwsx9GI89b9GMK554QCEvbz9G
         MT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972684; x=1794577484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=ANEf43ydNn82KfxI3I6gHH3cTT13c8JWqO1zVPqMTVs12auF+F0wT0VijKCwjiv1A4
         Np2SMO54xfX7FUMEi/D2qQ5phRD2NzIFrc0Jx1a/x8TDP2FEWTQPjtRvJlmehRlyJfb4
         vxDeeMmI703I1zDi1DCOlE2x4pIwkfbxtZWCqdyGC3SP2s7s+F9f9JyCYzCemrf+Axbc
         iK99ukGGjdCSK2Inx2joLax/rP9I2RQM9BzB04zj6iuqjMI6F51OxZMs8Y3pmOIhDgfi
         X/E4tewXEg+NCUuBRVwXLAIVG/VVgOuBNrKoVt68Ws0bhDosYxKBik6O9opLj/raB0I4
         R1tA==
X-Forwarded-Encrypted: i=1; AKwUvBxy1/vU1IkABtnehX0+pujjovRIRe5ol9ccQzLVTsm45gGJV0L7wHvQqVBBCD6OaXwj1zX680rK2v48aUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h90EZsHhs33qrlIp3z5fIybaneQLNGZ5hQLwLnFDp20ytvLW9
	jBbOkoU1I2gwWbyvFD7HvqJNw6XgQGQXz4uiooRa9gvko42qVBIoH3TcmBI95Q4FjC9mE6V9H8j
	SmqwbFPBTvXCXLNtHhYFwMPE7oQ2KRsMxwYwcuTCIatw6yPbTIjoUcKgThuOEtoG9XA0=
X-Gm-Gg: AYBFou1sKrv1i0TvWAH9hPxoOuiITHPlqcoTOZEHp/Q4BvVZ71XUch9rEmcJA/P0kuX
	AT9N3KPRPhBvwhdMbirCHQITCD3+yQ1M+BwJjL3Hd2UORik7RMYSmu1m1yLJtX/8h4HDMuERoOw
	fyVbgbyxlhOdW0RhUD65lAQFH2Z5KYzV1OUhyXVWa5o7Pkxzb8Z8ZHdKDtlfTiQSKghbI/JdPH2
	OGvHIfJ/bRjW8A2V/47XcAKhYU96qKG+IAVC3uAytvlpCfmfJcQP3EWO7YPucEsx8ZiO7YXHYFh
	Wgk2R/M0DsrcyxL8b3P8CuzzyIYDHro26m91DhNgoi+yoJBxYpNjz57n1rRCqUlXKYUoaTPyP0U
	H9/aiTw0y9kFrm6L9+B6LtgyP6zx2A+HUY2OmWFfAfsp5oVYATUZrPnViU4siPOMXcMxSeD5dCD
	2X5u3M4Lm3MPogoKB1Gwqv/K0Hb+ImclyITXUYlwN/xdDbnorn8dwqBEgVNxfNsw==
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352009085a.58.1793972684178;
        Fri, 06 Nov 2026 05:44:44 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352004485a.58.1793972683453;
        Fri, 06 Nov 2026 05:44:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:10 +0200
Subject: [PATCH v2 4/8] drm/msm: check UBWC framebuffers against their
 layout
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
Message-Id: <20261106-ubwc-format-docs-v2-4-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm1xmEojRhtbHd26chPgyY5e9DYUB3anpavp
 sGYE9QRf6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZtQAKCRCLPIo+Aiko
 1aybCACWYFM2oDjJ4iQ8s/DVtvJt4yeL6Z+vXT5ZTRIExu9PNK25Kr5AIqBHZMkgiJkyTgutTPj
 8birGSMAO+r6KJCGQcbAzr2ElX46/NVd9PubPCl1CbCHcAIZy9dP6Jn7n0y+8RvJhh/1Rj2Os3p
 ztKl58J7/xel36mG1SW3pVq3cBk0IsjpjsVRFDSPSHiz3gPrz/LEBMtItmvBl5Ha8NisCdBUdWM
 kljD7wThly8rGkRBS0iPRhbm3WoI81lYl3BgKyQXolQ2LnfmT4IybHXZVc17b3kDlTskbmZJjBN
 kEkpUolW95vQmhIt2vNiHa/kwm+uvPcjzIQsZ5OPVFKcJnVn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX966rzLRaOWsw
 958F3kUdZluVa7I2/hwQnYkwkqK9dgdTmcWD02XqKsau+K4WgvPFT0/rrYcbuU1imB7QzYJKtXC
 8Vxkg5QQQ8lxtvr18ThB+avHDWZNdSs=
X-Proofpoint-GUID: Rngs6ZND7AtIy-P4RYZPV32mUsJPUMev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX2C0YxBDOVQOP
 la/YPJLYTUY4BacARqH4/Tgx6BIhsWAKTNagHsYh9D/DAPFhN0bXuq6YF2c6j4PScomAfwGpOsz
 92r2Q/2fGJAZd8grJ/jIZYpZ3k2ZIP4lBj7+NfxKTpEEv7RssG99zn/dDx54r8UXPJszV/XevD1
 3PpU/0SnPkN4qcQaPy6X3O+zJgwsSYvtiRd3OVfYd/gOV/OpuBWTuw9bizSJiYwF260raWjCC0M
 RlTYI9SEmSlCYhVibp4YNjYjDQd1LbYBPqCXfXOZczB2MPtDjw56LrBssIc7eX7tI+HvH2sAarQ
 Bif2KjnVlltoR3NrQ6BLlDa538JwntOraH1//kgXAPL09PlAd6SoenHDuYTBhEPFbmXwMSeGZKv
 7YYwJS1S4T1NwuwhNW25IRcyBCqVBG3sT3zH5PdbKpXuAqGuMpp2Y0ou8VmYly4EnzGBZPv3pR/
 0Yih3KdipdgvNCKsVmg==
X-Proofpoint-ORIG-GUID: Rngs6ZND7AtIy-P4RYZPV32mUsJPUMev
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd9cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gedFiD_-BdM4RCKrvjUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

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

