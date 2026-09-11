Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF839CCF0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108261; cv=none; b=BlMGg51xhRaDKdb2WGX8bRjXSsfGS5eo2PxbVfUigM/n0+ZNQc3hWB/BbuxfnR4+DzEK0vv+SpWUmGXsLxkY8tvbq/JTMNw/W6YH1SFGHJBD6JrmbFOZsI4ZfJR6uNzr4znxRPwvAQM+9V+FF7Mc7wWyDbcJGJaFFa/HPdf7LaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108261; c=relaxed/simple;
	bh=1N0u4QGDF0E8zTrVUubLP7yatSB6NAmP0HgLOmukhmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxSNZJkVTm4MYr8MEF7JyOnVuf0dxBHhJsAVEDiVisdBxXVIAtXr62wTCxk2PczhTg7Tkvuhh7qSkPJJ4nhuUPQBxqmMOsHxpYZTlruLmVCGPuC1Fvf1JPkPT0XAV/rIzIQYYDeUsR08OQpYk6sOyg34VJ31MPDcqdhJIbT82+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=N4O2o4bS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N4O2o4bS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-869ac301739so399151b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789108248; x=1789713048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=N4O2o4bSLOGWLtAymfDl8F53G7y4TkMlldWKW+zCbS+Z8Z66LpNEpIyvmsMEbn5sb+
         LW/GLABu/kJfyAUdKGcxEBuRHYHkhyFWzl7Vp7wzMqJbkQvHHpCTyz2JoXScKYe+RHBa
         6p8MEfXizig/14rwAzH6LVt0f8VBdc9LgDtgidQcQTtM5e3PKLC7HdoPDwKwejGMwkHa
         Ds6Zll7F5ox1UrSNbedP4a48BRahV5PKDHeMDxtmsvPXAIRkTdpHeP0l8xWKQwbt/bI1
         QfCOdmsle3Sq019GooVNm0BdDuxzUdH+Y85VyHIWXu4Phikjt6O9rUGnm5T1wMOvQK7d
         qc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108248; x=1789713048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=G+2x2fjR9MazRzHCnRo4SpC9jKiEYpuZLqQLMcWS0+Tg0+3FRYR8Rj5e3c/MD9BW/z
         hJuKt9O3MmBVjs2/8wFOjr/gEGvHHE+Y2aPQft/UHIUEdyIWLLUciVZPxmHCsGQU6rvb
         r5w1M+rqZlNnJ76dAKg8POYNkBWFQCPYf9VTbbgWJpDZ4jvtojgi3QEjaFcJvADx5Afz
         z4BYfTMvMo744hfMGE673DVt2jg/rdiiwT4OjKaQP7PlLFgmvbZVlWH+++hi3Lb4vdip
         r0inCLTYv473po8SSo7hUo6DBYNppDeITZTWcAx/U7c0c3P6znqlPpB2szS0QdCcD2jW
         DjIQ==
X-Forwarded-Encrypted: i=1; AKwUvByJMWnPjE3tM7MXt/KCaFYGE5uGNrUM4lkujlO6dvaZM+gk0t20Dse9nExz2OdUudlH2o0ZxBkQ3fucCAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nzMJgh0vyP+o5CR/23yQMS7+DBbAZJXhSlKd+JfWEO4B1JjoX2
	E4fARCUhPyCAvhgpechyZxt1j33x2Fkk9s0shKTdTqZgUhd3HiptTe2UJmENOndG2wI=
X-Gm-Gg: AYBFou2Z1jeGd+eTuGbjWOLMxvpBtvtZwOtI7w6CPGlMRSfxIEL9EXySKzVMvmDj63n
	+w76iEqljF6l0LrxUhbpzNX6TnNXCavSRjxmu4Vhjs1hxXKMuYk4xrf+/SIRECHwJhw56ISIanR
	hcAPDj41rtwAigJ7HoUyyRjYk7wRh/lTYBcg/mSxEt3p4avhADr2jLfRU1dIzm8aPYnZCMwzHFd
	6jDLbBuo930p3Vok3hT+Zgi1wYoSifXJD3vbKVsR0VzO4nrUJG7nL0TiTFllffkZZNcD261NTsf
	Rse1LyeRsXdT5W9QpKKnuFGLViBoft8BuTM9OwbXUj6+PlfsgxeqnrQUEtB8nFK040EczT1LrhC
	MU4/9KtaiU6hqLqNN0UovXxfNcNRDjkNMBbLWGrfC8Al2hPnWv8rrva5u8U5GwIZO1jnlgPHiYu
	6bbhFISeXFfM/JN5AI/TCZ/LxaaHZ4e2qdJsxHfNYLsVW2qEl9bdQuYqKJbpwnIkFatR5DY3IoB
	St5/aPtQgc=
X-Received: by 2002:a05:6a20:3c8d:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3daed3c168emr5513943637.23.1789108248408;
        Thu, 10 Sep 2026 23:30:48 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm331152eec.8.2026.09.10.23.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:30:48 -0700 (PDT)
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
Subject: [PATCH v10 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Thu, 10 Sep 2026 23:30:42 -0700
Message-ID: <20260911063043.916844-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260911063043.916844-1-zong.li@sifive.com>
References: <20260911063043.916844-1-zong.li@sifive.com>
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

