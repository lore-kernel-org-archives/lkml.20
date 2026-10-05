Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A65416851
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236297; cv=none; b=g/4Stz1fP2PV0204ToTv2cLle0tCbHfSdrlvsAmDedMKat5eg6zvYrL38CwdQD6sWbK64fBoaUTRWZSFxHrP6Q5PmipLsfyBKkuH2SVY6LK2EhM0BeZx95F0rQZS5n5XGuXz870qXou2qz3cIzuax3+TIss/ubU61lzYMPBA8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236297; c=relaxed/simple;
	bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tadlI4SIY4eGUN43kzgK2AX9Rdrq4GwIaEzCT7OgGEEaJjK110QRblvKPFqcw3DrpaJjoPaNjfOSm7rtrLW6LkxByutdiNA6nUoB5k8vjt+8ZP+djYEftCB95LvqO4s0g7S5qQhjCKwLfao3D0Gs6PS7TEcNUd2z2KFJ2BkU5RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpS9MQxW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNjz/Rb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpS9MQxW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNjz/Rb7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMjSt2989218
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 21:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=; b=HpS9MQxWOZe4Uvta
	VEfZcOY2M+la3KzZP56uptd/TOmbiRPkI08gRPl3CAr/q9YJPp/bvlvjTND1HLTl
	giGK3gW47L5zEjoQ6tNcsC1F8jmhFYBp/yBaCswruGgrRRHMntUJnpW0I35mXvRG
	Rb/QWMoBGivWFFXm2P7vepV9rm79Fj8vpCIeuxiue+TlXPKWWSXsf26BvNy80tBN
	UfwYaGgi7qiUBM5l49KtuWuwq+Mo2ttsrAQNLRFoYmWvs7MYR8+begv/ocbn/da7
	brZGGMYT4mSwDxKvE9SD1oSnhLKhuFxCxHWxSCPF1zzJ3wl2qmZWXZ3nqpyaRrcg
	4lq1iw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3gqnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:38:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e650cff93so372380eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236293; x=1791841093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=cNjz/Rb7+7lyPOWIpykqLTxMJMiidHYiURLIyFxJx2xL8Yv/+HMUhDgQwIuiM/hQGX
         c5lHvfNVsmlp2WsKqbfDzI6bF1pbBUItURiQZv7IrwnixJeyxlgA50VOPMXSWqVQSAeo
         o9B4HhAeBXSjcFVMhTFdbO8ZjGrZZedDEtJyNfU9NKjg9xtF9RcB1mzWO1qJgaD0UxYp
         pyxq97wqbm0yTTj1CGs8vSzIqHJhtZIeimwpKSXvXdz+TbyBKqExa+IIscQWhTArkbmL
         OjwX8cb+AJT6WTInNMgOdWNFAWaFOrDpjYlzuYhCEzJqJ2IsgSKcUi4qlap6EXQ0jfoq
         6F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236293; x=1791841093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=mrQH5Xb3EzHIhAuh3mUb5sYvNo5hWz7Lse2L8gV/82ergbxQ7OeZ+WroNG0QcAWJ1W
         n5hLLsDQQJbsKSNNJ34dA7fXG/f0vQ2qUNYXCxCRUjX1gommfQPiVyVzekGW5ZK7jJD9
         bFdjpc86GitgUTrkf21K3VUMIhGuf/O8VZkYWTt3QT99JDuTB8GvouvlYqe6sM7HP1YL
         S7XHNYw//N+JzV+5SJvZqOUk0GM2TeL0Mnt8WEr8bJjsE6HJBwasJxAfn1VwDjUoUZ/j
         m5LgYenNUaId2JMpgOag5ywbznZhhnFlLNWt6twyIvsniUqN1AESlZmoaa6NuEHK4Wj1
         iz2w==
X-Forwarded-Encrypted: i=1; AKwUvBxnV2fcuJ4p17iHLxmG5Gjgff8DTcrUwVgtZimIqDGK13M/bXoxiGMp+BGnTFi4jKvCuUWuDf6G+yJp4/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPbDYttvmkzcjTPK6NMd4rBC5156+G5NyM/m47unipW4mpqcx9
	qUa6IbX0uzhdT3qz0YZYb37yzw7KEDY8tiORkYvQ6LvOQRpnbAhWdnFoVwYjnI8Qcxv6gggpiZS
	c/9NfFjtYRy8D6UPO9mWrs4mdF14FFeSgeuPA8BSY1zQluN58KKZ4DueCdrQRLE6UVow=
X-Gm-Gg: AYBFou2F+LgtdlCstSho6i/728brVV91Wfio6zzkgK4HilUD04MR3CTMWzX/4oXeQ5Q
	3+KfP73T9zE2xLZHF3h89JP/43KoHH236vrA8ireNVrkf2RdQMVjcAy87CT/e/9Xm9nQ/YcPa+2
	NpWo2V20cEtGE1KL7aecxNrTUEbQ9FjbhHeI6nX/+9oXDe9cZTtpRFT6vNm+xMnwL2anfPX8kPW
	qTruxfgcDI2RJR2iy9yDQkhBaMtCGVFTAypsMEwUoo454EfDDBUmHnEOdJpqfdAphic3yVC7Hty
	PjWVjWoiAwp/in85tWX6JjsmteiW2Vq1RZqNWcybO839wKccNSjO9TVHaaEhIwupiZagTM6k9sK
	otpTYIh5Z2bBhkho06k82dpBaPtONf4/EQCtWwT6kv73BV+CrpLAYYE1KLvBO
X-Received: by 2002:a05:7301:e101:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34f150658f9mr21183276eec.2.1791236293152;
        Mon, 05 Oct 2026 14:38:13 -0700 (PDT)
X-Received: by 2002:a05:7301:e101:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34f150658f9mr21183212eec.2.1791236292306;
        Mon, 05 Oct 2026 14:38:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:38:08 -0700
Subject: [PATCH v9 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-enc_roi_enable-v9-3-831c24135cb1@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=7490;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
 b=KXbKT4RcCV9iXnvZkuHdTAwyRuTyAVa/QbteG352HwNVpUngBjkuqlIYCy2UunLZmYaicknYC
 k2PFI+r78CCBNgBcgk1toVf3WUC4JbD5nfw8XUm4LclAAOymFiaeNP4
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: 6JdyDS9zD_GXZ7EFbiPkO7Oey58uE1ef
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfXx/h//i4pqI+N
 e9VoYHCMfV00gfEbGhw1m77Ub4ic4b06E2UI+nhkgeDuxzD9FXvwQny5vhTxBy2xhqlKVr3P6H/
 6YjKU3qZQMjM1Rst1noxuIOh2Empfbw=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac418c6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX1RR5UXX6x8o4
 Ir8Ap+uMVhMycXvsbB/paKPwauGj4EdBcCjAnSNC+/rdw72y+7LbtEqUJeA7I76u7urthEJsd0f
 WLNHK7QfaQrunlXjfdmWMttny2n+jdPEp6oSIzy5lO2tFpyg0NE7KcANauxjmb+EeVKzI1ArtoV
 qGBZm20oE/0y3GEhWyPM3xaEYocSCbjwNNliecDm3fThVB+FG8KKB/4nd+eKd4ISkDV1vAia3aV
 PA1eF15kHyVAv0y/erWH1EDT1y8qXLluYvm4RKDGSVVXYxjXg3M4nDWikmuHtZyAxnJduMR5Nch
 MXmgXmPHxP48UvroT1Ja/k6SQm/WSrkWYO3t224xRL89J/VjN4GNpfeZLQxJJMCN31w5LJwk4oT
 TtKUFgI8tr5MklziZ9zPDz41St32Bb+TfvaWwB5vTAnF0SI0RhcCuTaQM1iDkYQT5SBwcE7WzQr
 XiZ29TEtOqdoqlFDK9g==
X-Proofpoint-GUID: 6JdyDS9zD_GXZ7EFbiPkO7Oey58uE1ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

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

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..d97fe50d48860b0f26b71d328a704f3804b1d93d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -340,6 +348,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
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
@@ -348,8 +364,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -374,7 +435,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -392,6 +453,13 @@ int iris_ctrls_init(struct iris_inst *inst)
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
index 79bbd06ef8d2be11582a6b81da3104b6273f7250..0f4c6f955f4f408c45c50796332b47c116f52982 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1815,6 +1815,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
 		.flags = CAP_FLAG_OUTPUT_PORT,
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
index 2b8b057d35a9bc4d611fc9251c95762316a21062..2394213d8272b53bf6a1cff9574dc93f6830fc8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -135,6 +135,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..72a7bd5a7570f53a73037d49736e95664af180a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -222,6 +224,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -231,6 +234,8 @@ struct platform_inst_fw_cap {
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

