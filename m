Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429D4E1C75
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671978; cv=none; b=AIztFTPenYJtQAMObEnwH7tNtFOF/sVeLbc21vhRqYU7+cK+nQ2MP3K3+FPu99CpMrimWGjFLNaCE/pLOxH/CBVsLknDyatjWsb1nDkfdLxZocgveoFh9BUyVwX7jNb6VkVv4XxksfKlCWjhpdAZf9fWlxx3POBKaxplCaqSwBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671978; c=relaxed/simple;
	bh=0BuC+m4001jm0LtxJ5Aoc4IuhuJTdWNW08Zgoc6YibU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdjf5Pvr0s93gZIMFStVT4TeWxpZF8Z+mKtgu5S+5FgEQF72LpgtC+XM9xFld/c9IVzkB0dWWYNJdzGPY/6rltD9Z6bePg9+YZw341T5zfH7iiBDdft3v2wyuCTdLivnl+g2qB5fiPzpJ2kMUmxoXzLPyAe6WzoLCDr+6CtjkNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3iX54pc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3iX54pc"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2080256a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671977; x=1791276777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23PT++YfQdFZCmgLsj0Bh4dPpOhTY0Wr6NJKb8T5Wo=;
        b=K3iX54pcguFJjx22kUkulB/S5JHCD0M5iBJZvyry/koBKsdEmLOiCYYQI0d0EKA8Je
         3T64Gj5Z8faLOlkIJyD/po7Vr+ZO0QIK4/V48bhuSH0WoYVeknMGF+d2PcpxZMQmL0Dj
         njuudZcruCgxCUwU5BZKX/6IyGUtmnOS0jzDhaxJSqAhucobGSeeP/ykNusEazg+Hpzl
         GbZ+xlbkfuVaUsJF1WZQz2pDCerJUvgj4i+mzhLsWqg9lMRSQ/XK3HqW47HDswPGZOPn
         apq1b9Uhb0Q5eBe0cqr0Zji2EzdYEnwyLisX/sYvEMpXBN6atihU5Itg6K9+7EyP05k/
         2IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671977; x=1791276777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23PT++YfQdFZCmgLsj0Bh4dPpOhTY0Wr6NJKb8T5Wo=;
        b=TZutO1P8ntYAsAvP7VHAmTJGKRL+Ap98qkDSjAd89sS1ZRVsYpHT3xN4JIaEzrYhNR
         tZrWwbt3Qn34D94ijnVz1lYNBRYskJi4OgZaiInEJrZuP/WpWxCgHACeBa/KU6JTrsip
         Inga6Pj6mnjnA0ZKMsYoDySxSN/Z8SXQs5ZigmE4xiSuoHxZAMZclEOLPho675ASsJwA
         BM0vRqRzGXBTTEKhIoXpQA7gwy8LBHSEydBA7Z2HKAAnrhAg73QbX7LmdYD6q1SgcHJ6
         jgdKWGmw0dmWusLdLLjnFREM7azsZAsdTqngDAzt3yzWx134AUtSanGZt+3Xw/mJNt+Y
         Uq2w==
X-Forwarded-Encrypted: i=1; AKwUvByzD7PsDRhJnMmC8myEZkgUbCNrAZHCgZTAoWuUwDI0R4A9PH8nw17ZDIg3xnp1/ZsLvheTm5qwldSsmqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx0U792vwfEJxbzrL0Fh4KeCFlonTXUgTxMjv20b6bO30ugUT8
	CIQi7Qv45qoCUYi5P4gEeYupgnodagOXFIOWX/1Z347mSIdH1g3Go2qd
X-Gm-Gg: AYBFou0HoDxsltsBGf/ksGAmFxeoFi+6QUc3ZKWK0iR77Jq43TMk5BDKQ5h0rgCg3J3
	yfjdRqPs82xuADwvZ1TUyFzqNASVafIQCZvF3AXq5HIgCEVRaPoM3FVFKpfbN0uBndKnv5S9sH2
	EPlLlLzzB6pvFArF7OY/RYuYi9togXeB19yR10bFGkNVaOvZpF2GUWqSy7oabTv6texr1vWbxxV
	aE6YXfgF/NOIuIXw5A5VXJMibjAq7i3dsvW+Cf2uxKhwzmpxbUtI5fWZ1JyvRscxuyvmQGRBAzg
	uQYi13yZTyTUThS009rmfopmf705dXXXkQEITP6nvcCsqoxOozu/PyhiczT7MCeWOdrkGSEcC23
	k/J1P9xpZ5fS7jwQLsjRXn/GJG0lmmxA++Q5YOhY/ND+eVKPY9/HPpF9k1BFRsQjLHxRlZGoct8
	zscGgJji8BysI8RK2sg7RStH1/gkQwuDmJMTO3WpYtsHfzYijeKd+Upw3rDSUeMVahoDp4gONzh
	cmYWNc=
X-Received: by 2002:a17:90b:28cc:b0:3a0:d440:7950 with SMTP id 98e67ed59e1d1-3a0d440b3f7mr8706884a91.4.1790671976493;
        Tue, 29 Sep 2026 01:52:56 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm4379539a91.3.2026.09.29.01.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:56 -0700 (PDT)
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
Subject: [PATCH v4 4/5] phy: core: Add managed phy bulk data helper functions
Date: Tue, 29 Sep 2026 16:52:34 +0800
Message-ID: <20260929085235.469515-5-inochiama@gmail.com>
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

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 73 +++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 19 +++++++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 5b76c006575b..a588fba33313 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1145,6 +1145,79 @@ static void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
 	kfree(phys);
 }
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	unsigned int num_phys;
+};
+
+static void devm_phy_bulk_release_all(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * The function calls devm_of_phy_bulk_get_all() directly, but sets the
+ * @np parameter to dev_of_node(dev).
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_all);
+
+/**
+ * devm_of_phy_bulk_get_all() - managed lookup of all PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs from the specified device node, associates the allocated array
+ * and PHY references with @dev, and creates a device link for each PHY. They
+ * are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	*phys = NULL;
+
+	if (!np)
+		return 0;
+
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (int i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
+
 /**
  * phy_bulk_init() - initialize multiple PHYs
  * @num_phys: number of entries in the phys array
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 77d9d74682b7..e60e42eb7e0b 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -322,6 +322,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
 int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys);
@@ -511,6 +514,22 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	if (phys)
+		*phys = NULL;
+
+	return 0;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+
 static inline int phy_bulk_check_disabled(unsigned int num_phys,
 					  struct phy_bulk_data *phys)
 {
-- 
2.55.0

