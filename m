Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAD4078DE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922805; cv=none; b=C+H8AKuZpkxWqkJH8fuXL0LtpdmlA2/Zd3ErGDaXex8WU08i304cGHGfChbjIyFTbwSzTH/KL4QEJZ9+0NKJ92OnxPnk4Q5pDbGFSKkyqcRt2mpm3IuS6MYp7WWbqmf0N7zGuLZdBgcrVSdgeK6Q7OsTX5EAqugfxxVhAM8edo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922805; c=relaxed/simple;
	bh=PLPnw7RkYT+ECav+oxnXsGHYbLorD/rJxmBO/n+hXKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgWt79xC286mKmNZ3295wVFHudbAUgIorQbz0Yz2yrq4N1Rcqi6Tlhz7yabxpsG90IAz3YgNdx/W7HhIvaHntnIWX2OPyVp42xppiIGoOWhqV3OORuD5vqe5iHooCj6+Wy9sdidJJIkOyNo94uCalWp9iBlklrevmdOjV/kLmYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=IkPfErRd; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IkPfErRd"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso3276391eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790922802; x=1791527602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=IkPfErRdiu7AwPBuHx4g7ZaDbNSkkcewK8HiyK2OBAOipiFPe5mWZ+BZaNH/enFb1h
         Sjy9KOysYe6DhXs623HtcFJFcqiModLRd7ALOPke5RRBkOPc1iluhFXAx+rLvss+95MS
         haH90i6usO+yZZj7SWtWjBatOR/IZa3yXR0YdFyD6kkl0RmMxa1MAtq+sydYMhgJDQZ0
         srK4XMWg5MzzCrsik9MsRiUhn7H1zQrrRI17pIR7qlOADE0/U0lHYpzDYDqRDA2Scxh1
         sZVftVTGSgfkW0oYnXzecHcP4MVau6e7O98di7lSVZN4zFba9/4zGC/ON5rxAbGSreri
         v0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922802; x=1791527602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsQCM1m1fnFkJf3mOSpgytxAYne0rV7bfE6IaOdnVKQ=;
        b=MIllk7K2lPCGX5Jn38up73pIv6vRS3JZj1Ng+ApX4H7dlHRzTkjjFNkUJ+Rr37Pstj
         0DVgJ1F0ZavhGCYqsCSHuTYC0kkfot1oZruRcxzJWyZj0a+lOw4Yq1EDtzuCuzozfvGT
         y1WSJnriCfHcihd1lRagytlsiyC5OjGrenV8WSPBLw4Ei1FlN1JlVC+pwNwLsCu4mcFX
         B2xd2ud8jFq7Zjh1nTaNkG8gz7N7xeTJubGcOh4nTqnP4dozxE6gJ4OkO3MMfjh9qovq
         j5OJl2pcYlifDs18lIlDHFjR8xdQVD7GOFaS8YU8h8hAWRxoQQ8mjHqfS9nnClJ9AG5u
         sSvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1z9IHQVy0BREeh9x2yAQlsENKbn0adsXF1lm3bZonpIuf+ZTvsfNPgXMRmBx1p5WYO5FVzAqs1It759Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mFNxJT06c1ww2ZullJDGgAfm9qHFJsVE1ajImxEYAy7RPvKWkI
	4wkZYfFC1R+AbvBZ0PBi/ImN4UD+DJ+jxi1et9xI2zhAoxeyfkTjgdWww04CqXvbWMo=
X-Gm-Gg: AYBFou1TTaOPyYuFJejV0L0Lw6eosNgIh6Cq3CEp7bUpTdEoz/7nK6N/GQZzx576Cvw
	Foh+GIS1MbOarF6bb4yQK/13KwZDnfFeCoKGzFBk+JOqKZ3Iyozw4XDIm0KHB0hrhacqXT5CkK1
	NzsA41WDoBmLkEXa4eDvbelsTbZ8+B1NH45y6tENQyjacvRXOarKzeMqTclkNe4EI17gZMVTY3j
	wmeAc/FVnFnG7hEYyQzNagT5XOkguwc6FCuiSQ50FrB2WTB1HJV45PCez33g9WdPsp7XqXoy2DW
	qalJluLNSLXnnZ3LGRgE6Rm5yl6wMCdc+azBMEwPa3l7FCfnmnedVz04z/GR6Agr1oc1kK0zyJv
	/UMohvq7Qt0CR/57yf1RrkaRcoa/fm2Gbii7iMsHMIbnodBPcZsN9LxVJ58CdiJooHCeNbDlOM/
	Kv7kk6cBK5MAGO4qpcyNDFQ+2fmtDyCGjwK+rhOQG5KhrUaxHzRYFDhAOLFmQbxXUqrgBENLWHM
	DzmKafnsVM=
X-Received: by 2002:a05:701b:454c:20b0:150:696:26c4 with SMTP id a92af1059eb24-15006962925mr411174c88.29.1790922802378;
        Thu, 01 Oct 2026 23:33:22 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6315754c88.4.2026.10.01.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:33:21 -0700 (PDT)
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
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v15 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu,  1 Oct 2026 23:33:12 -0700
Message-ID: <20261002063315.1535817-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20261002063315.1535817-1-zong.li@sifive.com>
References: <20261002063315.1535817-1-zong.li@sifive.com>
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
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Kconfig |  1 +
 drivers/iommu/riscv/iommu.c | 58 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  4 +++
 3 files changed, 63 insertions(+)

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
index fe8e6d0f8a23..1cb7369bd962 100644
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
@@ -587,6 +591,46 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
+	auxdev = auxiliary_device_create(iommu->dev, "riscv-iommu",
+					 "pmu", iommu, id);
+	if (!auxdev)
+		return -ENODEV;
+
+	iommu->pmu_dev = auxdev;
+	return 0;
+}
+
+static void riscv_iommu_hpm_disable(struct riscv_iommu_device *iommu)
+{
+	if (!iommu->pmu_dev)
+		return;
+
+	auxiliary_device_destroy(iommu->pmu_dev);
+	iommu->pmu_dev = NULL;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1570,6 +1614,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	riscv_iommu_hpm_disable(iommu);
 	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
@@ -1636,6 +1681,19 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM) {
+		/*
+		 * The IOMMU is fully functional without the PMU, so keep it
+		 * operational if the HPM device cannot be created - but do not
+		 * leave the failure unreported either.
+		 */
+		rc = riscv_iommu_hpm_enable(iommu);
+		if (rc)
+			dev_warn(iommu->dev,
+				 "cannot create HPM device, PMU unavailable: %d\n",
+				 rc);
+	}
+
 	return 0;
 
 err_remove_sysfs:
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 5676001548cc..7fcd79fa47c8 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -19,6 +19,7 @@
 #include "iommu-bits.h"
 
 struct riscv_iommu_device;
+struct auxiliary_device;
 
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
@@ -62,6 +63,9 @@ struct riscv_iommu_device {
 	unsigned int ddt_mode;
 	dma_addr_t ddt_phys;
 	u64 *ddt_root;
+
+	/* PMU auxiliary device; torn down explicitly before MSI teardown */
+	struct auxiliary_device *pmu_dev;
 };
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
-- 
2.43.7

