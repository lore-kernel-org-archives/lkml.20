Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8309241DE03
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747274; cv=none; b=VFlPTS4cx5RgemRM0fbcVr3biwTSoikF6/5nA3w8lZWsHIgVbDUnJmyzvHZmENiixXVR5DdzkFoosbZ8nJ0xrpKIz8+Ep66no5Upy2BA5DfEEE5rfciLRXbbFABOV7K/+2rXAVEBDD4V8ILSRoUfpMpXY5FcjMFEu6SWz3rTkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747274; c=relaxed/simple;
	bh=202dBnt6Qo/brTSaHLOXpkZXJ/J4sl7JjmQO9iqX6Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrLbBDmYsMJ4gMbLFQrusLlUe9DA2qSuc9i1B4B0S1tLedoASZYroiSNxzJU0crGLdRtfkkidVg0f6YNJ258GJsHkzNMxe3mI/4cjMiN08aWxvR4eeynQAvdwClz1dvBPrdW9djhJn6FCX/vz7CRbhLJPs/+ZUvkl+A+einIrNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuoPbFkm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuoPbFkm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c26d7e951so128147566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747269; x=1788352069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PXPX3KZ7Q5SDUIHinjMP0o4uSBXepq69NS8qzVhJGU=;
        b=IuoPbFkmw7mQZizv3wsVNE8OE11xuTeAMAAKhnI7I2GXEft4k4kvJXj2svJcTp5qrq
         HBOFLwblID89h1dSHKsmPHIL1RJnVyWPlHnMbIEky0gnaclPJpWf13xyIaDck0WhdWnK
         MjEVFtRZgFByjVPC3e8vVK4ZYcWR8HZIwolS4p2gxXa3AlL61Abmby6KozgmsMcqZ0Gm
         jSEXgzr/pHbFiKocWkia9O3KC4mILWEg76vtgwXO83OEfzUYdsGAMIoWYXTI7EI6nZCy
         ppKgBftShlUKLdVVow6clwSHQ19h+KB3VxY/fPe+nVlwOnpCmVsQmuDx+xinLHbLHQb/
         6iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747269; x=1788352069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PXPX3KZ7Q5SDUIHinjMP0o4uSBXepq69NS8qzVhJGU=;
        b=ImsTBK8YzZPo1q4xzdfnIKRuRycY3f8hUXpvoiomFSjKoVMnJqGyM6I/NDAUdPRG+0
         n01v5MTRz6Uy/FQNjBHdPrm6sn7taQrfpOqAuReVIQBW6PSqCdz6jIFjcsUmImbco+JX
         SiNLlhYD4b5zYFhBDGn/3QBN2IDtxSGztvzI93xfJZ0ynjwJtTUJ3f90XDselgJjvQRI
         kjmdBdcWlKua+lzoRMf9Qf/PT94aWAqVdE2snfSTLodm/L5VZoI6toDC7bqHyL1CfL/8
         QFWLdhFmTAyNJUTLRJTGgwNmhQOu1HTJp/ArWnG6VqENNux9Fhr9i6GLllGJS8NgcNPU
         yAfg==
X-Forwarded-Encrypted: i=1; AHgh+RqMFIm68C9EWgVrMvksSSraJf49Gj3VmKBhdfndTMPtXsLcvyafRkjOrH9PGneVaiTfpSEYXWXGDbWMRG4=@vger.kernel.org
X-Gm-Message-State: AFuF++nt4Hql7fMRVikLCHMS+3+wPuFK+F8LBxQgp1d8jr3n5a5dGpl/
	Szd+YV7yE9mT0Vs+7gJrI5TihEmtAWVcJfZ2gx9a99BsXjoDTfrOfUsu
X-Gm-Gg: AR+sD122gtqnMMwV81g5qrZ+gp0i77bfbftNaSnN/mEUVhYsQL6Ri3EXXyZImzu/uQo
	Y31aOKfo3Ra21xXfU/YSismxGxc5V98A+s+Ay9OhQXPj5QKqPj8rFQbys0j7y1DCOuwk1FZFAy7
	X6dtKgU9wZdlz+sGHLVv0Wkm2HxSc4se0zgW98exnL1jDFaVVjAvPwch0sIUOVKx6eIW5qEwqq9
	XHZqGWgzfSgmCfNKfwu2CSzKqUxf35pevIrIhl8NoplkgS5PBZHMLy1MWZGDXKFTFFvswvgzF+g
	aX4vhIiDMoyi1K6ffYKOJsogZcsC98y+njdz9i9YsZ629cDOr2MkK26lWyVruLGxAMPt9aWJ5NN
	eaHH+P+yZpl3+N/0N8y6WQeNJjEsT26FcklFpHSJBlnySRr847Di/ovE+6QLF50o96dtoPtJLjN
	MlO3/KIBmMPhaVdMk/lRKd2yA2hhP/pam5uvBKnnilnsqzl+UrmfgRy2aZ8j3KPfOPb6xu0aYZb
	suGb5bpcUgmNw==
X-Received: by 2002:a17:906:ee86:b0:c24:c22c:6372 with SMTP id a640c23a62f3a-c250bb57107mr696242466b.5.1787747269181;
        Wed, 26 Aug 2026 05:27:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b4e9csm504890266b.54.2026.08.26.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:27:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
Date: Wed, 26 Aug 2026 13:27:25 +0100
Message-ID: <20260826122742.153643-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
SoC. The driver binds as an auxiliary device to the parent SYSC driver,
using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
{usb,dsi,csi}-pwrrdy pwrseq targets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Replaced of_device_is_compatible()->of_device_compatible_match() in
   pwrseq_rzg3l_pwrrdy_match().
v3->v4:
 * Replace the large of_device_id structures by C strings, and
   using of_device_is_compatible() will reduce kernel size.
 * Replaced of_device.h -> of.h
 * Dropped local variable pwrseq from pwrseq_rzg3l_pwrrdy_probe().
v2->v3:
 * Kconfig selects AUXILIARY_BUS to avoid compilation issues.
 * Added match for consumer device and added of_device.h header file.
 * Replaced regmap_update_bits()->regmap_assign_bits() and updated
   the function parameter of pwrseq_rzg3l_set_pwrrdy().
 * Simpilfied probe() return with PTR_ERR_OR_ZERO macro.
v1->v2:
 * Added a comment in pwrseq_rzg3l_pwrrdy_match().
 * Dropped dev_get_regmap() from probe as regmap is now part of platform
   data.
 * Added a blank line before devm_pwrseq_device_register() in probe.
 * Dropped the error message devm_pwrseq_device_register() as probe prints
   failure message.
 * Dropped local variables dev and regmap from probe().
---
 drivers/power/sequencing/Kconfig              |   9 ++
 drivers/power/sequencing/Makefile             |   1 +
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 142 ++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-renesas-pwrrdy.c

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 226c62704d9b..6b5d187dd4b5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -27,6 +27,15 @@ config POWER_SEQUENCING_QCOM_WCN
 	  this driver is needed for correct power control or else we'd risk not
 	  respecting the required delays between enabling Bluetooth and WLAN.
 
+config POWER_SEQUENCING_RENESAS_PWRRDY
+	tristate "Renesas Power Ready sequencing driver"
+	depends on SYSC_RZ || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  Say Y here to enable the power sequencing driver for the Renesas
+	  Power Ready signals. This driver handles the power ready signals
+	  required to power on the various IP's on RZ/G3L platform.
+
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
 	depends on ARCH_THEAD || COMPILE_TEST
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index 0911d4618298..b33d08d82f43 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_POWER_SEQUENCING)		+= pwrseq-core.o
 pwrseq-core-y				:= core.o
 
 obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
+obj-$(CONFIG_POWER_SEQUENCING_RENESAS_PWRRDY) += pwrseq-renesas-pwrrdy.o
 obj-$(CONFIG_POWER_SEQUENCING_TH1520_GPU) += pwrseq-thead-gpu.o
 obj-$(CONFIG_POWER_SEQUENCING_PCIE_M2)	+= pwrseq-pcie-m2.o
diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
new file mode 100644
index 000000000000..743855620501
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3L Power Ready driver
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/regmap.h>
+
+#define SYS_PWRRDY_N		0xd70
+#define SYS_PWRRDY_N_USB_MASK	BIT(0)
+#define SYS_PWRRDY_N_DSI_MASK	BIT(1)
+#define SYS_PWRRDY_N_CSI_MASK	BIT(2)
+
+static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
+				   bool val)
+{
+	struct regmap *regmap = pwrseq_device_get_drvdata(pwrseq);
+
+	return regmap_assign_bits(regmap, SYS_PWRRDY_N, mask, val);
+}
+
+static int pwrseq_rzg3l_usb_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_USB_MASK, 0);
+}
+
+static int pwrseq_rzg3l_usb_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_USB_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_usb_pwrrdy_unit = {
+	.name = "usb-pwrrdy-power-sequence",
+	.enable = pwrseq_rzg3l_usb_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_usb_pwrrdy_disable,
+};
+
+static int pwrseq_rzg3l_dsi_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_DSI_MASK, 0);
+}
+
+static int pwrseq_rzg3l_dsi_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_DSI_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_dsi_pwrrdy_unit = {
+	.name = "dsi-pwrrdy-sequence",
+	.enable = pwrseq_rzg3l_dsi_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_dsi_pwrrdy_disable,
+};
+
+static int pwrseq_rzg3l_csi_pwrrdy_enable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_CSI_MASK, 0);
+}
+
+static int pwrseq_rzg3l_csi_pwrrdy_disable(struct pwrseq_device *pwrseq)
+{
+	return pwrseq_rzg3l_set_pwrrdy(pwrseq, SYS_PWRRDY_N_CSI_MASK, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_rzg3l_csi_pwrrdy_unit = {
+	.name = "csi-pwrrdy-power-sequence",
+	.enable = pwrseq_rzg3l_csi_pwrrdy_enable,
+	.disable = pwrseq_rzg3l_csi_pwrrdy_disable,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_usb_pwrrdy_target = {
+	.name = "usb-pwrrdy",
+	.unit = &pwrseq_rzg3l_usb_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_dsi_pwrrdy_target = {
+	.name = "dsi-pwrrdy",
+	.unit = &pwrseq_rzg3l_dsi_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data pwrseq_rzg3l_csi_pwrrdy_target = {
+	.name = "csi-pwrrdy",
+	.unit = &pwrseq_rzg3l_csi_pwrrdy_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_rzg3l_pwrrdy_targets[] = {
+	&pwrseq_rzg3l_usb_pwrrdy_target,
+	&pwrseq_rzg3l_dsi_pwrrdy_target,
+	&pwrseq_rzg3l_csi_pwrrdy_target,
+	NULL
+};
+
+static const char * const pwrseq_rzg3l_pwrrdy_compats[] = {
+	"renesas,r9a08g046-usbphy-ctrl",
+	"renesas,r9a08g046-mipi-dsi",
+	NULL
+};
+
+static int pwrseq_rzg3l_pwrrdy_match(struct pwrseq_device *pwrseq,
+				     struct device *dev)
+{
+	if (of_device_compatible_match(dev->of_node, pwrseq_rzg3l_pwrrdy_compats))
+		return PWRSEQ_MATCH_OK;
+
+	return PWRSEQ_NO_MATCH;
+}
+
+static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
+				     const struct auxiliary_device_id *id)
+{
+	struct pwrseq_config config = {
+		.parent = &adev->dev,
+		.owner = THIS_MODULE,
+		.drvdata = adev->dev.platform_data,
+		.match = pwrseq_rzg3l_pwrrdy_match,
+		.targets = pwrseq_rzg3l_pwrrdy_targets,
+	};
+
+	return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &config));
+}
+
+static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
+	{ .name = "rz_sysc.pwrseq-pwrrdy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, pwrseq_rzg3l_pwrrdy_id_table);
+
+static struct auxiliary_driver pwrseq_rzg3l_pwrrdy_driver = {
+	.driver = {
+		.name = "pwrseq-rzg3l-pwrrdy",
+	},
+	.probe = pwrseq_rzg3l_pwrrdy_probe,
+	.id_table = pwrseq_rzg3l_pwrrdy_id_table,
+};
+module_auxiliary_driver(pwrseq_rzg3l_pwrrdy_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G3L Power Ready Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

