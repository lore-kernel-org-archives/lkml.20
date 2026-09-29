Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128113EA976
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656073; cv=none; b=q9SFjSCCSSO1Ngi4pu7QfVRzbfJWiSB5ABUCJ9QTFSQyEZjFj34Zo7nsBpxe1VmltJ7OGG9jO5jMSC3Bv96Ctm+Ys49fXFooGsVbCq5XJikYl3It47SBDAYDEW0SXFdnDtGw/EIjP7X1EPvoc4hDM34lTKFkLhhYHl7J11PANSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656073; c=relaxed/simple;
	bh=caBrY3eSAK+MHvy7z7G8wHqV3r47/nkLcSuka+6hCiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LphcB62Otd853Zw+VtzoA+6YWRJ3wTpLgkNMJu1XPjjubs5bhHq5thF14GpPx3Q/fgeO37agJ2ezIe89P0MCtQm3NFgoEKNidh59bqRPy4r22Lh9RJKTIAMxyRWWTphhdW77M2bST2TXxyOoHf+x1/YkCjmMDR2r1B6BJ0C853c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5sqpYqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlQH4YGM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5sqpYqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlQH4YGM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47e6H4052902
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOU7YLI3VILYFBBKCNNR9aX4zGt/Kw79u/VQXU5slgs=; b=T5sqpYqqq2htlhbG
	ylVc8MruvmxWui2c8rrwekTAxFVrhrdsMecQIjNcelIeUmuSZXyOnX337el9f8jb
	aCT7z8Fq6IHR1W0VeZuNJU4f5JRrLbkgOnRbHyM0XEI87rINtrt9qHfUrMDbKGR4
	hFVxUrY3SY0AWxTDpPVHNhWo8Y+gqVcr+V55Z3zOBfjXU2gfvl0V4MeIHKzs3+Ed
	j31v9hKttvpnJZ8szJAMFITjRWFyC6RI74Epj3d2D6P+ml2vUlQ2Rwu0EA4WeIJA
	wMxCwX+/aIAPKSXz0ly7iBCsvweboMTRN1CpKbOpFbFomhb6xmNp4f7ClrBJyrxw
	kihcig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxg2dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e39c5625so94620341cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656069; x=1791260869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOU7YLI3VILYFBBKCNNR9aX4zGt/Kw79u/VQXU5slgs=;
        b=NlQH4YGMJ9DSZeg2ACG+e4mTkx6gOtcFOli/5Mbr1dh18eNDY7IcLYmo23uD7zc7m0
         2xwji2jJ/t0+OARa+rXnNrgQrnKSRs7iOqFIXitBmnAwjli4xwIYMDJGTVA58IWqbiun
         ACJHbJA/I0TUZ2ECqgT8huGBXr2Nvx5qBvMUAmGXJbKSgSKcAW8/tpRGC5RQJux5KZD7
         PchEkmhCEPCqgj7ETp8WNNFeavvFe7fhzTJjLnwr2qplH1m6RXKoYvueZ0rah89BM2cR
         vMjnilspKjo49YWMtBGkoYJ37dh7pUARgKC1zslqTSooexzS73DA0YX8eSQG/PupCJo8
         QOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656069; x=1791260869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOU7YLI3VILYFBBKCNNR9aX4zGt/Kw79u/VQXU5slgs=;
        b=DqU5z3xtgYpUmCuBeVRvaP/UVOP4gm80mtWSHjeI3HG8rp2nGkiPwbxmlob2C7Gw4D
         4vMCq/BM0eI8GaFL3fYyyGG4OUBeaA7b7zH2bJJ4PGqp4dlS23YPk/j0hvU3QIthYVIh
         En//r+ObFDU/FaNICN6g/cWukFVIiF8g0PWYmKFn58O6brpc/M8yp+3riL6SCzZd79iz
         pmvQjGUMcu5pqMsOOK0AAbMV4YbDPyWwaCItOV2S4ErORQj90TNEo5lAyBnR18u2LsHp
         aw3KMrPRWD/mE5JRXziOLQu8iJFd/Mqw6yNufDRRdHnUnR3Q/qkJAGB67e/6HVqJe2gM
         9v5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1vRvrbbhpOfBHG4JZ42VlsLxFlLgfGnJjM6M4xUomSbA/e6DSFHCcvDXwAjBpK28zt/FAkhVAKLI/Y+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nzCxBWg7+J+MoY1HJ/neRR+NzD3vfVazgb0FSd7iEdHuOwC8G1
	zppvfIHgmOs9hmrBtDKmsswPpBivi/nSUCxJFX6B5nXuJiiTPfsVKM1n6+xbOiu8psJ4dFZbH74
	t0K1bM0+MYKpcXLOGD9Cz6nzJ5tNJNR/p1UPwt/iCvwmgDiclq0jBqZDl/FwXDrfAJXI=
X-Gm-Gg: AYBFou22QFH5lA09c94ge4KunX694MfZp3x643l0xp3RUyGxLZ97knEu7myqi+y2Mbj
	LMZVh7tiHZuBmEZPz5k8q69VnYQoJ4KH57EVSCMdoWy/iAUlYo+DRQZXWEbooKufSUjt8hBraD7
	0YDuxidfqLNkcDsUQKi76gdlDunUsR2OVC7vu+3Mzxj103+raT47TUXT7cdNXbJHczrE98goNmB
	NXhnIkmDtxG8ac6gK4xDJ4PvFa/9uYQiqlpjnLbIDxlJ2V8PVSlfTC9eu+JeAV+95BrWYSlazFc
	cK8u/RA9H2nZ+mUhA+sRhPswiqzYz7iHmer3yXeVzVzDGhdLEnfRHSaNwaT0ZK42uJQZ+rCccqM
	recXuiMX17i3GPZ9L3PW1UKuAWgOpTuVxZJvsh3jfDH7FG4tXPFbx6FWPGJ3aCFw=
X-Received: by 2002:ac8:5982:0:b0:533:3911:f502 with SMTP id d75a77b69052e-5333911f992mr131782571cf.57.1790656068975;
        Mon, 28 Sep 2026 21:27:48 -0700 (PDT)
X-Received: by 2002:ac8:5982:0:b0:533:3911:f502 with SMTP id d75a77b69052e-5333911f992mr131782171cf.57.1790656068423;
        Mon, 28 Sep 2026 21:27:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:41 +0800
Subject: [PATCH v7 17/35] drm/msm/dp: add msm_dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-17-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=3826;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=G2aKfBzlYxNF8QcaqaWZAefzV8hquGjEQW8gg4WREL0=;
 b=0h5DH5Kq9vGjYe4rmlO73scb/MuumoRApov3eD9HnYmyhkzFJ/nQYdAILreQAFCwKpwctVgAz
 /RDTvW9szHKDzFOPEweVW5kl74esdVO6Iw26Sh6/oCg1FUAEksdWitf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXy4YBNDjYbsoe
 90CHQ5aOJO7NUczTOot8Cw3nKiTZJZ3+kDbXNEQVhOo7leDjh8PG3a+Z2j55bpkLs4qIDT/cNNW
 2QL3vNLNh5B/SSdQTDCXGya+6Tmq0Ks=
X-Proofpoint-GUID: q6-GuI4V1SJbJ1gpdJa67hKkDZzOpEZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX7zING+I4Q1Rv
 vrAIWXLC/50ZfutWXd/ufKXwYI+a2dej7inFU+xMCJPreJggpdw/La3ho81CLRAOw5P3WHZG9aP
 DugG/WzOheWud2hPucWfqz/bgLAbi69Xxb4C3YmC60oQNzjxj0w9upEKJ7UWTnNYkp9+cwWLcsL
 NZmWMLIYgg4DROCznb//jOFhxLTZOsPVcWOb8q0+D3FIX6Ct/gfrXB+GbcnEBT/5J9cjTpfl/OT
 yKBwGNF7P/ykz3KhDpSLjnUOZFly9ojqLa1ZOkBD7rNuIO+SPpYQK+AC0SJ9hSru2vi5dVlfqNn
 Lf2RGM5sdHrdXCq28k74GG7MMB/t9g3tczX/OSN8fV6JzhgldKv2jqti6sn26EaKw7viCDv/4o3
 Wh+KOinQd/QL8ebSWBcjFknST3Hjae/Yh+rJe+FoMjZiKREQTRwudq8LPQWGy8ATj8muAyRfILh
 AXDRu9E/suXEFCaUf+g==
X-Proofpoint-ORIG-GUID: q6-GuI4V1SJbJ1gpdJa67hKkDZzOpEZq
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb3e45 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kCKOgzAXqFYlHSlaV6AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API msm_dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 02732bd4efa1..d6f39cc3bc66 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3159,6 +3159,15 @@ bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
 	return ctrl->stream_clks_on[stream_id];
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e8b445c552f7..111300784edd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -61,6 +61,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
 				enum msm_dp_stream_id stream_id);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
 			     struct msm_dp_panel *panel);
 void msm_dp_ctrl_mst_timeslot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 487c76e0f990..1d1fb45024c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	return rc;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	if (stream_id >= msm_dp_ctrl_get_stream_cnt(dp->ctrl)) {
+		DRM_ERROR("invalid stream_id %d\n", stream_id);
+		return NULL;
+	}
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
+				    dp->pixel_base[stream_id]);
+
+	if (IS_ERR(dp_panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	dp_panel->stream_id = stream_id;
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 51eace1d1346..4d4349068c2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -59,4 +59,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
+					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

