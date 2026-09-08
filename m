Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DEE38E100
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851462; cv=none; b=JN/453aefc7evlhTIffL0eqQGDczWlRrsEbWD/0d00oLzpvMA5zst3ebIo4kHJWWrex0O8Lwt60MQev5ch/LM4ub1JSBmLb+FBbLfq3Qs4xfDv56YSVat7zSC4fpLZDI22rI7XGs/sV8PGdwmJzkdX6KM4fQF+4gdrcoKF43SNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851462; c=relaxed/simple;
	bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHCKckL6xpAEeiWgxOtvOLhCTiw5KpGbJrUuoT8/wXJDtjg/S1lw/ncR9/QM2YeqiwBAyRKP14Br+9XQc2C7VHbwZ4QRfoJl4KDWufnwquTi5z8Y4r79S+bNX2KL7X3ttf7L4yuxYviD7go9HAztESY3L0FPMR9zjBNCo5TIvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d01t0aLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5VO5JOI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d01t0aLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5VO5JOI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LhnN1477306
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=; b=d01t0aLckEBoXC7j
	nxjktvZpRydcpmhlamcAjJTIc3W4sje0zKN52B91cYt4i9cBIBwPOuyyPI0GeQe/
	x68hWIoJA8heF0tVkI4RC+D1Vv2KelJ9xixSL1YHMvj0OcW/MfyrpfmOnWEvyJkB
	WGJmu8isy1wRKn6guD51kZDb55xEI/xq6nYMnL+AEznwlZObGBh3mNa07xBWgYkl
	uPCZGtOPrVVvM3xai32j8q6jAgdw3b4q6usiOQjRoB+vQ89Sq8tb+3ZOKJ9nSe8d
	F6RmogpBPWzNNQ7EyH9pAHDi43IwOisAUoDjR++LLIz5NRFMDUXZ2LdCW/SgFoC1
	TcN4tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgp4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:10:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so708333985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851459; x=1789456259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=H5VO5JOIEyQ/p8MW0ZxmB0N9CHD5JBHNzOcAf53DC8mWQ/FBRvVfDzBJBNNyczfnM2
         dmf6euZYi5QExEhxFhpmcysOxqV/vzi6fHIVF+nuTSiVwhduOf0L7xXmF4z5dazeNMlY
         V1qOAzlZRVCoeUEiPLQItq6BU5eCfSlV091xTZOpTpLGtOM0TPfOKEPBu25jkM5QkGu5
         Z+Q2Tc/G3PHHSgVxm6tfJlmvBRUhRwg7yw3E/PS8FEHqFg5RKlKSkftV5+qmx9//IW38
         pHQdv4oucX/iGFONAIhjR+10X0+3qgB+tydtt5EewAdjgR/uoNjFXQ4/vL/Jp3dbqmbj
         bftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851459; x=1789456259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=Q/X/XOXbBk4ECXbCwS0AA6WCymBvGR14NT1u/fDMWw7k1Rddq8ODwgNkLHgPEJ5HqK
         JjV3kTm/AxZaxWmSJRDMf9+Z3T1EmePEqrO0E9xmwYS9vU1nJBI0/6/8/wm9i6oSlZVS
         BIYF73CRaMSHZkn02zODbYpY8eo7HbkAJy+WvAr2GVEUTfPMClALkAVqW3vzFfNZOWeO
         blO9gdpbEthbZupo7g8VCFWCJSX/uVov3zIyy1/bwDgv9I+mIeudkCoT+Wb/Ve7xrfJj
         sVqvX65oeTY0hS4FPzAdR7L8U9L11bu7ih2lCBMuMI5QRGFZpKTni0aB9sSX/+zlWolq
         2/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxar2EQq7EIgYgQjpIf5ITHz9cr0NKsseiINOX5F87iX9ULc940Ao93Q3ULUiIDjwTy8ruas2k4AhQKTvE=@vger.kernel.org
X-Gm-Message-State: AFuF++mU7Sbp/npJKHn3pvfcvYLxKkuA+2s4Z5/NqidYrgUStr1/DRu7
	+r2kErsNbfAizbGN7Dmdxdi7fHIFmHPqiv41elZj9tEn6KJls4vkMNVnUDPlrH6dbY44UjGCcHL
	5Iqbk1Vm48itnUZ+IhIuUdgqTYK9w+wok8VYiovtquQGPY37vkpT2629guYGjixtgP9I=
X-Gm-Gg: AYBFou2gLE1H41eBGveHfalx/5UtSNp7MlRjJ3dF8cLODPZLFri240K3tuNNTFlOwMu
	w3QvwdMXImiAa5dKe+bMu3hSM5TXsuCzw0m30CuKKwRyzZ6nCt5fDgTjP7yR2lCaan076akORN9
	2fdMcGh7ihx5zszsgAcByno1TP3qxmVSgpCz+votDmM+3k2eF2Ye5oOP2VeBn3iIhzIb6ZWlL2x
	kX5VEW3pHFB5XvnIU5Ev9gEZ/2Xk15QUxKLqVPruigGOZN/K4qLHcJbwJr5VkT8F/eV6G8FKk13
	gvG+nkj8QNRC1SC86s+n6Ca+yrk6SpDFd2PaMBZX+d2RAxTGa98p0ThLAb/ma1FIGPZB+/Sg5Xu
	o8059lRo80pwSaGPe+aJhIDk=
X-Received: by 2002:a05:620a:3707:b0:939:ab90:8f6a with SMTP id af79cd13be357-939ab908fd9mr1195393985a.18.1788851458804;
        Tue, 08 Sep 2026 00:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:3707:b0:939:ab90:8f6a with SMTP id af79cd13be357-939ab908fd9mr1195388985a.18.1788851458361;
        Tue, 08 Sep 2026 00:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:10:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:41 +0200
Subject: [PATCH v3 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-1-dcf8956878ca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T3vtS3HqWXUdSsiVISeU47Im6ROW1p5A6Fk
 05xiUy9rpSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+09wAKCRDBN2bmhouD
 114AEACRO7SvCxub/ywNPr/vKZhyFhbU2JGDgp/FmhNnXiUs5W0/MpyTWB4t9M0ZLv1B1KKWqxU
 6cIujtV0TMmQv0UOUoNqd48IREUrMtK8loR+ocxNUeetJ4OrYGG1APFlVT3Y5fyfZtAT13tHDDY
 GS7PLrdz9xI8IjU0ctGea9dQg4KXS0A3gJq+bNlan7j/O0NR5nIonwMLM6TIU4joM10NR7flK/t
 owfigDxvRpBr1EwTuDHi3tcLjJAxKWhnyVE0U+NOvKVEF5us5Z/v2EPv76A1suO1QDV4IZYvaks
 E/zgnXRFI4bNDnNXpDsglIQBNACSK1OtWVP30eGoSi9v2ZkGwc2LoU0GtYRG7xa+NDVs1iIZ0AH
 aWqjDV1EoJfgcYsxZNZrQ6cw5uHFbiz8LFNXRsm1CyI+HCGThYI9b+x5pqJiKCtYhtkTolcRqFg
 S6TplqNWUYXsKOlhRlBqzLKPzPcqtgO4a9U4XP/bVD7X/whtZCvW6U7RKoXJrANsmRTMPrsVocz
 7/msBWD7N82wzP3dlOYnKFvPOvS0vovO8yYNcjCSyZka1mkX4yP1mIRAFdU0CEtnc1jwbyt0LYs
 5KD1cOlPg+2B5fC7ZuWtUiMbLVXt9BOjMPV30OCg99Qi0BgFI2MYvWDNVrwWZXr+Tir/3RAxN+Y
 LkgdcouDjYxwaTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX3lPeTV2bBpiq
 op5mF0irnMWXa9mlzeRQfJyE7YO5m1upSmj4cZaecQUBMY1Gml7uLoC3y8vwQJMTxg5yitEY3C8
 qG2pVLEXBF1Y9u1sNyUODqQX8s5ovUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX0k99hUL9Kh+u
 qfSsHQ5qHWNZcEMxHKqqXlDokMikVylwdF63DsX9OO3Pc8KiJIROj/lHh+H6rHM3juUi6z/g2zE
 0xsckp5ZXlPyuav8uTzvnqRI9f2ltijm0A3IY427XIaXf+qypAXht9VfRzguGYbUQ9VKQV7AWbW
 guiZanZmOxSeeGh7bOM3hQxU7WByj5tlpwOZ4VuwVH6EwFmwTZ0p5cGJwXPDNNngCs6dDUEUAfx
 rc6iapbEZBBbWJk8nEinWHs/EJohHBf956bqFy6BtLOvjn5UWazf2FwhBPfD1SXSwS+ucMB4+8q
 ftoUQUBQ9LDwBLbv7fYlGwBBOa4tdGLPkHM5G/tfsXGQYvVKkVSQzlgdasIP/MBCuKrH8UZi+sz
 ACZnyitkTXbqeyYZokuuAXSEbH8Enyo6BW0L0FlWrZ4ThRcnjWIcAt13Rv55l4IrvIDB9PGr6tN
 v32OisQ/TCZam/lJqwA==
X-Proofpoint-ORIG-GUID: u21jfElMDdjGruT_FEXjdg9C-29QSok3
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fb503 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bp1g5Iz1D7c7guLF1_8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: u21jfElMDdjGruT_FEXjdg9C-29QSok3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
it should reverse the state of things already changed.
msm_hdmi_phy_resource_enable() is used also in probe path, thus such
failure, which could be simple deferred probe, would leave these
resources permanently enabled for the rest of the runtime.

Cc: <stable@vger.kernel.org>
Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..15e37596bdb1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
-		return ret;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < cfg->num_clks; i++) {
 		ret = clk_prepare_enable(phy->clks[i]);
-		if (ret)
+		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
 				cfg->clk_names[i], ret);
+			goto err_clk_unprepare;
+		}
 	}
 
+	return 0;
+
+err_clk_unprepare:
+	for (; i > 0; i--)
+		clk_disable_unprepare(phy->clks[i - 1]);
+	regulator_bulk_disable(cfg->num_regs, phy->regs);
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+
 	return ret;
 }
 

-- 
2.53.0

