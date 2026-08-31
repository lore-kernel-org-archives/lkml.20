Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855C317173
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144941; cv=none; b=NWKJF6WtLVjm54wk1PEsEUjXPAkUQAzHItx+Dpdq6A3vkSKlwHOhSqjl27kqeeX9Php2b6/7vrhx5Txfj3KDWRj8p33sptvxuRrRYEOwQj7voOjtcohFMeCeurQHhsVQY8q5iKIMO/9UvIj2SQP38IErQWYRo/wxSwJIT4XuXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144941; c=relaxed/simple;
	bh=yvKKIis2mM3M8rHe+k28uw0CsHy0w/GjXrnKUbJd17s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nt/SBtzaOisOODqryU8UpaiaNKrZLHOE3g8YES5wE1e35KHi4IZOwJsx+eUbJb3I5xT6EyNoEPC15rs4px3BRWy7ZW57GO/jIbY37OYTl11Xg5MZXuSVtabUqS0wQO/DS+WQn3ebSwL8o4mUmkMN7FIF1fCG9IShV0bwvaBxCzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPgezsxJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPgezsxJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3054391a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144935; x=1788749735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfZZukszPL2Fv53k+Guq0g5Yfm4pyEHDGAx2QK0xQYk=;
        b=oPgezsxJEyEyWw2YbCrLaJFbaLkZGP61Eo0iRSYikpSmbvyd7SWQLbNI5M2qo967hk
         UsWMts/ZleCzd5/PlNIjTjeb+IUjHvEjUhfedd5MbRtkeXYCDP/rbIMHpBS+AVkmE1xg
         WWviYgRC3GlK07jExEtR6sb43R1QVbyY/JQcw6k8Veksn0pXRbGmpjDzeq8PUGfjFoZ0
         uCdLb96K190dN6K7yddhM77Ok2LT9MMwxWOhoZKB8Wem3qLOJNXb742HjW0JrFaQ89qk
         sR9BGB/a3ibt4B1hozHieQMtfVSLKVlHx9UDiBZsEq/lsuI9lL3qTenqKQtqlhX50e+K
         uW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144935; x=1788749735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfZZukszPL2Fv53k+Guq0g5Yfm4pyEHDGAx2QK0xQYk=;
        b=YChe6AOs/rgH6F5TUbeJkL82YhMxz78BAPu8drMSQOcBwFSxOOW5mTyXBKMGKZgX57
         /JVa7VbRdZYFzUCrznuiC3vSEuFJhNLMEW//T29BFXa7Nr27V0cao0sDjVp4UHOruMke
         Q6R1NmzXXdMsGfqZzZJHVOvEMZ3p7D+qi3wJjrMXM++/Xy3lbd4Vcz+e4tCK2t4DJvhe
         w9z9N+9CF+av9/yDGy+UpcB/I3QdqlIlAdnnsR4sXQM/Ugt7zVZgLt9+3D0OVD7joVWi
         F1tK7uHVZVy3O7T0voF+dAvVKs/TcBapO/BAszAT2QDr2FxkYktx3Rn2y8+v1ioJGGqz
         UBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNYm6p3q99e8XsCnD3j+fjI1mQS1FLLIHx/DRdoqjITBnEjlm9qG7lMngDBVPcUDB+Z0PjAueZfy/5yuk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6agzv9v6xJ2qtVcB/+8vlZOry2OBiRBLc5xNU7/YN+c018gRf
	oZOWW/rMLzioNJYlYVVlJSEAvDfPrglpH8Qkth9yY+pmiTETZwYqZskP
X-Gm-Gg: AYBFou25gt9J7nvUKNx8WDpe65PjMJrV4hrI+0h1arUARzTwZ0j9Rrhpyux7S84FgX1
	z48Gf2iJ2ZUBvUWbxDYihIkDggp+9HkU+2WdDN5XMRLeawQRB8B4w6dPz2iZZtgCb3ik30wpgR4
	oNup84q3iZh2S3E5pNbwDbOjsp0UV4A0jAAKyLkkIyuPlykgkijARpd3/x1INFbbxs5zIUuncRf
	3YKPyesHp9Kfy8jZm6FzDICc2/d0hGghBbNImM4bpvAbGnacc+zMezET5WNF3bgoKbkHdaBnSad
	/9Fj5ACrwEoix9FjvJ8w/F+fAO1qhyipDyYAK0oocEStaYzP5licy76o2L+i9AFkYPJt2OGkSEd
	RWJWZpUImOilWmyQ/hIJcJ5hBSKpR/4sRZYW8N7uMAG2hf7sL53HTJeyVbnMT2bceMwbRJDOwrq
	WyuKHwTpgQQTAg4cFu79+16B+RZNx2Z0ohyu2c0HCPw13Ss3/tJbd1NtUYaA0=
X-Received: by 2002:a17:90b:17cd:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-398bc52849emr14105453a91.21.1788144935383;
        Sun, 30 Aug 2026 19:55:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b19927a1sm20278381a91.14.2026.08.30.19.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:55:35 -0700 (PDT)
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
Subject: [PATCH 3/3] phy: core: Add phy bulk data helper functions
Date: Mon, 31 Aug 2026 10:55:05 +0800
Message-ID: <20260831025506.95548-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831025506.95548-1-inochiama@gmail.com>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
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
 drivers/phy/phy-core.c  | 631 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 183 ++++++++++++
 2 files changed, 814 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 2259f0dff082..26b48cece312 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1003,6 +1003,637 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * of_phy_get_parent_count() - Get the number of phys of a device node
+ * @np: device_node for which to get the phy
+ *
+ * Return: the phy count if successful, 0 if no phy handle is found,
+ * negative error value if error occurs.
+ */
+static int of_phy_get_parent_count(const struct device_node *np)
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
+ * phy_bulk_put() - release a set of PHYs obtained with phy_bulk_get()
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+void phy_bulk_put(struct device *dev, int num_phys, struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (--num_phys >= 0) {
+		if (phys[num_phys].phy)
+			phy_put(dev, phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(phy_bulk_put);
+
+/**
+ * of_phy_bulk_put() - release a set of PHYs obtained with of_phy_bulk_get()
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+void of_phy_bulk_put(int num_phys, struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (--num_phys >= 0) {
+		of_phy_put(phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(of_phy_bulk_put);
+
+static int __phy_bulk_get(struct device *dev, int num_phys,
+			  struct phy_bulk_data *phys, bool optional)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].phy = phy_get(dev, phys[i].id);
+		if (IS_ERR(phys[i].phy)) {
+			ret = PTR_ERR(phys[i].phy);
+			phys[i].phy = NULL;
+
+			if (ret == -ENODEV && optional)
+				continue;
+
+			dev_err_probe(dev, ret,
+				      "Failed to get phy: (%s)\n",
+				      phys[i].id);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	phy_bulk_put(dev, i, phys);
+
+	return ret;
+}
+
+/**
+ * phy_bulk_get() - lookup and obtain references to multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets each PHY using phy_get(). This supports both device tree lookups and
+ * non-device-tree lookups registered with phy_create_lookup(). The caller must
+ * call phy_bulk_put() to release the PHY references.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int phy_bulk_get(struct device *dev, int num_phys, struct phy_bulk_data *phys)
+{
+	return __phy_bulk_get(dev, num_phys, phys, false);
+}
+EXPORT_SYMBOL_GPL(phy_bulk_get);
+
+/**
+ * phy_bulk_get_optional() - obtain references to multiple optional PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets each PHY using phy_get(). A PHY that is not present is stored as NULL
+ * instead of causing the operation to fail. The caller must call
+ * phy_bulk_put() to release the PHY references.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int phy_bulk_get_optional(struct device *dev, int num_phys,
+			  struct phy_bulk_data *phys)
+{
+	return __phy_bulk_get(dev, num_phys, phys, true);
+}
+EXPORT_SYMBOL_GPL(phy_bulk_get_optional);
+
+/**
+ * of_phy_bulk_get() - obtain references to multiple PHYs from a device node
+ * @np: device node containing the PHY references
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets each PHY using of_phy_get() and the specified device node. The caller
+ * must call of_phy_bulk_put() to release the PHY references.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int of_phy_bulk_get(struct device_node *np, int num_phys,
+		    struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].phy = of_phy_get(np, phys[i].id);
+		if (IS_ERR(phys[i].phy)) {
+			ret = PTR_ERR(phys[i].phy);
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
+EXPORT_SYMBOL_GPL(of_phy_bulk_get);
+
+static int of_phy_bulk_get_by_index(struct device_node *np, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].id = NULL;
+		phys[i].phy = NULL;
+	}
+
+	for (i = 0; i < num_phys; i++) {
+		of_property_read_string_index(np, "phy-names", i,
+					      &phys[i].id);
+
+		phys[i].phy = of_phy_get_by_index(np, i);
+		if (IS_ERR(phys[i].phy)) {
+			ret = PTR_ERR(phys[i].phy);
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
+ * read from phy-names when present. The caller must call
+ * of_phy_bulk_put_all() to release the PHY references and free the array.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys)
+{
+	struct phy_bulk_data *phy_bulk;
+	int num_phys;
+	int ret;
+
+	*phys = NULL;
+
+	if (!np)
+		return 0;
+
+	num_phys = of_phy_get_parent_count(np);
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
+EXPORT_SYMBOL_GPL(of_phy_bulk_get_all);
+
+/**
+ * of_phy_bulk_put_all() - release and free PHYs obtained by
+ * of_phy_bulk_get_all()
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to release and free
+ */
+void of_phy_bulk_put_all(int num_phys, struct phy_bulk_data *phys)
+{
+	if (IS_ERR_OR_NULL(phys))
+		return;
+
+	of_phy_bulk_put(num_phys, phys);
+	kfree(phys);
+}
+EXPORT_SYMBOL_GPL(of_phy_bulk_put_all);
+
+/**
+ * phy_bulk_get_all() - obtain all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets every PHY referenced by the device's device tree node and creates a
+ * device link for each PHY. The caller must call phy_bulk_put_all() to release
+ * the PHY references and free the array.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	struct device_node *np = dev_of_node(dev);
+	int ret, i;
+
+	*phys = NULL;
+
+	if (!np)
+		return 0;
+
+	ret = of_phy_bulk_get_all(np, phys);
+	if (ret > 0)
+		for (i = 0; i < ret; i++)
+			phy_add_device_link(dev, (*phys)[i].phy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_bulk_get_all);
+
+/**
+ * phy_bulk_put_all() - release and free PHYs obtained by phy_bulk_get_all()
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to release and free
+ */
+void phy_bulk_put_all(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys)
+{
+	if (IS_ERR_OR_NULL(phys))
+		return;
+
+	phy_bulk_put(dev, num_phys, phys);
+	kfree(phys);
+}
+EXPORT_SYMBOL_GPL(phy_bulk_put_all);
+
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	int num_phys;
+	bool free_phys;
+};
+
+static void devm_phy_bulk_release(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	if (devres->free_phys)
+		phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+	else
+		phy_bulk_put(dev, devres->num_phys, devres->phys);
+}
+
+static int __devm_phy_bulk_get(struct device *dev, int num_phys,
+			       struct phy_bulk_data *phys, bool optional)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	if (optional)
+		ret = phy_bulk_get_optional(dev, num_phys, phys);
+	else
+		ret = phy_bulk_get(dev, num_phys, phys);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres->free_phys = false;
+	devres_add(dev, devres);
+
+	return 0;
+}
+
+/**
+ * devm_phy_bulk_get() - managed lookup of multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using phy_bulk_get() and associates the references with @dev.
+ * The references are automatically released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys)
+{
+	return __devm_phy_bulk_get(dev, num_phys, phys, false);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get);
+
+/**
+ * devm_phy_bulk_get_optional() - managed lookup of multiple optional PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using phy_bulk_get_optional() and associates the references
+ * with @dev. Missing PHYs are stored as NULL. The references are automatically
+ * released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_phy_bulk_get_optional(struct device *dev, int num_phys,
+			       struct phy_bulk_data *phys)
+{
+	return __devm_phy_bulk_get(dev, num_phys, phys, true);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_optional);
+
+/**
+ * devm_of_phy_bulk_get() - managed lookup of multiple PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using of_phy_bulk_get() from the specified device node,
+ * associates the references with @dev, and creates a device link for each PHY.
+ * The references are automatically released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_of_phy_bulk_get(struct device *dev, struct device_node *np,
+			 int num_phys, struct phy_bulk_data *phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret, i;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get(np, num_phys, phys);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	for (i = 0; i < num_phys; i++)
+		phy_add_device_link(dev, phys[i].phy);
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres->free_phys = false;
+	devres_add(dev, devres);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get);
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs using phy_bulk_get_all() and associates the allocated array and
+ * PHY references with @dev. They are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	*phys = NULL;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = phy_bulk_get_all(dev, &devres->phys);
+	if (ret > 0) {
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres->free_phys = true;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
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
+	int ret, i;
+
+	*phys = NULL;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres->free_phys = true;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
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
+int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	if (!phys)
+		return 0;
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
+int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret = 0;
+	int err;
+
+	if (!phys)
+		return 0;
+
+	while (--num_phys >= 0) {
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
+int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret, i;
+
+	if (!phys)
+		return 0;
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
+int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys)
+{
+	int ret = 0;
+	int err;
+
+	if (!phys)
+		return 0;
+
+	while (--num_phys >= 0) {
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
index ea47975e288a..97209f5d216a 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -81,6 +81,21 @@ union phy_configure_opts {
 	struct phy_configure_opts_hdmi		hdmi;
 };
 
+/**
+ * struct phy_bulk_data - Data used for bulk phy operations.
+ *
+ * @id: phy consumer ID
+ * @phy: struct phy * to store the associated phy
+ *
+ * The PHY APIs provide a series of phy_bulk_() API calls as
+ * a convenience to consumers which require multiple phys.  This
+ * structure is used to manage data for these calls.
+ */
+struct phy_bulk_data {
+	const char	*id;
+	struct phy	*phy;
+};
+
 /**
  * struct phy_ops - set of function pointers for performing phy operations
  * @init: operation to be performed for initializing phy
@@ -309,6 +324,33 @@ void devm_of_phy_provider_unregister(struct device *dev,
 	struct phy_provider *phy_provider);
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+
+int phy_bulk_get(struct device *dev, int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_get_optional(struct device *dev, int num_phys,
+			  struct phy_bulk_data *phys);
+int of_phy_bulk_get(struct device_node *np, int num_phys,
+		    struct phy_bulk_data *phys);
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys);
+int devm_phy_bulk_get_optional(struct device *dev, int num_phys,
+			       struct phy_bulk_data *phys);
+int devm_of_phy_bulk_get(struct device *dev, struct device_node *np,
+			 int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys);
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
+void phy_bulk_put(struct device *dev, int num_phys, struct phy_bulk_data *phys);
+void of_phy_bulk_put(int num_phys, struct phy_bulk_data *phys);
+void phy_bulk_put_all(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys);
+void of_phy_bulk_put_all(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_init(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys);
+
 #else
 static inline int phy_pm_runtime_get(struct phy *phy)
 {
@@ -493,6 +535,147 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int phy_bulk_get(struct device *dev, int num_phys,
+			       struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int phy_bulk_get_optional(struct device *dev, int num_phys,
+					struct phy_bulk_data *phys)
+{
+	int i;
+
+	if (!phys)
+		return 0;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	return 0;
+}
+
+static inline int of_phy_bulk_get(struct device_node *np, int num_phys,
+				  struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_phy_bulk_get(struct device *dev, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_phy_bulk_get_optional(struct device *dev, int num_phys,
+					     struct phy_bulk_data *phys)
+{
+	return phy_bulk_get_optional(dev, num_phys, phys);
+}
+
+static inline int devm_of_phy_bulk_get(struct device *dev,
+				       struct device_node *np, int num_phys,
+				       struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int phy_bulk_get_all(struct device *dev,
+				   struct phy_bulk_data **phys)
+{
+	if (phys)
+		*phys = NULL;
+
+	return -EOPNOTSUPP;
+}
+
+static inline int of_phy_bulk_get_all(struct device_node *np,
+				      struct phy_bulk_data **phys)
+{
+	if (phys)
+		*phys = NULL;
+
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return phy_bulk_get_all(dev, phys);
+}
+
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	return of_phy_bulk_get_all(np, phys);
+}
+
+static inline void phy_bulk_put(struct device *dev, int num_phys,
+				struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (--num_phys >= 0)
+		phys[num_phys].phy = NULL;
+}
+
+static inline void of_phy_bulk_put(int num_phys, struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (--num_phys >= 0)
+		phys[num_phys].phy = NULL;
+}
+
+static inline void phy_bulk_put_all(struct device *dev, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	phy_bulk_put(dev, num_phys, phys);
+}
+
+static inline void of_phy_bulk_put_all(int num_phys, struct phy_bulk_data *phys)
+{
+	of_phy_bulk_put(num_phys, phys);
+}
+
+static inline int phy_bulk_check_disabled(int num_phys,
+					  struct phy_bulk_data *phys)
+{
+	int i;
+
+	if (!phys)
+		return 0;
+
+	for (i = 0; i < num_phys; i++)
+		if (phys[i].phy)
+			return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static inline int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
+static inline int phy_bulk_power_off(int num_phys, struct phy_bulk_data *phys)
+{
+	return phy_bulk_check_disabled(num_phys, phys);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }
-- 
2.55.0

