Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4DC48EC7C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363793; cv=none; b=OSZq5Wovxar98tRTIWHyvOuJPRsElexfJobPlH5cDjQDu4TlN+O6MFeaTA4W7v4eZ341p00LDqThW6G0kLpdQSKMVyBxCgqnWFRDRAdgb7dl/FlWRSIV0/BKeMl9+PTPiddTB0v+LZMK4VoFsHoda2n2T7sfNrTPseoZkD0aD3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363793; c=relaxed/simple;
	bh=ZUVTz6m2+2Z6BpOIDTVZqF9fcWRuDIoNpPTa8kOmwmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLH/HBt/Z91yJFseyCKMu8otiEMHBORlibJYlEFNJ20Cf86cB2uvzceF0XQbB5SxtnkXy281Tck5sYzbydN5ou4V3jb6EVYSXBM/4WPusrR79ZcyY1NSVfS097ShHM0ybdX5nBz9J6CDPHMCfvm7etXrr9yTp+zNSnUvRCb9iXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2OaE5ZD reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2OaE5ZD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeUe3334690
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wGYP5ZQOjsY
	v34Z2mCfZpsfkTB+QYslusCLdJdTeCIs=; b=H2OaE5ZDqMngsomo8wTKHxs0uw2
	aIZDrMFFdWBV74sUtRRzWGSGT5Vuzu+58GSc3JXIqi7h15PXtKe1aORBChBbEo0k
	jzxwO/tekjXdJRmVm+4OrNC9j1ajOKq0Xzxl3+COMq/J+9yfROKWtYvSe8pNfdjX
	yTvdXWVtA2IY8n0rORs8l23Mf/uVoDsYymVBWDQD15NCboPC44dhU0RzJP3yfBJt
	i3//SgPUzVs8nyBS/T+cN7Hwxw5hkqiYDbymAAZNaWzj4Ul+IPqH7+5TKVQ7PGKt
	O6FoDklA6Wq8syuy4kfztwvK+DbIsbkr6tHECaXi9PSyYjwXt6uxsZz27og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623ax2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbacbb996so615632985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363751; x=1791968551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGYP5ZQOjsYv34Z2mCfZpsfkTB+QYslusCLdJdTeCIs=;
        b=VBu5uoZhBjeqaKkeDo24lBlFoXKusRV1WkuO3oel6KDRrw/vNX1NSgUej3Z+U1S3Ka
         vgQwTJIqCEvMzJVuOnM2p79j32tDHhMrOlgy7+Ti8L6x0dI28oU3zYdAtWEDrFhCshek
         8FNA0sTcBvqFNEaT/EeU/2GW6a3IKTt6KqEXzeeEqfltGe+cTRiWlkV4Aczg5PZfvqxb
         WmG0/CXb36FM3J2zIb1VnlGELY2SrE0Ubo+WmVDiOFNj6BPF5n4Zjvg6uB4AcEPE18tk
         IDYupZ27FDW3ubN19kRyInQR69cAhRB0bUIeldUp/bgPoNoXjaAJ2yaXLAZ1W27SWLvm
         qW6A==
X-Forwarded-Encrypted: i=1; AKwUvBz1Oj4BbyRU/MVA736MLWVSPA4Y1HIsCoMKXONeB5WMxZHFbedfsNmUX6LDoU5E+yN9wnOyRhsfuV962Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++nEXsIQd/8JJ13dz0PzDj5Iv/biIPWsbcHzv+tas2V/3++J06Z6
	PYQu9Hj9bsxZ0Gdtm+ADdzOghRKkjJY9IgVPNlZLYIchrClKBBaVFaKqd0fn+pf3O3S3lqAtk9D
	8vY/lVSvPYWGrM+cjzX0a9j5bw5uzyYznZJNFLyp4jliHdAEoTaNAx5vxiTYRaZsneSE=
X-Gm-Gg: AYBFou0fITNN+YHh3evKmilkZwsa8+b7wkPFUA/p4fR3kERLCVjrYt92tEUgNO9VmHw
	pyhXxLcZ154kqLPFd+D/i7ornDtNAErHVYyweEP5+5DTNtUsdfhZAlasFuZq3Grzms16NXj6xop
	Ap00VmtH2bGacJCZwvYhCw3zi/LUWpkobirwOvNjver4M5rlVePz98WUBBJN0fsMA0ANcDvoalY
	FtHj6XBkeWVZsQbrCM+zi8RFiFUTrnOL48K49Nx17/mVPo5yj14p75EmcZ3hZCZaw78d0ZX/2Nn
	R91Koc4oSXQUUfKLNZmx1zu3AEXkrhSRABaQj92Qt4+IKHcIskYMAl4s5GU=
X-Received: by 2002:a05:620a:19a1:b0:93e:980a:2ff1 with SMTP id af79cd13be357-93e9b802152mr292151185a.69.1791363751151;
        Wed, 07 Oct 2026 02:02:31 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:93e:980a:2ff1 with SMTP id af79cd13be357-93e9b802152mr292146985a.69.1791363750621;
        Wed, 07 Oct 2026 02:02:30 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:29 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 30/45] media: qcom: camss: sa8775p: add IFE pad descriptors
Date: Wed,  7 Oct 2026 12:00:26 +0300
Message-Id: <20261007090041.3732717-31-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P6krCOOrgHrw0qwnxCGTiGnZFpqGberl
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60aa8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=dS1WjI01veTeG_rP2OIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXwQ6qJ3eQ/G94
 g6aJfwR4Y4hT1r/JuF48bpRrTZE17jWhBovhttiFIyJKQ/n0gj1WaHKd6llhRS/mQm7OZmvUn7p
 GRnHBfr59xU8hdFaLRN88wV6V4F+hRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7L0FbnoeR+8Y
 Sxs9ijrXuR1o4/+HNkJpxpZou9ZZ5Zno6ntoRIWUSdhB9mK0V3qwC01/LgoBMgUQnH4JUJHwXnR
 9dStri7K5mYy/zo3mMcRsPODcmgQ+kNQ0BIjhwGdI3s64kFC/1XkDne7sMLdiCgk3ArDSUh8Y92
 hLcqcic9jNYh4HQwUsCd/z8OC17VVuyqvjt5c8QkbELQbJ0bAXKJkLaBehqFs7R7w5GZHgyCFiZ
 wQuoyr3c2iB3cmIVShOp6FNfctci2vkpKWkRa2oGrYWpY90sINkniJQ2egHYurOM8AZCcDQDBu3
 RKlawK9q17HMIyV/K4Edi/dS0Ww5VwBysGmYmqWLJG1bg545sEZnwwDYBJtTXtwLAbJKfujxbWT
 vuoMpNkJjHIAiW2DtetKbRGGtgkQ36ranfcfaJRZ314lidwQLapfSGsnyh6/ShEGF6VaJg1O2yd
 abYJLYhajgSZwip6C+w==
X-Proofpoint-ORIG-GUID: P6krCOOrgHrw0qwnxCGTiGnZFpqGberl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the SA8775P full and lite IFE pads and write masters.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
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

