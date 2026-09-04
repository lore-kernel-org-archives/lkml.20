Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED63F58E7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511076; cv=none; b=pFlWI0Xh+uWDtoEo/momK3J9qwfUX3E7jtEo75bWhLet7vrUcVPM3UfzBsrT19JTOoSvmlDUiFrq6pKkAC7BfjOm8ZOuxsIC4yKC6CheZFG9DK6Ljvei9DYa/gNjCJ82BMdEU8mVpHRjFjXYhrAYr8FvCatfPI9B26iZa3qoes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511076; c=relaxed/simple;
	bh=xkpsllmNlr3h3R0y/WdKwA7FKzqgoiG1ehs9mULeTk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nt8E4CdhmkUtNvGKwEb3ihH4s1Bfq19OvrvgFfzwmhnbIbVBkFq1265lQH5pitsZRxQs+zEFol7cMIvGbFCytUwFJYWrFqhLeTBlX0VBjJdleMza3qxp+f0hiLEBAynapf7GeM3lfsjowCscP8ToITqiBumr1VLDvdfo8hPqFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdkPUjJj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdkPUjJj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so869834a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511074; x=1789115874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC2wfz4K/EJAsThMydrdqvm3KNer12H87aZI1BzTpcw=;
        b=HdkPUjJjJolbZX5NKSKqTwGVh47Ouv0e0N8dSIqH8wAvYp+qjjmriLKwEQRg63jLZt
         2VK41bsSpCKP2so6po5wISE6O7PSyMhLanYhadvtYf4bsEn4pvWn+b1eSLkgcp2rM7Ij
         jmWihXhNp6+EhChLmwI3HWL2jvE6t6mvea84wklysKxJQuEM01ve83zRbiNu7+YP0+SP
         JOxtP5ay6i0pycWQAmRo7w1HQ5BYOE6zGFJr1S647yx9xOU2vyzT3tnEnyXge3bkkUWC
         A78tVcSKQQccLXzIgYKt7EGTSKO5K1bTeVJSzVMUlW8RieQDvgYDtQvRKTqiTYC60CEd
         95Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511074; x=1789115874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NC2wfz4K/EJAsThMydrdqvm3KNer12H87aZI1BzTpcw=;
        b=SmeDpvYusNEZJ7f71vq3richOzTYeghh6IxcOi+/ZcwtTwUAxayRHZJkh4rV0IUQzx
         PBzF4Q8DFymYkHFtYU9AFTfzBIVtANlNe0ygMGFPpVlMJmCwUpTEbiQRcfsuLtpsiRfQ
         PXj9giA8zXwGPM1OGknxcohUR7iTSecTU1CKTvfDNGfEiocAKIGZFTdibg/fNyFc9ao9
         PE4z99VshX1Te279wKu8f9fbl095Bvrjp6P4F8eTUEyUC5WYSSuy8WBMx5qhanUuXuDM
         SI0ETJeGywII91+ndYIhAUXymJtsCv9SMGYdhIcVxFHwMvB+4CEPb748H9QgOE2SF4GA
         q/UA==
X-Forwarded-Encrypted: i=1; AKwUvBxB4aGZMkGH3Ngz3SJLJUHfqCC6OfGzL/BlRBHdpsumNGEbjM+qPTrZaWUlQ5mNgUg2CYHOce7R7HsjYPg=@vger.kernel.org
X-Gm-Message-State: AFuF++lCIbOAI8xygA8CzjnlRc3GDxOkGpvYfLkLJXAfV3/ui5J3j5iX
	quXGZXCeCITQeXBHtxbbwNGYH1Lj5OBIYPt/U3FvBOBZaqTn2cdlkTfP
X-Gm-Gg: AYBFou3hcRfZmME1+lD6ZFayX4/c21xK35azQ1ugfb2kAsidW8pryabd5QOYw6sOMq/
	RLAUyfw5k+sdi7KWuETSaJvvr8wVz8CK0gzCOV4s07uVF18znct7muNv+IdvLQz+jPYm7Hfa8pN
	vvMR10nZS51833P97e+vdk1ZnXVyMrrZliEoKkCKyFtl02/R3gjQHBliUbkIxxsq6MvLMQfLah8
	aZxxWZckhZ8U1BT++bLPk1vqYrCNbq6amWkxgcTVm1fYiuzrRxdSyK5LAJkaWmOkD8tUl5iKQzD
	OKciRD/SW+JE52Nr9W2LtTrTYGFR77EFhqfPTE5dEmhhBoXga3VRoCOlotdAycAWBjR4JOuQV53
	hqlA7bCTyYPPEUH723rHLzwpgz7bliUqbnMRYS3fwuujT8Osg4UiZ7V5HPg328ECVZsLrAvBbgV
	arKBWnNnGM2SxTpUIHK9ka1AGetpwxrLpDpG/HvLBlDFTQhY0BUsqBDDV9Rs4=
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr7704261a91.3.1788511073930;
        Fri, 04 Sep 2026 01:37:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm3339282a91.15.2026.09.04.01.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:37:53 -0700 (PDT)
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
Subject: [PATCH v2 1/4] phy: core: Add common helper to add phy phandle device link
Date: Fri,  4 Sep 2026 16:37:05 +0800
Message-ID: <20260904083709.425893-2-inochiama@gmail.com>
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..ea79913fbb87 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,26 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device to link the phy
+ * @phy: the phy to associate
+ *
+ * Associate the phy with the device by using device link.
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

