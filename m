Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140033BFE34
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326515; cv=none; b=Nuzxpj6P0mk9M3BrJ4r4b6yKHD9PbaqwR6MzXbRC7oHjPbvwvItSplBeooRjuGob6H6yZKNBY8KZvJ99ommK58W42cawnHFn+U/IhNscqBu7pyBBDlfRq8AKfDGIhXO0c0/D8caoxU05AQ7fd/3Z7bsqnc7QKaiOTAQtcWLiLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326515; c=relaxed/simple;
	bh=ncztrglIeJ+FBFPARy2OWQPDE/c54qlVIzwutjSZYNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MzWgMsLfycPuTvotsYLH3LEomAeqprLlle1tKRiX1K0gppFsMzMHHuYOjvCucnWJCOanans4dC3WQVuxIjx4z9zLc0bmad5U5Me3ODkn6C08ZSlAS1nNAoZMYtDNbKaVY9j9CKdkCxPqS1krzygeFiaqnkBlJBJJV+SIOfD/KyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHJwpdja reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHJwpdja"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeH0Y1029190
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VWJeGiUQif6
	XovHMmELTcKwm1kNiECWlB8wzymJNLJI=; b=eHJwpdjaEjAcdYe3jbvygT8k/G7
	0ZUToWk//r+ElfJ9Bn3w/fPMwe8VyPrVKQOdBBz9k7LPj/Zohc7k6Lupj0heXP8M
	KTKV1F2CNpQ32bdHAmJsft3Mk2lhBA+KjTYkrqRYkc55ZOzWhbLGUTNRGPyXlxdC
	IwEIXmR7+SrpJb+Og7c7xVX1B5GugBLYQQutSfhv1Oggv2b69c7MaYSql7faDL2/
	gq8nxfZ+M9hoUmfFZ16TivAL3Cs4aLfllVuaJ08nKKptageYiivg9qPK0kjSckKA
	qpdhI5TbzPSttygd6+QyeMTzeZNhhbZA7C58glzU1mTZ5HJ3ZmEQpFZfIWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so602689685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326468; x=1791931268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJeGiUQif6XovHMmELTcKwm1kNiECWlB8wzymJNLJI=;
        b=A5pJCGsgwjL79opuwp6DR07FB9utu81YVE/aeaYJRm1sbJMGAg5xjwrqH+f2Wslha1
         8VE8aI5BxWS6azFxZBI4ZpqqBD3eG1ovB6A4W1h/9PAlUvKEhSzW5Byy/z45A6qpy/Yd
         klbBV4pSOxH5pFS1ejqMQq5cgZ4sRJgB8FM65+vDkiise0zvBfxQW1pIGUOjsZ4YUgPa
         u2FQHJz3NDARRniIyIncl4+Njf8zODTVjt5/mlgYFsaVtaBs7Hy2y/rbwsRU7INhX4Iw
         tE9VsJ9aLGqGVq1PmJ0NRTMRouqcme2W2Uactp30d/bR+Il7d6GfyCRjC7rCG9nxY6fX
         DqKw==
X-Forwarded-Encrypted: i=1; AKwUvBw0vqIhFi4+bO/twcY+5rOabsRV8BPfoDl1tMGLV1eHSoSVhwagUjaaYN90NcbuIh7+YPSPmRuwj86CM9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kPhzg7yJU/w9OEYbKkeIj2A9ZHln8i2Q31VbCB/1bz9jcCLanu
	hfazfVoRIvxzOOEibpopc/O/c+Fpf8Fy9DeO9un/rbKk6QrQNtJtplJFbmIZv2eWzJmw6tAX2UU
	/SGNdLO36o9m5xTiQs+kDi9DjcWk8MjvNmmUm2NCCgPOSYLbeXLJb3P1DxK/nue4fdl4=
X-Gm-Gg: AYBFou09UDklvP7+BXKPZhFYaFBd14eUtJl/ioFqml2ekW6H7DSvf8AHfc1o8GDMKtb
	u4w+vq6YmBgTde4FsLMTHCw/On8bGKyi8PdodJmyMCjKX7kej5W8ac6uNILcQAFA/dbv0kQ6WxL
	t20DPthMMyENeJ7PEPLpHsLpPRJrLHrEKOZ6NR/OErtt0r/iHoYYQQw6/bS13Mohl5biiz4cK8p
	UKXIuRUPAVpVjBjNOhTjcG2DSKAY0HNLSXid9WkHYe5Bn0TrTdk2LqkY2OGe+0HG2wHDQyTQ4I2
	htQG2cn/Sd4pf/c/QC+rbOx4reuvSlRZzDF1KNRq9H4wS2k7/un04Kd547Q=
X-Received: by 2002:a05:620a:1729:b0:930:f337:ebeb with SMTP id af79cd13be357-93e9b2e9672mr84160285a.12.1791326467444;
        Tue, 06 Oct 2026 15:41:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:930:f337:ebeb with SMTP id af79cd13be357-93e9b2e9672mr84153885a.12.1791326466916;
        Tue, 06 Oct 2026 15:41:06 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:06 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 22/45] media: qcom: camss: add IFE statistics output
Date: Wed,  7 Oct 2026 01:39:30 +0300
Message-Id: <20261006223953.3382273-23-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MlzIrDDiOUQoUc3ibmv_M_w8aCC6clq5
X-Proofpoint-GUID: MlzIrDDiOUQoUc3ibmv_M_w8aCC6clq5
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac57904 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=JK_Li5-1ZNDrFKk9jnYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+mY2UQeGrJiH
 YC7hDNcZYUZXjnJZ2A+42PfOWGAdusuGr6zj4llpqPXh6AInREpVQvdpR2p6NagnpNMX6JQasWJ
 m+QqNH+TwIi2S+LJzEuCUzqLLJMjRL1T8Ps/aF9YfCikdYNeag9btmFi3zHCcpOLnKRhhzPdkvu
 hL9OwyCmhtpVMhfrBuhKxg0uael/nxVnwJ4F6vtylClAmN6hM1HsokZYSkmALxDYzHYPnMJNGzn
 /5L4W/nXkqXPXBFzSebXDPn4hThrG+IU3RP5/Kn5VlFd5zPbSL7kbVx+zDx4FpowzcIA0vA58No
 hvSwviuYEMMZcl5/fKB1XNtMugNIdMvc3PCLRbll2f/Q3FBllYqMGXHja7M2cTu8XTGUKRJjNRr
 q5RrL9uMAx2i/lCny17cAg0gsztHVP9tiHt85/QRqaMM14zLMgT8BnZkDQdLmi+ZU6nLfUF63tx
 D/Jx0nwYTPAeYMSZEQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/elppbY8JGM2
 gi0Fx+JRn/kVikeLKYj4qzZM/+Eo/79I0gvP6pOOG4BM/KBkCov50sKIqasL8kMNcak3t6vtGDo
 0sgXzvZhKwiSxQAPwQH154MycbOc+iw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add metadata capture support to CAMSS video nodes.
Expose the SM8250 IFE statistics output through write master 15.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-pads.c      |  34 +++++
 drivers/media/platform/qcom/camss/camss-ife.c |  44 ++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   3 +
 .../media/platform/qcom/camss/camss-video.c   | 141 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-video.h   |   2 +
 5 files changed, 224 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
index 926ba96a7603..bd9ac1a91d73 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-pads.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Qualcomm Technologies, Inc.
  */
 
+#include <linux/qcom-camss-stats.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-mediabus.h>
 
@@ -63,6 +64,11 @@ static const struct camss_format_info ife_vid_pix_fmts_v20x[] = {
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
 };
 
+static const struct camss_format_info ife_stats_fmts_v20x[] = {
+	{ MEDIA_BUS_FMT_METADATA_FIXED, 8, V4L2_META_FMT_QC_IFE_STAT_3A, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+};
+
 static const struct ife_pad_limits ife_vid_limits_v20x = {
 	.min_width	= 320,
 	.min_height	= 240,
@@ -72,6 +78,13 @@ static const struct ife_pad_limits ife_vid_limits_v20x = {
 	.max_v_ratio	= 16,
 };
 
+static const struct ife_pad_limits ife_meta_limits_v20x = {
+	.min_width	= 16,
+	.min_height	= 16,
+	.max_width	= 16,
+	.max_height	= 16,
+};
+
 static const struct ife_pad_limits ife_fd_limits = {
 	.min_width	= 320,
 	.min_height	= 240,
@@ -293,6 +306,27 @@ static const struct ife_pad_desc ife_pad_desc_v20x[] = {
 		.wm[0] = 8,
 		.wm[1] = 9,
 	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_stats_fmts_v20x),
+			.formats = ife_stats_fmts_v20x,
+		},
+		.limits = &ife_meta_limits_v20x,
+		.video_name = "stats",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.meta_dataformat = V4L2_META_FMT_QC_IFE_STAT_3A,
+		.meta_buffersize = PAGE_ALIGN(sizeof(struct camss_ife_stats)),
+		.output = CAMSS_IFE_OUTPUT_STATS,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0xa,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(6),
+		.comp_group_mask = BIT(12),
+		.num_wms = 1,
+		.wm[0] = 15,
+	},
 };
 
 const struct ife_pads_descriptors ife_lite_pads_v20x = {
diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index cf1474e5bce4..f7ec86fb7f02 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -66,6 +66,11 @@ static bool is_stats_type(const struct ife_pad_desc *pad)
 	return pad->buf_type == V4L2_BUF_TYPE_META_CAPTURE;
 }
 
+static bool is_ife_video_stats(const struct camss_video *video)
+{
+	return video->type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
 static bool is_meta_type(const struct ife_pad_desc *pad)
 {
 	return is_stats_type(pad);
@@ -467,6 +472,17 @@ static int ife_setup_vid_full(struct ife_video_pad *vid_pad,
 	u8 depth = 0;
 	int ret;
 
+	if (is_ife_video_stats(&vid_pad->video)) {
+		wm_cfg[Y_PLANE].mode_config = dsc->mode_config;
+		wm_cfg[Y_PLANE].packing_fmt = dsc->packing_fmt;
+		wm_cfg[Y_PLANE].width = 0;
+		wm_cfg[Y_PLANE].lines = 0;
+		wm_cfg[Y_PLANE].bytes = 1;
+		wm_cfg[Y_PLANE].stride = 1;
+
+		return 0;
+	}
+
 	wm_cfg[Y_PLANE].mode_config = dsc->mode_config;
 	wm_cfg[Y_PLANE].packing_fmt = dsc->packing_fmt;
 	wm_cfg[C_PLANE].mode_config = dsc->mode_config;
@@ -782,6 +798,9 @@ static int ife_pad_try_format(struct ife_device *ife, const struct ife_pad_desc
 	u32 in_height;
 	u32 in_width;
 
+	if (is_meta_type(desc))
+		return -ENOTTY;
+
 	for (i = 0; i < sup_fmts->nformats; i++)
 		if (fmt->code == sup_fmts->formats[i].code)
 			break;
@@ -841,6 +860,11 @@ static int ife_pad_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *sta
 
 	pad = &ife->pads[sd_fmt->pad];
 
+	if (is_meta_type(pad->desc)) {
+		sd_fmt->format = pad->fmt;
+		return 0;
+	}
+
 	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		ife_pad_try_format(ife, pad->desc, &sd_fmt->format);
 	} else {
@@ -884,6 +908,9 @@ static void ife_update_src_pads_fmt(struct ife_device *ife, struct v4l2_mbus_fra
 
 		fi = ife_pad_try_format(ife, pad->desc, &new_fmt);
 
+		if (vpad && is_ife_video_stats(&vpad->video))
+			vpad = NULL;
+
 		if (vpad) {
 			struct v4l2_pix_format_mplane *pix_mp = &vpad->video.active_fmt.fmt.pix_mp;
 			const struct camss_format_info *info = &pad->desc->sup_fmts.formats[fi];
@@ -913,6 +940,11 @@ static int ife_pad_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *sta
 
 	pad = &ife->pads[sd_fmt->pad];
 
+	if (is_meta_type(pad->desc)) {
+		sd_fmt->format = pad->fmt;
+		return 0;
+	}
+
 	ife_pad_try_format(ife, pad->desc, &sd_fmt->format);
 
 	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
@@ -959,6 +991,9 @@ static int ife_pad_mbus_enum_code(struct v4l2_subdev *sd, struct v4l2_subdev_sta
 
 	pad = &ife->pads[code->pad];
 
+	if (is_stats_type(pad->desc))
+		return -ENOTTY;
+
 	if (pad->desc->pad_flags == MEDIA_PAD_FL_SINK ||
 	    pad->desc->hw_pipe == CAMSS_IFE_HW_PIPE_PP) {
 		if (code->index >= pad->desc->sup_fmts.nformats)
@@ -994,6 +1029,13 @@ static int ife_pad_enum_framesizes(struct v4l2_subdev *sd, struct v4l2_subdev_st
 
 	pad = &ife->pads[fse->pad];
 
+	if (is_meta_type(pad->desc)) {
+		if (is_stats_type(pad->desc))
+			return -ENOTTY;
+
+		return -EINVAL;
+	}
+
 	for (i = 0; i < pad->desc->sup_fmts.nformats; i++) {
 		if (pad->desc->sup_fmts.formats[i].code == fse->code)
 			break;
@@ -1517,6 +1559,8 @@ int ife_register_entities(struct ife_device *ife, struct v4l2_device *v4l2_dev)
 			pad->vid_pad->video.formats	= dsc->sup_fmts.formats;
 			pad->vid_pad->video.type	= dsc->buf_type;
 			pad->vid_pad->video.ops		= &camss_video_ops;
+			pad->vid_pad->video.meta_dataformat = dsc->meta_dataformat;
+			pad->vid_pad->video.meta_buffersize = dsc->meta_buffersize;
 			pad->vid_pad->video.bpl_alignment = 16;
 
 			if (dsc->mode_config == BUSWR_CLIENT_CFG_MODE_LINE_BASED)
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 45fce7e33c4a..168d26d0664b 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -45,6 +45,7 @@ enum camss_ife_output {
 	CAMSS_IFE_OUTPUT_VID_FULL,
 	CAMSS_IFE_OUTPUT_DISP_FULL,
 	CAMSS_IFE_OUTPUT_FD,
+	CAMSS_IFE_OUTPUT_STATS,
 };
 
 enum camss_ife_hw_pipe {
@@ -275,6 +276,8 @@ struct ife_pad_desc {
 	u32 link_flags;
 
 	enum v4l2_buf_type buf_type;
+	u32 meta_dataformat;
+	u32 meta_buffersize;
 	enum camss_ife_output output;
 	u32 hw_pipe;
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cb9e08e9ff7e..b5d78f84d6a1 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -216,6 +216,9 @@ static int video_check_format(struct camss_video *video)
 	struct v4l2_pix_format_mplane *sd_pix = &format.fmt.pix_mp;
 	int ret;
 
+	if (video->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return 0;
+
 	sd_pix->pixelformat = pix->pixelformat;
 	ret = video_get_subdev_format(video, &format);
 	if (ret < 0)
@@ -421,6 +424,73 @@ static const struct vb2_ops msm_video_vb2_q_ops = {
 	.unprepare_streaming = video_unprepare_streaming,
 };
 
+static int meta_queue_setup(struct vb2_queue *q,
+			    unsigned int *num_buffers, unsigned int *num_planes,
+			    unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct camss_video *video = vb2_get_drv_priv(q);
+	u32 buffersize = video->active_fmt.fmt.meta.buffersize;
+
+	if (*num_planes) {
+		if (*num_planes != 1 || sizes[0] < buffersize)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	*num_planes		= 1;
+	sizes[0]		= buffersize;
+	q->min_queued_buffers	= 1;
+
+	return 0;
+}
+
+static int meta_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct camss_buffer *buffer = container_of(vbuf, struct camss_buffer, vb);
+	struct sg_table *sgt;
+
+	sgt = vb2_dma_sg_plane_desc(vb, 0);
+	if (!sgt)
+		return -EFAULT;
+
+	buffer->addr[0] = sg_dma_address(sgt->sgl);
+
+	return 0;
+}
+
+static int meta_buf_prepare(struct vb2_buffer *vb)
+{
+	struct camss_video *video = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (vbuf->field == V4L2_FIELD_ANY)
+		vbuf->field = V4L2_FIELD_NONE;
+	if (vbuf->field != V4L2_FIELD_NONE) {
+		dev_err(video->camss->dev, "%s field isn't supported\n", __func__);
+		return -EINVAL;
+	}
+
+	if (vb2_plane_size(vb, 0) < video->active_fmt.fmt.meta.buffersize)
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, video->active_fmt.fmt.meta.buffersize);
+
+	return 0;
+}
+
+static const struct vb2_ops msm_meta_vb2_q_ops = {
+	.queue_setup     = meta_queue_setup,
+	.buf_init        = meta_buf_init,
+	.buf_prepare     = meta_buf_prepare,
+	.buf_queue       = video_buf_queue,
+	.prepare_streaming = video_prepare_streaming,
+	.start_streaming = video_start_streaming,
+	.stop_streaming  = video_stop_streaming,
+	.unprepare_streaming = video_unprepare_streaming,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 ioctls
  */
@@ -693,6 +763,52 @@ static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
 	.vidioc_s_input			= video_s_input,
 };
 
+static int meta_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct camss_video *video = video_drvdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	memset(meta, 0, sizeof(*meta));
+	meta->dataformat = video->active_fmt.fmt.meta.dataformat;
+	meta->buffersize = video->active_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static int meta_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct camss_video *video = video_drvdata(file);
+
+	if (f->index)
+		return -EINVAL;
+
+	memset(&f->reserved, 0, sizeof(f->reserved));
+
+	f->pixelformat = video->active_fmt.fmt.meta.dataformat;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops msm_meta_ioctl_ops = {
+	.vidioc_querycap		= video_querycap,
+	.vidioc_enum_fmt_meta_cap	= meta_enum_fmt,
+	.vidioc_g_fmt_meta_cap		= meta_try_fmt,
+	.vidioc_s_fmt_meta_cap		= meta_try_fmt,
+	.vidioc_try_fmt_meta_cap	= meta_try_fmt,
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
 /* -----------------------------------------------------------------------------
  * V4L2 file operations
  */
@@ -744,6 +860,18 @@ static int msm_video_init_format(struct camss_video *video)
 		},
 	};
 
+	if (video->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (!video->meta_dataformat || !video->meta_buffersize)
+			return -EINVAL;
+
+		format.type = video->type;
+		format.fmt.meta.dataformat = video->meta_dataformat;
+		format.fmt.meta.buffersize = video->meta_buffersize;
+		video->active_fmt = format;
+
+		return 0;
+	}
+
 	ret = __video_try_fmt(video, &format);
 	if (ret < 0)
 		return ret;
@@ -787,6 +915,14 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->buf_struct_size = sizeof(struct camss_buffer);
 	q->dev = video->camss->dev;
 	q->lock = &video->q_lock;
+
+	if (video->type == V4L2_BUF_TYPE_META_CAPTURE) {
+		q->ops = &msm_meta_vb2_q_ops;
+		q->io_modes = VB2_DMABUF | VB2_MMAP;
+	} else if (video->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		dev_err(v4l2_dev->dev, "Invalid format type\n");
+		goto error_vb2_init;
+	}
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init vb2 queue: %d\n", ret);
@@ -813,6 +949,11 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
 			  | V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
 	vdev->ioctl_ops = &msm_vid_ioctl_ops;
+	if (video->type == V4L2_BUF_TYPE_META_CAPTURE) {
+		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_IO_MC;
+		vdev->ioctl_ops = &msm_meta_ioctl_ops;
+	}
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index f62a72c29a5a..cfee619973ef 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -48,6 +48,8 @@ struct camss_video {
 	struct mutex q_lock;
 	unsigned int bpl_alignment;
 	unsigned int line_based;
+	u32 meta_dataformat;
+	u32 meta_buffersize;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
 };
-- 
2.34.1

