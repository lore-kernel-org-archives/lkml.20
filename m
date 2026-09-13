Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5039A056
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289908; cv=none; b=PuDd05z/ofO9r8TtX2Wo45T0cBD8HkKknq6BkpOtWqwWZ9dWjpCUGMuaUrCx7p4utEmCej7eAxAlRgkKYgh6cZ1EZRkSyylyhUeDr+9MXvcfNoaozSg+qwOnbRQ7Oh88go4mf6I4gaITdXe3u4dd+bGEdMlvlaWTNjSvSN6cwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289908; c=relaxed/simple;
	bh=gEn8gO3+qsCgamZRVk3MUEWgT0RKdoTB6mm/mj4N5AU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOuGaOVthO6U/402weDUm2NWqUCHV1EXe4qmAHaHl3FU4OYxo/IiOTRM2XwP/VSUn05QXvO6/2jfMG73o3nZNL0uLI/7slYVl9Y+MHrhKA1H1nWJoW3T4qZnlBc8LZy3iWF+GclueV3XdqzBmjrCKtQJ24NBhKXpqtV7M0V8H+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyc1M7EN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyc1M7EN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so13322585ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289907; x=1789894707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g12Q/omnE3PC2Amf1XAPg7bzaI1F+/7aB6gxdSUP4b8=;
        b=kyc1M7ENT69oE+/yVlww+0gSjMql7LtAFttVl/GBvYAjkmJceeqQ7OxnCHiZKltthl
         TGj046z8srItlTkpnjRkxsMwSlCNCWY7uuyXMN9qhJwriv++gDRBpLTYe8ePMi+Qbqkb
         OzYIv8PZ5Ka+l2k7jizVUMFJj+CdITSddd9WV3zoWJ6lN1drhY6FTD7xlfWhmtZP+hDH
         Hql54JP75eJ1IyBGPV0byAu9mM+GHDRq4pV8t4uWyUS7uvK1LIkC7yowmJC3h7bDBil3
         eZKTBUGbkAbXoL72FyiCxWKMVEg8FkNh1SRZNZR106VPXEmWmqG3JkDqMaAsuvPlprwu
         PxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289907; x=1789894707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g12Q/omnE3PC2Amf1XAPg7bzaI1F+/7aB6gxdSUP4b8=;
        b=EQBC2K6+uAmZkJGYJHmqlGd1jZl7WNawiL3vqImLO+Hik4V+Ky0v23NaFlCwRYiZ9d
         pPUGTi2uxqfWFoyOm44vgbeF8g19CRFZVPzwp04COptHN59Gq8fjFujJjHERIEigYzpE
         rddHqARdh+t+kbVFAhq/uiICuRuUUNhuXBqr3gXYYh4v3Mx9ai5wNXdXTLiiEOPppkg0
         M5koWfuDadlSLIX688Cya/QEJIcp4cMxIYSbdv76j638Om7rDbTJYcHo476UxXPrcnrT
         3PsiynJJ/gHeQzC0/t9o0wGecHLplDKhXadTd/Nm2HT8ZJfLDeO7Dc3iklcD0ikOhjrV
         zgsg==
X-Forwarded-Encrypted: i=1; AKwUvBwWP4h4WFkfCIvooAkpbdCZ2ykuczT5ZRhF7RxjEBl9iBSQAb0vTMsuERvWFMmvelDUZEHEQthhYoYvlJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mcJ58DmXxCSWTZtQruuNHQIHH2KCCc9/GQmFIyopX1KSXpqZrc
	+Iq6wA+PpDy+fcT8aiAfOEt1HWRTuOhAQ4VHmg5hJopDbea9Dcww0CQa
X-Gm-Gg: AYBFou3Mom5j2nfJ74NJ1AsoNiLwet6iegW5ApIdyeyIJZDgldu9azpq4Ua+U3mIwtY
	tEiiGNF3aS2Ii71v7/sgCTMFW//fvbHUtiVh96gAScWDl6cJpK8E5XGgcFboFA+PZMhgkJfvsGf
	ggzBFooA0A90dWII1QehM0xRusXcGXcZAlLKSOcvne88ZF/bCus4hj7UcumukNFIpAzmr3WiGsR
	XzvOrp6+e0bETyQqgUuSgW2vYtlzrhbBbw2YZOLUqh7GiUzbwA68sgVQ6jbp2LCll+vM3HzQRPi
	31iAt+tEcMdHSaHoGMQZabWBzQCiw2mhNd+ViGFEBIk1OtgDJnb5cKxd+JQsz7RFkTCc7LcFP7D
	T/tqeQ2SHyEYf8zbujtrPjufwU0m/8bgGHgsk1q0s6E/DWVXzq7RUKVY8nfiaX3zaoB+S70b80L
	mIrY81oVmvzSZCXZ834LUczfcJ2xcHO3vANf4bICgSHP3QBWCrhKDwcgATBU+PTD1B
X-Received: by 2002:a17:902:db0e:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd2a34f6e6mr211164165ad.15.1789289907022;
        Sun, 13 Sep 2026 01:58:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd48ae3cacsm17494875ad.26.2026.09.13.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:58:26 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Archit Taneja <architt@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
Date: Sun, 13 Sep 2026 16:58:14 +0800
Message-ID: <20260913085814.1509352-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_hdmi_phy_probe() enables runtime PM before enabling the PHY
resources and initializing the PLL, but failures from either operation
return without calling the matching pm_runtime_disable().

The remove path disables runtime PM, but it is not called when probe
fails. As a result, runtime PM remains enabled after an unsuccessful
probe.

Route failures after pm_runtime_enable() through a common error path
and disable runtime PM before returning.

This issue was found by manual code inspection.

Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..77dce35cd45e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -168,13 +168,13 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 
 	ret = msm_hdmi_phy_resource_enable(phy);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	ret = msm_hdmi_phy_pll_init(pdev, phy->cfg->type);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "couldn't init PLL\n");
 		msm_hdmi_phy_resource_disable(phy);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	msm_hdmi_phy_resource_disable(phy);
@@ -182,6 +182,10 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, phy);
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(dev);
+	return ret;
 }
 
 static void msm_hdmi_phy_remove(struct platform_device *pdev)
-- 
2.43.0

