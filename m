Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412C7558706
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419288; cv=none; b=Fo2aKE5+IkIKEuyS9MrT1isUn8jBk3xVx1qhzzPy6he9L1siyd7Wl8FJVlJPP8mT8ec7qRuzA8uVikFZy4dC/+/TXvZRZRrQsCNy5pv+kq7JcMy3JiK3ewNCpWi5HvQCRzwUTwqwZIUOGr+lcQATrYk68cgjkbtviGiyRagP1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419288; c=relaxed/simple;
	bh=Qj/KOrLam6cR0vuSKEvB+wqowv9AYa/I8qmZE/B97bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YInnRIEIkdue5mHwb33Qtql8RJ87XxaJGYxPrBtlrChn83dWczewhYeHGw+NceNdQ4HR/vkob7N+vH3vH78HtamN5BamhT9M2ssjAIXHMGWriH6I1a8MpSS1coFSmLHHZ64EqOHip37WcUxIev/rDGWHNoFAlgGHdq1oPXzN82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=plknQZAI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="plknQZAI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9071DB5;
	Mon, 19 Oct 2026 07:14:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E94A53F673;
	Mon, 19 Oct 2026 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419285; bh=Qj/KOrLam6cR0vuSKEvB+wqowv9AYa/I8qmZE/B97bU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=plknQZAIg8k+8me6BsmdaNpnMmYAVLsw7r4V+HnFS/9A0L64gsBft6Ne7FweR5RtT
	 44gluh8h7OEpGkKmq15AiLxo9bbVgtJA15VHHSfbLSEVkd46CYmOss/pg9vCubwbHL
	 1dr5+vRTkiIiev+E5LfLOOpJhTOyxGDp+Pb4mjb4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 19 Oct 2026 15:14:35 +0100
Subject: [PATCH RFC 3/3] firmware: arm-firme: TSM_REPORT support using
 FIRME
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-firme_interface-v1-3-27895c9cebaa@arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
In-Reply-To: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5655; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Qj/KOrLam6cR0vuSKEvB+wqowv9AYa/I8qmZE/B97bU=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXNxzJ8/Oqyo+VqzWSuH6vbTaOrx010Y8H3t
 8F6XuiGUrqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlzQAKCRBt1cPRWsUx
 M0uLC/9tvzi4T3MIMk6OA7DsTQ3z5AH8fOKNFxvVozO3QO/i2Ooaw3Z06GQkA1mijMTOnxPz23N
 8xtsWYCOulKoZvBeVFSkoXdY7/I6bHyKNLGTzFZZ+XuEgwZO01Jr/HmKsZHmfrJmXBvQmH78J2k
 t8mzxIOWpQqlj+MbBua0qZTqAaTH4nNCJQrzZcvq+N+nqKdl7Mnr3GrF0MZgU1A9K8tbvDQ+aTN
 Krda4cR5Rgo+wjqXPR17z1yxhngZxidSK5F2nQHq90uYlz9hUueHBuMNDlDVtHxhEWgFQwiKJ2g
 2yV5anUhmjsKK2iTkI3XmvH+fkpTWRRKNkSGsZAepXPGlW6bStiL2LpjkwZUMCJhifnY7F3rvUP
 hkDvufv9tqN+9pbMOoy1zPmX6grkr9wJqrVAgBGq+/GXF9kiiWbxOmzXhsy24SF9A26F0ZLO93L
 TBYvUgAnoGSRaimBEqlo8VHLBCrgEbMheRvyVjl2VAG6EwHT35R7Z4i4HMS6rRknb9xHQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Introduce TSM report support using FIRME with the configfs-tsm module to
provide user interfaces for retrieving an attestation token for host.

When a new report is requested firme driver invokes the appropriate
FIRME interfaces to query an attestation token.

The steps to retrieve an attestation token are as follows:

  1. mount -t configfs . /sys/kernel/config
  2. Generate an attestation token

       cd /sys/kernel/config/tsm/report
       mkdir report0
       dd if=/dev/urandom bs=64 count=1 > report0/inblob
       hexdump -C report0/outblob

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_firme/Kconfig  |  8 ++++
 drivers/firmware/arm_firme/Makefile |  1 +
 drivers/firmware/arm_firme/driver.c |  5 +++
 drivers/firmware/arm_firme/firme.h  |  8 ++++
 drivers/firmware/arm_firme/report.c | 88 +++++++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+)

diff --git a/drivers/firmware/arm_firme/Kconfig b/drivers/firmware/arm_firme/Kconfig
index 7e7a826879f1..44fd9a00e6d1 100644
--- a/drivers/firmware/arm_firme/Kconfig
+++ b/drivers/firmware/arm_firme/Kconfig
@@ -32,3 +32,11 @@ config ARM_FIRME
 
 	  This driver provides the common FIRME framework and service
 	  discovery support for client drivers using FIRME services.
+
+config ARM_FIRME_TSM_REPORT
+	bool "Support TSM report using FIRME"
+	depends on ARM_FIRME && TSM_REPORTS
+	depends on ARM_FIRME = m || TSM_REPORTS = y
+
+config ARM_FIRME_TSM_REPORT_ENABLED
+	def_tristate ARM_FIRME if ARM_FIRME_TSM_REPORT
diff --git a/drivers/firmware/arm_firme/Makefile b/drivers/firmware/arm_firme/Makefile
index dccac0a2b50e..bc4f45d38c91 100644
--- a/drivers/firmware/arm_firme/Makefile
+++ b/drivers/firmware/arm_firme/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_ARM_FIRME) += arm-firme.o
 
 arm-firme-$(CONFIG_ARM_FIRME) := driver.o base.o attest.o
+arm-firme-$(CONFIG_ARM_FIRME_TSM_REPORT_ENABLED) += report.o
diff --git a/drivers/firmware/arm_firme/driver.c b/drivers/firmware/arm_firme/driver.c
index 97ae1f3c0569..f919cbd00970 100644
--- a/drivers/firmware/arm_firme/driver.c
+++ b/drivers/firmware/arm_firme/driver.c
@@ -91,6 +91,10 @@ static int firme_driver_probe(struct arm_smccc_device *sdev)
 	firme_service_info->instance->dev = &sdev->dev;
 	firme_service_info->instance->ops = &firme_ops;
 
+	err = firme_tsm_report_register();
+	if (err)
+		pr_info("Failed to register tsm_report. err: %d\n", err);
+
 	return 0;
 
 err_out:
@@ -104,6 +108,7 @@ static int firme_driver_probe(struct arm_smccc_device *sdev)
 
 static void firme_driver_remove(struct arm_smccc_device *sdev)
 {
+	firme_tsm_report_unregister();
 	kfree(firme_service_info->instance);
 	kfree(firme_service_info);
 	firme_service_info = NULL;
diff --git a/drivers/firmware/arm_firme/firme.h b/drivers/firmware/arm_firme/firme.h
index 34cf40681a64..da6a08edf70c 100644
--- a/drivers/firmware/arm_firme/firme.h
+++ b/drivers/firmware/arm_firme/firme.h
@@ -36,6 +36,14 @@ int firme_status_to_errno(firme_status_t status);
 int firme_base_service_init(struct firme_service_info *info);
 int firme_attest_service_init(struct firme_service_info *info);
 
+#if IS_ENABLED(CONFIG_ARM_FIRME_TSM_REPORT)
+int firme_tsm_report_register(void);
+void firme_tsm_report_unregister(void);
+#else
+static __always_inline int firme_tsm_report_register(void) { return 0; }
+static __always_inline void firme_tsm_report_unregister(void) { }
+#endif
+
 static __always_inline void invoke_firme_service(firme_value_t args,
 						 firme_value_t *res)
 {
diff --git a/drivers/firmware/arm_firme/report.c b/drivers/firmware/arm_firme/report.c
new file mode 100644
index 000000000000..52dd5ef2138e
--- /dev/null
+++ b/drivers/firmware/arm_firme/report.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#define DRIVER_NAME "ARM FIRME"
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/tsm.h>
+
+#include "firme.h"
+
+static bool report_registered;
+
+static int firme_report_new(struct tsm_report *report, void *data)
+{
+	int err;
+	const struct firme_instance *fi;
+	struct firme_attest_info info;
+	void *token;
+	size_t token_size;
+	struct tsm_report_desc *desc = &report->desc;
+
+	fi = data;
+
+	err = fi->ops->attest_ops->get_attest_info(&info);
+	if (err)
+		return err;
+
+	if (desc->inblob_len > info.max_challenge_size)
+		return -EINVAL;
+
+	token_size = info.max_pat_size;
+
+	token = kvzalloc(token_size, GFP_KERNEL);
+	if (!token)
+		return -ENOMEM;
+
+	err = fi->ops->attest_ops->get_platform_attestion_token(desc->inblob,
+								desc->inblob_len,
+								token, &token_size);
+	if (err)
+		goto err_out;
+
+	report->outblob = token;
+	report->outblob_len = token_size;
+
+	return 0;
+
+err_out:
+	kvfree(token);
+
+	return err;
+}
+
+static const struct tsm_report_ops firme_tsm_report_ops = {
+	.name = FIRME_DEV_NAME,
+	.report_new = firme_report_new,
+};
+
+int firme_tsm_report_register(void)
+{
+	int ret;
+	struct firme_instance *fi;
+	struct firme_attest_info info;
+
+	fi = firme_get_instance();
+	if (IS_ERR(fi))
+		return PTR_ERR(fi);
+
+	ret = fi->ops->attest_ops->get_attest_info(&info);
+	if (ret)
+		return ret;
+
+	ret = tsm_report_register(&firme_tsm_report_ops, fi);
+	if (!ret)
+		report_registered = true;
+
+	return ret;
+}
+
+void firme_tsm_report_unregister(void)
+{
+	if (report_registered)
+		tsm_report_unregister(&firme_tsm_report_ops);
+}

-- 
2.43.0

