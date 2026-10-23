Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725435;
	b=MLG++xvMS2x/UF2wEycYUbJOS6J8odajVyUkjaDPRJIJZCubjVoFo94srH1UODtpw3AF
	 yMPonXasD+9TPxxBkpbhCQkGhWZuNxKL3R3aEtL734NrbSz2CSJ51kzbdbW6mhqpNdW37
	 niLlzhHcMGdTCEJdHRDsTI40ecs/s4Z4jKAWFILKlL7UqUiw5vuece455kJkz4wV9Pb8H
	 ZOmZvkjbzuMrTp4wPPLAXHtr8k+tG3rScs4OZI8t9XfblpcYZvfy/qQhgGqSI1bXQU1R1
	 xhDYekWRQ9DYlwSn2XqGY0dn+dL+JF7Pr3ZlI/k8VDPUgBnJI3AvBlphZCCtCvqS5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725435;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=gtx+W44xo1ZwzGpsTsWw/W+cEc1Mponwv80ce0mZe+8=;
	b=BGnpxuTgfbih96gjLbuYhHy3djT7yQReyYS+yamss+7/eY7zxbmxkRDVB6Y1xH9wEs0E
	 eii6LzJhGyLEJlkTnez8Z758/x95r5hWEhaM0uOqloXRbGJKf2OgsEwKZFPAvmh9ToxIx
	 +7oyi0vOq9TCxYSVKbKLLP5oxnMHS7V44efK7pZrG0tqFo5G2s6NpLCMHIwvEmLnOFNi0
	 fdU4nGWKwn9mQCE2KpLcKEwaruU8ADZbAUKa1VP+vV/eskIbO7Fah86jAEz1RvldxaxpZ
	 6tWJI29EK9uu09lS6vfVsW3PHGA8HbnOIp3p73tJIb4gzTizmA2nGagjvbBPgL4BlwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fWo4cWWC;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E1606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fWo4cWWC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725416;
	bh=gtx+W44xo1ZwzGpsTsWw/W+cEc1Mponwv80ce0mZe+8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=fWo4cWWCUYjYE/qx/eLkGaiGJIY21rjGH4e7FtMkEPefqgLbkgIf7NN5lWaIip2Wc
	 gNE0uBUcUvuy71jotzdJxfSKzNYSlK8bkDRirkfLEKpczAEJsZUGTOHDie9f0pQIwt
	 NxAHfNu7gn7piHSPQoKGx1Z7bWbk06C4gt0++zpY=
X-QQ-mid: esmtpsz11t1792725359t42f8dea9
X-QQ-Originating-IP: 7RgGK9DOgKvKQk688Ih1akniNMRZTbSVAxNhnFlyluM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1905336421296564157
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/24] gtrace: Add CoreSight platform core APIs
Date: Fri, 23 Oct 2026 11:14:54 +0800
Message-Id: <20261023031505.2020925-14-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MrYPaBQR8fEOGkt5HjOVBVWMWtLlOv14lFN5duPrkUBtJnU7FlI/O7IY
	8zEOWodDG9IUp0tNYl76ZHYLwOyfYxutBMPlNCFxQqyrn8iD8dMthg/4ZBjxHhJjrNEjwnE
	HLT+ME3ZDZxM3RO6z3yRuf/4M/ekihiG7hg/JAgnV5vZsJZfpv37C0SAlDDE0hnGtITRDbC
	BzqCio8N/PScNyNaw1fIqwqrncBePpggYhTaQuoVdfUDOPnYU1uGVDeVh/CMPJVcvyW4+rA
	76ntdt0ZDSmwe13yONJKPUqr9qMT0R7a0MsBOaUsMIbTmmcPfRLZUcZIe/HrorwnuKBRwog
	pFfQqjtjcMVvVjRMWZTStqarihQNRsHqVLfrWhXb8YaOUEiSuzKtb0LlcK9bV1Qq5Odx9Uq
	zcVmjKfr812d7RNre3xL5THfTc8xlS1sJYAGj2MnNWmCcmex0kk+WcAL+bG8m9aBPMAkSvp
	XnC+wFKFdcwkFDm0rCjSoKNhACv8KQomIZfL4qIlyB9vlfU7J9K7OAKwz404Ja9K3YK29tz
	x0IpE400YoG4dnG12VyF44YOwP2NJpD6WzXRk9OsWU7kmVj8V0UCIHX6zPAYfdBjuusMaJd
	f+PAoB6W4E+zkqAMQ0/95Wsb7CoqV31JL3bz2j/bH/85FSwUeXXCYW/VfqbgQv3k0Uj2495
	I+qbLob0d16gPw3ocLnB0Nne4tfPMmUSzTm5pPwfWDIe+eqxtuNvvA/DI3KZPTHZ94QLVZA
	heUNZ26kV2XWA4C6tmP0h5KAUn5Y3lXfwgVPRFY/CByZryX3j3CVIE413AxW2MPLOdWDHX7
	SHnaUqfUaVRIw5tw6gAtpEvfh2LJDynWBq2j3yYpS0oD3nSl9sbUrNY0FxC4+wWU7nUKiBh
	YSZPLkCt23LPf5Rzu1KOQeIU3m8JM8yQaKhN2aaxtny2u56qniM2mAuFnS38GBTqqL9H7N9
	GTbyWMqko1LYfkafgtDYFlXFNVu5bmAb/t3nX7lSohXHFeHDTbD3HcQcF7mVVx9YxLz42UI
	beIzi9VFmz/QWTDYLLL7bTFM02CCLZXIWSKfXw27RElK9wd33JNwICb6DqavFTiiZnIXTzF
	BuZuea977Yrfj0XLhTYsnM=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Add CoreSight infrastructure for the gtrace framework, providing driver
registration helper, clock management, and other core integration APIs.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig              |  15 +
 drivers/hwtracing/gtrace/Makefile             |   1 +
 drivers/hwtracing/gtrace/coresight-platform.c | 279 ++++++++++++++++++
 drivers/hwtracing/gtrace/coresight.h          | 212 +++++++++++++
 include/linux/gtrace.h                        |   7 +
 5 files changed, 514 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/coresight-platform.c
 create mode 100644 drivers/hwtracing/gtrace/coresight.h

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 3af47d7c3ce3..5dce4474db7c 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -86,3 +86,18 @@ config RVTRACE_ATBBRIDGE
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-atbbridge.
+
+config GTRACE_CORESIGHT
+	tristate "CoreSight Trace Support"
+	depends on RISCV
+	depends on GTRACE
+	select ARM_AMBA
+	help
+	  This provides the CoreSight backend for the generic hardware trace
+	  (gtrace) framework. It provides the CoreSight claim protocol,
+	  component and driver registration helpers, and clock management
+	  used by the individual CoreSight component drivers (TMC, funnel,
+	  etc.) to register CoreSight hardware with the gtrace core.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called coresight.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 3f1dcb5664a2..0833a40c397c 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -11,3 +11,4 @@ rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
+obj-$(CONFIG_GTRACE_CORESIGHT) += coresight-platform.o
diff --git a/drivers/hwtracing/gtrace/coresight-platform.c b/drivers/hwtracing/gtrace/coresight-platform.c
new file mode 100644
index 000000000000..f5a472e86a32
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-platform.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CoreSight platform backend shared functions for the gtrace framework.
+ * Derived from drivers/hwtracing/coresight/coresight-core.c.
+ *
+ * Copyright (c) 2012, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/build_bug.h>
+#include <linux/cpu_pm.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/clk.h>
+#include <linux/gtrace.h>
+#include <linux/property.h>
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/panic_notifier.h>
+
+#include "coresight.h"
+
+/*
+ * When losing synchronisation a new barrier packet needs to be inserted at the
+ * beginning of the data collected in a buffer.  That way the decoder knows that
+ * it needs to look for another sync sequence.
+ */
+const u32 coresight_barrier_pkt[4] = {0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff};
+EXPORT_SYMBOL_GPL(coresight_barrier_pkt);
+
+static u32 coresight_read_claim_tags_unlocked(struct gtrace_component *comp)
+{
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			gtrace_relaxed_read32(comp->pdata, CORESIGHT_CLAIMCLR));
+}
+
+static void coresight_set_self_claim_tag_unlocked(struct gtrace_component *comp)
+{
+	gtrace_relaxed_write32(comp->pdata, CORESIGHT_CLAIM_SELF_HOSTED,
+			       CORESIGHT_CLAIMSET);
+	/* Make sure everyone has seen this */
+	mb();
+}
+
+void coresight_clear_self_claim_tag(struct gtrace_platform_data *pdata)
+{
+	if (pdata->io_mem)
+		CS_UNLOCK(pdata->base);
+	coresight_clear_self_claim_tag_unlocked(pdata);
+	if (pdata->io_mem)
+		CS_LOCK(pdata->base);
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+
+void coresight_clear_self_claim_tag_unlocked(struct gtrace_platform_data *pdata)
+{
+	gtrace_relaxed_write32(pdata, CORESIGHT_CLAIM_SELF_HOSTED,
+			       CORESIGHT_CLAIMCLR);
+	/* Make sure everyone has seen this */
+	mb();
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
+
+/*
+ * coresight_claim_device_unlocked : Claim the device for self-hosted usage
+ * to prevent an external tool from touching this device. As per PSCI
+ * standards, section "Preserving the execution context" => "Debug and Trace
+ * save and Restore", DBGCLAIM[1] is reserved for Self-hosted debug/trace and
+ * DBGCLAIM[0] is reserved for external tools.
+ *
+ * Called with CS_UNLOCKed for the component.
+ * Returns : 0 on success
+ */
+int coresight_claim_device_unlocked(struct gtrace_component *comp)
+{
+	u32 tag;
+	struct gtrace_platform_data *pdata;
+
+	if (WARN_ON(!comp))
+		return -EINVAL;
+
+	pdata = comp->pdata;
+	tag = coresight_read_claim_tags_unlocked(comp);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag_unlocked(comp);
+		if (coresight_read_claim_tags_unlocked(comp) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag_unlocked(pdata);
+		dev_dbg(&comp->dev, "Busy: Couldn't set self claim tag");
+		return -EBUSY;
+
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&comp->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		dev_err_once(&comp->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
+}
+EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
+
+int coresight_claim_device(struct gtrace_component *comp)
+{
+	int rc;
+
+	if (WARN_ON(!comp))
+		return -EINVAL;
+
+	CS_UNLOCK(comp->pdata->base);
+	rc = coresight_claim_device_unlocked(comp);
+	CS_LOCK(comp->pdata->base);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(coresight_claim_device);
+
+/*
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
+ * Called with CS_UNLOCKed for the component.
+ */
+void coresight_disclaim_device_unlocked(struct gtrace_component *comp)
+{
+	if (WARN_ON(!comp))
+		return;
+
+	if (coresight_read_claim_tags_unlocked(comp) == CORESIGHT_CLAIM_SELF_HOSTED)
+		coresight_clear_self_claim_tag_unlocked(comp->pdata);
+	else
+		/*
+		 * The external agent may have not honoured our claim
+		 * and has manipulated it. Or something else has seriously
+		 * gone wrong in our driver.
+		 */
+		dev_WARN_ONCE(&comp->dev, 1, "External agent took claim tag");
+}
+EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
+
+void coresight_disclaim_device(struct gtrace_component *comp)
+{
+	if (WARN_ON(!comp))
+		return;
+
+	CS_UNLOCK(comp->pdata->base);
+	coresight_disclaim_device_unlocked(comp);
+	CS_LOCK(comp->pdata->base);
+}
+EXPORT_SYMBOL_GPL(coresight_disclaim_device);
+
+/*
+ * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
+ * for the given device.
+ *
+ * For ACPI devices, clocks are controlled by firmware, so bail out early in
+ * this case. Also, skip enabling pclk if the clock is managed by the AMBA
+ * bus driver instead.
+ *
+ * atclk is an optional clock, it will be only enabled when it is existed.
+ * Otherwise, a NULL pointer will be returned to caller.
+ *
+ * Returns: '0' on Success; Error code otherwise.
+ */
+int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
+				struct clk **atclk)
+{
+	WARN_ON(!pclk);
+
+	if (has_acpi_companion(dev))
+		return 0;
+
+	if (!dev_is_amba(dev)) {
+		/*
+		 * "apb_pclk" is the default clock name for an Arm Primecell
+		 * peripheral, while "apb" is used only by the CTCU driver.
+		 *
+		 * For easier maintenance, CoreSight drivers should use
+		 * "apb_pclk" as the programming clock name.
+		 */
+		*pclk = devm_clk_get_optional_enabled(dev, "apb_pclk");
+		if (!*pclk)
+			*pclk = devm_clk_get_optional_enabled(dev, "apb");
+		if (IS_ERR(*pclk))
+			return PTR_ERR(*pclk);
+	}
+
+	/* Initialization of atclk is skipped if it is a NULL pointer. */
+	if (atclk) {
+		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
+		if (IS_ERR(*atclk))
+			return PTR_ERR(*atclk);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(coresight_get_enable_clocks);
+
+struct gtrace_platform_data *
+coresight_get_platform_data(struct device *dev)
+{
+	int ret;
+	struct gtrace_platform_data *pdata = NULL;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	pdata->dev = dev;
+	pdata->control_poll_timeout_usecs = 100;
+
+	ret = gtrace_of_parse_outconns(pdata);
+	if (ret) {
+		dev_err_probe(pdata->dev, ret, "failed to parse output connections\n");
+		goto err_out;
+	}
+
+	ret = gtrace_of_parse_inconns(pdata);
+	if (ret) {
+		dev_err_probe(pdata->dev, ret, "failed to parse input connections\n");
+		goto err_out;
+	}
+
+	return pdata;
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(coresight_get_platform_data);
+
+int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name)
+{
+	int ret;
+
+	ret = __amba_driver_register(amba_drv, owner);
+	if (ret) {
+		pr_err("%s: error registering AMBA driver\n", drv);
+		return ret;
+	}
+
+	ret = __platform_driver_register(pdev_drv, owner, mod_name);
+	if (!ret)
+		return 0;
+
+	pr_err("%s: error registering platform driver\n", drv);
+	amba_driver_unregister(amba_drv);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(coresight_init_driver_with_owner);
+
+void coresight_remove_driver(struct amba_driver *amba_drv,
+			     struct platform_driver *pdev_drv)
+{
+	platform_driver_unregister(pdev_drv);
+	amba_driver_unregister(amba_drv);
+}
+EXPORT_SYMBOL_GPL(coresight_remove_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
+MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
+MODULE_AUTHOR("Zane Leung <liangzhen@linux.spacemit.com>");
+MODULE_DESCRIPTION("CoreSight backend for the generic trace framework");
diff --git a/drivers/hwtracing/gtrace/coresight.h b/drivers/hwtracing/gtrace/coresight.h
new file mode 100644
index 000000000000..f369911daace
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CoreSight component register layout and helpers for the gtrace framework.
+ * Derived from drivers/hwtracing/coresight/coresight-priv.h and
+ * include/linux/coresight.h.
+ *
+ * Copyright (c) 2012, The Linux Foundation. All rights reserved.
+ *
+ * CoreSight component register layout and helpers for the CoreSight backend
+ * of the generic trace (gtrace) framework. These definitions are specific to
+ * the CoreSight architecture and must not be used by the generic core.
+ */
+
+#ifndef __LINUX_CORESIGHT_H__
+#define __LINUX_CORESIGHT_H__
+
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include <linux/amba/bus.h>
+
+/*
+ * Coresight management registers (0xf00-0xfcc)
+ * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
+ *		  Trace		registers in PFTv1.1
+ */
+#define CORESIGHT_ITCTRL	0xf00
+#define CORESIGHT_CLAIMSET	0xfa0
+#define CORESIGHT_CLAIMCLR	0xfa4
+#define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
+#define CORESIGHT_AUTHSTATUS	0xfb8
+#define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVTYPE	0xfcc
+
+/*
+ * Coresight device CLAIM protocol.
+ * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
+ */
+#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
+
+/* Peripheral id registers (0xFD0-0xFEC) */
+#define CORESIGHT_PERIPHIDR4	0xfd0
+#define CORESIGHT_PERIPHIDR5	0xfd4
+#define CORESIGHT_PERIPHIDR6	0xfd8
+#define CORESIGHT_PERIPHIDR7	0xfdC
+#define CORESIGHT_PERIPHIDR0	0xfe0
+#define CORESIGHT_PERIPHIDR1	0xfe4
+#define CORESIGHT_PERIPHIDR2	0xfe8
+#define CORESIGHT_PERIPHIDR3	0xfeC
+/* Component id registers (0xFF0-0xFFC) */
+#define CORESIGHT_COMPIDR0	0xff0
+#define CORESIGHT_COMPIDR1	0xff4
+#define CORESIGHT_COMPIDR2	0xff8
+#define CORESIGHT_COMPIDR3	0xffC
+
+#define CORESIGHT_UNLOCK	0xc5acce55
+
+#define BMVAL(val, lsb, msb)    ((val & GENMASK(msb, lsb)) >> lsb)
+
+extern const u32 coresight_barrier_pkt[4];
+#define CORESIGHT_BARRIER_PKT_SIZE (sizeof(coresight_barrier_pkt))
+
+#define CORESIGHT_COMPONENT_ID_VERSION	1
+
+static inline void coresight_insert_barrier_packet(void *buf)
+{
+	if (buf)
+		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
+}
+
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
+#define CORESIGHT_CIDRn(i)	(0xFF0 + ((i) * 4))
+
+static inline u32 coresight_get_cid(void __iomem *base)
+{
+	u32 i, cid = 0;
+
+	for (i = 0; i < 4; i++)
+		cid |= readl(base + CORESIGHT_CIDRn(i)) << (i * 8);
+
+	return cid;
+}
+
+static inline bool is_coresight_device(void __iomem *base)
+{
+	u32 cid = coresight_get_cid(base);
+
+	return cid == CORESIGHT_CID;
+}
+
+#define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
+
+static inline u32 coresight_get_pid(struct gtrace_platform_data *pdata)
+{
+	u32 i, pid = 0;
+
+	for (i = 0; i < 4; i++)
+		pid |= gtrace_relaxed_read32(pdata, CORESIGHT_PIDRn(i)) << (i * 8);
+
+	return pid;
+}
+
+/*
+ * Macros and inline functions to handle CoreSight UCI data and driver
+ * private data in AMBA ID table entries, and extract data values.
+ */
+
+/* coresight AMBA ID, no UCI, no driver data: id table entry */
+#define CS_AMBA_ID(pid)			\
+	{				\
+		.id	= pid,		\
+		.mask	= 0x000fffff,	\
+	}
+
+/* coresight AMBA ID, UCI with driver data only: id table entry. */
+#define CS_AMBA_ID_DATA(pid, dval)				\
+	{							\
+		.id	= pid,					\
+		.mask	= 0x000fffff,				\
+		.data	=  (void *)&(struct amba_cs_uci_id)	\
+			{				\
+				.data = (void *)dval,	\
+			}				\
+	}
+
+/* coresight AMBA ID, full UCI structure: id table entry. */
+#define __CS_AMBA_UCI_ID(pid, m, uci_ptr)	\
+	{					\
+		.id	= pid,			\
+		.mask	= m,			\
+		.data	= (void *)uci_ptr	\
+	}
+#define CS_AMBA_UCI_ID(pid, uci)	__CS_AMBA_UCI_ID(pid, 0x000fffff, uci)
+/*
+ * PIDR2[JEDEC], BIT(3) must be 1 (Read As One) to indicate that rest of the
+ * PIDR1, PIDR2 DES_* fields follow JEDEC encoding for the designer. Use that
+ * as a match value for blanket matching all devices in the given CoreSight
+ * device type and architecture.
+ */
+#define PIDR2_JEDEC			BIT(3)
+#define PID_PIDR2_JEDEC			(PIDR2_JEDEC << 16)
+/*
+ * Match all PIDs in a given CoreSight device type and architecture, defined
+ * by the uci.
+ */
+#define CS_AMBA_MATCH_ALL_UCI(uci)					\
+	__CS_AMBA_UCI_ID(PID_PIDR2_JEDEC, PID_PIDR2_JEDEC, uci)
+
+/* extract the data value from a UCI structure given amba_id pointer. */
+static inline void *coresight_get_uci_data(const struct amba_id *id)
+{
+	struct amba_cs_uci_id *uci_id = id->data;
+
+	if (!uci_id)
+		return NULL;
+
+	return uci_id->data;
+}
+
+static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table, u32 pid)
+{
+	while (table->mask) {
+		if ((pid & table->mask) == table->id)
+			return coresight_get_uci_data(table);
+		table++;
+	};
+	return NULL;
+}
+
+int coresight_claim_device(struct gtrace_component *comp);
+int coresight_claim_device_unlocked(struct gtrace_component *comp);
+void coresight_clear_self_claim_tag(struct gtrace_platform_data *pdata);
+void coresight_clear_self_claim_tag_unlocked(struct gtrace_platform_data *pdata);
+void coresight_disclaim_device(struct gtrace_component *comp);
+void coresight_disclaim_device_unlocked(struct gtrace_component *comp);
+
+struct gtrace_platform_data *coresight_get_platform_data(struct device *dev);
+int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
+				struct clk **atclk);
+
+int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name);
+#define coresight_init_driver(drv, amba_drv, pdev_drv) \
+	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE, KBUILD_MODNAME)
+
+void coresight_remove_driver(struct amba_driver *amba_drv,
+			     struct platform_driver *pdev_drv);
+
+#endif /* __LINUX_CORESIGHT_H__ */
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index ee60585ef65c..e9210b0a73b5 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -33,6 +33,13 @@ enum gtrace_component_type {
 	GTRACE_RVTRACE_RAMSINK,
 	GTRACE_RVTRACE_PIBSINK,
 	GTRACE_RVTRACE_ATBBRIDGE,
+	GTRACE_CORESIGHT_FUNNEL,
+	GTRACE_CORESIGHT_REPLICATOR,
+	GTRACE_CORESIGHT_TMC_ETB,
+	GTRACE_CORESIGHT_TMC_ETR,
+	GTRACE_CORESIGHT_TMC_ETF,
+	GTRACE_CORESIGHT_ETB,
+	GTRACE_CORESIGHT_TPIU,
 	GTRACE_COMPONENT_TYPE_MAX
 };
 
-- 
2.34.1

