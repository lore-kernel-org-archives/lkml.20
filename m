Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8173D647F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164342; cv=none; b=T+ijM84iSjjD2D2G08HI0Ol/odKE2CfalgP66T4W6PEvIlTktOroo8TuYpfGyBHQMDL17JdJ+63CKVzXIZfmRM1qlQMkKYB49yelsTHcRE6odnvEY5tmQS9VrY4qFunR4QtWQ6RCB9NfI++dpA+96Cz5cYf4eGy8eZs0C7u/fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164342; c=relaxed/simple;
	bh=1HC+RISf+l9HuSX/VZXRngRCvL2HcYH6U5L02lVtQIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZ013xQoj0wvafMJZxlN9K8mMdpPKC5tEYmo/9WNUYkUho1tYEyqzwm6ZbyS9DO+6JuD7hE3Qb6A0/wzImHGZUTBG3vduh9UyQSAGQn/IBBQcMgZGMYUYYPfkNkQvE54ivoxPituilTfmpPcq+ruoVncgopc7oxQEquyfzgI3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnKM+3BL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyHzy9iQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnKM+3BL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyHzy9iQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xRWi3018711
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMyEdhB9hAoWIOwYXdxQtMumg611UNkuzOON363+IMI=; b=cnKM+3BLbXlaLBTn
	0UbSbKSRGESQpg+DTlF0UvLMCYU7gp5OjefJFA1iIYLXKw1wjtad8uNwW9TQod2+
	1vMX6g9ZtwXQ+wqQekXx4UcUsCPmWoO54cyr5SM0TNXvjB973+CbmSIClXXVCvWT
	WbHiB9XXxjRPSARED258b/iiJjResexXciLIR+8PB9UExUKsjZheKomSRFzRagam
	WVtyJn5JR3vosCd0fhiXzlBSUgc55xmsYEGxXCyueu4eC4jcOzehrmOfHp3mbfQj
	HIn5GYAxvs+kXyrDpeGFde2aFK23VIjHqwq4ZENRGXc9LZ2v7hxusrxakTRyg0vJ
	iPOGdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so436383385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164339; x=1788769139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMyEdhB9hAoWIOwYXdxQtMumg611UNkuzOON363+IMI=;
        b=HyHzy9iQegGNLQdJ1cMYXD04KnVt4EuPFCN2O5jSyXCPpOqRWVpezLL+N8xk4OC71l
         TIj1GbU1nGX3Q1oeThbOUy0QoVWX09gNbI3a1/F/9+aV9T2M/fDtoaCEtVK6n9nEZ4CX
         g7NWUOwUXa/PHzPhSUEc7sMyIo1sS1/udIwOijjMmmBK6ucJkF627FQbaBFa7FZwTBPm
         M02FseyD3RMjmbhRTuBAyzg2luWhRjum3NtJSnwqHu9Iu/PUX85EWOx8T2NfyCISIKdO
         bAeJuo7I0F5dk+hPD00PESuGpWD8tx3p3ZrsbE+fh2aacc8lD3vKe/RSXZhoC7hZNzpg
         ca1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164339; x=1788769139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMyEdhB9hAoWIOwYXdxQtMumg611UNkuzOON363+IMI=;
        b=MgouSu9mSTf2XTjjQPPgppPS035g49vsK+qqE40h+XFHWXajX1tNGYfSHn2rFIG/AL
         9Yv4v5rCQ2D9dpWVPLO9yPNumAaN1nOypHZ0RmynbqM+djpIhx0xPj4/1eXXg2Y3NZ1r
         ssorKRwZh7dlWcK/oTQroxnn2Bd7kDtjaJVOaLAGzKpfC2t0cebIfIjYlhTfrJQmK8KD
         ksbdWuGInP1WRUQs4/wRf4qpEtiqaN7VmYqXCXOpfHzeFrVWmKDcu2sOX2wdSxYq5Wpm
         QQyUpRj/y6+uw9vU2YyBlTfDNrsU3P6/6snuD02Neggs5qzhTa/p3bjSY00UMp4gZ75l
         eaow==
X-Forwarded-Encrypted: i=1; AHgh+RpjVCz+AfZoTVpvRiTj0zfhbPR3QrbOP3i2dCwF4zWDIn3vPwx12FQ2K/CzrIR27y9cxORZTnNVTA53uc0=@vger.kernel.org
X-Gm-Message-State: AFuF++l6aZpu9H1tMpFgg3jxoKeC4x9FzzFg/ABRib3BwyO78DCjFROV
	bLwYKY4agcZU053vpb+hIsRxBzImHpR9LHd6sVoswNCMTcwDrhxLJT2F7Jg2LMQ8nNOEp8HpwGn
	4VhSrgl1C7yzXM4pbhcpRMyAaj/BtMPq2Zk/h7CreZgHsgC7Wyt6uHDhKwJqmcJBo14M=
X-Gm-Gg: AR+sD134zwFqb26Q6qJW/U/ZRGtCraUxCdUZ2R6g8cP7O++qsnQo4un0IQMmsxxhCm7
	xOs+lmTvlI872F8Y7Upa/PgxsUV7lm1A0R1Rm00xEAlGvWGz1AXe0WqQCCO5St/6qjC+StPsIRO
	vBQQtbZPDh0Ro9yPW3JFs67XYSqk9qe0kCqepmrF/95R3eNmQBEi1ny+vLJkSFjpKLZxCNmE5kL
	mIhHmEZe3NZgvYSidcYgt/jdsVHwpPF1/LsURnUrkAcpD/DZ0lt6VJkAfq70ADIT4bfraGeJ5C5
	BicanNkFQgozPrcP44m5qwKuF4zErEQEdGCDuDPiync6CKR5G2lLiZ6ZDiNoWWimKGFP2C1WE7g
	7wMcJA0c73Smv2eebZatmyQ//NkPbLFxymKifW865MaI7T6blK8CSldLylsaTEoQ=
X-Received: by 2002:a05:620a:a806:b0:939:773:bb2d with SMTP id af79cd13be357-939138df464mr2362146685a.31.1788164339213;
        Mon, 31 Aug 2026 01:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a806:b0:939:773:bb2d with SMTP id af79cd13be357-939138df464mr2362136185a.31.1788164337511;
        Mon, 31 Aug 2026 01:18:57 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:32 +0800
Subject: [PATCH v6 15/29] drm/msm/dp: factor out _helper variants of bridge
 ops accepting a panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-15-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=8728;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1N9xzYGqZoDTt/jPgVPDArOtr64Id99x27L296/XRaI=;
 b=6o4QOJEGHLdVKFONb9/sm1Dq0+aodwMvWEDe/v0b6jKNzBgmf1MFhvcUg/jvHj41L/Mur5xot
 XQ2SUAf4oKiB4HftA/sxCdlWdRHLIJBjKS8ZRzFTfnoQOTjaiBwv012
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: Xyy6PlU1cAo49nZIY_KSSQDfSjP-S2eF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX8X46NvP3Az3h
 k4TyrohvaeDikDMLuQ3VqVy4x1bmJejHFX29bscRKLoYnOb7bGIu7IzGVE9cw1sF2Uh3UXh1B/x
 6LTWYEhB3iGRMp8gKw9V5D9yDvLMAKCwBQYhQwFMLzEH+2LzZ0Cc55izaNurTZ/CIen18m/x0Uc
 KXMxN+AWvNNSVvafppgF6SjFG6Klxmjfz8wWtE2NM5LhM2y5g4WeytVhPcbwELk1SzridI1YjB+
 Y4d3GYIrrAMTEG2BnWj/wlPw9zKoZC8YxZbkrnZCTUi1Da5eZShbRYCHYEP9L/4Mb3VPWYD+FU+
 lEnYgiwAEzXyYkAbiiXVL9cA8cxrj/wRl/Z2SCCtDXeZwXpbfGe/758JztC4lVoizuGlfKQ+knp
 d14da3Fd53gTBrYezTOYnC49G/kloXw4j9+BpuiW3YRTYG2b6V62cyVZKEr5NJUpNttKcjeyVt/
 U0yh9fhbeATNp0x7r3w==
X-Proofpoint-GUID: Xyy6PlU1cAo49nZIY_KSSQDfSjP-S2eF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXxSvmaoUOTC0s
 S4ZNeHo3E796C+eXdW3vd2bQyAE4WdcWxjeYKa69mElO29KoFZ23BqK7koWrbr0mV+isjyKj6+B
 eTNJ5SGZO5RdYjaQTHx078iqZNPsJzk=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9538f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mu3EkBhnCEQeHIwj90QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The atomic bridge callbacks (set_mode / enable / disable /
post_disable) on dp_display currently hard-code dp->panel. For
DP MST every stream has its own msm_dp_panel that the MST
encoder owns, so the same enable/disable sequence needs to be
invokable against an arbitrary panel.

Introduce *_helper variants that take struct msm_dp_panel * and
reduce the existing atomic_* callbacks to thin wrappers that
pass dp->panel. No SST-path behaviour change.

Also drop the static qualifier from msm_dp_display_prepare_link()
and msm_dp_display_unprepare() and change them to take
struct msm_dp * so the upcoming MST encoder code can drive
link-level prepare/unprepare uniformly through the public API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 100 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h |  12 +++++
 2 files changed, 82 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9c5563dcb856..6103fa67f3ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -625,12 +625,14 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
 	int rc = 0;
 	bool force_link_train = false;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
 	if (msm_dp_display->is_edp)
@@ -1448,69 +1450,98 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
-				      struct drm_atomic_commit *state)
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_display_private *dp;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	crtc = drm_atomic_get_new_crtc_for_encoder(state, msm_dp_display->bridge->encoder);
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_encoder);
 	if (!crtc)
-		return;
+		return 0;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	/*
-	 * The DPU encoder's .atomic_enable() reads the mode's YUV420 / wide bus
-	 * state and runs before the bridge's .atomic_enable(), so the mode must
-	 * be programmed here, in .atomic_pre_enable().
-	 */
-	msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
+				      struct drm_atomic_commit *state)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
+					    msm_dp_display->bridge->encoder, dp->panel);
 	if (rc) {
-		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	rc = msm_dp_display_enable(dp, dp->panel);
+	rc = msm_dp_display_prepare_link(msm_dp_display);
+	if (rc)
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+}
+
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
+{
+	int rc = 0;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	rc = msm_dp_display_enable(dp, msm_dp_panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, dp->panel);
+		msm_dp_display_disable(dp, msm_dp_panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
+	msm_dp_ctrl_mst_timeslot_setup(dp->ctrl);
+	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
+}
+
 void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
-	msm_dp_ctrl_mst_timeslot_setup(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_display_disable_helper(dp, msm_dp_display->panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
@@ -1530,11 +1561,9 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1545,7 +1574,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7bd510cecb44..9ecd5025fe4a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -45,5 +45,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_mode *mode);
 int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
 				   u32 start_slot, u32 num_slots, u32 pbn);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0

