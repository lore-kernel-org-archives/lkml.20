Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8643B4BD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513715; cv=none; b=Y732rJxbvreU36bgJ0gvG7ye2Ffgs/f0uHQgj1+76uzSZ2v/L38uvG3HvAtmsA/qvECkgXr3z/iCwVCt3PRUUeAbzRPfvrklvxgwFrHzUaex4devL8Gyi+U8RlqHXLsQBAQQZ5V7mwatxwZa4TECWSjq2ujcIFLUvOX3tPIIbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513715; c=relaxed/simple;
	bh=0OuilxAE+ThUNxpU1Gxpqy4nbLhkHMBngSRff/ONKc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbUUQZyLMyKsN89s4sitzt7rx/YjQIGyL5hYbDlxaOU4lsKcmzTZ8DGBI3ZCQt9CHLiGBSEeZv3D10WI5jCBjGaMfFgvACBG5j7XU+WgLg6V9k27AA0jS6vW1VIyjzrIFc4qBfTTLZ6HVitkakjLPz7NI/PgNyJ4cAgp8yDS1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=J4hgJWlk; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="J4hgJWlk"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4a483a552efso338073b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788513705; x=1789118505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=J4hgJWlkIxgwT9c+X38xhAEgxX6qnB4x5xtmF1uh1zboFgCbMp7rDmqWK0XeNnKlpI
         6rAJ2+ZXreLIbjUS9ZCxsgpXj6OgMVpQTjQ0GexJBcT58LTVOrxMOtk26C/PTxy3K+y4
         Fu+81VG0JVZFvYXs2p4pl9V8SKVIVCyCpFyKhGrlyOWwXx+aqD6SrIXoqWirDzrXjrrD
         Wy1rX17dAGtzVfQLeGQFcS6ngaZa3f05zYAeLFDG4wjpHUf/8gHNSkt7wd/V62oZ4noI
         99asFnwTq10gaxgLpe5EKOgJIuhAPmPD1v/gnLJkyazdhTMrZ4bR2qhdK08WR5Bkl/vp
         veqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513705; x=1789118505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jwxUNr7N+2l26FeCwq48z6QyCIJefuKV/bUVltiLUA=;
        b=mIpYuj84ZnRnfYZRzf3oYMbkXr3h72Ci3OfAIRkgEQ/0YF3rHRviug2/FjU7cvCeym
         alMjVXG6nD1TkyE1LJ7OuaDSnDWf1QCb/vHQzVVHaTRkgBdduFPLU8DNkT/YBPZDOdUX
         hbYagwvgt10i15qwD4xEMyJaAUSFgfd0Bh0DwLNIGSkXphtDHfMBnbiOmsYPuMAfpRTe
         1Ve808XZ4NnOhmP4RthIKDdxB2r+dIxiMWnl++kOpw0HdM+kGlmqfVxM58ghYZlU5Ut+
         7WGTcI8T0oUNwIORITKd0vylO1EgDICuy+H4JCAvx2+v4dLgEe8t5HkBtu7KAwmFdMI4
         Gnaw==
X-Forwarded-Encrypted: i=1; AKwUvBwe/UG4NRrSBUutTioXQtpSylxmLHyUHLH+DLgK8rQhx9DI0LHfKDO7M3nksY6o31CYWE4uxXExZDLD+YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nO8q+YYqYKqduJlhuUY2iERDi1AVDSg0MKQT1lGWNbGU8wxjPd
	w4aeSHbWGsRaKIRc71xFF5rsTTjQcp79nJOIkVYdE0R046k8gyIffJLGmkn+u1dwVLw=
X-Gm-Gg: AYBFou1Czc7UOtSxJLMlo+BdIDJvblnntMohnYEmJCaK32jpK9nYlMbkOBRBvQ9/3j6
	dRtYZCLzeo4rEdD6lWYeaHM9s5mzu1xYWvIq0tQoJ4pjsXjo/UOSgkLgshdsuVdSlWUTV8CVImY
	GFRXgbu9bczdp14zC9tISYOB9ZSRF5i8RTKOCQxbOYTeshzmcD5wmQ+aH1q81fGgw5aqAyLwDFF
	ioS76CuePuN71qFLaXaart06b7QLRYXopswSGk8QukU7OiWe9zQuI2zhJxp28vkf0mh1gLsNmY2
	RpwYhyY1YrmaWNk14T5NpQH0s3EAvSbSVIh0mWiVPrKTw48uNIFXKMdrex//8WcyoA31M+V3quf
	AgDn20G8BYxtscXzfXAlkV+vNOvYEojeldbPt07pXQWVNX4cKVF+np4urb7650XJFZaNt3Zo2RD
	E2C4nbaE5LUk24wegY9MWVliu/o7yL507OczbBgtxQRaalya97tgyn6a6Y2vocD1BVooJ7EAwm
X-Received: by 2002:a05:6820:1c91:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6b6f788e384mr2940609eaf.0.1788513704577;
        Fri, 04 Sep 2026 02:21:44 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm5275575c88.8.2026.09.04.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:21:42 -0700 (PDT)
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
Subject: [PATCH v8 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Fri,  4 Sep 2026 02:21:33 -0700
Message-ID: <20260904092136.113321-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260904092136.113321-1-zong.li@sifive.com>
References: <20260904092136.113321-1-zong.li@sifive.com>
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

