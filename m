Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8D3F1052
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656107; cv=none; b=FN3gyU9owZPhnMWGvwhaY5vjrJHd/te9MufA3sRyvp8ZNA+dNgKX6SwiVpNXsf23df1Ybz4ZqN72c7/qwhH8VHP4CITsoHE9Fk3c8x7NKxj0zEBpYZWXHqcmDMntnur++oW5URiuVr/rbrQqkNxyFLWFFGYBjfrnnx2DG7F+CYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656107; c=relaxed/simple;
	bh=SN+dkgRSxpF2IZTqvM/BPQNlsRDYvRLLL0stb9WMlwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLUsYvBH/wjULkQmpxxlsyxEFcEagwfGYVaMiXd0Gvh5JcDHEjyRKGAGK104hdubarFvWR5B/Ukmb8s/H6emyNTkN9LeBlHiZadTleXah9H58mtlV7lREoiLI5LKv05tP10QuwxoHb66fsr6liavv/bLlqbvSM4ItwGdmtSz96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0udi7MR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpRVKv5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0udi7MR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpRVKv5T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Yc33242098
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LJSCrYx5dwBDnf56R7yDbjm03ET2r6JIThUX1qNaxQ=; b=c0udi7MRrSNldbyO
	vp2c31+7cJVdIAhA6/f66AoEeMjUXvDBoa6UjSP5WbG6tq+vjYZl/nv8jqUDG30s
	1exgbEjWOWqaPoTcWvzOTh/2GLKlrtY2x1mE04UF/EpTfAlZ3jdaNpxjmnC3h0qe
	nIN1jBk75Y5/+aUCjhxHPqmbQsN1KDGXr/uCX2nOlKqH7qhdCePveprcDMsxpseG
	SPNsqEOLRsebf9JtOzLqV+dbAsH6FvB+epe6jtsF9/xRU5Bh4/VaETQfFg+10Xr4
	5SZzf+hybOYbg+LqM7SXA6NeUiirQIdBURLkPJxDkyOFu5tgZvvU6CMmREZolzHb
	DqvBwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91442ba2e46so59986856d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656101; x=1791260901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LJSCrYx5dwBDnf56R7yDbjm03ET2r6JIThUX1qNaxQ=;
        b=MpRVKv5T7DC1fSL7r+nJrDrXlGPfuVpDJgDyJ2TslXDEfLbSJ5FqcjPgFFDLn+zWsk
         Lbw7UYUqd0sD6YBEPvkgX4pYRSauj2B9ygVNIvDSlf4nXwu2JkKg00AMKjfrpDuCuynS
         gsH2X8KVNSLBfQOWqBpdsbG81YVXYQUt4jKhCRpFEaSQiOvQ+GVMynHnWJ3fbG5eqOfm
         wcHe9pVb8s65abdzi+NWrc8QA6S2RBDovSXMAWLmIvEOJrmiTHbp/iLIRDuRSXRVWZq9
         Dc2+cl5KcqAclJAPc2wfwQcl1J88Mht8bpAoD+AxAyUj95dNyilVr99qylQEpSKaxpro
         CTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656101; x=1791260901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LJSCrYx5dwBDnf56R7yDbjm03ET2r6JIThUX1qNaxQ=;
        b=kNwCqbpYa3OoV4GT1mVZHRPSxamHFhzIz4LIfvFeMmqsy/OTCh1LfKDJnLU6u1+who
         MOYOtIoUUcZS5zCUPYlZCQ6bZvLnk/AUTBz6rGJwfgXRqyaO+4S1pgsv1D3hi1mDb7Zz
         XTJ18325eDnuOi7TNE2labixKvVAkrE+lzYhqoQjHTpw0q39bi4b2dZtPotcUQlPVPev
         9dbecSF4zITI+gCERwyZLNODd9iRw9OwPiNWSSWU0CDf/ki/Mj7uQKLtVYOx5KoCUCBm
         8xzmfFx/0siVQA3IzuNqeZZNR5P6d/eXpyiQd6D+cpGWLrAxZJSKXqx6QP6F0DQ5LtRr
         7TiA==
X-Forwarded-Encrypted: i=1; AKwUvBx2iRfZgZAKB8CzHSBdXqrDls4UqSakO7yTxdE2U58yk1Oag4pu+6fDlo4i9ls2y4pIeP0xMo+zSeuH7w8=@vger.kernel.org
X-Gm-Message-State: AFq9FYItOrRcnlWJvJBfqEntwjNUu+ooj7npFcZg5kv+fyg1Fn8T9Udp
	siYIw1fEuOosr4bU63savOzFqkkmbwSizBI0s7mg8rYxuV3yaJkTwO6N7mLS729OLn7VnmMP7X7
	DGfDlWUw8OX2BPSn6wangoMNNmPySp11kV4H+NWSbTKZzl9wtXxMoMF9/tTlAecoktWo=
X-Gm-Gg: AYBFou2gjVi+qnP+0COuwEWH3n2T81CSpLlwrBkssxJX9mLthINyOWWzClz35wBRKIM
	CGO4hEfVNy265TtmxI5MCzvZv8imaXIKqdykz47ojNsoNO6bFrNZfM8FTwNRCepdOeJbUu2HP/C
	rRXueb/2QOyjZY19gIoWGUFCptxw+kgWA7mtqoYMtajiZmrU60ORZIkaIlfHp7a/qiItlp4yu9d
	+LAzsQw/Bm1hvM1NIAOOhMxJx6SLPzXj3WENRnO3xir9ccPB0G/je7eFim8nJ9BQP8dsSHPU4/F
	eW/HDM9fLD7pEaF0lynLBlarsfgLMN1+V/gxcrOcRUaIokbBr3ZTp83pSTLDs3Q6mMmMM4gX64r
	9moVGAhzatSTd4papkcWi2PRIZ02kWxXaQ7ZOgKXH5pbzvqgCbxyBM9T8Z8L1N9A=
X-Received: by 2002:a05:6214:f22:b0:914:4a49:9ad1 with SMTP id 6a1803df08f44-9144a499eccmr179964516d6.9.1790656101051;
        Mon, 28 Sep 2026 21:28:21 -0700 (PDT)
X-Received: by 2002:a05:6214:f22:b0:914:4a49:9ad1 with SMTP id 6a1803df08f44-9144a499eccmr179964276d6.9.1790656100557;
        Mon, 28 Sep 2026 21:28:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:20 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:48 +0800
Subject: [PATCH v7 24/35] drm/msm/dp: add atomic stream handling for MST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-24-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=15053;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=SN+dkgRSxpF2IZTqvM/BPQNlsRDYvRLLL0stb9WMlwk=;
 b=XaZcY+YeWGVWbgNUHZOaP+Ef073hfe8zfKf64ZMmOHa7x0ujYWznVeTB/b3Yx5U65fyx6nglF
 9MoCbwA+YLKDSCYxYkQPI9YfcyhjEdas3ak48QMcuXiEsnnQ3wPOP1S
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8HXE5kMUIlvK
 90WzvsLFUZG/Rl0NTcIBXxODUAw6PsKBywr8fhhBtI2dnhiKoXt+rEXvZOKAhSU62d6aq86K2wI
 eilndSWD7jCsVSBuTRWlAVUpj/+LODUVknwRqj9gQ5STXHcrJ+jEtnkLjwJD+WWYDL08a5lrNsU
 flokMg+HTEynWH92iNawTCAx4qHkfXDN2nhudaQbbWCbSi3D+sbhz2pwozx8Fq6LS7+pycjjyQn
 u2E9Am+3uEeCbN0h6l+TYss/zjSx6TX+ukBRyOk70iZyjl8MHD3atO+nxV7zqJlpa6BWINB7mFC
 c1F5JfoUDeC4MrIU2G38+fVTKJ5uwuSE0oB+BICHRU5PGYUG8PwEP7Kl/58c07kJm11J1VNdnfN
 i7/XJrOPWj2G2HD/rcmsk/LTLIbJv5i+wB3La1odlXQVoMxsxZqH5FhvuH/uHgvI/BPOImg8RRG
 42UaNS74kCDF+Cc8rzw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rZU0s2GuZPBXI8FFSQwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nhd6QesYwKcjwJnZIsHQE1TfUuO6SO00
X-Proofpoint-GUID: nhd6QesYwKcjwJnZIsHQE1TfUuO6SO00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXxVGVh3JSf9HH
 lSvttDOYCLCHM4oI2f+3F0iDYLS0vRpc7vso1799C8Gu7IxcQ6pSrelGE19g4pSKVBurksx+mSu
 I2BLXVdlepddP4/IZoUrXxKg6oyKIxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

Add the atomic check, enable and disable operations for MST streams.

Reserve VC payload bandwidth based on the negotiated link parameters,
and update the MST payload when enabling or disabling each DP stream.
Serialize stream updates that access the shared MST link state.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  13 ++
 drivers/gpu/drm/msm/dp/dp_display.c         |  13 +-
 drivers/gpu/drm/msm/dp/dp_display.h         |   1 +
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 198 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |   3 +-
 drivers/gpu/drm/msm/msm_drv.h               |  22 ++++
 6 files changed, 247 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 533109b4365c..933dbfd30b56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2747,16 +2747,29 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
 				      struct drm_atomic_commit *state)
 {
+	if (msm_dp_mst_stream_enable(enc, state))
+		return;
+
 	dpu_encoder_virt_atomic_enable(enc, state);
 }
 
 static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
 				       struct drm_atomic_commit *state)
 {
+	msm_dp_mst_stream_disable(enc, state);
 	dpu_encoder_virt_atomic_disable(enc, state);
+	msm_dp_mst_stream_post_disable(enc, state);
+}
+
+static int dpu_encoder_mst_atomic_check(struct drm_encoder *enc,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	return msm_dp_mst_stream_atomic_check(enc, crtc_state, conn_state);
 }
 
 static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_check    = dpu_encoder_mst_atomic_check,
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_enable   = dpu_encoder_mst_atomic_enable,
 	.atomic_disable  = dpu_encoder_mst_atomic_disable,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f5947233ab96..4a3ca1bf05a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -453,6 +453,16 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
+bool msm_dp_display_is_plugged(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display,
+			  struct msm_dp_display_private, msm_dp_display);
+
+	return READ_ONCE(dp->plugged);
+}
+
 static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -1293,7 +1303,8 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_mst_mgr_init(msm_dp_display, msm_dp_ctrl_get_stream_cnt(dp->ctrl), dp->aux);
+	return msm_dp_mst_mgr_init(msm_dp_display, dp->link,
+				   msm_dp_ctrl_get_stream_cnt(dp->ctrl), dp->aux);
 }
 
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index df5021ba7c15..0bf5ff5e7815 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -66,4 +66,5 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display);
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display);
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
+bool msm_dp_display_is_plugged(struct msm_dp *msm_dp_display);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 88687b97ed6e..fd8fd6fd10bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -31,8 +31,11 @@ struct msm_dp_mst {
 	struct drm_dp_mst_topology_mgr mst_mgr;
 	struct msm_dp_mst_encoder mst_encoders[DP_STREAM_MAX];
 	struct msm_dp *msm_dp;
+	struct msm_dp_link *link;
 	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
+	/* Serializes concurrent stream link-state access across streams. */
+	struct mutex mst_lock;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -133,6 +136,45 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
 	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
 }
 
+static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst,
+							   struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].dp_panel;
+	}
+	return NULL;
+}
+
+static void msm_dp_mst_remove_payload(struct msm_dp_mst *mst,
+				      struct drm_dp_mst_topology_state *mst_state,
+				      struct msm_dp_panel *panel)
+{
+	struct msm_dp_panel *dp_panel;
+	struct drm_dp_mst_atomic_payload *payload;
+	int i;
+
+	msm_dp_display_set_stream_info(mst->msm_dp, panel, 0, 0, 0);
+
+	/* Apply the slot shift to the remaining payloads. */
+	for (i = 0; i < mst->max_streams; i++) {
+		dp_panel = mst->mst_encoders[i].dp_panel;
+		if (dp_panel == panel || !dp_panel->connector)
+			continue;
+
+		payload = drm_atomic_get_mst_payload_state(mst_state,
+				to_dp_mst_connector(dp_panel->connector)->mst_port);
+		if (!payload || payload->vc_start_slot < 0)
+			continue;
+
+		msm_dp_display_set_stream_info(mst->msm_dp, dp_panel,
+					       payload->vc_start_slot,
+					       payload->time_slots, payload->pbn);
+	}
+}
+
 static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 					struct drm_encoder *enc)
 {
@@ -145,6 +187,156 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_stream_enable(struct drm_encoder *encoder,
+			      struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+	struct drm_dp_mst_port *port = mst_conn->mst_port;
+	struct drm_dp_mst_topology_state *mst_state =
+		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_atomic_payload *payload =
+		drm_atomic_get_mst_payload_state(mst_state, port);
+	int rc;
+
+	guard(mutex)(&mst->mst_lock);
+
+	drm_connector_get(connector);
+	panel->connector = connector;
+
+	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] stream:%u set_mode failed rc=%d\n", panel->stream_id, rc);
+		return rc;
+	}
+
+	rc = msm_dp_display_prepare_link(dp_display);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] stream:%u prepare_link failed rc=%d\n", panel->stream_id, rc);
+		return rc;
+	}
+
+	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
+
+	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
+	if (rc)
+		return rc;
+
+	msm_dp_display_set_stream_info(mst->msm_dp, panel,
+				       payload->vc_start_slot,
+				       payload->time_slots, payload->pbn);
+	drm_dbg_kms(dp_display->drm_dev,
+		    "[MST] stream:%u timeslots vc_start:%d slots:%d pbn:%d\n",
+		    panel->stream_id, payload->vc_start_slot,
+		    payload->time_slots, payload->pbn);
+
+	msm_dp_display_enable_helper(dp_display, panel);
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+
+	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
+
+	return 0;
+}
+
+void msm_dp_mst_stream_disable(struct drm_encoder *encoder,
+			       struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+	struct drm_dp_mst_topology_state *old_mst_state =
+		drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_topology_state *new_mst_state =
+		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_atomic_payload *old_payload =
+		drm_atomic_get_mst_payload_state(old_mst_state, mst_conn->mst_port);
+	struct drm_dp_mst_atomic_payload *new_payload =
+		drm_atomic_get_mst_payload_state(new_mst_state, mst_conn->mst_port);
+
+	guard(mutex)(&mst->mst_lock);
+
+	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
+
+	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
+
+	msm_dp_mst_remove_payload(mst, new_mst_state, panel);
+	drm_dbg_kms(mst->msm_dp->drm_dev,
+		    "[MST] stream:%u timeslots vc_start:%d slots:%d pbn:%d\n",
+		    panel->stream_id, new_payload->vc_start_slot,
+		    new_payload->time_slots, new_payload->pbn);
+
+	if (!msm_dp_display_is_plugged(mst->msm_dp))
+		return;
+
+	msm_dp_display_disable_helper(mst->msm_dp, panel);
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+}
+
+void msm_dp_mst_stream_post_disable(struct drm_encoder *encoder,
+				    struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+
+	guard(mutex)(&mst->mst_lock);
+
+	msm_dp_display_atomic_post_disable_helper(mst->msm_dp, panel);
+
+	if (!mst->msm_dp->mst_active)
+		msm_dp_display_unprepare(mst->msm_dp);
+
+	panel->connector = NULL;
+
+	drm_connector_put(connector);
+}
+
+int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(conn_state->connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_dp_mst_topology_state *mst_state;
+	int bpp, pbn, slots;
+
+	if (!conn_state->crtc)
+		return 0;
+
+	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->active)
+		return 0;
+
+	bpp = (conn_state->connector->display_info.bpc * 3) ?: 24; /* fallback: assume 8bpc */
+	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
+
+	mst_state = drm_atomic_get_mst_topology_state(crtc_state->state, &mst->mst_mgr);
+	if (IS_ERR(mst_state))
+		return PTR_ERR(mst_state);
+
+	if (!dfixed_trunc(mst_state->pbn_div)) {
+		mst_state->pbn_div =
+			drm_dp_get_vc_payload_bw(mst->link->link_caps.rate,
+						 mst->link->link_caps.num_lanes);
+	}
+
+	slots = drm_dp_atomic_find_time_slots(crtc_state->state, &mst->mst_mgr,
+					      mst_conn->mst_port, pbn);
+	if (slots < 0)
+		return slots;
+
+	return 0;
+}
+
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder)
 {
@@ -284,7 +476,8 @@ static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
 };
 
-int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
+			 u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
 	struct msm_dp_mst *mst;
@@ -296,6 +489,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 
 	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
+	mst->link = link;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;
 
@@ -310,6 +504,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 		return ret;
 	}
 
+	mutex_init(&mst->mst_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
@@ -322,6 +517,7 @@ void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
 		return;
 
 	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	mutex_destroy(&mst->mst_lock);
 	dp_display->msm_dp_mst = NULL;
 	kfree(mst);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 3cbd2a674675..822d34cd6ff5 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -7,7 +7,8 @@
 
 #include "dp_display.h"
 
-int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
+			 u32 max_streams, struct drm_dp_aux *drm_aux);
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2ada4a7c1c08..9d67425fecee 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -362,6 +362,12 @@ int msm_dp_mst_register(struct msm_dp *dp_display);
 void msm_dp_mst_unregister(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+int msm_dp_mst_stream_enable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void msm_dp_mst_stream_disable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void msm_dp_mst_stream_post_disable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -415,6 +421,22 @@ static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_stream_enable(struct drm_encoder *enc,
+					    struct drm_atomic_commit *state)
+{
+	return 0;
+}
+static inline void msm_dp_mst_stream_disable(struct drm_encoder *enc,
+					     struct drm_atomic_commit *state) {}
+static inline void msm_dp_mst_stream_post_disable(struct drm_encoder *enc,
+						  struct drm_atomic_commit *state) {}
+static inline int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
+						 struct drm_crtc_state *cs,
+						 struct drm_connector_state *cos)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

