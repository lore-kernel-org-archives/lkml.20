Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF563F8709
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511078; cv=none; b=HPL9VqKSCA1n+EjV5UjfiMlViVexwMfmumYu1860rP0OrtkglziZuVS7hZYBr/IyuipvQNQpEnnvihjw9lsiRs//3UwCfsu8eJz23Ol9UueFCq034gDu1pkjHpaqOVlflUCom1smYa96/qqszk4EEGMv7P1bM2nYjR8zd+7OnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511078; c=relaxed/simple;
	bh=V4Riq0DdMmZexbumjJENOek9iC1bQ/EYfBK0VK+tk8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOoWc1cSKx1DIhLfVqfTP4WsPXDzBsG8JpWMWVsL5TQe0kCiXfNtgahwt5ZVuivOLH4LSTweX+zIZb/GiJ8TNCGrE8iZ5fgTXXvP650TAvXwmMwvpG061QidXAQ9L9m5hgdz0KsRLj6nIL/oeI/rjtk+q+H+7cMrvQ/RCb4lzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mspPUS0t; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mspPUS0t"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso816474a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511076; x=1789115876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7TrYEnnyTFBxKR6bNzgdL9dbIZbk8gO2x1bfmprK5g=;
        b=mspPUS0tfEojxMc9gl3PpQ1E+/3xRK9KYgBrTJ984V8kDVsb1rE3HBrhOFgdodKkaM
         fOIXFS8IvUgybqPPKzveF0j2kugnze+JbM8b8o8p9N2nb+KNldX7OHquQHn3B94Kj90L
         D5F9FN/fu9owph47oYZtHUXF487yTddnwVMpzAY+w/6BLCurcOqf7GqsY7t5KYMi987j
         ZGPqkhlWcDJmfnW9QDo3mVbYgUN0FKvyGjxQ5U6GmbG2d14y5d/e6iXE8c8epVyS7jj9
         dUwbwpVQkWPhlvePAQf9dExTOWAiR9+32WtkqBoB1WRHXUSud6MvuLxZil8iMEFSRFO1
         Rhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511076; x=1789115876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7TrYEnnyTFBxKR6bNzgdL9dbIZbk8gO2x1bfmprK5g=;
        b=QELg3Z5mR9FR6GmnGCxfd2pVZz2v2P8XLGRuQoFpEZKV315jgW4HDr1K/gCaPffilL
         GPcBcyYEN8gdbj481JEJw8RMY4b8/tWR0QFiFOXoeVR4VQS/dwNhD1FS5V4KPwrOr34K
         54fKKEROao48la5MAaMGF8R2/iKyBBMI8hgTYQ6L0knuRkddwPve6lJCRQv6Ri6/dele
         +mYmyI23lCidLOFa89UXQaMoXAqwJQtAMhxwAlu6F9zBCvGVWfQJm+HPhF3plvfkeJdp
         gCaKaE8VYdIVEKK8Q6qnAa7oMkaYzWUOG6ySvI8er7HeX5kw3+6Uws6uCPmkxLXxPEQI
         y5/A==
X-Forwarded-Encrypted: i=1; AKwUvBxSQJdJGP8aIgIRSOdaDgc7x4wIuPRN0ssB/Ihi1g3ZoXqjLhkeA4pq5uFhoGwUtTVwOos+6c+V/ee4dP8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWKOmbZrC8GAn/MK2BQRucRoe9nin3rsciDHKfvUu6X0mSCA2B
	m7/nViumUSV4ePSQwVB754U/LuRqcnf0SxJcQlfFMcKwNWazOwWvjCB4
X-Gm-Gg: AYBFou0yiXPujhihBLCT26n3crveMaFIyjBZo/1yf7dXewFAgBkA3+fdAJ3qhWqt0iK
	rswA6MlM1eiULYGmpur2HwnQhu0EOYpat3H+og7h1MKVBOZvCrqaNOxtPqEo6/hImyqX+0TF03E
	4YdVGSlLLF4/12H18GWhDA6ar4qj0JHqF5MTsrkEhFBvaQDr96aP0ZBDKD/dVHaS0SNSobCcm4q
	i/XIgA2as9O56sRDC1dYGZaixBfqPK/FhvW+0gepHWp6NgCANlxLKe3kXWGu2ZSop96gWUgB8RU
	5BYS8cy0e9fMWhMUquqDd3Pp657XrAFENcPZokZeCzC1OA7/8NnSiW+LkexVqMBi+iOr+RitKMN
	w6hKfmxOYJqErXYHYUyEooofdC6uvq3bFTtZp9bCSaQWdULTZ0d93Oraapfn2Byzckqca7xp9cd
	gWVN8OIpIIkdfPv6Yz6ocbeud6S9akHxKpSyppbVSvTm0axuTtqTwSH1oCGcA=
X-Received: by 2002:a05:6a00:22ca:b0:857:726d:2e9d with SMTP id d2e1a72fcca58-8616b966f55mr6002481b3a.26.1788511076377;
        Fri, 04 Sep 2026 01:37:56 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e2f1e0sm874077b3a.36.2026.09.04.01.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:37:56 -0700 (PDT)
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
Subject: [PATCH v2 2/4] phy: core: Add common helper for get phy phandle by index
Date: Fri,  4 Sep 2026 16:37:06 +0800
Message-ID: <20260904083709.425893-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904083709.425893-1-inochiama@gmail.com>
References: <20260904083709.425893-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several phy helper use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index ea79913fbb87..a7d7acb5d3c2 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -681,33 +681,49 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns: the phy driver, after getting a refcount to it; or
+ * -ENODEV if there is no such phy. The caller is responsible for
+ * calling of_phy_put() to release that count.
+ */
+static struct phy *of_phy_get_by_index(struct device_node *np, int index)
+{
+	struct phy *phy;
+
+	phy = _of_phy_get(np, index);
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+
 /**
  * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
 struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	struct phy *phy = NULL;
 	int index = 0;
 
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
-	phy = _of_phy_get(np, index);
-	if (IS_ERR(phy))
-		return phy;
-
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&phy->dev);
-
-	return phy;
+	return of_phy_get_by_index(np, index);
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
 
@@ -957,7 +973,7 @@ EXPORT_SYMBOL_GPL(devm_of_phy_optional_get);
  * @np: node containing the phy
  * @index: index of the phy
  *
- * Gets the phy using _of_phy_get(), then gets a refcount to it,
+ * Gets the phy using of_phy_get_by_index(), then gets a refcount to it,
  * and associates a device with it using devres. On driver detach,
  * release function is invoked on the devres data,
  * then, devres data is freed.
@@ -972,19 +988,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	phy = _of_phy_get(np, index);
+	phy = of_phy_get_by_index(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
 		return phy;
 	}
 
-	if (!try_module_get(phy->ops->owner)) {
-		devres_free(ptr);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
-	get_device(&phy->dev);
-
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-- 
2.55.0

