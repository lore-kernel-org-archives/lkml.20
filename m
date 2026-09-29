Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616973EBF0F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656077; cv=none; b=ilfuvB/+nZ9RGE8WypHPQDGJJKX/PuQj6BGojNoAuOeC+6hRd9mGHBkWteinwnR3164Q4u6eCZ4M2n1J14O17wmLu6pAc8+OrvO5YBOeZBjf5a5tQXBSUijrI5ERBY44+PL3+qJ4Ku7OFleIDfTMlf78S0t1I32sXHwwU9/IIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656077; c=relaxed/simple;
	bh=/3u6XoJ5zJTi65bsnGJ/XUglQ3eZtASluH9dgooS+NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7PUrCk27sxyztTa2q73XBSCWO9SQ0x/38jeY81e/bGuZxKTS/FgW0eUK/x4OP4zHXxoGCFFHoAP9kfpsF8ySeHCaCcCuPsHFGUOvvV+cUPjWBfrxA0r9izK3l5iI3dUUjOlvFixpdENpwrBPdEtnaB+ebk3Zo31lfaGb6bsNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK3R0aLk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdssffJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK3R0aLk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdssffJ8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47XLY3654789
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/eVhMF3TZccCaP3PV5lbh06vAXy5NcaypCocloSK3Fc=; b=mK3R0aLkChRsiTgq
	tEUNwQGVm2SYyWC9uGUVGDmYIgt0a/yMJb0rRET3cKXNkXjYrPZ+mhQX6UmqMp86
	r1zE1GHd8U3zkxLeJ5MWwXx/+pe0cqfxXJSW/4GDcP8v0hsi1HBy4j3xgc2uIic/
	ZUS/cILDXv8gwmssaNOrgQmOKMSAbljVLoHSgVtHlBY6aEwcs52b0jZ/y5VZb5Av
	MTBtPTXIQGSJw/fwwJQmFzihXmaFYzpvafDOCWpRfBny8q8v//gVHsF9PnJCDg8h
	hufHhBdfOjGXkT+bmo8TIlgn6vubgx7SZkptAC5wBAbwl9bTRf5w6dWd6KnQLLHP
	q9RahA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0jxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:27:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso13064246d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656074; x=1791260874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eVhMF3TZccCaP3PV5lbh06vAXy5NcaypCocloSK3Fc=;
        b=FdssffJ8F57xXmCZYujptnomWK7WyshmCegpMIrsRmkv5VudkU52/05uNBJsrj1F1S
         i4VnFVg8ZiK66PeTxZth1UTR18jGziBKVErIN+nwpMyPh9gvM6W2v3ydMhTMOahYAZNq
         e65/3B7T90a6uPN48QUMhClAp1In8oKP05dvs0F43MdyoTguZA973XrReBtOHXddzGS+
         xvwFHtFFwjjqmbzoBfjW9UIr2opGnZAaxhb8YzYgnEjz0b1WVYmqv+XFvEjowPwRRwcO
         V32pHZnxzsdLyEZ7D38HH7CV0vo/NWgA97y1T8Nj+JlMbVLTaTWyrIiNwsO63CpOWkXS
         QSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656074; x=1791260874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eVhMF3TZccCaP3PV5lbh06vAXy5NcaypCocloSK3Fc=;
        b=X9zGEfxJOKDHfP6MLzKqcFDQOjDnuoPW8QRzJV5s0NopoVKXDAycqk7j2k9WQOuSJj
         Qy9AdtbsKjRok6OsoaXe1HSols+59GD3sdGW1aigYY+x2g8UgU8nL+bU7ZxRQwYAN46W
         TGqQKxKNj1CWtBOsYilUoCiKaGhfKCEPeDtFTA+44JAgF45WlvDMLvooD+VehPhaju/T
         sPkylh4w9Moj0cLgshXxDEZD7dNQXWb6S1HpMV+kkiKR4abAsmlyAKv9iyZxbDA0tEK9
         2k8tWIHuk8htWe0AihGO8N900S679Ng0ebjGD5PxuFAyPFO6dzbJPO0uDgQ6KGxtFEP3
         ZRqg==
X-Forwarded-Encrypted: i=1; AKwUvBzLUmdFMz9C0mq5YIqP9WLyk1PgR9OsBbhDeIbrJN/8OLYvrnwRquij3Br+Or8Ab4EvxQcxh+hA0AFV83A=@vger.kernel.org
X-Gm-Message-State: AFuF++mFOK2iAUhH5/cNfoEJ+MdiZbyXvF8fBaF77Wb5ZbWGE/QqHy5e
	sDp8YaWX6Fbej+s6rzvx4nsKalKQWCDtC21O4MocZmS8pywoZ4huUo8U6Du7RQs5TEaqmy/fyBH
	L7XA2/p1bPBFgI9ScwXKXvzGzAqP8QZdF2siZUfg5CzqegK1MbjZQK41AHut1dzCU49Y=
X-Gm-Gg: AYBFou3QJKf6MiPwNY6UuwP3gvUKWwdAWMex1h5ZE2wdlvTU23rnJJkn9di50KMZz8G
	5p1WZFHXNcf8BPYPMhAzFYmGXee7JAuf/40KY9Rg1soG3wtkTbkfvFtsZCwioxngWwJ737oHB//
	mnCuO+i/zd11dnP4QsF0hFvE476OQoNCRFZ+lJAK1HeNOgG4EuwzkVYd7pXUJLrKm0qLbm1Fysb
	d9ttzX3vvXp76Yh+orQdbGPJ6DYQMgRmzGeK1m7jvtYvo6C7/D9GcbnX68kDf/mlTjlJAfKSXwl
	EtvUFZAV0QdzhKT3LXUETl6SrCwBcCQws6jo4cYKh0cnHGTiY/8Vn0/I+n9JPydn8rIW1KcOirU
	IVB+pGxVdhhscJ5mOxJX0YnabALHfx6BIu5Ywl50ZS0JkcxmjJ7tgpUQuaUp9Cy0=
X-Received: by 2002:a05:6214:234d:b0:916:2649:b174 with SMTP id 6a1803df08f44-9162649b475mr88896786d6.1.1790656073521;
        Mon, 28 Sep 2026 21:27:53 -0700 (PDT)
X-Received: by 2002:a05:6214:234d:b0:916:2649:b174 with SMTP id 6a1803df08f44-9162649b475mr88896566d6.1.1790656073082;
        Mon, 28 Sep 2026 21:27:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:52 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:42 +0800
Subject: [PATCH v7 18/35] drm/msm/dp: introduce dp_mst_drm module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-18-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=8701;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=/3u6XoJ5zJTi65bsnGJ/XUglQ3eZtASluH9dgooS+NY=;
 b=4tvsLfnamt+Cayf8c/YBMnYMIMXy6/TjGsEXWsDrPAMnA6NSAHHjAG/VRRvRsmS8MHRT9RiUP
 TeBrOKe0sdWBkOnNEtjmXbsBWfGQmVk4NGHzuC2hZtJaiaTYyuGqE8f
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX7sVhT2+oh+ow
 JV07s1ajWIiv2ErneunsuFbSSQnUh5Lu97z5Kw3aJhx7PDMq3VvEymw9dQDklCqYDlbMUZSCVoT
 7dbqmk7RjE9/5F+sqpghaISpy/KQ4Lo=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3e4a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kqK9UwV0UgyvWCtWq9kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0DaU4UUz8Z3D
 fiJD7YYuEymkVH+H0BXlN4WDtlTEdCdYFyXdBrxTbJ07FHrgP2WgWJrrTibGNnMOWmECW9vlmLS
 i59RXL6rS/sPSZVWZOUda+A43uaRQjs+SpaxIizSgHpRZIGUPSn9PwaS74DmtAUcD7TgTsiw4aM
 8JAhvhZT1ctMmucuHk/8itRfbUwfvONm6wh/nQin5W+p7szLVIZ09KhRC2ZYALqmrhNq26n8Tdy
 wZS3r9yscB6AFpH97seejCuCTB4PI2Tu/eKgMAm5PSGxhRozBfmajKEJF5BMCOO1oGwVy+Mcb1w
 0bL3MKF6dBpvizyYcyZE+bxaEBmvCky8lMWcGWaGoAbT3IM2cngZ5wc53+yRmSX0d0/ySIoSgBS
 24yzXYJ/W6Yy9OWz22l0e4f/blIAsIYNSR0Ye2gRUvntiWlJleJdHCYbFZcnxO3A6RsAlRwGLTU
 DqNF9mW5f9RXvCGGSUQ==
X-Proofpoint-GUID: 117K6n7ZkQMnwp8xWj8xg-BbIANZ_tw5
X-Proofpoint-ORIG-GUID: 117K6n7ZkQMnwp8xWj8xg-BbIANZ_tw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

Add the dp_mst_drm module and the core MST manager data structures.

Introduce the MST manager object, per-stream encoder state and the
initialization path for creating a DRM MST topology manager associated
with a DP controller.

Also add the registration hooks used to initialize the MST manager
during DP device setup.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile            |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 19 +++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 27 +++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  5 +++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 67 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 13 +++++++
 drivers/gpu/drm/msm/msm_drv.h           | 17 +++++++++
 7 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0b8f2cafed19..e16d3ebf651c 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -145,7 +145,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
 	dp/dp_audio.o \
-	dp/dp_utils.o
+	dp/dp_utils.o \
+	dp/dp_mst_drm.o
 
 msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..7ee4e7e4d34a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -655,7 +655,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -678,6 +678,16 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->kms->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
@@ -905,6 +915,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 static void dpu_kms_destroy(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
+	struct msm_drm_private *priv;
+	int i;
 
 	if (!kms) {
 		DPU_ERROR("invalid kms\n");
@@ -912,6 +924,11 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	}
 
 	dpu_kms = to_dpu_kms(kms);
+	priv = dpu_kms->dev->dev_private;
+
+	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++)
+		if (priv->kms->dp[i])
+			msm_dp_mst_unregister(priv->kms->dp[i]);
 
 	_dpu_kms_hw_destroy(dpu_kms);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1d1fb45024c6..e322176163e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -27,6 +27,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -1277,6 +1278,32 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_ctrl_get_stream_cnt(dp->ctrl);
+}
+
+int msm_dp_mst_register(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_mgr_init(msm_dp_display, msm_dp_ctrl_get_stream_cnt(dp->ctrl), dp->aux);
+}
+
+void msm_dp_mst_unregister(struct msm_dp *msm_dp_display)
+{
+	if (!msm_dp_display->msm_dp_mst)
+		return;
+
+	msm_dp_mst_mgr_destroy(msm_dp_display);
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4d4349068c2f..df5021ba7c15 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 	unsigned int connector_type;
 	bool is_edp;
 
+	void *msm_dp_mst;
+
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;
 };
@@ -59,6 +61,9 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
+int msm_dp_mst_register(struct msm_dp *msm_dp_display);
+void msm_dp_mst_unregister(struct msm_dp *msm_dp_display);
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 000000000000..5d22aa34c521
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
+
+#include "dp_mst_drm.h"
+#include "dp_panel.h"
+
+struct msm_dp_mst_encoder {
+	struct drm_encoder *enc;
+	int stream_id;
+	struct msm_dp_panel *dp_panel;
+};
+
+struct msm_dp_mst {
+	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp_mst_encoder mst_encoders[DP_STREAM_MAX];
+	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
+	u32 max_streams;
+};
+
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev = dp_display->drm_dev;
+	struct msm_dp_mst *mst;
+	int ret;
+
+	mst = kzalloc_obj(*mst);
+	if (!mst)
+		return -ENOMEM;
+
+	mst->msm_dp = dp_display;
+	mst->max_streams = max_streams;
+	mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&mst->mst_mgr, dev,
+					   drm_aux,
+					   16,
+					   max_streams,
+					   dp_display->connector->base.id);
+	if (ret) {
+		drm_err(dev, "[MST] topology manager init failed\n");
+		kfree(mst);
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = mst;
+	return 0;
+}
+
+void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	if (!mst)
+		return;
+
+	drm_dp_mst_topology_mgr_destroy(&mst->mst_mgr);
+	dp_display->msm_dp_mst = NULL;
+	kfree(mst);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 000000000000..7f35e7524cfd
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DP_MST_DRM_H_
+#define _DP_MST_DRM_H_
+
+#include "dp_display.h"
+
+int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+
+#endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb4bbae8557b..b14f097ae8cc 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -357,6 +357,9 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
+void msm_dp_mst_unregister(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -389,6 +392,20 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return false;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
+{
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

