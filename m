Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C584D37B0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671971; cv=none; b=DW8w/cxa3GTl26hjHKwpQ9RrsxwdL2xJQAymFeurRu/13Tvxv/Y5vAlf92fAAF1RjVyzdQdWTeAvfGFMAHvSqdO15D2RGJTzepOvkw/FN2J0K596q3HPV0HxP5Rpl3rPCkuA3cD58+42SA3sDFK3dH61Qb2dEHrgKMaLgJNwI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671971; c=relaxed/simple;
	bh=NINNbjPJn/WUw0YRVDeoPVp/IxOxirFTB3dkvBGrbro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0SGJZKO34m5qQmuPD7wB0W2E7hyG9hPrwV5dB0ZltQuSgwjxkdwISVSEqKGwg/ICyt68tOQcnNMrW4HT4poBWExDji5tBNk9Hz+OUgxq50Jx9PEiik028W1JL84UgFkVBDRePSVbVZ1KGQ2YHkHfvPju36NnSppS5CptLfnB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q39x+Kdg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q39x+Kdg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1720581a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671968; x=1791276768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igoxe3cxGkJq4SLiQXpcx4KeGIWifNJAVf3ouJtaOBU=;
        b=q39x+Kdgf7v6fsvxOlO4feWWRNR93XqG44mfaIiio59l+pCImys7e/qW7iCW42iMXd
         qNDIl4fLmWt5DAr6kF82QB5J1HRLwUl4XUdDJkJDDNB4mIbuF4oKC6/C9AEvPP6KkBJJ
         f2dtMhr+oibKgEBeOY5hivOP0Z8f3pkMSfvUQhjSRXz0wueh4pdPPslMl22wl+JOUl8V
         GKmF79dKYQ8nLtltK/21yLvX50R3IyGY8ColN/4szrn/1T4DFLLPQu6nmjOevfFSp5RX
         5fe4x5PJP8/swUAA3yKhiziLCmO+VAMrlDJ1FVMsyDJrx1TAtndgv2A0j0TJK7znX9fs
         FTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671968; x=1791276768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igoxe3cxGkJq4SLiQXpcx4KeGIWifNJAVf3ouJtaOBU=;
        b=BrZIaorJKLYCiSO38ZbfJK8byzoSXAgfi9uS1L9Wmfce1CeQ83MG0lBxoye5wZBjmE
         gPfgDgrbPZkFz5rfMkIqUasAtyOcEnn/HLybXbLl7J4Sl/tRC86WoVUo1O5HhRhOtblz
         BBwKRqXgMzlj29WJBlCmf73Iz0r+2+SfQry/z1LW8eceQg+RJxEwFB2w/SE62mJ6wIQh
         FOQ/n9/QLRXYF6qrTDVEsVeJMzyz9nJT9nxjp3fThad9qpAfzEAVgta/4ft0LzARCaAf
         oF7iCxJym0QtOz9tJWJy8WoKbgE5ShPrBGUFw61DAHmtLVdpnCWeCC3pJvLAhjKiIaCm
         u+eg==
X-Forwarded-Encrypted: i=1; AKwUvByWvryrWWF7U0VOjsYLmPScBmKYBzvzvslsZfNCivMJS+vK/xH5LxRK27fjQeU6ZuvHkAtV5+lQa/6jUfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLruVSeNvADzlxHU6M/w//ektmLMJH+7+/++3obFRbqYtDPX1h
	q5KdU1ReMo0daawqyS5fZdmtbnKBe6pAKeq3FpsLtHHGx6Tezzbup1Tr
X-Gm-Gg: AYBFou27o8m/Nk4lkG23mWVyCrVPYXFLI0LeoxZf18QcDbLF7TmIjWZOBH6TPf36W28
	gSf66U00XLAdEv912vjk3mK0J6Jyk4eSOLl7tT+hsRbeK2ARXk2RD0jcVJi4rMPpHUb84FDkvD8
	aQXQmNGO5CTX6HZplk9rOqlC4f7bzCMPm+v9Hfi1Klv0rP9EfIh/RhrNmFOP1LExwSY8nWzdSzm
	skTImS55VGfkW3WRDx5r5hGWJBEN7/j+iXhAg+eLmkQMEspeO5ewagk7mR8IzbpfnBrOaPa6Xho
	azCWP8kQiA+gRC4uyP9wJHEjAMRWLRHnwNzN7Ep4BggZbB4FiiqSh6UtcnkxC741Yaz7BKGPDvX
	smCcWkEj754PvQFuuG0Hf6ewiDUAK89kjz9lefl8XEA283mEcHv1azshC5FDxCl4IQBF9iqGl3x
	9y7TNBcR92R/EE7vNmMH91BOvieY+hPOcsmSa93tQo/t6dPw8BB6sQz9o6tgBK0yKCwDSz
X-Received: by 2002:a17:90a:da8d:b0:3a4:a2d1:3495 with SMTP id 98e67ed59e1d1-3a4a2d138f2mr813035a91.7.1790671967807;
        Tue, 29 Sep 2026 01:52:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492da42a3sm2177877a91.2.2026.09.29.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/5] phy: core: Add common helper to add phy phandle device link
Date: Tue, 29 Sep 2026 16:52:31 +0800
Message-ID: <20260929085235.469515-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929085235.469515-1-inochiama@gmail.com>
References: <20260929085235.469515-1-inochiama@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..7be649f14797 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,27 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device consuming the PHY
+ * @phy: the PHY supplied to @dev
+ *
+ * Add a device link with @dev as the consumer and @phy as the
+ * PHY supplier.
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
@@ -784,7 +805,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	if (dev->of_node) {
 		if (string)
@@ -808,10 +828,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -885,7 +902,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -900,10 +916,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -955,7 +968,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -977,10 +989,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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

