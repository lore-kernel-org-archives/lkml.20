Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B863EDAD5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511084; cv=none; b=rbVL+6qtXlYoMJYVLtnKzsya5jlW2Tuz7rVnpQYOY5pWmiVnKf93o68yh/tldla22iyTLvOswl9qmGGqcvUUvDoUaKz3XKOGJCpNrzjKULHdTKY2fPpiU9VxEwAHpLAWeWvNhteojmQeC0MoLNriFpc+lMI1L5BqW03jSvIvAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511084; c=relaxed/simple;
	bh=biJmwja02rvAee5NwhmdA8ImFbtTkB1f9MBOmtuQW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEiviyP1FMJmnlxoN0aaGV9X9sPFt61FcTfmjndLXpqHc4CuQ9OHgVHYO/OPW0hIk8VqS6ybHVKdHgl3rrWLF6WQ6MbwZy/VOgRf98W5oq/mq+2vXQpzB1FMo2z2pAeoi0r2xHIJGVS2kAyzSd4crW0hJPZgcoEgFg5siVzSXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fygSyulv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fygSyulv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5335cf904so7037025ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511082; x=1789115882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uIP2PaSZV7t0ZnwDpHDOn//v4Nee7XCb1/Ur7myjFU=;
        b=fygSyulvNaBHIUtirOOwG8by5AHey9NBSY8JVlb16hNpmXwF/pSOuhQEq/qaxDi1Cu
         A/KvzNrdl7s0Go/lG64X/jFL+QLuCWvjYpVA/a41ASQJcil7cYawW8+4bS9Iu/4LmOjt
         Q+0Ph+JlbHqOBcEFm2dTj5Z6P76XHpT9SrFKfhm6Pu6bBIY3RkOXiB9vgujI63cdiWvK
         70zNCf4UmQmHXYOqJQ+VYt+l6T67vpNFCZuUuRG5+dT2ZyyHfrJQ3wm0qV1p5U7hqUKz
         oD0Xw0wHmrkBUWUyFPgv5m7cChuPEZJmzYf9wBFKSbPXBCUbq77W+hA0v4D6n3qg8a5W
         yYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511082; x=1789115882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uIP2PaSZV7t0ZnwDpHDOn//v4Nee7XCb1/Ur7myjFU=;
        b=bSzWVq1afBHzWkUsE7evZmod2M7JXnaQY3TUN5r9Aocls6pQC/SItY5ErHuzzAcgju
         fNm893uAufDm0OlHHfIfD9d9f3pJhhK51DCF+O9P7whAOCQ3E0OBnjUVBRw9SgeRhqHq
         NiqbH1lTUdpSm18/uIGsVTlibdpQTmuj8eBJhfEakT79Ed50n3XUazPm4LokQ3eJhk1Y
         LdWCAyIviJou2jOg1Kj2wPSh9JPqApz9K9RRfNCN4NC5p1jW+v1jhZdbGX/gHYA5hyNJ
         HKDhCnpGCoWuA+jaHnUyB4ezjSXmPRHERpXsg1kwPW5vjTZAz4z+giqFeg1i8fo3nNs3
         uhDw==
X-Forwarded-Encrypted: i=1; AKwUvBxuksRaIGCejr2jwkiZRl5vD9LDh2cG3ynbDTqj1BRDSSFVP1E5CYKj8FX3QUU5BuIg0XapApMbrNMbKwM=@vger.kernel.org
X-Gm-Message-State: AFuF++nOEvxjKSoLy0ojnfSzBQdoAvSRLacIu97JQnmcLKQqNN1VIVz4
	tpE2COVKWw0yAHeUxalcR8HiY7ja/S68JdZX/myR4xbU6FVaFppfY7TP
X-Gm-Gg: AYBFou2WOaYrUds/saqGegawvGdphbZrhddJlf6gAYE3ERvbqj6hLMDIyrQ2EJMxwQZ
	7fR3uEkNIMfgG02VEa4iDP11jx25ZxDhwhlP/B7Y9j7HT4z3kU3kmbK7LrRSDlF3aLjw99ivqti
	1Y6uv2OqQ5sFdCrXyD8SjRPBV7qv//4RWtobHoGqQNs1xoS7k7ayARK6FWvb92wj4kpnMVsfJTC
	IxpHUhL7zzmWygN0am0vZUdjvXkhvAl6D9LztDuyIIHIWTn1geAiEVP4mVKk/8a0YjgcNEPhImK
	8XQ6fRKeoEQsIE1Ybduwg23PSYOKAINgVZSqRG/8KvrvQPBfFE5P4cVKizJp2XU38GhSieTyp1C
	XdNp7d89dzMm+ZPq/cuxLeUqxVOmZzCPXdGBvsOTGL6D4PwdierSCLMkB+M0BvLOQ/UxAeQb9PI
	vksA2LWcuJRGRyjl4/HtzIxV26vi+Rd6Vlj6KqzLmyuvszUjGYkMQZc5/RshM=
X-Received: by 2002:a17:903:46c5:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2db1975804bmr41593555ad.14.1788511082398;
        Fri, 04 Sep 2026 01:38:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0b2sm6716595ad.28.2026.09.04.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:38:02 -0700 (PDT)
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
Subject: [PATCH v2 4/4] phy: core: Add managed phy bulk data helper functions
Date: Fri,  4 Sep 2026 16:37:08 +0800
Message-ID: <20260904083709.425893-5-inochiama@gmail.com>
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

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 198 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  43 +++++++++
 2 files changed, 241 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index f5596b8dfcfc..e28206f8dc89 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1304,6 +1304,204 @@ void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
 }
 EXPORT_SYMBOL_GPL(phy_bulk_put_all);
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	unsigned int num_phys;
+};
+
+static void devm_phy_bulk_release(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put(dev, devres->num_phys, devres->phys);
+}
+
+static int __devm_phy_bulk_get(struct device *dev, unsigned int num_phys,
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
+	ret = __phy_bulk_get(dev, num_phys, phys, optional);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
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
+int devm_phy_bulk_get(struct device *dev, unsigned int num_phys,
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
+int devm_phy_bulk_get_optional(struct device *dev, unsigned int num_phys,
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
+			 unsigned int num_phys, struct phy_bulk_data *phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
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
+	for (unsigned int i = 0; i < num_phys; i++)
+		phy_add_device_link(dev, phys[i].phy);
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres_add(dev, devres);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get);
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
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = phy_bulk_get_all(dev, &devres->phys);
+	if (ret > 0) {
+		*phys = devres->phys;
+		devres->num_phys = ret;
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
+	int ret;
+
+	*phys = NULL;
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
index 13f9f030122f..2af240f4b257 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -327,8 +327,17 @@ int phy_bulk_get_optional(struct device *dev, unsigned int num_phys,
 			  struct phy_bulk_data *phys);
 int of_phy_bulk_get(struct device_node *np, unsigned int num_phys,
 		    struct phy_bulk_data *phys);
+int devm_phy_bulk_get(struct device *dev, unsigned int num_phys,
+		      struct phy_bulk_data *phys);
+int devm_phy_bulk_get_optional(struct device *dev, unsigned int num_phys,
+			       struct phy_bulk_data *phys);
+int devm_of_phy_bulk_get(struct device *dev, struct device_node *np,
+			 unsigned int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
 int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys);
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
 void phy_bulk_put(struct device *dev, unsigned int num_phys,
 		  struct phy_bulk_data *phys);
 void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys);
@@ -549,6 +558,27 @@ static inline int of_phy_bulk_get(struct device_node *np, unsigned int num_phys,
 	return -EOPNOTSUPP;
 }
 
+static inline int devm_phy_bulk_get(struct device *dev, unsigned int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_phy_bulk_get_optional(struct device *dev,
+					     unsigned int num_phys,
+					     struct phy_bulk_data *phys)
+{
+	return phy_bulk_get_optional(dev, num_phys, phys);
+}
+
+static inline int devm_of_phy_bulk_get(struct device *dev,
+				       struct device_node *np,
+				       unsigned int num_phys,
+				       struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int phy_bulk_get_all(struct device *dev,
 				   struct phy_bulk_data **phys)
 {
@@ -567,6 +597,19 @@ static inline int of_phy_bulk_get_all(struct device_node *np,
 	return -EOPNOTSUPP;
 }
 
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
 static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
 				struct phy_bulk_data *phys)
 {
-- 
2.55.0

