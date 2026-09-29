Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC13E9F76
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656030; cv=none; b=BIPmiPhFn90gPGGf8nc7sHmwRU557EvkWmieFiPY3WUuk+bUjZVas0TPgJ+iCqFO0l8sSzBaiYI799vgsAHr5l+dlmjhia37HX+zcpGXonMNxmL1Ec8hh2GgXh4loAOG15fOA/DLX+zG5Pk6gila+saCkv85MiVKNzrK/wCeaKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656030; c=relaxed/simple;
	bh=BrNIlS5eFw+krOeZQyZgc4NHeu4MoxpVW4L17Q25kFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YowwCtR7+1+A0EzsobMINtANYR8Lp6g/Uh3H64XrpWgfzjfA3f8tLe4whB8qhGAnVd6C1z7TyjBM5eyAbltFTdY8mph5VfKcizs2jvuUKJT56HFPKGV79Sgto8sXCKM77EdAQE25xyHn39pq3RNnj5UioZtddx926mZhFU6bTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewv7jiZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX1k8yoT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewv7jiZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX1k8yoT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47XBc3654790
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7PIozI1KYXukehfMITcmRTUTQDLUTgogibtC6enQ78=; b=ewv7jiZShJ4BP58w
	C8gVLfP5Kb/BVY6NyHOla0G8/ym9+H7ckMK3fF12USJpeR8ufIUYH4939RDGWFqa
	6bEPFWmC4jtxInbQOpI2tVxn/WZqu8kigjLvWLAD6NyUmbKJqA/UO+XhJFC0lfUV
	FYKpuXIe+tvlImnG38Ypuk02NksVv+ewWUa93uHDQy7NDDQt3kHrDZhmGM7YNI5D
	GGwXlGEM9e5FivZtYfbAqbVIJ+SsmHAiO9PHEixTH8SKRbSSN9frNl8Dr9BBDsEj
	xzpkjOWBNo+fAiGLgaS7ce8VMsKwLHKKmqnp4Vg/IxtIWwtjjwcXUmSuUoV9ZlC1
	sAoPYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0jua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so89376285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656026; x=1791260826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7PIozI1KYXukehfMITcmRTUTQDLUTgogibtC6enQ78=;
        b=HX1k8yoT/XeP1h3hnzSHnLX1lgwZZl6ibo0UKY7xp62kPBKlQuQNrmaVwXWbAK5eb0
         W8xxduXzSX1k/0pY2A8OskPShUN7xaNGS4J8masZU00NVZeBylo9BCWa3INHSNPBYxkg
         bM+VYsr/f2ajedlakuvdyqcRJbuu5SkVdctGQpNONY63x3jqI18AacTpGr/w8dA398W5
         oSdzdzIRWhR67qPiAK7lb6PItsKZLk7pFMLvlYmPP9YVGvRYq13T7mmXYr8AC01q/WAc
         U8EemU9DT5fIX6HOo4wvlZwYl6bKRY2pZl3LJLIBYlfoZMvxyEFyKcrKj99ZjkVICx5Y
         k6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656026; x=1791260826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7PIozI1KYXukehfMITcmRTUTQDLUTgogibtC6enQ78=;
        b=Qy26/J4wwIpiSnavgE4qD83WIWQyWjQWci5lOFMrIwtVm4F9sYMdUU3q6CSNipwiNO
         sX8AiNxDCZVEkBgKHEy0c54iuLkCJR/MWKQLSoiUjq/26IANJitXJxSnpO3O/PIg85eB
         69wb2ww7BFMA4+x+HyECBcPsIWnFkqa/nCGaON9E7PDh+hIUQ3esUy/kWYEhWLmOuHMX
         P64wqW3i3LSbwyJkzN/Q/8Q4Dos1RHJlQKBKGty+fNQCrbyjfvGDfrCGZHfO/9tpwpGP
         zxNTtBk5Y9NKlWw31H1vJLVya1ezFaZR4sHI9cRCc+Jq8CNqzwTMDTCQqKCH0Y8r/tNm
         gRIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZMqcjjcGaXAlZcyhYnNA3VQV57egiRDC7j/Jol5QeIpytG7YHKtqCfv8afSS3P+74+AihWyBkA8WWJFw=@vger.kernel.org
X-Gm-Message-State: AFuF++mRCuflFPVbDbc+I0A/vqEXifPG0iLcJ1WXchuXq5OV7ASO5jnl
	jpmEe7xIhn2WqWwCDt1vyvgSyslwWk5VmDMjmmO0eYqf7annGlGT2wVuPt21qFs+awWsSi6p0DV
	qV3EfOBx6dMf4ZgAsl4k7W8h2tKJ6BvfUpnD0kWgeCzeNkFiPRG385JHopZt0zjxSbFk=
X-Gm-Gg: AYBFou1SN0hFoNdpCg0u7p+1GpJ4MCWwSHZDN41RMiLjgdWX8LGIeAwXLmWwwzXlxEE
	P2nhHbB/tL1v0wk4zGN9CBcw1QSqxw77Cf+tEpje5gKwU27R/vW2aWXlY7DqDgEpD8xOHfZ4RnH
	GBmjWe4q97JJVAiXZJQtVnbVAT46YkEiD6IRRA3ZBqYl0bk1E0b3rUUjASdXfnfiFk+4qaS/l0Y
	hlrB9EJihjnzsx28tfUwJCCt2tWAvPXc06ivACjPXK/Nxrm/boamIreHl8WK+N5BNpdO+ynkusL
	X2TKRbKW30/iedH7Rm69t68WQTm74zW4ubBTi2MperAWnLLBXQyqDw41lJbMwddA8x4+OoeoAJB
	Bu/wttlBn6fr+XCtuurDjrUl3YfuRi54m7YBExWtMByDWBbYMzH2VQdMXM/d1xG4=
X-Received: by 2002:a05:620a:1988:b0:93c:664e:e205 with SMTP id af79cd13be357-93c8be72680mr271826985a.11.1790656026178;
        Mon, 28 Sep 2026 21:27:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1988:b0:93c:664e:e205 with SMTP id af79cd13be357-93c8be72680mr271824385a.11.1790656025635;
        Mon, 28 Sep 2026 21:27:05 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:05 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:32 +0800
Subject: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=6702;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=umzYwO+E3zHLMdJeG0T1ILIuY+ntgI4C0yeSt+qisDM=;
 b=h3KjKmUtxY5quAa3E+ojMX45U6BxcQeGuWBsPvBUB/uoGGRR/te1BtiDB+sRMol/CmF1xVxqu
 0uDHA6A0PhyB4C6NRWPAfVXzVY9uSNo9Y1Rx3DoXwazZJpl0nDBXFa+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXysFWSg0c5xxh
 Kt+P7DZ2fsC1zobCKS2hLprEAzD+r4ehLoffK0K6PYFjHRXuemGqYCq9rzR4EJZKhcgIIuqcijE
 AOkbwUoT6Uk5vqwc9AQKD1QaiKRdmNc=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3e1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=F2S7ry5v5sxRTjZyeP4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX5UDNppfoh3eM
 OMeWTafLcGLC4z27IU3D58qNUteuW06xN/pHeHNF2NdecGafw9QxvzUrG8njuTh/nS37sUTtv2P
 hZp4weTrk9NIY3OnwarQDjJBy4W74hRaMlX9JUnAfWHLREjxPhWVdZ8M9k70AKbjNVO0W9zbGHz
 Ioe3Wje6XqZLeBOD3JQsyRw8RYyUgo9ZfK5BEvhgdNZL0IojmRL+b+UwGgoYM1fqFSUzpVuRwsP
 abqpTBd8/O6ZL4FOo1PXAG+lT9mfsRsW0NVeVp2UF+DR5mHlD4VjKolsfNVVufNV0/YP9CJJ0Bw
 uczXRe4uTLtqzNqGGAaRQsCXfo2JRBpZJz18Lozr5f8zKkeE5/+HSYdLcw7MmeWvu7IadQ2mRyo
 YUwYGiJx37ITtWahiKPs2YkSkbckDFNbeB7BT0rbG8CGz4Rqg1YjbYJVD+Ugdqp90vIYI1idmIJ
 epRL7Na3YgYbFByGL2g==
X-Proofpoint-GUID: Qq-_4MbhOkRS5MDekjsH6Mqee8oRi23U
X-Proofpoint-ORIG-GUID: Qq-_4MbhOkRS5MDekjsH6Mqee8oRi23U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

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
index bb5e35e11b4d..85517099543e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -1518,6 +1518,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 		return;
 
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

