Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33106368D4B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883736; cv=none; b=UUTYeQeoXjQuoenhfkfKiT5Gvg0kEUdIAopYijunhWYVDL7yMiHp4HHCvkGRmKnbxebeddQDMaKD6F/I9x4S1Wxcpa2cEd8yYH4gKLkuX4wzNT/4vrF3C9CYTRQ/zcRBYoJEYWQM+mxdwE6SDah9QrIItwGOwG61x+13AW+TrJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883736; c=relaxed/simple;
	bh=2zXVKzY1EV/eEZ1HHKfbuHYp6YveuxCN/3PVtHgb4xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=spN2NBVvxHBojDqIVuf7+9BNej80lI85Wxf8+umbIYc/ZKf4YgklwJ7iM13WPavH7FGARjnyn+lkq5qpq1uHWlHwS6bPEVczI4gzburbD92OrkevCSPrMSl5GrpiM4PahxU+osP/ZnB33LHs6v4wVoNFq2u0/R02wnl7nwpQbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEQgRUO/; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEQgRUO/"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so1716735b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789883734; x=1790488534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gXb5vXQC6wyOIwFGpwsGYB1mvujwkacakBxQlyORKIw=;
        b=sEQgRUO/WwEd1BHiIojv8uNxg0Ru6dS8/7h49UnZH86s9fb9WXrmSJ88UDTfKK2kVI
         xbnUzMWzb3kxDWjHfOqCo/Fn+/G2zhEgx1TTJExj1DLOVgQme7d71ENz5TQhJPCyVaro
         qx6AIAfwYtvzt8lMuz553sFmJUn9xI3C5MS/RGkKjAAw8iuoINpZIQbvjwDTkWIlDAor
         qYtjT3PXxIXbcAtOosmctC1+wv1WSele3X2Rrj7jc3PTEitudfbH3YHZYAda/Vx7o7Bn
         iYb4gICMx2t/sW71qWFo92fKeaYGSuMExPxRomoKgBVAW3e87UTxi5adv2jmz53DInVn
         Mmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789883734; x=1790488534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXb5vXQC6wyOIwFGpwsGYB1mvujwkacakBxQlyORKIw=;
        b=kYoovRJj2du91N1025MAuTs9DyvRRr37lEuBm/uFPNZYHur98o6cyhgRjNl2xkjlk2
         5UFk+nN8+z64CY8fMoHhX+33YEsurY9KfLl/F1BuUja8BAKwozO+n5dxAPTe8cNroZsM
         3nKrL943dJZ9XLsa0u8IWBly/+TGPioBAQ4sBWhuVwbDIp8Ly64TeeLRfCQD834UfGbB
         tEyoo6ERmne35PXfy8ztTJUiaOIV7Ezh2YB4F0NL1iJ8q2K55fYP1w1YgnpM6U+F9BdR
         GYCxrED35klLDKN+6t9wTNxlZv8WJ9kUF4QPTaUHAGsb3FGzEA0qfZelVfJ8DfHvZVT1
         +OfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0wTvNXLiBnv4+V7KrMOroPGPDWQ3aCtG/lddMrljp5dicJbGgn05vOxS4tjaVL0xBBl47sGBJyLsxkyw=@vger.kernel.org
X-Gm-Message-State: AFuF++l79pzEYvQAfaQNF9uxOlFrR+jTNmVAcag7r3CSdT+H4ufaMPpZ
	WRohtE6qslyZfdGShEMlV2fU1IzYwcClyaVJqyeCS+aF5+uG+3JDCRjD
X-Gm-Gg: AYBFou1/fIAEn4dEZZTU5ZmPcBt1E1oIQmKzkM9YkqyFDw6UJozd2aY1JfZeBp6h5d+
	bCjelxkWK5wsAJvjNPYEvgQLuqdusH9b6jkJLRhkaPDrU7YZd27ZX7JR+3oObDLuvR5Dl4Kd6Of
	MfX1U9ucPJqhsQEGtPHEYZr4O+9oaJUBH2toUpBE8X9JGTXKNysZInQPtPwltrQnHanjcQXYPrr
	WSTC31AmV2x6RbWnApshagI22UfnxqnOn231whA3FFKi+AQtWa/tJ7MZ1l10h7qveAjPCmKmIyS
	vBDnK8dtyclispz/QZCP9vwSiiTb6wZW+PB6bsx5Qk0o1U+Q1rmNVfmH0aQrGBJNA3I9MIvK/Gh
	Y5ebqE0q37Mb/tKLgdllM/B9HqhXYR0BGDZnE0ggE/1/y72hnok5JifrA1xSeH6FcVNAMcWKKtz
	PS/N5ulV+bXj8ntalwkSA0yZAxc87y05c5ZSZdiRwkq/vw/2WQopKSAdId06A2d5a9
X-Received: by 2002:a05:6a00:1788:b0:878:3811:238 with SMTP id d2e1a72fcca58-8783811099fmr3448017b3a.52.1789883734376;
        Sat, 19 Sep 2026 22:55:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0d564sm1622718b3a.35.2026.09.19.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:55:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] EDAC/versalnet: fix memory leak on device registration failure
Date: Sun, 20 Sep 2026 13:55:19 +0800
Message-ID: <20260920055519.3778269-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_one_mc() allocates dev with kzalloc() and registers it with
device_register(). If device_register() fails, the device has already
been initialized and holds its initial device reference.

The current error path eventually frees dev directly with kfree().
This bypasses the device release path and can leak driver-core
resources associated with the initialized device. The existing
versal_edac_release() callback is responsible for freeing dev once the
device reference reaches zero.

Call put_device() when device_register() fails so the initialized
device reference is dropped and versal_edac_release() performs the
proper cleanup. Return after freeing mci to avoid falling through to
the direct kfree() path, which remains necessary for failures that
occur before device_register() is called.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 3a06b41c1d84..db3bf5a1345b 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	dev->release = versal_edac_release;
 
 	rc = device_register(dev);
-	if (rc)
+	if (rc) {
+		put_device(dev);
 		goto err_mc_free;
+	}
 
 	mci->pdev = dev;
 	mc_init(mci, dev);
@@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
+	return rc;
 err_dev_free:
 	kfree(dev);
-
 	return rc;
 }
 
-- 
2.43.0

