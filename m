Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F5270552
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435673; cv=none; b=l3Fds8OdaREQMD7AGLEm5Q/tNwcds0AM+LBZpvn1JUWQ+RZTZJWCYI8GYZxs8YtAHWqkew7Xa/n01k/X8zFn6lVcQdcppm3F4zYGgGloymw1n3eY92rB9M/WFnHu8JtlQBqRjc3c+suIvOmy6QlOKDPxS0N0H2D8yGciyjYNV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435673; c=relaxed/simple;
	bh=DkNkhe40MqVoaUOrmP4JiegNHbYAkogtNwwlWvSnIfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTB4Fcv05tfhvkMh+PVctpqXxVfIFy8pJDaiHHJAxpR/+Q2vl+cywnW+FnrkDUKomrSm420FmvJeWrR92ToppuJvzWm3qi7yi0ZmguoElDnE10a3tAfMRTEynJOBl/2MPHOMTTPDB5C5YBx9mYCW5o0MwcJRGhh5QzxZOMoX0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNCQbKL0; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNCQbKL0"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb7so348096185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435670; x=1790040470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iu+JFm569gxQFfXrOc5fB1avNX3cgHG06h6b0Ix3qh0=;
        b=SNCQbKL0XRbbHZq3ylFAasZkZsr5On53vEIKyzH+XoOg9hQmaqDBeSKbCjF6q8OaKw
         Q9yEqWuAo0XpQb90SnAXPYrsJCbUNIpZbYQGYKtnipxwVkm2mWxZXpNvK9DtQPCvRJXQ
         /xrbSmUuoqaPQkjl9x1m5oiBp0MsWo4hKP8mNvpnxMc9k308mpQvUibPzTP2vEq7HbKR
         syvFjji4WkmrSoy8qMicwER8f1I0DeLe3aqaABi9Dx/IT6nvCXounekrOcw8xzSSICbw
         +IBtgGHovhuZK086Q2cuaknQlscawL/r8RmeG2wACTvEjQG5W/aUT+/Ue4WXeeoE/IPI
         UFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435670; x=1790040470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu+JFm569gxQFfXrOc5fB1avNX3cgHG06h6b0Ix3qh0=;
        b=MF6ZgTAXgZAHUVur7H8+Ny+u9QsGDUUDv6c81WHs/82xKubkIrzib1bjNyX/mc7aH7
         1TCc6AMHK8Ix2iT827I3gKW3Gr2vf0IfTypQQW2Vn32SwoP8syd1Annvl0fwGOcuP1ed
         C1qXeIMO5GGn0mfoRGjHaX+QVGq07KDZo4kufwKG0XWmvlWMTZ/K87t+c/xbEKQaKdus
         DcLoP+6GM7ZZtpXQW90bi8w3bfoyB8rFsxda7ed0iCKf7vnmR6ftr1QFUXzkdOQUOZKz
         NOTuAiH3Vw44nJkq4sglGPsU04VeY1uaTc1Gl78sSj8XZKk8rgLQJjHpy1vW1o10KXqm
         skgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBAoujWD+j5/9iTyXRLdegloyTAXsZkcQ1gtKCthZK/hoH2+VRbvAVyFrrGLcRfpP45u/CJvD+PGRzIzU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWextRf8gjxyERQSIc1evNoeTo/j0m2UUj0RQplEIUa0B5nDwa
	aTxW2Xn1xqYV2ienuyuM3SXH5RJQc/0fTwU324aVE+1ToPJ9Zfu2cAw=
X-Gm-Gg: AYBFou2hpJWgyXjo9h+9Sk17dKQ2yAytFHVnJdpbHabLOtZJlu+clyMlmPQew939RbN
	M8/tULa93Ck4eTdU2gHXBY1fYo68Oj4wVhgCOIMKS/iOpy03//fH+dxDZvChgyRsuBDcv4yLWKt
	UEyzrnlBEclf0Kfqzl6sluOXXd2KGHOjEfTtxAZ2Gjr/xuX8rKBb8e9/adXGBFYPGVHP52jVM6O
	pmdj6ndRHG4i0QzfRIn1NGkRA0GBleU4EObugfTIhmMf5r0twRV6EPTHHI9wC9p7TyHcQndOfOu
	86SCmwdDAlJArAo5o3A/gxr9VgMNxT5m8MZSb+LEXxCX3eImu+E1j7xre2olULfGNiDo+KGhYfH
	gbqyBbJ58D8/D/ColXjD9EckdcKk/GJUb5C5F0CdEREYXcW7QiN0ecP95f80HbN4pVT0HXYjJ//
	9tel+TmvAWwOGRMJOiJUokqyNrDFLH0tzm71aLvZ31OSYifB/oixG7lqYdOBDKSnKxhPsf6gNIa
	yHCpZ7MZiHxkBymKBkygT8U57lRsZryasdKcGuLadTJfkXjlbxNeAF+QRvQsu0SODWKSeeqeBFj
	lFGM8/bskvBE5HuRdGNAQ06h+78POs+2LuvSkYgraFntHMo6W5A1vzmFJ/Fkb/1ET9tOcw==
X-Received: by 2002:a05:620a:2904:b0:930:9091:f0ce with SMTP id af79cd13be357-93a2985a593mr832839785a.22.1789435670571;
        Mon, 14 Sep 2026 18:27:50 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80471a3sm1131736185a.22.2026.09.14.18.27.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:27:48 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/gma500: Balance MSI and IRQ state on installation failure
Date: Mon, 14 Sep 2026 21:27:40 -0400
Message-ID: <20260915012740.66623-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gma_irq_install() leaves MSI enabled when requesting the IRQ fails.
Disable MSI on failed installation and clear irq_enabled on uninstall,
so an unsuccessful reinstall after suspend does not leave stale state
that makes a later uninstall free an unregistered IRQ.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 9b6a16575ebf ("drm/gma500: Fix (vblank) IRQs not working after suspend/resume")
Fixes: da596080b2b4 ("drm/gma500: Fix call trace when psb_gem_mm_init() fails")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -316,15 +316,17 @@ int gma_irq_install(struct drm_device *dev)
 		dev_priv->use_msi = false;
 	}
 
-	if (pdev->irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+	if (pdev->irq == IRQ_NOTCONNECTED) {
+		ret = -ENOTCONN;
+		goto err_disable_msi;
+	}
 
 	gma_irq_preinstall(dev);
 
 	/* PCI devices require shared interrupts. */
 	ret = request_irq(pdev->irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
 	if (ret)
-		return ret;
+		goto err_disable_msi;
 
 	gma_irq_postinstall(dev);
 
@@ -332,5 +334,10 @@ int gma_irq_install(struct drm_device *dev)
 
 	return 0;
+
+err_disable_msi:
+	if (dev_priv->use_msi)
+		pci_disable_msi(pdev);
+	return ret;
 }
 
 void gma_irq_uninstall(struct drm_device *dev)
@@ -373,6 +380,7 @@ void gma_irq_uninstall(struct drm_device *dev)
 	free_irq(pdev->irq, dev);
 	if (dev_priv->use_msi)
 		pci_disable_msi(pdev);
+	dev_priv->irq_enabled = false;
 }
 
 int gma_crtc_enable_vblank(struct drm_crtc *crtc)
-- 
2.51.0
