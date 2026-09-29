Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F13EC81F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656063; cv=none; b=YuE+sXGZhM/VxKHbAbIhwZoj2sUOdGho6LXUV6XAXXDAp7fje7JLJ4PIOUl2kvno0DYuK/p+WHhVs672a5BYQcLbFbBVmPEwsvoaGkvMF5sCLE2THmwKqLI6KAwDXBfcYvQ9uzdWeJEzcKTstCp73XVnAd6bASdFYs/eS9flcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656063; c=relaxed/simple;
	bh=JII2T9qAEp0ez8Mps7DsHC37uk3okB8MuNwUDgx+gZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/tuBey6vf+S+wM3cG6cQyhZ36EK6qesp7yS78Qz7yuFc3cbVKzh5etc1c+2E4OSHVfKT8/mOsbI6FXah95vo0h+GtasKBwXVoW47NHysTiowmIn5y3JVS3rZZ/LUjZ528hKdBdA9lsCkJuIhJBDuLXsNAVjbWmAs89c+BxlJiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knUDOOtq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWlPnArI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knUDOOtq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWlPnArI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47HtF2774970
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MT4UqEu5GfVH1yzTdoNHVqbzFj0WmONLvXGXOovXMCk=; b=knUDOOtqraHDq+ov
	PFXeqChdE7gFif2VRGjZHyKNiv8v5ElueFZMNp7kQEpGfhsgJR2KJiRkYo7OhJR5
	XLLS5pUoEgczHQbuZGpatiwV74/1pP7EWDWrHep06005XFI2SixNZExc6TkaDPWB
	ZxMxnInDOW0O3B8BB1L3n3wns4mmN6i/B821+gIfKo8Sndn3H9SQZ43nZop+vtMi
	miz9fx5PaSDd8Hi01vjYA86791BsDf7vLe+CQA+YYpa/etlf7K42/b7nqOvue1KU
	H9jsrFmy2dgW8Vbp97fOeJ7GCpX1COlnpGWQrXSrTZmxElGClXub1jF38ywsAgID
	rOCZpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw2249h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c673116e3so478693785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656060; x=1791260860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MT4UqEu5GfVH1yzTdoNHVqbzFj0WmONLvXGXOovXMCk=;
        b=CWlPnArIdiTcMmYA1SP5tExfLwxHeEDEPzmosiyC4v+12v85o1xnE92WAGGOe2vtBe
         fJaQfmBkqlpsQ23o9ovAS5IKWgdK9Ms33PwijIQa1n5o8lTNXwYsiS1oNJFwqSCd8R2d
         sAVhhG8vhFXk8rxt/8/Sjn+kuMWhXpHKsOA771mBx6VVlYk0E+tY/UORpJaa8e9Xo6eL
         qB2qVEdlhLyTJie3jyDG1th4cF+fu5d6NMIhjQQ154faVQ5PylB72DKCmFJQRTgNJ5MM
         UooH45EG7oBg8sAM/PH+EZo06yyB3PzW6bEMkNlPrLhcK7HwU7aB5NrQP78nylXH9dJK
         Pjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656060; x=1791260860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT4UqEu5GfVH1yzTdoNHVqbzFj0WmONLvXGXOovXMCk=;
        b=zaO1j/SHKYCp8NYfdkZdozDlsZkYgVW63r9KJzyhPdRu8Np2CTN7VUM+ThgSeNPc3b
         FVCugpaWhfEcT1/Elbv0FwGLK19Tr0L+uX9Iy+uYEqbrxXBQm4x0L5R1TNcuR1+jL/Cs
         A4WQnO4ZUhnh+Qm/SYE2LR6A7/Hj6I3b1PYusxQJ+kc9N4WiPQaH+lJt8pn0JlyvNl61
         geRa1S5Dscmoc66Fk/wNk1TXoXHAm+waW1B7Ph4VPQkMhpGIps6ATt1nOFPEkHIIc3pu
         ZvA4C8MwGbPNvwmO2p+aQwBfaXgBOGvoIrE6esP45TEiCMKzEEa4efkHSeWnLThYDvdd
         aLRQ==
X-Forwarded-Encrypted: i=1; AKwUvByTynGsyHc/fyCWe6WZutgP6bsB1Uu2jLsLaqpF2lQmPazuCb4c8ZgC45gyGjr3i4ZnqDsltqr9VvCAY/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kVtauJGhc5LGK796Cl9+cGugF7hLTxgwtx8AyT3JK9ExXCpjtv
	jSxz6jP83fdkOWUQWZ+qdLHtYOszF8F6/Qar29N7lCNCKV8OgccGur9PRg7sFBiJib7MVQA/aIp
	+okrtmMYYVWyJSOLXw5wDmh5Vv/LgCP2d+BqknbjfA22g6FKhdem/WQNZK/gddM6JAnc=
X-Gm-Gg: AYBFou0o3rUdXpxzOU1y4UY0TsFHA/KQtM/z4qWBeACtCqlrwhGnCx3aBIr9nU1v0VD
	WXfDrZ00agfI3eCfpd5E/11BYxbOQeKRGAoAZfMv/c16NvdOW3YCBpa3qxi3KqAtqvcPqVw34im
	fE6S86KFDlVcNnhPd5GGYF7ZkgT9xb5ekXfqV0o3m71PE5UpjbPUsWIGvayDxlg0W9891HsjV7h
	DJhPSjfuB+fY1I9xmhtoOwVe9gb5YLM/epx6HO/G96zz2+C1PVPFJhpRPWere5H0+WohIkd53Fn
	1hR2EVIPVmkk8NDKwcR6h/szGw8+3at5iG1OvJIf455u84CSxOUd8IcOyn31lmYzfCHZLGxMKPs
	5ykwO37S5zXrTpK4fnnyfBoVi5QknDcnVFgWPXxrxDuDVv/Ofk4q8PAXWuJ/mfmo=
X-Received: by 2002:a05:620a:2a07:b0:93c:6e7d:d728 with SMTP id af79cd13be357-93c6e7ddd63mr1276361485a.40.1790656059801;
        Mon, 28 Sep 2026 21:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:93c:6e7d:d728 with SMTP id af79cd13be357-93c6e7ddd63mr1276360585a.40.1790656059316;
        Mon, 28 Sep 2026 21:27:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:39 +0800
Subject: [PATCH v7 15/35] drm/msm/dp: factor out _helper variants of bridge
 ops accepting a panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-15-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=9297;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RFJoUHTL2iASF/QkUrzWMvRdFfGOw1I1hh44SpfdsR4=;
 b=LPIAkyUXUJa46yjb7scF/ubGmSLQZWVMxggUA05OPcIl31tVwtUaJfYUTZAw+eHSEZAux+4yj
 m49zksvrXsHC1Ez1HtEmWTIZnEpBRT4BmpN+8A40m3vXHPMc95E9Cxu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=10mNmtCk2Ocqn4x3vjYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RtEuMxxUMk4c8UATfDJpMOLAem-6fQs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0FEycG/QNyyW
 S+AwwXPusCW3w6z6n3QYCSKz8f5r32JNYIAh5s1x4cuv+asFz1m4SuharzJd1BU3rKvjk0SE+Ql
 w1fR28HQ8fqyBbn8HKdzAwBvOGgxsoGuLbexD7TPbz7mvqazZ6ExepynkK9vagvYV6eEBU6+xLj
 802Rz8nkB+HweeizBKC05qwJbWobidN+V67ArNQy0yHB1bqWtmjyah2+57YskWyjGhGb5gmyy/G
 OXsMtXn2QARkj2JS7fuMCKyKm7wiaQcdx+PzL2EPywoYW3nkEh7Nab8nuQHhX8Os1S4sZZWMfzJ
 lQdwYPHASG3Wd0sxYg+wW+pqtEHtINpqzlkSvnaMLFFrIigRrx2/+6ruT/hDZ3NRe3jM3BaDsto
 QVADgIJQKILTZR7TZWKv+kCRZSu8LpzNp8a1Nm+i8pXyHfLDYB4MewxA+O7tGzMWEpn2Mszjn50
 nlbolDFK45uWg9Euu2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX3JRpgsDMe8AE
 3B3qB6YOcRzmrG8Tx/t3s6/sQ8BSLwWF28nDM2woXEHn3zvAaCT2PoiCQs1O+JRs+D3owKkhDlw
 5Z7YP5XMihhYeiRlki1km4tWNrlbpro=
X-Proofpoint-GUID: RtEuMxxUMk4c8UATfDJpMOLAem-6fQs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

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
 drivers/gpu/drm/msm/dp/dp_display.c | 109 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h |  12 ++++
 2 files changed, 87 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8756e45eece5..49a718f4e464 100644
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
@@ -1455,60 +1457,79 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
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
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel)
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
 
-void msm_dp_display_atomic_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
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
 
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
@@ -1521,17 +1542,28 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
 	 * There is nothing to push idle, so leave it alone.
 	 */
-	if (!dp->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		return;
 
-	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
-	msm_dp_ctrl_mst_timeslot_setup(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
+	msm_dp_ctrl_mst_timeslot_setup(dp->ctrl);
+	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_disable_helper(dp, msm_dp_display->panel);
+}
+
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
@@ -1551,11 +1583,9 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1566,7 +1596,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
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

