Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0D3803F7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130857; cv=none; b=eZ3QTBglyxS2z5G9bIk9PAPSHv7ZuQQIvlv/JXqiHcK+KTaVwzooDd7rpw3EYaZtcYuSyZrX8BHEIzQX5xjNd8lyh3sIKu0avG5U7sr65YcjHMQZLNDyWYFq3w0CXZzO55+hIbi0xNb1aLWkozoXGbRh/F79pqj7ZuXnhBHOItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130857; c=relaxed/simple;
	bh=OZgQEFvU5+/DbzdlPy5+1h2N0KFyrBwZO9/fwi7cA5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHMKX6RUXwb0KHI8KJMzrTSjUhsp5j3GiRueFsijGOBhRZicAxTsWGYFNhXF4m34yuRR22hJVoumLl4Olj/7RPn9uR++pIt66iVfM3rW9TvDL5LvehFj6QsUXVV6AkFNa9+zfeLW+uzado68pFNCfIjGs4kP7/l8i9yIouGGQM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LejNsAu0; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LejNsAu0"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso368352a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130851; x=1790735651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVt+Q6vf6BkSb3Obq200XC2a8MA/3pBxsRhoBaJSQWk=;
        b=LejNsAu0bHcxGBmFXiVqpZiaaycgMkbO9xa9ig1duD0g9GLD/yK6MHhbHezrzxncx6
         cyxmcM4pxPT0c42xQIxdKNbTaQ52YOP1bCE/ERu3M390e7Hbhxhcin9YhufNj62DG/kw
         OYdnkWNtVJqdXoQITX1l8pk0OJf9HzN35QMB0xijbRJ+noUrJ4UWZdKs+QrG7SvJNcfe
         NOzGNh2hOUnZy3DfDKEMA9wccqJYnHsZTUpyoQbeyHk9VHcZ3SFsac9176dtn8HHwinC
         LBNcdhNtzcVa4ZMhBuEUYD9t2L9KpVSLVZ7J1L6mRWyIR4s1uM+GhlXZaYA6ViAdrEk/
         4v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130851; x=1790735651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVt+Q6vf6BkSb3Obq200XC2a8MA/3pBxsRhoBaJSQWk=;
        b=06nP/W1Anx6Pz1d/dlWixDd8o0+sOE8hQtvrw6lN3y9it97U6s/jBZztg8p4a2PA4W
         H6yL+60tN2Y2X5+/Q1PaDJMg20UCRIpCJK5YkV0aJYI5JWwyZbcDRjk0qJs7F1mAerhd
         s/LwQRI0iUaQ8cTpixzaoNo7K+TltcS6PmVGdsxrrpfhLyW4ohdGUL+dVktl1RW/Z37D
         g2fT7WPZwxzdvmV8N7sO0msDJlhFVEfBBmRkEbIL7yIcZeDnAboUQtfX3UxOWfOqeD/z
         10BtxRWDxc/5RqkQSEEgMRC1+U+gFunAaAkx6Eu7KWiPst2jX3T0EiwtnRnuTw5inrup
         w7ng==
X-Forwarded-Encrypted: i=1; AKwUvBzefFfsgtNMTv+S3v+X8/qKsQaCTNg1FLf0MXI6/s/gDnvuEOX99culs660pXHGj112ENVFs9AEDercm58=@vger.kernel.org
X-Gm-Message-State: AFuF++k66ezUBMS5qb3fGO5GJw1UqEoOKj4vDS42nlylC3oq3mK4mqhI
	fOUr4UQyZ0Q+Rvni+2R6mVhMuW06lvfNm7g/rxDpVQuRqwQQ9yx/iOII
X-Gm-Gg: AYBFou2+0UZFbKtkhNqaI8RkJQoyCjh5/DvbcL1Jx2VWJzsN5+f/nOq+j5kJKOkS8+w
	RTFQk90xGSmgQSgOD+bfhHe6KOUwd+BaGGmjgoA6QgsEK7xWmLaGS8SX295cnDWJgjCSTqFKYfD
	q6iGI9zt/uVIbIOSeMBmbkKKhSrMDNlvUVxLYejwymNi5L4oxoqYcBxTSSFbM4Dl6c1ajnZ5E5F
	CtMQRml0ieyT0MfsAWiTASSoDmg8eNxQpnAUnYdncmIEuCqgccMMYgJ1RC9wumD3wrUIvbMUzri
	W9eZ5UXRqN+LAAWQvuPiG2pXagUDgpzWt53r6hDgZdC8gRRS9kVa3etcfcpQGbSCivGFnGCfymm
	ucIRc5j1LizZru5Zala69zn7BikfdFg9PoS9YItY71U1d7iajErUSz/UYNeXXmUA2zqBTM+5Yrw
	ZHLs23ddm6gVoa6/uGf37p6FsJTt34k7UpxDUnlfzNf2teEfbV/1Ifanb3OKmXXKZRApgXn8nPf
	KfFnbs=
X-Received: by 2002:a17:90a:d005:b0:39e:4d7b:b247 with SMTP id 98e67ed59e1d1-3a07e53be0dmr1115661a91.19.1790130850809;
        Tue, 22 Sep 2026 19:34:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbf69f0sm2075572a91.8.2026.09.22.19.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v3 3/5] phy: core: Add phy bulk data helper functions
Date: Wed, 23 Sep 2026 10:33:01 +0800
Message-ID: <20260923023304.78428-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923023304.78428-1-inochiama@gmail.com>
References: <20260923023304.78428-1-inochiama@gmail.com>
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

