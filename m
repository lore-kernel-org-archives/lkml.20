Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820567;
	b=ffeRXxni6ecdwvdEE94fqLp3E96eKdON7PGlv9TyT+bW+/HRYHXpgQEL4XT/umIq5Iu8
	 Cx2beu1w/Yx7yP3QkjUYwAAJPhIBFSMc3pZyIht+RVU/0om60M3eeZhaGxPi1dQuQSVv/
	 dhJ6H4SyL2gulAncJep/C4Z0mSBAUQP9W+yFNmsZvtsZXkhr18p2tSFxwnkxIVKEMB3BI
	 gZkYD8E7LUeVcas/IA5MjMhlvoPOnWTt6FicpVZYR4jcKT6DCHxMGkZ8j1XNaxWhF9k+n
	 L7VSgcuZxSU0rX9qVhDMb3/U5yA5uyaJoQfZN9+WTzsosFxL1q26OoXaLEEfO4Qrkmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info;
	bh=Ox7jJ6m6wUVAbtViPWC75EXU/gTaFwhfOJNY9ovla80=;
	b=ln9vbx6N2Q95gjcDVvxegMdABFV+YNRFy5PDueZZuhbZwgr7O7BjEcz6Ub4NI8q+8mF3
	 sRZ5VWhQfqmbbEo5jmWKKiak+h84MMPrBaleppvpDgrvN45TsEziCN2bF7AZK0X5ZQIYk
	 9No7GQAUJtp4NfIhrN7DWPx5fYX+6ugbwryLL7rs0O0Dit3WNsxngFj2DbZa3/XPSE4c1
	 W4RWCXRJROmuptbu9T+Rb+mLAnQbz8tSAQU55iyCdWHxJkxIq9MZtcDYfg37Du5Fc2NPN
	 msXola8RI769XX1r1on77POkv8ws3qMfSf8+88nCdomuHBlYEg7a7gnpMZeTDtiwP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=QxvH35yA;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73398606B2C8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73398606B2C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=QxvH35yA
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4IQOqk1937786;
	Wed, 4 Nov 2026 19:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=O
	x7jJ6m6wUVAbtViPWC75EXU/gTaFwhfOJNY9ovla80=; b=QxvH35yAbIOa1fbdy
	+0FifzdC7rXGCUJY+2VjOOp9zzdQBGmXcvoxQf4KZa1kf4kEYGQTWVOADRwXByfh
	ijNRRdfm3Ay7u68AvKC3PufgHw7acoy0NExMTTp6VDNzVXFyH9G1tazwZ2EzA2oi
	TcOf7K9gOpHR9dAXUD8y/J4LruIEW2CIXWbd7zOjsCid1EzCiI16sjcVrvKagDbR
	z2TdRNUCZPozhVpCEOI+Mpdc74JdumQumjmeC3xShvuA6H4WCSQocoSSvakmtu4n
	BBbaLSTRjFciDubrAgY2qwXMGqjYNcg16meDOU0QBK5Jsmp9G1q7TKyrcTLsvubI
	Z1/0A==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99wkp2c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 19:29:07 +0000 (GMT)
Received: from [127.0.1.1] (172.25.6.177) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 19:29:06 +0000
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
Date: Wed, 4 Nov 2026 19:28:16 +0000
Subject: [PATCH 1/2] drm/imagination: switch to inline init of
 rogue_fwif_rta_ctl
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
Message-ID: <20261104-minor-improvements-v1-1-cc976128538e@imgtec.com>
References: <20261104-minor-improvements-v1-0-cc976128538e@imgtec.com>
In-Reply-To: <20261104-minor-improvements-v1-0-cc976128538e@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <frank.binns@imgtec.com>,
        <brajesh.gupta@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793820545; l=1597;
 i=luigi.santivetti@imgtec.com; s=20260707; h=from:subject:message-id;
 bh=XV3qwxszGoFhHeB7dwNd7EMZXr7gJaJcLpdVA4BzkOA=;
 b=CD0as/ULye/K1o0Y9Nx1EiVHed2FJQZlF+ALHkGG15mLmcclQebx3XrObPvMCXJagJgleTlvr
 toLKE/OXJbKBeHx5XgU3GBS3M0Q5ToHqr5gWKLAaaGtGkveonx1EUrl
X-Developer-Key: i=luigi.santivetti@imgtec.com; a=ed25519;
 pk=jS7sCDyWFMopn8iAXVN+AdJi+Z3fZPQKsS5NdQtI+sc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NyBTYWx0ZWRfX3jxMDyuV+Bx1
 LyYeUPonGovuHRluVIUOTvvIxZNEx+/YCAYrEvk3Pjm1Rd3OUMrHgKgz2nZsZ4qFkVi6yrR6EHf
 CojvOzQ0e9+gA4a6Y16Ncpo4L7D/DxFdw9HfM4mk3uHDzVuVWuZ3/KdWen6w3Oc4hU0/8QlobHW
 0A+/zAnDp/CwnFAjf47MzObCR9I+XTEXZhTURUIKO7T1HUngXQEWx66dRmbgdW35r3xUEp1Igs4
 7AdGizQseLJ/44rUVGGegshqNU+LnY0plQepfxUy0Ps8kvsFjnboWe42/znFh2k0wybnMIWKIgO
 GHinGsUBPqs+Vg8xKcxqZfNv+lD5ZJoCUOemSYFaD/9Bt1y4nryJ4iHEQUmFP4vAGAFQS6XF3lF
 ElvAq+i/qZJbGtDzw5ue9H5y69o94kztQA3daDmp9JbYi6scUdj3p9V3rubfD3iHJxCbq9X2QUn
 9ftI6732PBspCb81SNg==
X-Proofpoint-ORIG-GUID: pvIRKTFfdCl2HM9NI0OMtRzRi6HQ4010
X-Proofpoint-GUID: pvIRKTFfdCl2HM9NI0OMtRzRi6HQ4010
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6aeb8783 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=en2ABwrKDVyVSx-lS3UA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NyBTYWx0ZWRfX5NjqUUm9xFQt
 oHWj5eobqA9mFXx4Zbr0/KSPZpvVVRFOI7kma7blcK+vMj+CZb8vQs8AxAU1vmcMYilmZZ+aH8D
 7gcNOdLm8LHOQyrViiAD2fev8PsfMpA=

Rely on implicitly zero-ing all members using designated identifiers.

Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_hwrt.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
index 05c68c78da22..3f7c4346c52c 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.c
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -358,8 +358,8 @@ hwrt_data_init_fw_structure(struct pvr_file *pvr_file,
 			    struct pvr_hwrt_data *hwrt_data)
 {
 	struct drm_pvr_create_hwrt_geom_data_args *geom_data_args = &args->geom_data_args;
+	struct rogue_fwif_rta_ctl *rta_ctl = &hwrt_data->data.rta_ctl;
 	struct pvr_device *pvr_dev = pvr_file->pvr_dev;
-	struct rogue_fwif_rta_ctl *rta_ctl;
 	int err;
 
 	pvr_fw_object_get_fw_addr(hwrt->common_fw_obj,
@@ -378,13 +378,9 @@ hwrt_data_init_fw_structure(struct pvr_file *pvr_file,
 	hwrt_data->data.macrotile_array_dev_addr = rt_data_args->macrotile_array_dev_addr;
 	hwrt_data->data.rgn_header_dev_addr = rt_data_args->region_header_dev_addr;
 
-	rta_ctl = &hwrt_data->data.rta_ctl;
-
-	rta_ctl->render_target_index = 0;
-	rta_ctl->active_render_targets = 0;
-	rta_ctl->valid_render_targets_fw_addr = 0;
-	rta_ctl->rta_num_partial_renders_fw_addr = 0;
-	rta_ctl->max_rts = args->layers;
+	*rta_ctl = (struct rogue_fwif_rta_ctl){
+		.max_rts = args->layers,
+	};
 
 	if (args->layers > 1) {
 		err = pvr_fw_object_create(pvr_dev, args->layers * SRTC_ENTRY_SIZE,

-- 
2.43.0

