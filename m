Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E123A1A5D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509620; cv=none; b=cjbdeEs8G/9OBU/jN+MjpZqTwyhpTn4Jkpw8SwVKD9VKGwqHwI9Vr83yfLTWichIMVGvZ+ByAP2wY/CiAZGzKAR9v0YYZscoEQqmcHksVKXxvT5kUTBD96m0KuX4uac+9i2wRg/hror7Nu9EMBzT2YxrOukH7zK0WBDNRYBotz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509620; c=relaxed/simple;
	bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iab9VuCjJIBbEdgt0hhhLy48H6c0VeYXcz5KlBMtgUAdpSocILmczDSewfD6uMMlPrEUbnLpXO9nsHZ0UaAPm7O5kZVnej3ACUINh/IgL+rU1aVlvjXqHUAyJWCbImfeMB/TZgmWZhV9B3nmq52rOzwj76id6PQpyyNFXrkiMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBeKxWs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsZevRMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBeKxWs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsZevRMR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYY4I840343
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=; b=fBeKxWs6/rtARWVm
	L1cI9PCfvVgLI530QOukbrAY1TakVWfczb1dBwkvtHIgoRC/xscp0Vjx1bbdkBWx
	t1MFKBJAyjMWF7TgmY7ANAmAMHyWwqZuBzDNTp/pQZmiYbGFA+x/u0Sad7ZhEuXA
	DhTEyCMNQxiNLi/LdHQDhNIU2y75Z4pRX45AmSHxkVxZ6W1k+uM9KrVRaU7+nuhr
	EzvHWPLi5Juir2RrhmGdMJ97gWQDkIce97pcDeptKu81NdHNrLnUSNeoKnU7uOfr
	8eNMfLdU8aB5+liqL9qhXLk76fitaqvLCQj6h7FjDzWhuQ5k/frYPHH5B76F7W7Q
	dCkjGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw82y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso1795146a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509617; x=1790114417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=BsZevRMR0rgbT3CbLJxQJ7iAb4jAZOumxSx3a4FMGiuWVUtQMI/aoRnC16o07TJBYR
         GNQec1tklqVdOQUG5wbE1Akjf8Xchd3BbdDDnjSkt2P81Fh4i9jD/8pfvWw3wpZThXoP
         3gUUGsGsiCzEMmkaaIc5OTDcQIeKvlqJ0v/zqmSpFEcSFIxqaMryHs/agpIefvep5BYm
         XQthcJyBWvi/D9q2L5Fx8KT2MEn3GlujSkwmtxNMNqdgcxjkz/Ym4cnU5XJCQaAJJwNR
         Wtu26+8ZjlBoBiFI4ZPLgdOmltTNSH6C3SRyfIOG8eVKAUG/FFYRY9t/BeBY0PM3sYq1
         KZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509617; x=1790114417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=0Z03aMfnTZLNSedmBVfSbuOiBfkGkEMaFkBUXe+QT3CdacqJRR++V49fHBji2vsAWY
         o6Wg1hVf7h7I2oaMOeQo5cEz3B1pfwWxnQTor5uG/Gsr//jDOFL+NyyHBQTAD+Nm0kZC
         NLMMF0oOHl9TV96V4RqeuzMxwxVekhWbiZiPYhOM/WuCef7D40pWy+0hl96O3Dv8DylL
         zrPZ6yDAxWZvqKCby8T/26zBRI0PEpmcalyvR5LnMYxCd0/UIZB8hRGA5GFE/QO2AJk6
         k7XjuOyJZV6eLdp53SUsoRWDymnpeB3bj929ez47nYYrTvJr8jqRRJZgVbRVXL55KODP
         JpqA==
X-Forwarded-Encrypted: i=1; AKwUvBx/jiotU8bT1efggjXngprkvGHO9ALWAcsWuLWlSjiPgUiRJ7W6HsUffDN1MqAxPfOLJJPc4edlt6DNlMM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5kZS6rpzyZ02cYq9Gxmu57FrBpyZWAOdYPJWHsgVeJZjWwnyc
	u8CQZp6uS9QWvAYHk4XkvpjgxfZKwPb+kcL7Cr7Dp1bcZN/XUzF5PqrQ2/+3FMlbaXdOEP+RhDP
	CbEgXRtoKX8S18l+g3jt5txQAaN2sgay/4iQIPpdgZS8Ojy/FqF7/6FvILNiiq7I8leI=
X-Gm-Gg: AYBFou3sRZl7tYS5NcTFpJnmQUEJBaBias/4WI8Rsc5PwOPmZ08gBD9T6YG8Rk2oGGR
	T7GcabHmRVUNcKzlHgLT7PB9r7wEqQQ+0KmQ5WL1zkG1QjDOINt1YmOfbKpXX/y+F1bjjciUJLu
	3HuPnGEE7Y3512m/6R/L1zGK4p9fjcduR6gAPNeK1DmjUer/1uLEeMSZxazca1mCTXRjlrsFUj5
	tjPrqwNnx/GKtOETv9CQWZzXUdvPniXRAjRnysNRumS5+q4s1PffjjSmGUdosZLNWq5APiIKuKK
	hqHVdLX8roPmPH15MOccLS0u+kHz82S74M4SUXqUtOzJe8DEa/CFM8GvkrWg27P1Mekb4aCtTDH
	5C1fXHnSo4jyI4gjF4ZgS8IZ878i6xPsyvVCCF+6LxwdO5tPYcvzPsarqQ9MP
X-Received: by 2002:a17:90b:4a44:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e1e5ddce1mr286469a91.6.1789509616538;
        Tue, 15 Sep 2026 15:00:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a44:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e1e5ddce1mr286434a91.6.1789509615930;
        Tue, 15 Sep 2026 15:00:15 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:14 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:05 -0700
Subject: [PATCH v6 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-3-29dd4c8bccff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=7477;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
 b=BGbBJtU8NXVacPO4GwXP7sWZZUAv7sljPt8VlPgl91F6wdd+V0O9zrqDbUxpJQYKg9Uc2MDVa
 VRYAYAsdFvsD0hFHRZQyWE+CvB11XsuMu5Mt7L9RAHR/AF2hBHE5ISy
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: XrWlLgc_eVgoezBF6S24z_9E17E673Cy
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aa9bff1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfXxFOndwfXwcQ+
 KPwiOzopQn9kc/QLWvuX7LEVoH2maOYkpKBxfWzbzViNr3LWzpkx8A7i4Pe3i//0QpyLTR5f9Kg
 7zeuezXiDfIl6yIBFer43zshGJJd5fwn3tbhVcphbfr3ggWAoyT6pc57qn2BN+yTvfj2z1ksOCU
 futvxLFaVoV6bz7VsjBZHhB9EMbmgT8gQu6wFHcqQ+n1RSS6C6JOERXZAQzc+/9/JDsIbzwJRat
 OHvyujnu0hAMeOq6QJQWqD/ThfhhNTEJ58YKFAAxsXH8gBqOFRUWyMiRgI1VqjO8IPGOF17gn1d
 aS0xB1WEj8qS7cOKBdMv+ymxARltk5Hb1OQu8SoDAQpWyaY3rntogkTXqIP6WbgUBc/aQNlrmvL
 z6r70V7znBj2tfTFT86BLyV4ruNZqkkSQQogBk5FqVdTqT06Hg/7J+f/sIXfWwQnTVHKPlveCX9
 FqTvWRXouNWpExmMhlg==
X-Proofpoint-ORIG-GUID: XrWlLgc_eVgoezBF6S24z_9E17E673Cy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX4zKas7bJhGKN
 ZQzcMv9Sp39TEDQjp9ktXqxjsj3K62fJA/AuTJ5pbXECA+ny+GjhJkuyUpIUzYiyvNve9UiV9Am
 0VRwAHqZYlf+cMLIuDyQmo/aZPtLEZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150321

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..9f84d28d00ab25555f1d2259f7ef0ed0786a0271 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER5_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		return REQUEST_SYNC_FRAME;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
 	case REQUEST_SYNC_FRAME:
 		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -335,8 +351,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -361,7 +422,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -379,6 +440,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3b8fbefb8b93576962abd3850215f7b7fb364930..d628bc6748438b19dac01cd11cb9f8da0b8500af 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1782,6 +1782,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_req_sync_frame,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..08fc1036013de29e51747a6425ae7bb805ca3e0f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -133,6 +133,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
 	LAYER5_BITRATE_HEVC,
 	REQUEST_SYNC_FRAME,
 	TIME_DELTA_BASED_RC,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1

