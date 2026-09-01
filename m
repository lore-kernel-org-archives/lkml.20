Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669D415B6B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269527; cv=none; b=V3tfpEBFqrRtFBroMCalC8MDyorBNt8K4jS4g0ZO7OgRWFTxmJ6KxW9BLROcm7pBxACz3DPgFxhMcwC7sCCv2r9exZZrFDe+sWr6p6GGiWYrQMheW6kpkNxwsJmD179Ay5CmUfp+Et1L00fPg5/LX45D0uGQ7GRKh/gU5bBRRDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269527; c=relaxed/simple;
	bh=+N+cilYyQbHuJoaaWFaNazIPpJsdORtxcUl2HGSqIFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lXaS0Ja5UUDT2OAWSRQfpO0hjlBa18Duupa1GLj630buPjOnmlS+XSZBV4wRmZnGC2gj0rNMwqp5sNz33/+dlFDz9MHTx3zKbTigbhHgWxdyfG0jUVBjZTqxmeJHxWtyDI9fq4hhDJhhq59NbpofzatmnUT9f9/ZPz9q3y3Ldsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+SR8uKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e09HO0Ka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+SR8uKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e09HO0Ka"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DVw831556987
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8481fa/+6Rig4PjhZ7+XmO
	5H1WL+uWbYYnS4eJ0PhSs=; b=o+SR8uKZh8/LGYOB9RQ9Wr5bzk7Ok/2gonJQdY
	DN8eEmeXWCpBgRIcEP03pkzaESXpABzQzIDmvOf6Amdb1QZvTLfuwqEq8xWNtZ0X
	l5pnkIEzgwVMCgG3EnBt97y8JP9rz0flTKaXmYzNFPCA8QewVDdOP/T5RCCzvZRd
	ivOo5HYEFG49cD59iv+kdnjUhz1ZZNFmRjLHBX5XYtrR2uTd/lXfLRsPQKVJiKut
	ATHgAsTTX8/ZepnC9wO11Iu1vE2wxhm1/HWqiEf2k2Qx6TFd/NNZFx7rj3bOt/g2
	UtQ5re04BORIIyJOMCSk1eHmAdJPDevjyzGo9Zf/T7MobFtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj2x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:32:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso52215145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269525; x=1788874325; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8481fa/+6Rig4PjhZ7+XmO5H1WL+uWbYYnS4eJ0PhSs=;
        b=e09HO0KaGyBXa7cLDhGvrnj6GTE/1qhxfNfL5VuECIT0dzdB1C/xY/SXe5DJjiLoDb
         6nUiLCjxUQGflbD3VGonSOFXPJCf84tQkv4oPJGse1brWvaXKCaGwofLkD29mpfzoWYE
         gRrKpFomvvInXbdgcdgszbE1ZPRZoIzA1/AXNLJy0+t0BVXe6w6rVSxX8lvi5s1kvTac
         9eyT5gVjjDpBUj2Z9ZFDWfPHB26ysgcHuxtTyqKmhJ/Dxe9D3CiiLLow3jwTLMLLhx7U
         jUa1kwOJqH0aYR9cK7nUOwfu0MbcIvSrp0BdpEKN69hvFec+s4dOCtIFlm2WHDq1rEMH
         bH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269525; x=1788874325;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8481fa/+6Rig4PjhZ7+XmO5H1WL+uWbYYnS4eJ0PhSs=;
        b=JwZ5XkSYs1jWJHzZatdE6gv87H3+21oDfMxcubrN/70CoIoLelkr6Q7EziAN3r+g2v
         gzl3TNaZNbNS+CUWLBTMbKsPeXl1WeJTfzYbXGhUDP71BZTcxYroQhhGMkNbm3eD7Zzj
         ucP6GAqBvCyk13IaCuOhTgolt9WVL14cuVWJcWhTEXIdgeak4lru/O9u9IOK49XeNTqq
         uEf5x4X68p4iuklWxBvpX1HFGHf9K4sZleLT/fmbHDEsixF1EN5jGTrWSJhlN7tqIUdz
         bIi08jsC1q965iQ81DIbG0kTnpjgoG44eRbEoVuMQvCDr2R3/NQM01/4LQZre6bENwQb
         ehTA==
X-Forwarded-Encrypted: i=1; AKwUvBzt6yYSmTTwsBJaPbfz3xJVZm9no261MP7jykpG5tnktW11T8WQxZ4AEaaK99yjKWv2AjH01TqBBvQE7Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++kDzlFhrDZVbcf+2Kjqk4wNytTGv+RgMPUXGPG3p2RTg/WwB5e+
	7h1mY45ApzaYctIUYY6UZRwI4UMuH4KgzeiwqbVaXVzWnVtu+y0VRyCpStrMaQQSywK6dLxfnjL
	wEQK1YhCrOncSDFSqP7xOE4GTtAEUPg6YJkXwpShIR8TEX8pFJKJgMdBqcTN0W+D9wwc=
X-Gm-Gg: AYBFou2eGxip7whfKaqOWoJ1c0hNaIVW88mDbR8FIe0UGr8vt57wTAJRh9FAptMwNhF
	KjdMH3sKGLOoiCmsFcIakm//eql13jkohphLbAnw+93pAz2Ku9eys/iLkC7M3lS9czHljLiROQ/
	TsISoDKfyDZF08NyIDRa6AvfuGxekpKn4JZVkdGG/M9YAScImEqLRVrKjEt8vmIvh/aA6PRtT8N
	/4yboE0iZBzb+0o8bDsrlAHpvIIepgrdgdgfQEN6Vfj+iUYrOTVT9IuMPgmlwCF2Hy2xIaMpunt
	jjBY6hFuqucQr8J7ywAPdv0MvUNv1O/6Z0VfbetrhjZVsaxjuucjsHPI24awHtxNpvEM97mnu9Q
	R+JBjWLNxKp8TqOBeN5ltRoDVco+hAU6gJA==
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr57266131a91.4.1788269524454;
        Tue, 01 Sep 2026 06:32:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr57265975a91.4.1788269523781;
        Tue, 01 Sep 2026 06:32:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d463798sm5904477a91.6.2026.09.01.06.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:32:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 19:01:34 +0530
Subject: [PATCH] media: iris: Retain firmware confirmed video_format across
 GOP restarts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALXTlmoC/yXNQQrCMBBG4auUWRtI0ijoVURCbP7oCGlk0lah9
 O5GXX6b91aqEEalU7eSYOHKZWwwu46GexhvUBybyWp70EdtlCBEv3BE8alIDpNPUrJPLPkVBAr
 73hn0vXPGUqs8BYnfv8P58nedrw8M0zdL2/YB59skHIMAAAA=
X-Change-ID: 20260901-read_video_format_from_firmware-e5341e334412
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788269519; l=4246;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+N+cilYyQbHuJoaaWFaNazIPpJsdORtxcUl2HGSqIFM=;
 b=pkd98ewclbt65UU3JOQXMsz/Dlzg+rnocjJTdxh5giMyWO18cOk+eSxiiKykTwafpkXwSjfcP
 9yMu0rxk9IYDTx5Cvv2EHyKKZAPs46m8Bu+F7hfs43wwC1s1cnZFH5P
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX6HveFMQCFsQ9
 5IPfANt7WyVidEswMp/wIMDh7285PZfoTBrtNk3swaztWFqvPJGURwlfj/9knpQsyJSgPsCe8W7
 CBh4kJuqercncqpVnba52+d5FrQ58e8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfXyqv3i87fKvEo
 BR10HIpH6Mc8Ja/CxM9UwHHLGXymu+mNDHZ4CHtTffLdjb33NgrlmbIFgtuoCuQNZfyiTV8Zn15
 M3rcx31KhMmyjNYq9rK54OxIf6ktMaEBN30HdPLxVnJaBYvTy8cZHFyn1HBXXjb7ZcUSs09Zqlr
 iGHClzDW2wjudRDRwRIlb8SDqXrijtLsmt7aiEymYhkfT8CbcHIVmeXBr2JZHPHnkHJt1cco4qL
 m5Dt+0+qeLVBSESLwaXPniGlk+Ab/5IPuTMzxN5UhBKbJyzpqsN4bizNbcFLWxEuff5L1JEyE/W
 MHab/6xDQb1zziXseFRzPsBt1yLvFgcF8Cgao9rUn7IPFG/AApNiR0AfBO8MZ58LXAx+TNCMee4
 Kk9jhc+Hl8slmunA4r6EjX2kj0n6vKgzcnB9AgCWJtIpB5npVvtpptvAhz1b4qX0H43S1zd1iP2
 rKTdbS3O4L7s7UyVCDA==
X-Proofpoint-GUID: _eCO05Od1U_rJsEJXOnL469gQpvQeuMu
X-Proofpoint-ORIG-GUID: _eCO05Od1U_rJsEJXOnL469gQpvQeuMu
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96d3d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UrH_bzIhgnSsKCIZztAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010120

During speed-based rewind, the client restarts the decoder queues once
per group of pictures (GOP), because playing a GOP-based in reverse
means decoding each group forward first and then showing its frames in
reverse order, and every time this happens the driver resends the colour
info property on the bitstream port, which firmware always treats as a
sign that the stream's properties may have changed. The real problem was
that the driver never stored the video_format value that firmware had
last confirmed, so each time colour info was resent, it used a fixed
unspecified value instead of the real one, and value firmware received
kept differing from what it already had. On every restart during rewind,
this looked to firmware like a change on the bitstream port, so firmware
sent a settings-change notification, the driver treated it as a dynamic
resolution change and paused the port, and the client removed its buffers
and built new ones for a resolution that had not actually changed, causing
playback to stall once per group of pictures. By storing and sending back
the same value firmware already confirmed, both sides stay in agreement
across every restart, so a normal restart no longer looks like a real
change, firmware does not send a false settings-change notification, and
rewind can continue without stalling.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..439197e9e199 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,7 @@ struct hfi_subscription_params {
 	u32	fw_min_count;
 	u32	pic_order_cnt;
 	u32	color_info;
+	u32	video_format;
 	u32	profile;
 	u32	level;
 	u32	tier;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..a43a9d7687ad 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -358,7 +358,7 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
 	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
 	u32 video_signal_type_present_flag = 0, color_info;
 	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
-	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
+	u32 video_format = inst_hfi_gen2->src_subcr_params.video_format;
 	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
 	u32 transfer_char = HFI_TRANSFER_RESERVED;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
@@ -806,6 +806,7 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 
 	inst_hfi_gen2->ipsc_properties_set = false;
 	inst_hfi_gen2->opsc_properties_set = false;
+	inst_hfi_gen2->src_subcr_params.video_format = UNSPECIFIED_COLOR_FORMAT;
 
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e8..8b1ff253a560 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -581,6 +581,8 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	full_range = (subsc_params.color_info & 0x2000000) >> 25;
 	video_signal_type_present_flag =
 		(subsc_params.color_info & 0x20000000) >> 29;
+	inst_hfi_gen2->src_subcr_params.video_format =
+		(subsc_params.color_info & 0x1C000000) >> 26;
 
 	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
 	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-read_video_format_from_firmware-e5341e334412

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

