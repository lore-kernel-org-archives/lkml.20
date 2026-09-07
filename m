Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334C4CB8AB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786059; cv=none; b=l5CPE6R3jSJYGQr5nUCbQpGhSFU9b2kUVay5momW9xLA10sKurvRNRG5ruc/yfJuV4q4MjlpLlf6kbl+tyZa1leXZbmRqF35qLjE1NDMVSjLHl73rM1ppsfgUfTC9/7FV/dNYwd3oTR34jFNq0iwcWK2Wb+MgWQicRNpDnzoigc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786059; c=relaxed/simple;
	bh=gCPjQLee8IZ6ZI1o3PKvV9FFsQQqDDwLDIvAlHVSnmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvNDT+37vEg3jEvhY/ItOKWQKew73PJhZnne3eGBdMGsEk6XO9Fz5vsdrTC43SEJUiVcaDvYMAmXJfYUr2Rov8J2hwYOcBG3SIHegAJdokeZuImq+Co/Xhy0BDBMfg/PWWsNnDc4IRDxvUdJpg8xiadLQOaZ8/z/B+BomkA0cgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=larfk0Wl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEuXZiim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="larfk0Wl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEuXZiim"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDcb004214
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=; b=larfk0WlpEup5H3m
	Ee/0P6ULDeJf8uBNe18+jf18aEKhu9xGfIFxIttialr25DSZEavIL/551vZ+uQaC
	OwZkD8yPg4ifSq+CuBuLFWbu4ShJZJL0YErS8nT3JsBzyo+uJppopbv16l8ZdCfx
	d1X2nHP3uiglbrC09FSelq8LJEHPGUEFbl6oMDgZ7PpJDOpie9rBIA+p6W3LoPo7
	ptfIvNap0Ql4lPEzqHzptAWl988S07yxFFTTLxvyiI8yX1sk0NIKQZucN2ttjHKn
	PAMYo9Lgmt/bu6poZlLRhwWd/MRH8IvLEW8yiea2kA+wp9C1ziZKcrxoyOiEhXFM
	JVWMsA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg13a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:00:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7563011591bso302185137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786037; x=1789390837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=dEuXZiimvydS46TF++eIje/CG4MaS/xRtTZkB6Zai11uz7Ia2ML1MDb6NimiWJvIH3
         DLN+H1gpgN9kgpMo35Hj1JwcYlRWNdrr+b4NjZel9mVvhopTKUSRAAJ3WqAkpRe1ggH7
         gXAhFr7yGP2L7XNdo8Uwz0CTM8auuHeJD1fLzHuqeywpeCFKHcf4ERSWzHcxdbAttOP+
         cjvwdVkDPfdbKkPPEqrU4N+8Qt6WMy7Qqcm8FkAsWJwyzhOPSjADbM9KgkfWCug3wq+3
         /oYKxAS3WN4kiTvk4DX+HGhLM8iEBbzjfuF/p5zi4WY0T6knb65Q+QV1UDxR4TTphCKf
         mhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786037; x=1789390837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=BZ6Vslb5LoLoHJNwgnUP0VcJ4mkJZsIKrgt3Y5t8eOVQj2fGbP1vrM4yP2ScJVX+o7
         rAKBXbvHUjoCsk2hdiFw7j+CoVotoE1hTj8dL9a3K5EODbJD1MvT5DaEIPt6dhB8nVWK
         M+hKHemGFYNecbv9mdMeFjTVlwYjn+hB+EYB9siaGflxAkWsdxiWOabkTNEef8lFRy7B
         RuXCKygDzOcAi0rJc1L5ocAQXuNxhQ97SyRa9u1jh9NJQOlInnI8bK2a0JlnoZSzMrE4
         IeaI9v05Zk1OwxVopnUOjl2tUV2Hl5xV9t9Mfqf4soCkeOm5ZZ2h2uWK2fTPbkivudTB
         adSg==
X-Forwarded-Encrypted: i=1; AKwUvBz3WkJnXZuoIT/rSQp3YdR8jke+7Nx8Zhd0u2tFwTjxODHaTyVFj/Nm+bpwjc/bYY0sVpxj3bB0cKdp0LQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nKbtZt+sib8SPMFKl6wPwVHahORSYYhQRCdf4mFdMaNpryYyj4
	rXB8pIuiLBjs8wbMRDNICjaiUZ2vfZjpoM0JFuEZflqz3zYWjGxyoPo5m7DLNIOqWEgcPCCSSRM
	A4hPPYSNOp86WhbVNQ/kfqsilIlgwocCIZpQcNMCSv/2/wB2PulHWT5cCgX4VYEbHPcg=
X-Gm-Gg: AYBFou1f2baaWeQeXQUmH0nWahg5xPY19eCxBF7TEWdO9UNUnXAtL9f76dfsLoF+s4C
	cTlbRWLPC84RlEv3xropZhl/LDyj+exhnXmdaXA5zmbj837NLqCNRXMm0X93JQHnK7K6uHMRzgm
	ZUkA66Zzw0l7GUSMPZnO6nmcg3jIyknbFwzxEjW6wAF99JDd52j6CHxP3q9fEschEnJ4Bx5Hu+g
	9E6CiewDAK7Y469WQcdJy56QKZV7YSx0/iOOXLxkr8pkYQwELlAbnVIFJUNKhaFl/4pIEjuh37P
	XK3KQMaJNKR69qRMQGRFDnItpgCOQWlzYlJfoW5jgTUHlmRVsqY2LnZsxBoJCq5bXKFqW3BB2z6
	cAJ5TkKC7IeIkRi2FSgHFxbs=
X-Received: by 2002:a05:6102:5091:b0:78a:8a0:7126 with SMTP id ada2fe7eead31-78a4aa97d5bmr6957323137.10.1788786036757;
        Mon, 07 Sep 2026 06:00:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:78a:8a0:7126 with SMTP id ada2fe7eead31-78a4aa97d5bmr6957293137.10.1788786036018;
        Mon, 07 Sep 2026 06:00:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:16 +0200
Subject: [PATCH v2 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-2-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVl5qXohDCURU+NBjhbzxqePcwXPR42atlwW
 MKZXfnzXIqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61ZQAKCRDBN2bmhouD
 13MLD/499ImyZNhv8KqXl37bfiQdgVu9Me30Y0fF1ckmJODd9Kkx2yUhO9VjmaeT7PgdxTDZzxu
 flb9jXTKAnkw0NGD1hd42UsH1Qkh1qJ6oD9EyqdPFwt2U/jhZFYCrA4O6GQiqAgjrgtHKOxx/HX
 f4QQ/+6h4ALMYtMDlSboskVDJy/L3QNA/hVVqhhp6qv+6Uoo932d8kCe88jVAbvrtxRfls/nO7z
 oR/mIRFUIJ9ly1p/4DTJgWgWADs/cIQAw5uBUszxsg+jvJkK9quTp7cJ7a5nXqoehBajDaj+SpI
 HMQKNWX7WfkQoMyUNGRmt71fAOvRb9xbfU9YUnhg7MpH1KANwJWU6XlKzhKnKFs92lz+Tky7MYz
 wjI9BTQ30YdhpON4qjuotYrA1JMnmobv4lpY4ODuTqxndsik8+AYPtMRB/q8R6xTHvhHbhM0cim
 UnnvfML8SJdnU1nkbl8KKH69Xj9FxIy5ztYtzng8ys7YQfXZ0hxtMKw747WPyGPdrI9JwYr1zDa
 hbhVIiTLQ6DitBSoGJRCXcU8up8kDjabFU/OpK4vAt8M6DkjH8/w9mYhT7dnGbX3a0gsqAqvxXm
 qJL3p/bK1iZivrvdLFe6O1r5cwRor9QBOxn2kF2DCx/hA2vjSDDYRKBOPDoyiLo3I7IsJSOYWEb
 QgNRexijnPWjaaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXyf5AdvRJ3h0f
 YpIgmKHpZO97MSpKHiz1w1/95GOhU8gx7FZ9897OkBcRQaIU0LMJlFFAIpnPZ3wRc7vPSjSXVLF
 abjsSQeIf2bpDYen5nanDOWlwP69bNQrG9xJPEqar1uk0pmWzYEtl8WUTs+qpxvfFWrxR/NIwLS
 iTBVpiIUqRuPzKOq9RzoIcFLCJbx/0PSnosgzQBXHH3npJQCKX2WKumhoq2mhVn5n4k8LoqYmzG
 jGsJAk8jvsBU2jK/CZgNqzsD32gzZ5vP7GEImt0oMGVjG4l1CruCW7yIvwaU2nM0YeTdtBjkv25
 y4PbF4rSwHUSpgSlRAmsYsin6l9SPShDyyt/PX0M72D5iib6C7r1oLOzFG0cZUhf+jRa8sS6Saw
 xC6FDd6QANGHprSPIyFJsW/J/tWUBhmxaUF8wk3JISSjOUUtGeNVG8FMd/GEQcN49wDguvnGHgP
 S7Q1sTHMg2EDhwjrvbw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb575 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IzbfGf_HrtPdoiX6LZ8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: occgiZzsUjRBcWfHNwznfeu0JIrGS75V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX+kdvDSR9I5s+
 N7357uiTa45U0/nuwH4DrVHwPG8beCkBA2wUXxVA3YnM0LNvyZo2RraBUY0K1oVdagHzYVYPhJ4
 ezXK03zn/8A1DBxJAFqBOrNeTEDX54U=
X-Proofpoint-GUID: occgiZzsUjRBcWfHNwznfeu0JIrGS75V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

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

