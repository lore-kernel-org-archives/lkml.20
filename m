Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327A30CD81
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191668; cv=none; b=fdxQywTKiSICMo9Va7XBgF7i+eZf6UOEM0D8EURIGLcAy/EbnVvD4GhX1PmVZ1INy9eZJJCAzKbCAl3lqyiKygnE4UBf62qX+ZYWY9YDEr7XykzP943uRwT0hkmre387vMFtcMCPBgozyVLfu8QYgPLaBdpysF+4zwmkLcdNKZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191668; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuud5JajwZks3g09NhFu8h3WsIQBM8/lpKizGAYh3+qDOpXFpq6su+WdH9BoCFzIW2dtctO3iIyw+BiV8CH+oSyG6Bw+J3DwsAE259fJ6u52HXm+5qZ7oZ/MdsBnDfMVzlPHdA10EuqTq6+AJHaGCIVn+O8hFCH3e9ECPx7JZOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6+bSUkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJI7m+ZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6+bSUkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJI7m+ZK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeslO2635383
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=i6+bSUkB9fnjuMIq
	LhrVfQbosxOOgyDmLl4/u3Fb0J/wrwSUtwEgYDRRMYXzRjWCjiuR2Dap2j/wqvqY
	OFoUnsDmUPxxxAOB5MeAYgnLnC1HvXzFLLpMF4ZX1rgHzA0A4rSIfGoxP3HU+UQi
	mpjYXXlsQDSdnFZ5fSflMo2QzL6fi8XEihQ65p9yDZh2yrGAhP+djmGRWp0KiEAC
	SwB6VOxIrDkQsWZMHiqFJWO9w4MiDChvWbbk8cvXeS0HgpGk2b3fxFtdaIf5lmCD
	P4x5hmugSoUUPRUkqXiMmyBIxuboQGY+qzY5yHfS4N9eZ4LTlYezLxfIFmPrSP9x
	lIguMg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmfaghn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:01:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90520763ceaso1160536d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191665; x=1792796465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=TJI7m+ZKI5eZOmjMjGZ0s9qQaxSuNd0qZW5vcQbZEV1z6Gx7n0uBbUtuHO1ypHgRHI
         t3qz1K9im2F3vCCszFEUQTcA8eGtZrGICFEkYSj3tKAMY59Y0fxPjn0vYvgKLslzft5w
         RYYZRVQtvEpkkR1OGGVZMrvXEF5BguMYifVm5j1JBdbzajsOvrr/IhwpHl8+uK3JWpGP
         9SvrsBfsA0Yro3FDYfEaKOauQbNnyRKhB7+lx6aoXbrY4qIsUrhJjCr/nb/s/bfJ+pWk
         RpA6Rn0V9j84TSTtkVa6Kurz2MUTrMQGqcF2UopDbxh5QP8NWsKafaPUCj/51HQnCRPo
         Yspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191665; x=1792796465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=Cnu531X5P22p5dV4d6F5jPsiSVqv9G8Y0qWSOBB7Y4WmBnN7v0PNLyMsiDPuHkM/LV
         SZISi/03LnLwxweLifbP32R0McRGpj7uTqdyyPWdVnb9LgEU/FedmnNMO0zKSoCQvOBk
         /rYKm1uB3Qsqdrt/ji042mIobDq4LX5sXplTgj/xv2VKfVRQ8izoVOgfY7+BHykwBJaD
         UEtW2I6HYUE+cxMRIc8tx7Ba53SCjvgWhq4w848t9OAAWz+O9xUbUt52099QsT+XJInl
         Qe6CU5eru43WWADHul3Au4vGSd4LyKvW5SldbFaISJ+K/ac6nB5yfpVpqJpdAvo+v+Gg
         dR/A==
X-Forwarded-Encrypted: i=1; AKwUvByIPTMv7UosldDYCdA1CVyU1hZaym05uxOx+I/Vs9R1oKohhO2/Uszmc4/gseKOaYVTGt9uB7gGRU2Z1AQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyPhNcQv3LPiGFplG0uxcl2pc9PI6sMbyiNPFoWla26QcjOIu4
	l5tbvQ+F89/eLPYrtIth4FsXl5TTrviHA6UHi91AvY3XTB4Ph9YSHe34/O31DqM/oGHir09Ymsd
	PsxCnmoD082ZsWW6+kB4SHzo6PgXAPJNLkktkA+VuYvRAk7C1GCKUvQ3WStlCdZZG+WZoT4yM3O
	g=
X-Gm-Gg: AYBFou1iYfCXYrUd06GoYo3SYWH1TLLB7aDjHg8hKdMRsKZxJtH+Cv0gGm5s+492hzq
	qK952UkZ33xP4w/fbBTMU7f4C1p6ZKgycLO4hjEMAg9bd07/fxnFQn9QFMCXOSFTBQSVZV7QlWQ
	lC4GcgNELEwSEmuK7DuJmXgwwpARHvU1lju5emMwF8zC4ZoyOM8Cn1J7T09lq0a9q5ljUxmoAxJ
	0yrLA+IogzF+UgaEygJ8coKTaOkwZmgD6QI3KDHz/IBbIj95/cg0iCqy3b9GV9XaA3O1rXC9EV4
	GFYHmo6xKtE/8vQ13Kc9AUZGQ9d3XJPmJ0nzUMVltoe1upIVnO7PwwL6zMc3lF8u6S9d/YnhrzI
	5qDGPh/CaaGn499phcViGDXGsatbTKWsNbDbQG4BNHVx9a30FMlUN37ZAUl0=
X-Received: by 2002:a05:6214:5904:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91bdec4373fmr27007546d6.1.1792191665102;
        Fri, 16 Oct 2026 16:01:05 -0700 (PDT)
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id 5a478bee46e88-361a136a601mr2158883eec.2.1792191642926;
        Fri, 16 Oct 2026 16:00:42 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9379101eec.18.2026.10.16.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:00:42 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:00:33 -0700
Subject: [PATCH v10 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-enc_roi_enable-v10-2-bc5bd37b6f3e@oss.qualcomm.com>
References: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
In-Reply-To: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792191637; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=GCMwKTILxnEPW8en18ZZ1K1nR8aFH156dxCvZxwoZCX7LWquCL1FwUKBCkjsK4dabM8RwEZzY
 vcAVDwP6kILBxsHaXOrFRziYplihBd/fVI5xvrUQIYljWQyxr/GoaWz
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: mEnDJHIxs7HOiQjyM4869fLn4vGz8ZP7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX1pFnD5h+tBWs
 pVasr8yTSB3HxlKtb5ohgQVadvvAvn3mQQame2kLay984triBreE1rJNSWMhpL7YXsM5RKtctIm
 4JST/BFxSsHCRV43NyP53/lE3pyFx0s=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2acb2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mEnDJHIxs7HOiQjyM4869fLn4vGz8ZP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX+zC3qpbq3ybH
 Lvj3g7nSZTA+ZJrmiQvR0pky84X+hMoSctDpBAoUCAL7xIxYiRCBr6fdZte9BizdHYDqRU0pavD
 UT3os9bLs0ZQYR55/DYAdPh7G6tp6xZInXLxfB2FqS/8b181aspDgqakmNm+hJST0teSvCJe/cN
 UwVCU7Xvp1V+PfSkR8LXGo+Afq4ViCh4O6j5q49aRkYRgLRCV7EpvdAqwqKG62nVzgxyDSIWAFL
 r2OvFT0ErNH9yomBYRbrsDqkZNLVITP6BKT9aR92DItVHjojEdfx9ZmPl0cY412JWIv+3jJY3yd
 vm6+SrtrfMwEdNwo0KnrAlp6aJXadnZdyw5WFyUx8hIHzvZ7mWRN8l0+b2dze0c2fMIgmR7cxZv
 yVfv4rTRZ1d8+BX7h/l8M0YmGmrxF5pqEapWqSf897Y6e8PPz7xsfQML/EF2mzbv3WtteBkqE2A
 dn3KzR2jPU1Cj9Ge26w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160091

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

