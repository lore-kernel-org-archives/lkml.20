Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B03FFF94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511082; cv=none; b=Ys1D7V66HAVS8C7GJZMV2VSQCau56EbTfIFuNRwgMq3whzqXpvGvVJxVOhjg37M/6ryZS8rSj5l0Ur7GU7gB3H0pFS/e0vwKzqSJUVagaS5KDMjetIvw6vNLF7sp8MXOf8ZB/OACOLxOFM7f9vw0GCfrVVuig/G1C2qX86Uw+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511082; c=relaxed/simple;
	bh=r2YbVQu7loT4b/jjmgOTG0eO0aAdU/gbNLnb5FR77u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQBrDex/B77l23P/zlrf0YbWiY8ZUmYRjf42G8woJCb9V7kBOVsHFcZSNwf4ueRD2V2bcvQF3XuoPsMa3G1m7gnVqKX9uuJrXQwfDV+nb113Z1KHzyxCLvy6Np4BJfk0wDqiQEG+O13+edfcHQV7mst4FhIGng0KffjfknyNyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLaWc7QW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLaWc7QW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-855d2bfae95so2296024b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511079; x=1789115879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXsgluCGsQu3NWRJe11WOavM3i5u5c6VI3qIHHMnTG4=;
        b=tLaWc7QWqJDJvE5xRxtQQ91f4WNfk2WBYjkBfItJaZztAd9M/x+OGVNDSdKCGRx+ML
         u9z2PHHpzjPyrD3ycLzTrkavSKyI4Gi7iNiN1/sbj5HCgCUOFUf3GIbKwQzCyI91pxYZ
         CeMCm/vju5pxnpnmObSRUup0u8GmHgZg6GJFqab1iMieSiMGJC+Z9jWPQK1D0joSWzP/
         XR6CiiyIMLncJRfA5SiNG0XSNvsD/w7MGYSco7Ag/qBbtrLYyRg2qPUfTQaa1F3WgZDN
         Q+iQIQHOPn/hylBznx1Dr46qeCZJjxDKd9oUtj7/tMSbdYwFzE79pGHNtnRGOp7rs/qh
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511079; x=1789115879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXsgluCGsQu3NWRJe11WOavM3i5u5c6VI3qIHHMnTG4=;
        b=SFUiSUAhfAn9IuQSN9f10ZDxtJI+95YPOT4nvserJw3EyqN4M3la70QZILr4WTDKUD
         qlNw7+XC+1wyQhYBeZUp5aIT9tV6h+m++nofUaXeFnfyFw8TJ7QGTJ9350XVXLl4Jlqc
         JwJK/0uCS0QLOFFDt3pSYUSP0KSQiEqg9XX9hpVzhNaW/cYF+QBbRZ9aA2t20BRu/hGn
         BuEa3uRyxnp73DchJCAXotTnWk5VCtVbT+phbCDdmtwyri87p7GvZ5bpcmlVnMvR6j3d
         VZS0FrId+MXt03/lqzaUjprfSHv4NwzDzXilzrm+gjwXU2lRp4RQ/9RKc/xc/d2qz/1o
         b1aA==
X-Forwarded-Encrypted: i=1; AKwUvByEG/0dXz4XgQerb4+/kJS2ThUJ+AcO46s2K3y4lrPxV9SsPdFdpfznZXEEt1ptVWMvgVIgPOOtpHJAEY0=@vger.kernel.org
X-Gm-Message-State: AFuF++kn16RSXTfsQQBtp+/j5LaLiWk0Nsp5NLv1v0DhKuQ1yhoD9qGC
	aMxs8t0kZWaJh5lD/gS6dSnZo/+dOfjHkPKwp8OimTceijiK35YnuWRG
X-Gm-Gg: AYBFou2eYvaodSiyuj6Hx5BTloB3B5Elu+DG8NsXHqK6CdYyYLg1eiicaxIJvTo+8pd
	4RIOefRpQULWWXYJF5vrpA/9nSNJ9aLyxAanoSdNzi1cDz3VtKbfLK39QBPF74hipDXKjDQfeo/
	k2RlBV4pbU3hiROFNydplFgF7jefzbwG0hwc+r5Am2S8VFoB8+QDkn6z9K6O9Looz4/eUHlzOpt
	a+ijgQoF5JIgSL3zrHUGwtm4VPC4fTusai22VDO69NGwXqBBLzzc8u6bKUtUgYSpG/nU0gjC4Y6
	Yq2RhNFFLN0s4I4ShNEkfLm+78FOTmvqh2oX3lSUlDbP0fnJ1OTENEwqdunSDJUCQLhJ17nTUE7
	W3e0R/DTa6jaQHNmoOX555qWL8HwcmURwSU+xeJ/B4Of9p+817gTrqUsv4GVNlV/tZluzLxAHv9
	NSrGmaWAUCtuOlvc5emVMxv1G6lSelLCl82yE2jdJeycDAQQx2PufXj/1meIg=
X-Received: by 2002:a05:6a21:e8a:b0:3cc:8716:4702 with SMTP id adf61e73a8af0-3da3be4a2f5mr3598057637.8.1788511079082;
        Fri, 04 Sep 2026 01:37:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45515397asm645664a12.1.2026.09.04.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:37:58 -0700 (PDT)
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
Subject: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Date: Fri,  4 Sep 2026 16:37:07 +0800
Message-ID: <20260904083709.425893-4-inochiama@gmail.com>
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

Add several helper functions that allow drivers to get several phy
consumers in one operation. If any of the phy cannot be acquired then
any phys that were got will be put before returning to the caller.

This can relieve the driver owners' life who needs to handle many phys,
as well as each phy error reporting.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 413 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 143 ++++++++++++++
 2 files changed, 556 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index a7d7acb5d3c2..f5596b8dfcfc 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1003,6 +1003,419 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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
+ * phy_bulk_put() - release a set of PHYs obtained with phy_bulk_get()
+ * @dev: device that acquired the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHYs set
+ *
+ * Releases the PHY references in reverse order and clears the PHY pointer in
+ * each entry. The caller owns the phys array and is responsible for freeing it
+ * if necessary.
+ */
+void phy_bulk_put(struct device *dev, unsigned int num_phys,
+		  struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		if (!IS_ERR_OR_NULL(phys[num_phys].phy))
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
+void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	while (num_phys--) {
+		of_phy_put(phys[num_phys].phy);
+		phys[num_phys].phy = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(of_phy_bulk_put);
+
+static int __phy_bulk_get(struct device *dev, unsigned int num_phys,
+			  struct phy_bulk_data *phys, bool optional)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].phy = phy_get(dev, phys[i].id);
+
+		ret = PTR_ERR_OR_ZERO(phys[i].phy);
+		if (ret) {
+			phys[i].phy = NULL;
+
+			if (ret == -ENODEV && optional)
+				continue;
+
+			dev_err_probe(dev, ret, "Failed to get phy: (%s)\n",
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
+int phy_bulk_get(struct device *dev, unsigned int num_phys,
+		 struct phy_bulk_data *phys)
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
+int phy_bulk_get_optional(struct device *dev, unsigned int num_phys,
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
+int of_phy_bulk_get(struct device_node *np, unsigned int num_phys,
+		    struct phy_bulk_data *phys)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	for (i = 0; i < num_phys; i++) {
+		phys[i].phy = of_phy_get(np, phys[i].id);
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
+EXPORT_SYMBOL_GPL(of_phy_bulk_get);
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
+EXPORT_SYMBOL_GPL(of_phy_bulk_get_all);
+
+/**
+ * of_phy_bulk_put_all() - release and free PHYs obtained by
+ * of_phy_bulk_get_all()
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data to release and free
+ */
+void of_phy_bulk_put_all(unsigned int num_phys, struct phy_bulk_data *phys)
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
+	int ret;
+
+	*phys = NULL;
+
+	if (!np)
+		return 0;
+
+	ret = of_phy_bulk_get_all(np, phys);
+	if (ret > 0)
+		for (int i = 0; i < ret; i++)
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
+void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
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
index ea47975e288a..13f9f030122f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -81,6 +81,17 @@ union phy_configure_opts {
 	struct phy_configure_opts_hdmi		hdmi;
 };
 
+/**
+ * struct phy_bulk_data - Data used for bulk phy operations.
+ *
+ * @id: phy consumer ID
+ * @phy: struct phy * to store the associated phy
+ */
+struct phy_bulk_data {
+	const char	*id;
+	struct phy	*phy;
+};
+
 /**
  * struct phy_ops - set of function pointers for performing phy operations
  * @init: operation to be performed for initializing phy
@@ -309,6 +320,26 @@ void devm_of_phy_provider_unregister(struct device *dev,
 	struct phy_provider *phy_provider);
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+
+int phy_bulk_get(struct device *dev, unsigned int num_phys,
+		 struct phy_bulk_data *phys);
+int phy_bulk_get_optional(struct device *dev, unsigned int num_phys,
+			  struct phy_bulk_data *phys);
+int of_phy_bulk_get(struct device_node *np, unsigned int num_phys,
+		    struct phy_bulk_data *phys);
+int phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys);
+void phy_bulk_put(struct device *dev, unsigned int num_phys,
+		  struct phy_bulk_data *phys);
+void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys);
+void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
+		      struct phy_bulk_data *phys);
+void of_phy_bulk_put_all(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys);
+int phy_bulk_power_off(unsigned int num_phys, struct phy_bulk_data *phys);
+
 #else
 static inline int phy_pm_runtime_get(struct phy *phy)
 {
@@ -493,6 +524,118 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int phy_bulk_get(struct device *dev, unsigned int num_phys,
+			       struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int phy_bulk_get_optional(struct device *dev,
+					unsigned int num_phys,
+					struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return 0;
+
+	for (unsigned int i = 0; i < num_phys; i++)
+		phys[i].phy = NULL;
+
+	return 0;
+}
+
+static inline int of_phy_bulk_get(struct device_node *np, unsigned int num_phys,
+				  struct phy_bulk_data *phys)
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
+static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
+				struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (num_phys--)
+		phys[num_phys].phy = NULL;
+}
+
+static inline void of_phy_bulk_put(unsigned int num_phys,
+				   struct phy_bulk_data *phys)
+{
+	if (!phys)
+		return;
+
+	while (num_phys--)
+		phys[num_phys].phy = NULL;
+}
+
+static inline void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	phy_bulk_put(dev, num_phys, phys);
+}
+
+static inline void of_phy_bulk_put_all(unsigned int num_phys,
+				       struct phy_bulk_data *phys)
+{
+	of_phy_bulk_put(num_phys, phys);
+}
+
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

