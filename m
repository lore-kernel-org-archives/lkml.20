Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286593;
	b=RRhGeXiYgPOQFD3IZCtvoSRYjgVrj7ph/qiiVg7/55xPQKIl4PF3fSakRx8P1v/QyfPu
	 M+WmjF7aUK9Qz9F5AL38no7AzQFo8EFeN1A/mnl073K5INKT4wr1qgQ+0LDLEjatwWmsa
	 5QuMZS1lHW0ctTuqRpYc+SfrG23tYwDTbq62UIT2wwLJuv8f5MZ0/6N/ujjLQAIvGxdeK
	 jUvdyFl8oDjiLg6Jgv0vpV50TNJSBQ2ff3fZV5ZirkSgh107NpSa6xX9uU074960lckJl
	 Bz5O76Geyr8qrXTsqdgbVtNuDiUX3iml0BWTmGvH8s67MEryIkn8a3KCL18HqERY7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
	b=jLORaPdjbwjzaP1DdgBpFKSnzhBZPfFJoTdk69U9CSFRUba9taIp3O8DGmXF0kFJNM4Y
	 15YDSaw2cHig5i6ypXPH9gde2VpLNfohQZ/XT4untAQjQeu7wr0f9BXwzQbXX0pZ7NnuR
	 f+z6AXBNtVbr90jCLI3ElJFRz5CRqYZFus6vnDjfgrvJnBgdX2LGduqO4S6pd2+EQJLF/
	 51V66KyDqI5KvpVxUkwSZUzGZ6ic4VMKwzSC7sx+JmxcOox64q+w2rsUWWmIUvn/AxRLl
	 jh22jFkZy3yEp6fs5mJ3sCC8mLLUcXnID7/lD+HIrg0sF9N/f9NQbQMRoW5Hh9cXB4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7wosx5r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDLHLC0j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B956606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B956606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7wosx5r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDLHLC0j
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A8lQ1207780
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=; b=E7wosx5rAIy/sM+8
	3qCz8bXrtb6w+UuK1nBMioV2FuH+Ik67j5I27SPtC87BSE7nW/hS3WATJMf6vfh7
	tBxkv7NOpNDU/+O+H4iyS9fGK1oe6e2nmdvyKKKSi8eXhcfb0eudDvDnD4vj4Fi9
	9YVGew1FGUtJphXIi9Ip47CsKsLl/1Y4wchXRR6FYLVzcuvidh3ISwfKs3sLBecG
	xvQwCklWl4FDGO0R7UfZfzOowYsFf0B6jp2SSdHK0gvaGqZEALEamB1PBA1A32FQ
	2fW41nLO4/Cxr8+rRp8+E853n6MBu1QCh0IGqWm/Zs4kHhyceUMEiVqY2YNV8SNl
	2J7z8A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebc622dc8so44814576d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286591; x=1794891391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
        b=CDLHLC0jxCBRrR/ro9krjjLdTYzrLoc+KAaS5TGs0sIqdEYh/x/RdP6T3wXAJAGnJN
         xEwqCefp4n4j5ZLERJkLKNYpnWeFGiSDNIdRD8ZOT5YVy9xI+5BnvFciHGb+BedlkuE/
         bvyy5fTlCvKhWLuxCMmSCJKwPZEC8Fw+ikD7S9Nhv7TxUg7XWWOE3EpPw4gVtL20J2en
         mjkjUONRYfh36tB6/sxmyA8kSfLjXG6jws/9xAvSraa9+OlvuMQ9DpEkcIC6wgdmbo5Y
         SDVHsogGsgwwZLZi6yzmt5ILo3Az2umztu4g9uKvbHQssRvxx9n7A7D1qDTiS0u5TFlY
         b0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286591; x=1794891391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHoKtlWw4MdcYFAmqyM5G73oF+4uGH19uwdrJT6LYX4=;
        b=jfPS6xCsYSD4QO/U0GOzDUtKUhtH6ofQ4RSqSy/V8dgoj18vmp27YZ3SJpsIe10CUI
         qZqq6/YnT5p27BD9MX+BmUYD2ZXwtV+k6zou3UmHlzaAfxP7HomW801jUM5MBvGH64Ea
         nwpqQXaLeEGWR/Zz+ahaB0J6tIEXKTRyRhu9dRrR/L5/fCUN5zd28klRCxrXpE+LUzDd
         c4fkq/Wq6iSWGEipzwpp5TtLvpKQtMXIVvyWswgpjtA6nCzJulXJIpRUzoulER5qzvt8
         SUABxJ50c0+sD/+4lAoWPuwolmC4b0zV3tESe2VDrPuYnEmUC2ZWK1dwrqOqE9Qj7B/0
         ISAQ==
X-Forwarded-Encrypted: i=1; AL+hErEj1Tu90ChiP55cBdABey4mdgD5JJFi2Ygt1vv9gCT3aEq/6gJSguBdtru8hkIuIdsQcri8eu1dzprm+Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oZpFR8y87D/FWaGvqkbp0wSHiBDQhF5hnFIPpIs4Z+zt8qxwZ
	FqALi9tHvQkiL/Pa3tTSyqf/3k5neoUp28ZK0q870z7iTfzzPuJsQxskO4yjYdKGeXs9TWl8P0a
	kv5YeJ6HdePW0+TzUmzMRoHHAiZf8S8hZQLEa7Rlkt2Ca118THPZJwqlxDUgtceqNpFo=
X-Gm-Gg: AYBFou3kNha8My74wARcLtmqMp1t0F3TWpPtNw1rKeyenEUyF3fg6SWXM7B46Mlis9R
	k1egDPItvfQR+7L2/fpKWlw4G1D5CoX2XoLLA86VUMbl7GslCozTt6fYp9Xz++Y4DreDG4oesOB
	UKOTAjbh1WBy1WHwTRwiR/axiA+sRFvAuSQfCa/aB/Ycw/27SRNEpKfECQUa+0zCM7Zy03X+eJd
	ApCrzmHEsXPK7QlSNgoy7BiIQjshYiqBsXC8u1vbihQL5LGrWQJa+p4Lbk8jKbvTjH/C7CNT25t
	Z/tQaUiX2av+qKdtmHQ/VdDuYRFAKFMGlXVEhhhG0hPuM1U+VgPBHlmG3o3B59fCVP2ppghL2py
	RLbi6AKq0pr0ehR/Etvo/uCDJMrNlyRwafHHDq1FTEzIwKDRURUP28mC8ztGOQjP5q55mZ3lW/J
	1GFIAP4cyOh+WWqhFnBukgs59wme3VG0sYdVEt
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr235196885a.77.1794286590932;
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9479f42f4cdmr235194485a.77.1794286590434;
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:30 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:45 +0800
Subject: [PATCH v8 24/29] drm/msm/dp: enable MST on capable sinks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-msm-dp-mst-v8-24-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=5632;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=MQxn5IlgLyQD5lvs7GYrzOJlBKGomT/Bam5EUTVFUfc=;
 b=pqZSBqM/KXCOlw4EjXksUQ8SdzCIZAWlXsfM3ImxYIWXm1ATC+5t66RSCeWSpx6vnuvWSxaH/
 QfCGsnw83EjAGn6V54d2TbYTDqyKSseO5tNPNy7IYCSXN2wLr/pN24U
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: Eyy9Xh5LsdVRHh6R3Yilz_2sqeuam-Lk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXznqkWC8HX59o
 tdls/rf4RFASxFJbOBFgd1vz/6OrX6hJa7A5E1DdujmZJPAnbs54poBc9VwpVACzuIPPE6R/M0D
 iPx2JqNAet8c8+ydW/u0PreCscl8E/g=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-w6CXN-5EBmt9i3D_LUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Eyy9Xh5LsdVRHh6R3Yilz_2sqeuam-Lk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwZgFW3HmVOq5
 rzXfVB7t3fUQEXZYqhTFuguChACTTMSmRUjQ+3IMT1ZseJMtGYP7zl5rTp6s6vIRWwWw1sd0f6K
 R33Xg8GFAQcgO3F/DHN+Z5gO+FrPR6I4BE/pAnCqI6kfvt+UM2NtZHXjV18ksEtYggll86pXfXf
 PovVjZ3aRRCZBrV2Rz4k4hb9VvARWKXsgHoYj/ReX9mOaDR1uOANKl5P77R7mNIuKL+BjDBgs57
 Y0uMf3x/yh80MB1oT04gpqhkWlnQEgk8Xs3tLicRiTrSAFym9r1N8flctrCKkcrIfRmQfnPYunF
 tWXYlV5EhZjHLa8dNnVDIS0ITH/TonwBKPB1RrqD5xoyyZQbfXJEG+PJCxDE9INd/n4e+5TdTWX
 5uBz9r2nJXIpvnF2U8mq3eNYq1NikS7RU2XZXHzrgeNkE9S8pHqBLnG1mxEqUkJBhI2uTNlLggQ
 z3rS+yV8DSSJ8RH+aWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

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
index f87eea19c4f5..eeb0e0494900 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
@@ -270,10 +271,34 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
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
@@ -288,14 +313,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) > 1)
+		mst_mode = drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+	if (mst_mode != DRM_DP_MST) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
+
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -317,6 +347,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
+	if (mst_mode == DRM_DP_MST)
+		msm_dp_display_mst_enable(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -502,6 +535,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
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
index 15405080107f..2b96e003225d 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -362,6 +362,21 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
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

