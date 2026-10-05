Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B268414A3B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236296; cv=none; b=UbP/NqT/E3shMxo6a7fb+Hg+seUjSaq/5uKTXRTvPWB2LD14J0UNE65X9hWmpdcoxe/tl/drUZ/OfZDd3tNa6KRAbatldN15Bh8uPTL0oAGl8hEIv5+x/cua0e9ixbq6LzLmWndtHtNzg65CZlcmUAIgYwQGxvJjHzj8wi6X8Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236296; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfNfUatRwIfbLxD67bYoUNPe81dcnaIyA1hwUYIgxRV4wx1ArBoysFFiVypcuOPa/Y9cTO84VPEvvMmFgQX8uZc+WhOS2tzGVBcJ1AOUSWLky8gRLs/3vMsUVMoSr9BShztBz+o/DdtVFsBZfglG+CjCiICJrm3yrQ0PeJdPAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiy0VQcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMBk3JzS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiy0VQcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMBk3JzS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMuBo2135017
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 21:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=eiy0VQcYuMkY3TzI
	lS/hRmPb/kM4z98tfrbtWCqAJ/vwTIHladMveftJ/erS3mcnRE6fZL1X8IWrHKRr
	EXqKaM41rsuGsiIx5TYOXmH3V54pNCnkRP+KLRBYJF1n0OdwlwSQ2QfnWivth2iC
	dNpXk9wM92zDJS77wj1CmOkiimxO7ZVOa3XLChkX2JEp9r7ZT4n6qIOt33YWoz+c
	bjH5sZUEvk7FBNStR0EAFYU3zMQP4G88sV9hyWsu5s4SWkNk9NbddPsGs99PwRxF
	VQonYjn26b87+Jz5osbXrW0HNK9bdLm/XPp6naaXhjg+N7x+pkjpGn5sXzayMLP7
	q9jQSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvnhtcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:38:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313c7315becso352348eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236293; x=1791841093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=gMBk3JzS7vVajARzcwpkRLIFiddgkcpoa5YCgGAqmrcwIDWNxUBuNrUtvwHkkd/en7
         aN/C6EZqM+gT9q3OpjFgH8LFgA3lsxbTx9315jB1Is9wcLbrcspZB3+rKVxB/CpsLnDM
         9iYviKTZxuSh+8uVNxzjrSXtS802rEMvae16bOEh32U0O1mClxgES9n76/39XIvpj2dv
         N2M2qmYejEGsga5YAHg3R+o2g9JZZs7TUInmM5jjS/Fz5Xw4YMjC+BNpO6idAG8YH6DI
         SFMkFsDVHzb8YKN3eEIgLyeogOVbkH0etAOHsLwnmTDY5Ke0RkUmszXiwLdhm+8ssD3n
         O7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236293; x=1791841093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=Efo3pL9rqP+mwqaRYtHDD2uGaRKIIvS+kWxz3cz6e31TVGME6TC6Ng0PWSf7a84gUw
         o0Vit0zmpfR5vZLhPaw12Q7TYZz2/znhAQVYUFi7+ei5eM5SfolH9wSLOp5A3lRMQwFy
         bh2PIwqPcnnenn/l2Jo9uQ1lj2Xbx6D89J1piMaZZCcpIxB0k8mwNFqY9bVV/S6muZan
         S82Uky6++8Gr7x3HeHp/2QjgVf93RKS5SbTNmODNenTiSYwoFD5z+lqVKi9A7W81+hAS
         IDXTgqDN7zCVOa8p2lSEvmfHvnlIGKKQrG2Ou4sGNAMz/R7Ltu/eyERoGvbiGG9E2HMX
         RYPA==
X-Forwarded-Encrypted: i=1; AKwUvBzt6QTgLBdb/82Wkfq2DKHDrKuM5N3gS8kUHSH1Xwm6Aj+bxogeDrUZ7VC3eG0Pd2dLixwONDtTk/grHV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nGHLAma1uINv/DF6Aj6MSNOTPoghdrOYU6RBjioK5Qhr+G82yn
	jP0pgkofWjZNNCgGyn8SPT6Ce5bv6Py/aBjvQL4Y3uySToLqsjxIBNWVVpJaSZVyaU6sxZsApgH
	KaYBvnKRssl5oHr3l4aKNUFAlWpk4HSZo8hYGbPSRn1G3NuhztokPLOkWfibxkpxRTaI=
X-Gm-Gg: AYBFou1KdOXu3jG2UlqUOqHX8VHfBGii0sDdBS4KVZhrNH0UJPyhvPoOmrjgzZgg7jE
	tgYTfbf8fS4fyDrl8rM87/L5HNw20eDmVvyIgd2v5B5fdIRwM79aOB2W8Drnl75uvGy41vfeJiY
	Ou/0yafmHTmTj0Dsnike7mIxa5W8jWTd3DrnqsrLy0rcOUCjKIbpG8hWzh+81o0Ly24XbCzvycT
	5kDsI6vSMRx5c3yNy4hoEI3Om5dq4Xym0jwKy9tak5OwxMUd6tB/GNgRyp2sdos0FQ6znRGQqBF
	1I0O5FwYiQ0Ofs9d3FxUTkd9eZ+zOiMZOH2BcuOwVpUSOkT3tJpgfhzGINWYzBPpbuIid7mXpUH
	fVVUkUQ1GdQoo9bJCXdChC4bGs43tli5at8vwzPSgAK79dFRm0FWcLLjhLgLL
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988804eec.2.1791236292393;
        Mon, 05 Oct 2026 14:38:12 -0700 (PDT)
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988747eec.2.1791236291458;
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:38:07 -0700
Subject: [PATCH v9 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-enc_roi_enable-v9-2-831c24135cb1@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
In-Reply-To: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=TBVGJ+j0HTCzE2fbTEQ4WQvXkKIIp19cgDKxu3OYpxYg80xZFEfzeCfFQkzvmJsB5Ax+lCs6H
 HFa0806SNuCBAbtW4eDwPGD0viBZBDTqqEt4YGiuU3t8um2y1peM4Xb
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: gZstFmo39OF83GZD06o-GdM09oyBSKKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX9Fx3x9gaF+a+
 TrsGgxApbeECv56Y3QsKaaQShlneYkwQruJsQoFWHFTj4Y2P6Hv7Jc3vVv8TMowYNQSCDyHD1I5
 e4RNTCQIFp1hjWxJX1huESEGO5kYRirGAcKDC1fHSI9Pl/b8DD3LquJ2PivLzx+qR0SIu+Gdczz
 WCwIxaQh6y3lfwBytDBTF9cPyB1+E5FYF6bK8/c0FD3Ht9FHrUKNLwdlvUq0E/p7Xacn0siZM1W
 DGHnbnXdFLcWlF/qrGGMPNXBml8DI6J3EkAeXyuEAbHKT1FoNFuKQxlTWqxX1In9TxVydmTC/XM
 iN6sjnaJyHvUSkUMxgGNNcqMVmFgWedIpFKJ2bDOg672Onj40YVpyOnSNtgLutH6kjMh7UeOLPe
 aCNLOHyJZpXusC8OrdB7vEYLP1NgZ9hCG06SydnOsp0cwYSvxBasA1JMU94Ezv+DYEei/HCpnf2
 Lqhr6Im+sR6LRSYYMCg==
X-Proofpoint-GUID: gZstFmo39OF83GZD06o-GdM09oyBSKKJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX1QiNRNjqiKAq
 x60GijH7D5fBJw9ORFQ+cT5yajUVO1knMRnUrSq48S4pewzh5ArXHcQE7jmB/AuENXcHTkZpYOO
 FPJyq99dW8j+Pdf/oJj6YxoJTfqlS8Q=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac418c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

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

