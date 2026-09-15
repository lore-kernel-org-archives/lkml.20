Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DD23A2E12
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509621; cv=none; b=hCVjYA4SmdxSXBYLUXtVvwWqQgd4tgs/WX+n/B5LCoZInMKGV0Ze69xETesEQZ572p06Mxc/SjrWUXEBr2piABtvJ5Exkibx4/rdqq4ZHgrI+qI6HtiOykzdSynrks23l2nyYwJknfTM1SFOm/iG95RSXdDU+tmx06TN8jXp6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509621; c=relaxed/simple;
	bh=2dSlcXsKlwUohkHpJICDFfgDxNit43kgpQmLWkSA25o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH/4PRf9tj7bIUSsg1He15MBh9q8XcozgMjUurXbjG/osyyMfkpynYmblkV00Qs0O75FdX6RAXyqk0Nt4zgbDIk8zy9ni0wE2yDehzZuBH6+xl8JtHkRgm3vKEP0+2K4u8sQBAnypH4H0tvOtM3S2HxDGwz7q2l7YNpQvwyjKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPRkJo59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6pqZiiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPRkJo59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6pqZiiD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYkFT840552
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=; b=MPRkJo592Nmw/+tG
	qgHeB074+oBy6RBIwZ3JRkrQIj32gjiP6WP2I5T0syZJm3JSi+7pbys3t70Tq4ql
	2v93K4vIf08ACBr2kzXg+4nHpjjg7Z+bET1J4hLLGz4r8MR7REmt6XJiijeGLFSz
	6ZuM+f4EUj2PAGUUwZtLb9mgA7uopGFWba2gwWLIL7s8W6OG/1kiwTvF5BTm1e8S
	DF1AmmpeZ8gU4IQHKMpFE/f832d2Tf/v+EkAZ5tBSB00VFAwilnxd9FtoggzUAB1
	q3bXWxA76p48dqldpoNdIy7bnKRbNNTlfyxp2NVikyXz6xHuXcXtvtL73Q96ZekX
	TbZbHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw82xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so1326397a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509613; x=1790114413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=;
        b=g6pqZiiD/Pk4e9LL9sLG2cj0UcaHSHkaxY+4YWfzXpuxD1jBG9Mh+oa8znygLy33vY
         tjYnJzlkSPx/OfFXMeeYUCkU1K0rBPyw1GdmUeUlGDrf3DfhlbNl8KaxcumWO56/cH/q
         zcBwnZNoPsWnQS1T4pJ9wxLah91bWqjO5LFwPtyVMPKDuW7sql2iJdXjfx1aAMxxxTC6
         06hNeoMPvrGu1fyM1xdSrt66vLkqFkNacbOx/RuNrjtcfLBrbZi6Fh/IDJdaNQlKGAMx
         UyiyFsumQyjCVBIMMBqVkHiyWKBQsn+vYKKwpgZtULE0ESri1WtdMf8PvNMxZ3nPN661
         Kvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509613; x=1790114413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=;
        b=BKmz98b5ClyiF4o9hiB2kW7eChenUyur5VvNFwS8RAgFYeAF7BFu4TEiar+bqZe5/G
         h0FS7UsyBw5tQVIVOLBKkBVUTpwDMZmfkvyfEFhWMcogd3o3Q3fMYB0sxUhCYd/DZBE6
         LCaye6I8pyIuiFRasFmXj5zExUz9iKITgotnRm2826ctczT4Zp/a/6FTz+xZwynSbhU3
         a7DMxe5xz5ZerY88fbrOQNddV+djO9r7vdPwsFkeMd+mMIypgdOTIa/gw7mHpvctxfHA
         nuVepXnNZYyGCj14uvEUxIqh3+TevrLk8mU4tGjntHv+AaV90L+VUbakTl9Q7gqIZEQV
         a7jg==
X-Forwarded-Encrypted: i=1; AKwUvBwW78dplWrAzTpJECbyO7sW8iQWvDh8cXPEwWrNcDEofL7yKZy9G1bu6ULMUCM788sB114WtvDtpJ18HRE=@vger.kernel.org
X-Gm-Message-State: AFuF++lzGm4MePLd2akVd/GdaBOgQby5mIxvobWlgWebL4UcDmaJ0YLK
	0u1gOfNh8zpy7b/bM8mGde2vG0rfQC7jKg+OMKHEWcTHuPzzhDLAYopi7eM/kfUw27V+/HFO6Z+
	LiXZPXhrD8e3pq9tTB0h5My3Nm9Rg4pGsxsUOPpywOg9hkPUAq8ZLhqCfgPl8zyhPcDw=
X-Gm-Gg: AYBFou3qbtEWAWddI8FXPO5CJ81mxoQSky2RqvxDYVQ1Z6QsQSZA15TZTiT7k+UGwes
	p9NwLrpfB6+oezEl+r7nKcxQPRZNM+oNMPWJpW1TOhYHhFJb8AZ5fweHN0LwrhUcua3azQpytJE
	bni4VZkGVfrrJcQlWqs8Rc/QSNBm2dGDbP55RDARTGQitkGziHVfHEEfutG1tTVZiZo7La39K2g
	nywQCV7EeCV+9f//UwpCRvkkAZDH+9JQBJn8kfVC63vYOFCnpfFwIx4emhg2LgU42/LtiiOviAT
	iIuO89qmQYvpGhO9Ye0HVLVqccvHKMY2EDey9DAIQDU1C915sYWH/eHwGtbwel45PzfZERxOE4k
	BsLNT2Y3G0CkqxvnsCACwMJT0iDm89e82+asQd4mK1vrt+h1+rmXz+XPbTaBG
X-Received: by 2002:a17:90b:5386:b0:39d:febe:7452 with SMTP id 98e67ed59e1d1-39e1e64b9bcmr311533a91.4.1789509613341;
        Tue, 15 Sep 2026 15:00:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:39d:febe:7452 with SMTP id 98e67ed59e1d1-39e1e64b9bcmr311488a91.4.1789509612776;
        Tue, 15 Sep 2026 15:00:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:04 -0700
Subject: [PATCH v6 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-2-29dd4c8bccff@oss.qualcomm.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
In-Reply-To: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=5812;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2dSlcXsKlwUohkHpJICDFfgDxNit43kgpQmLWkSA25o=;
 b=QdQWSd121d55WR9ZYI7dQkRzxXSINssmo0nuRx5w+g1TqnIKqo0CMzD1sABLsjs68ExlT7rE/
 L6rWutxt5lCDUtkLcxGsyGfC4oyhQww3TkaHI65l2l2wQrmopLjD66m
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: EsAoI6zDG8ysiCougUBceOwXJq66hbKb
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aa9bfee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX1QZ+xfiK0r1e
 Gv7UZcXRToLmWObVS8NEdve8ASILmgjy3Mi9yzgGJ3PsTdJByeP/o1qlHQ2SxWLDh4ZhdCHuH5+
 eRWlOjQBNNueYUxMQaokd3m/ooVaGUh0YQCb1tL0vUefDH5ticwk2jKEYQvCe+ejgQtE9kUZ6nf
 3ZkqXataa2bP6kjW0OJ0TH1yF2eq3CqtOD6yvqHpe/5rSZ3jXd71Dsd7mWJq6SnF9g18Jso+QVO
 ievyKWFDAA+uYazKBmuzzzSYK4JR4gBjWbTFOSqlbFOLbliLvImkHm5GLZG516NZpygHYE4f8hR
 vYe+ec+aicu6AzM7sayNxKhkWK8V2SBYgxgFbB5BK1WSCkwlN7LB+vJDOz83/1ilOBTkxzMPPPx
 uXq1QO5dduJJMVm25ijVejUVhLSOvD1ErLfboBz9kJH/mMCNQAlrWXB/BocIiEgplJcVMefouUZ
 PpfVMTRMb9XOiC/6MVQ==
X-Proofpoint-ORIG-GUID: EsAoI6zDG8ysiCougUBceOwXJq66hbKb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX9Gk0082ljN7a
 jsEvM9pvADk1Vd2s95/nCb0J6zrC6MQNZzwChYpcOB59mmh4TBffim1gX0cgpVLO+KPvwExLHNQ
 FIiYBQqFdZDLIi2adwKg981i2y3R6BY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150321

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 41 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2de1759ad179b819 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent.
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
index b78992e32e21c79b1c70ec673b81759c9ca84206..e7376b52bd75dd5800d58941aee21534ce0b502e 100644
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

