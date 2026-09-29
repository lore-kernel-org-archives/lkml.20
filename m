Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A53EF0D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656049; cv=none; b=UR0JQShBa2aX4/zsjYK61hmpHt+6ksSKO339ZWvUJrx7gMiRLCWH5pIeHuMnHsjEvwsuJPlzVgV6IsEk09ontulhpMAZ8HlbMtmbgyQLqbh1ppIhf+6sNRU0h9PWia44/JZrwabkJVEI77kOoSmcuhBIDEoAafF6P9f7n2+nSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656049; c=relaxed/simple;
	bh=k+F3YbktTkNPZ0xgX10f/j0T6KioGiuX1zZduwNpiAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKYqLELUl7gX37crmhvgqlKWLQNHqIjgY0w654FaUSuKiocgzDO66brfPJpqcDoqt9086bLOe2LGx0HY/Q967vLLeFvxKMiFSqds1/uY3o7Q3umKJSR5IyBB+aK7Kl22qr/tKuF528jRQ/WNR6GEUXduSi6WZAE/zwsTWp4/K4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfBX2MQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuMzkekr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfBX2MQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuMzkekr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47NNJ3891436
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2fttsiXldh/gimRmei+A1/M6LhbHcbPiGyqdJI4+xg=; b=WfBX2MQ7Ia9US2Ma
	+T4WcPtW19Hf4lZuQdzz41EoEL75scMbCMUCaAH3T7U9Vt0PIsyJilpCTuYNJ8y/
	cqK6EH/Ws2sqgEPusr1FntPujUdWSs029MpZfhujX2v4jvDaPX5vh6wiB/Yna6Zm
	gPSpPaPbd2y1E1OSMUYWjLO1TRVMFz3R6JR6ibQLDEw8MMBipEd4Ipu7e6yLqqIS
	BdJv5OurdnEQ8s30GV7xCvlDhIQ6ijMh/U0W5JmkRTf4bYhIz5lxc6fpusk/uen7
	4sQL1oNgvNXFg+6s40zNZ5fpYltS3NBltH5cCTc/GdWy1RLvYmR7prBJq6OXfiDH
	Yh+0RQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkv3pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91785bd637bso13055306d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656045; x=1791260845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2fttsiXldh/gimRmei+A1/M6LhbHcbPiGyqdJI4+xg=;
        b=WuMzkekrfPDxCiMDFzKPNgsV432wFS3aHv6ROAv7Lb/1CxKWp5i/5Po6nKNe+vLlk+
         AytF9IRGn9edbIXFi2KX/esCygnyPF4K6yay7VeJsh2PRvGaKk9VDxO81ktw5dIqE+mH
         iD5gR4IwIAs1HW3gMktQYi08ZaibARvfSM4FTM5hXjGS1eTj1acVkA3utc8uDZPw9rfi
         EO1f4FfYAIKsJX2amqv2V5yhgwPyliuTijTiZR9GppSrppKAKzG01kbLLf1QO3HGiqcI
         IVr3cVF7JEwj1R14MicUacuv4y6hl0MPiGInly2q87fxUVw2KC5Z+rwHI4dvstCnniD6
         SZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656045; x=1791260845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2fttsiXldh/gimRmei+A1/M6LhbHcbPiGyqdJI4+xg=;
        b=lKIWdfLH5D95+LmiMf9ueMP5W/bkfxJM7u1oV8Ybp5UXRCUS8mBd0pUIG4dEZed5n2
         PKdhns568Ji9XPz2iZRVR17z2ineNDXVevW/HdMxMT7kZL8a0yHx66subwDIgHDZGb6A
         byboHS5NlJbTV12GWW4WTj71BCBlQzuy+jg3jdoMUFpWF9mtZagjhLEykgTezWFCouh7
         rtb6eO3QsFFsTaKmUvfSI9hUuSt/JC2FDMmdTtH96Q/I+GlEq1FurPgpnaR1gHOqCo5D
         hVT+A7FXh+6S3wPOaFKJxdp7RCM/2zUyW+9mzq2DZzwBN5LiOMxNAdJyJs/LRSPOX4CG
         +Q0g==
X-Forwarded-Encrypted: i=1; AKwUvBwWum1Y6tFyZgxvMzpLrbfWN9g/prZTZnufp+13k+NgE9Ng+8nVn2ILt9ywc+4cm3SsSLZjWTXXNMhNL9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRuoG6Kv72wWThIzrso5M0ipJsIhHrLhtdIQdL1BSVzTMpguns
	wjbiwOIYpTJAetm9rto0GGMN8MWumRbzzNpcFCAj5m7qxBIAQRjIAylmWE9qaqHeaL7Mb8MIcvz
	mO325YOkZ0ULRxE2SXJgGq4kwITR76n69SDBOE8QfVbVlxRTSGo9ehoertSjl6DGxoZk=
X-Gm-Gg: AYBFou1Z3IuPRmHYEZ5LSXQVZFZIqNg/veXEXrXp1NCLG/QtFow1J4ciaKGmjLnlRtG
	1rXFieIyfPsVpdSrQ6vTmq1REILMQdDhv1OECi2Uy/buu3qK5qhdjyrdCzN507S1P+D7PJgrb06
	yXc6LuAk9hnQm+2LNR2i4PZzUONum1FqOXqqYF4b4C1al54Q1PGJS/Z9/4NcbRO7jZDATPtupWv
	X34XJRUBApYVgNyybet+4vf6bu6EAZXPAs5ZMm7dcfa5lEBquITyrvaPTypxIomuMbP+ThB20sy
	1MFJX5D31i8HajjThKCp9uD0PtWVWveL/tKn5ZKI+jVLst/dF6ymNgrAHLvMT7xuF4Qm+Eu/kH+
	Syt5YqfsFWlfhuOVOBd/AIvoOTPQ4I5LubMgURKHPoyUZkhtI4BNp7knarfB/30c=
X-Received: by 2002:a05:6214:4118:b0:915:e732:33b4 with SMTP id 6a1803df08f44-915e732353cmr115938036d6.19.1790656045400;
        Mon, 28 Sep 2026 21:27:25 -0700 (PDT)
X-Received: by 2002:a05:6214:4118:b0:915:e732:33b4 with SMTP id 6a1803df08f44-915e732353cmr115937896d6.19.1790656044864;
        Mon, 28 Sep 2026 21:27:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:24 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:36 +0800
Subject: [PATCH v7 12/35] drm/msm/dp: add support for sending VCPF packets
 in DP controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-12-4b81473185e7@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=8225;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Fc3FojBL+AdOTYwxAjKgBNInQpilWzH3N9EK6ldDqNU=;
 b=YBqmB838xKTKzVjMrSlmis3fujz52t6upvN7K6NHXWXuLWZGVJdwkajrh8G/Tc5v+bnABGtKQ
 ol+8nDih9LwDfy6UFGPrWJg71ObrvVfiOFnS/Bay2Qw5JvMw2fy9H3L
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX5oX5MuLkoSvx
 V0tvItRmyj6NKVtKcJUjnqbADuktzjXzHCbeo3EvXKxgCbGAdmkAPfJ5IVIE5lVBn7Km2EgPHHn
 ts6kJPl9RNwP8o7iQPZeZ+ki1vsyQ3qZ9Tb53UnTkV3U40G9avhYK5QCLWwZqf18fZ3la4/qm1R
 w4s/jQbyqyKn+P8Xg5r+Z0nUStXWevDXjpz99aZe4sO8oaJFqpwX1nNGH2HQTTXtHMIytiuhyoB
 UI+9qyS0GzO4RuxKpv7Q2AVYEoK5iGhmcoormaD7GPEBksz8w0sPZHQhmDQrh7voIsYeGg9xa5U
 +ZZbJET1OWENM8qeN950lVsxk/k99MtqcHLm8xrm91iDJQCvTLsUXkfOwuZWzWkRxoF6aNeej4N
 vSerKnfXLtFTUVUq1G04nNNyu83knpMAO7rbOX3Fihxlb8i76zrEd8+ViJ2cMQnaNsyi+fN4sWn
 Ei5o+VyqIpj7advqL/w==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb3e2e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3K0hjHndsinMD8gLsdoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -6vKsP0ubcuJdeGCspTGIXj7adJX9y8c
X-Proofpoint-ORIG-GUID: -6vKsP0ubcuJdeGCspTGIXj7adJX9y8c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX3J95odur9gJR
 iKD9eIURbHT35ApsQBO97c0Ga2Da9xW/et3nAdtyLRuNhmDmeT7mqm2j5wB3ySTnWP+iUCR8cuB
 aJYvWJc1byV2pS/zU/LaLrYdwvYR0uA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
Add support for triggering the VCPF sequence in the MSM DP controller.

VCPF completion events for streams 2 and 3 are reported in STATUS7,
while streams 0 and 1 use STATUS5.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 86 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     | 12 ++++++
 4 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9a0c9737e6d0..929e0f94f8dd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,6 +65,16 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS7 \
+	(DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)
+#define DP_INTERRUPT_STATUS7_MASK \
+	(DP_INTERRUPT_STATUS7 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -351,6 +361,12 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
+	if (ctrl->num_pixel_clks > DP_STREAM_2) {
+		msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7,
+				 DP_INTERRUPT_STATUS7_MASK);
+	}
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -360,6 +376,9 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
+	if (ctrl->num_pixel_clks > DP_STREAM_2)
+		msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -379,6 +398,34 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
+static u32 msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS7);
+	intr &= ~DP_INTERRUPT_STATUS7_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS7)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS7,
+			 intr_ack | DP_INTERRUPT_STATUS7_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -478,6 +525,35 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+/* Must be called with msm_dp_mst::mst_lock held */
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active) {
+		msm_dp_ctrl_push_idle(msm_dp_ctrl);
+		return;
+	}
+
+	if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_STATE_CTRL_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_STATE_CTRL_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_STATE_CTRL, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+}
+
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2801,6 +2877,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
+	if (ctrl->num_pixel_clks > DP_STREAM_2)
+		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
+
+	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
+		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 41a69447001c..84ea37d8db2e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -27,6 +27,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 85517099543e..0fc2cdcd896e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1517,7 +1517,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	if (!dp->power_on)
 		return;
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index cc74b1ed628e..36cfd94ac162 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,6 +42,9 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_MST_DP0_VCPF_SENT	BIT(0)
+#define DP_INTR_MST_DP1_VCPF_SENT	BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
@@ -58,6 +61,12 @@
 #define PSR_UPDATE_ERROR_MASK			(0x00000008)
 #define PSR_WAKE_ERROR_MASK			(0x00000010)
 
+#define REG_DP_INTR_STATUS5			(0x00000034)
+
+#define REG_DP_INTR_STATUS7			(0x000000FC)
+#define DP_INTR_MST_DP2_VCPF_SENT	BIT(18)
+#define DP_INTR_MST_DP3_VCPF_SENT	BIT(21)
+
 #define REG_DP_DP_HPD_CTRL			(0x00000000)
 #define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
 
@@ -143,6 +152,8 @@
 #define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
 #define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+#define DP_STATE_CTRL_DP0_PUSH_VCPF		BIT(12)
+#define DP_STATE_CTRL_DP1_PUSH_VCPF		BIT(14)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
@@ -370,6 +381,7 @@
 
 /* Streams 2/3 registers, relative to mst2link_base / mst3link_base. */
 #define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define DP_MSTLINK_PUSH_VCPF			BIT(12)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003c)

-- 
2.43.0

