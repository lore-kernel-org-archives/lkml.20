Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357792;
	b=OjPsOJO28OqJnq2xzCLL4h1c6Wi3VVSaDY/uaozBzLqAmP8/hKOCMk8u1x7zk7BpzU0j
	 3H9v31nmlQIia1HQWaPIvVgc4qsP5h9Fg6MJvjYWdA5sCi6z7Gb8KcGO4dSpQxLGdlH/0
	 vmLsVumATGvFQ/yyQ6kPCqvzDv86x2+jPgmLtl47YsLRb//g/PF7gDvWXUlcfoBnT+cAu
	 Hn3dWmkah0Eqncx1h+apJ9p64mBEM1hjV21P0544o7I+tNWAtJQzmMAcjlXA9IgTKUdmS
	 xMmnyBj/Z31dqc+ZvqiApOu7cuQpWDnLOyLLfuSzX8kRob+mAfMJxC8Nap+5ngzz11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
	b=Ry3qLDsnjbeRu3aFXN8R4afLyGA2hHeQQs3jiuO8W9hY4bHK7gHFK+Ah/FV357fUCpuL
	 qiqDGLbXGNihERMWfl3dqvek+lZS3akBnlXdwYizP2eSz2S+QhqS5DkQoPOj7FTO7w2gz
	 x2poxItLqYzdLcgNOolzsS/RQcS/e9xK8heDnGQFVYGsOQePFbCGJWSRzkcfXKlqnlF9m
	 RRHYdBlGZLOaixnk8mzCorAjNUfH2yQs7dwz4TzM0boAGAkpvntP55ZDb5NSYVDnkoXg1
	 V7Dj2gho1re8dHZQM8F51nqZNKaSBdHRDZSvgxy3QVrsVbvws40eRIq5ERMcYHqUhhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzEn3sYX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itzYPyVq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAD606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BzEn3sYX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itzYPyVq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKS9j3060802
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=; b=BzEn3sYXtylI9PAG
	bFLzzWAaxxhD0cV5SmM4T3QaXi/ykeLX+DvlqAZfLceRvCkxwmv/UatR0gyo1G6h
	Ws4E4IZDHKZtEc6xNSi8R3gmGm5UD2BJ8Q7oBXl2lxqSUi+EHDQw09Gakg493buh
	ot5IUIM1sqvIrN2MedGEqS6nSRFwk8KGZJoqwLZ2aVxutTqVC6NOrJ4yRhnIRirX
	6ghyk29JOVn5J/abqQasUDoqktZhRpGzhC5nMSjmOf+H1XOb9hWYlB5DXJT9H7WR
	MC/RzcAN0hRAZcTVKYJq97yIbxGinJpLuA8Erxd3PhTFKkNNR9UIc8A5HupNQL3a
	FvqYUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b312yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e8badc80fso37698986d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357790; x=1794962590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
        b=itzYPyVqghlqPT9U5jX4JkptzGqF0Oj3KLcd6etfSitbNtgmhCC2/r2V0w+tifpabf
         5zh7DD07DO3k5U/5lEd6s4lQvH/1btaaxHMJJmcN/RQcQjl2RqzElHfhOLi4Jz4ZQYvT
         7YjDQ3Vp3JCFABqnr8D5XG1JkeZy/0+w4JhmPtz9fVD+cQHAC4Y/C9xewUsqarF8flgd
         paq+lbAeLYzEP8/zO1sakQSJBTOa7Y/MSAiSe6Gfrm7RhaOPKYSpRH4AURG9ceFeUy0V
         jREYJD7iDSPm0TnzLXZm7VmqvtCfIdc3i1qBlQp3nFkvYfPY3cDMSfvbarUer8y9RCbJ
         wpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357790; x=1794962590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ku/OeLUuwKWykyNmm/Fqp8Hct5JXh1hluRcLpnXu8I=;
        b=MiI0mzy547QZSw6gxusd6j4Ml2ycAZhFWsjkUVnldK3Jpr11OW7vBT7sWoSxfq07U8
         ZFW9bOiyV4AXzVik2qKSfYsoXyhw0wM/GLK+4NZBj8W6ZIY1Zzcc0D9HNP+rKk+/6Jwa
         bv1RvmpiPeWnPkZMZhXrNBl0lr49g/azSjFXfljtqZ8yl7TmVZM5c0JrQUEnOf7Kpls8
         4coo3wxRRDlag3+8Y8lw/xaPbNL7bCjI42KEkcLOwzbE0+JRc6xVdb3tO5VmQaHvXa36
         8GW0UTeRMA194HR4Oet4LP++4OiWwEm10YN5dkHzlShrp3ibAawWTK1KDXagWuwTW1v0
         68qw==
X-Forwarded-Encrypted: i=1; AL+hErEmAOM42D9q8NcDP6AKRVb1516ptNkY6V0huMbHgiGWvBdRSxYaz0EvbrYEH0d3sz5k5Kp/6QD2spQT0mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ErDaMhdc+R29bOOgQ+a532GcH1o/yOtOzK5y5iOghhWELaQRt
	oonMRzYXRpm7bg30Az4OywcjPoIxJTB4ouI/BsuZNibGT0C2DrRSxq7zCaFC9wQJv6YCVU5qhQX
	9vcGv5C2qJRpLLNK8FP/sC0HtTZpKawVGug3EM5SHy7OFtAhu3aUflSMOmEGokox1Y1Y=
X-Gm-Gg: AYBFou1RGGhrP6za2sajxcQYPruaOB204xmvpTzprHEJH1R2BAT5w8IfTvHii0mcPNf
	VKbwCDbZKVtlhKgsvSYP3cLuKbARLrkvO2EC6+jvhAY+jOZA7/AZBQ4ycTJ+LJLSJtsbpS1rZO7
	jEBobawMSArKa1YTGO9MGOcBAcVS75lz9Vq3UOnc5yxd1MTpLvHhHTdG8rQUXAhsmSreV0N+1MY
	MIU/6TB4cvzsYB5OTBJctGBBhq9x/XhY5v74Jcu7/am9Hd0bmDO7TBPzS6l6O+BXR4lnAyF3mqw
	XhUxCOWa5mgF2rz8DdTB67HpApMIl1eJiGCNR/3QtFUclvptVgSmKvFH9LYCz+tuMO2hcfJmMIK
	HIWKHslSwR7cb3NO9X+3FsRu/tFVhYXYlxaBFf2rvYfmxTkVgFLSn7Xq64SvZRMKnhJVaQ1AwAq
	P0tXWNA8oQiofT4/xTgEAGuB0ES2tlqbfadIoiD9Me0gupFRmPTe9kNZdt/MQLiQ==
X-Received: by 2002:a05:6214:ac5:b0:917:9507:79a3 with SMTP id 6a1803df08f44-91f03f95964mr19072606d6.10.1794357790129;
        Tue, 10 Nov 2026 16:43:10 -0800 (PST)
X-Received: by 2002:a05:6214:ac5:b0:917:9507:79a3 with SMTP id 6a1803df08f44-91f03f95964mr19072186d6.10.1794357789523;
        Tue, 10 Nov 2026 16:43:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:31 +0200
Subject: [PATCH v8 02/10] drm/komeda: embed the writeback encoder in
 komeda_wb_connector
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
Message-Id: <20261111-wb-drop-encoder-v8-2-62948ed87d13@oss.qualcomm.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lp5iF1wPYd7ZR8ysGkNPRlB0R91IV/1mJqhjApWljyY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oFQUeoBmtk6hec2D1ovwQhovn+pZClwRUT0
 IfxlZPJrPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6BQAKCRCLPIo+Aiko
 1dkNB/9CDgJcldqxSzpsV7Qc9VqdxHn6PoP3wfLRkab4MtPk941bI7DFn3D03sxocMvsHx8+Oz2
 pfDhhaEqrZIxElUkax9GdttGEs8f2s7gWHfVetlaN6gpr6vcs734kR8w8GAUm5Sf5SSrzNizUKs
 pCh5f4jShzqnWpqtkz+DdtbaZ2idcaLnGij8btMM4FnFQtAlatU/GrtdY3VX6MalndcGPLAEWor
 5ZggC8gfC5UHWafO17BCTkif6J8udp0/F+n0jnyyWDSGm6f8RDH6OKIh0l4/nqAz1rSAdImA1XN
 qrmP4Qo08K0QO+bolao6yC86tSgmQ8VsGH2YHR5mniw3sskt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af3ba1f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=eOsO5XS9GAZRO-ePzeIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXyvAceLF2hwXh
 ZBeJaZr1feJTnwwUujhHh5PdRdI7ahbmTO/V/ZROdZcQ13iBe8JmRiNB5tbep/pSjEmiyDoi0EK
 6vHf/mIFXF6aFSDhfRhVkucPLxnbhLTNXrScUvkEMZQJdF2++eRHc8DguvvMF6BcC3FiCeNpwa0
 5NSRcjn17CvEbvdW5sBx3ksVgFFglhQfscLtB4xtlYKpaebW9DVvL+eB8RqNryo8NiMpblD77fU
 cb9kaBKCJ2RVz8wmtufLvSipyevD2oHkhVlcD1G/AMbOKuPXvZQk8viMr60vYgWExolWWyVoW3T
 HgiwUwvjwLrr7DjvRZWHth69bFw8B5d1RuzzkmD+L57tx0270b/ruojgo+jE5nMiZaY8UlAG/vY
 wLMG5KAVbxPiQ5aQ46rai26Z9D9tsKhh6XcQNMJ5ksWpG5NoyksQ/nV1sWYh7dj6+v0GO3/3TuE
 HK3ts1hJPkAAq0+mugQ==
X-Proofpoint-GUID: J8DoYIKoB2_tzJBPnD1TLASA0wjewazR
X-Proofpoint-ORIG-GUID: J8DoYIKoB2_tzJBPnD1TLASA0wjewazR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX2WGWSSH3Abdi
 rYG5qGIj7QFfUpR+sgPk9q7nky/bSc18PtWUNHq4/SQ49NnsLwlrjUy3B8vy/0i8ZAhZyzFKGuF
 fPxkqhlp5WPDpvFyMBOSMnUWaSC6j3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
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
index f394971c0edb..7b795e1c5705 100644
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
 	.atomic_create_state	= drm_atomic_helper_connector_create_state,
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

