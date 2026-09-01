Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D0D4398FD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276814; cv=none; b=KlxWVFiS0J9uZHNIDiUqc4W5tzE7aOq451CXx7gAjTSRKP6mleMOJPudw30B7cNxasXS4WuvqLNHLtybVbxUveXgXSzGk9eO+fF8HTei2v4eXH7J7UPjz0XT849MnU4atAgEQYX1cs7FKxONovL54n3pd8dsmVGHRnG4hfDOa6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276814; c=relaxed/simple;
	bh=d4EylAch0HWQDbh+CNZzCOo23MHWD8MSNDYCBCvHebw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhdXQruSLAdVOWzkOYMOH9Cf3+kh10mm0LCFNZujVD/vVv8Fl4LZRZtHVzeUwCwtQdWVpcSFC5i+/tOL+kGjwomOnZ9byiCiblGg8vhIFLIcUJ0HLixXa0L6hWfrTb7ZHbmR2Uom5nJYB90ggdxVAGrG7oVyp2M+O114DIoTZK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ima+rlJK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ima+rlJK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso34145825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276811; x=1788881611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0G2BdZkYIcm7ilvGhLvEO04Ul0Hj20yERUiWvshu/M=;
        b=ima+rlJKCV+Wzlf3LixOokLx65it9zsT8hBZ3bZ+foRhlAmMt6MjopXXUWKBrfkSTq
         4tixZ2G5xmMnCpDrZwIYbNFa9BaK6Y6J0sfJChM1vonRdz8rnoG7VOnQ+S6BlT+4ChPl
         15OuIozWGCZpTBUTsxh/I1czgI07b0MmDlY6GAJQBxnFG3/bK7LQRgtsqXncRMP95nwB
         N7XzhVZ3+Stwl2+arVYWEOmhCssTpajoX8nPOtiz8hydG7K6sfhPx+rv0lTsUkSaku8Q
         11jzeJi2lhuiLDkZBd6TtuwLHy9apSISqt9/E64KzOoUbnHatU3Fc673xGy3l21PChta
         zaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276811; x=1788881611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0G2BdZkYIcm7ilvGhLvEO04Ul0Hj20yERUiWvshu/M=;
        b=qUd4AD3dYKazA8Pqf1H8fketDPc7NKa+Y/2WvlO4M95kDdPWqaF1VwhCWUl24IeW5S
         csWS6Dv0FophalNzzqzsdnUbex6yChGKanoZ7UxX8CYQMeoP+tg2WaP72Q2QQcdWcv26
         SJjHcmwf6+CMzK/id4yOzvXSNez5TKIZ1sgImPQokXgdSIsR2o+MtFrAY1NNc+gnt/Sx
         PNjpGUGdM1l+JARh0xGDU5efGPyaUc+QnJnxoOPaH/2yPZYxqvRnnKoBFStIh0BWWRQJ
         LtfPNJgCcJoR6FWR5anQ8ezZCG72NQ+LtpNyMwNbKt02M0V9de+6t9j4VoBCAzh/hkDM
         sGhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6y/WqGbdpJ0s7TpAiXdwm85fqdqmqI8NCgbiLno2EL1s2OE2nUEk2C8Pw5Fels7KPQRhUncDtWGRo6PQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nPAeaQ3frHpM+yWizY2nkV7h2YNJXJaiXpNRgvURI4QHNno8Mi
	xwdvSCb4rsZBkMjZIO7Uh2bmxp+iw+96ib6k8pnaSbC8xmSOmld0QW5ww+phuAEP6cI=
X-Gm-Gg: AR+sD131KPMEHA+eFcpSxmYXudiZRK7N0smxx7clxItG1JBWFiLsWJ2xipQkYRSHH/m
	fpMWl5yPE5rVkNQUoaQOHLUKebZ8G9mReHmRZLvz0iIWI8KWUTi5sQbSbBWbhn/Eh80LoBtgNBP
	nCkO12rQ7YeWzXYODKpR1/4i6W+u36xjZfJzLyghmevTaWCbS+KlByV439QM5EKEHcyIRJ2SmYY
	wMW+dTMq+fBEBCEiLwCZH5DJaFg5iRXWMGV/rNjDUZY1Wg268E5Fo/4b2kbFnh3zTneGSiYaD7f
	1o4uZGoq7whhduSelnKGVZmkKSZM8zcvSfq3zw4+kbxDaSOVgvecUaI2enW0ABmEKYaKQX1yIf9
	O7qMpwNGcYlzWDCV9J2APX3h6n31j1zFZX6+eH/z2+ZqHfvlpoINkaTKwmEo24h74OLxMSwoY6r
	6R+lsyRyNxf/SFY0iduTlT9NP4+3z2anjkJ4lBGE2CaXNkP4HxeMQmqjF00DsOevI3d0lrpUw8W
	DEe73dkBCGYRpYjKO9Zn/AjokDFx8YDdTHQzr88
X-Received: by 2002:a05:600c:4e0b:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce00540f1mr119597595e9.11.1788276811127;
        Tue, 01 Sep 2026 08:33:31 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:13 +0400
Subject: [PATCH 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571; i=alchark@flipper.net;
 h=from:subject:message-id; bh=d4EylAch0HWQDbh+CNZzCOo23MHWD8MSNDYCBCvHebw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2C3Zn96lfC2ddusjhzeHOBsUORaZmnpK16kE6g0Z
 +mxD2usOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqwD6G//EB7Gmyp/qmnLr/U/nvXiVxvrbi6TXLfphyL7NdYiexvYXhn72f8gP
 bLZ1nlmj+vZ138NICg4lzq6KfXbKWZwzweK5/jRsA
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

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                |   1 +
 drivers/nvmem/layouts/Kconfig              |  13 ++++
 drivers/nvmem/layouts/Makefile             |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c | 119 +++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b35b3677bf0b..ae98e1fc6121 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23718,6 +23718,7 @@ M:	Alexey Charkov <alchark@flipper.net>
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

