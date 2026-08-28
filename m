Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3E3CD8BB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900874; cv=none; b=bgIEpD9yKWooaGr1i+3hAg+3sxCV/NuCDVqt5fyon2UcEyehglHVtftCwcM9HouzcwmWtRY0XloHedE6aIySVbvjluBeIp0Gtq9TWGhcc5DbHkrBrA+aIAJ7/OutkyBJpKTBJOfChXXEjoki4oNzYF5zK6xdRk9Xk98j3FO8AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900874; c=relaxed/simple;
	bh=0OuilxAE+ThUNxpU1Gxpqy4nbLhkHMBngSRff/ONKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9N0qGmW57ccw6ZxdsAmur7M58adhwAYu9s6G3XK38EFwPEJdOe6vLf+3pAAsJHYzeq2HVeep9oSIt+D1Nug49bpzUQXoorxXyDZLJq8lnsJ72IRsZXbs33GbU31/iUPHlUJmb4OJETEa8V4+0i+6m9Gd5KgjoV5pAMQ9ZXo+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=nInMVl58; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nInMVl58"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso781051a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787900872; x=1788505672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=nInMVl58UUobjZ78vZfnjonTcyIG8srheJz6PRzp7HGNwWLy6lqI0VlEea9bgVAbhz
         b59tf+m/ocuz7vjAngACIvq83yrAweK1QNwVWRSTdtqkK7EUIr5jkLBysKBnqaPok3Bk
         L0htsdHKcXjdP7eCY1D9Dk/9dw/rOE71Q3xLeotdvWr2SjxmSX4ngMaSoJXg1H9Io4QN
         MyKylgiftqvKZzJ9UMIjtwWILztZ+iToVtV7FCKLelb2Vq535FSCq1aAodeNJYzCzvyx
         DQ2P6ZaY1q+ltWjXFSrOBprZeFXXs9okZ0577pSYMAttsiwJ0h2yFQvhBcCxFks5tD2t
         Z/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900872; x=1788505672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=r3af/NzfpHesT2M8TjnrVZBA/jLHxgn2K42BB9AJfAbNTZ7Gq25NMFe02rytA5myD1
         QDu9RHXE/hu38Dig5ySD0tc1b6v0cEvldWvcQUSmFbft0F6xrPCU4wSxabdswY9/NhLl
         bx/rU2IImIVqsaCxM7fjZf5lUSWiaL4oDuHiRX5wY/8uackw4Geebe7+QdI6SH94EbVH
         8fUAE1Pk44skLx7Hu1Q6ncQ2a1k7HD0VpCiNY16VZbblXHNLgY4fU7Jjf9YAoOGnvHOT
         /j746sTlp6GUd3HjbMVfQRmAxjPIAwmcS+GFogy9yE52q44+eMLpG+O8gCBhUPWHO2Nl
         Cmxg==
X-Forwarded-Encrypted: i=1; AHgh+RryGzUrv6H8mOdBLEBlqLVb3LGRyMDptsd1r2SKaO/Re5pNpl8YaYuxK5oWugL9KMbXcPtU7/TA3bd3uQE=@vger.kernel.org
X-Gm-Message-State: AFuF++msSb5wPqoAMdNP5nDVb0P3NJIQVf5bbjNKeg4eG9B0xiLT1j+D
	XO62rflI2CIr8J8YjBGbJV9tB9hfNhW7WHpsuEt+xc5gB0XrilbNs0nkGd55a3CmgRI=
X-Gm-Gg: AR+sD12ZXcA0+DdPvncdlfIfV9qmvgOtWRmY5CNj11rJHIpIJQI2yfCu7Gb+sEPqSef
	yr/f5DaTQmwZQObzKHnEMLUKyUwooQinDP6v5GSqVMpktTEK/eOmpRZm9bDz8go07jbHfOOgSHz
	pznpTbBCnnRUlp01aQdK2Uea1l+3D9ln00RuOb/VP2nt6jvv8lJY5A4AlmFCHbQWFxXlI9ZbtbS
	WfUOrXl1srYDe4shv+8LfxNzm2y4IaR/iD3IqateoOMF6uUoMw80H93BixQJthbLSp0Jo2dtE4V
	tBqmMTyVNIYiH/AqpiZiQE+ljSQKichT1tV3atFar69wVB+sjDyqFXmkZfQsoQLuRUvPdpFgPOQ
	tkkidIOxaVhukd0XcMw+/DeQo0UaIy07fZPcQBrmupD9ee6IUCbUfEI8SGjvvuFQhV0OwT528VI
	Ki/a6RW4GDn8OTJOzInixfQkkJNenWV/ariS21mt4VK8gZF+zZ2suhdOKWG+yuVokOHPVADIwA2
	lojxgpl/vM=
X-Received: by 2002:a17:90b:388e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396d0eaabfamr9040736a91.1.1787900871742;
        Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm3156610c88.3.2026.08.28.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:07:51 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v7 1/2] iommu/riscv: create a auxiliary device for HPM
Date: Fri, 28 Aug 2026 00:07:46 -0700
Message-ID: <20260828070747.4009519-2-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260828070747.4009519-1-zong.li@sifive.com>
References: <20260828070747.4009519-1-zong.li@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create an auxiliary device for HPM when the IOMMU supports a
hardware performance monitor.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..8025bf0fb67f 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -10,6 +10,7 @@ config RISCV_IOMMU
 	select GENERIC_PT
 	select IOMMU_PT
 	select IOMMU_PT_RISCV64
+	select AUXILIARY_BUS
 	help
 	  Support for implementations of the RISC-V IOMMU architecture that
 	  complements the RISC-V MMU capabilities, providing similar address
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..7f619971bb70 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -48,6 +49,9 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+/* IOMMU PMU auxiliary device id allocation namespace. */
+static DEFINE_IDA(riscv_iommu_pmu_ida);
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -565,6 +569,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static void riscv_iommu_pmu_id_free(void *data)
+{
+	ida_free(&riscv_iommu_pmu_ida, (unsigned long)data);
+}
+
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+	int id, ret;
+
+	id = ida_alloc(&riscv_iommu_pmu_ida, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = devm_add_action_or_reset(iommu->dev, riscv_iommu_pmu_id_free,
+				       (void *)(unsigned long)id);
+	if (ret)
+		return ret;
+
+	auxdev = __devm_auxiliary_device_create(iommu->dev, "riscv-iommu",
+						"pmu", iommu, id);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1613,6 +1647,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.43.7

