Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC74E01EA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671976; cv=none; b=K+AuVHA/f1oeJgekjNAnBmneylhNw0xwK+N4cBytmHCQNpcopG0y92DU7dRijGJ+1Efo9dzNRPfm5txOnV3HJ7AiIhX+zzPm9PPd1y+2AxdE8iePaJXjr47ln/1B2IfBapXP4Lf3NXs29BG7umf0sgbIo881Jgpji743v5SOZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671976; c=relaxed/simple;
	bh=OZgQEFvU5+/DbzdlPy5+1h2N0KFyrBwZO9/fwi7cA5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXBDa11qF/rFSrT/Hu1W2UFHGEWBjM/ubXMJaE8EsKc8Uu6EfrtXYYQnXzUAFr9Qw0ZA7QBS/dC8wY6ZBOpxlG1Ftl5ny/4Lm9UZP8jtco1a25aB+AQDFDVH0v0AP4c2713Jl8AhOZcdoBRvwrSF39mTZRqhHpEqFLHatTmGVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1Qm9nwt; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1Qm9nwt"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso2852325a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671974; x=1791276774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVt+Q6vf6BkSb3Obq200XC2a8MA/3pBxsRhoBaJSQWk=;
        b=a1Qm9nwtnndFJGiNIkBvOjtdfVK2yNfwxzJXtpO6C45fLIALKM2vAmjx/jyTEIM5X+
         NCnOMF3zawuYqTEuxiDZhu9kUIIr0NbAHvbM5jknsRmN9nkPhq4f6Cc6VJMJIEN1DFbH
         91aloH04JO/daMuNBue2KxvFDcjxqj7QV4nw6DXVEg6ceroDBY3z593U+mIJMC2RsI4D
         QbtBuQhZ2LsA0RFpI9oGZ9zP9C620dDK/c4Boane1Jj9PJRb1RENc/jImlJxjmf+BmQu
         Ny9Ml4SqWsA83gSH4UJzykOsZIomB34kAqUVY5/JbAc/O7/pkHyKYMfCxNdKkgXx17LY
         hnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671974; x=1791276774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVt+Q6vf6BkSb3Obq200XC2a8MA/3pBxsRhoBaJSQWk=;
        b=RQfmf7eTTdlwGYu3eYSWz8O3uOynNvV+gbhlfwhlQ86mHI6AlbFaowdvOcKbkb89kP
         IjVGZOeqdikeKW5JYTAi3CSI3ZFaM7dZqL4TWnfsxUOjpJiHsTlExJSipZp4/1AXgv42
         jNyYTaeWea5buR8+7A9Aq7RR+jEeAEcW0F1IzYE0XS/w0LNHAyRrSfpDvIEn0YW/sE1B
         nBR3go5tuvOu57cbtZiWhPkRr6pJUel6XPTW8GX8mRjxweERba9ru5LVU8tGv646+kRY
         KvN5z0eE6PBPCUacI96kthAws1OVfnuU9jHHeN+C+wjmEelEuTHHP/lc5ndv4jxwK5qx
         lILw==
X-Forwarded-Encrypted: i=1; AKwUvBwMVqXVuH7P+4lrpZ0YoGzAWecljotOLWulbLgolEJSj7521XoQBLsua1t40Dzb0e2q2veHPGwc3vkTGfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5FgZ6O8SobddreFnUCFArnun67BvdTjnu62VRR2ov/SFNZ3zO
	E096zRhD3VfJlDD7TjkK4xUI6uhQtyOO4A7vimADXYZWj2vLDnO55qkO
X-Gm-Gg: AYBFou1BkRBoaGCNcUyIVpss/JgFH5QoyFSui85f7iRqElhYJ78zdGQQ/Vr1ezGXiN6
	ry6BW9kpJeP5+ITMy7z+cGe1VdGw/Ssbf3xAhmgHH638+Wf6TxNJbVeic0JPDNqhdy2UaS6qD3H
	V52L0I8ZG4PMndwCnaZl1Rg3R4P5R9Uck2AjcqjrhJUNatwm19+vi0/6g5iyFjyiqnXbf8oCVgt
	wHIoWT9cxkciK1uDk7KT/7oEPFZC5DffXfI4ujv52QjdftB59x6IKbpyjY+MU2OYDym7RKJGjF/
	NN6uQUKfjyf28QdCD8TntZoFIfYderCx1IF89kZRTDUQzwr44o+oo6cC7z1+q3YNgrpC4umESrd
	2dgnXW0XbTi5gMNKGYfEE2rTWyqt1x/PyTZK9Qp4gMauPVavMuyp83gCit1BiVVklf3ZbtvY2pg
	WS88VuNcDe+l0hBrzOiIuI0Vk8erfHv/SgZUq2P0u6MUaj/8Wx+X19cYj29YFUvucE1eYq3DwKp
	tCiD2w=
X-Received: by 2002:a17:90b:574d:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a099230a7fmr14603405a91.46.1790671973686;
        Tue, 29 Sep 2026 01:52:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4926b3f9fsm2394655a91.0.2026.09.29.01.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:53 -0700 (PDT)
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
Subject: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Date: Tue, 29 Sep 2026 16:52:33 +0800
Message-ID: <20260929085235.469515-4-inochiama@gmail.com>
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

Add several helper functions that allow drivers to get several phy
consumers in one operation. If any of the phy cannot be acquired then
any phys that were got will be put before returning to the caller.

This can relieve the driver owners' life who needs to handle many phys,
as well as each phy error reporting.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 253 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  55 +++++++++
 2 files changed, 308 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8fbaea003b90..5b76c006575b 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1004,6 +1004,259 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * of_phy_get_count() - Get the number of phys of a device node
+ * @np: device_node for which to get the phy
+ *
+ * Return: the phy count if successful, %0 if no phy handle is found,
+ * negative error value if error occurs.
+ */
+static int of_phy_get_count(const struct device_node *np)
+{
+	int count;
+
+	count = of_count_phandle_with_args(np, "phys", "#phy-cells");
+
+	if (count == -ENOENT)
+		return 0;
+
+	return count;
+}
+
+/**
+ * phy_bulk_put() - release a set of PHYs
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+static void phy_bulk_put(struct device *dev, unsigned int num_phys,
+			 struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		if (!IS_ERR_OR_NULL(phys[num_phys].phy))
+			phy_put(dev, phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+
+/**
+ * of_phy_bulk_put() - release a set of PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+static void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		of_phy_put(phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+
+static int of_phy_bulk_get_by_index(struct device_node *np,
+				    unsigned int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].id = NULL;
+		phys[i].phy = NULL;
+	}
+
+	for (i = 0; i < num_phys; i++) {
+		of_property_read_string_index(np, "phy-names", i, &phys[i].id);
+
+		phys[i].phy = of_phy_get_by_index(np, i);
+
+		ret = PTR_ERR_OR_ZERO(phys[i].phy);
+		if (ret) {
+			phys[i].phy = NULL;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	of_phy_bulk_put(i, phys);
+
+	return ret;
+}
+
+/**
+ * of_phy_bulk_get_all() - obtain all PHYs from a device node
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets every PHY referenced by the phys property in index order. PHY names are
+ * read from phy-names when present.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+static int of_phy_bulk_get_all(struct device_node *np,
+			       struct phy_bulk_data **phys)
+{
+	struct phy_bulk_data *phy_bulk;
+	int num_phys;
+	int ret;
+
+	num_phys = of_phy_get_count(np);
+	if (num_phys <= 0)
+		return num_phys;
+
+	phy_bulk = kmalloc_objs(*phy_bulk, num_phys);
+	if (!phy_bulk)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_by_index(np, num_phys, phy_bulk);
+	if (ret) {
+		kfree(phy_bulk);
+		return ret;
+	}
+
+	*phys = phy_bulk;
+
+	return num_phys;
+}
+
+/**
+ * phy_bulk_put_all() - release and free PHYs
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to release and free
+ */
+static void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
+			     struct phy_bulk_data *phys)
+{
+	if (IS_ERR_OR_NULL(phys))
+		return;
+
+	phy_bulk_put(dev, num_phys, phys);
+	kfree(phys);
+}
+
+/**
+ * phy_bulk_init() - initialize multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to initialize
+ *
+ * Initializes the PHYs in array order. If an initialization fails, all PHYs
+ * initialized by this call are exited in reverse order.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_phys; i++) {
+		ret = phy_init(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		phy_exit(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_init);
+
+/**
+ * phy_bulk_exit() - exit multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to exit
+ *
+ * Exits the PHYs in reverse array order. All PHYs are processed even if an
+ * error occurs.
+ *
+ * Return: %0 if successful, the first negative error code otherwise
+ */
+int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	int ret = 0;
+	int err;
+
+	while (num_phys--) {
+		err = phy_exit(phys[num_phys].phy);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_exit);
+
+/**
+ * phy_bulk_power_on() - power on multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to power on
+ *
+ * Powers on the PHYs in array order. If a power-on operation fails, all PHYs
+ * powered on by this call are powered off in reverse order.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_phys; i++) {
+		ret = phy_power_on(phys[i].phy);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		phy_power_off(phys[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_power_on);
+
+/**
+ * phy_bulk_power_off() - power off multiple PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to power off
+ *
+ * Powers off the PHYs in reverse array order. All PHYs are processed even if
+ * an error occurs.
+ *
+ * Return: %0 if successful, the first negative error code otherwise
+ */
+int phy_bulk_power_off(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	int ret = 0;
+	int err;
+
+	while (num_phys--) {
+		err = phy_power_off(phys[num_phys].phy);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_power_off);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..77d9d74682b7 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -81,6 +81,18 @@ union phy_configure_opts {
 	struct phy_configure_opts_hdmi		hdmi;
 };
 
+/**
+ * struct phy_bulk_data - Data used for bulk phy operations.
+ *
+ * @id: phy consumer ID
+ */
+struct phy_bulk_data {
+	const char	*id;
+
+	/* private: Internal use */
+	struct phy	*phy;
+};
+
 /**
  * struct phy_ops - set of function pointers for performing phy operations
  * @init: operation to be performed for initializing phy
@@ -309,6 +321,12 @@ void devm_of_phy_provider_unregister(struct device *dev,
 	struct phy_provider *phy_provider);
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+
+int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_off(unsigned int num_phys, struct phy_bulk_data *phys);
+
 #else
 static inline int phy_pm_runtime_get(struct phy *phy)
 {
@@ -493,6 +511,43 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int phy_bulk_check_disabled(unsigned int num_phys,
+					  struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return 0;
+
+	for (unsigned int i = 0; i < num_phys; i++)
+		if (phys[i].phy)
+			return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static inline int phy_bulk_init(unsigned int num_phys,
+				struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_exit(unsigned int num_phys,
+				struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_power_on(unsigned int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_power_off(unsigned int num_phys,
+				     struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }
-- 
2.55.0

