Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1B499F10
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637193; cv=none; b=lVy1t4V8RFOW6XzfMCxI4a2hLby3JWAGCIYb58F5KNIK0IwC6bXns/OfaVTFtQU5SHAOSpYypgoX2DSpdWgPE2IblYJ2+4Cl/JIAmEwJDEVZWwNiLaOmyAj8YeJqg3Bw4wqFpSBLnc1eGXp/Prws0svDffor4nO5VasQUFdJhuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637193; c=relaxed/simple;
	bh=iWtp0bU3baxoYOTSg/IkcbQe3adieH8SnUVJd77lY9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYfDWsdapxuQA3XoP4s2pj2o2xP0ksqHaf2h8ER3KS1TpRu24NquFC/AFdG55GQjiDiHYacZnvlH/u2RewvNlao7PmSJxE0dd50q4YXoWQdnSftfNMZ15hl1ZyAjHb/t4GMDlwLKwXet+xiEPhzXSYkh08h3+BVG+iJH4cmhV/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE4VNN3O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE4VNN3O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so4923965e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637190; x=1792241990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VE+jsDK1v8B72hEyc9prFHleUxao/0E9sayP9mXiB0=;
        b=OE4VNN3OuazSSXdc8V7lSxJnoCKoYDyUopI6tyDgvcdjQ7z44/MDDv80eoK0I3KKCu
         oU3wEAVjgfnWrCg8eHy+znRUonJORIBNYyt+2BW56Ghn7uIVQiVMC8xmcUSc22gATRUz
         ZRXK+D9lNMayrh8/Ll1VQ2oMsxni5JheNiW8wZEtBzN0/Snuh4scavv7DdSK48vF6hPQ
         cMVFp18Hz2NBDMeY5C+sCVb+w7WQmFML84iY34b8ho+2MJl2ADM3g9vRdeCHGqPWvM9N
         zqnL0rMKqdG+TxfbAg8ls1zmXgNknd/edFchIWFVKu7o7HO702b6r0gZsFC0DG5PT+dZ
         QvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637190; x=1792241990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VE+jsDK1v8B72hEyc9prFHleUxao/0E9sayP9mXiB0=;
        b=02liYyMBgSWq1NRBgP6hyyFaqrD0v2TML638969kpb3UvU4ee/bhtT+COOpvP4MmmV
         kd3VzQ0no/V0TFp84pEKl/uFZ4fmhAiw0kBUrnswbhCXFYY4bM4mq/+R3OM0Nqc6Pp6/
         uS6SCVOR5ALpCt/ikhbw1WgR1UubgavHtQeHflN6kjS3ijJ8cxychDY/kiujQaAl4WcJ
         9hYONf8Wqtqx2M6JeIp2dZghf+ZVDA/Yydq0fsIidnX4osF8hndAm0eKZN/UyiBmi1Ud
         O+EShjpIQH5ueTdIrZ6OHkgxetFFclmbAkoSa0tRhsLGIujjKpemlNrRjVZQttJVa5SE
         EfxQ==
X-Gm-Message-State: AFq9FYIj6ihuW/3+OZM4WUrVadHChMR/2uHiHuzelQCdQSBqdHN1nhkK
	jADsaGq/fEcKdxZhwnDtjI4ZybyZnFbYsXCxRIaEsaj8YSVcDoSCqVe7
X-Gm-Gg: AYBFou1yDQCs/zW+taOmSzVEg59QlVyntXyQhpP5P9DypH0SPUcyvaZ4PjiPy+1fIzD
	DFnhkz6E4M1oVKfUmGpVAMmMTmCQx+z0m4Oqc0rvOnbj6/cO4IUr6CmGorvAAK4Cr4WWwWAyM2X
	rKv69mM1J9tAxQ3hrwst39GADQ0dLdYV26Ls7busGMAQkrASmdwxQjdv8GYt4R3LLfD06PeLxtE
	/rEMvb9JvphRSEXnDJ4IlOpqi+ywWokR4eeX3ATqkB+aMYDQZ3bNg7vSHUZQX/Yqh7R/TdT5kbB
	DGQJ6wK2O3KscYTC7y+QQEIGQwDRgR0U3U5YKK3gt41fIHXfVYEO4rPi76FZtbm23FwuUcWuxkK
	Zh+6+ukkn+AQR6V0D9e66gftdeJXv33jZP3i4PlzebUOFctOXHXBLLJ96NsEf0+/vhktXDLjQzl
	a3tOCiT1UwAukjdroJyP/H4IBJ83lrE37vG0j7WWLMr7K7rx6nvWv6GjtHgHlt9psDsu692GwtD
	dFNqSCmjyYu6CK2WmpGrVHOg1XutTrymRKS/tlifWL1zysR4QBNgEJiqoZOkvIyfimBbdiHGeKy
	wTDlw5ZDlaCHMfTEdv2bD5MaSltuO/9822BAdSucqor2pKhBxVZB2Qjcywdjuw==
X-Received: by 2002:a05:600c:198c:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a18e4cdbfbmr89202715e9.29.1791637190258;
        Sat, 10 Oct 2026 05:59:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a198b0cfe3sm5301345e9.3.2026.10.10.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:59:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: srini@kernel.org,
	mathieu.dubois-briand@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	rafal@milecki.pl,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH] nvmem: layouts: fixed-layout: Apply mac-base consumer offsets
Date: Sat, 10 Oct 2026 13:59:47 +0100
Message-ID: <20261010125947.176459-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixed-cell binding describes mac-base cells whose consumer argument
is an offset from a stored base address. The fixed-layout driver currently
registers these as ordinary cells, so all consumers receive the unchanged
base address. On the ZTE ZXHN H3600 this gives LAN and WAN the same MAC.

Allow the DT cell parser to call a layout-specific fixup and use it to
attach a read postprocessor for mac-base cells. Support the binding's
six-byte binary and 17-byte colon-separated ASCII formats. Keep the raw
read length while returning a six-byte address, and reject unsupported
sizes and bit-field MAC cells. Legacy cells retain their existing path.

This follows the mac-base support introduced in OpenWrt by Rafal Milecki,
but keeps the postprocessor in the fixed-layout driver introduced in
mainline since then. The ASCII parser receives a terminated local copy.

Link: https://git.openwrt.org/61f674df4f0ce2b1c53b0b7f6b0c1d03d99838c0
Cc: Rafal Milecki <rafal@milecki.pl>
Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/nvmem/core.c                 | 14 +++++++--
 drivers/nvmem/internals.h            |  3 +-
 drivers/nvmem/layouts/Kconfig        |  1 +
 drivers/nvmem/layouts/fixed-layout.c | 45 +++++++++++++++++++++++++++-
 include/linux/nvmem-provider.h       |  3 +-
 5 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d14017..5de82ccdb1 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -789,7 +789,8 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 	return 0;
 }
 
-int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np,
+			    int (*fixup)(struct nvmem_cell_info *info))
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
@@ -827,6 +828,15 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
+		if (fixup) {
+			ret = fixup(&info);
+			if (ret) {
+				kfree(info.name);
+				of_node_put(info.np);
+				return ret;
+			}
+		}
+
 		ret = nvmem_add_one_cell(nvmem, &info);
 		kfree(info.name);
 		if (ret) {
@@ -841,7 +851,7 @@ EXPORT_SYMBOL_GPL(nvmem_add_cells_from_dt);
 
 static int nvmem_add_cells_from_legacy_of(struct nvmem_device *nvmem)
 {
-	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
+	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node, NULL);
 }
 
 int nvmem_layout_register(struct nvmem_layout *layout)
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa..060d41363e 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -39,7 +39,8 @@ struct nvmem_device {
 	bool			sysfs_cells_populated;
 };
 
-int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);
+int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np,
+			    int (*fixup)(struct nvmem_cell_info *info));
 
 #if IS_ENABLED(CONFIG_OF)
 int nvmem_layout_bus_register(void);
diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
index 5e586dfebe..66fc5d9e1f 100644
--- a/drivers/nvmem/layouts/Kconfig
+++ b/drivers/nvmem/layouts/Kconfig
@@ -3,6 +3,7 @@
 config NVMEM_LAYOUTS
 	bool
 	depends on OF
+	select GENERIC_NET_UTILS
 
 if NVMEM_LAYOUTS
 
diff --git a/drivers/nvmem/layouts/fixed-layout.c b/drivers/nvmem/layouts/fixed-layout.c
index 635d448b3d..33961f23aa 100644
--- a/drivers/nvmem/layouts/fixed-layout.c
+++ b/drivers/nvmem/layouts/fixed-layout.c
@@ -5,11 +5,54 @@
  * Authors: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
  */
 
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
 
 #include "../internals.h"
 
+/* Return the base address plus the offset supplied by the consumer. */
+static int fixed_layout_read_mac_base(void *priv, const char *id, int index,
+				      unsigned int offset, void *buf, size_t bytes)
+{
+	u8 mac[ETH_ALEN];
+	char ascii[3 * ETH_ALEN];
+
+	if (bytes == ETH_ALEN) {
+		ether_addr_copy(mac, buf);
+	} else if (bytes == sizeof(ascii) - 1) {
+		memcpy(ascii, buf, bytes);
+		ascii[bytes] = '\0';
+		if (!mac_pton(ascii, mac))
+			return -EINVAL;
+	} else {
+		return -EINVAL;
+	}
+
+	eth_addr_add(mac, index);
+	ether_addr_copy(buf, mac);
+
+	return 0;
+}
+
+static int fixed_layout_fixup_cell(struct nvmem_cell_info *info)
+{
+	if (!of_device_is_compatible(info->np, "mac-base"))
+		return 0;
+
+	/* The binding permits binary or colon-separated ASCII MAC addresses. */
+	if ((info->bytes != ETH_ALEN && info->bytes != 3 * ETH_ALEN - 1) ||
+	    info->nbits)
+		return -EINVAL;
+
+	info->raw_len = info->bytes;
+	info->bytes = ETH_ALEN;
+	info->read_post_process = fixed_layout_read_mac_base;
+
+	return 0;
+}
+
 static int fixed_layout_add_cells(struct nvmem_layout *layout)
 {
 	struct device_node *np;
@@ -19,7 +62,7 @@ static int fixed_layout_add_cells(struct nvmem_layout *layout)
 	if (!np)
 		return -ENOENT;
 
-	ret = nvmem_add_cells_from_dt(layout->nvmem, np);
+	ret = nvmem_add_cells_from_dt(layout->nvmem, np, fixed_layout_fixup_cell);
 	of_node_put(np);
 
 	return ret;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b77..1e31101201 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -215,7 +215,8 @@ static inline int nvmem_layout_register(struct nvmem_layout *layout)
 static inline void nvmem_layout_unregister(struct nvmem_layout *layout) {}
 
 static inline int nvmem_add_cells_from_dt(struct nvmem_device *nvmem,
-					  struct device_node *np)
+					  struct device_node *np,
+					  int (*fixup)(struct nvmem_cell_info *info))
 {
 	return -EOPNOTSUPP;
 }
-- 
2.55.0

