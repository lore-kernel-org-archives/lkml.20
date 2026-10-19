Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79843556FDC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419284; cv=none; b=Fgbs7/kJHCzCtus9I3ZZEwyl3MqGKB4JN5LlYbjas/evKCnbAgjiloSr1HAPeUxZnTZUAa4dA33yiLTgZqWXz/hQjUgy4RSBoaPIR3MQrJXrRwnrFswfGfGCc5wR6vzKMzJb2TijaD9N7pEpYjereBlyJa53NNXrM9otWCgrTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419284; c=relaxed/simple;
	bh=TAFKQRd/NgMT3PWiqICuLx+pDI19mLsdMnYyVkbOMwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seKhecWz730xbLChHhMmRdz+FJx4mMrZNgmGJtPrUYr0uL/0g09Yo5FzDQj8iOdTXqAN9rSQBVPfPP+UQcVIkUNI4v53E1KgpYzHykplaP+IgqUCvVP/kVvYwkOiVI6NcjACj2pIH0wi7xTvcXf7Bo6QoDhbRnF8hIr0Bx9nKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vYoJlAio; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vYoJlAio"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2E91D34;
	Mon, 19 Oct 2026 07:14:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE713F673;
	Mon, 19 Oct 2026 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419281; bh=TAFKQRd/NgMT3PWiqICuLx+pDI19mLsdMnYyVkbOMwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vYoJlAiosaQJwB9uJ/rW9guKGG+vJ+z6GkoCBv4+F++D3iYcVvs/7Wa1pIVa7JL1x
	 pMhTV/5ckkIULhlQduFyInwqpKdhn1XU/0daKOmwC0v9aC4xwwr6/isdzendbWxn/F
	 0J6xel/kHL9ylS2wc1p8gpxguuXNFAsv2pRj2Lmc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 19 Oct 2026 15:14:33 +0100
Subject: [PATCH RFC 1/3] firmware: arm_firme: introduce arm_firme driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-firme_interface-v1-1-27895c9cebaa@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26722; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=TAFKQRd/NgMT3PWiqICuLx+pDI19mLsdMnYyVkbOMwQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXMkhMf1dmYi3cKJTOqoTGV1f3pFoXAqc7o3
 3v9HZWySrmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlzAAKCRBt1cPRWsUx
 MxSIDACd02cyER3r4ITl/pyKWmcYohN3UH7iwpNu0nMlLjPPOJVrbb8Bgq6HfYGhPI4mUAm4+gH
 RzjRJcnaRT+h7lB5ZPpYKpo61MjTEwDBhhB7ACJMWRcEDeoMyBnhZnKs2y6eJpO9GflqKWTvUpt
 fGJkOMRBV04Qfh/MeUjBCqyaNQtKjb1jVCKjZLowgKlhpa7gihTTMlDo6v3wyHNqOGrx9pTrUwr
 y1FBIUyi2mdYWAr7BHdK2HzuD/wk8niUKgZ/minToGUp/OyAjJf1uAASRF9V3mCUWTaWS639Rac
 Q4+VAJxRgxKBythnREhJK07opJp2o+n3lTX//nwQLQnyavGWt5echSt3lqV8IAOs8DyK3bhsuP5
 RjGiujYt/ap9Mxhn50wdo+wTqv4z5Kdcp6HkK1ptnH6uXzsj08giIUVCTaRYch/RUXr405CkJN3
 LL9kS0fdbhVP/JOWk4HR/zvKY0TTT4y28hmZ44foLdWEAZb4kCZzU6oFYwFdq/J3+ku04=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

The Realm Management Extension (FEAT_RME) is part of Arm Confidential
Compute Architecture (CCA) and enables support for dynamic, attestable
trusted execution environments ("Realms") on Arm systems.

Realm management flows depend on EL3 firmware for operations such as
Realm construction, resource allocation and isolation, and attestation
of initial Realm state.

The FIRME defines standard interfaces provided by EL3 firmware to
satisfy these dependencies. These interfaces include:

  - Granule Protection Table management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation token management
  - Integrated device management

Each group of interfaces forms a FIRME service. A base FIRME service
is also defined to provide common concepts, service discovery, and
feature discovery across services.

FIRME interfaces are implemented at the EL3 boundary between the
Non-secure, Realm, and Secure states. They may also be used on systems
without FEAT_RME, for example to provide firmware-based attestation or
security services.

arm_firme driver provides the common FIRME framework and service discovery
support for client drivers using below FIRME services:

  - Base service.
  - Attestation token management.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/Kconfig            |   1 +
 drivers/firmware/Makefile           |   1 +
 drivers/firmware/arm_firme/Kconfig  |  34 ++++++
 drivers/firmware/arm_firme/Makefile |   5 +
 drivers/firmware/arm_firme/attest.c | 172 ++++++++++++++++++++++++++
 drivers/firmware/arm_firme/base.c   | 145 ++++++++++++++++++++++
 drivers/firmware/arm_firme/driver.c | 134 +++++++++++++++++++++
 drivers/firmware/arm_firme/firme.h  |  45 +++++++
 include/linux/arm-smccc.h           |   1 +
 include/linux/arm_firme.h           | 234 ++++++++++++++++++++++++++++++++++++
 10 files changed, 772 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index f1a76d482429..e0c1babea1f8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -297,6 +297,7 @@ config TURRIS_MOX_RWTM_KEYCTL
 endif # TURRIS_MOX_RWTM
 
 source "drivers/firmware/arm_ffa/Kconfig"
+source "drivers/firmware/arm_firme/Kconfig"
 source "drivers/firmware/arm_rmm/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 54755db0cf6e..4ae1550ed73c 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
 obj-y				+= arm_ffa/
+obj-y				+= arm_firme/
 obj-y				+= arm_rmm/
 obj-y				+= arm_scmi/
 obj-y				+= broadcom/
diff --git a/drivers/firmware/arm_firme/Kconfig b/drivers/firmware/arm_firme/Kconfig
new file mode 100644
index 000000000000..7e7a826879f1
--- /dev/null
+++ b/drivers/firmware/arm_firme/Kconfig
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config ARM_FIRME
+	tristate "Arm Firmware Interfaces for Realm Management Extension (FIRME)"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	default n
+	help
+	  The Realm Management Extension (FEAT_RME) is part of Arm Confidential
+	  Compute Architecture (CCA) and enables support for dynamic, attestable
+	  trusted execution environments ("Realms") on Arm systems.
+
+	  Realm management flows depend on EL3 firmware for operations such as
+	  Realm construction, resource allocation and isolation, and attestation
+	  of initial Realm state.
+
+	  The FIRME defines standard interfaces provided by EL3 firmware to
+	  satisfy these dependencies. These interfaces include:
+
+	    - Granule Protection Table management
+	    - IDE key management for PCIe and CXL Root Ports
+	    - Memory Encryption Context management
+	    - Attestation token management
+	    - Integrated device management
+
+	  Each group of interfaces forms a FIRME service. A base FIRME service
+	  is also defined to provide common concepts, service discovery, and
+	  feature discovery across services.
+
+	  FIRME interfaces are implemented at the EL3 boundary between the
+	  Non-secure, Realm, and Secure states. They may also be used on
+	  systems without FEAT_RME, for example to provide firmware-based
+	  attestation or security services.
+
+	  This driver provides the common FIRME framework and service
+	  discovery support for client drivers using FIRME services.
diff --git a/drivers/firmware/arm_firme/Makefile b/drivers/firmware/arm_firme/Makefile
new file mode 100644
index 000000000000..dccac0a2b50e
--- /dev/null
+++ b/drivers/firmware/arm_firme/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_ARM_FIRME) += arm-firme.o
+
+arm-firme-$(CONFIG_ARM_FIRME) := driver.o base.o attest.o
diff --git a/drivers/firmware/arm_firme/attest.c b/drivers/firmware/arm_firme/attest.c
new file mode 100644
index 000000000000..aa57b3b9e623
--- /dev/null
+++ b/drivers/firmware/arm_firme/attest.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#define DRIVER_NAME "ARM FIRME"
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#include <crypto/sha2.h>
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+
+#include "firme.h"
+
+static DEFINE_STATIC_KEY_TRUE(attest_service_disabled);
+
+int firme_attest_service_init(struct firme_service_info *info)
+{
+	firme_value_t ret;
+	u8 max_pat_pgcnt;
+
+	if (!test_bit(FIRME_ATTEST_SERVICE_ID, &info->service_list)) {
+		pr_info("Attestation service is not supported\n");
+		return 0;
+	}
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_VERSION,
+			     .a1 = FIRME_ATTEST_SERVICE_ID,
+			     }, &ret);
+	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
+		goto err_out;
+
+	info->attest_info.version = (u32)ret.a0;
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_FEATURES,
+			     .a1 = FIRME_ATTEST_SERVICE_ID,
+			     .a2 = 0x1,
+			     }, &ret);
+	if (ret.a0 != FIRME_RET_SUCCESS)
+		goto err_out;
+
+	max_pat_pgcnt = FIELD_GET(FIRME_ATTEST_FEAT1_MAX_PAT_PG_CNT_MASK, ret.a1);
+
+	/*
+	 * According to Realm Management Monitor specification, S-PNCRK,
+	 * maximum chanllege size should be 64 bytes (SHA512_DIGEST_SIZE).
+	 * If less than, pad with zero.
+	 */
+	info->attest_info.max_challenge_size = SHA512_DIGEST_SIZE;
+	info->attest_info.max_pat_size = (max_pat_pgcnt + 1) *
+					 info->shared_buf_info.min_size;
+
+	pr_info("FIRME attest service version %d.%d\n",
+		FIRME_MAJOR_VERSION(info->attest_info.version),
+		FIRME_MINOR_VERSION(info->attest_info.version));
+	pr_info("Maximum challenge size: 0x%lx\n",
+		info->attest_info.max_challenge_size);
+	pr_info("Maximum PAT size: 0x%lx\n", info->attest_info.max_pat_size);
+
+	static_branch_disable(&attest_service_disabled);
+
+	return 0;
+
+err_out:
+	static_branch_enable(&attest_service_disabled);
+	clear_bit(FIRME_ATTEST_SERVICE_ID, &info->service_list);
+	return firme_status_to_errno(ret.a0);
+}
+
+static int firme_get_attest_info(struct firme_attest_info *info)
+{
+	if (static_branch_unlikely(&attest_service_disabled))
+		return -EOPNOTSUPP;
+			
+	if (!info)
+		return -EINVAL;
+
+	memcpy(info, &firme_service_info->attest_info,
+	       sizeof(struct firme_attest_info));
+
+	return 0;
+}
+
+static int firme_get_platform_attestion_token(void *challenge,
+					      size_t challenge_size,
+					      void *token, size_t *token_size)
+{
+	firme_status_t status;
+	firme_value_t ret;
+	struct firme_instance *fi;
+	struct firme_attest_info *attest_info;
+	struct firme_shared_buf_info *shbuf_info;
+	void *buffer;
+	size_t alloc_size, buffer_size, buffer_pgcnt;
+	size_t read_size, total_size;
+
+	if (static_branch_unlikely(&attest_service_disabled))
+		return -EOPNOTSUPP;
+
+	shbuf_info = &firme_service_info->shared_buf_info;
+	attest_info = &firme_service_info->attest_info;
+
+	if (!token || !token_size || (*token_size < attest_info->max_pat_size))
+		return -EINVAL;
+
+	if ((challenge_size > attest_info->max_challenge_size) ||
+	    ((challenge_size > 0) && !challenge))
+		return -EINVAL;
+
+	fi = firme_get_instance();
+	if (WARN_ON_ONCE(IS_ERR (fi)))
+		return -EOPNOTSUPP;
+
+	buffer_size = min(attest_info->max_pat_size, shbuf_info->max_size);
+	if (WARN_ON_ONCE(buffer_size & (shbuf_info->min_size - 1)))
+		return -ENOBUFS;
+
+	alloc_size = buffer_size;
+
+	buffer = fi->ops->base_ops->alloc_shared_buffer(&alloc_size,
+							GFP_KERNEL | __GFP_ZERO);
+	if (!buffer)
+		return -ENOMEM;
+
+	if (alloc_size < buffer_size)
+		buffer_size = alloc_size;
+
+	buffer_pgcnt = buffer_size / shbuf_info->min_size;
+
+	if (challenge_size > 0)
+		memcpy(buffer, challenge, challenge_size);
+
+	guard(migrate)();
+
+	total_size = 0;
+
+	do {
+		invoke_firme_service((firme_value_t) {
+				     .a0 = FIRME_ATTEST_PAT_GET,
+				     .a1 = virt_to_phys(buffer),
+				     .a2 = 0,
+				     .a3 = buffer_pgcnt - 1,
+				     .a4 = challenge_size,
+				     .a5 = 0,  /**< binding size must be 0 for normal world. */
+				     }, &ret);
+		status = ret.a0;
+		if ((status != FIRME_RET_SUCCESS) &&
+		    (status != FIRME_RET_INCOMPLETE))
+			break;
+
+		challenge_size = 0;
+		read_size = ret.a1;
+		memcpy(token + total_size, buffer, read_size);
+		total_size += read_size;
+	} while (status == FIRME_RET_INCOMPLETE);
+
+	if (status == FIRME_RET_SUCCESS)
+		*token_size = total_size;
+
+	fi->ops->base_ops->free_shared_buffer(buffer, alloc_size);
+
+	return firme_status_to_errno(status);
+}
+
+struct firme_attest_ops attest_ops = {
+	.get_attest_info = firme_get_attest_info,
+	.get_platform_attestion_token = firme_get_platform_attestion_token,
+};
diff --git a/drivers/firmware/arm_firme/base.c b/drivers/firmware/arm_firme/base.c
new file mode 100644
index 000000000000..b9ffb214cca4
--- /dev/null
+++ b/drivers/firmware/arm_firme/base.c
@@ -0,0 +1,145 @@
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
+#include <linux/mm.h>
+
+#include "firme.h"
+
+int firme_base_service_init(struct firme_service_info *info)
+{
+	firme_value_t ret;
+	unsigned long service_list;
+	u8 shbuf_min_pgs;
+	u16 max_pgcnt;
+	size_t min_size;
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_VERSION,
+			     .a1 = FIRME_BASE_SERVICE_ID,
+			     }, &ret);
+	if (ret.a0 == FIRME_RET_NOT_SUPPORTED)
+		goto err_out;
+
+	info->version = (u32)ret.a0;
+
+	invoke_firme_service((firme_value_t) {
+			     .a0 = FIRME_SERVICE_FEATURES,
+			     .a1 = FIRME_BASE_SERVICE_ID,
+			     .a2 = 0x1,
+			     }, &ret);
+	if (ret.a0 != FIRME_RET_SUCCESS)
+		goto err_out;
+
+	service_list = FIELD_GET(FIRME_BASE_FEAT1_SERVICE_LIST_MASK, ret.a1);
+
+	/* Base service is always supported */
+	info->service_list = (service_list << 1) | 0x1;
+
+	shbuf_min_pgs = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MIN_SZ_MASK, ret.a1);
+	max_pgcnt = FIELD_GET(FIRME_BASE_FEAT1_SH_BUF_MAX_PG_CNT_MASK, ret.a1);
+
+	switch (shbuf_min_pgs) {
+	case FIRME_PGS_4K:
+		min_size = 1UL << 12;
+		break;
+	case FIRME_PGS_16K:
+		min_size = 1UL << 14;
+		break;
+	case FIRME_PGS_64K:
+		min_size = 1UL << 16;
+		break;
+	default:
+		pr_err("Invalid minimum shared buffer size: 0x%x\n", shbuf_min_pgs);
+		return -EINVAL;
+	}
+
+	info->shared_buf_info.min_size = min_size;
+	info->shared_buf_info.max_size = min_size * (max_pgcnt + 1);
+
+	WARN_ON_ONCE(info->shared_buf_info.min_size > info->shared_buf_info.max_size);
+
+	pr_info("FIRME version %d.%d\n", FIRME_MAJOR_VERSION(info->version),
+		FIRME_MINOR_VERSION(info->version));
+	pr_info("shared buffer size: min: 0x%lx, max: 0x%lx\n",
+		info->shared_buf_info.min_size, info->shared_buf_info.max_size);
+
+err_out:
+	return firme_status_to_errno(ret.a0);
+}
+
+static u32 firme_get_version(void)
+{
+	return firme_service_info->version;
+}
+
+static int firme_get_shared_buffer_info(struct firme_shared_buf_info *info)
+{
+	if (!info)
+		return -EINVAL;
+
+	memcpy(info, &firme_service_info->shared_buf_info,
+	       sizeof(struct firme_shared_buf_info));
+
+	return 0;
+}
+
+static void *firme_alloc_shared_buffer(size_t *size, gfp_t gfp_flags)
+{
+	struct firme_shared_buf_info *info;
+	int order, min_order, max_order;
+	size_t alloc_size;
+	struct page *page;
+
+	if (!size || (*size == 0))
+		return NULL;
+
+	info = &firme_service_info->shared_buf_info;
+
+	alloc_size = clamp(*size, info->min_size, info->max_size);
+	min_order = get_order(info->min_size);
+	max_order = min(get_order(alloc_size), MAX_PAGE_ORDER);
+
+	for (order = max_order; order >= min_order; order--) {
+		page = alloc_pages(gfp_flags, order);
+		if (page) {
+			alloc_size = PAGE_SIZE << order;
+			break;
+		}
+	}
+
+	if (!page)
+		return NULL;
+
+	*size = alloc_size;
+
+	return page_address(page);
+}
+
+static void firme_free_shared_buffer(void *buf, size_t size)
+{
+	struct firme_shared_buf_info *info;
+	int order, min_order, max_order;
+
+	info = &firme_service_info->shared_buf_info;
+	min_order = get_order(info->min_size);
+	max_order = min(get_order(info->max_size), MAX_PAGE_ORDER);
+	order = get_order(size);
+
+	WARN_ON_ONCE((order < min_order) || (order > max_order));
+
+	free_pages((unsigned long)buf, order);
+}
+
+struct firme_base_ops base_ops = {
+	.get_version = firme_get_version,
+	.get_shared_buffer_info = firme_get_shared_buffer_info,
+	.alloc_shared_buffer = firme_alloc_shared_buffer,
+	.free_shared_buffer = firme_free_shared_buffer,
+};
diff --git a/drivers/firmware/arm_firme/driver.c b/drivers/firmware/arm_firme/driver.c
new file mode 100644
index 000000000000..97ae1f3c0569
--- /dev/null
+++ b/drivers/firmware/arm_firme/driver.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#define DRIVER_NAME "ARM FIRME"
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#include <asm/cpufeature.h>
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "firme.h"
+
+static struct firme_ops firme_ops;
+
+struct firme_service_info *firme_service_info;
+
+static int firme_status_errno_map[] = {
+	0,		/* FIRME_RET_SUCCESS */
+	-EOPNOTSUPP,	/* FIRME_RET_NOT_SUPPORTED */
+	-EINVAL,	/* FIRME_RET_INVALID_PARAMETER */
+	-ECANCELED,	/* FIRME_RET_ABORTED */
+	-EAGAIN,	/* FIRME_RET_INCOMPLETE */
+	-EACCES,	/* FIRME_RET_DENIED */
+	-EBUSY,		/* FIRME_RET_BUSY */
+	-EALREADY,	/* FIRME_RET_OP_CONFLICT */
+	-EEXIST,	/* FIRME_RET_ALREDAY_EXISTS */
+	-ENOENT,	/* FIRME_RET_NOT_FOUND */
+	-ENOMEM,	/* FIRME_RET_NO_MEMORY */
+	-EBADMSG,	/* FIRME_RET_BAD_DATA */
+};
+
+int firme_status_to_errno(firme_status_t status)
+{
+	int err_idx = -status;
+
+	if (err_idx >= 0 && err_idx < ARRAY_SIZE(firme_status_errno_map))
+		return firme_status_errno_map[err_idx];
+
+	return -EINVAL;
+}
+
+struct firme_instance *firme_get_instance(void)
+{
+	if (IS_ERR(firme_service_info))
+		return ERR_PTR(-ENODEV);
+
+	if (!firme_service_info)
+		return NULL;
+
+	return firme_service_info->instance;
+}
+EXPORT_SYMBOL_GPL(firme_get_instance);
+
+static int firme_driver_probe(struct arm_smccc_device *sdev)
+{
+	int err;
+	u32 smccc_version;
+
+	smccc_version = arm_smccc_get_version();
+	if ((smccc_version < ARM_SMCCC_VERSION_1_2) ||
+	    (cpus_have_final_cap(ARM64_SVE) && (smccc_version < ARM_SMCCC_VERSION_1_3)) ||
+	    (cpus_have_final_cap(ARM64_SME) && (smccc_version < ARM_SMCCC_VERSION_1_4))) {
+		return -EOPNOTSUPP;
+	}
+
+	firme_service_info = kzalloc_obj(struct firme_service_info);
+	if (!firme_service_info) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	err = firme_base_service_init(firme_service_info);
+	if (err)
+		goto err_out;
+
+	err = firme_attest_service_init(firme_service_info);
+	if (err)
+		pr_info("Attestation service is disabled: %d\n", err);
+
+	firme_service_info->instance = kzalloc_obj(struct firme_instance);
+	if (!firme_service_info->instance) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	firme_service_info->instance->dev = &sdev->dev;
+	firme_service_info->instance->ops = &firme_ops;
+
+	return 0;
+
+err_out:
+	if (firme_service_info)
+		kfree(firme_service_info);
+
+	firme_service_info = ERR_PTR(-ENODEV);
+
+	return err;
+}
+
+static void firme_driver_remove(struct arm_smccc_device *sdev)
+{
+	kfree(firme_service_info->instance);
+	kfree(firme_service_info);
+	firme_service_info = NULL;
+}
+
+static const struct arm_smccc_device_id firme_id_table[] = {
+	{ .func_id = FIRME_SERVICE_VERSION, },
+	{ },
+};
+MODULE_DEVICE_TABLE(arm_smccc, firme_id_table);
+
+static struct arm_smccc_driver firme_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = firme_driver_probe,
+	.remove = firme_driver_remove,
+	.id_table = firme_id_table,
+};
+module_arm_smccc_driver(firme_driver);
+
+static struct firme_ops firme_ops = {
+	.base_ops = &base_ops,
+	.attest_ops = &attest_ops,
+};
+
+MODULE_ALIAS("arm-firme");
+MODULE_AUTHOR("Yeoreum Yun <yeoreum.yun@arm.com>");
+MODULE_DESCRIPTION("Arm FIRME Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/firmware/arm_firme/firme.h b/drivers/firmware/arm_firme/firme.h
new file mode 100644
index 000000000000..34cf40681a64
--- /dev/null
+++ b/drivers/firmware/arm_firme/firme.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#ifndef _FIRME_COMMON_H
+#define _FIRME_COMMON_H
+
+#include <linux/arm_firme.h>
+#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/cleanup.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/static_key.h>
+#include <linux/types.h>
+
+typedef struct arm_smccc_1_2_regs firme_value_t;
+typedef int firme_status_t;
+
+struct firme_service_info {
+	u32 version;
+	unsigned long service_list;
+	struct firme_shared_buf_info shared_buf_info;
+	struct firme_attest_info attest_info;
+	struct firme_instance *instance;
+};
+
+extern struct firme_service_info *firme_service_info;
+
+extern struct firme_base_ops base_ops;
+extern struct firme_attest_ops attest_ops;
+
+int firme_status_to_errno(firme_status_t status);
+
+int firme_base_service_init(struct firme_service_info *info);
+int firme_attest_service_init(struct firme_service_info *info);
+
+static __always_inline void invoke_firme_service(firme_value_t args,
+						 firme_value_t *res)
+{
+	arm_smccc_1_2_smc(&args, res);
+}
+
+#endif /* _FIRME_COMMON_H */
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..ad6efb6d223a 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -70,6 +70,7 @@
 #define ARM_SMCCC_VERSION_1_1		0x10001
 #define ARM_SMCCC_VERSION_1_2		0x10002
 #define ARM_SMCCC_VERSION_1_3		0x10003
+#define ARM_SMCCC_VERSION_1_4		0x10004
 
 #define ARM_SMCCC_1_3_SVE_HINT		0x10000
 #define ARM_SMCCC_CALL_HINTS		ARM_SMCCC_1_3_SVE_HINT
diff --git a/include/linux/arm_firme.h b/include/linux/arm_firme.h
new file mode 100644
index 000000000000..4b6dbec0e0d5
--- /dev/null
+++ b/include/linux/arm_firme.h
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Arm Ltd.
+ */
+
+#ifndef _LINUX_ARM_FIRME_H
+#define _LINUX_ARM_FIRME_H
+
+#include <linux/bitfield.h>
+#include <linux/cpuhplock.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+/*
+ * This file provides common defines for Fimware Interface for Realm
+ * Management Extension (FIRME) as specified in
+ * https://developer.arm.com/documentation/den0149/latest
+ */
+
+#define FIRME_SMC(func_num)						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,	\
+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
+
+/*
+ * FIRME base service function ids.
+ */
+#define FIRME_SERVICE_VERSION		FIRME_SMC(0x400)
+#define FIRME_SERVICE_FEATURES		FIRME_SMC(0x401)
+
+/*
+ * FIRME granule management service function ids.
+ */
+#define FIRME_GM_GPI_SET		FIRME_SMC(0x402)
+#define FIRME_GM_GPI_OP_CONTINUE	FIRME_SMC(0x412)
+
+/*
+ * FIRME IDE key mangement service function ids.
+ */
+#define FIRME_IDE_KEYSET_PROG		FIRME_SMC(0x403)
+#define FIRME_IDE_KEYSET_GO		FIRME_SMC(0x404)
+#define FIRME_IDE_KEYSET_STOP		FIRME_SMC(0x405)
+#define FIRME_IDE_KEYSET_POLL		FIRME_SMC(0x406)
+
+/*
+ * FIRME IDE key mangement service function ids.
+ *
+ * NOTE:
+ *   Other functions except FIRME_ATTEST_PAT_GET are not supported 
+ *   by normal world instance.
+ */
+#define FIRME_ATTEST_PAT_GET		FIRME_SMC(0x408)
+
+/*
+ * FIRME error codes.
+ */
+#define FIRME_RET_SUCCESS		(0)
+#define FIRME_RET_NOT_SUPPORTED		(-1)
+#define FIRME_RET_INVALID_PARAMETER	(-2)
+#define FIRME_RET_ABORTED		(-3)
+#define FIRME_RET_INCOMPLETE		(-4)
+#define FIRME_RET_DENIED		(-5)
+#define FIRME_RET_BUSY			(-6)
+#define FIRME_RET_OP_CONFLICT		(-7)
+#define FIRME_RET_ALREADY_EXISTS	(-8)
+#define FIRME_RET_NOT_FOUND		(-9)
+#define FIRME_RET_NO_MEMORY		(-10)
+#define FIRME_RET_BAD_DATA		(-11)
+
+/*
+ * GPI attributes in GPT for FIRME granule management service.
+ */
+#define GPT_GPI_NO_ACCESS		(0x0)
+#define GPT_GPI_SA			(0x4)
+#define GPT_GPI_NSP			(0x5)
+#define GPT_GPI_SECURE			(0x8)
+#define GPT_GPI_NS			(0x9)
+#define GPT_GPI_ROOT			(0xa)
+#define GPT_GPI_REALM			(0xb)
+#define GPT_GPI_NS_BY_NS_OR_ROOT	(0xd)
+#define GPT_GPI_ANY			(0xf)
+#define GPT_GPI_MASK			GENMASK(3, 0)
+
+/*
+ * FIRME version encoding
+ */
+#define FIRME_MAJOR_VERSION_MASK	GENMASK(30, 16)
+#define FIRME_MINOR_VERSION_MASK	GENMASK(15, 0)
+#define FIRME_MAJOR_VERSION(x)		((u16)(FIELD_GET(FIRME_MAJOR_VERSION_MASK, (x))))
+#define FIRME_MINOR_VERSION(x)		((u16)(FIELD_GET(FIRME_MINOR_VERSION_MASK, (x))))
+#define FIRME_PACK_VERSION_INFO(major, minor)			\
+	(FIELD_PREP(FIRME_MAJOR_VERSION_MASK, (major)) |	\
+	 FIELD_PREP(FIRME_MINOR_VERSION_MASK, (minor)))
+
+#define FIRME_VERSION_1_0		FIRME_PACK_VERSION_INFO(1, 0)
+
+#define FIRME_KEYSET_ID_KEYSET_MASK	BIT(0)
+#define FIRME_KEYSET_ID_DIRECTION_MASK	BIT(1)
+#define FIRME_KEYSET_ID_SUBSTREAM_MASK	GENMASK(5, 2)
+#define FIRME_KEYSET_ID_STREAM_MASK	GENMASK(13, 6)
+#define FIRME_KEYSET_ID_ROOT_PORT_MASK	GENMASK(29, 14)
+#define FIRME_KEYSET_ID_SEGMENT_MASK	GENMASK(37, 30)
+#define FIRME_PACK_KEYSET_ID(ks, d, ss_id, s_id, rp_id, sg_id)	\
+	(FIELD_PREP(FIRME_KEYSET_ID_KEYSET_MASK, ks) |		\
+	 FIELD_PREP(FIRME_KEYSET_ID_DIRECTION_MASK, d) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_SUBSTREAM_MASK, ss_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_STREAM_MASK, s_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_ROOT_PORT_MASK, rp_id) |	\
+	 FIELD_PREP(FIRME_KEYSET_ID_SEGMENT_MASK, sg_id))
+
+#define FIRME_PGS_4K			(0)
+#define FIRME_PGS_64K			(1)
+#define FIRME_PGS_16K			(2)
+
+#define FIRME_L0GPTSZ_1GB		(0)
+#define FIRME_L0GPTSZ_16GB		(4)
+#define FIRME_L0GPTSZ_64GB		(6)
+#define FIRME_L0GPTSZ_512GB		(9)
+
+#define FIRME_PPS_4GB			(0)
+#define FIRME_PPS_64GB			(1)
+#define FIRME_PPS_1TB			(2)
+#define FIRME_PPS_4TB			(3)
+#define FIRME_PPS_16TB			(4)
+#define FIRME_PPS_256TB			(5)
+#define FIRME_PPS_4PB			(6)
+#define FIRME_PPS_64PB			(7)
+
+/*
+ * FIRME Base service features.
+ */
+#define FIRME_BASE_FEAT0_FUNC_VERSION		BIT(0)
+#define FIRME_BASE_FEAT0_FUNC_FEATURE		BIT(1)
+#define FIRME_BASE_FEAT0_FUNC_MASK		GENMASK(2, 0)
+
+#define FIRME_BASE_FEAT1_SH_BUF_MIN_SZ_MASK	GENMASK(1, 0)
+#define FIRME_BASE_FEAT1_SH_BUF_MAX_PG_CNT_MASK	GENMASK(15, 2)
+#define FIRME_BASE_FEAT1_SERVICE_LIST_MASK	GENMASK(31, 16)
+
+/*
+ * FIRME Granule management service features.
+ */
+#define FIRME_GM_FEAT0_FUNC_GPI_SET		BIT(0)
+#define FIRME_GM_FEAT0_FUNC_GPI_OP_COUTINUME	BIT(1)
+#define FIRME_GM_FEAT0_FUNC_MASK		GENMASK(3, 0)
+
+#define FIRME_GM_FEAT1_PGS_MASK			GENMASK(1, 0)
+#define FIRME_GM_FEAT1_L0GPTSZ_MASK		GENMASK(5, 2)
+#define FIRME_GM_FEAT1_PPS_MASK			GENMASK(8, 6)
+
+/*
+ * FIRME IDE key management service features.
+ */
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_PROG	BIT(0)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_GO		BIT(1)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_STOP	BIT(2)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_POLL	BIT(3)
+#define FIRME_IDE_KEYSET_FEAT0_FUNC_MASK	GENMASK(3, 0)
+
+/*
+ * FIRME IDE key management service features.
+ */
+#define FIRME_ATTEST_FEAT0_FUNC_PAT_GET		BIT(0)
+#define FIRME_ATTEST_FEAT0_FUNC_MASK		GENMASK(5, 0)
+
+#define FIRME_ATTEST_FEAT1_MAX_PAT_PG_CNT_MASK	GENMASK(7, 0)
+
+/*
+ * FIRME devices
+ */
+#define FIRME_DEV_NAME				"arm-firme"
+
+/*
+ * FIRME Service ID
+ */
+enum firme_service_id {
+	FIRME_BASE_SERVICE_ID = 0,
+	FIRME_GM_SERVICE_ID,
+	FIRME_IDE_KEYSET_SERVICE_ID,
+	FIRME_MEC_SERVICE_ID,
+	FIRME_ATTEST_SERVICE_ID,
+	FIRME_IDEV_SERVICE_ID,
+	FIRME_SERVICE_ID_MAX,
+};
+
+enum firme_ide_type {
+	FIRME_IDE_TYPE_SELECTIVE,
+	FIRME_IDE_TYPE_PCIE_LINK,
+	FIRME_IDE_TYPE_CXL_CACHEMEM,
+};
+
+struct firme_shared_buf_info {
+	size_t min_size;
+	size_t max_size;
+};
+
+struct firme_attest_info {
+	u32 version;
+	size_t max_challenge_size;
+	size_t max_pat_size;
+};
+
+struct firme_base_ops {
+	u32 (*get_version)(void);
+	int (*get_shared_buffer_info)(struct firme_shared_buf_info *info);
+	void *(*alloc_shared_buffer)(size_t *size, gfp_t gfp_flags);
+	void (*free_shared_buffer)(void *buf, size_t size);
+};
+
+struct firme_attest_ops {
+	int (*get_attest_info)(struct firme_attest_info *info);
+	int (*get_platform_attestion_token)(void *challenge, size_t challenge_size,
+					    void *token, size_t *token_size);
+};
+
+struct firme_ops {
+	const struct firme_base_ops *base_ops;
+	const struct firme_attest_ops *attest_ops;
+};
+
+struct firme_instance {
+	struct device *dev;
+	const struct firme_ops *ops;
+};
+
+#if IS_ENABLED(CONFIG_ARM_FIRME)
+extern struct firme_instance *firme_get_instance(void);
+#else
+static __always_inline struct firme_instance *firme_get_instance(void)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
+#endif /* _LINUX_ARM_FIRME_H */

-- 
2.43.0

