Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D103D6CB8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164300; cv=none; b=f27QKaHZCgN2JyowmUw3fB7PdHygFJdc0wB6FOsD6R90pSGxaWTqjLzL9cagglkfy29X7ck1jjsEOsoUFzvj2PKvejVsiBPt9EXK20bs4uCVMWtO9WI6PAFiN6D78E0Es6adtj6DaXV1A90fNb47Ore640UMmPSttDR99KCI7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164300; c=relaxed/simple;
	bh=P9U2eQjgGLDSD5m5xIoCS4u805LtmPec7xTvh3GkRAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHh7bN1HJwOw9kLNGjh9jsD2Uuc7c0fT9jJePYYfOzZhhbQ1arCqXx8D5boSwYyxvWa3l2T2vF+FJBUeF5Vwp23Sr+qJ7Q4xFXfr9LBFOJ/4RULKodSGXpxBHFxPRZAPpHaW/7dLYHr+IzkZgSHIZrek87Q2MEVUnWVKxhj4cDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+wGJJ1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNRr+rde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+wGJJ1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNRr+rde"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xhdi2419562
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=; b=B+wGJJ1/FnsqFtEL
	0rJtKSQNhLwKjsrLqOckXUjaptctSukdF4qzXcI350+S8fwiEKnVpStbAvGXtMUg
	i1vD4l30uc3MjCTLmK0Qp/XRQeZVgIFlUOVwuxdTfD2Oe+in8xEXSuMtj5YIz5+K
	imm6LygmDc9QgU6bbcZ4DNNhfp3m67KCEODtQuzA5swN0HFq/P1Kt5L8vUVC80tX
	OKq+utghVGgbjTnmH0qmlmw4TP7BCotsdGka7gCg+pNMkOC7UBEiyw7LZiOPOQbE
	/dXtTGBPtrrYx0c6CBeaPp7jSHomrWTMHshun/eEeVvLjgajDQ542ZWxjKBKbzE1
	RyOgAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nc00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so768227385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164296; x=1788769096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=;
        b=dNRr+rdeU9n07GUy/DKhx8dB3seF+uWC87wmf5jentPjhsi1PA7Qr4fn/k90OD/ixJ
         /rQW98gZXMTJCm942Gve6e/JHCo9gu+NY2NFO3kCz8PUdIv5XnP0I/eKKrjJEmepnEEY
         abKDeUCfIZHkjpT9bWBdwjvxrsDjbGUv2JK3q7bSAcUIWqNwCqHRAv2coHOd2lig7Mzv
         idS1N/y+ZciAoTYO44mhsGsLJNL5se6vksQUeIULt2GoFk8Zdf2lrbeIPgL/j/PtpRDm
         bpiy06YgIEgRPKPrw6sI6E2mhHxXDHE9bBfO5iHB7jMtMHhYpFKfo5QjzZYkNdyOSLFI
         IvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164296; x=1788769096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vdjc3+rjJj58blQFSoJZYcb5Y/iCkxx6iMnfNacsF5Y=;
        b=G2tagM9KVe5BRdVqEYGFhejeR5ONNdiOd9+nfzxoU61EYpqP9ojHi7kUuosjwCOTVP
         dXV1oCbN89I+aBMikxrxmIM4FaXDMMu9hPx84o62eJlUQQazZimum3M9CGNiBKsKLC3j
         /nEIZdsesnwNKcatszJfOu28JirG5/Whp6czEWo9Zx+iy4SqCis5EWjwTH5Hp60yARM9
         Inxlox17Zy0IOC0yvWVkF3n1CKL1IfmTEGbZ7y34WmR94EpWnkAriy9lt9KXVLit0L80
         fOQq+Wi7+ObAVbAQEpXgb7/m1sbJzd7Rj6oJTXw33FAgUtuVKxSUB4PSkIpe0O1T/g/Y
         mhUg==
X-Forwarded-Encrypted: i=1; AHgh+RqlUGy/QIVpN7hOx764qT4IkgsGvxOAs2dAwEKvuPSKtyK29VVaCg+PzgJUMK8HtMFNqa/Od1uS1f0UOJU=@vger.kernel.org
X-Gm-Message-State: AFuF++lM7wkEqhiiQaN8delYZ1AI6h9gsKbSsKvE79xWY6xIRHzqUHp+
	U5BjhNvFmFT5Qf9x4ZZ80DSbdtKxGJBQbwBaJmsEHl133DNbX0cpJ4icUtPZnEXcqwJWyNw1ZZe
	Z/wEfsQmgrld92WWy7Qr42QbEJbZxL/yrerRrEhFyOdg9JFlLjoKGEI7LBlBGWS4dw2N0FJ75K5
	g=
X-Gm-Gg: AR+sD10vjHDxMKMxDXVhCjky0vYDTaX3jRvnnmH7dSCYEu1ddMSExEUSSFRisEKhAr9
	Imn0JLAghH/BHnuranG/uj2VCAEvgYJCoj2ljiDxKdaC15+2jw2ET+TeiV8NH64mJvliGs1tNON
	PJ3r/EWt6tp0P6s+TNiU0qDWx3ogs21EuzA8VRwEpuatdNl2dMx2/jMgeyxEq0HwULluDvIxMDt
	b8taIj5f1iouLFkOropiIsutqa0Dn1X30BoRmUH9MeVKn/E3U/7vRt4/pctv10NP5sXoiHiV9Z7
	+a449mzSfJaNWZTY5bcaC7i3wcDS1JFipvivU1DZs3RT8MIhQkIlTHr1fm1OSUhdy2UxcbAqA2E
	i76AP34m2/P+z9cMmG49WwfavPyrDGLb8mplcHyN6QpnKw3Oi96V3ZK6AGRRpbKk=
X-Received: by 2002:a05:620a:6cc8:b0:936:e71a:db90 with SMTP id af79cd13be357-93942b97360mr146705885a.29.1788164296453;
        Mon, 31 Aug 2026 01:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:936:e71a:db90 with SMTP id af79cd13be357-93942b97360mr146701885a.29.1788164295982;
        Mon, 31 Aug 2026 01:18:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:25 +0800
Subject: [PATCH v6 08/29] drm/msm/dp: add support to send ACT packets for
 MST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-8-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=6775;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=U2HJX94D2BMOjeBdupbd3D8LR09HYGpVTExDGNEh2ho=;
 b=pbf2MwbOo3Vwp5OzIsEgs/kPMFt+AgoN8+PQ7up6iAA7/eZdBLAI/773tfEXX4Ymp7AKORHyA
 2sjX0sOrwsuCZ7num2gN2SmaqmJhkLU/+HAGFrDZ0u0k7jo9YCyej7u
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ZYy_Qyrc7tlUj5clgio96KuUFL7L0_hJ
X-Proofpoint-GUID: ZYy_Qyrc7tlUj5clgio96KuUFL7L0_hJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7F3KyLCioe5K
 OdGkHc6mhBhH/tcoTIbUSEhTQQv0FxnNXAec4rwZOzTr1igFDXKwvCHgNEU2KR2HOUCTg+y+2iN
 HZn2FbBGGBhIzlYXPkXL936adcCjAZATX/NbA+ekCKY5fTfY8qVVhPMM8MW4uIeKHkBORB4sMlJ
 /E4uCjx1M2meZGcUBCdZkeu63n9P4TGgm9+FVkjv9imC12fNi/6PnkFr9ISR/hPrZJhQaeASHHZ
 a2n4uMNewW+MLef4Kl4ncoc1MpsXfj2mCeKJv1exhWvjy/emwf1eleFW439bVx+2et8ZtKSHkgX
 HBDbUQhFHnyfHzI1MqC6ZFk2MAF2kv4Ys+rY0XEjvPr7Msd7MjG4kQ/ZsJYV90SO++OZf0D6YFo
 G+4Sw7/+voj5Ztq4iAnTqiA9U/iNoH/7IuZih6y6ACEYQ1e+IMotZgOfmTBPhHnHq/3YdbE+nK6
 e7+eyoICL3jEZfWUjHg==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9538c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7QNGoGyaCnsE
 PZlLrV7vKx9teimXSI/1GkM+0qMXK9+eo/oUGQXk07bquHmiK9rAlGM0vdcsETxilo7pCTPSndn
 SiBbpwGMc/x4pWpuTOmiMaPohWnVjgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Whenever virtual channel slot allocation changes, the DP
source must send the action control trigger sequence to notify
the sink about the same. This would be applicable during the
start and stop of the pixel stream. Add the infrastructure
to be able to send ACT packets for the DP controller when
operating in MST mode.

Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 5 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e1614bc49a7c..65d22505c2b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
+	bool mst_active;
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -244,6 +245,37 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return err;
 }
 
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	const struct drm_display_mode *mode;
+	u32 frame_time_ms;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return 0;
+
+	mode = &panel->msm_dp_mode.drm_mode;
+	frame_time_ms = DIV_ROUND_UP((u64)mode->htotal * mode->vtotal,
+				     mode->clock) + 1;
+
+	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
+	/* make sure ACT signal is performed */
+	wmb();
+
+	msleep(frame_time_ms);
+
+	/* Hardware clears this bit after sending 4 ACT headers */
+	if (msm_dp_read_link(ctrl, REG_DP_MST_ACT)) {
+		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2614,7 +2646,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2626,6 +2659,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	ctrl->mst_active = mst_active;
+
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
@@ -2657,6 +2692,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
+	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
+	if (ret)
+		return ret;
+
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
@@ -2694,6 +2733,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
+	ctrl->mst_active = false;
+
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
 	phy_power_off(phy);
@@ -2873,6 +2914,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->link_base = link_base;
 	ctrl->mst2link_base = mst2link_base;
 	ctrl->mst3link_base = mst3link_base;
+	ctrl->mst_active = false;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 80d9258501b4..41a69447001c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			struct msm_dp_panel *panel);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel,
+			  bool mst_active);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
@@ -59,4 +60,6 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
+			     struct msm_dp_panel *panel);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d0fc4ff508dc..52c13823e8d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1497,6 +1497,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 83117e7619f3..472429d09200 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -19,6 +19,7 @@ struct msm_dp {
 	struct drm_bridge *bridge;
 	bool audio_enabled;
 	bool power_on;
+	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 265da58e064c..9263e61c794c 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -330,6 +330,7 @@
 #define MMSS_DP1_SDP_CFG3			(0x000004e8)
 #define REG_DP_DP0_RG				(0x000004f8)
 #define REG_DP_DP1_RG				(0x000004fc)
+#define REG_DP_MST_ACT				(0x00000500)
 
 #define MMSS_DP_BIST_ENABLE			(0x00000000)
 #define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)

-- 
2.43.0

