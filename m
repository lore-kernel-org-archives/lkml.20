Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01524A261C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200362; cv=none; b=T/Pv+fqkdYG23GUPGfAcx9/GtqCcl+3q4tEakYp+iNNCReY2jh5Zu9b616y2+kQrHNqNy49kYR45s57G+Xn0q/sQeD83tX7161KMX+8LenrEtTdscWzOc3v6DGP14Noaxaw64Ly8UWiIyzPgEcuKONl6QHe8Zn+LWyxwUozE7BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200362; c=relaxed/simple;
	bh=BNErPJFItjdmNqkCy5QarfwFjClYdyv4WlBIvJKkr6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvXv/ppLyKhH2glCibTz1vZkZgJiG8g8jZtsKoJH7XqsD7xeyp0YpaYLzwvF//2LcuADGDdM/BwUa++OpqWAeZhcY/unbUbHoWCt2ezIvKtFXRC54VPu23iGmIXoInGr87HbM0sKuvtS8Fpf3c+XJRuV8scT1FNGdso41QLdwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq+BJ66D; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq+BJ66D"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso1884605e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200359; x=1788805159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwCJrHtvcffMrHWjLqVlY+8cLXvhynbdWqJIBifJ6ts=;
        b=Iq+BJ66DjJOduTrXSzoz52ZtNDPtc1oyFwOaMXkbRJz9xR8qIZbP6PhVICNHcoYNZq
         jVHGvWrGfdZqVsF0qWnWs92eGegZBYmV36s01yS4YRhjFhadbR60ZF0bk24JlJ6ibm85
         K0P0x4Lem78KOb6r+5wlqA65MzL1SYqgEnM9/JsxSnlM8yHW3Ymz7aexfzGH9yTzHgHL
         jlFe8c7ZW4GfPaTpy3jpYGzPkgG8o52pLFl3UEAwAEhQ26r0Ctytnpzn5BvY59Qw8Kym
         Dkfx2S3YMgF/wYnNQ0RHofB1pqYvc1h7DhqZOQjVhmOVWvggCYMUAdd+sqG5CeXpdcNU
         vChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200359; x=1788805159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwCJrHtvcffMrHWjLqVlY+8cLXvhynbdWqJIBifJ6ts=;
        b=jH4rjybEU4QTMhCi/giD+oHNr8T/xMt162cEofNIlQDVVgKm5YknygIJ6YuWKvhk0q
         oQJ2ps/lhQw0mHKnHYdZVD8/xlHr3AhG8W7+k/Vyy7jhdC59mB3IDS0k5QvkjmKVKpIq
         eVwyJ952zgMmEQLD2o9KZEE9x8yqZtLGpOxO4Ta4TwIDlPtHqclT6TNqvth9lZyywhPk
         Vw3Yppf3yTX7o7J7u8dFtvxwtcq3YDa/p9TYgUkKia/Mm80pRljcUUP18D8XjpjRW3es
         oh0FCO4fx+aVlY3iEyxcvsn3lAx79WJZLQ1P5HaJqhvYCOXieqWm+S4jYTHp6kr0n9I7
         j3yA==
X-Forwarded-Encrypted: i=1; AHgh+Ro31+NGlz8Co3n9Hd4lB1UtlW4lW1uUUW28968GXyAqj5UnJXeLufnkoR3Zu8U+9kSE5llKecAiDJsuIzk=@vger.kernel.org
X-Gm-Message-State: AFuF++lZHjb0w1pu7Y6tYSa6TV8Ek7/gCGgDOQcKimV2MVgemrLjh7JC
	I8DACvWMJS+tFPvhzhTjiPaa4oXZclnjPNZAAABaTiiG+2G/eLIdF+DU
X-Gm-Gg: AR+sD13u6LzHflYfQEdpp1o/+gMnISN9pbN59oUwN6Y09brCvINmuiSc03B0ZjW+ce4
	v/4yR5W+NXM9+rvIl8VpsSVj8KchmxcTwlXljiWs9Nh0+eFMaU5V5a2amxWvjrEcEQPdpdoSmLj
	O9tYi2/jc/86iRmOmKF4pc5+syIAsKKr++vfgjs6NZGBDbND09CzIzFuRYUZbG/gnu+Ud9pASKl
	56gI+rtbi8Rb2F9+SReuOca/cdtQrXWKcD9KBJncqngl8RhfSKLsN7bLhqlp4ud/SK60xekpayJ
	SDTYVwktBWOD8LmzAJF6rnGvyuxOIpkNxGMnsYovrSCPjwucz/mIHQyt4dw+VjtQTJ1jmz7mtzd
	usMbw9YxrmeYoB+D+qMV8G1XRYFlfdNtk2t+4tEsInZ3eLD2U/bM0UAObBp1GKe93g4bYwpRuFU
	inQvvwPfzXPewab95SQAjhN1ln7CVbYpcYasS4YOfM0jMZe+0g7Ad3a73uImaUOdstLKwZnpWpn
	EtVP9hocR4/
X-Received: by 2002:a05:600c:6819:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cdd41ca5amr3351055e9.6.1788200358770;
        Mon, 31 Aug 2026 11:19:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:18 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 5/6] media: ipu-bridge: Match sensor configs per IPU and add config flags
Date: Mon, 31 Aug 2026 20:18:57 +0200
Message-ID: <20260831181858.325109-6-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sensors need different treatment depending on which IPU they are
connected to, so the sensor's ACPI HID alone is not always enough to
describe what the bridge has to set up.

Add an optional IPU PCI product ID and a set of flags to struct
ipu_sensor_config, along with an IPU_SENSOR_CONFIG_MATCH_FL() macro to
define such an entry. A config naming a PCI product ID only applies to
that IPU and takes precedence over a generic config for the same sensor,
so that a sensor covered by both is connected once, through the more
specific entry. Existing entries are unchanged and keep matching any IPU.

No flags are defined yet and no entry uses the new macro, so there is no
functional change.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           | 29 +++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index cd3c36d44..38ad3e54e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,6 +8,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -853,6 +854,32 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	return ret;
 }
 
+/*
+ * Whether a sensor config applies to the IPU the bridge sits on. A config
+ * naming a PCI product ID only applies to that IPU, and takes precedence over
+ * a generic config for the same sensor, which is skipped so that the sensor is
+ * not connected twice.
+ */
+static bool ipu_bridge_config_matches(const struct ipu_sensor_config *cfg,
+				      struct ipu_bridge *bridge)
+{
+	unsigned int i;
+
+	if (cfg->pci_id)
+		return cfg->pci_id == bridge->pci_id;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+		const struct ipu_sensor_config *sp =
+			&ipu_supported_sensors[i];
+
+		if (sp->pci_id && sp->pci_id == bridge->pci_id &&
+		    !strcmp(sp->hid, cfg->hid))
+			return false;
+	}
+
+	return true;
+}
+
 static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 {
 	unsigned int i;
@@ -862,6 +889,9 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
+		if (!ipu_bridge_config_matches(cfg, bridge))
+			continue;
+
 		ret = ipu_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
@@ -948,6 +978,7 @@ int ipu_bridge_init(struct device *dev,
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
+	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 61e10cef1..d12e51336 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -17,13 +17,27 @@
 #define IPU_SENSOR_ROTATION_NORMAL		0
 #define IPU_SENSOR_ROTATION_INVERTED		1
 
-#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct ipu_sensor_config) {	\
-		.hid = _HID,			\
-		.nr_link_freqs = _NR,		\
-		.link_freqs = { __VA_ARGS__ }	\
+/* Flags for struct ipu_sensor_config */
+#define IPU_BR_FL_NONE				0
+
+/*
+ * Sensor config specific to a single IPU, identified by its PCI product ID,
+ * with flags describing what the sensor needs on that IPU. Where both a
+ * specific and a generic (IPU_SENSOR_CONFIG) entry exist for the same HID,
+ * the specific one takes precedence.
+ */
+#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _ID, _FLAGS, _NR, ...)	\
+	(const struct ipu_sensor_config) {			\
+		.hid = _HID,					\
+		.pci_id = _ID,					\
+		.flags = IPU_BR_FL_##_FLAGS,			\
+		.nr_link_freqs = _NR,				\
+		.link_freqs = { __VA_ARGS__ }			\
 	}
 
+#define IPU_SENSOR_CONFIG(_HID, _NR, ...)			\
+	IPU_SENSOR_CONFIG_MATCH_FL(_HID, 0, NONE, _NR, __VA_ARGS__)
+
 #define NODE_SENSOR(_HID, _PROPS)		\
 	(const struct software_node) {		\
 		.name = _HID,			\
@@ -132,6 +146,9 @@ struct ipu_node_names {
 
 struct ipu_sensor_config {
 	const char *hid;
+	/* IPU PCI product ID this config is specific to, 0 for any */
+	const u16 pci_id;
+	const u32 flags;
 	const u8 nr_link_freqs;
 	const u64 link_freqs[MAX_NUM_LINK_FREQS];
 };
@@ -177,6 +194,8 @@ typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
 
 struct ipu_bridge {
 	struct device *dev;
+	/* PCI product ID of the IPU, 0 if it is not a PCI device */
+	u16 pci_id;
 	ipu_parse_sensor_fwnode_t parse_sensor_fwnode;
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
-- 
2.43.0

