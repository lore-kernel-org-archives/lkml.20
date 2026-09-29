Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82C3EA976
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656081; cv=none; b=YyXrZwd1N2/0XzEOg8Czk0NtIX0b05j6RMM9QdVcgdXV1+goJBvAyptxstT1TdSf8NCh/gswgRVxHDLX52R+OC2NGTCY1m2p9XJ1Lygqz66CsNes4DFgdmQ1tRDPVqdlSHt/WbXtwneBEhmMCUeE0iUKCF0YO6CXLJbRDTgmHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656081; c=relaxed/simple;
	bh=7lGItLSuP3MM/8cRZAoasF2NPB7RTwyfmDYQhyIAX5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e91fhhSdm4X3S9sy40EgM5tfrzNnS4abBtQcxW/ZSfIPKMw7COaK39c1TwD/0fhnE39E605CeML7uRCxbouhibg64KMXIoPPyAMyZUNCEAEmlymsCM61i4F360Tdw51/NDDnoaXThc/xMHA/BhW7NruQf/2G+uHA2oCHmQ96cP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxXcBVzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ4lrkNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxXcBVzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ4lrkNd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47PQK3891511
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HCvwfKgAeES85DVR2Ieqnqb1Ps0GK2N21KSClRL1T/c=; b=dxXcBVzJACGnptvu
	xcQsioqA3v2rnrVWT+PkI+R5S0saUpop1ZFUQuHHQBn8yFzTTpcb0JNswPFJJGZy
	5ceAA+7wxa1avZyBFr146EfIvioullX4XTqZqbxCyJpVyXSovixE+Zdd2nczU3nB
	rE9cCK3Cg2fKoyzjFga41bl6Q+BFyxFe9OUgro8dCTL/LJMOvCoyR3fY7UiaEJJb
	il+gHwgWTSdYLbKMsKFC94/wmwc/VqdpibOzXsulId4wgE7H2jqgb62mSj8hJ0tJ
	a9yRRArosiqxBLEWqnahMMEJP5NRJiwKDEhmsxwjgzcmzZfnoHp9XYOL010myXTb
	6fbfsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkv3rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914355c5a51so68846886d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656078; x=1791260878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCvwfKgAeES85DVR2Ieqnqb1Ps0GK2N21KSClRL1T/c=;
        b=JZ4lrkNd8qB3Amt+WzLsVhMW2jFhjqh5xsgrWIXJ328mkmQ/G0Bo27mtHc5mAkTWbS
         wrFvKIPUCpVAhy0t0hGPourICPttD/iDWD2owjSRH4jftUNt3TWXLngDzrZOX4XoH6t3
         evSuJbL9Z6Ws5rXPEMvJcepDkv+Cy0mji7rXTBuW05OqpGXjGCRhja+FC2dwf+832QxF
         VER0F4xvwd37Z21xZo7/snRM1ytoYR3Y0tqKz0wn58lQMqCY6mADsOl1q/+87/yOwlch
         wsNVLTC1iRlnP1lpK1TONW7vMv2lG8QmFXponkM/3CkadF5V3NbB0AUelIM6N4gjuFzb
         /hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656078; x=1791260878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCvwfKgAeES85DVR2Ieqnqb1Ps0GK2N21KSClRL1T/c=;
        b=h/e0IiQTrLgxBGCB7hVUXpSoy7jUwgJwkU4c1uzxetiN8bd4A47nM9EJ9QQd7K+llI
         uAqbEH0YBTIrKXRHPKOHSHi/o4utTuNsJSp7R17gjBQGpRTltfcRk5uphhz92QrgwgDE
         R2AO6Q5JgbTdpv7sGBNw0qECPw8gAa2G/Fggi6Y06O4ymoZ9pZ+SW/3pVMXKgqkRI8Vf
         1B1CLsiGbHSX5dRbMeUFcDJnbPpGrdR2gia93wQUCDOwQ18RhN5xRAUUTm+FksW5ZIW6
         IKweIuk+iSSs++31/QBqCQzLCXmyGREt4RHtPU0qGxtyz46NrO60lV+4/hocxA/qIuDu
         kMAg==
X-Forwarded-Encrypted: i=1; AKwUvBwieHVbzHdl2G+q8NYjKoWedh1y6chN5qxUGlIrCjQxpRu4S9bCWklHL7CM1oS0I58cJiwAp7Eq/PorzkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYI5i+Wsc3fQKt6/zGUwIXybEYDxPMkjd/vWeUngmK2vuwgd4M
	onrHjH4VO1gv9iLniu/YMOtpW8IQV6XuQGuhcyO56p2pXLPuY9wHuE77a7lbEgR3eGuy9ob+GYm
	YJgiefsLrd0rW713oNDQQk2ufP/1DYsESo/192uqN+ElDkKhyjM7vTEze4UOr+39VcSI=
X-Gm-Gg: AYBFou3dMgynAihT2hGNwJnV0VldO0WWjy3J/I3WqoIFrwvGAe8Cx6coxUu7Tb0JLE7
	e+5d7KR9n3ByoYmS6ka/kAT/uqPZdQg65Fr/cXbtpVYfk4gK4kwpUYzSJ+57A7JvWkz6A5czh7r
	B2v9UypLSw/EjE7a+Ccyc/PfrAN3kkLpBvbhr63QL1FMrwX01/TuQRLUAgbVv0pV4FcMFNE8/fY
	zGnLmt680F7rdAJSxJSqgdOvkV+qOR4NuqTyIJxRmEIlRM+UWNRsswVv2EyqA25xbVl5p2+TEJ7
	iGD4uG4lKJk7VMWdVziKNx9xPON8cp2bCAsiBK97v4dYvouQQckNPl3QF+l541DVG3vUOwQtuAZ
	Q7WJDkFFS4HCUQbdOrrH/BeYaVf6qytqcxFuHK0VaftD9RH2zaf8SL5zXggFz8xg=
X-Received: by 2002:a05:6214:4704:b0:917:8a7a:1a9c with SMTP id 6a1803df08f44-9178a7a22f1mr10680556d6.7.1790656078212;
        Mon, 28 Sep 2026 21:27:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4704:b0:917:8a7a:1a9c with SMTP id 6a1803df08f44-9178a7a22f1mr10680236d6.7.1790656077612;
        Mon, 28 Sep 2026 21:27:57 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:43 +0800
Subject: [PATCH v7 19/35] drm/msm/dp: add MST connector creation and
 topology callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-19-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=9219;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=7lGItLSuP3MM/8cRZAoasF2NPB7RTwyfmDYQhyIAX5E=;
 b=gH+1HL4ig8dvfHm3e4Tht/Dv0JkViUzjD71UKdwHt4zKwjpRakykur1vK0NXRkMm4p1DHSjLi
 6Zc/2PRULx2AQoLqLeyxmVx5n80sVd+pwBypga3buRadPBSjCAbUsQN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX+cIDJyKS6AjW
 8kZgozQXYoxdOVdQVJ0P609mTGuGSAxIXONYIys+nHEGtZe/1akYeXuBE/0CEZRzfB/xE1igTN9
 UzlxapbStCUPFTW/mkPKus/b1DJI+Zz+XDL57T4YKVWWU7sTr4CR23Alc9nB/UFSnJnR8zB0ZgH
 Y0PR9gKGHkmg/777EEQtqZjSuLvVza1SpIBUbUMNrFhmTwRFSO4BwTIRV3HclcLw2j6Ey/74Fug
 15X+Pn91vZrXwZW77CLSjUQ2CUrymINOpFG0+3JZnQRwIRbI9A0DLfillIJN3ABnSMR7fV55eM7
 MQDFmqs/rr8YTpdydKF75oApRayZZSPotQnI0/QuXatRWyepm6iQ7w+aDpBllHnXQ56CTmtgE3F
 ELIyPPWDJksdWe5p+2476wvWBHXR68xyjanYJxjwY3aLHnYjjBOXwTggQrNYh7qaBJFgK+ap54V
 r8+ARdK2XK8ErkUOzTA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb3e4f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n5AsotsA7IsgDgQ4TjYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kPCLLCLNHNUjmqx_X5z_959Urfr_49sv
X-Proofpoint-ORIG-GUID: kPCLLCLNHNUjmqx_X5z_959Urfr_49sv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/+N/dLs+Vw5A
 y4pMWUpl9djgxAKTT6JZrWtlLPk1SREjMOY1sUaWsmXZwCTLsYB5/s/P5+XJZOkNtm2uujPZp3V
 9nksNgpf1sDvqeJ3OWBP86BHuSh0MSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

Register the add_connector topology callback with the DRM MST manager
to create DRM connectors dynamically for MST ports as they appear.

Each MST port is represented by a DRM connector. The connectors are
attached to all available MST stream encoders, allowing encoder
assignment to be determined dynamically rather than being permanently
associated with a specific stream.

This enables MST sink ports to be exposed as DRM connectors.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 240 ++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 5d22aa34c521..169b34f985c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,10 +7,20 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
 
+#define to_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_mst *dp_mst;
+};
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -25,6 +35,235 @@ struct msm_dp_mst {
 	u32 max_streams;
 };
 
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = dp_display->drm_dev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	if (dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+	int rc;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	rc = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return rc;
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	/* Use minimum possible bpp (6bpc RGB, 8b10b) to avoid rejecting modes
+	 * that would be feasible at the actual link bpp. mode_valid must not
+	 * depend on negotiated parameters.
+	 */
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
+					struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].stream_id;
+	}
+	return -1;
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *iter;
+	struct drm_connector_list_iter conn_iter;
+	u32 stream_mask = 0;
+	u32 i;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	if (conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	drm_connector_list_iter_begin(connector->dev, &conn_iter);
+	drm_for_each_connector_iter(iter, &conn_iter) {
+		struct drm_connector_state *peer_state;
+		int stream_id;
+
+		if (iter == connector ||
+		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
+		    to_dp_mst_connector(iter)->dp_mst != mst)
+			continue;
+
+		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
+		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
+			continue;
+
+		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
+		if (stream_id >= 0 && stream_id < mst->max_streams)
+			stream_mask |= BIT(stream_id);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!(stream_mask & BIT(i))) {
+			conn_state->best_encoder = mst->mst_encoders[i].enc;
+			return mst->mst_encoders[i].enc;
+		}
+	}
+
+	return NULL;
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+	struct drm_device *dev = mst->msm_dp->drm_dev;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+	if (!mst_conn)
+		return NULL;
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc)
+		goto err_free;
+
+	mst_conn->dp_mst = mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+	connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
+		if (rc) {
+			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
+				mst->mst_encoders[i].enc->base.id,
+				connector->base.id, rc);
+			goto err_connector;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+
+	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
+		    connector->base.id, mst->max_streams);
+
+	return connector;
+
+err_connector:
+	drm_connector_cleanup(connector);
+err_free:
+	kfree(mst_conn);
+	return NULL;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -35,6 +274,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_d
 	if (!mst)
 		return -ENOMEM;
 
+	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	mst->msm_dp = dp_display;
 	mst->max_streams = max_streams;
 	mst->dp_aux = drm_aux;

-- 
2.43.0

