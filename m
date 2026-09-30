Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC751C067
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793046; cv=none; b=Ngxv2L569oGRY8C1Mhb61zBnrTt0kopegU7jMqn8AlRwPL4bOlDlDORcL0lemS6/qKdjG833U9bel1ihM4BhmIm6whfmCOWc6satzQQvIz5Z9AUsLx9HMvw2DRBnx32tluu+dfKDT+/3zpSMgq6RYEZ2sgL6gIVWD2HvzfSMFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793046; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lm6fFWKTx6jOPRkOth8LjISTuFBAvkEMFsmt5Z9OotfrMAjkDgITt8+rIaptMzB36Jpla95PJo2HOawZKKgOeSAy0ItSVlOMQQczn6zivB/GopuAKwONc3XsrkR1ELAB/4Kf/GSIgtUQ5v+2a2cY/SM0Ls824/VGMk0IWom9CM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0emmRTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaTIvY8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0emmRTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaTIvY8B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHf6JN1110137
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=Y0emmRTPO5Dgke4J
	3zDLQB0KEmddrea5IZejO5mmim5R0jyL89QTMXPG0uzQyMCw7EQX58jza71u2deZ
	SPuWW56jcGdm4I8fjJu+ccJtFLG7W6jgV3zL+/2x8rqmaRDciN6boE5pxbFcFdf6
	1erOlIlwRsEjBnh/iTn5OX8n1C5E2gfAaoQ1FgcvUxEhIg58egje/LoTFfYnz2VI
	v6+fFqJg/nM/MAUHwvyPYnysNArr49A6TElHzsYPwzAkXRKTJTp6LKTdvw0eBPDT
	R4hENmn8RJOGkl27PPvhXFgcO2Iuw4ZS2C87AaYdly+GOL/rBsTJv0qKUckrOPUn
	piCSXw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh82fhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-144f87ef7d3so180031c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793043; x=1791397843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=PaTIvY8BZooU+fZgeA/UC6x/V/tnACZE1lqJEeSouxlmhntmk7VShG5iB6yFmUye6w
         N9t3Y0T456lkwrJ7C17+unpO2qBciuf4M5QcaiHc9mXtRg91xtK/LSfF/Ds19+ANwKYR
         EXaCF2HcZp4ZthOxAVpsMHnsxtr2OO0OeVojZQYVpOAH6coVKh52jDuagk0B+tdVAUKQ
         B6ryJqWy42HFUntNKWh8kZVI8SymorOrLiXs+/9kAvbFPSWzULKfEZbRGtxjTfaYIOTn
         dhxVPZ9+3K7y/OzxNI9/TK1hYmfKQj8ut7x9YpHpSfH9yVXwZSxk60e5zeJq9gka4N5A
         ZCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793043; x=1791397843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=qJf2v233ASnkEN9JnN10LBsdNdrb1gHa7/8gG2xHx9jUkKLmUCm/5uPTBlqqKzG+Rl
         JKxPhB6+agqSlIiRs2jOmIwTDsbSp2b4B2QEufyag57T1vFxGch8FkxjQmsOvbNfvpfC
         fbLsz2BnMcJBEQaWhHT3rCU8seU46z7UcUTemzRHdTb638jEvCGlHbJildKLNgPeZRZa
         CTMmRU0P6oARA71EzSZ332SmRE2bCJ/lx9diyeSGruQyCADC573ZooGHfRJRr/O+3rMs
         NWn0TN19nfr7fCoP/mmNAbUlvqE1vFIW8PT6B6w7w+Zj5jOZQw+3FHWdZS18Vuo8lofx
         rl3g==
X-Forwarded-Encrypted: i=1; AKwUvBwArcjq/KkVSS5lSLtTsDmS2v31PLqBw1l9+4uYBltn1tCFwLMdiUO7UwNG2oQYq88fs11QV8lxMDhhShY=@vger.kernel.org
X-Gm-Message-State: AFuF++nLI2hG7bMVZs00F84KubDAfvSHjY7zEYDOnXh92B/swEfRdAK6
	SN2438wAGoarHAL8pPwLnggQ4cCQb5J77U8Djj5uZxHJMvL4UpiuEMtsXdt6FnibwjxYxJ12n40
	aEdJH10S5tqbRp2fUs/Dz5fnzWKjlT6vZHcl2AlqUWEQ/6UHJSvu/1U3ssyGZMyzavWA=
X-Gm-Gg: AYBFou1WJaTOF2Z7nhJrBVl1rETfeASFGyhCHgfqaaalO3fWEGj8tDvGXyxHhOgWj9S
	rleUwXSWlUIuS6Qt4TXOpq1PDZNdIwipdkHiIRbjtnDkqlv2K6oDGu99UowpFLfzwWTgvNjeBqk
	RiACUH1xwLMDLjIpamOsc3l9m/qe39bexwl8cqWZ7rKYEYKNxzByqOa4eCK7cWTULvrm6DkdZHo
	9CgkRcunqeozsVeNaoFoNk9ZkvbVvlqsFtFc9qSWEXwvr2mXu7msX1tPbfo0BPfE3pApPYt5kDc
	Euz9MNXCVH6uGD711iYLBkAXiYyfxv6+rfkcemgYUi1mDK9ri3r2nhGbu8OVCzKTD6H5cJxmQo+
	/iAU+lDTAQieJjH0+BVbyd6SHQBYvLZi3VyDACs5bt/4aXBN9U3qaqa1midR9
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id 5a478bee46e88-34cde6749bbmr4372929eec.1.1790793042599;
        Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id 5a478bee46e88-34cde6749bbmr4372877eec.1.1790793041838;
        Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:41 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:30:25 -0700
Subject: [PATCH v8 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-enc_roi_enable-v8-2-2c908f30e963@oss.qualcomm.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793030; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=wgFWpaxF7cexefTJUoRLScDh3HiuOhSB+yz9lgjV35GlbAMCBAJxsyPYQL5PMPfgx5BT1x/14
 5rrnaHqzjVlBk6q+WrW86JVUVuQdweF90pvl/4JSxu8bCGUBc0OliKn
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfXyWAgrp6NN4s4
 sHabbone2smBYiuXDCiis2g8VNfZTBQjaZkgJw21vuKpcJJN1CQZanLJQLut4CW2ZjnJIanOfO5
 GGrbb6dIBvutgRSGAQXEaDIDFfF0uYWpH9rEkJt8qXT86mCwj/BfKeGg+deD3ieneXhihU8Hmjt
 D2pHZMLyBLFpwA2pnX21nzv5BYqMDpxCpfG3yl4QEoA2olxIJjo1JLur0cD5DGSmJ0uaXYvSBI6
 UMD3wePY9g0hoGdEyRL7VNP0lmKqIl31bwg++PtO+nk+Vxg3Ceoupnb95BC+0uvU1dHsrrDDkn9
 A8AQxX92Ha/xiGK/12rjeT+3iX8fJV5yc3ro7pSY3BtY0jUEoXURjPpv7xQj1BCKjYso8Q6NuiS
 3yxq6ao/CPz2gy0+5qqfX54JrWg5yz18KJ0rSH8A5ce9wscNRxrquS4GRAnfcCepKvP3lCETFIN
 lnTuru+ZmOTcBduMcRA==
X-Proofpoint-ORIG-GUID: mhzkVpezoSEXJMsoIMiqedgWcoEa4V4E
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd5553 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: mhzkVpezoSEXJMsoIMiqedgWcoEa4V4E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfX8Vau4A7Czcp0
 pAW6qUElImMS2NdPBr2fDRe15jDcnYH3mysYxFfpiNm7Cpb77zq5guYj0MMF63YGFyKXQv89Wj0
 GX7bZS8pAAcT+6jEVCp7jyez3LWWQCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300075

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..28a47ca7b14397d3b7358c6a105f13092c6770f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,33 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent. Driver can ignore the control if it is not set
+    along with the current frame.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square MBs are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame resolution and the reported MB Size. If frame_width or frame_height
+    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
+    ceil(frame_height/MB Size) for calculating the array size.
+    For example, for a QCIF frame if reported MB Size is 16,
+    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
+    For frame resolutions that are not aligned to the MB size, for example
+    1920x1080, if the reported MB size is 32, the delta_qp array
+    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c7945a8998b96708 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

-- 
2.34.1

