Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56C39E194
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851465; cv=none; b=NX4j9Jh+1NAGD747vOTAeE0gusEs2TPpCjcBvcIA8k1Ua2KxVbxVXu2Z/+vIZXBFHRCe9LdM7RcCtctAViZ0fc4BeGQTj3YiHLZIILY6sbpTgt1hzE+hCVKFAhZpffqfrrkw8QKA6L89DOkXLjE0EWBrdrWyIce2wolRPHofIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851465; c=relaxed/simple;
	bh=gCPjQLee8IZ6ZI1o3PKvV9FFsQQqDDwLDIvAlHVSnmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIsP3oE8k3c0YQ20ekEx/yhi7A/r71+CkHyhcHNDeIeq3ksG9yAjh1XqDySKuNcfn6X0XSxHffLiYWuXtL65Rki5KCAe3gb2YYk0d7YoHoZi2Jc+fB1IgKiGUbTuBYbwWNJxTkIcv4NT84D1hzhhvIVH4mkNYg13gPsT6kKl1SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae/v62/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV9JuV5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ae/v62/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV9JuV5B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LnVJ1645958
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=; b=ae/v62/Ia/7o/ONV
	uPTVJrnFMxE2KJ1Y4nwTly7EVJi2ddlRmjJ+rtVX0UdVmn4K441X+MOAVw6c8uyF
	kpneSqlrNGKJ6z0+41PpLx2ejHkBdH5C3//E/k279cH1lUUIWDC7STcDh1GLtJkb
	jxfUk1krGFylMz0Lnr4FSMttLzGSoX5T0p6n0WfmMcxgtv99T8Yds6xlBRsuvILb
	gga6sq60qiAFoPR5wOo1HO09nx7N/z12inrNYUsZf4zGkqRjW++/ZB95wo+hqdwT
	vN2sJ5MgqSKto+whf3EA3/xf7hcXLDHHtQKEVbK2XcPjZYvMwEj5VHr9FbXbl8o9
	vNv81A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvug7pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:11:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so227965585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851461; x=1789456261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=kV9JuV5Bz1qFzGB3ZdJNm1U8/YTy+KVKD23q2TgrUISvKLnfATgygonpu/VhvCwUqz
         GU1oJnp2sa29qSxn7MN4WZMd1/EcHpt6ceOzZniT5C2Qdmh504u6eJbxAIBsVpB+vBAE
         TKeHPLXlzc+0Ipopn0lbF5TiaoMF6yhYI/9aDt/Tb0kU1WgduaW3zCVxq8Yjxd6Ii3ys
         5FI/JIkEZp0Vsvn0iHbXEafYlGqUBULYMjFiu+ZyS8bIraP0kDMnUOX91RcdIP8cnsEY
         ys/lCYjK3GE+WRSHmbFPg6+PNWXFqKZ90uc0Ojre8URJevWT63UMm7NW08TH5XM9GDiI
         89Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851461; x=1789456261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=rj55Y4tBUga7XPEUrR5yJyuxD0dVSM07g0eusQmveBImVPzW/QZbMAPkAq0dn6Rgyd
         HURdOWqRqRy5lFc/IIVACwI2TBUWIbFMvvjKGKIykbjrLI66we+VcWUUtP9ZNYR0tuf9
         KIsc26i6H+ia9ZVxEJDw7B1ueA0RGfOfHVVv1X3TUCHlrbuWsjMSUsWh0pDg5TERpGi2
         Xp+Jk3/v3MH1XuZR2sNGFOh3UtScNG+zQHHTXR8tYEKZIy8orb/+uGZdcm6kyB7UYeOA
         p6m5njK5q00ZTSooWY0cGtE4kXDy0F+wFZ/VGDFkl9clnBLKVfxLSyzSqJOxKCXOD0Ch
         WYxQ==
X-Forwarded-Encrypted: i=1; AKwUvByF1VB3lI3vLLGlCAYWf3XBBiXS9iJjHuLIpX58ZkwarZ+Ql+XhnEVJ0UKwq4vh406HvAQaRVSc7S5vzRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kEMVsQ2dLRPgYAxbI6BwZUEhA4QyQCriJeOfnwO8xiuMQCy4px
	ZT26yMAW8iypTlpa1bwkmhXl9+AjMx2jkKYsglB/uL2ujFCESM+TqX9Sex2AFMvWc3X6g27FS7L
	1JguBLbcglpTQoJq0LU1UFTQ2JDUVnxEpqyopATPpWMpxEm6pQoWLZmhOsFNu7vWGOok=
X-Gm-Gg: AYBFou36KEPrgo+alnpqd+aasdRyZyd5IxjEDxuTtq4U9IsfFY2PP/wi1uCUeP9giXP
	E1/PNXXe7ORCzi/4Gyvhaa7T5KsPYHStLU8uwpl+9fIn11BjprBK5Rme5FfESXKv2hgbhP1QJyI
	/Hki2eI4PqM8SDP4Rg/zqbzRbmg6weBiLEOMqJOy6Yivmoc2VfaxVPnZTcktCV7aVtQF7MIkcPW
	DMtRUVeTDzHkDQazju3Ah37rHa6ywq5eYP8lgDThFOBmiyi5/kb79HnpJh2eN5KymDT+s2YxSoy
	1KAqIYEuPNyk2OkuhQGAIMKOwWCQbjiPnu/u2YICzHxu4JkCiV8eWzJmCMYlH96dWXrREXoXlaP
	cG9AaG3QH2O3AfDRClMXrWCk=
X-Received: by 2002:a05:620a:1998:b0:939:2940:6368 with SMTP id af79cd13be357-9398037189bmr2454042885a.19.1788851461268;
        Tue, 08 Sep 2026 00:11:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1998:b0:939:2940:6368 with SMTP id af79cd13be357-9398037189bmr2454035685a.19.1788851460804;
        Tue, 08 Sep 2026 00:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:10:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:42 +0200
Subject: [PATCH v3 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-2-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gCPjQLee8IZ6ZI1o3PKvV9FFsQQqDDwLDIvAlHVSnmc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T47t9PIoGOvtY3A4jGlgUHnqVJUTLHI1x0C
 PyFXomucWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+AAKCRDBN2bmhouD
 107ND/9wWvZWNvTtHTd/hKE/PbowEdSQof1zsPcrXjmwUH8OWj3bH1OjbaqDUNcULYAqqfb/r4l
 nUWbjdLAZ6SQHG3bXBueBsMpUu1jq7MMHUfseJj2CNNlgqDH+i7hNlXqXAYHTM6NlThoPOuWg/O
 qa1I+8NX+9dgncWQCQO9VL1DR4Do8TdX7M7uzJ+XqC6IPb9wygQw1P7OMY+0XhvY7GJRwDf76FN
 M0xqKxVyNJMOVJQkOJ2Dq1eSBVWM91sFSMDYnjVtef8tY5RwNweHiEFf2dK2sFAV2SQo+nXYu3e
 1te6/w8V52dr+Xf0SXg4ibI+/OEFMShpqrLYCh2/Anm4evONOc2HuNZOi0jeY0dpzCAm4LSSnNE
 ilWieia8LghXhGIXO5HAr+VCGzsmkKYJt2Q8seeuFkabnskt6H0IUD1XX9fWQL1lWDXsDl1SQEv
 CAuvaOBT76B7G39PFZ5jwQQk/Fry+AAJrRyPZfEH7VW8I8bYsplCOQZjYOLYEBcoH7I+3Kv49vz
 bE/HzBYaYOJCs9a3IohQnKLSCzkcy31sNhUzn8YDydxS8A7lr+14fO/dhtKSBRiF6s8jpG5vC+w
 USgHJ6OmNlmP4onu8C1WMoL0Xf0VdwvYHCuS2o/76Mf1sgU7hgFYMxQ2Ci/F0TWQdQy2HSJ0hxa
 3AcmKaInUP1iWrQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fb506 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IzbfGf_HrtPdoiX6LZ8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xh33_1CXfvSvHMokhIykO186Fdwh95eR
X-Proofpoint-ORIG-GUID: xh33_1CXfvSvHMokhIykO186Fdwh95eR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX8AZutp7CBgj6
 G/Kb+4cSauvzt4xIT34axDeLY+ZWw5edoA0hLjcQwUCDnShGLm/SUECmGK6NhYDrZEvC3/nVfE2
 eFt3X0w+iwul3UNZEgae50RMK0dVVAiungKbpOIB5Ow7gUvq2OKZ2MYuLXHlI2OR7+8ndSyKPgt
 R+2c9izf9DqCOfIO/iD5iW1OtxqPrJrJgA1EoboQeM6wsKJfhifBkPXjpsSOJkGGV5wlz81IRWk
 aGixiy4//g6TDvbj8E6SF6KRFdtBdelmAjmY9wjgT4exJrvLUbPsDYA/5zo8TLJZwH423QxvLox
 ivDFvO04/ZCkqQ4M9MBFcP7pd86E2qTlmGXoUfRBW6LR5AQpmF2Zj8xuOM4T1KUkCvRnfdL3uEn
 dDg675DyRI1Wf0soWGzbRz6/8BfP4/uCgUCt3wxk5G9AoNYozi+q6zZ4Py42KpBYObMDoieE5Cw
 fVbX8E9VI0dqYkgubrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX7SiH9GEJsK7E
 dhp7TYLP/67GIoE8f/yjxE9J0G8p+JnKbRlyJbb8d3ejJstBoAWfVrashsT2zSYxQXHS8PABydB
 xlznr2aO2NCjel9LSq00eyNUj/s9Iuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

Properly handle power up failures during .atomic_pre_enable() by
aborting the .atomic_pre_enable() to avoid accessing registers why
blocks did not bring up.  Otherwise this could lead to imprecise aborts
when accessing MMIO while entire power domain is off.

Cc: <stable@vger.kernel.org>
Fixes: ba3d7bf3a7ab ("drm/msm/hdmi: Convert PHY files according to new design")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 157f19bd90b4..db85400e574e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -13,14 +13,16 @@
 #include "msm_kms.h"
 #include "hdmi.h"
 
-static void msm_hdmi_power_on(struct drm_bridge *bridge)
+static int msm_hdmi_power_on(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	int ret;
 
-	pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
 
 	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
@@ -29,9 +31,14 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
 
 		ret = clk_prepare_enable(hdmi->extp_clk);
-		if (ret)
+		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
+			pm_runtime_put(&hdmi->pdev->dev);
+			return ret;
+		}
 	}
+
+	return 0;
 }
 
 static void power_off(struct drm_bridge *bridge)
@@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
 
-	mutex_lock(&hdmi->state_mutex);
-	if (!hdmi->power_on) {
-		msm_hdmi_phy_resource_enable(phy);
-		msm_hdmi_power_on(bridge);
-		hdmi->power_on = true;
+	scoped_guard(mutex, &hdmi->state_mutex) {
+		if (!hdmi->power_on) {
+			if (msm_hdmi_phy_resource_enable(phy))
+				return;
+
+			if (msm_hdmi_power_on(bridge)) {
+				msm_hdmi_phy_resource_disable(phy);
+				return;
+			}
+			hdmi->power_on = true;
+		}
 	}
-	mutex_unlock(&hdmi->state_mutex);
 
 	if (connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);

-- 
2.53.0

