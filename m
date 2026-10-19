Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06364F7986
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415577; cv=none; b=enO8+d0DQ/Uss5fvOFsGMnzwQhanMI1pWbUZCKq/I5O4czdV9bpUWKnCg5S7tF/m5jyCS7e7bdu5XqtSAAAYRZodgJGxv8Njkcqdzin9a16cBILV1qfkxIhVrQ+LVCqnKwtgVvv6Gnrlxqsg210toSKg1wXMmka5CRgglXH7GqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415577; c=relaxed/simple;
	bh=yoSkIFA/58MM7QcrPq40fkDiBp2NEjXgRIdmIQE2B3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNmF61OcDWT5prDaiAnX6Kn/AxEttANuupZzwW0m59a73pxrKHBsPiZKWKE0/9FL+7S30NMbxTs5Dnp1TMJvC+DfifMNZw8+dNFVhy2USIfgn0XIm0VGIXk5oHaUDwJscO5HXhlG4DnBqTzeRmFzIU81MFiXaXbTSOmWV6KwSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDPuHT+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hipOGEMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDPuHT+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hipOGEMW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsS6X2483345
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv1DpaVD55W21YeRiucX6KKpES5QDwe02r37HvJrZ0A=; b=WDPuHT+mfSn5Sngx
	2iRg14GMs9rdABM7Vfw5YVXjv5LGMolAOAf+lIviVap5C7A37xN9J5CTlc1SM/if
	FaNJYvVAG/3uh5BcPEE5BDq2J7svAZ85KMzB1iOuTlEWEi2Hegs4SNUVXlHZJuPR
	LOAOrZVkIziX+l/dgydDBW60KgkVmfYwK9m6EJ4X/hE8jlZV1qLzKnukKEKbVAE6
	K22o68qQcll0Xvypz8WH9PXZoZWId/gJH0C1kKyIUiJD6iTUxalHW/o8d0LefO+B
	9jty82LYtDY2dGDo0rAwsF26EmFbGg8eH7jNn/Zaf56ke9cgxi3qN0nIGVykrYCJ
	vwbS9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg2v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so459952385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415574; x=1793020374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv1DpaVD55W21YeRiucX6KKpES5QDwe02r37HvJrZ0A=;
        b=hipOGEMWp5PsNTdtPILT4XmD3ZDFkRghWf4rKYLATPPOIKdHYwju1pcP52lXGCRe4X
         K7F1ZGYbeXhwDcR+RzpNR/eGUMaOI4x++29lBNCjzAsv0e0ndubxMNaaAw2ZaZ3XC0q3
         2MumSboNdUgVeftb2gAFcp+/r3mamMBvQN6wUsyiQyz+Wl+edRE3jb8n6Ppnhgw3Ypiu
         Ndmd7+WGGGYplfuzwtNYjgJ9LYGeKTWPULV7EtiyH264sIffBHCtNx7u1qDRAh4jRCkc
         cnLr/4jY1Ta4Xh6WP8K9KXmf/reYJzBfP9u9F1Tw9n4tbZNxs8ffvY3oQRAiwzzrQrYa
         GcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415574; x=1793020374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv1DpaVD55W21YeRiucX6KKpES5QDwe02r37HvJrZ0A=;
        b=cBMVb73arsjb9mVhDhbV7u87n2Kqva7DAM4zwxXlc+wFuqUue1YeM8eND4upk3ZUXs
         DCxLhMj9UKqHxFed0QOeBFBDZGHeYvfuJhzNEmPj1Auwubdp40FP72vpsduZbJ2BEuNj
         rZgDL4M4v7UajxONMovR2akjDhrvdwW9WQbvS3NFYgXpo6ayhRfao1E4aS4ii42Mu3G6
         QUC/gnSS3zRySKRMgpXo2SijcrFNrfRwX4KbyvKI0jtzKET8XvuuTEdXWeDGTphiJZbs
         r00v7ytQkhx3YQYkafEcF2AS4Om0BpYlDj1+viIVMVPGezE0BfAjVEcvzXRE9vlQr26x
         CoAg==
X-Forwarded-Encrypted: i=1; AKwUvBycebtLa4fwxt+kM0EB3Rtbbj9xpj0zc+g1nw+GeZcauKZEKh2Q4dokhsF2yiVYsWR8ImDVCh8KbRQAbVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrS6Xsg1pTCJPBCK7Q/N4ZTWemtlCenMJ5AX/tyDYzwwGD8bvi
	TvKsP/a02+2Xt9u6VdpExc5XKOqeFwlLwndsRGKrfIbmhBQWKGuF44yytSp30r9O5XD1ksFBUPI
	Y5VHx/ZXuSxIuu77baZOwe8i+N8WUBiPACjc87F6cjpLddf9WIoQsArH+Yujy2Dz8Igo=
X-Gm-Gg: AYBFou2pC4o8wKGAcC+bwN5LRNhQwaw1aeYC8u7qgVs6kq+w18Vm2HP4OOt9NNIqjVj
	3/1E2uwdS2H20GGgxt30xC5LXoCcCKJEMtvPLe4KQnEzZ+bHAvyiEPFTJEoZuMSjlUqTRi+qf+J
	CzcD3spEu7+kSrrkwrTkL3EifGDJcHydzWhS8HIxO9v8Sk/hlo7sbSf06cTWyrZUj0O2FYtvBr2
	esycFG0xr6T3lBJkJN3P641pQFHMNGPsHGzKZBVNhAg+F4CI0qGBIH5qwWoyGGbh3UueXRAatfS
	nrxlGOTuxR8/emLyT2CO3kDyG00l8iSq8YOyaULQKQJDxfXHWsrYyyMY8neaRE4G//ynUHXSHS9
	u1BHbB2gECo5LWRWTOdXaKG6DCNdf+fu8QZyyOOC8uqX9pP/CdclNPuqErbZVT0QS/wkUKGZqdj
	CCBX180LU3RKh8
X-Received: by 2002:a05:620a:170e:b0:93f:c3d:7bf6 with SMTP id af79cd13be357-93f29b7f416mr1225511385a.6.1792415573910;
        Mon, 19 Oct 2026 06:12:53 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:93f:c3d:7bf6 with SMTP id af79cd13be357-93f29b7f416mr1225504485a.6.1792415573295;
        Mon, 19 Oct 2026 06:12:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:30 +0300
Subject: [PATCH v7 4/9] drm: renesas: rcar-du: embed the writeback encoder
 in rcar_du_crtc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-4-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yoSkIFA/58MM7QcrPq40fkDiBp2NEjXgRIdmIQE2B3s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Y1cRe1yLkT+FxTzvlt19C6osdjIZpv1c80VbV+aV1Mm
 n2/9N9ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEyEt579n0VRsr663b/yBzXN
 s6QzunqStjxXYSg73/d9dtPPJ1erClTdXviIl3/hWjt97kbOQkN1/tpdF1XkK7ewMZr5ftqiXjv
 9c+WB3pXiKRw2Ij8FzjGGHZ56sUTp72P1g4YX2y2+O7zrZ7rJcjCtxfiYEJ/4+5Jg69tdPc6xjR
 VhYrsdJDQ9wn+snXHtZYln4faVd5dfOdY6I+gM28l/pwRDZ1xmErFevJpLVU1Vu4vxyk1Pxh7P6
 5GrPy2su/C9NdOYP/L7L7aJvDqnmVMq2HbJNLt9Cb1YKGC3dL3OsmCj+zLZlwNvXvRoOJ6Yc7VS
 9uy6rCKt/zabK1kXvN2huT3gJYvXQp+WJi7GTQw/k8wA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: uFkKU-9KcZQCLLQMqx_5_OJgyW_wrGEG
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad61756 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_cPotY8_OL_z5XV9VKUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX+NfvisfnnYQ/
 6P0SaoT90OdJcn7O4T823vQ2oaFFvehCm0lAKKPhuogmz7FfC+AI+sOYO1faxw+hD+r7n9rUxvn
 bdPBWMncY2NRouxVDSIOTKp9IW32ZxnQNnpP/HdfBNUC3Ra8UZgyURCjKiFU53Colao+w0U0omv
 9+hUeLp65TsrepVYn5XghxkJylg015M7iSJtXdfwxOSHtXDiNKYjdaQ0vk/lUKJfHlYQkxe0MxV
 jAL8DU86s8KRywSx4p7DZ/aP/T9fWVA5uBKrv8mLJQn9/kLmzuaHdH6MfRAy5NNJ5j92QnMZtqB
 y+mCSyrzaiNfxaxWIamVrShg+ANORaJAtZnGJ9dvq+Ybj1IHIhe3F6BWFKFlDefs3rcmikgNByY
 D5y69Jb5j6mZaW0PF00SbdICav3ZCioqyd4lCG/jrr5eCFO/uE53e7uGTwj0pHxWv3UV0NNOTlX
 29kyCePwOb2Ko6HtgrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX4OZl+/dwDuD0
 9P4L9mC3oRRLS711D7HVLdo5C/MTQesoQIJYsTm+SzV477wN0lQ08IiXBT5x46kuMmg8wsHLA6C
 anJfLh9IbG0kPMSBg4OAIsIG0+YCt4o=
X-Proofpoint-ORIG-GUID: uFkKU-9KcZQCLLQMqx_5_OJgyW_wrGEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |  2 ++
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 29 +++++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index 8857926e109a..d8b1dcab8dea 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -44,6 +44,7 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @encoder: the writeback encoder
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -74,6 +75,7 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+	struct drm_encoder encoder;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index e5e6e6a156aa..b0c1ca0d0dfa 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -174,6 +174,10 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rcar_du_wb_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs rcar_du_wb_enc_helper_funcs = {
 	.atomic_check = rcar_du_wb_enc_atomic_check,
 };
@@ -201,16 +205,29 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder = &rcrtc->encoder;
+	int ret;
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
+	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_wb_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
+							encoder,
+							&rcar_du_wb_conn_funcs,
+							writeback_formats,
+							ARRAY_SIZE(writeback_formats));
+	if (ret)
+		drm_encoder_cleanup(encoder);
+
+	return ret;
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3

