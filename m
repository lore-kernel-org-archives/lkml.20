Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBE3DDDBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164358; cv=none; b=rUwntnHosRD+UXu3jVPiJccY7KDOfXFuG4Lk7mU9JgFOy6SUBkdU3SAOhl94NKTI5rcWgVzrSvNy9IFXyz3keGw4U4is7AAK7Z70zKfo+eAjQBCUylc81iznrcGvLAqjw+tFUSdLwKxMOYj0ZIGLxIF4WgXqaYsA/S08l1q1+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164358; c=relaxed/simple;
	bh=Oy4ARw4by0kYhD1OMSYIGPR7NRvIQSR0y1PyXC2S8d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYaupoqYBlyNmSLPyzb5kezFW13D5ewpcHzGfqzHre4DdGIQlLVd90Tnxg/CeMQtT7qNlzNFYrH4CSKRW3jbo80hG01K9nCPEKgxagqePORX+IkHpbphm1HGkmSRW7Dandpy4rKSK85+J5wJjtrW5nzpbwc/CH/p73Ukv74kPsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nx0r306k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWuyUS/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nx0r306k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWuyUS/d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xTwn3018719
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BdHh4OWTLUAl/9JW9arAi2BIKEdDPTCN3xniys2XcI=; b=Nx0r306kO+oECOex
	XQg7NMmrCTR8hnYjbgbRUhyzHa0lSTnAM7DKRRl+gS3VZHdE7cg8QwVR/7CHp4AQ
	L54xuUTgfm0+mGzZiM/UMQt+ACmLByr0MY+26+hZwOOWA0dmqJpCFT3McuQTQaRQ
	/SeWaafrNDrlcoW2TrzV2Y90Uf655KGaachDQ1YwqAHf9Mp5DYjF265pvAOBfePQ
	jx7vtH1sq7Bojfrw+GQjl1oIp4YQKJM66sD0B80zMWSOB3DGQ4a38jJhkOwa+tfW
	ji5vqBQIjd0Xb590JdIwJVVE1kcNx4K+rb9PAZKUx4uWw9AGDJebn3XIPNM6FmDy
	L1vShA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cddf4f59eso26739626d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164355; x=1788769155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BdHh4OWTLUAl/9JW9arAi2BIKEdDPTCN3xniys2XcI=;
        b=CWuyUS/d3c8veL0oI+RrgfARHdADmzvyw5U/SKtfxAHls0ZOdklMMagMHuyqLS8F33
         C6ZKSmS+iXgPUwWJOAfcp9onRhfwRHXlZch47RhBjNGHGpgrF9xZsr4qDC8FabIQWm+F
         c+iNf/9UzyN6DdI60npd7svseHGUcdH3phxaKhvWirttec0MbBCSR2uSFsyrkqwzRnnL
         7gQywvcCuXIezMmO1CZ8Z4dSgvVjwSNneRunF1zsTBSBO8TXbTyXvSwF+3oxD03ZZPMQ
         SSjKHobW3vIySj1kiG/Is8/aFvKGFsc0wsOxKYA0iq3zFcarCSkUYA75+JExZ4EVyzm5
         8J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164355; x=1788769155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BdHh4OWTLUAl/9JW9arAi2BIKEdDPTCN3xniys2XcI=;
        b=LdExsfFhQ0wku3YlidczcZ0xJ4kY4e7noh+5FJuC8y4TEEuhhfnxdtl7a5F2q7WYgj
         y81M7Vua6CDYlL7j2hWaDD1HSoxmY1bczsUHcJSXbxdQJDRBUiNSS4ibpOdinJi3NW+3
         kKFLMS7PNAE0O/fMOOthMGPK+0DOTpwmE6X3SrjXrUEphio+wobWDkQO3nuVzfuY18+Q
         LJh10uBtLo1xV18nEUuqvrZYQSqD+MybwOYMdDWeL2NnExaCjnZ/T1Qj/SZQLLfjtMf0
         kc/wU8yHamnDLz2+oI6ZYVd6RsmeCDl2xPFWX4dDnrP5CkTTiwg5X5hI6BXDA0SqNKSy
         nchg==
X-Forwarded-Encrypted: i=1; AHgh+RrTIUXtOCM+1H80BxJSoSlSM75wmx+NS2LcewhjB+ODt4OpjwUof+jE2kHugVljiRkaOM8+uoz+onfzP6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kVpKT863Jd302QFcEVdEzR0ob9KuMJfRH82CpqcqV9JHqhJ2TF
	KCky7a7KTlS3Pajme5jGwsCBS3BaRHd5bAvw4QxB4YZOa5BisfDL3AyAZVQhFoUNk504+VRy9vM
	iSLu0eBnywRCtzqjF2DCLK3IBXUWspVCFMHh4heB5XtKC52AITdEyo8gqpEdc2oVTecM=
X-Gm-Gg: AR+sD13/L/BeSCD5sLBv6k7wCx/Pp0FOV+l2DisCZ7fT+fgXM70kpdLf24woLD7vDmg
	tiSJN8UI225W4HLiJw3kQr83PlyEJgzlSPFYX5HXbpwvM1VeZzijrdki9SRTbKEqy1Rhl4kGrVI
	skz05ZgikNeybslnLgnrP3aHxGKvd6CMU4XJvWD5hIqqo1y4wN7LNJ88x0eAuQFOuP2N+G3odw4
	1Edeafpx+kA8i6Lt7xNK/lsr85dhNgBPp7jCOeuw1JEoxUSmalMdQXYqWkuQtkiffdyg3zsPn1N
	M0RLbv9HvGg6RftLRYNrkETa9TOJK4EkzYWYyeUqbDnqfrv08fpBK3ZXaNI1Ac1DZRjv8AvbEOa
	ZysamRTWBLBVlTXTkc9Zo1q0iS+GNJv2YeBkUHFHhyHIpr/dHYLT9DLufukp02hg=
X-Received: by 2002:a05:620a:2608:b0:939:3885:3131 with SMTP id af79cd13be357-93938853498mr713345485a.3.1788164354546;
        Mon, 31 Aug 2026 01:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:939:3885:3131 with SMTP id af79cd13be357-93938853498mr713339385a.3.1788164354042;
        Mon, 31 Aug 2026 01:19:14 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:13 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:35 +0800
Subject: [PATCH v6 18/29] drm/msm/dp: introduce dp_mst_drm module
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-18-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=7475;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Oy4ARw4by0kYhD1OMSYIGPR7NRvIQSR0y1PyXC2S8d0=;
 b=cv4mVv8fysTUD1NECx0J/+HKVOjxbEKrANbL7lmNviNfPOcg8pNJLUTDlXbrC8itDrucGGVgs
 PR8TXeBkZ0VDBGXMMcSY1BP14K70OdGEP62vdBoCIFV/GnvyTQ8b5bJ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: Jt2n8aChDNbT8IXu4eN_5iDstvXXVyA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXzyvFdMGxlDcd
 hfQq//Hh1KEcYyo6IdfWxhXgeGHYBPUQJ09MYD2VZnakHNRiJpqMCKJ0uxPr9AC01GFPDRe8JW2
 YD+ygZO2roN8uOhEZ7JzT8mhy65xSAgdRoWoyH1ig3LcuZ3F2g6tJXd/K1XSiGpte+aGZ5es3qf
 agDAh21VK/iXw/rrFPE+wScz96QWzGJqzMjgwhGNYC38DrQ8juy2cA3Q6utT4e1Nto3dHNRyj5i
 RPmIgUYwhdQ2gbRxVuL/mXOqDk1lA2t9U/2TMCgVymV5yRQT/G2sh2KjYqTBpsD7X+7BXltExND
 at0iBQoRdeFGIRNH2PIvNZPHoqpMUstCvEMLRTZXEWu6F8Aq6UEorGeyMmXDlaQN6lozmcLW5ei
 8YTR2feut+UFf/TdnHiNXjrIbe3GXAaRU7bGa1Uxh3Rd87i1EXR7yewnxLVBkM31oLkHgx8oi1b
 tB97PTPeJFJc7vWQv0w==
X-Proofpoint-GUID: Jt2n8aChDNbT8IXu4eN_5iDstvXXVyA_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX6fQfOC94G4lX
 ykLluGS76HaahEGZZFSvqMXAJ9s3blNPlLbaTVqlY18DSdUgWhDwO5QkD23HCAeMPvAPK/VZCeN
 8Ub3Ps9o5kIOu31nfIvAOzfX/IJ8TIk=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a953903 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YtzpOVx_IWpl17dmJv8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 19 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h     |  4 +++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 54 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h     | 12 ++++++++
 drivers/gpu/drm/msm/msm_drv.h           | 12 ++++++++
 7 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d0c3a4c6703b..31a15636958c 100644
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
index da3556eb6ecc..66cabac0a726 100644
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
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6952f83db006..c015af868801 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -27,6 +27,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -1270,6 +1271,24 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
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
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4d4349068c2f..ca2faf478c95 100644
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
@@ -59,6 +61,8 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
+int msm_dp_mst_register(struct msm_dp *msm_dp_display);
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
new file mode 100644
index 000000000000..648d3ec72a1d
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -0,0 +1,54 @@
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
+	mst = devm_kzalloc(dev->dev, sizeof(*mst), GFP_KERNEL);
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
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = mst;
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
new file mode 100644
index 000000000000..e54d49cf3499
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -0,0 +1,12 @@
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
+
+#endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb4bbae8557b..8e98f7eb8724 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -357,6 +357,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -389,6 +391,16 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
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
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

