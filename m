Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F63911AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656117; cv=none; b=ifO6vmXrtqdauFhAvr0je7fkjnH2EESjhOlaxc4WTSCQz/2sRU7OoYKQAso3ORgyTLzxLXkFZMotQReEggBgk8C9q4uNR2SqbX0U7j6ZKW3zecqoPQP1vEDkvt3L8j4x2Ah2ZosvwMeNG6BPwbxZ0oHMFGnd/TEGfyejqCfz3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656117; c=relaxed/simple;
	bh=ZRNhiSPRjpFcpRWINVcX64sYTc/DFn6OCNcriNKqNR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOULQP0m/3o1JpXGF99oxZcTxxUuPchX6Rrr07DKthbamGJOybJIFflrIBoANWFu2j5+RbdGW7NIzbUh+QLyJnnU2WgvYDsqTpzN04/0tkxavj3b3j5hEcAveKlfpYwPY6dpPiGKAv/Uph2kN5MIBGaOMNsyi59NHgU2Sc96XrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gM7q/LWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4IkMk7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gM7q/LWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4IkMk7O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47If92775210
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rmMDF/w6TIDjyKDAHhdZzsNDEc/jGfHcLjUJ+BD0zc=; b=gM7q/LWt6bDoPdkX
	ZwiMU4kLlT+yOwPFli6c5P9OH84MQAcXaAmxzFbqrVw3RHUNe+/rWQvGVHQgk4K5
	OiKNycVheFX+WqeI0hOq53nFtBgD0j5scsmbsV7Zw/JRSaLeSaVaNonoJcbY4dDU
	JDsmpof1chI3CYvhxsui86m2BhA41uuT+0Djg0ngU11UcEwHb5Y+wR+tA0WhPHiG
	gUqnrnjEySZtlIeUAQNGhV/ddT9oLpAAlqX+0+/bDwdVe7YeHp8CmGf/iLkhw2pk
	a8q2WvVLL9KjR4FNbpCHBucK/JnvAVT3YbwRO94GkAT3HL5/OmGkM6T1h+6HZLbm
	MoKqsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw224cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c63d960aeso412198885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656114; x=1791260914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rmMDF/w6TIDjyKDAHhdZzsNDEc/jGfHcLjUJ+BD0zc=;
        b=h4IkMk7Oot1RGRsTcZR7QiK0tpLRD9x++YRbpKjB6RlNGs09SxYSzb/1KKCDE1fr2n
         tacEflpwnBExwqAXogf2Ami/FSbbGwgVrTNYbpBF4nda3DF81gcCXF0SCher4pWmtZzk
         alAyfQU684IbWKEz2q4sU+4U8OpukothTDjtDjARb9jsDorYptxDKOO4JikXT07ARH9E
         qV9qy/dIUVKssZE/RnB9c05Ei8BN+pq0WRg6fU2USsHMxdP3/lwvefT5F7Wc8sAse3uJ
         A30bar4tdRG0EvnL89Ica/pVqTmXKvQqq9AZwQeJoAO5KDmjhLGOgwua8GGJ3+TS2RTK
         qFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656114; x=1791260914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rmMDF/w6TIDjyKDAHhdZzsNDEc/jGfHcLjUJ+BD0zc=;
        b=euZahtmOvjirMyph9mNnY1xMugh7svf3k9pbp6jH92J3RQUjNqk0MNqmWhle/FaRro
         9KL5kn/ycEH8OQa6aDIohQbRo8isM9Si5Nbb6bGdeqfJPjKFjRZCLriPyqxOg7yDvWWm
         WqNICvNWLFMCL98/1o9qRvNvjS2/ARBDcVX5Rlq1Ox91QSUidEy5VZvD5ex0r+wXZsYj
         zgvPcMGyBwT9lOO5nvDZ/px0zHw4Lto2eVwIOAb4u3zRTUaaLT6U88w1P12uSAZOC+iH
         9gZVc0zdKquedXfE2RH0FKZLlB5VdgLJm+VcIhABoRMihVHEXo/0YYolZJN7zLexeg98
         szVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzktAQy9/5Zhu7Mc6kOHS02mKgPcbkXGfoEHA2PJx8Jz0dscKcgE+C+wROyJkfPlfeakK30t7yVPFD7tU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mQU5lvs+dlS5w712UZzKqRYt/V1puHPrZ5gIvqOGTxj/JswudO
	Sdt28CaYYFWkKB+EOsNadZMgN0K5uwU7P8GMv188y2CoGH33Fib3/R0GffpG38JEjuXxXKi82ao
	jjMsDC/8zqRw1TMj/w05Pf9hpegMRwqRgDn2iKbTTYlZQo/3Cw8TDlRfRZwTlUQj47F0=
X-Gm-Gg: AYBFou3D6uIW/AKyG7KPB+XHJh7eft1awaWIe2CCzKBcoOpSZN2BYDga9EIUiCQlO7M
	e0QBVch5YEjxCXUtXvUwBaknQH97kPoOA1udXsEY84T2X2X3phxnk3Sr64O4Pj3q0KSbOKZU7NB
	LIvM0DRPZwYwkuBnad2YLyi/JXdT1LvFmWhLE92e8H6vAK5KbpYLAF8hHyVGEgqQYcEzya8TPT3
	qxAvcLJK4WQOha8CsIqvhQ/S4B0VH1w/KlG6r9XP0APv+eoe3USxEikmcLN2tRF+n6WCr8pNvbx
	ygsY4irtu/gamEoRmeP6OtCLHltvs7tbW5NeVoEewAMczNg8e57vV7xXoiNNXoHL/Vp3hCZt5nC
	WNeeiBfqUmGczvJUrt0m1PqUZVDei7ye30z2V55pqI9ZBLaQt+XNvlR5RYjCx6uQ=
X-Received: by 2002:a05:620a:710d:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93c43bf1cdamr2314809985a.29.1790656114270;
        Mon, 28 Sep 2026 21:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93c43bf1cdamr2314808585a.29.1790656113843;
        Mon, 28 Sep 2026 21:28:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:51 +0800
Subject: [PATCH v7 27/35] drm/msm/dp: add HPD callback for dp MST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-27-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=7048;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MIhcL8dvvlXBAxPiTZ31UsoDK/TOzOMoUVOLiwuhN+M=;
 b=aufJIgxMBClRXeFCcyvHMBxUeVa3w2MqNzSxXTWSY44X9XNpDhKO+XrUqLHuUXHCpbKBS7R/G
 77+w06bDUMvAet64ci0sqB+4uIk6IiTFBuu7E60PH+zolSe+CIoOAkd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TC7KtrVTTV83HWuqwI4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SkMNTUmWG5V7wk-AaPJBOOA---D6opQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX1nYfSO+VNgrt
 YH2ZX87thwNfu5NZTyYiWtr9Sr39BUp9icpE8+JNoR6H4ZXed4EQy1SYpDusYnwS0dnZCn9Dgub
 9eLJSuw5gS/6TP5KC6jxARFqCLpfYSNuSvmS0rnTAeo8ee7AKZQzdcmq60mPghnFhgSi916HMx8
 q2ifUeMU5fEa0LDk6QidDJO5c1BCDGQnCEahk9K71R8IUwCUS+kzaXylJLxS/RaN+/Ccs3LGwGE
 ZKQNTMHaGD01JyU54H59XkIdh6dXk+xeRwSrwt4nQrmk38Sizp9f699PrpqwhjP3ASDxo4s4XAm
 wOg6vANy8NjyEZv6dS/f3/1jLcXYWRc602nAaLetqH+Ob6AZ0YHDDgi77XD56mE++v0BO5Q9q/M
 1wFyoGw7B52zl0IPsb4XXCFN3wV2PBVHT5mTRUPPFm1RZ6uZZ8DHLSUW46mKd6IK5QXcaZheon7
 fOI8VeIq3PppgdWZ7Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX6Ov/LkOSrFwz
 3O04o+IWwz8pj08Vzw+BHdJDUcWFqsa3Kr/V4CW+9bI1vUiaf/+ukNdIc1lD4vb8mi48pTfWijs
 nZsccjX2elgc4ADbbv0qcVWYQE105DU=
X-Proofpoint-GUID: SkMNTUmWG5V7wk-AaPJBOOA---D6opQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4a3ca1bf05a0..71c5e6bef02f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -417,6 +417,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	guard(mutex)(&dp->plugged_lock);
+	if (dp->plugged && dp->msm_dp_display.mst_active)
+		return 0;
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
@@ -516,12 +518,18 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 sink_request;
 	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (msm_dp_display->mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1069,10 +1077,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
+					    connector_status_connected,
+					    DRM_CONNECTOR_DP_IRQ_HPD);
 
 	ret = IRQ_HANDLED;
 
@@ -1309,9 +1317,15 @@ int msm_dp_mst_register(struct msm_dp *msm_dp_display)
 
 void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
 {
+	struct msm_dp_display_private *dp;
+
 	if (!msm_dp_display->msm_dp_mst)
 		return;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	/* HPD is disabled by drm_kms_helper_poll_fini() before KMS teardown. */
+	synchronize_irq(dp->irq);
 	msm_dp_mst_mgr_destroy(msm_dp_display);
 }
 
@@ -1737,7 +1751,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	u32 hpd_link_status = 0;
+	u32 hpd_link_status;
 
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -1759,7 +1773,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
-	} else {
+	} else if (status == connector_status_disconnected) {
 		msm_dp_hpd_unplug_handle(dp);
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index fd8fd6fd10bd..4c0ad3dc5793 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -15,6 +15,8 @@
 #define to_dp_mst_connector(x) \
 		container_of((x), struct msm_dp_mst_connector, connector)
 
+#define MSM_DP_MST_HPD_IRQ_MAX_TRIES 30
+
 struct msm_dp_mst_connector {
 	struct drm_connector connector;
 	struct drm_dp_mst_port *mst_port;
@@ -36,6 +38,8 @@ struct msm_dp_mst {
 	u32 max_streams;
 	/* Serializes concurrent stream link-state access across streams. */
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 };
 
 static void dp_mst_connector_destroy(struct drm_connector *connector)
@@ -357,6 +361,40 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	int i;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	for (i = 0; i < MSM_DP_MST_HPD_IRQ_MAX_TRIES; i++) {
+		u8 ack[8] = {};
+		u8 esi[4];
+		bool handled;
+
+		rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+		if (rc < 0) {
+			DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+			return;
+		}
+
+		rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+		if (!handled)
+			break;
+
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
@@ -472,8 +510,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
@@ -505,6 +551,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
@@ -517,6 +564,7 @@ void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
 		return;
 
 	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	mutex_destroy(&mst->hpd_irq_lock);
 	mutex_destroy(&mst->mst_lock);
 	dp_display->msm_dp_mst = NULL;
 	kfree(mst);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 822d34cd6ff5..3bd3e66b4eac 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,5 +12,6 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

