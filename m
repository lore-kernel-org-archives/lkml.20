Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626B43E9D5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122595; cv=none; b=QLKaSDvghl7O9eMJnlO7ZIq68UKwnZEOCUg/9Y999bQT4VftoeEDbgEN1UEOODGpMcHIkhy0rZF7owhCwRr1yEAzpf7dMwVet/hh2hjyvmQPjdl+qQsCSW2q4VgT69QNzDcgmFUQVB9h11O6MQOvgS38kbaKuAaWSKr1oKAY99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122595; c=relaxed/simple;
	bh=gCPjQLee8IZ6ZI1o3PKvV9FFsQQqDDwLDIvAlHVSnmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W56uv28wR6NeGpgK1cgQLx3rkfZwlcgrOHvVNfWG+cn6Qi2wZc74jMBnQ0pnXWBdUnWZJRhNcB/HAiOFGcdQt4vXBfe2GJj/lRqAERBChlm4XuVhmcTUbZMfdUUTxK4Vw3+dQ+pDkobaxY50ZQ2Ve6vfchaJIBfALVcVMXho1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJ7JxI8d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIRzgTLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJ7JxI8d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIRzgTLG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kafV2801755
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=; b=DJ7JxI8d/CYTDOCk
	h3XPeU/Vt9kTF0Ban3/fyGI8v+8G3Ee99q4z4RXS0tKm3WnjI0dzL8fUL/ywhviu
	ceS8k8+WpGiC3/TrOHnI6w6HAztiA1kBTFarjVYYW1HjGsMG6eAvg30r8TLwZDjv
	8DC9KkWrsExoIaZsmM5bmhwmMO8nqr3JJwW6kjlvhV7P6cicnQvfAfONQlfTBaYG
	qV8FZAgSecDP/M2XUJy4CQg2Xu5cDHxxJ6yJKVQxBN5DOrrpDKmWb1I0iHrFS/jh
	Nv19OELvmyYg9z/hrtFHX3zyVu6MO5p0ouzwNOEe+b5Q2tXWuSh32KSxP9b5aDgs
	uQ+UlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729j45j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so130141285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122592; x=1789727392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=GIRzgTLG7AsA9tgUdicb6n0hiGtPu2uzBhyV4Tg7HJkJWO9KrtucEUmG4yS9M59Yhf
         9uXQzCXVTZ0bObmTiSXygVgj1PO231RH/7BZdNYVj8mNrONzptRnkgQ/Mbe/fK52Hj75
         qa/G+fsD+9zzirfPSAE2NtOfG2yyI3EOFxM3gVHuGyZKylfyM6/wfCXLIuu3TzZO0buS
         K4IgTM8UzOaPI1+P+fySaqqFIHBwuK/qcc5SiC1JvsgRS1w2OhTipvpH913HMiAGdS9r
         2wG9KkCBhoglOSKTc+ZSfwji8PP+gTG7UruItpmlRgwa6WHvr4+jNwp2DGr0X1D5KCrQ
         vMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122592; x=1789727392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH0NlUkAHggOm55GmMCsiEP7bNk66V1yTa1Hyg0NTUI=;
        b=jWz06ck0QJ4XX8KbvjM909qi5My9Hrr8hEK+fSib8yKVOVcage3Plrtx6zX1iT0KmF
         SQ+LEOWmGeD9Hw4zxO5+F3Pxkj6CgeLgQCcWTPFTDUiQ8NKALjXZxzVzdbBCDiPaFApr
         9CN2l1JIBq8sbJjAvKmP+EINoH3zUNNA+wzq6K+DbTPHawt2kqyu9g3QiB3tvBVcUD9y
         CidEyGuW22KcOhxxb8VN+SQzBSZUy96829EZ1AzQWV6KWYlNqhRxELf6ids2u7tIjVI/
         Q/fJUtcqKKIXeUDoFZKP8qpHrV/7+HmOCchVeocDHGFCmPKkXWt41fIW2BXLgFchKT93
         VNxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwF0lmmZSmvWaA7TkBqM2y++8VevQ1GyeDBX4NcJQu36s0yhV5kwI4mWMRaDvUBiZtR/f97msIc3dGbYs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJBUlCQ2Dcm4gbXr1uxfbMCufpuSaiDekU8KM+ScM8kOIRs6gV
	33r/7unEWTJQ0trdKfdzppcExwJUWunjxi74TRak15lb2bbtvxiqKwX1tAGt3ERf6ZV6mMR+BpG
	9aKu5I3UV9Y5v27SyC5Q4FJfqGgPsryCcaXqS/1RwZCwXwfCkPI72KwI2p+DwlgyeYMY=
X-Gm-Gg: AYBFou2m4wr/w+Li0vAncQII50I/RYUYFwmRJYNUbS/eI0z0SfVjgehyv51hqNlB5Ar
	p543FUPxdQfwjChSzGgMhaYuTZJYfbtP1ytllNUJYnWVyWe0Sg0fBroo1Gj0YnynvAxvVwLSnFt
	KFUShqdBRAAmIv6AneUfs0cK3HQjVWoxqC/i0gFY7zzrqk6u+qLa7t9nhHIFHKJ91WcHTpGADdU
	tZstyKHvS2rrAVCGlVdl5p3px/Slml9OE2b4dizudln1+SHXIXo2PP3p97+SqlufLw1aBdplhx8
	87NjmiMqiwiqTYCyn7z/4Nr0JtyRWr9h03eJY8dIlb0BwO/LetGRSM8ryXfJOAyzKwSFGLQPS3V
	OZQQch+JNArXoyUV8f10znE0=
X-Received: by 2002:a05:620a:17a8:b0:939:9a09:6009 with SMTP id af79cd13be357-939ea22929amr417774485a.33.1789122592223;
        Fri, 11 Sep 2026 03:29:52 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:939:9a09:6009 with SMTP id af79cd13be357-939ea22929amr417771685a.33.1789122591779;
        Fri, 11 Sep 2026 03:29:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:35 +0200
Subject: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gRkXjI/OEtozReZDeGIxNSRVYnBNLuVDYf2
 /ZVngtGyFeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYEQAKCRDBN2bmhouD
 16cRD/sG7tWVhlh4K+dM3uTjagd7MjwoUd5+LK3+h748V4YfkAkWQ1KjKU0zdiH149YAjT5unRr
 d276FHxWWUtKrbYBnYO6VgdTVxNpLtJgIQ7z6XxkC0L63AgIwRcbybPe9JmZCxAe0iKa010yYUO
 R2HqvL3s93pOmGYGJpTS0Mprn7vXJW6MOMaeEG3hMjo9QIV7+2q+ghbzHFt8C0Xrf6UqpqX57ev
 e/GTTTWuSw5yxLDp6T1/CKjGdIByxbbli8F3yGkr13Cd7uEJGavLV78Tn8pLIU9jXpFxNZNyg5X
 any0DeWtC6WMNi+pUaHvAV1HDPMW35bwN7tNWEhVVw//mZrSjyo4aFRZ2ppTmt9eZQCG2yqf39G
 fttE5Mhlg/bTuQSMMFkJsJR09QhXkFYm9AAU9HItikZxropRdK9CG30pisSAIpJWJGAi/ZAoUl/
 CyVEvpvjOIJUZySzFdGdptEpCQUYdeASISLYjgbG0iydLDAjMLc0x1uW5qhLVPg2TMQHE+0ccVX
 opoRAbJw2ykVwTOpf01GE8HJWA6WwAfyg1+mTfnZjWmYIOUgjxtzk/aLFnEozHTB2beRJIdEsAP
 L0W/XGgb9kYUpha1Lg6al1zfrJILjxyhvLOA4dG8LQVrS6EaSJgiXt4hLMlVu5HXVilf98cIWFS
 hDCRNBJPVxaMpZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX+volbFYrcthI
 Ynk1t+l6b0Qk6oIW2GxJ+IEaL46VUA2ofojMoT7jX6vuLO++udanr3CsTgyjTUQFYFf3hp4XRAk
 HTHtXnx/5cY/j3W4aHAZIPVTpNgnxSI=
X-Proofpoint-GUID: 6jIO05-1p_Z-sORJWHlT9DVb8Dcm8Ze7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX8FkzG+tlhNlL
 11I5JbtqXhKJJE4jNUmsYRh42O4yrmvTUgutTtaFHRydWR03ycG8HU9Xcsnfbefcj9uYOwrkF4d
 ul67a28YKtxLSnupnHjDKT52MhzxP9xwo2qN2G3Om3cAZudbQrrKTYtZStGKB3UXqy8jgWzJvMZ
 S3slDL0hp5Ufc1hLLPasXi9Ux6vucyOaHpH88RisFVKYstrYA9XLSplhajMBJMJSBY2KOYbf74+
 1qkTkUobti++APAt6cLVh6PQhp2eSLXZ7JKX+REkTgc9OVzu3hU2ucOP3C3nH8S3HfkIN9pNwuw
 +Ln22b0nMHQBnMpN0cuiKXA3Z4moAXlz1W9OxAo5CA8KeNnVr4MC25lkB7Y8GgComSm7TIQlyAg
 wENVwsIeZznPM04sIBm2BkXzJ+CzDS4vLP9GGIGbFoPjP0HYWGxDSVKmvECpX5RSaSYRD0RPq5r
 YEVLSLnPVhX8A13QjBQ==
X-Proofpoint-ORIG-GUID: 6jIO05-1p_Z-sORJWHlT9DVb8Dcm8Ze7
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3d821 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IzbfGf_HrtPdoiX6LZ8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

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

