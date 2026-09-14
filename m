Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211ED370D71
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789358253; cv=none; b=ZTjvrpjPLcsTrvcJ0Cfc1bn4ZcSou5SfFF0921Xqq2eQ0OaNshMNYQNFItkCKbSHhgSqNuRkvgN/0W87dNyCYB6liTXHKRhujKih+PsdNOOku8TxFZk9TyKE8Dz46uz2L1nXsX6KWzVZ/Z1bSVgIFDDUUYOKLDHS+OD0ZeF8xtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789358253; c=relaxed/simple;
	bh=+mUVJVoWTcwSihXFsPS/Aaf+9RE6k59au5BpO9JogMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfQDwQhKnlwODsDNRtD0hvHu6+kgoNWme0eWz4gxvFZDs+keT4Bua98R/dTm1Y4uK5zKfXpC73qLgDu2vYtR/JRLwkMlljP7g5Lz1xcVFMOVW/hGQXXWsVMtIDe9DRxgXk6nMaod44FmOn0/lQhnx+4Yd+7QmfJu0yS1Pqk7cHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=bwyGroqA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bwyGroqA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2260267a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789358249; x=1789963049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrvUvXmaXknLZjg6fXvk/ZHbd24dkX4SY4AyuffyclQ=;
        b=bwyGroqARlXAb5TGCVpgcO2lbSLgnPxPw+0cim+hR5DoqmdEtxobzdAtt5feucA/2O
         X6fX2W4zYtjFdJoCaOd0fmlvd9pXGpv1RMCVdwObgqy2jDCCAqVjyBXJKPePNo1lpbGC
         Mf2SiOOpDHVNKwAz8XOWh9hSf33vhx857FawMpEljWYMrQToYuF+v1iZlZBMmNm7qBZI
         L5J64TuZ0b42BEFnsf3uhy3PF/WSU0iOLG+8XC5Ua2SSMKi10+sWoqvK+ksdi42Qgsea
         puUN0z6Ch6jIEYRbJwQNznzhLNUmuutiP142opBmytd22OhDnCW2JiCkrp57pIfIHOqd
         o2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358249; x=1789963049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrvUvXmaXknLZjg6fXvk/ZHbd24dkX4SY4AyuffyclQ=;
        b=fc5nEZr0MhtYAx1inkLe1qOCn8q39Guo/6yKPieVZ18YOpELINEsuHoEDiI+1tnKB2
         hKjIlt4B/agtSQxfNW84W0XBuY1jUaPc6s4j97urOihoWcRUPbq73D0ME//a2B6Rirtd
         afZiqXMw3Xrn+uOzKJDtjuZOQR5X2qbAzTvDnND7KzTsVnEFxwuQX8Xmcf3HE7mbLBQ1
         0BTfiL5ocM8D20O1J/Ohso+Nb3116uAiG3R1YV54V4+K+zHq6QFykVOfFxJ4dizWKO/J
         kX9MGAqg4FRX5VdXjLC9M7G2DVpeDv8vZglmTdhEndvF3kEAyIeJuZSBzSiUN+XeEBq+
         cOXg==
X-Forwarded-Encrypted: i=1; AKwUvByC12Ehr8PKEPyo82n6qBRD4aGXeTm8ral6T5p1Sp7XBXhcKUpqWKe5fYpQuwg7nYXDuUEn/WaVOkJPFj4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkRod3n5EQKRE4kKVBBeBzPIhHCKRptd3cDxfZo351ASKru3DD
	vz0peC3PXBMWC154lginN+ul7pLSo1jU2FXswMp3Jv4e9z/P4TCtL8/ydQtpVcY1GYY=
X-Gm-Gg: AYBFou3XARBPihlXF2ZuvZ4bTNaTG1D8GLxN9AyxLUkVveSNLij1FMUnejxSgxQvCsn
	hRUHeaT2MDVFRSQGCzM3fkbRzdDmQGqZfGFwi/p2PIHEg/3L/rMWYeH0T51AsV5FXlihtFCEbC5
	Wv+5ephHFf8+K5rdtQxGyJBVEeGQ3yg0HtHYCM/JPf/wh+aeKyMSqcobmTElrboY/e0VGX8mMHD
	bVYPKqk1Cw/JHSa12umriYs77x/Se8IoeblvTAL70eGVsvNDmdvs9JGspilb1A6AAO+9FMhZhS8
	x9wzM5MggYHrs+sgcK6KkPos0WXCY7RcEo+k5XDHmh3mKyssbtgPqMY1KPPK5NSp8QtBYEgCi/6
	o2ADCD0BuzPzWvJMi3K8tPlUYTZweowWWK/nNQEzduIVgPgsWbLo895TG8wq7KYfBoEeChNB/1r
	FQS8Mbo4we/yLoPBRdpP/16xoqUtiqoK0yxMh0sV6i1Fqg6uE5ckTPDvK6S/Y9MAeVV9TNiFIhe
	0w1qzQZHV4+
X-Received: by 2002:a17:90b:5827:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39dec0bbe04mr2006194a91.18.1789358249365;
        Sun, 13 Sep 2026 20:57:29 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm22862554eec.12.2026.09.13.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:57:28 -0700 (PDT)
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
Subject: [PATCH v11 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Sun, 13 Sep 2026 20:57:22 -0700
Message-ID: <20260914035723.2922057-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260914035723.2922057-1-zong.li@sifive.com>
References: <20260914035723.2922057-1-zong.li@sifive.com>
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
index fe8e6d0f8a23..c7495cc57720 100644
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
@@ -587,6 +591,36 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
@@ -1636,6 +1670,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.43.7

