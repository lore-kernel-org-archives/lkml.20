Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6B4A484D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465300; cv=none; b=dgcRKFTI+ND3hvtA4ORyIFwmeLI8u3LdHa9DWoa1qC1g0nZ3mCX2HGBESy0uDzGmoGc4hLSPwwKTUp6RN9cKisl9yvxMjo1hWw/SxVHIZIOIeRSisZEoLepq3Mg2K+Wg+V53rWf1V4rty9/D7jJ26xqQ/mxl++W/JReKFdk29W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465300; c=relaxed/simple;
	bh=MZGERy6Fpx88fF3L1FgQF/k3kPkrjYHnP54kpkXn0t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VziedkamLFZQKAXcMYiqlgUbB3eeX83Buq6AisGouQ4lpuFlbI796M5beGooigj5IhQ2t4thRgGUhiH0u8T4KkccIESYf6MQrR/3InsSjImW3QYDkSEBnf8v0OwiZKuv6ob9zz5aXkQdjeHnCe/YUgijwFkKmZi7vYPRdr/Oujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIlsv7Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rb2P6YFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIlsv7Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rb2P6YFp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKAdW1269515
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 13:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UB63N6HjCANQZ5jq0C7jY1yKL31IEX47Vb1BQuveQbE=; b=bIlsv7NbqLOCE5Qj
	Hz4ZY6LmMaLxesq8meiJByEhXEtX3aGv4G6Sw4DEzT4L9v9FLTvOz/a7Joe6WYhO
	3FPqesx9LKwz41BgHBuKYJ6om8iRMTqY60JGe2vNNm+t+oDMwsmvYXE0mSGH/9Ih
	OTVHzj2ZF4O+O1YuiO2KRHpSJOH4TgZlNlw4kXcej8se91o292CWbrZstURT3zeG
	RoXd4PUYXVz9w5pNd+lIDl2tvxbCBndr9IsnQhB0hiuGuKLeAFr1N9aWBj1DkgkS
	p/H3Nv+gbG3KObTw9LY5XjT180RpqJqHEBQbmcl43sbI7eyxHpJWcetLMMXiz3NY
	E9sNGg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32xhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:14:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c15deb3794so924071137.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465295; x=1792070095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UB63N6HjCANQZ5jq0C7jY1yKL31IEX47Vb1BQuveQbE=;
        b=Rb2P6YFpxry+GS1x9GydldLZPU/g62SsEVNsBVRV0+BzyVPJu2RFaj+HONk3Y7Mqn8
         DQQwjkLJjQjhpMyphoxkjEynYMMoD+ZwqgM0vPBXEuqHFQK5Ec4Kx/S0GDTLPHxZWABy
         Vk7vCrQo4BePGQHUXbe5nuKsxUCAh77037WDJNNUxvC5xXLyPk8rj/FLH6YvcbUpkMTo
         YTM0sveYaD4EqAtWvyDprPn9+In13rqX1DYS4QPtPPJ1Xu09WI2DOM1VzmL7lwfHPJCH
         s5LgAL4Y7TclEVdxBF6oqYXPL/9wxk0dJThp7vY2qV1gVHuwBmWRSUIrB+mSDTbLbgEH
         dr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465295; x=1792070095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB63N6HjCANQZ5jq0C7jY1yKL31IEX47Vb1BQuveQbE=;
        b=ynIOScr2OfECn1JTert1TUQzAOgTEMbhfKsaVP4sQnbFpdKXXUTqqsNcMbb8BOZ4AY
         +Kvrtvpzbj1V6voKlZ8ruf4V2144Aen5Dk7fcImT01xc1u7LvnD8i0ovSUCBhFl01Puu
         8IgJdGwKIFAkeL4DjjUy+jTybOP+liMYAftQd1nTYLkTZnOnt9+I7EUCvOice35RWcHs
         i8Pb9UzIDg/b3n2JGxOTPa7fig3pyPvT5SkEttnvrjqVx3bD1R7wD3syfd6/GQmTic2t
         WQFrKskgNFpWhjeELen61z2se3lmC6dMG4L2uRqbxT8alfePmtB8kkVccwE+syqcL8VI
         Y5rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxizxkJA5ANwlikScK3WxlWHYB8rS31N0GWQIgODOkzkAJacrFnFM3mrepQVX5wcOVR4roDmpHMGT/VmfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMzyOZ09w4kxz+lUu+atcOqh7wNdZ0T5E32rOd5Xw+qREiKW8b
	FYOsjPGvgB+bokAp7exr1KeIFMy6fmajljtcUcowvUhQ01A36WqBtIkT6vWbKM3gAQAZKmNBtxV
	9c/sxEG9A9MusHoyn1Z0Ex3SdOV1MU9QTIfgGcYJLDDA7/UCQIgCJzhCwOjAA2OeuV1c=
X-Gm-Gg: AYBFou2fAAZw8/ezEeAlGiz2bhMXH7mRdv2wkftaJ2Xa5+edh5pru7QzWM8mpbLsC8A
	ncTuYd0/A7c63D/mVTiX2XUYN2E1b+J6Dloz3wjetO2mEtsj6X2snJJo4ee68Lwoh4tAeS6UpW9
	7qxASRYkqo10Zh94z6aNRt1uEZI5u21W/FJ63N24KHqlvSH5nJqMjDjIgEgfNJSr6F7FDii+XUH
	IG07ssJeo6nJb84lRdD4N6Hu7ht4uTPKWlbJAbcmfIrSsnB2YOw+140rSrIQOJM/gFaYm/x3GlR
	5cRWfb8jb9sidJr2THJJDaQ8XLROwT1w6r41+PzVBMSpgwWtS0r6idq/wbO8W9bXdt+DKH4mGh6
	qPmu+wwwwfo36ylAMpSP8B4CFq4L8Jk7HO4nK0RXVOTaAqRbydMTrC1Wk7STGcc1z15BWn2PZAB
	t0QNRWsLUUli0j
X-Received: by 2002:a05:6102:162b:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7ca36e3fc52mr1320965137.5.1791465294859;
        Thu, 08 Oct 2026 06:14:54 -0700 (PDT)
X-Received: by 2002:a05:6102:162b:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7ca36e3fc52mr1320952137.5.1791465294370;
        Thu, 08 Oct 2026 06:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm8691441fa.30.2026.10.08.06.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:14:24 +0300
Subject: [PATCH RFC 2/9] drm/bridge: add atomic_print_state callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-panel-atomic-state-v1-2-b157fddb8de1@oss.qualcomm.com>
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
In-Reply-To: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Val Packett <val@packett.cool>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MZGERy6Fpx88fF3L1FgQF/k3kPkrjYHnP54kpkXn0t4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqx5dGgJs/eNkfeGan6xT5FkitBUDvoGTi3H0WE
 1JaURvLsfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaseXRgAKCRCLPIo+Aiko
 1SLzB/964+d9UkU5qtInoqgXCytUAqXZfOreqw2r1RZimxh/nfZn2O+3soJrUMduBuHwxM50noI
 TRRDH5HnMzHniVoyDd2DRVxQtHWH/ckRmLV4X5GvpyeANlgDAl14LeDgLaKy+UtjccoNjPQQogI
 IZlWpV47xRk4RZoG3S8Ka3LH2KvYP+gaeGgkl/wrcQky0jwx2+rlzBGk0oN+ON11hOcDp7uPg9h
 Us6qGr4IdNSHlbEwAGyfQ6EhpLModsgjcuWgMTuPxyj72BoZUvucxGlcoANtwPN0KJiHh2OcAdU
 CckjWOjgxFQXJbzxMavfR3OeshcpJVNqmLMTztG7AES2cESG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX3YdpMMrf2zQr
 kxHiOED2s3o44lX/eYTpMMQ5jVRSHC2ED49GJc8GWag/fWv2OoE/Vf34q3EM0hgXGEWSLr3GpWV
 cHVVcSXTtIscCQ3GEu/8bWDRFQCgQ98dGnued9GL84Ge94uKTfPnWxrfkY96xQzgGSCAt8bd8g1
 vpLfL+0RdhxfBIq7cy14UTZj4CImvZ5ncm8x2O6ospTzm3h1rr+UwU3SUImmY2LdtZzAUclcS7e
 bcJvJl2694J/JxBsODbJzl9PTBd6ff5Zz7vW+K166KX6jCCMaIiTMQwp9wwBhqMHRllIgZ33D78
 XBxsgpLba2PZ/3Bqlmh29PabNYZf3DDWx0LCAg4o6RdYhvTUbHhsg66Hfhc+mw4BT8Lz9jJnEkj
 wnWd5qJBtXQv3QhefJ6XRvcozvaJ8vaBxY2pHiVHfG26M2Pq3cS+jYV/XaddFpQyWd13fsnX9yU
 7w9w5orY0XtCeIMgIFw==
X-Proofpoint-ORIG-GUID: s1pQP-uM45Z9OC3bsFSlGg06kAmeZH95
X-Proofpoint-GUID: s1pQP-uM45Z9OC3bsFSlGg06kAmeZH95
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXyrD93Abu6SO6
 AvXFQEciOwOmqZw4nZB4IXWUk6kqPQrvu2Nct0+qSvAQg48y2pv3kMkqi4huqPtX4HgpieguEQi
 hGn8GVLxj7UBB7nZz0JWtWFKGxmlHwg=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac79750 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=amLuN3caG5KOhUPOIKMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052

Bridge drivers can subclass drm_bridge_state, but the state is printed
by the bridge core, which only knows about the bus configuration. The
driver-specific part of the state is thus missing from the state dumps,
making it hard to debug such drivers.

Add an optional atomic_print_state callback letting bridge drivers print
the rest of their state.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 include/drm/drm_bridge.h     | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0f37e3ade016..2b06171b122a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -571,6 +571,9 @@ drm_bridge_atomic_print_priv_state(struct drm_printer *p,
 	drm_printf_indent(p, 1, "output bus configuration:\n");
 	drm_printf_indent(p, 2, "code: %04x\n", state->output_bus_cfg.format);
 	drm_printf_indent(p, 2, "flags: %08x\n", state->output_bus_cfg.flags);
+
+	if (bridge->funcs->atomic_print_state)
+		bridge->funcs->atomic_print_state(p, state);
 }
 
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..8b0c72d93d9b 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -312,6 +312,15 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
+	/**
+	 * @atomic_print_state:
+	 *
+	 * If driver subclasses &struct drm_bridge_state, it should implement
+	 * this optional hook for printing additional driver specific state.
+	 */
+	void (*atomic_print_state)(struct drm_printer *p,
+				   const struct drm_bridge_state *state);
+
 	/**
 	 * @atomic_get_output_bus_fmts:
 	 *

-- 
2.47.3

