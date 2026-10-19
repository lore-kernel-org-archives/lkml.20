Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E24FD29E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415573; cv=none; b=Zo/DtqS7/pNulvMasP20gjBYLQdLng0Akq75w20eH1uogSMPqclwbMTQniGWwyjX1rhcncsThptPH6eUa+DdQ0y3hcLIQS0HfljkbOapBaHdI2U3O2D05YBz8kn494/XOLuZhHOam8zzjTcxIUDEJI6l5VKhwiKxXgrhPr/ItFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415573; c=relaxed/simple;
	bh=A0wfyHFOzQwCKryCN1GwVCfzf30IhVdazkuopORoCc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqXTgx0Jiz7V1Hdr1UWb7E8YjacLw5/kKGPu+iI10SSZv9QUTjKhj9wf/tTnEzuNP/jpfvT4vuInvqsIMp0SbrTgrjLEi1WgfWW6pX8xLwGnlen1qmSgaovtstp0RXgwfwcr3KbJ3fy8mqaS0mbtyzSELJaihIWkSXzFbgIB//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsbDlBmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GH+7NdZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsbDlBmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GH+7NdZG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtZA723142
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnQs2qSt8cC/wqbL3vnbFklmJgszfebQtqNB+FXPcw8=; b=BsbDlBmjlguLUMMa
	tQBrFin2yVFc6rFvxHU/4OYX7vcwxU6i4szUBfbLxUoeI4QnHUS9c+lsozdkbMPr
	Cp04AUrmejpwfTOM1zZOYGuwaG28cqXcmeOsDNXPf9tFUDNoGaltM2dGlTMoIlSV
	AP8VW4hNIwmF5E4SUUSytJAf3CNASzw+Cq5Z9kLH0ktzmJZkHU1EmKIhXUA4ZJGW
	4igAoihNFOF19SRm5uRNnOvZ1xpfZmMiK/wC3zQGFenNleleFgZ0r2zTuHX1yXIU
	EwyGTPWsU0tOIYk0NO5OxaL9mXs9DjXnjKoRcit7wTdGonRp97KRFpXWV7i6YFKm
	5LS/Iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65h7a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so221420885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415571; x=1793020371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnQs2qSt8cC/wqbL3vnbFklmJgszfebQtqNB+FXPcw8=;
        b=GH+7NdZG584SAjMAiGjOPBHZD2okrw+Z4EKvmRnzx5ysl1E/Xo5E16ifRfx+ExHBt7
         YiUbOrZ3BjqwCXDJvRsSibpG9HJP2VWy+vHBdxGC1TpirF78ekIVnXuoDaicmDyo4H9v
         YGhMlFz0qbtsk+xiGo5xPNb19nMXm32yRYOArFJW9b6JD/aci3e+ZThd7vI64N0p1PVd
         f7TnGL6I2ngPqKH7c3TIQq2WLRwsHNwxt53k8XMiN70sLoWsoK0D2Sutql2Shuew3ee9
         IDU9M2K1RTSjdaknFqOd2zr/B2nkLMoyd8mtexUbh50toF4t2PhYnYgyfu1uAnpGlyT3
         ekcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415571; x=1793020371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnQs2qSt8cC/wqbL3vnbFklmJgszfebQtqNB+FXPcw8=;
        b=lo7dKtyzJ5SzL3PCmubkVphlFkE/75h9iCfflptLB/Z8KNw2qzPxztA8xLu2YmJluk
         O3Hs4jiv6vnu6wp90MEvyMvhW+ztymtiWFsmvsbzbg7utRd9GEY+zx6KMgWs+SJDoOmv
         zOZgRKDhFaOafhneYnJLGvad7jif0Oyc8lowJxLPKFAuxM1fmvCQSSlk+145yGVJP7XV
         CV+T0JlOVtpD6B5Xlr6oF2bcAI7fQzLOsadytgewZP3Cmsvnds+g34hvVMvshMYLQaXZ
         rDcEGWWvWjF1cXJdD7i0H9NmyLPbqYczbCqMdd51LgJB/AYukfEgu80oZVdc+FkBoXoF
         Rwmg==
X-Forwarded-Encrypted: i=1; AKwUvBzH62lQahtco+1j0jQB0S7ZTgJ3/Nr3CkMaicNpLuvM9ehV/YH+Xg9nxHjgXa3OU+zbDvMztkYcPW0xTks=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCa5nIU8fPoWDng+NgS9SeWk49LZBtpQeFTTp8YnWVKFiqP/sZ
	vxE0hN9yr7R+k8WFJYmLy+McpvdyfvDtfxZr7JFNwpXBK5xyLENFZqwhKXDDo9x9NStJ7GDqdrh
	t3wwp4b1pkDPc8vDJ4neYSCVUcBduV9YDvlrmnJ/lskKHJDzItDG4/eiW1z6QGXytZn4=
X-Gm-Gg: AYBFou1NzXfQ2M0eyEyz3PQOOHgulu4QgU66YGI5M3lTeWVEaY/ksH0iwi3ZMlyg6YY
	cfueMIZTSy9PwxIBzJI3sBe5qNBZQXguV+GT856WJXzwT+jlG4//skf0hshVXRnAZX3AiVFdcUO
	0tSCGuIbJ/PTnPsMTpoVHeJR5Hjto36mIgPDGu21lRt8xom6GbieqAyOiX3ERP7VA60YJ/9Rx56
	GWc51DDf/mpH5lqu1EJ1KDR333QTFBdpY3ZbgE2WZtB/oi7879k5XKKtHFsabpfT3FiR6ljuxcW
	0+0GkZsNnRAEMY79NV/L57FqC7gJBw+Z99xOXTRhLyeIRRtZnFXl64tQ1nEeDGudgS5SET4hI7/
	BOuoeVFc7E/V44jtwK/ASTCMW90z0GQWXaV0R2xEfyVrcDWvJrwlfprFS+0zLi38SgsXDeJBRqg
	WzaLvbTVQqbofM
X-Received: by 2002:a05:620a:4547:b0:937:675e:2903 with SMTP id af79cd13be357-93f29cc8308mr1353834385a.14.1792415570467;
        Mon, 19 Oct 2026 06:12:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:937:675e:2903 with SMTP id af79cd13be357-93f29cc8308mr1353828385a.14.1792415569919;
        Mon, 19 Oct 2026 06:12:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:29 +0300
Subject: [PATCH v7 3/9] drm/mali: embed the writeback encoder in malidp_drm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-3-d4288a26eb54@oss.qualcomm.com>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0wfyHFOzQwCKryCN1GwVCfzf30IhVdazkuopORoCc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdEPEImUSMcnrRjUjk7IDgo42ntW9qMBrC7d
 3tG/h41nFOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRAAKCRCLPIo+Aiko
 1YE8CACaMMZouBjtqQ/KT+MNhbDcKLUXSgyW5PxAnAifLGe6PVkV5NDaOR+8BMd8EJX2J/Y+L3b
 0VZq+zV2XcWpHseoIJDke6YAcMSY2Z5NXxRrHwe4jimqwDftI6ubRIxigZCuBLwdzfuIJccjME8
 j9n/Ieln/GBRABTnxDlhuRJbpbalAfqkypE9tYBk4hYwdzfJjsgg01nzJq+dg3PZ8K3W27hTKBS
 m9Xw6LMHnXB2ztge2jNQS2ExqsNymPRWxIH+7qBPVJjc0XDMOII/63KVI9EONPJ+ZL8MkEWwIaP
 JwONLNaQXNg+QKtS9vq7mQAU8Zqtg4L17PHmDlmD2FHosfJi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX1yYUut7njEUB
 mnB521lnyZuEoqzE9MMwM7mzBHVGqUNUV2ksih85C/50ijnQE50UwmjoWDr9FMpgCuKiJAVE68U
 0z/rs1wf+5ss7wtP+dabxBn0i5z/ut0=
X-Proofpoint-ORIG-GUID: ihNb-rd3_tTIxD-ph93cM6nZfVAKU9SL
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad61753 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=eAXNdYJVcktrDQ6TNNUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX8vetZEBqAg47
 t/xfffcOOCj2vR+F5a2L+syxSjBdER79gjCQ1OXH2agYnFcNRDwG+tNoXqirpJyeKXVCop5SEfV
 I8+xlRGpnVEmmlfwkpnKv0w9nQ2bGra9CR0hrplqIQBV7YNjtnCkdSi8mtkQBWIVavENGOXYw+L
 X/ii5pOIhRFzKHr/sJIx6/lthA2hFebD7eA+Hv9MBox7eZkoz+k3zIbYr0DfDPGPolo5N/1Uyu4
 pGlWUW6Fo27cKSc9qZ+0c4YGc3RKrrpKvtdi0aj6mjn/8nTtvq0uKZBk3HmSvJ6DdHC0xiFFtLz
 RngHuxMvMEvePDlzjq1s9C/sY+dfVt5ng8zIk8RCPQzeKDmejmTk3FbppWhYc+/2Vt+wV9/gtMz
 FgjYeR7m6ATj1ChHNpIa62juPlKzXABWBG8f11nUzZmToGhvbjTF4E5ZyMXgOUxON2uemJf1431
 InPOYPPLsB/StnRnbBw==
X-Proofpoint-GUID: ihNb-rd3_tTIxD-ph93cM6nZfVAKU9SL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190052

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.h |  1 +
 drivers/gpu/drm/arm/malidp_mw.c  | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
index bc0387876dea..64610f2d23e2 100644
--- a/drivers/gpu/drm/arm/malidp_drv.h
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -33,6 +33,7 @@ struct malidp_drm {
 	struct malidp_hw_device *dev;
 	struct drm_crtc crtc;
 	struct drm_writeback_connector mw_connector;
+	struct drm_encoder mw_encoder;
 	wait_queue_head_t wq;
 	struct drm_pending_vblank_event *event;
 	atomic_t config_valid;
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index f8be65119e3b..7f5e25adf999 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -110,6 +110,10 @@ malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 	return &mw_state->base;
 }
 
+static const struct drm_encoder_funcs malidp_mw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
@@ -224,14 +228,27 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	drm_encoder_helper_add(&malidp->mw_encoder,
+			       &malidp_mw_encoder_helper_funcs);
+	malidp->mw_encoder.possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drm_encoder_init(drm, &malidp->mw_encoder,
+			       &malidp_mw_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		kfree(formats);
+		return ret;
+	}
+
+	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
+							&malidp->mw_encoder,
+							&malidp_mw_connector_funcs,
+							formats, n_formats);
 	kfree(formats);
-	if (ret)
+	if (ret) {
+		drm_encoder_cleanup(&malidp->mw_encoder);
 		return ret;
+	}
 
 	return 0;
 }

-- 
2.47.3

