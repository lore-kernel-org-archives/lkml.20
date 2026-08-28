Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F53DDDB3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907507; cv=none; b=FbUx4NSrRbBzKYXJt+x1iNVNqjW8l7ulms/pNiBrntPV3IGaEpDoqiTI494Qo54O/CGKNtCFh2Y68+QQf3xoxQSwzOtNE/sTFMydf1tnm6iIx28HHnPtySSSd5jv9Bv2l+0vN1gJ6KkFgC/rJncFhIx8WyuEXl+aT3AzDBh2NdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907507; c=relaxed/simple;
	bh=0OuilxAE+ThUNxpU1Gxpqy4nbLhkHMBngSRff/ONKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqmZZ//sgCYUxvjvBxYRNPKp3xr4CO1sysquK4ZN4hMGOhWng1F8wMXwCNhOBFjgskFBO6fc+UPtCfmWvU6fQLX9ZWw8Yfge0RndcZGU66MT+H1Pa2FeWqI3O7JqCLWGnw2PlW9IN4J/ya5QwJZlocTTrWz0RzzOwh+s80JnvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Rh2n3wLC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Rh2n3wLC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedf433a99so794176a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787907504; x=1788512304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=Rh2n3wLC1ayEEzDkd5DUTAVtd3gI3JotUY987ulVOT7WP07stpb8lZqbkv5lzpjyum
         7yT3SZmUiYS58rRle0FzyxhUJFtAMtFCYtNa6IseXHeJIs7ifKn/4K1t3PvxwUpZSKFs
         MEYwJ9rXQ6SJuReMDgXNahBRcQx14BxmzqnP23c91ldb+Ks/rA3exJjVwE6GjMw8dlEe
         9x0tCxUxIGjowHocrseQUsPQKOwQJ684bY1rupoJmyDfL8nMQIGtcKWBua3rV/qYJoW6
         3KujAe+MXMaW59pnEEFWTUZLuZOKMHBer49zfRpFtnPe+TpWCMj/ziznKmuWCR0YrrHF
         mItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907504; x=1788512304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=U5JFtvqxkz2m3uPh8wZ8tyA+nmhC5JlFy05ElIrsMAd3+tiloM4mChb4t329RhgPC4
         c2gaLEf+5halclSRNIuMFXRVrHHfHM3t5vbiDMMxW0+VcoIYHpFuBpzXqm6UNlV7Y+T4
         Uee+UxHybf8b+tkxStbV8elSj92zkiCY3eE8HC2OdRAh/a10eebFDFS1YfrGEG4jpZNq
         +YWOJ+w04PGFm5+2D04xgvJU1BFMVmwieDQdKJ3Ql4DVbWjVFydDcOO0DV4uqAWeJaqH
         DlBlFi3aPpuf8gqWidxV1yVlNab7DY0qBiC/bnlQK4TNXzn/mDPFwELvLkTnCBxkfENK
         7lXA==
X-Forwarded-Encrypted: i=1; AHgh+RornOxoTm7JRDBnyfNYYveAJsk1kkqkvLQaZaunFjbRwJwsoq/m21FGFeENhH2Uq+CP3GqiZ9Xv1opztSk=@vger.kernel.org
X-Gm-Message-State: AFuF++mgpLbelTBfQZ7LrOz3YIToV5Q7iOOuFH8lZOKat7LUSKSvIMDb
	AWfakaFZagzcCfL8HjBGtZx4/qY92t8fVnMiKSFcD121lOa5zdwmkRBBBEJpmq9uAwQ=
X-Gm-Gg: AR+sD11CShD2tdDfrgX9OsAX+hb83zPujePmyBw3GSgWsHdox47nMEmdbZhv4o0TS0k
	FI5tUOxufCQ8gi0sF8EfJ4K9wtkwU7X/rPI9jw4OO9L3peT1vBFp9vIrnSg4yTfyj0s0flWsLnJ
	9Yq2JAiIsI4ANsh9r9t4GAzpaDlCHIcHDT1jqQYPHEgWHyHnxfxSTTUm1IgqgxH10i6Q1jfEqOB
	aay1b3TgMj/DHeiT6U9rLvmg0j/v8fQtAMVVZum3D13l4cxYNnO5Bc7Hj0TLVzdcYc6BqA0OlnA
	uTSj/0siH4sRshAXg8iL7VNgjAYC837Och+KdfXelz4DUvknfLqVrVJ5TOs7s/0vHb0cPJqbhk3
	EK+cLO/XgYVG0rPFJUP171K8YoM6H6tOYdyQyq6mHV0HUVOxEMbpN12saY23yBKEoN4rcgqvTdR
	IyHtqpZUwgLq7m6QHNApI+N6xKYnmz3238JK2LiK3Ya+2gXU0F3HIoiqnfYV9iuQuLcFKJ3OJM
X-Received: by 2002:a05:6a20:7345:b0:3d1:7238:33d9 with SMTP id adf61e73a8af0-3d26532756amr10426288637.3.1787907504506;
        Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm3838814eec.26.2026.08.28.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
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
Subject: [PATCH RESEND v7 2/3] iommu/riscv: create a auxiliary device for HPM
Date: Fri, 28 Aug 2026 01:58:16 -0700
Message-ID: <20260828085819.4076449-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260828085819.4076449-1-zong.li@sifive.com>
References: <20260828085819.4076449-1-zong.li@sifive.com>
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

