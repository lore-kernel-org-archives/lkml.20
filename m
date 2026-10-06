Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A33B9D9D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326549; cv=none; b=m4/rNdXLZe2cyKNUaylK9DcCoBrToYb5q/wQ3DbHBvrjKt7O3VoydHcysjighJAB+6lRn2Kv2MK7uJr2P/ZmjPW4iz2h7VmN4pijndNS6oFC+utFHxaxIG84wg9Y6DDSAje9hIJ96mmG7iqtxNPkfXh1aEYM0OL3zzD0tfK/wvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326549; c=relaxed/simple;
	bh=nq5GQBYmBcJJlF/OscucEwoi8ZcPaQT+jHDtLcec2DE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lkvSfEZC4RgwNpfFEJ6B48pg6SmgNtVPsKVd9oVpX3rTxjX4ltuLoXYjXCXzlx7Go6R9RDLjPkIYXoacYHDD53y8wz9JW02RvnU48WVruY0e7LO5cEZmM3PYt537ESrejfmedsHkfBYCWcU0K0/zCgk7/Xg1zSXMBwIjOWSvzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jly0s1r9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jly0s1r9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Leabq2514102
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2OgK+5VU1xO
	ZNSYWMPQk+XRBlPXCnQKtpW8Z8IQjuNw=; b=jly0s1r9cd3jLFKrTs/c7KVxDli
	jKPs7g428Nkae12op/fl0lRnnjnozCnwQXGH3dbU27kp2pHDJGyPQXbrZQ46Sjjt
	J8TJDTrk5yDRlhVQ1uEWx3NpgYhRBXo369pw/IpIfgSmpRuoyQ+hiK5ekbq+i8Fe
	rfVi1dPpmJUEX8J2ecSfCpS7t63lwU/VsEv9+emhmBZznXu3E1O+qgKtZJ+uWJPV
	YS7HTxl63L4Xi7jr4+bmyBEk9mYNkbeLo0mELzgo3CcrhwfcQSVGc5RdZaX3rnHB
	MgznA/ozwcHU6Rs+NFN+sz4Uwr6TmhKtHO+MwZ5Qk+gw6KxDtB9Ab1aAyFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so793323585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326487; x=1791931287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OgK+5VU1xOZNSYWMPQk+XRBlPXCnQKtpW8Z8IQjuNw=;
        b=D7K1+CCNASi3AMqPrHkYhi1r8uiH/Ef+N3LRqWZQdoLi6vZoans6UNtdo17GRfE3Q2
         15ryaqP+8l0HiVcRkR2uSzNNsAOdmIHKjuEkr+sY+/PmnUT7+fUGxKAGkc06a9YV5ScB
         r/1rsFgDxut7X/gd3XQjg2k1/dEfN+wKUr0XSg1W6MPMqXmjt5yJKrQefv4YYkQm0OHS
         pOPe8fm/HeBYzXH7cSTW+13PWLqaIar1OOFACwGU+VAoQj4Hx9OZzQCM02W954q2hAEi
         DIxLNBgPCGDEAexmnofD7WpyuJRTIoMnGDLSQ5dIFKb8Nrvi5HTu7/CRz5CZz41w5X4J
         okLg==
X-Forwarded-Encrypted: i=1; AKwUvBzRIhd+84yyqDurYqnzCYLrANuoI0Xt6PFTqRa7sLBRp022/UEaPHneuqTgBvutYpUz+dWt/hmpl/hilPg=@vger.kernel.org
X-Gm-Message-State: AFuF++k3vS0kX184UdPRr6jRjHIPrNr33QC1sp8c88aZcS8Doc6Erw2E
	xi+1z9mUT2qCAwq5t8nlomhRU7ViDR7yb/LkqyId8rLIjpiB/JFDxO15LGHpyFGc1Kk8xOecCpx
	MF9ho8z3oP8x5X7Gvba/j+Irg4Prqv4QXRktXkplpSO5MuvHLh2J0f3HcQxB529gjX94=
X-Gm-Gg: AYBFou3a1k8Ldj5bMki0QwhPvt6RDfnzFHGcG/XSoruP8VlYJwuA2nm1CbXJzZdQebf
	4CIQU+wDX/4SFmdlG72uKPlkCoV9eoD/pa9vIii1ojxvN+ElbXOierGYGmnMfINrTmJPn/oxfYN
	RV+lQ2OYN2ru5blpeysQwaCTlA8GjcmW6QSGlDs5POY6r8Zvsi8GMN012c/oAnGIgKJwnywJMZE
	vcBdctreaBoDCqr4+AhTt/pWer+sfdlMYtfwTTrlW40K5IdRySPsufAgEnAWmH9cONFgpGHv8w0
	YRMdlxxYMc7a9adXRLI1tMRt9B6A4RbqM8x84A+mQLdR/cOBISX7oLFcL+o=
X-Received: by 2002:a05:620a:444e:b0:93e:92b8:e373 with SMTP id af79cd13be357-93e9b2e7cf7mr78603885a.4.1791326486850;
        Tue, 06 Oct 2026 15:41:26 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:93e:92b8:e373 with SMTP id af79cd13be357-93e9b2e7cf7mr78596485a.4.1791326486167;
        Tue, 06 Oct 2026 15:41:26 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:25 -0700 (PDT)
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
Subject: [PATCH 31/45] media: qcom: camss: sa8775p: add IFE pad descriptors
Date: Wed,  7 Oct 2026 01:39:39 +0300
Message-Id: <20261006223953.3382273-32-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9fOH8Dn86Ox8
 XDIFLr2wIRGG315jSMQ31zKh38oY2RJ7oPl9RFfaEF6v7lY7kxyA419RIMw3qqCCLMEF9st4cSS
 xtJ7FO77e9M01j89yLXUB0gC07fPPhve0dlAwEVDxJLUucUp3L/tcEiruZPpWLwrUdKsmcrRyLV
 AzM9JRlsibU2olYNlw1c8qXZgkPXhWoAmUq+yibeJ2ZfNl9LvB1FCG19Tx3YxERkjZXVr/q1Rwm
 PfGhz6Y6MEc/411WN8MIOX7YXi1cQPpMBZrFlzHEcmMggZNmaIB8vdh+83IXAjk9aeSNtL0T0dV
 UK3GkUNk7939vH3wy3eZb35ZL84Zcb7d5ike5DgAdoQEDU+o8f4cH8DWzn/F5ThL5ovKw4xHW/G
 dWwD/rdqQUL3sV2uabSMygtr6aS4l6w974w9Wa4g6ltPzMCWe+TTp+THHo4LCap5BdwdRHweOD0
 w8OJbqn2kIBbMmqfVAg==
X-Proofpoint-ORIG-GUID: mA_ACTnijXgGNzrPa2sgFEBWm_xNgasz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3qihTNSeMhYN
 iVPj4kfXJWZSOThsZsMqoqppqa/RQoyubCTTjAjwVUsge/jH8OFyL2M/DW/9k7jW4nH8szII4ap
 tY1QHPeFWOEYPu2cRtQtqJoYU9/IkEI=
X-Proofpoint-GUID: mA_ACTnijXgGNzrPa2sgFEBWm_xNgasz
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac57917 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=WTs1eqox__SFtV2_NwcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the SA8775P full and lite IFE pads and write masters.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-pads.c      | 216 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 2 files changed, 218 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
index 7a4e41c9660b..b1e6204ceb21 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-pads.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -358,3 +358,219 @@ const struct ife_pads_descriptors ife_pads_v20x = {
 	.num_desc = ARRAY_SIZE(ife_pad_desc_v20x),
 	.desc = ife_pad_desc_v20x,
 };
+
+static const struct ife_pad_limits ife_vid_limits_v30x = {
+	.min_width	= 320,
+	.min_height	= 240,
+	.max_width	= 16384,
+	.max_height	= 16384,
+	.max_h_ratio	= 16,
+	.max_v_ratio	= 16,
+};
+
+static const struct ife_pad_limits ife_vid_limits_v41x = {
+	.min_width	= 16,
+	.min_height	= 16,
+	.max_width	= 16384,
+	.max_height	= 16384,
+	.max_h_ratio	= 64,
+	.max_v_ratio	= 64,
+};
+
+static const struct ife_pad_desc ife_lite_pad_desc_v30x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 0 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 2 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi3",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI3,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI3,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 3 },
+	},
+};
+
+const struct ife_pads_descriptors ife_lite_pads_v30x = {
+	.num_desc = ARRAY_SIZE(ife_lite_pad_desc_v30x),
+	.desc = ife_lite_pad_desc_v30x,
+};
+
+static const struct ife_pad_desc ife_pad_desc_v41x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "vid_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_VID_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.num_wms = 2,
+		.wm = { 0, 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "disp_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_DISP_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.num_wms = 2,
+		.wm = { 3, 4 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 16 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 17 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 18 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_params_fmts_v20x),
+			.formats = ife_params_fmts_v20x,
+		},
+		.limits = &ife_meta_limits_v20x,
+		.video_name = "params",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.meta_dataformat = V4L2_META_FMT_QC_IFE_PARAMS,
+		.meta_buffersize = PAGE_ALIGN(v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD)),
+	},
+};
+
+const struct ife_pads_descriptors ife_pads_v41x = {
+	.num_desc = ARRAY_SIZE(ife_pad_desc_v41x),
+	.desc = ife_pad_desc_v41x,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index eff4ab4bd1c9..0ca276203bbb 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -395,6 +395,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     u32 id);
 
 extern const struct ife_pads_descriptors ife_pads_v20x;
+extern const struct ife_pads_descriptors ife_pads_v41x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_top_ops ife_top_v41x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
@@ -402,6 +403,7 @@ extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
+extern const struct ife_pads_descriptors ife_lite_pads_v30x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
 extern const struct ife_hw_top_ops ife_lite_top_30x_ops;
 
-- 
2.34.1

