Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0B33938F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833035; cv=none; b=tF4GN0vH5dUZrA3oRtzz6yJYkd6Ikx4qno1VgPnXjbWtof4FUWzQECV/hrk+6YW+smVhRdp2/HqzgAL2+6wB+T2YT6u6jvp3tkev4nN+ialPTfrq8kjTS/WD7JWW2DKpsNyAN3u9cXTkboTkBxAc5DZGOo9tLJsKCyHgRBXauM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833035; c=relaxed/simple;
	bh=1N0u4QGDF0E8zTrVUubLP7yatSB6NAmP0HgLOmukhmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQKk4RPFxeLptoNPb6K7I9bl/hKOS+aSyu8siO/Qp08GsDro6Y0AuB6NHmtHf6//el8U1AEJB4D5N6zA+mXQIHK0eKy9B1yZGJfOR9d1aYUHlUMxYt5U9P8gNJm2XHNzBIva01kONNfiVhG5RS00O2s+zA1X1blMjejIfbVnN/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XUBC2h8q; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XUBC2h8q"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so3024319a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788833033; x=1789437833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=XUBC2h8qaUcTRJIHRC57Y/p1PkHDBZG9Fdaf6o9xyyxA/pNcxXHs36rnCsLd+3QnkL
         4gx7D5+okQeuoCn7hB9bMYqrZdd+jB0vBGd3Gv9ynuGxAZCa3gIxQxO/mdmfV2F488Qk
         UEyTifsT6y7+IH0P1OHLEsDOBOmMKy0oGarzGyo8KBJ2/0/Y3oLOBqGDTnbvs+9IptB1
         FdNYVvjUqAJmwDyhph5mM1nIcb5fYNxe+ipf0sE/vzC2ahhcaLBv4e2D3E62ks58YfiA
         Vu0ZvO0qsdYsLOtuTYEPil35KYBuGIrZ4EDIwV4nPg6HKJaFdroBmcWMeLzwlRYvLtlo
         Nqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833033; x=1789437833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db3wlFQ7tWb65H2cUA6T2ug5PcDOcaldDbKEP2DhiPU=;
        b=ji8a0qx5bFFKJxUkc4fZRhyOOHXPppXPKt9oJV1wWb/66i+TKycnXxAnl4TUn1zKeN
         J5G3skfPuZyyYhOWMQaFulDBY2fMp69P7UuJbIAAr8JjXhp1XJW4l44/NUj2j2q0sV9o
         0CR0Zbwx/V7bLbA1tjptngMyhY5SY3vShzxLqqTcCqzbAskEMUn4kvYIxvAH+hvC/GS7
         sBy6N401rzsX5e1nARhQ77Gaj/1cKbxdnYsVJNliZxsDX+PQ0kd+AWPyVUNrfbtuvEKM
         PkHvNOzqLDRmB5zXZ6FJKnePvGy8QV0/WMhAJ4/L+D7jT9qNsqcohbcVJ3hJfYvya0Ru
         W/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/ZMITaPQe8/IIJt87jJXYpyZ8BMoyPdBqzMMz3zPRiT7k7yTFAUbPZW3JgCedV6Ll7i9F+R1sCOzlVk4=@vger.kernel.org
X-Gm-Message-State: AFuF++kYhkcivVobehPxJqQed82jFQSm5YzTqFMULUKyp6hHWA+b3vw2
	JAZnnWWXvwb0NTiqPtPMshfiy1sPs8PERMx2z1jKNes+Kz6aROgxkn2Hwb2Wld3X/Mc=
X-Gm-Gg: AYBFou1v5QG8SSHbnaMaMZlTQf0w04c2ZZrN19qt8FhwgLPTo/+Vy4SDinnYbu/7ULY
	akvIUD0A+cnKXtQt/jGC9NGiz9HGM/kqUXs1ipF0/LyYNqZjCeeZGsTX+/BZt6p68ORnzsWAULt
	cD0T9oG1AXSRyK9a+J5hx3bL4a1eQp+as0wrCGdE8WPlbv5oCMgDJT9l/KsumMkuPcwv3hy8nA7
	pdlGD9u3Z0mtOjS4dQFcHWkgYuw+7MgSE8tPMsTVYaJQs99/+G6V7NdoRysaL8q8RW3xnGJisjo
	n/aY4BjWcpSxH/Fsf/Kw9h0+0niBsYCb+1HWHuLlmn65HrdLESztsGQuTolCP51pwIwMHMXSjEJ
	OR2zc+lSme0ZXk8VvdKDqVIW+WLwpYlhGO85nHnw0V2dwB2s9npnNZuL60DeIT3vUjsJ7yNj+TE
	Qt/b0n1921n81dMrPlTp4jS4yBPRU0+ot/Rpg7cJasvpolsBAPwLrps6ez+apjSbLTD/eX5iPy
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr34307454a91.4.1788833033541;
        Mon, 07 Sep 2026 19:03:53 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm893671c88.7.2026.09.07.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:03:53 -0700 (PDT)
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
Subject: [PATCH v9 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Mon,  7 Sep 2026 19:03:45 -0700
Message-ID: <20260908020347.1836653-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260908020347.1836653-1-zong.li@sifive.com>
References: <20260908020347.1836653-1-zong.li@sifive.com>
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

