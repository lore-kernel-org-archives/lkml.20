Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5973F9F4C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656131; cv=none; b=ZVrgOHnAVKVwvkRAtkNFImvB2xkHiTsycUYgthmdCHFiSOY20nOo4IhBthktYkjXwmpzWNA3lUiyQLqQ1rCazDS7Ia4qZbBfCQiDDpdp3VgVY2zDDYcrrN5l5mK0d7QOBCR/XJuq51ZKoyhUOP6bBX0AC2UiS1IMlINZ2FhV9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656131; c=relaxed/simple;
	bh=Y5WKvcrT3sY0cmegGW+rmXFiS2A8julPxpShHDKZOUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsno3DhnZBg/BKokMMXfgM5wHDPzV/JVM+bWZu6BjmFaN1KjObx0iSQjogSnsZI8Ij4NH51ln/+s0XYuL2/I3KZajxzUZttKdlipW9zYjVInt1i+BlMZpzzp22lt+0kKehf0VpIfriFhmS9gtkYrSV2oltleHjDfhLBRfn133Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbaXQNuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0Qp7NpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbaXQNuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0Qp7NpD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47BlP419798
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ENKG4ciOBR4DhpOu/7pksSLF2ffxLUwnpK+XxHaCBA=; b=MbaXQNuKniADOB6I
	wvOXDw71XgLGu1eIVnAjx2cIibO+IzpwAsTmNpzoZ3QE3hl8AAA/3NVGmoPGy4Iu
	IdgDySYNyMVYKsVoIsO3XGiTNTtPeEjz4cAju82qmRX3o6bJ+MHq38+rYbMsFskm
	w3rG+dW1eN1DURSHH8RWaY+OUsHjKaikQd8Skrptzc/NhA+vq2HNSU6DzOXvsGlk
	D6Jk3Z7o/GwMqaCTRKw7VCuS7RN2GgTb2Pt5qelVvAY12K3OokYi+1KlgvatrJes
	eUjRiE9Xgs+uedZ51xCuyt5OVypCgvc/EVsGf5Vp4SnLDbaRe4c6hmG3ZEkfRcWZ
	6PoZew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9kh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso758357585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656129; x=1791260929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ENKG4ciOBR4DhpOu/7pksSLF2ffxLUwnpK+XxHaCBA=;
        b=V0Qp7NpDdFj5GzXmKUNb0gAWixqFNBHnRX3Xp/4fmsOExlyO86L4ld7BtNjMCOwZlo
         Beq6rQOQ1S7+K42c7UuIuWirkslMxMA0qObRF/rhzlE4MBHF7Fk7iZ8OdbVI5vAj9ns8
         r8hX4cfkALO0wpKHX/tdca770kGWcjnO+1cGkSEPJYlqO9HHuTyYwBd/5GWamlYRNH0i
         hQevgvjSrwFsCX0C68ZndCP/UvzbACCk5XLq5mwkPGZcG9JnAWB4sPkGsEbgOrguKrwJ
         odCPGacWTrqB/fx2fYFBHo3449U2UVug6l7O9vB+LTC0l4XEh6bS7OkMIrjnLPOzq7gK
         jG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656129; x=1791260929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ENKG4ciOBR4DhpOu/7pksSLF2ffxLUwnpK+XxHaCBA=;
        b=yii1ZEmJoriJvPV54zSOLhq7qCQnnmR74Ak36J9Uvn3wR1dXwIjqNhcMws0D/sJrw3
         HJH9Hs+mkDMdpj8z3f+NnJ3fsM4j6OizGP9fDtp43huKs862Yh5LOTt5/VxPQbVuL42y
         Otct4ZxZH+DQykWGvbiGD+LwwAb3+AuADmf22xdLC+bX0DYbp1bh6qAk9EgcfiiqZjyF
         uDus5ztqoWPOKpci8/fQsaXvBxtsqQEItdAycZNfLd2Srz1rKU6p3ERRgb0wugiFqypG
         h8M6FPp6zFEFz8AbWxm6ExXA+dEuKZph+1RWBD9H/e4dSjBbOZAX+sSjoYsMyrJlPkbf
         Mmww==
X-Forwarded-Encrypted: i=1; AKwUvBzVLiAEscGJMxiOWGlfNUC4GinTd/pk3nXNqtcxJPGq+7QhThsuCa02y2MHOUOUfcN9CzHUIOd6oy/1I68=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcvzfcjqSXTK8rakpULZtbCcPoHDdl91TirKiC9SFNmDizfM5E
	Z4JC4ufs2TSbzEq2W0nUJgEzMPhg0mMG2CiISlPQDDcdVgFZTCJmIXqpjCt8ymB6ZXSA/lzdPpZ
	M7e5HJvk7rgP3YF9IS2Lfj230uv2LNTlSCzNXWcxUo7zJI5t7QdMMqEXJl16j4ICobmE=
X-Gm-Gg: AYBFou0+CuN/KyJXFXEgGQqGI4F9W9LP8tmWcaT7LtTeHb5Wnt5q7eTQtQCKFo2DwKM
	M8Bw0+Yun36AvBoaC+MM8w5eP6lqcluVh8pPDnaRRY2xUL2SVyHcIVZG+Gcd1pk3Zv/ytX1SBBH
	tj5xzuZQ+1CTWkwmb76tTTiWrhtwL97UijUNaCsf5XNWwTm/IlwnXm4SccT5Hjcp7UCvG0NbGGY
	s42FV4OyYPVvWGskn0MvHmoZPzh93cg8dFzLDeNl/7CzPGbmWrcEIq/iz5Qes3xuMLABjIXb84t
	L5juAKDVl24j/NSzYwAyET6sd9Slqok1G2C63qeHTJmeYTiBSmxKRJHylx1gXS661gp7u2kekXK
	vAFRA0tz850tMIzlsN9Rqc28cTTBTf95qgUHWOD64Tf7sbz54ngVDvHD3OMlu9Yw=
X-Received: by 2002:a05:6214:aca:b0:914:53ca:99e0 with SMTP id 6a1803df08f44-91453ca9a0emr151400996d6.11.1790656128588;
        Mon, 28 Sep 2026 21:28:48 -0700 (PDT)
X-Received: by 2002:a05:6214:aca:b0:914:53ca:99e0 with SMTP id 6a1803df08f44-91453ca9a0emr151400746d6.11.1790656128067;
        Mon, 28 Sep 2026 21:28:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:54 +0800
Subject: [PATCH v7 30/35] drm/msm/dp: enable MST on capable sinks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-30-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=5626;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=muilqxsIon54At01bJOHUzArib8qjlI/9ldYi+c8yck=;
 b=uBsFGayk7ULb5FBxF1nJhbNrgsid+4gzwtzpx4+ROUpDq6R3a7Y/oZA0xnGtIhhq9zXNu1Wf1
 SDKjnlhaXZ3A1xlUdjHeY3hjk4KazDa+vGOtMH46tDUi58/CZb9qc64
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXzEFQALIAqKV4
 Sav3+3NfSxRN51hClTk2DvOtpR0otUGkbupIauwKX7crMfh4fIpjrT2tQxnhjJbZG7oC9w8J65m
 p0RMMNb98QsoBZKjcFa6+KMCTijoQKVQPEdEAnYsIJ3Ez85bwt4VfM9IU0JCirLtsE/En3pDAWf
 d3nmgUs+HjyROniEx2rPpKMaJuSLRslm5tOFnuHG4EfMRmTB2R/UBRMxUC5fHT+k3U3BB8cASZf
 XeTmwbcmS1vmIo0rcubD3xQrxyLlRF+q3kYnvXsRCdcZt3+XZHxmtCjNbFzrZ1jOZyG+NwtUvZm
 mvX4R+737qahtZsdtrSA2QbDfswvttzDDg33r4PF6odca5V6v0JFZT3CpfwKm+ymYih3QEZsTT+
 fICj+IeT9LhovyythWmXxxkinlq4qohNPxQSwoqeDEvOFxkdjUnaoIdvrVJ2VezM56LnxV+Ksc/
 S8EuiinuZ8tpVeVM8/Q==
X-Proofpoint-GUID: XL9Pja2DzTsFb_mSPxfzjLeqfpn5UWoy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXwvUUgRUIRyS7
 xuylqOl+Gh1/lMPPBuY35EelssIwe7TxlKQ9kkMF+FBMeip1w+NIj8UW1KMwQ6rl/VQWXTKwywx
 jn4Q5NiLUyWg+TRIZ1fzWLdyYjiYv40=
X-Proofpoint-ORIG-GUID: XL9Pja2DzTsFb_mSPxfzjLeqfpn5UWoy
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb3e81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-w6CXN-5EBmt9i3D_LUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

MST topology discovery requires the sink to operate in MST mode.
Enable MST on sinks that advertise MST capability and are connected
to a multi-stream capable DP controller.

Once MST is enabled, downstream sink discovery and EDID retrieval are
handled through the MST topology rather than the primary DP connector.
Activate the MST topology manager on connect and disable it on
disconnect to track the sink topology lifecycle.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 21dadc2e6cdc..e913ed91bbfd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -269,10 +270,34 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* Clear any pre-existing MST state before enabling MST. */
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+	msm_dp_mst_display_set_mgr_state(msm_dp, true);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
+	enum drm_dp_mst_mode mst_mode = DRM_DP_SST;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	const struct drm_edid *drm_edid = NULL;
@@ -287,14 +312,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) > 1)
+		mst_mode = drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd);
+
+	if (mst_mode != DRM_DP_MST) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -316,6 +346,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
+	if (mst_mode == DRM_DP_MST)
+		msm_dp_display_mst_enable(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -499,6 +532,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 4c0ad3dc5793..35193cf45a6f 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -361,6 +361,21 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 {
 	int rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 3bd3e66b4eac..84de7ca0c689 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -12,6 +12,7 @@ int msm_dp_mst_mgr_init(struct msm_dp *dp_display, struct msm_dp_link *link,
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

