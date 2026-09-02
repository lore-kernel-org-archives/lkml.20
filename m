Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72249CF48
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354500; cv=none; b=VkpnQVA3gwWRvGBmYWi2Stf93aBJSQGpIqnakVBts0ARmMhxesAkom+/PK5w3OgTSQrmoBb3cg2gMgcODzmqUc+VWc09cmpHgjUQkk5uculdyEC/AmPkTE50cG54IDfH1OJ4DWj9vTylQjhCisi7DKLVl2RXkRB5V4wK/Ht259U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354500; c=relaxed/simple;
	bh=k/jn5XrqJoguASStGfL3pZWOMkauDZVjoO+fk0jB14g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlxCj6LDnqyHFkZrf6P+W9+VmCLmliJIsk0/y6kVgTFkYLZR55N/rv0tL7pmwmGDZr/2K2L0xGJDxcjLGjhZU065095TKscVqrQ7Mi3nn0XHtJLXQnL+zKbBANDqWdvkzANdH52olcq2w9u13rut3A+wvfkG/WQewX4Qh9+wL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=IosNi0cx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="IosNi0cx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482dbe4d247so445517f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354497; x=1788959297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7i8U/ATxkqsV19D/fOiSUDBdGRoqkMbRkOr4LDxWI=;
        b=IosNi0cx534Ak2Mui5hDKU0TucRIpo1NgqscCfqbh6iUBFuRf5LG5UIyrwrKfQCteo
         z8D1URknMVtKiSRUhWG+VDsKTvj2A5DqaHCdWlioTxKri7dnPh6e0GaA8KxZSSJQAhvW
         +OnAScBVXe5zQn7HtjbDM7Di7DVfVZChc2Z368BEROSfzA5EBVQNdCidTnM4uGQHSoTc
         2oqyxHf7HINZN3xhvCBeBAGPBLqQFoNaHlwZ80unPc7Dsff+iQntvb9bwiZXsq+TAZTz
         TMtdm38Rzs4kEecCZsa8Fe55V+Ac6SrtxzI3LcLO2noGM3G/vu6X3Z/WM6oHSlVSu8ki
         tjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354497; x=1788959297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7i8U/ATxkqsV19D/fOiSUDBdGRoqkMbRkOr4LDxWI=;
        b=WCuKU2fy7FKXiPWIgipxO1I/sYqIeUCKdz3Az/lv5BXhsBKOFpCw2x4u9J1hkvFYem
         DGlnX1Btwh24L3po5WhOkCbChqOoWCYuNhSQ+BwffIuD7ZRAw345tXEQP6HRQX+5TOLg
         XoyuF6jl211gokFgYADICSr8wEQhD/5E238MbJRfLR8XGxfQWYfDB08P1p0wztFyOWJO
         atTfIY29j7xY2yMtpZEjY5L4L8PvillhCCe8ecfAK5/CUgUv5wOSkZ/E0HV6jYaPvrYi
         ANsvTgH2J0XvS9/SB4rbSinXgD9mn9KpKAfAHaLfCHi6quTOxbtes0C6wEB0Lkz91/xL
         4xSg==
X-Forwarded-Encrypted: i=1; AKwUvBzhi/Qu/v/O7VrGc3CLbx2TWbitws10PfJaZHGbqDV2XzbFsfRUFLZjR0aEdyn93gBY6F4fscVmQJT4Oco=@vger.kernel.org
X-Gm-Message-State: AFuF++nH0237+yUcicBQlZGCic+CvLodCen4NvbF6fMZpS+iM2KHCd4R
	VuqutkK6FQem2kiXpgQy1AdSBH/RrV6eAwmkimlQwYucbQoYugWM7F6zznbd1Zzr/1w=
X-Gm-Gg: AYBFou3/WHFXQnHG3GED33l+K4BtS9hquhStJKoanWM1MOg3wtbXrIurZB+l1OiQyCk
	fqBoakHeUkNsym2PnESlpK6mzzPTZDPFoQ7JAnFzPxp4UyiId7iETqwrEACGKg1zLejBVsNcoR1
	yY6/XUgRJWNnP1ig9XBIW1jY4sXbzne7oj1soOMxcDjAn4ZLMDvfT0mOkUfa/F5wa59SXEKdLIX
	1BmzCT0VhmY+RLRXk8CevFeuR76gB4SHNCB9wlfDsBobSIbqbVyi594q9wPJnReaxKrGGw9Qcvp
	ExVpE1mJyVdg6w9C+48AConM/YcIQKBxH5h2fpZp7dzqpJ+wd9gCBreATtRjctnmnDoqETEOzF1
	ti12kaIzmyZQTlsg5uUsOZog0AeGC66bb/TR/bN4tAs82kV8QtE2eR671neRRlbVJjnMq964iZb
	2LkxE96TF3D/HMuw+lzBZc1QB7ex1cGIQpL2G1n1WwXqOqyFVq2IJroODdUjgWBdZ+QSzkdS+Ni
	LJZ/zQV+Lk57wj4jX81rJV7Joe8QRgxxjGFWEjb8g==
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr9455000f8f.19.1788354496630;
        Wed, 02 Sep 2026 06:08:16 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:54 +0400
Subject: [PATCH v2 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6627; i=alchark@flipper.net;
 h=from:subject:message-id; bh=k/jn5XrqJoguASStGfL3pZWOMkauDZVjoO+fk0jB14g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN/8sWiqYlX7jJmH7nT4e3brq3wwePmr7anCydLqP
 /wyV9p6OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhq1VyGX0yeHJcebT3JbLu6IsNvjsrnOV83vHY4XReoHrj5q+iRUz8YGa6XBd7
 8sviF8aWphy/ISb6zXftL997Uhvfbr/Jr3a69vocRAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs customarily use the CPU ID programmed into their on-chip OTP
memory to derive stable Ethernet MAC addresses even when a board doesn't
otherwise have dedicated storage for those. The derivation depends on the
particular bootloader implementation (e.g. it is done by upstream U-Boot,
which patches the derived MAC addresses at runtime into the device tree it
hands to the kernel). Using less featureful bootloaders, such as direct
boot to Linux from SPL, leaves the kernel with only a random MAC address
instead, even though everything required for the derivation is equally
available to Linux as it is to U-Boot.

Reproduce the same derivation in the kernel and expose the result as an
nvmem cell named "mac-address", so that of_get_mac_address() picks it up
through its standard nvmem fallback. The address index comes from the DT
phandle argument, which lets both interfaces of a dual Ethernet board
share a single cell.

Enable the layout by default on Rockchip, as consumers of its cells would
otherwise defer their probe indefinitely.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                |   1 +
 drivers/nvmem/layouts/Kconfig              |  13 ++++
 drivers/nvmem/layouts/Makefile             |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c | 119 +++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3d07ce7b3c8..73e0531445be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23727,6 +23727,7 @@ M:	Alexey Charkov <alchark@flipper.net>
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
+F:	drivers/nvmem/layouts/rockchip-otp-cpuid.c
 
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
index 5e586dfebe47..6e2511ac6f7e 100644
--- a/drivers/nvmem/layouts/Kconfig
+++ b/drivers/nvmem/layouts/Kconfig
@@ -26,6 +26,19 @@ config NVMEM_LAYOUT_ONIE_TLV
 
 	  If unsure, say N.
 
+config NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID
+	tristate "Rockchip OTP CPU ID layout support"
+	default ARCH_ROCKCHIP
+	select CRYPTO_LIB_SHA256
+	help
+	  Say Y here if you want to expose the MAC addresses that Rockchip
+	  bootloaders derive from the CPU ID programmed into the OTP memory of
+	  Rockchip SoCs. Boards which have no other source of MAC addresses
+	  need this to get stable ones when the bootloader does not patch them
+	  into the device tree.
+
+	  If unsure, say N.
+
 config NVMEM_LAYOUT_U_BOOT_ENV
 	tristate "U-Boot environment variables layout"
 	select CRC32
diff --git a/drivers/nvmem/layouts/Makefile b/drivers/nvmem/layouts/Makefile
index dd6c6c70b1a9..a0ade4c22c79 100644
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@ -6,4 +6,5 @@
 obj-$(CONFIG_NVMEM_LAYOUTS) += fixed-layout.o
 obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
 obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) += onie-tlv.o
+obj-$(CONFIG_NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID) += rockchip-otp-cpuid.o
 obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) += u-boot-env.o
diff --git a/drivers/nvmem/layouts/rockchip-otp-cpuid.c b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
new file mode 100644
index 000000000000..61f509c4a8cf
--- /dev/null
+++ b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: 2026 Flipper FZCO
+/*
+ * NVMEM layout for the CPU ID in Rockchip OTP memory
+ */
+
+#include <crypto/sha2.h>
+#include <linux/device-id/of.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <uapi/linux/if_ether.h>
+
+#define ROCKCHIP_CPUID_LEN	16
+
+struct rockchip_cpuid_data {
+	unsigned int offset;
+};
+
+static int rockchip_cpuid_mac_pp(void *priv, const char *id, int index,
+				 unsigned int offset, void *buf, size_t bytes)
+{
+	char cpuid[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+	u8 *mac = buf;
+
+	if (bytes != ROCKCHIP_CPUID_LEN)
+		return -EINVAL;
+
+	if (index < 0 || index > 1)
+		return -EINVAL;
+
+	/* The buffer still holds the raw CPU ID at this point */
+	bin2hex(cpuid, mac, ROCKCHIP_CPUID_LEN);
+
+	sha256(cpuid, sizeof(cpuid), digest);
+
+	memcpy(mac, digest, ETH_ALEN);
+	mac[0] &= 0xfe;		/* clear the multicast bit */
+	mac[0] |= 0x02;		/* set the locally administered bit */
+	mac[5] ^= index;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rockchip_cpuid_add_cells(struct nvmem_layout *layout)
+{
+	const struct rockchip_cpuid_data *data;
+	struct nvmem_cell_info info = {0};
+	struct device_node *layout_np;
+	int ret;
+
+	data = of_device_get_match_data(&layout->dev);
+	if (!data)
+		return -EINVAL;
+
+	layout_np = of_nvmem_layout_get_container(layout->nvmem);
+	if (!layout_np)
+		return -ENOENT;
+
+	info.name = "mac-address";
+	info.offset = data->offset;
+	info.raw_len = ROCKCHIP_CPUID_LEN;
+	info.bytes = ETH_ALEN;
+	info.read_post_process = rockchip_cpuid_mac_pp;
+	info.np = of_get_child_by_name(layout_np, info.name);
+
+	of_node_put(layout_np);
+
+	ret = nvmem_add_one_cell(layout->nvmem, &info);
+	if (ret)
+		of_node_put(info.np);
+
+	return ret;
+}
+
+static int rockchip_cpuid_probe(struct nvmem_layout *layout)
+{
+	layout->add_cells = rockchip_cpuid_add_cells;
+
+	return nvmem_layout_register(layout);
+}
+
+static void rockchip_cpuid_remove(struct nvmem_layout *layout)
+{
+	nvmem_layout_unregister(layout);
+}
+
+static const struct rockchip_cpuid_data rk3576_cpuid_data = {
+	.offset = 0x0a,
+};
+
+static const struct of_device_id rockchip_cpuid_of_match_table[] = {
+	{
+		.compatible = "rockchip,rk3576-otp-cpuid",
+		.data = &rk3576_cpuid_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rockchip_cpuid_of_match_table);
+
+static struct nvmem_layout_driver rockchip_cpuid_layout = {
+	.driver = {
+		.name = "rockchip-otp-cpuid-layout",
+		.of_match_table = rockchip_cpuid_of_match_table,
+	},
+	.probe = rockchip_cpuid_probe,
+	.remove = rockchip_cpuid_remove,
+};
+module_nvmem_layout_driver(rockchip_cpuid_layout);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexey Charkov <alchark@flipper.net>");
+MODULE_DESCRIPTION("NVMEM layout driver for the CPU ID in Rockchip OTP memory");

-- 
2.54.0

