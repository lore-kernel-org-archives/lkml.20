Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA00838DC78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144933; cv=none; b=LzuFIZSoj0rXNbmBH1VQbgKsLKfeX7+jVMTBKZ599Kd8sWjoV8kW/8rGzIipbM8JaaDkZHmX62vl3sGgHvbWKyQUnira5aRp7lFu2AsWIy550zYHDO/qEoqxJCquzRWHYwMmfDFmT4otJRK1IOV97k9xPwBlXNEYNVRXmk/UaUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144933; c=relaxed/simple;
	bh=W9TD1w2IXB5YxJ7viD5vUrklOEEuGuW+bbhPhwf+Ckw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnTNyC+508RLNK6LiX+JLu0VTHausmQZJdusgi5xlF1/VNspaTkHeAkyWgwNca1UNqHjNXdfk+Fuf0kNgBYW+MJmeheZ+NVRsDXM7vvO9hKjK2KMXEF8Ass3/y0ZvRnwPn4ueYlrRhIcWPq8sfijH+E2M+Mtakbd7BUzHNXxwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rv71mCgE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rv71mCgE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d01663d816so19409655ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144929; x=1788749729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EftteNqjZXVGUdSG4QtTghSUU4iaCpJJjwHlvEwtRu0=;
        b=rv71mCgEn+gQl993bGh+5w5SgHnnOHy+pYzU0kELMQAVmxqOkPMJfafaT5eMKylEH9
         OF/sFTyMzaQT3i3Wh91aXwChnrO/Ehv38QHZUAQYTzb2evyIho3+gbVFLmWpwjVExSZs
         nOlp6N78q9xThwgf4g6bTbI3GI5AewlG1JcVGyn8yhSsm0wHdWEccVT/GAKRpgp6OdOa
         DmBf1jzQTSLBIbD1bah6YXRCr4S6AXWi8zQzm73DMw9IYDV9STYHGK4nD6VP9ihD+PEy
         42vJ8F4WEQuzN/FyoiKfayoPM2ImYoFb26tDLWN9MozcnUYzDsNuwyFUMysUC3nL0js2
         2HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144929; x=1788749729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EftteNqjZXVGUdSG4QtTghSUU4iaCpJJjwHlvEwtRu0=;
        b=GHC7b7ls7Bn46omI180Eh2vUKMTUVuzoIujhU5JTTnKNG1rWNnSVyxgbo9X2e1db2Z
         p/bXBCOy307VAuDP/XqKyEb4JeWlNzE+Lda4X55HcMPETD40jEWG4a5pdcoxbyw1mx9A
         orR8gzIEBOfke5ZrFTOliH6WsqGS3T4XKqWxoF1iAkTIRiIerLhlQzQhp7YXva8CynLT
         JyLvylPDhYxGxTe5Bhd8wteX5tb+ojFoUlNHK67aTjH2W7XKlsdg+6WANC+lFWffj6bZ
         slN/E+osedy5rd44yA6DYstudnFJ8riPwjnMewighKN5dn2/HUfp9qEw9of71cHpOxB3
         jrGg==
X-Forwarded-Encrypted: i=1; AKwUvBwyAyIGY6KdQPDEhCSt9MKbYyDt4mkLMlipPnlqoifSTJ9lNXWVpqnmSImSDf+lGLRyC2stki+1HknDOVE=@vger.kernel.org
X-Gm-Message-State: AFuF++noMh9YfSJR+vBi7PEJjCInYgmtnpvg+Xp/i1l7KWp9gS4qqDkH
	gu3zh+6nHf5lueJVba3PpSLHcQd+fRTj546ZVTNj5IINy2NVbPs5FRGU
X-Gm-Gg: AYBFou38IPdouMQtYEiRYUMTaSTqbUD/cwd9ZGUvpg/EOgf0R4BNW+PmZ+a9NOtDOPC
	nMHMh/VILuD2iU7Wh44+RgRo1X7CBsHDp/Q+EUjso1z1fd5BH+VJfbdepE09x7ccLo7jutlQrju
	eE/Ca/xctzCEMeVywZipOnZ60V2gd3e/j+1FYgawpJiMowDk6lmm1xubbgTR/t4diZtUPgAYCrj
	iTdmhsYVaX+i2qswuKxfA44KzZgN+CPY0ychLBxW5qIpTH2cLzQsfw8ekAvdqYtZU7Q6qFV6l8X
	LhTBPMJCCTXlxiOxrbqaSUu5NgDSBTsgMaSPCuNdJKflwBdk4DYt8tiFtwAaH2MMrZtsGrPJerk
	cxgFZY+DpHOjWTlgiPJTfQKgIn0EGIm6PtChFXAsV558m+tKqNYJVaPS0y8CXk6vlBOruj1YH+6
	UEIqoXWmBCjJjFR0LUrW8y0MwRhhD5VSvBQ1YLuyC8DF1DILgqUETApWIbIj9+oBcqzI6RdA==
X-Received: by 2002:a17:902:f788:b0:2d7:40d1:e14a with SMTP id d9443c01a7336-2d74ce1cab4mr380071345ad.0.1788144929223;
        Sun, 30 Aug 2026 19:55:29 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952b937sm26629055ad.20.2026.08.30.19.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:55:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] phy: core: Add common helper to add phy phandle device link
Date: Mon, 31 Aug 2026 10:55:03 +0800
Message-ID: <20260831025506.95548-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831025319.94886-1-inochiama@gmail.com>
References: <20260831025319.94886-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..451f8f0644c1 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,26 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Link the phy phandle to the device
+ * @dev: the device to link the phy phandle
+ * @phy: the phy phandle to link
+ *
+ * Link the phy phandle to the device by using device link.
+ */
+static void phy_add_device_link(struct device *dev, struct phy *phy)
+{
+	struct device_link *link;
+
+	if (!phy)
+		return;
+
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+}
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
@@ -784,7 +804,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	if (dev->of_node) {
 		if (string)
@@ -808,10 +827,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -885,7 +901,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -900,10 +915,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -955,7 +967,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -977,10 +988,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.55.0

