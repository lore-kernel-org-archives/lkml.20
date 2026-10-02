Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC2497B7C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947006; cv=none; b=tWeXr2reMrxhIK5yzsxXxgwTkGLX4ZXdMMnjmiAI8I9xvc3hfFrjo8qYA4UYo5oeyajZsBNAlbfyhhkD4D4JabYWHmywocEhV1ExAyEME+eCwOT8CoN7a73hz9m9WVuuMQymVZDkNqjsX+fx/oKEm+WvEVQjlMpcRlX8La4x8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947006; c=relaxed/simple;
	bh=9CdMhYIOLSytyFTmKeedprbNxEo885w4wOK42k36eDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWjJvHNyPUi0fPROAOyXWGj/AOgSXe0KaKJzyTU7uD3lsgLA+Kk2BPxCzUvPNnQSxKCWkooSXoJWcpU7yMYcDc4AqffxyvrTSMNqaqO74tYnsekm+kKXfLSzf16J5/IhVamO3fKEIyeKWLmLyzfvJeKPwt8aMlFJVriPvgckOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie4dCGKb; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie4dCGKb"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso2061386eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947004; x=1791551804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=Ie4dCGKbtpHczsPL87QNune8WaSS4O8PeOvrrwApwzEto5iLHDhS3LYPKnO3hsZDdO
         83lrfUV5ZnO6fJvwYXt28NO1dfUjpurTFQ8/pwlMis5NDSUW9hYujIp9w5VEHkKMWOzT
         XCfyRqxjVkwK4Ur2vkjH2JqVz21zTurQX4I4hlnVaMojAxLOGISbzoaDtddU8s2Swx/D
         5Xo+S0FfYS5aMdkfoh9hPgVFrryMog/sZwgWMcP0Rkk9BSz8YLA2+Ea5Vc9xGsSKlk/d
         FmSBUdFQVLHeLFUIFD6OXgWewTg1Ph0MwF6HKjb6ORluRmQL5abxj9l7gyZUNKva4pfp
         di0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947004; x=1791551804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=g0dS9XyvYAqanXTfDYz1ZcV0B2+JTWILnt4/Xz8OXVC/b0s/bpDr4VyxhdsLaTnRgT
         u5OPfXXjfNVYQZRSpbz7rFjX7m2Ov1YUl18ekbCwRNp12TF2rPjlTjAvb0soaTj92+Sq
         x+mY+qprwfa2p9yy4Cg6QpSoUqZFW5FBYrkMLY47MBK5zzTxShqzccspPfHI7JxA0+mw
         N2Cv/O10YbVmqD6b0bruMdl1daKvDj1DKjV8Hi9W7VEJOIp1QYyxiSS08ubaPcBYaAcr
         nS1qK6HgPYFU8RsI3tmT9zDdtdkUmqt8cZlG+g/gxaTi5URrQRsbsj4GGAREXgHkLdT7
         r6lw==
X-Forwarded-Encrypted: i=1; AKwUvByA59nOA6YMoMfaTit0zEFIBTKrda/JFTXpRANaK3eRxEp/5xzf8rK8I6XCRQIKIZL6P2jy4fFseuOS2Io=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTtNS1UdW1l3fsIYdRd8H4tpoZJ0suDX3HNbcwybeLY2esvEb7
	KBR1pAXLgLtdjZpkm7nPlZpc2whGW6ev0zr/geJqJ0GSCW/ZMDtttCLP
X-Gm-Gg: AYBFou2nnKCxgCsRXZRG1NdROD8unlzcQA/kTxeziBiyZgVG265VcBVm5vxVL+6APzM
	Va2fJjlnJb1LAZ9vI3P/D/F0MWC/RxXGxr/Hctr172px1SMOjTNseCIUCv5KF5nbKCkSugM1TNq
	CZM68eJdySEK7iprogcuMldiow5iFIt2fQcmQ9FxD0ODxfCn7ON/SskYqH4eOOIAWgzOdeq7wbm
	EaLxdtaPEQSRQy2CxmidTN/2Cp+WyOnm6EZupM2E1QCJI9cArQ/L9H9oESH8BEgNByiNrYzZVMK
	XxT4GLv4V/8rcKzLMpZsGlhmfF0c4cTf8tk9P/SAo7WqIlYDm0PPVrmx43Pd3KBPc9LYQIzOIrt
	8Kde41eHZaq80gzxYj6J6POCnCSlEqaC3LlqB6b0AVZzMcimuJW+bBA6X4N0Dz4DI7lKpE/Fs4e
	S7NQxITTsr7dqEGURjjnTj3Fpm61f7p6yDYO+WYMz8uss1gk7EQ7iml5dSC6mvrEPUF4L8dxqwf
	f9qNJv9c1lhYATPImP6mfMaW9U=
X-Received: by 2002:a05:693c:8951:10b0:34d:2084:12d3 with SMTP id 5a478bee46e88-34f219a4e69mr2785581eec.39.1790947004214;
        Fri, 02 Oct 2026 06:16:44 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm15839228eec.18.2026.10.02.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:16:42 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	tan.siewert@9elements.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
Date: Fri,  2 Oct 2026 18:46:34 +0530
Message-ID: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the AST2600 SCU passthrough selector support used by the
ASRock Rack B650D4U host power-control circuit. This RFC includes
the driver, Devicetree binding, and board node to discuss the final
kernel-facing interface.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
 drivers/soc/aspeed/Kconfig                    |   9 ++
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c

diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
new file mode 100644
index 000000000000..e6451d17955c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASRock Rack B650D4U power passthrough
+
+maintainers:
+  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
+
+properties:
+  compatible:
+    const: asrock,b650d4u-power-passthrough
+
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - aspeed,scu
+
+additionalProperties: false
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
index a4e384588a54..86291c250562 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -32,6 +32,11 @@ gfx_memory: framebuffer {
 			size = <0x01000000>;
 		};
 	};
+
+	host-power-passthrough {
+		compatible = "asrock,b650d4u-power-passthrough";
+		aspeed,scu = <&syscon>;
+	};
 };
 
 &fmc {
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 11e4db998c06..1b0281e0bfb0 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -58,6 +58,15 @@ config ASPEED_SBC
 	  Say yes to provide information about the secure boot controller in
 	  debugfs.
 
+config ASPEED_B650D4U_POWER
+	tristate "ASRock B650D4U host power passthrough"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Enable the AST2600 GPIO passthrough selector used by the
+	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
+
 config ASPEED_XDMA
 	tristate "ASPEED XDMA Engine Driver"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 5f61bb4cc36c..3e9618d1eafc 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
 obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
+obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
 obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
new file mode 100644
index 000000000000..22a6925539dc
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/kstrtox.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+
+#define ASPEED_SCU_PROTECTION        0x000
+#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
+#define ASPEED_SCU_GPIO_ACTION       0x51c
+#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
+#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
+
+static struct regmap *b650d4u_scu;
+static DEFINE_MUTEX(b650d4u_lock);
+
+static int b650d4u_set_passthrough(bool enable)
+{
+	int ret;
+
+	mutex_lock(&b650d4u_lock);
+
+	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
+			   ASPEED_SCU_UNLOCK_KEY);
+	if (ret) {
+		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
+		goto out;
+	}
+
+	ret = regmap_update_bits(b650d4u_scu,
+				 ASPEED_SCU_GPIO_PASSTHROUGH,
+				 ASPEED_B650D4U_POWER_MASK,
+				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
+	if (ret) {
+		pr_err("B650D4U: passthrough update failed: %d\n", ret);
+		goto out;
+	}
+
+	if (!enable)
+		ret = regmap_write(b650d4u_scu,
+				   ASPEED_SCU_GPIO_ACTION, 0);
+
+out:
+	mutex_unlock(&b650d4u_lock);
+	return ret;
+}
+
+static ssize_t passthrough_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = b650d4u_set_passthrough(enable);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(passthrough);
+
+static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						      "aspeed,scu");
+	if (IS_ERR(b650d4u_scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
+				     "failed to get AST2600 SCU regmap\n");
+
+	ret = b650d4u_set_passthrough(true);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable power GPIO passthrough\n");
+
+	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to create passthrough control\n");
+
+	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
+	return 0;
+}
+
+static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
+	{ .compatible = "asrock,b650d4u-power-passthrough" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
+
+static struct platform_driver aspeed_b650d4u_power_driver = {
+	.probe = aspeed_b650d4u_power_probe,
+	.driver = {
+		.name = "aspeed-b650d4u-power",
+		.of_match_table = aspeed_b650d4u_power_of_match,
+	},
+};
+module_platform_driver(aspeed_b650d4u_power_driver);
+
+MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
+MODULE_LICENSE("GPL");
-- 
2.47.3

