Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187D4519B3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978562; cv=none; b=JCe2ILl1rlws36Vk9mEv5hMCs59x8jdfSz3sPIKRqWpzVzoxAS+lW2yXg3ZpPOXfFG7HkupSWLjtNKr0T61nVkxmuug5qj5Vi/pIlx/Nt2ymYc/vuG5eM7bAGQ9Jy5Vf1ZI89ruMFNgs2Ho/PfXKHgLJFrsw7QOy//e9uv8tlKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978562; c=relaxed/simple;
	bh=yYqekLJ/G1t+rbxU0H1jBCLzz7cJv7e+IWYJeGIMiGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4R8v9AelZCSV3ljTdNgQjtlBLSO3IH4Xh4xQKE3Iqf6k8Y87XFaLO5S8IcjRNCRDnIHDvLEN/xaQuzGzan4SXv+nnQm52kLscBUWmoEN40Jtz9Ob1U6DblZFN02UKzJF5NBdaAodcvJl9xnb8ack4nJ400DA9BKSAEUO7eD8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kVjZQEoo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kVjZQEoo"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1891796a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789978560; x=1790583360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=kVjZQEoo2xMP+8riOJtwZPcRRwCwfnELBkDgNMCjYHO4o7qEXqaDP7Ld/h0bVl8sV+
         AH3mNZFY0iexy7+g91fQlHncmy6lUPz06oVzqvksd6fv5RABHFjhhfvtRqPF8mjjxX/u
         VLPHmECEluUAcY/JFTkNGv/qxgRrNG6ompCKzBzJyW1cO2NNRQu+rr0V+X06GBpU1Fz0
         942EGtKC5c9Zie54jU/mL6WjxyQQDOFeYPnsEsDFHECja0kIAVE9h/JmxZxZ8njrZIgM
         qYlVqpLYcpJhuWYlUwfw8Mto92PE/Hr6mHJ2VVr4AJ6Parj5+asWbuIWxmTw1y5x/mKu
         MgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978560; x=1790583360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtF+hEd4zxaSXZ54y5RlnY99ygpvKaq026DcmobuPXU=;
        b=JKUp/ylpnbrA55QK/GodJo3s1ivZXF//4qHKzHxVggpwvNsnTagMvMSnF+povA0mbf
         fAUpqPSEuLZYcWcBTZcvYgSrUnruMB6tdOXEHdhJz0NiDr2uxrzsSn8KGefz+MU+ZZQz
         LgqLh1cJ0pEHlgsyY8/ihUYvjLMkxMEBBqd7n71Y9io9sklJR0nSULiv2qNMbPIwy7/5
         U9PErFCbsVDdgH+fC3EaR9OLyx5ba69Bf0IX33nqX9xPJFnIk4kET8omMGrp5TmNiOzZ
         CYlDn2OssD1cfCdynXATTFlPwS+453Igb9hvdbJiQFjDnSAbLwxQYo5KJ0q1rzEW9NKp
         7N/w==
X-Forwarded-Encrypted: i=1; AKwUvByP6FcbxyQjeaHN+LT/jZA5xFYF5y2bUsWpUiXDiesOYycWC3K3fWB6JcmqjqYCiKktukwJzRhN4ip4AIM=@vger.kernel.org
X-Gm-Message-State: AFuF++mgpzH6K1kPJ+ggV0W2AbTy1kygnf5CKoMOTt6wcuGhH/9Vtrus
	1lDrJdDtg3HWC71Ra67CDsoubmxm4UQhUuEN+FSg0kHY0+HNsEM6U+BQB+PsVkFipa8=
X-Gm-Gg: AYBFou1OP0qIXSkEcSc0WzIIN3YS+ZVJKftzMtBcQGPdj1eZNjDcqxVFMF6vcLBgkKs
	erC3CCvQkgjxrb+6RlRpHIP/OErAzkaQqbguEg92o6Noq3ys8idFN191NmMiCAazPcHviA/C84w
	paXvdV3p7uUJSR83I2rGihmPYTMc4ZQMztbN/AEW8FVnEvPGS2MVHW96QYjh9yEySLZj4h0MbMr
	FrLMbhEYGIJ8AvvBSzCceddehHLPA7ZkbyBBFCXAkyZMBXJNGFMoFmOGCK+bzPANEYw4OaMiSXJ
	KnTQedMMRqoLWFBRtPRW75WUEf4ILiViKFtcw41XE29n0Z/JBzsAe8JFgxZIhqWlfuCQ/v03WkN
	fonRsdC3PiXrNbDAAvD0VBH8PDZDLwqJkkY3HC2FOY5TjNQRtAAS2cg+QjtIh+0P+2UrvVSNRSp
	WYrC6XaCov49LA47sxQu1tuukQMg0x5QrWkYeBOncVCVC+woyO5T5sFywcqEumjaRj4/VIKV7Hh
	VHn1XSSR4I=
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-39e6c69f4e9mr9704408a91.49.1789978559556;
        Mon, 21 Sep 2026 01:15:59 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f16f9csm17151344eec.2.2026.09.21.01.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:15:59 -0700 (PDT)
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
Subject: [PATCH v13 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Mon, 21 Sep 2026 01:15:43 -0700
Message-ID: <20260921081544.1797510-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260921081544.1797510-1-zong.li@sifive.com>
References: <20260921081544.1797510-1-zong.li@sifive.com>
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
 drivers/iommu/riscv/iommu.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  4 ++++
 3 files changed, 53 insertions(+)

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
index fe8e6d0f8a23..3c8f8adba647 100644
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
@@ -1636,6 +1681,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
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

