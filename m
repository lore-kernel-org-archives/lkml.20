Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831425;
	b=GfE93XHllSGYN8lmVVqHvzWyhuiXkRXVwZNOgbgW1E0LsJ0uWn4yMe997yBnSjuhuVfB
	 jtAxl1XmqpHRuOcC8PDyfhUNITeF7ws6ddu//MEis1L0dQtjp6Scl9UBgfesutTmBOOBi
	 Zuf9EjfDhF6fnqYw0XSYxtBbdkZ/6Q3rxEBQ34sD//5gIkPM/kgELczpgwA7zaxZs0UsA
	 K7nH5AWnwX9XATRT2NYyM6xpQcKqYiUT02mtoozc+bndBpRIojCi20giI5cVtxv3mxj1L
	 pOvS3Qo6L9L9Dh60myx8Co7sWnwi4kG3f9AsKNAQ65y/SHmTLY6xmPfFEX3WDZJ55EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
	b=yxgZVG4SXzz/V3DmqAUUSvJEdUAVhYU9iIYT9sKaVlMZWcOUin0sZT6uZgUFESa4Ndm7
	 a5P7L0JDLNns+imZk3AJk+6XAwfK6W5JTpg4xnBq+hH5PhXOVLGuyHhcdTHt5kRWzSTa7
	 hrPrKYEDjJLEMuRlOOPVJTwiKkNANtI0qubAcEXgZwSedLy4qlQVKo1AAM5Ba9h7lWLBm
	 xS8nMMbnZPwvVslS6MlzdrgYk+m+9s5bWy9oz/rCt9PHNfleSGuS6TDWZBWN8dVUD2sn2
	 RdbcPKhTWVoq722bxSooZQaIns01kf9Ss5mMxe6zR2W6LREjkk7wLmnlvSQNOqFt/xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi9wuX2f;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7658606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7658606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi9wuX2f
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1656519a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831424; x=1795436224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
        b=Gi9wuX2fF5XwStp1EEpTiA8z/nNuedR84VpH5zKMeblv5cuMSDG86Y6k6z5I7OyfBr
         MBQtdPDdZIdKBfQ7/e1xrqgfvww5SwWBIiMoLYJvTwZkIkgaHMl5RtXjVvCS+asv4EyR
         nJeSzRBVehcZdpUAip3rJYfu0ClUnxmst5FCR7bQ6NVGgt7BvSk7T9IPFxfOWH0SZRb2
         WhIcR/GXXc+fr+DAt0pq9w1XWcFBiyp5S0le+hNEB7Uo61QmlgCYx3MoYNHusUBDdul4
         1gcnJHQBdt5NW/cvtd6lw0xnAlw2rjtOhJqbLVasXDHgU6RPRhVscDyR0s7ykJRh/OxZ
         M7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831424; x=1795436224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
        b=1evddND+ROel3ygQYQChF4s29Wak+SVq0fvr8uypkySNCjWqwhO4wMX8SkaNrwGYfO
         3kj6RuoaUu4OlIbi6tT3F07GXADAHBNY9/Ibm309EjaieLER/euQT367mPH6VkJs/d7r
         +bghCOnN20XWnjKBctsU4KFlLsYIOyAmi4IHpmdbVPD519PdAHsXVjXNO9Anz0V/65Me
         jK1JtDBDT+XiMfEqDdqD+C0SEcrDBlt7WXzKsiugk3bNTj2FaVZB8sf2b8+mPgcGYe0Q
         naF2IqjcinFmHWeA4fXRkUPOgbNXz4oPZl7ny40NBxkUyC/P1l2x7/5DFrGLjN+IynlV
         JbZA==
X-Forwarded-Encrypted: i=1; AL+hErFzApbpcpuG7TIrGjmKTOlcdJ7ffp3G6pB75/GLBdnDnhNwe6wQigEFjv4FQx4kN3LQrXwvp6j3OJpl1uY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5asaLxTiAzNmwsHRMKRvG9orR1pgnwZ+5kCLyjuVY7wxhBHDu
	2J+5qMA97aw6a2hkb36GyJh8QFBLVkaZhFe0LhfA/MLuST/g4AgY8biI
X-Gm-Gg: AZFdTZdhvnTBh+wCgWF/nRXLhey20bv8l5j5xVGLgviInw9sTnuGo8BHymp3txIXa1x
	xEgyMs3VdXzT4cDZJHffJwS3Uk3NrUU6fQUMwzVHQe/LhmeZF20BQwmL9U0GpuHxVsQEo9qvvUR
	9sA+Jf9D5Tg3gKCDlG5VrXGOXHGLqKwfyDtNg/+su5Tbbg8e12jYonEF/ZmCgBV9yx6BfSARcJl
	oSnt1Y2bC0nDBNY8XT/LPnt0v+YIlrF39jVdOL5pxTnde8Qi6kuxgB6KpkgarvRFQ0k+9yf6nWz
	ZIuySarZ58R12lFzCBNIhgc80WBSIeGgyaDYfWSyHdpwMVhpZ0zeFQPmeUCMu4OuhXPUm5f9piJ
	lB//g5/XBfUhtNh+xfNOIKP+hW40z74zMZ34hPMHBlHCMzCeI2mobQ09p04TbY6SoVhvX7hCUE7
	NxPe7Ioy2ORQABYbsZKTvmIsJw2Uk2JDl6BPHZ7sBrKbl4h0VGeoilFGKqMixxNIQth2/yf5piF
	tt4fPOhH/xDSEjdIxHf0ta5Ksyjs/HVNHkVohwn3v44SV2Gc5Gybpo07WKWq1uX489GemRykoaL
	q3VLeg4lGsX9k5b8D7IiGO8HqRnPguL4J1f2N7oqPbpg2iH0+5ztcQ==
X-Received: by 2002:a17:90b:1f86:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b1b0b5c1f6mr6657895a91.7.1794831423633;
        Mon, 16 Nov 2026 04:17:03 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm17110607a91.1.2026.11.16.04.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:17:02 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5] net: dsa: motorcomm: Add devlink info and resources
Date: Mon, 16 Nov 2026 20:16:20 +0800
Message-ID: <20261116121627.1182631-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the ASIC model via devlink info (ASIC_ID), and register devlink
resources for ACLs and meters.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v5:
 - minor stylistic fixes
v4: https://lore.kernel.org/r/20261112002031.1475005-1-mmyangfl@gmail.com
 - remove FDB-related changes
v3: https://lore.kernel.org/r/20261109163117.1792478-1-mmyangfl@gmail.com
 - remove the buggy sub-resources
v2: https://lore.kernel.org/r/20261108094512.1285796-1-mmyangfl@gmail.com
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261106184811.350700-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/Makefile  |   1 +
 drivers/net/dsa/motorcomm/chip.c    |   8 +++
 drivers/net/dsa/motorcomm/devlink.c | 108 ++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/devlink.h |  18 +++++
 4 files changed, 135 insertions(+)
 create mode 100644 drivers/net/dsa/motorcomm/devlink.c
 create mode 100644 drivers/net/dsa/motorcomm/devlink.h

diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
index 9eaa59f699e8..0b31d815ce43 100644
--- a/drivers/net/dsa/motorcomm/Makefile
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 yt921x-objs := chip.o
 yt921x-$(CONFIG_NET_DSA_YT921X_LEDS) += leds.o
+yt921x-objs += devlink.o
 yt921x-objs += mdio_bus.o
 yt921x-objs += mib.o
 yt921x-objs += pcs-921x.o
diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a1d0ce35f4f3..855637d0548d 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -26,6 +26,7 @@
 #include <net/ieee8021q.h>
 
 #include "chip.h"
+#include "devlink.h"
 #include "leds.h"
 #include "mdio_bus.h"
 #include "mib.h"
@@ -2141,6 +2142,8 @@ static void yt921x_dsa_teardown(struct dsa_switch *ds)
 
 	yt921x_leds_remove(priv);
 #endif
+
+	dsa_devlink_resources_unregister(ds);
 }
 
 static int yt921x_chip_detect(struct yt921x_priv *priv)
@@ -2475,6 +2478,10 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	if (res)
 		return res;
 
+	res = yt921x_devlink_setup(priv);
+	if (res)
+		return res;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	res = yt921x_leds_setup(priv);
 	if (res)
@@ -2563,6 +2570,7 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	.port_add_dscp_prio	= yt921x_dsa_port_add_dscp_prio,
 #endif
 	/* chip */
+	.devlink_info_get	= yt921x_dsa_devlink_info_get,
 	.teardown		= yt921x_dsa_teardown,
 	.setup			= yt921x_dsa_setup,
 };
diff --git a/drivers/net/dsa/motorcomm/devlink.c b/drivers/net/dsa/motorcomm/devlink.c
new file mode 100644
index 000000000000..7b4f3a460f1b
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#include "chip.h"
+#include "devlink.h"
+#include "tc.h"
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	int res;
+
+	res = devlink_info_version_fixed_put(req,
+					     DEVLINK_INFO_VERSION_GENERIC_ASIC_ID,
+					     priv->info->name);
+	if (res)
+		return res;
+
+	return 0;
+}
+
+static u64 yt921x_devlink_occ_get_acl(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	unsigned int count = 0;
+
+	mutex_lock(&priv->reg_lock);
+	for (unsigned int i = 0; i < YT921X_ACL_BLK_NUM; i++)
+		count += hweight8(priv->acl_masks[i]);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+static u64 yt921x_devlink_occ_get_meter(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	u64 count;
+
+	mutex_lock(&priv->reg_lock);
+	count = bitmap_weight(priv->meters_map, YT921X_METER_NUM);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+enum yt921x_devlink_resource_id {
+	YT921X_DEVLINK_RESOURCE_ID_NONE,  /* DEVLINK_RESOURCE_ID_PARENT_TOP */
+	YT921X_DEVLINK_RESOURCE_ID_ACL,
+	YT921X_DEVLINK_RESOURCE_ID_METER,
+};
+
+struct yt921x_devlink_resource {
+	const char *name;
+	devlink_resource_occ_get_t *occ_get;
+	unsigned short size;
+	unsigned char id;
+	unsigned char parent_id;
+};
+
+static const struct yt921x_devlink_resource yt921x_devlink_resources[] = {
+	{
+		"ACL", yt921x_devlink_occ_get_acl,
+		YT921X_ACL_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_ACL,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+	{
+		"meters", yt921x_devlink_occ_get_meter,
+		YT921X_METER_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_METER,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+};
+
+int yt921x_devlink_setup(struct yt921x_priv *priv)
+{
+	struct dsa_switch *ds = &priv->ds;
+	int res;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(yt921x_devlink_resources);
+	     i++) {
+		struct devlink_resource_size_params size_params;
+		const struct yt921x_devlink_resource *r;
+
+		r = &yt921x_devlink_resources[i];
+
+		devlink_resource_size_params_init(&size_params, r->size,
+						  r->size, 1,
+						  DEVLINK_RESOURCE_UNIT_ENTRY);
+
+		res = dsa_devlink_resource_register(ds, r->name, r->size, r->id,
+						    r->parent_id, &size_params);
+		if (res) {
+			dsa_devlink_resources_unregister(ds);
+			return res;
+		}
+
+		dsa_devlink_resource_occ_get_register(ds, r->id, r->occ_get,
+						      priv);
+	}
+
+	return 0;
+}
diff --git a/drivers/net/dsa/motorcomm/devlink.h b/drivers/net/dsa/motorcomm/devlink.h
new file mode 100644
index 000000000000..184b9f05742e
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _YT_DEVLINK_H
+#define _YT_DEVLINK_H
+
+#include <net/dsa.h>
+
+struct yt921x_priv;
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack);
+int yt921x_devlink_setup(struct yt921x_priv *priv);
+
+#endif
-- 
2.53.0

