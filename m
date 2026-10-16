Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F693501F49;
	Fri, 16 Oct 2026 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175251; cv=none; b=QxfRREcHmv/wax4uPhz2so1W9fNJsd38l83pU4YXUtvaO22fwvylnSgIMwJgxbYkSuwN4txScSuUKLtgbEjc5YrUcUZ0WdRXYrGsWvKQX8flxkHCWK8NJnxP9DQfwSdWfUFu5YeCcFak0BuwQTUF/QzIWScX4rmmJSFx1znJOBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175251; c=relaxed/simple;
	bh=KPfBasyL/IBpdJn1A0FS/6LaiZq84V2bNOzF0gCzPIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0+IH28fblV/nRFANoPrsggUud6uroXCqtlNB3flj6BngwuNKHZ12qP+pGGCws4o3dbH9AOGJFtHT7u4Pj+6pN23RKFBw8+EG8h8AgLzlNGhhFyXdYKt5gOGHGVRLCT0uRCTcYVSAPgYd3LyMcQm/oF/vI9b8Qyja9nbK16pmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rbY3guXa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rbY3guXa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5B3E14BF;
	Fri, 16 Oct 2026 11:27:25 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3828B3F8C6;
	Fri, 16 Oct 2026 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175248; bh=KPfBasyL/IBpdJn1A0FS/6LaiZq84V2bNOzF0gCzPIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rbY3guXaOLp9Y9DmNDbjrI6MlT+l43o6DQbqjUmtiBZe3u7lFvWE/XbFQgEXSbVgp
	 5USIMXaEwreYyCzLX/LfParKeHsdQ18UhLDoOkzq7GN5urfJAeHz3qcT1lEZ8DuW5r
	 oFJzQkiLYEf9VHfuYN6fX3YQD1InF1LELgqNCYNs=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 2/8] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
Date: Fri, 16 Oct 2026 19:27:06 +0100
Message-ID: <20261016182714.1835813-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>

The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
standalone platform device. Now that the SMCCC core has an SMCCC bus,
create an arm-smccc-trng device for the discovered TRNG service and convert
the hwrng driver to an SMCCC driver.

The SMCCC id table preserves module autoloading for systems where the TRNG
driver is built as a module.

The sysfs device path changes from the old smccc_trng platform-device path
to an arm-smccc device path. No known userspace dependency on the old path
was found; a Debian Code Search lookup for the existing platform-device
name/path did not find any users.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Olivia Mackall <olivia@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm/include/asm/archrandom.h       |  2 +-
 arch/arm64/include/asm/archrandom.h     |  2 +-
 drivers/char/hw_random/arm_smccc_trng.c | 32 ++++++++-----
 drivers/firmware/smccc/smccc.c          | 62 +++++++++++++++++++++----
 4 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
index cc4714eb1a755..ee39a03ddf8ab 100644
--- a/arch/arm/include/asm/archrandom.h
+++ b/arch/arm/include/asm/archrandom.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ARCHRANDOM_H
 #define _ASM_ARCHRANDOM_H
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	return false;
 }
diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 8babfbe31f954..7605dd81bd1e1 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -12,7 +12,7 @@
 
 extern bool smccc_trng_available;
 
-static inline bool __init smccc_probe_trng(void)
+static inline bool smccc_probe_trng(void)
 {
 	struct arm_smccc_res res;
 
diff --git a/drivers/char/hw_random/arm_smccc_trng.c b/drivers/char/hw_random/arm_smccc_trng.c
index dcb8e7f37f25c..01c1a30cbab8d 100644
--- a/drivers/char/hw_random/arm_smccc_trng.c
+++ b/drivers/char/hw_random/arm_smccc_trng.c
@@ -16,8 +16,10 @@
 #include <linux/device.h>
 #include <linux/hw_random.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+
+#include <asm/archrandom.h>
 
 #ifdef CONFIG_ARM64
 #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
@@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	return copied;
 }
 
-static int smccc_trng_probe(struct platform_device *pdev)
+static int smccc_trng_probe(struct arm_smccc_device *sdev)
 {
 	struct hwrng *trng;
 
-	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
+	/* validate the minimum version requirement */
+	if (!smccc_probe_trng())
+		return -ENODEV;
+
+	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
 	if (!trng)
 		return -ENOMEM;
 
 	trng->name = "smccc_trng";
 	trng->read = smccc_trng_read;
 
-	return devm_hwrng_register(&pdev->dev, trng);
+	return devm_hwrng_register(&sdev->dev, trng);
 }
 
-static struct platform_driver smccc_trng_driver = {
-	.driver = {
-		.name		= "smccc_trng",
-	},
-	.probe		= smccc_trng_probe,
+static const struct arm_smccc_device_id smccc_trng_id_table[] = {
+	{ .func_id = ARM_SMCCC_TRNG_VERSION },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, smccc_trng_id_table);
+
+static struct arm_smccc_driver smccc_trng_driver = {
+	.name	  = KBUILD_MODNAME,
+	.probe	  = smccc_trng_probe,
+	.id_table = smccc_trng_id_table,
 };
-module_platform_driver(smccc_trng_driver);
+module_arm_smccc_driver(smccc_trng_driver);
 
-MODULE_ALIAS("platform:smccc_trng");
 MODULE_AUTHOR("Andre Przywara");
 MODULE_DESCRIPTION("Arm SMCCC TRNG firmware interface support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd3..67e503dac409f 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -9,7 +9,8 @@
 #include <linux/init.h>
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/arm-smccc-bus.h>
+
 #include <asm/archrandom.h>
 
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
@@ -81,16 +82,59 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
 
+struct smccc_device_info {
+	u32 func_id;
+	bool requires_smc;
+	const char *device_name;
+};
+
+static const struct smccc_device_info smccc_devices[] __initconst = {
+	{
+		.func_id        = ARM_SMCCC_TRNG_VERSION,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-trng",
+	},
+};
+
+static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
+{
+	int ret;
+	struct arm_smccc_res res = {};
+
+	if (smccc_conduit == SMCCC_CONDUIT_NONE)
+		return false;
+
+	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
+		return false;
+
+	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
+		return false;
+
+	arm_smccc_1_1_invoke(smccc_dev->func_id,
+			     0, 0, 0, 0, 0, 0, 0, &res);
+	ret = res.a0;
+
+	if (ret == SMCCC_RET_NOT_SUPPORTED)
+		return false;
+
+	return true;
+}
+
 static int __init smccc_devices_init(void)
 {
-	struct platform_device *pdev;
-
-	if (smccc_trng_available) {
-		pdev = platform_device_register_simple("smccc_trng", -1,
-						       NULL, 0);
-		if (IS_ERR(pdev))
-			pr_err("smccc_trng: could not register device: %ld\n",
-			       PTR_ERR(pdev));
+	struct arm_smccc_device *sdev;
+	const struct smccc_device_info *smccc_dev;
+
+	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
+		smccc_dev = &smccc_devices[i];
+
+		if (!smccc_probe_smccc_device(smccc_dev))
+			continue;
+
+		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
+		if (IS_ERR(sdev))
+			pr_err("%s: could not register device: %pe\n",
+			       smccc_dev->device_name, sdev);
 	}
 
 	return 0;
-- 
2.43.0

