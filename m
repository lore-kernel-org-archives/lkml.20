Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C13F1052
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656097; cv=none; b=g+NHyhkwhcPYzrx4yYgIKbWTpbGNfXQZtBLqBwKfvdqkaLDg/0CLWsV6PFPkgIlmg8XcO/CoVJmoGXosaqhCLLCTTruV1JtCLNjGpy0ip9MPLGJuh/OetQyBDKCspn327O+ts5P/ebFdY1rUwZztdtlvbNYRZrgbS33PYhrgWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656097; c=relaxed/simple;
	bh=wezbFnUlYwHSAdgz6OuNbhIHKZDuCPLdGEa0D+mcpPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/M8VQ1DEOitEGxxURugNbvvWf9gDN42yxxK/prViPX3rujqI+pw4kH3EoqPKSe21tnJqlfeDeh+VbPBKfxhDyN3c5Jyc18JSD1trbJH1tom97aNie7HNmlQle5FfrICWB2BVb5wvCRCmYBFDwQGiNZBfU2T/l3GjVHRdvKXUTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neNOHP8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SykJ26m+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neNOHP8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SykJ26m+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Yc13242098
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVPFuH2DQkRwMnrIh/KSvlGPv4zX9Dc4RzW/ouSgoAw=; b=neNOHP8WLYdzeVLw
	kb1/2+yET551u1nqqvZYqoi06xw2sRfbzB+vYZLqa8ED4HE4yDsedzxtFbzjWX+N
	iUTE/KttezvndcLrRVEpkqb5xm0diQ3TyK5l0aOrTg3ZYYujuRw5RwDTdO0q77Py
	b6Va1gWjXMKezMyvbJ6KrAZd8TwGtyd9QTvrl44AYcCm5N7ua2hxveBwg1ujqh5i
	VjcZcGyIZKepLfyKEmlaLUwAXLzfQ5/2aennEibS03rIpJrEIl9u/juDG/2srOty
	kpr8cyaROW0iaQ5N26cOsRZst7HYBdeJuu/UpIqRmKioAnuPOanmia4cQ5zRzv81
	5e6jcw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9143a95c6b9so14029326d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656092; x=1791260892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVPFuH2DQkRwMnrIh/KSvlGPv4zX9Dc4RzW/ouSgoAw=;
        b=SykJ26m+zxZH0fliA0xujNZ4mheZsEn0gmyow1BhtXczV8kvzq9wk9SbU+uYGiuf90
         fOU67nnKsUD1GRhu6uvH6dUff8zecIp3+0VliiwTJKKGJKpeu0Lxma3aABh72EPOYdpq
         P6yW7Q9sqcMkPngwiLVgOF+g/pj60J6Q/i06YBTlGBqzrIDoFrPlJNRhoA1oFlAz5qMi
         1+njLVPKjb4dBscFEcn8WkGYow8mgTZyqxEdH/2EZ2HjlJlnqhYMpGvvMXaTjdj0pg/u
         0cVr5uLVjN9er/u6tPCRPeyBXYb6J4QhgWSKbnZ1IfFofCEopKFB6+QcTr1hDYdYqcYy
         cNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656092; x=1791260892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVPFuH2DQkRwMnrIh/KSvlGPv4zX9Dc4RzW/ouSgoAw=;
        b=f/5A4OUDTg5kn8ezVYVtFAMoqKKS1yHN0yBqYJjpCHWvFFZN7bgvDuJFyXtd5y8oX5
         Nz8w3qhQwnwxzqXuagBs29FcW7oBVknl45W0IS3CWQtD+l/eDfZdA/VxM7XID/gqaG8d
         Q1PVTt+VeqjHY5bULeInt6Itz3IE5qhuftdMbsvc8umlq76saHgsBaQwj2wmgyP2bK8u
         7Ae3hHS4h/jOzBQi0X/66CJx0jy01NdQKlBux9SIwkBSQjE6euhFPru4VNz85Q1s5Vec
         Xj5SWn60SkKJ3iWxaawTHWLo1rKyQrO+6iivwwC3eoC76LkwOykJGJZtumZ6pS6lpYmn
         EexQ==
X-Forwarded-Encrypted: i=1; AKwUvByzcM7Q9YuiKadzOtW4ZEi6u9X0BicQ/nCtEGZQOfqDvvrDdQmOH+GylgMHlqgWyzRtFVL/js9CFgMo1gE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRDI5RFys5R+Bq7wRSkl8Gj0gbutHGmqQiJI2sIBRcscejwHrX
	xJrkSFuBXJ7UkjIUcv4/53tJcwc1qdZjbsIBI3QcLfIQFtSc0fl+EFiY5Vns8d/df7zwUQtYY/N
	wDu+JiBGzBzJb1DV5kt7959y2bCgMfHkYTViebF7BFHbxcA6/bXRxIFGW3DibZyOUysk=
X-Gm-Gg: AYBFou2YkoZ4Px5i7/8Sh5QPCkShG0SCy1N4H00j0g93QpMQqQrhlp4CpICHZCEumZO
	n51LNivkdnoCwQUdzJ6nPcOS7JTfDNthIJ/KA4xLfFL7eA2jqn1bez7RmXWxgz97puEVBKVHmCU
	/jPUmuPFK426miyXLxsJfIPSS4Res0llr901oQ+gqpdL8KrEkAQAKnLnEgzWNjufR18uoPiZlLO
	/d+rVBbRd1dL6LtZEXfWoQBAgOTP53nUm8oPLp0xW9FdKyUxfqZIkNooShnQM015a72wisnSZqF
	Q1X2FHxJV14rSLm0wVSlTcAUkzIgCMWcboWabgB7vlB6s7jlThFcJCoJtsSC69eCLbozv2XXlNv
	h0/nY7qnSe1AJgHBsFEGDARhoV3mBYkolHqm/iZztaPqMKE3AmxDahunz3U0jEjg=
X-Received: by 2002:a05:6214:398a:b0:910:3453:fc0 with SMTP id 6a1803df08f44-91786490625mr24735756d6.16.1790656091810;
        Mon, 28 Sep 2026 21:28:11 -0700 (PDT)
X-Received: by 2002:a05:6214:398a:b0:910:3453:fc0 with SMTP id 6a1803df08f44-91786490625mr24735556d6.16.1790656091361;
        Mon, 28 Sep 2026 21:28:11 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:46 +0800
Subject: [PATCH v7 22/35] drm/msm/dpu: add per-stream MST encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-22-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=5908;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=wezbFnUlYwHSAdgz6OuNbhIHKZDuCPLdGEa0D+mcpPU=;
 b=d38Kjkqv3uyhb1W1EuXYnxxylfq+nfXcRfL1NOLPspJ1wgS9R49dtegJhpDri/sQANyF8eNvJ
 RtZcqyKIhtPBTed7NX+hG6FUVxr0WyXdh68EcMFtx3YhSq9hnNBeXT2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX4wuNkYCnGJx/
 WPFFFJXd2PgCW/TP3OFSyT2KiJ4Kd9qQ29KCZc9JVFAwAyfAfFhSd1PkaX/F0LlzoiJ0fED4e2Q
 5IdF3M3ijlrw3+CK8jWxbZm/arG36zfifgMIgAK9cD59fG/gmOV8CDTk4ZNe/dDTZu9SzYv9mRu
 +2jeJPOqel/DNcw3On+Y8Ir8R+8SnLs6RPzQzY8B+6F4zMbHz7vq81VdRQsPyGMXnmgJK+r2UrQ
 ByfsMIDvWlSesbB1HBCZhHPF4Ghc/fIvZRAAH5p0aIkoT+B6qb+oD2jKjFv2Nec1UNtXlYgb5hF
 r+1xPQ77u9Ia8ZingNITjMeCn+N1Uz0r6r3x3QwNEk9Ik5Tkw/QwMJ73PaV0Y2ZO+VflDx5DXEb
 v5um7fvWtajnL9lVEjplZ3jUN1U3gNLTxRsSuc6zSrEQS4DVmts64eUK807Z6iW1ytdvkPqnJyc
 mEj18AxwV+7sqeERZyw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e5c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aoVTMipVTiCx4Xnk7jUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hnfIYlM1luA-08Q_15mz5Ig51TngAmT-
X-Proofpoint-GUID: hnfIYlM1luA-08Q_15mz5Ig51TngAmT-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0xBBhCjBoMs/
 oQAU/0cZE3ORc6UvqwD3TiQHO8cWSJ9BOy+n0kIRELkH9H0DCb3cppmIZk8HS4Mvv5X4RX2hpbH
 w4sABGhLLIEttAFuH1pzmYY5tItda5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

Unlike SST, where a DP controller is represented by a single encoder,
MST requires an encoder instance for each stream.

Create one DRM encoder per MST stream, associate it with a stream ID,
and initialize it with MST-specific encoder helper callbacks.

This establishes the per-stream encoder infrastructure required for DP
MST support.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  9 +++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 004d5fc460a8..533109b4365c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2744,6 +2744,24 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
 };
 
+static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
+				      struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_enable(enc, state);
+}
+
+static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
+				       struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
+	.atomic_enable   = dpu_encoder_mst_atomic_enable,
+	.atomic_disable  = dpu_encoder_mst_atomic_disable,
+};
+
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
@@ -2769,7 +2787,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (IS_ERR(dpu_enc))
 		return ERR_CAST(dpu_enc);
 
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+	if (drm_enc_mode == DRM_MODE_ENCODER_DPMST)
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_mst_encoder_helper_funcs);
+	else
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7ee4e7e4d34a..4e18026cdff0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -688,6 +688,21 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				return rc;
 			}
 		}
+
+		for (int stream_id = 0; stream_cnt > 1 && stream_id < stream_cnt; stream_id++) {
+			info.stream_id = stream_id;
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dp mst display\n");
+				return PTR_ERR(encoder);
+			}
+
+			rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], stream_id, encoder);
+			if (rc) {
+				DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 169b34f985c0..88687b97ed6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -145,6 +145,26 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+
+	dp_panel = msm_dp_display_get_panel(dp_display, stream_id);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", stream_id);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[stream_id].enc = encoder;
+	mst->mst_encoders[stream_id].stream_id = stream_id;
+	mst->mst_encoders[stream_id].dp_panel = dp_panel;
+
+	return 0;
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 7f35e7524cfd..3cbd2a674675 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,7 @@
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b14f097ae8cc..2ada4a7c1c08 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -360,6 +360,8 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
 void msm_dp_mst_unregister(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -406,6 +408,13 @@ static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
 {
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
+					    unsigned int stream_id,
+					    struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

