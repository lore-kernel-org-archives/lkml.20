Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390DD3E122D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164384; cv=none; b=qTxjcGrU50AC3r6/1Q1IhfDEfvl7tq19HIwbWnxLK+jJnsgkGIvxz+tnIXw4W4qE48tFFsHIiaBu5y9McnBKUoE0mGbwqb9xeEDetDEK/vjPuCemDnlBjz6g/NtNAQP4TtQkHNm0tXJYk+ZU0hyfO/Q8DYQTzOcXOrUEaM12koE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164384; c=relaxed/simple;
	bh=oxxFLGz51w9qXVS0OffsM5JGTewECkY9VNmCDbwCrDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moBIvcv/aVvRogW3htTymp6qGP2I+B9XnW3cUjAmxOXT+s8zI8z08Z8xPNj9s16KJ3T6amTtHyTo2ksB0YbABxHgCFeDeC7ffY4tjw35Ff+MYprhlHeBNJHgFKDTqKv2v2Xm6o6u7fSFkpC/+wXqgaEP+jvBezvqYD84sHaHR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqQ5UhHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h19T6512; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqQ5UhHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h19T6512"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xFqE2332428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TEFhBYr90R6IqZkVioUWK84pPyuk21gxNUifooR/rDQ=; b=EqQ5UhHvhmjPYTTV
	fBp/eKayQdJO294PNCW/ODxqMWJrR3Bo5baMssnvQjieCo3NC7zvf8qKkwzln8Ch
	Tqp41awIXJdTSAmdmTIqssB7qaZxuS0KrQo7dFUNqGcffKzuRckEbeyCjKhdJhOI
	fUDhJxtLEA3m5X9EtuoSQ+2NEu1AQ4SnvDIfQT5oGBw7NROeFZ/3itLRjXMDbPCe
	hvoKvdewGr2z7FA+vIglSMwlGwPF53t+pcAbLjs+I7FvOWvaWJbrU7icby4K8a1M
	BBE11gGDay1QMg2vyj9WksFSKUTsX6CcaYx7TBT5WpHlUm9XRXjuJsKpDdjrefhH
	Su372A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq8571g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93922c75037so195335985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164381; x=1788769181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEFhBYr90R6IqZkVioUWK84pPyuk21gxNUifooR/rDQ=;
        b=h19T6512Q8W2ZSpV1NWx/lBywTdPEvAcYgguKUhdSHVPJB47/VXv26Rwi1Tl1x3Fnk
         HYjb0DsqV+qL5CdUFCQ5Izx0xoV+tlBADk2QsA10IAmIAbbRNq4WBBxp7r7zIWh/JYvM
         IVX1mTpo7LkFqAOzCJ5a87PSbch7zfqAThai1Lh/zdXuWtlGVovFLl4P7onFqzlg4aTw
         oOvKSUj96f2jPUANbf7SX/+yOzTAN3DkTYSlhSTw68504qTDx6ty5fwn6EdnxpVBqE4+
         sG8kv7RABb237xzWk/H9f+1ftU0pbVtuU3xCSpaLH50V4ELGL4CpYEQc0hQ+TbEZyAI2
         bYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164381; x=1788769181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEFhBYr90R6IqZkVioUWK84pPyuk21gxNUifooR/rDQ=;
        b=RqXUdNyi/Zs38Jwt2AuR9DDRtHC2gP+29POfKClNyHwO1he+SP7EnmoWAKXwJfqHop
         pMRXkO/b7zy9ytRG4ug4YKI+KNUwvtftaYzEeDvxTAvCjFc3JVeJcEVCBIM9fVseEcfh
         84i8jkkQpvSjwP3XRaC480UgWqvXYD9N0wvUXIxkx8I7FGtGQiQ5ka9+qHqA2kYjtK8d
         7vnWphGoljZ1Qg5Kz+NcGOC4SOhjMuIwu3mg1teCP5e0LkMk+mbkmYCbzIVw8e6aCqO9
         9B2/8cRjmaIm8eZKDvLSb0+rzWk9rzfK+EuWUIDKavT/u56FVnaaBPGPRxRo3/irgFvv
         vbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpORQgj8Ut6hdP9A2RhFmISCV+FDB9GY5EbPNNFHUtu67Rc7kDDhDurJUqZ8eioOKH2Cde5AsUWuUR4aqM=@vger.kernel.org
X-Gm-Message-State: AFuF++nx89gYJlaZH4+6YsotszE2Osp6rn5GcK92N6qcLVn1mYwL9R5j
	Eo9E/0nb3OdHFX4Q/SZYcr6OzR++jcJT3qQbAPELbUg2lj9VUmh6a1jY6vttLRTFx0P1957DFBb
	hT8cmJUGRVvJL6sMczM41ehMNRmMBs5T4jiqk/Xir6UYfF1qJX0//xPUqEO+FkRGmHcI=
X-Gm-Gg: AR+sD10qRUJvSLvX98Q+TNDAoCtf6C5JFl6+SIf2U4W/el1TfGwQeGtbvKJvk2lqXa2
	SHkyNTDogdm6O+g/fH1QD62uAJd3tMyRL5P1cqP3tiaZxGG2tqZfcWS4OM+bAer95emCyCLRTVZ
	ROnWvhX5bcnVedtHqMG7Gpbjic8S4+A+Kbs+4D8tN+fD4b/hsC3TLoDD6UuRONT/3Z/LcV7UjD+
	6eXWgNKPIYicpTlDMUj/3uBqtmC+v+y49kG6OALYhH9PMRKuD074GmBuKHCn6HU+m0lN00vqrt4
	cYqGzM+LaKHH1S5VAw/CF63n9iTKnU9YAZRhoe1Q5zMdt6fo99qwNRbSOnCKsDJltbngX4ax1DV
	a7u/NjJSSD1376LXmJtWAmONzjMYRokp/cb/fOGgG1nMUn4WKB89z7aXbvaEMAos=
X-Received: by 2002:a05:620a:284f:b0:915:f96b:8f5a with SMTP id af79cd13be357-9391391ab8dmr2942371785a.36.1788164381314;
        Mon, 31 Aug 2026 01:19:41 -0700 (PDT)
X-Received: by 2002:a05:620a:284f:b0:915:f96b:8f5a with SMTP id af79cd13be357-9391391ab8dmr2942367285a.36.1788164380769;
        Mon, 31 Aug 2026 01:19:40 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:40 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:40 +0800
Subject: [PATCH v6 23/29] drm/msm/dp: add atomic stream handling for MST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-23-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=10460;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=oxxFLGz51w9qXVS0OffsM5JGTewECkY9VNmCDbwCrDo=;
 b=G+FGjToGrlKba9HFOKRkneVL8KhMZNnJDlyS7EsjW6S0sl9ZY9HttYjqKjEEbYYGpVRmrBj+X
 E6ACj4pDH2XBVlxxyhwtBuqfx/pDT/YzSvpstMSUrwh4RYPhxOFsIyW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: vDSyk9wnAk3QEQYPKYV_Evf_uXE5a6Ou
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX3q023mNrDH2F
 Ddh0ChcTNWliC9rtZUeYwJgPuzC34w2Mw/D6G+0nvr8//taaoG+2X5wtvTiAzwp2cNaaAK+PJd2
 bbALhAiYJSERlhWaaONQAa8cBURLZc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX1eLIexVXFHpj
 CKjhGtmTz207zRzcUtACRewRDWFULMtLncpPh6a3VjEqdfL6usCfKsSUf+G67Cb0oS7I1yNt+zJ
 BXbLvwy3ocbksppXZMyY54Fefb/KVZ+Of3QvWkDZiLzS9ft9GOGQWSYw1KqLC+jSWEG2OTdO4OA
 vk3KkHxpYBkopN/lk0xuW6isuDv/1u1s15S0GhwixVCjS2JhiEEnzOYEk24gVn2smURMM5z0rKn
 4CHqmH0iUC1Prw8HFY7OjJ0Je0UBuPy7TEFsWsG05VFQrOKJxkuQVJq252K3Kh58BudFM7MpIYv
 x2exFilcuqIdXTtDejcSUu/V56AhdrBMIjEzfK4GWAFkVkUZHGPIf9AwWc7Xc1M1LMezMPm3cZ4
 arKPWhZges+CtnbtipB5utL8Ek/fMmDk4+FqhvZfOYKOziXfCGCoSJp4noO+ek4FfUXShmPOSP9
 ScQgCRQmP1S+x6nFGTw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a95391e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BM7BldANtbQ-uxA6OcgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vDSyk9wnAk3QEQYPKYV_Evf_uXE5a6Ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

Add the atomic check, enable and disable operations for MST streams.

Reserve VC payload bandwidth based on the negotiated link parameters,
and update the MST payload when enabling or disabling each DP stream.
Serialize stream updates that access the shared MST link state.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  11 ++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 162 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |  19 ++++
 3 files changed, 192 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 533109b4365c..00b0da33f446 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2747,16 +2747,27 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
 				      struct drm_atomic_commit *state)
 {
+	msm_dp_mst_stream_enable(enc, state);
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
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 93536b6936cb..03f9c95ca686 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -33,6 +33,9 @@ struct msm_dp_mst {
 	struct msm_dp *msm_dp;
 	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
+	/* Serializes concurrent stream link-state access across streams. */
+	struct mutex mst_lock;
+	struct msm_dp_link_info link_info;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -133,6 +136,18 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
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
 static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 					struct drm_encoder *enc)
 {
@@ -145,6 +160,152 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
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
+		return;
+	}
+
+	rc = msm_dp_display_prepare_link(dp_display);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] stream:%u prepare_link failed rc=%d\n", panel->stream_id, rc);
+		msm_dp_display_unprepare(dp_display);
+		return;
+	}
+
+	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
+
+	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
+	if (rc)
+		return;
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
+	msm_dp_display_set_stream_info(mst->msm_dp, panel, 0, 0, 0);
+	drm_dbg_kms(mst->msm_dp->drm_dev,
+		    "[MST] stream:%u timeslots vc_start:%d slots:%d pbn:%d\n",
+		    panel->stream_id, new_payload->vc_start_slot,
+		    new_payload->time_slots, new_payload->pbn);
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
+			drm_dp_get_vc_payload_bw(mst->link_info.rate,
+						 mst->link_info.num_lanes);
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
@@ -309,6 +470,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 		return ret;
 	}
 
+	mutex_init(&mst->mst_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6c6a1546478d..e9a7c9332707 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -361,6 +361,12 @@ int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+void msm_dp_mst_stream_enable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void msm_dp_mst_stream_disable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+void msm_dp_mst_stream_post_disable(struct drm_encoder *enc, struct drm_atomic_commit *state);
+int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -410,6 +416,19 @@ static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline void msm_dp_mst_stream_enable(struct drm_encoder *enc,
+					    struct drm_atomic_commit *state) {}
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

