Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132114F96DF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415570; cv=none; b=Hlwgfq2BoCWTktBn85Mh4bEF+iX05QJkk4zju36Jr/ndJRwDXGxj8jvk58cMjVI2AXvIngVtlpJdhS6c0W0PHE8ACn/zCWA+Z5yB/egL1H2SPZtTLHTaXFD6h8/7A+r5ZmbJJpaBug3/bOc+aTwO05hawYbZ6ZG1fQUO+CsNxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415570; c=relaxed/simple;
	bh=NrouW+lVauNgON0jHseun6cAAxKf6ZXGanxiaBIsFlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwx4MIeYbl1P+0enn5+4ouMIQgXBJdpOduPWtLSyIHtS0BHjjRyfYUbpK73C916g6DZJVXTT7Nk6S6Y/W+280HTjTER/zIJJN0L48aTXcKdJKlNU31Bolm8VZ0bpqUn4cM8JRjmwuWgodPTYoPT2DUxEhW2SPl/iRawIfOU7+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyAgfWMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlQBgbih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyAgfWMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlQBgbih"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCC02193374
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=; b=DyAgfWMKSzCiuNiL
	jxBH1qF2fgWAoPvlIHVI2vV+Vwwm/HyIEudioyHkcvJcuRZwTBwQbRb7UsYLHVN0
	3G/O5bym3ff+iN0CVhhlmybGoTxsrTuxJDnE9SCmfZhHOkHfXPTdGXwOznRSTaGo
	eIlv9qbe1EYPb5KSGFRaC6ZpZ+klf2NJKsRE99LmJFSJFuGQjjZWL7n34zSWKhG0
	OlQy8R37oxSW7ofDrE9S9urdhc6LIyw8ND6xY5jBFGy52RWYkHZMuB1XSk7aUezX
	kD2wu3QyLhX4uss495l7K9Om4J7FlgiLph1bBXYetwGlK23oizc6Zmc/tC3IRj4I
	aV8oQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1aua5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5367e512db0so4481971cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415567; x=1793020367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=;
        b=GlQBgbihOK2r2nSU/cnQ7QGDrv3k8WeRQ160RRmuNgGoZHtIEO8yv3mOuV48VGW+7K
         SkGlKaXfnF/mnKhzm5m5PO22Z6zwjrDXIEj6ge7Y4IaKctNN1j6jAhgzm3TsANUzgEF1
         KdSE+sg4B6bgykpi91/hd1eLwA6Eq906n4sVxDtntokCgSJOl4yNhQNRF4iJ+TIn06Xy
         /wSo8PwzG0wkjFkSUCLKVManY+cePImZ1AeXOaMMcy3mJmVJ0/Mb9fs0MIr+j/K5gkfw
         sFEuWfkV+6TyO3tqUQo23zz2RsqxVH92AmD8aYowQpLlhlTbgSyWc2j6DHHkrltqfZdB
         0jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415567; x=1793020367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7nJSSePe19a+M+g6PxMBInmxs8mUq4HTiTkNQcAnA0=;
        b=bp7vhSWJyoKU5u+NwqV7RvM15YJmUNADUO2upQNYqgX7Zmb1HIo+eDb0Wh3cvG2di0
         BiSVLDiKdTkbRl+pNP+EFZNzF29ES3aBX3UR+0C+gG1c9C4uYINI9k/rdyZ6XvJle03J
         ruI1nn1tc1K8zd4IXOBinMQyQc2gTgEPX2fTGj62zXUDKM6WgHJHBdjs/RQmF02EztbH
         U9iRjy8D/gymRhIw9+kCSCprKHsuVVTkm9i1obIJgrvA/GDIojLW9gTZ36ydYDAPlNE9
         79JhOVzn5xaysn/v059rNsAjDVKhdgC0jAOAFb3y4Yk+L7DBDkrwMONcu+tnc1HuOqGv
         JfOw==
X-Forwarded-Encrypted: i=1; AKwUvBzwcn7Z0DHh1d6ZO2fgAeZrUnIsnvGNxoyxA4tpxSsnUjs+Y+FwUN+jhv4Vs2wgTBdZsq5QSYn+zkCJr0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMd8AeR6bX6EtZMUJywVaynFDo7jodmfRJFmudpG4/k8JMZI0r
	xE0s775LCSucUf6IXcN8Xgu2elZ4blV4StZ6GC2Z1DJqo8/Gy4yvKBZW7g904VALpaTgwmP7FWb
	2kAZB3ViwMwhY74vaJWsugRXdpxrVqrcxTJfZ3p/kzA4KKfF7vF0BolW7/gHXstAeFeM=
X-Gm-Gg: AYBFou34zWE7a+CDodzrvupxufUvOEFSvvh1vBLyecHcguOUd2pnS7ISiMguL5qv5+z
	bkKCS3xjyL6MJJuN/QpaEEFzOjCDejEhE/Ft8oMASyqV5o7qCB3GY42IahxC8gal3MKNiYGrfUk
	w4TlqkzUv1/ec1Jq0Qwq8qLjzr8gP1BpwoDtQJFC2QuaMchPJaCdoUizK6EidOQlTzEG6irOrE0
	AhTKqko+LSTmAUlcNyFdxgHwgdrJqiggS49znD0A6MLIROYhM4tYw4mm/3MdHCjMrwmocgt8gL9
	e3ispmeL7SJmgMpcZjr2VKFph5l/xDPHTCUVXwHsWcAvShx+HaFm3jIuzpknwnEDq8I9/koEW6X
	lFUs+tBDggtAI/J+lWydlMwuFuFzdAefvnNkfBN1bjjtvACKUAeW5BHreitOi+e2Pj8vE6j+VzL
	yVW3zJ0DgUjaZV
X-Received: by 2002:a05:620a:a2da:20b0:93f:2571:c317 with SMTP id af79cd13be357-93f2571dc9dmr860034185a.28.1792415567119;
        Mon, 19 Oct 2026 06:12:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a2da:20b0:93f:2571:c317 with SMTP id af79cd13be357-93f2571dc9dmr860029985a.28.1792415566587;
        Mon, 19 Oct 2026 06:12:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:28 +0300
Subject: [PATCH v7 2/9] drm/komeda: embed the writeback encoder in
 komeda_wb_connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-2-d4288a26eb54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrouW+lVauNgON0jHseun6cAAxKf6ZXGanxiaBIsFlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdD1DCtkA+u6NCRZ4TR9cfpMtSBKJoh68S5B
 5WR8CKWtDSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXQwAKCRCLPIo+Aiko
 1fXhB/9ueb/k6E6h5LRWhJ/DwQxRqBdV5htWru57d+0lMYqSjcmijqPs+FZP0q9YXQds03fXB4b
 TfDAdzNVIeBJbUVpEHobAVDjg70zFwtbRgm2XVOUZBwT99umeLuU4Svk18tl90BRqdKmtPnm2y/
 z1HXgJitz8eANW4yE63Z/VCTngNgXcn/HFqj3U7LheWzUKeNZFeYxb4PWsJnM3qCqgLf/IIksTb
 /5SbNXJBEoLb2X4RWfvbSiImpfOkiznb6pfitjNpsQf2QLIzFCkvzWmEKX1d3t8QcrcuyOyWaf1
 CB4Bamk7lyQeGc6kpH/F6WedLX4owP8WHJEzNtDXMS8pPI17
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXzKP0YajTJd8l
 8vPmsyvv9P5yvF+g0lXkHRrkqtdmCYbRIp8qm89WnvPEOJfAGB141NbWmaVlKjEOsY4dstb5O79
 YM9/tzKKcJuKV8RNKLlYfWIUZmrUGc0=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad6174f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eOsO5XS9GAZRO-ePzeIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX/Ef3uP2tuVIY
 a7aHU79wylWTkfGiq3g1s6yABxijzJst28izaaSujolbMcmxse2P6d08ugy5gXTfYMvjFkndZwG
 UnGVxaxg7EWDyHtuh8esWmTQGLwob8ZVqH0Ht02nX45GQoAN9PoT5kwIhHcZYIenSH/N6gjPxBc
 bbnabuO7gHqU+E9bvmgp2cFM1s7eg4AKt9i73TEPppznES/96w38teCUEg3ieLIGA18uqbyFqcB
 pDv13mM7YL3OAG4tIuoIPXXj80GNHrPyk0pFSekwUjlKGiUoerEQkUWgb+ZOpaj4Dzs58za2Hm0
 b5HonHIIcKVqkVEIptzO+r4T3qjSGsjOV+jUFEiAuwGadqehZrH6fw1pNqPZoRfzAA0g/3NFJa3
 Y1PL8joXa8/z3xxCXNc5oU2vz389/mGkH54fJ0fAQljeH8D/EWai4VD5VHyBiHgNInJTrjh0WQq
 t0furkzAjyiW9KfxaEA==
X-Proofpoint-ORIG-GUID: P_U2ijoPYflNH-Z1WmK_2KASA0mRWi5q
X-Proofpoint-GUID: P_U2ijoPYflNH-Z1WmK_2KASA0mRWi5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
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
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |  3 +++
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 28 ++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 83e61c4080c2..4d41681a834b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -56,6 +56,9 @@ struct komeda_wb_connector {
 	/** @base: &drm_writeback_connector */
 	struct drm_writeback_connector base;
 
+	/** @encoder: writeback encoder */
+	struct drm_encoder encoder;
+
 	/** @wb_layer: represents associated writeback pipeline of komeda */
 	struct komeda_layer *wb_layer;
 };
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 4872253a2449..77aecf4d3f09 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -127,6 +127,10 @@ static void komeda_wb_connector_destroy(struct drm_connector *connector)
 	kfree(to_kconn(to_wb_conn(connector)));
 }
 
+static const struct drm_encoder_funcs komeda_wb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
@@ -170,18 +174,28 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
-	komeda_put_fourcc_list(formats);
+	wb_encoder = &kwb_conn->encoder;
+	drm_encoder_helper_add(wb_encoder, &komeda_wb_encoder_helper_funcs);
+	wb_encoder->possible_crtcs = crtc_mask;
+
+	err = drm_encoder_init(&kms->base, wb_encoder, &komeda_wb_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (err) {
+		komeda_put_fourcc_list(formats);
 		kfree(kwb_conn);
 		return err;
 	}
 
-	wb_encoder = &wb_conn->encoder;
+	err = drm_writeback_connector_init_with_encoder(&kms->base, wb_conn,
+							wb_encoder,
+							&komeda_wb_connector_funcs,
+							formats, n_formats);
+	komeda_put_fourcc_list(formats);
+	if (err) {
+		drm_encoder_cleanup(wb_encoder);
+		kfree(kwb_conn);
+		return err;
+	}
 
 	/*
 	 * The writeback connector is associated with a single CRTC. Make its

-- 
2.47.3

