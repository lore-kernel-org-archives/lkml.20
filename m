Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22D4FD29E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415579; cv=none; b=DJqfU8qxmmo4UTuhRFKxAO8jkkDkvOPee9de4d2vttsGVYLBoG91bPv6k/cVopgWdUcYf/jynuJxYf9soFqT0IjMhaTYDqGfLqAYLYrHmkE3r3yidpKG22X0uCVQZEUonmXFYVDv3zSdLJUJbBqrUuGMG9M68n1UOJlXhMUzrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415579; c=relaxed/simple;
	bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzicv8RwfbwOMnfU0IytgXjz/mCKbPAV8Qd8CXa26Yr2GOQgQd0uUUprt//ZdIkfc6tUeq8KyIkHRREdecPGXkoYUL8FCA7sPS8lwrX+/o7uAYxagZpOZ0VzP5iEG9UjNJu6Czf66t/RXNwiAtp8j+mtFvuKC/zdpRVyxb0/WLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adOHELmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwfVGNWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adOHELmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwfVGNWO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsZsT2483627
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=; b=adOHELmuvYRzRZ9i
	Tw2UQQThdT5kHnHFUtGCbgVNyWMhVfnmuNiOvJ4jfQ7peT3GUgn21K4MdsqlTrK3
	BepVjbg77yFm3daWLGfy8zr9FDr8BqcZRLag4NFlcnzIFPeKBnmncfft8rfmET8y
	tYXrPZs4DwQ0xjeEjcv0Do2ym4GkaN64zeaquqa0EfByTZCeR2KKCZ/VgguS8bXg
	K81jYSSecBPRLKNFb3L6oKMuwZkvmTFEK988wRopCUyOTyMFL9yav6dNlueUZS1T
	4LDtz93jFoQ3KYw1tx5GuIQj2sTEhy1ZW5ZOsFQK7sbyBZambDTBFVqw3M3UoRPg
	kDGU+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg2v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so241103885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415576; x=1793020376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=JwfVGNWOlmqEnAA4W5euuUmfaxTaXt6NOw7OSzDb1Wth28O/1qV29ygbjc4p0dqEBC
         6U7rhXDc+mffCL40pMQcCvPf2LLe61wctkU5SbmlG4XAOwdORQ2oz29MEgm/VM2hAAV+
         Jglm6Vf1GR9UVrTCLZyE7WSQ5gza8fBByh83n3dza1TTM7MH170pplsHMZYY76+0lGqn
         uqa7RJooxlZEaExkvGnqxs74FbkvGXq0eLY7LaV++xTK3utSiMESLRWTBmxGlc1CQP8w
         g63MmOeo1gx9fE5550E+oB8xqHIlihtrahp5c4X79rzmr/pz7kIKoGFOfYDFBwe8dr3l
         FnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415576; x=1793020376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=AfAfd46rVViIPA0/wRVXCvnQdBaW06r19EAqu1dTGiuF0GNt3xJgtSSoZ2sBAmZovt
         IthWIJlgsRwQHWCLlv75kxCd7Be/4DQ1WwqRe/dCghRu9bq9cSY3eHxXYNETGZpbwoPQ
         PFNfg07JhcEhR8OTt2hmGeh3WZ0Mfzdns7eTQ02RAFhrvnlmbcO67NbQhMME8WoKszQl
         I7HT2GIqpJ+RJpGMPeaX6tVwECz8OCJt3QlCIlJ4VRLRcdYGN9ASgPLLlWRdKsl55x4h
         ouiPPzWB/jWmVOpQDRPdku3IWiT/gQTeWHkwaRPiStQyo07X40o0RqN4fsIDxbpnk9ui
         wH5g==
X-Forwarded-Encrypted: i=1; AKwUvBzPsFcZfIEQjYooiNQYKIhRDQlW/4EtniT8yXNwGkiNMY86b429p5gTnaCoMfpVmlucRXkiu90hTK3PVRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUBirrK3nxi5fHEk599k6DlyvNErsGI1pOEt7m2paOCH/L23fS
	swJ4LumQ/IW2XcII6MH0ZQLk+hOR01bHJ+HbsPYeUwL4Bws7A/cZGw6NpdQ0epnV/SU/9tmvLv/
	vzCI9vOSd8Yh2iSESENkvvSI9QXUq352KepBARCradsstTtsS0ma53uuiIbUubYdMLdY=
X-Gm-Gg: AYBFou3Pmte1Vb43W1T3vX0sCywvZW9YZGrlJnn4MQuhqMEdR31h+f92lhPwmXtQHFg
	P/62E3+REmbsykeaFcZ8HoDyKGXIHjVv5i/aqpOKDWbKMKLM51Sy6tTL6FF/Z6JOfXkOIN7gMib
	MTvLkzGQlpt/IcHLvSMfUvUvAQRW5S373ciAMaY0Bz8Y4PFFSKEndldy6g+H9t5y+SLhoJJADxD
	xgnDvA979HN6GFEJjJzS94u65gG+LiXjRXhmYRPMj4bk32YoXJ3uWTh60BjH7z8fQqzrkNMeKak
	dXdddshpHGP1nJcKHFp9k0zJ3NUdsjWzO6q+mzZ+miUdGdZlvj26DlheGYPwCYeLUDOtcdnpunY
	d9wnlAUeKWuin3j3WvrKVs48HF2oGYbvIsfQNeVvgYo36J+kmvTitfE/DIfQsNiqsEbsL5+rgMO
	jqPMIVjwegsNLm
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1348471385a.26.1792415576332;
        Mon, 19 Oct 2026 06:12:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f29cc7983mr1348462685a.26.1792415575701;
        Mon, 19 Oct 2026 06:12:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:31 +0300
Subject: [PATCH v7 5/9] drm: writeback: drop excess connector
 initialization functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-5-d4288a26eb54@oss.qualcomm.com>
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdFkCB1I0mJpJakqeGM2PCp6MQe20cpN/1ZI
 prHiqRY8pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRQAKCRCLPIo+Aiko
 1X76B/9WHBADywt3zJKdEWe7Q+mdyQgpR3U2HGDdQp2sC3yDHaRZpQy6ejouNHEitQaWAuJNEz5
 bYlUPNFzeRIBEoagUceaCcfEdBCvPHTQ2PM+RkP16t4MoWeRvERwOQNtnO/Q15L6q0rDM1POQOV
 hmM7RVVECywRMAqjvoXw6E2QCgpuYzqXuwJU9u81hSfHu9YlYDNWQPaGMf4OUtLEubJXz1/86FK
 d2J0f93x7H6R9hC4NLoAaJHlchceIMBtnt1mkwv+r19tIJ9IMIT90Na9bkYs/+Fbu7uiKsNXjxH
 Z7xZf2tg7P+QtxspdCaNbMEucndaLXupgnlsnXEy8+PyZr8Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wjJNutKMVJZXQ8X1ikA0S7bFevoG7ldE
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad61759 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX/++KxsFSyJg7
 fKOYFiQ6WDVyA8p1QmMN5yKzBTwzBz1X2pSk7rq8c5jXXJ0oVocJceJTsrgZCXQ1xq+cruId+lJ
 WmG2uRWGexkcxQoktz8QeT97tMgK5ZbeQa3YFIPoSjDGYlaIptQEvt7F+0PvF+QbBJygW0CxVpu
 +3XF6/SERRQJlBnx9PLOTPeaStpIzWrmFzu29roTDIRwIi6Cp8BZr6VToqr6itCssFKzSKr8RoZ
 1DI7AvUmzJ06xYvujI9wxju8kY/ew25sZbXAqfFzgyVlrNhk0QSz8GxXyW7k0c9neFvrAa010TV
 CPtcK7yIAG7T3wd1PemIceqLzKXT6awZKB4DH6VeNpGTGQbQQbn5zMqPYq08ZxUeEeMvL12FwSd
 mHrZWIjTXbZIT9tVCGibFPCu5CziYSUp4+pCuV/FTuuyaA+DK4MnObMca2xE14cq6dLK659sScU
 nPJw43/+lXhXPJXJB6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX0jSZ6UUocf06
 WAHwJS0Rbk3tBnaluIBOcosd9UdrpE9JpsyWQlJASw2Vm9vmUhlyMKhPYc6isvcg0xPpu89MWG2
 Kx96t2Jejjckh4ZhBfwkBpWew4w06k0=
X-Proofpoint-ORIG-GUID: wjJNutKMVJZXQ8X1ikA0S7bFevoG7ldE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

Now as all drivers have been converted to
drm_writeback_connector_init_with_encoder(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index b4a002e6d043..683da368e339 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -148,61 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..879ca103320c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.47.3

