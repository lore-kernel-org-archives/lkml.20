Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558CD530DEC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701083; cv=none; b=MMMRpX97N7KkcoEQwVAt8zxIjNHcJaYOntzc5bNqdg8cIWW5EtFjdXgsoNrC32OEiVTDsj+0JB65YLpFHEQ/qjTYbP+Hyiwc16vE5Gv0cWKaClBa01abwjQ5zdLsMxSduGjrzbCLrAyMZv0gi6pF2TVmBbwqI9yWhm28NGKpEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701083; c=relaxed/simple;
	bh=bXiaiyyrKYaeKynYCTDuAXZ/ftn4vXLYmBwDbteIdoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKjnY1vF6O6w6SxcWaBTtj3ZyKQ1aiGrpQctXH08W6Jpc50bbATmUab0T1c/bj+wGCXBpxrxJ+PTZz9ShvKZMRQ90geSD1JQRRuReDs5i8oWCcxRR1rzmEOHD6oTm8+FocNYXbr3fGricKuCp0DYmtm8JUNICOMonKaFSL5iZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Aqf1PfFT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Aqf1PfFT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B0EE1516;
	Tue, 29 Sep 2026 09:57:57 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A2A23F85F;
	Tue, 29 Sep 2026 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701080; bh=bXiaiyyrKYaeKynYCTDuAXZ/ftn4vXLYmBwDbteIdoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Aqf1PfFThyFHP268+LxiysKEvf5ZbojIdm9qMmy3wicEJP2InUBhu9LFoK2W5WVE9
	 reKN9ZIzBvSYgHkkwkhskQMEHFsxuCXJX344MTtfNphjCNiUUfUvlffzGyrUnccXTS
	 Jkw0sKF/+TNu5afbS+HM+wx58qsGycVLbJwRpMyI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 17:57:49 +0100
Subject: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13665; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=9AuTN6i2zRxC3MG1pF6cw9iqOxAn1hLsqdSfhHhipFQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4RLJ7NArYrSTv10NuzUCkUWWpP3VQ/2jEXA
 we4raVoCWWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEQAKCRBt1cPRWsUx
 M5hzC/4qwR5iqJHjhdnpNPge3PpOEX+8B9kZpvmnx4X49D7kRLyeVeYEha/9OxogxcMx28C2AQo
 2tDLT81g+Nq3EM21QjEmuIZMSXCrUyPkhtZMLuV3qPiFeCByJmn/qkuqK+XVaInGUrlgzo6oJV4
 TbjBzla9inus6YS53Tp+hDoCIzNN/Bv3+Vw3KnNGbeaq0GoP8psH4F/Sz4oHzuiOUZpvx/vlumu
 I8ja0VB983eXMAeL25D+aAjKg2Euu7JZJpARvuijelJhNZxiZrOupdK/hsP5wDcAnmYPkTLdJfS
 hkLtZRM30gYIADX65jjQ86F0M5zWdztYDcHefHfBgpxW4lMXG7SWNlp8d2RcK/HkPMCKIzqTO7j
 Wk1DIduLSBwDgoTOz5LoDXmjZCMezA5NjIGdW/FkPsVTurZHVuDBJxHYfnOOWUP1SQ3xuPr5Z87
 Foz0kfQQ0shIlAltrLX+sGQ+ewsuWfZYCbpm3U9jYy4RSPgDWYEqzOs0fCK9Bkp3ZZwRk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

From: Sami Mujawar <sami.mujawar@arm.com>

Add support for Arm CCA measurement registers (MRs), enabling attestation
and runtime integrity tracking from guest Realms.

This implementation registers a measurement configuration with the TSM
framework and exposes measurement register values via sysfs using a
misc device. The supported registers include the Realm Initial
Measurement (RIM) and four Runtime Extensible Measurement Registers
(REM0–REM3), each using SHA-256 or SHA-512 depending on Realm
configuration.

The measurement registers are located under the following sysfs node:
    /sys/devices/virtual/misc/arm_cca_guest/measurements/
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem0:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem1:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem2:sha512
       -rw-r--r-- 1 0 0 64 Jul 21 11:46 rem3:sha512
       -r--r--r-- 1 0 0 64 Jul 21 11:46 rim:sha512

As seen above the attributes for the REMs are 'rw' indicating they can
be read or extended. While the attributes for RIM is 'r' indicating
that it can only be read and not extended.

The sysfs node suffix for the measurement register (i.e. ':sha512')
indicates the hash algorithm used is sha512. This also reflects
that the Realm was launched with SHA512 as the measurement algorithm.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 .../sysfs-devices-virtual-misc-arm_cca_guest       |  38 +++
 drivers/virt/coco/arm-cca-guest/Kconfig            |   1 +
 drivers/virt/coco/arm-cca-guest/main.c             | 282 ++++++++++++++++++++-
 3 files changed, 319 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
new file mode 100644
index 000000000000..878dc54e48f8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest
@@ -0,0 +1,38 @@
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/MRNAME[:HASH]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		Value of a Arm CCA Realm measurement register (MR). The optional
+		suffix :HASH is to represent the hash algorithms associated with
+		the MRs. See below for a complete list of Arm CCA Realm MRs exposed
+		via sysfs. Refer to the Arm Realm Management Monitor (RMM)
+		Specification for more information on the Realm Measurement registers.
+
+		The Arm Realm Management Monitor Specification can be found at:
+		https://developer.arm.com/documentation/den0137/latest/
+
+		See also:
+		https://docs.kernel.org/driver-api/coco/measurement-registers.html
+
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rim:[sha256|sha512]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) RIM - [32|64]-byte immutable storage typically used to represent
+		the Realm Initial Measurement (RIM) which is the measurement of
+		the configuration and contents of a Realm at the time of activation.
+
+What:		/sys/devices/virtual/misc/arm_cca_guest/measurements/rem[0123]:[sha256|sha512]
+Date:		July, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RW) REM[0123] - 4 Run-Time extendable Measurement Registers that
+		represent the Realm Extensible Measurement (REM) registers which
+		can be extended during the lifetime of a Realm.
+		Read from any of these returns the current value of the corresponding
+		REM. Write extends the written buffer to the REM. All writes must start
+		at offset 0 and be maximum 64 bytes in size. Attempting to write more
+		than 64 bytes will result in EINVAL returned by the write() syscall.
diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 0d4ce72e2d86..3693d3bc90c6 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -3,6 +3,7 @@ config ARM_CCA_GUEST
 	depends on ARM_RMM_RSI
 	depends on HAVE_ARM_SMCCC_DISCOVERY
 	select TSM_REPORTS
+	select TSM_MEASUREMENTS
 	help
 	  The driver provides userspace interface to request and
 	  attestation report from the Realm Management Monitor(RMM).
diff --git a/drivers/virt/coco/arm-cca-guest/main.c b/drivers/virt/coco/arm-cca-guest/main.c
index f97f593da6e3..9bbad43c4669 100644
--- a/drivers/virt/coco/arm-cca-guest/main.c
+++ b/drivers/virt/coco/arm-cca-guest/main.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023 - 2025 ARM Ltd.
  */
 
 #include <linux/arm-rsi-cmds.h>
@@ -9,11 +9,280 @@
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
 #include <linux/device-id/platform.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/tsm.h>
+#include <linux/tsm-mr.h>
 #include <linux/types.h>
 
+#include <crypto/hash.h>
+
+/* MR buffer */
+static u8 *arm_cca_mr_buf;
+
+/**
+ * arm_cca_mrs - ARM CCA measurement register set.
+ *
+ * Defines a static array of measurement registers used by the ARM
+ * Confidential Compute Architecture (CCA). These registers are used
+ * for attestation and runtime integrity tracking.
+ *
+ * Register types:
+ *   - rim: Realm initial measurement register (RIM)
+ *   - rem0–rem3: Runtime extensible measurement registers (REMs)
+ */
+static struct tsm_measurement_register arm_cca_mrs[] = {
+	{ TSM_MR_(rim, SHA256)  | TSM_MR_F_READABLE },
+	{ TSM_MR_(rem0, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem1, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem2, SHA256) | TSM_MR_F_RTMR },
+	{ TSM_MR_(rem3, SHA256) | TSM_MR_F_RTMR }
+};
+
+/**
+ * arm_cca_mr_refresh - Refresh measurement registers for ARM CCA.
+ *
+ * @tm: Pointer to a struct tsm_measurements containing measurement registers.
+ *
+ * Iterates through all measurement registers in @tm and refreshes those
+ * marked with TSM_MR_F_LIVE or TSM_MR_F_READABLE by invoking
+ * rsi_measurement_read() for each.
+ *
+ * Return: 0 on success, or -EINVAL if @tm is NULL or a read operation fails.
+ */
+static int arm_cca_mr_refresh(const struct tsm_measurements *tm)
+{
+	int retval;
+	int index = 0;
+	const struct tsm_measurement_register *mr;
+
+	if (!tm)
+		return -EINVAL;
+
+	while (index < tm->nr_mrs) {
+		mr = &tm->mrs[index];
+
+		/* Skip if the MR is not Live or Readable. */
+		if ((mr->mr_flags & (TSM_MR_F_LIVE | TSM_MR_F_READABLE)) != 0) {
+			retval = rsi_measurement_read(index,
+						      mr->mr_value,
+						      mr->mr_size);
+			if (retval != 0)
+				return -EINVAL;
+		}
+
+		index++;
+	}
+
+	return 0;
+}
+
+/**
+ * arm_cca_mr_extend - Extend a measurement register with new data.
+ *
+ * @tm:   Pointer to the tsm_measurements structure containing measurement
+ *        registers.
+ * @mr:   Pointer to the specific measurement register to extend.
+ * @data: Pointer to the data to be used for extension.
+ *
+ * This function extends a measurement register with new input data.
+ *
+ * Return: 0 on success, or a negative error code (e.g., -EINVAL for invalid
+ * arguments).
+ */
+static int arm_cca_mr_extend(const struct tsm_measurements *tm,
+			     const struct tsm_measurement_register *mr,
+			     const u8 *data)
+{
+	if (!tm || !mr || !data)
+		return -EINVAL;
+
+	return rsi_measurement_extend((mr - tm->mrs), data, mr->mr_size);
+}
+
+/**
+ * arm_cca_measurements - ARM CCA measurement configuration instance.
+ *
+ * This defines the measurement set and behavior for the ARM
+ * Confidential Compute Architecture, enabling measurements
+ * for attestation and runtime validation.
+ */
+static struct tsm_measurements arm_cca_measurements = {
+	.mrs = arm_cca_mrs,
+	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
+	.refresh = arm_cca_mr_refresh,
+	.write = arm_cca_mr_extend,
+};
+
+/**
+ * arm_cca_attr_groups - Attribute groups for the arm_cca_misc_dev miscellaneous
+ * device.
+ *
+ */
+static const struct attribute_group *arm_cca_attr_groups[] = {
+	NULL, /* measurements */
+	NULL
+};
+
+/**
+ * arm_cca_misc_dev - Miscellaneous device for ARM CCA functionality.
+ *
+ */
+static struct miscdevice arm_cca_misc_dev = {
+	.name = KBUILD_MODNAME,
+	.minor = MISC_DYNAMIC_MINOR,
+	.groups = arm_cca_attr_groups,
+};
+
+/**
+ * arm_cca_get_hash_algorithm - Get the hash algorithm and digest size for
+ * a Realm.
+ *
+ * @hash_algo:   Pointer to an int to receive the internal hash algorithm ID
+ *               (e.g., HASH_ALGO_SHA256 or HASH_ALGO_SHA512).
+ * @digest_size: Pointer to an int to receive the digest size in bytes
+ *               (e.g., SHA256_DIGEST_SIZE or SHA512_DIGEST_SIZE).
+ *
+ * This function retrieves the hash algorithm used in a Realm's configuration
+ * by invoking the `rsi_get_realm_config()` interface.
+ *
+ * Return:
+ * * %0        - Success. The hash algorithm and digest size are returned.
+ * * %-ENOMEM  - Memory allocation failed.
+ * * %-EINVAL  - Configuration fetch failed or algorithm is unsupported.
+ *
+ */
+static int arm_cca_get_hash_algorithm(int *hash_algo, int *digest_size)
+{
+	int ret = 0;
+	unsigned long result;
+	struct realm_config *cfg = NULL;
+
+	cfg = alloc_pages_exact(sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	result = rsi_get_realm_config(cfg);
+	if (result != RSI_SUCCESS) {
+		ret = -EINVAL;
+		goto exit_free_realm_config;
+	}
+
+	switch (cfg->hash_algo) {
+	case RSI_HASH_SHA_512:
+		*hash_algo = HASH_ALGO_SHA512;
+		*digest_size = SHA512_DIGEST_SIZE;
+		break;
+	case RSI_HASH_SHA_256:
+		*hash_algo = HASH_ALGO_SHA256;
+		*digest_size = SHA256_DIGEST_SIZE;
+		break;
+	default:
+		/* Unknown/unsupported algorithm. */
+		ret = -EINVAL;
+		break;
+	}
+
+exit_free_realm_config:
+	free_pages_exact(cfg, RSI_GRANULE_SIZE);
+	return ret;
+}
+
+/**
+ * arm_cca_mr_init - Initialize ARM CCA measurement register infrastructure.
+ *
+ * This function sets up the internal data structures for handling ARM CCA
+ * measurement registers (MRs) and creates a sysfs attribute group. It also
+ * registers a miscelaneous device for exposing the Arm CCA measurement
+ * registers to userspace.
+ *
+ * Return:
+ * * %0       - On success.
+ * * %-ENOMEM - if memory allocation fails.
+ * * %-EINVAL - On hash algorithm retrieval or attribute group creation
+ *   failure.
+ */
+static int arm_cca_mr_init(void)
+{
+	const struct attribute_group *g;
+	int ret;
+	int hash_algo;
+	int digest_size;
+	int digest_buf_size;
+
+	/* Retrieve the hash algorithm and digest size. */
+	ret = arm_cca_get_hash_algorithm(&hash_algo, &digest_size);
+	if (ret)
+		return ret;
+
+	/*
+	 * Allocate a single contiguous buffer to hold the digest values
+	 * for all MRs.
+	 */
+	digest_buf_size = ARRAY_SIZE(arm_cca_mrs) * digest_size;
+	u8 *digest_buf __free(kfree) = kzalloc(digest_buf_size, GFP_KERNEL);
+	if (!digest_buf)
+		return -ENOMEM;
+
+	arm_cca_mr_buf = digest_buf;
+
+	/* Initialise the mr_value storage and the mr_size. */
+	for (size_t i = 0; i < ARRAY_SIZE(arm_cca_mrs); ++i) {
+		arm_cca_mrs[i].mr_value = digest_buf + (digest_size * i);
+		arm_cca_mrs[i].mr_size = digest_size;
+		arm_cca_mrs[i].mr_hash = hash_algo;
+	}
+
+	/* Read the measurement registers. */
+	ret = arm_cca_mr_refresh(&arm_cca_measurements);
+	if (ret)
+		return ret;
+
+	/*
+	 * Create a sysfs attribute group to expose the measurements
+	 * to userspace.
+	 */
+	g = tsm_mr_create_attribute_group(&arm_cca_measurements);
+	if (IS_ERR_OR_NULL(g))
+		return PTR_ERR(g);
+
+	/* Initialise the attribute group before registering the misc device. */
+	arm_cca_attr_groups[0] = g;
+
+	/*
+	 * Register a miscelaneous device for exposing
+	 * the Arm CCA measurement registers to userspace.
+	 */
+	ret = misc_register(&arm_cca_misc_dev);
+	if (ret < 0) {
+		tsm_mr_free_attribute_group(g);
+		return ret;
+	}
+
+	arm_cca_mr_buf = no_free_ptr(digest_buf);
+
+	return 0;
+}
+
+/**
+ * arm_cca_mr_cleanup - Unregister sysfs attribute group and free the
+ * measurement digest buffer region.
+ *
+ * @mr_grp: Pointer to the sysfs attribute group.
+ *
+ * This function performs cleanup for the Arm CCA memory registers (MR).
+ *
+ * The function should be called during the teardown or cleanup phase
+ * to ensure proper resource deallocation.
+ */
+static void arm_cca_mr_cleanup(const struct attribute_group *mr_grp)
+{
+	misc_deregister(&arm_cca_misc_dev);
+	tsm_mr_free_attribute_group(mr_grp);
+	kfree(arm_cca_mr_buf);
+}
+
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
  * @granule:		PA of the granule to which the token will be written
@@ -169,10 +438,18 @@ static int cca_tsm_probe(struct arm_smccc_device *sdev)
 	if (!is_realm_world())
 		return -ENODEV;
 
+	ret = arm_cca_mr_init();
+	if (ret < 0) {
+		pr_err("Error %d initialising MRs\n", ret);
+		return ret;
+	}
+
 	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
-	if (ret < 0)
+	if (ret < 0) {
+		arm_cca_mr_cleanup(arm_cca_attr_groups[0]);
 		return dev_err_probe(&sdev->dev,
 				     ret, "Error registering with TSM\n");
+	}
 
 	return 0;
 }
@@ -180,6 +457,7 @@ static int cca_tsm_probe(struct arm_smccc_device *sdev)
 static void cca_tsm_remove(struct arm_smccc_device *sdev)
 {
 	tsm_report_unregister(&arm_cca_tsm_report_ops);
+	arm_cca_mr_cleanup(arm_cca_attr_groups[0]);
 }
 
 static const struct arm_smccc_device_id cca_tsm_id_table[] = {

-- 
2.43.0

