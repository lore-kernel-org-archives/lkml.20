Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349EE4F6466
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188406; cv=none; b=fmO3BAAFpWhgmN+s37ScfindN32NSg9ZyT/XRjOj1BuZsDbDPbrGPKfVgzMv3Mo1ZB88dfWJesdjPqfcJdoOgI17ur9w8KrL/6v7kIu+9R4xRhzLYhgPZarl2w8i3MrMV/bZX/MlwT04ruD0YK28L17mi+irqLWi4Fn1MPqe/cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188406; c=relaxed/simple;
	bh=FxOkSusMwwgA57maJoZ5Tokkk4uc5SRbCD29XwvmPPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8jXaBnneDvg+4iD3n1wZ7XFLC+Gkw/Y2lA3osAFhwD7/XMQ9RIzQ20F3j6jIdqMEplNrGW/zJJIkNxWwD33aZcRnmG3PUGwwn1nO7xYCI4Goi//gBnqtWZy3ZtUUx2CfvizoaVaUy51wY9CMv4OmvVk1//Ffb5C4yXtmcCGsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyfmv5fS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtDhko34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyfmv5fS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtDhko34"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETSJU3703780
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=erJdfcvgU79
	8yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=; b=Cyfmv5fSow5IUqamY5U95g/c2F8
	JMEWTvooENBKckR0xkuMuycoqLXuhI8oG7f1beDM/WUHpP8fngxw2hHb5TtONZ2S
	i1GNf4RSZcSrV0h59A9k6lSkzE/BH7r1AfoguySj6+tihPhBhzUsifmPH5iGv08F
	v1btixD+edIpLO9nclfapIOQnZIQALEx34W30GUEJ0Mswm+AqNR0HJcbY1n6QlYi
	ZlL4AmFXBDRZ+sGQqrGdif6rgSxexAAu8mJsmI1udBZ4HZH2yZCMfKPe7FflDhmN
	q3OYW1liQU4y4IB4odTOX1D4YEQrORcfQpjGFsOS5pjmKQrp1bucPLnhcIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so615627985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188402; x=1788793202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erJdfcvgU798yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=;
        b=LtDhko34Rf0grsZbya6LeO6skCwEBrJG+/HI5S94ZOJwxtvMeZvSC2+e9Cmux5Lyc2
         Fc4fergY+kava9DnmqEWEgjrkk4HnGmdZ986E2Xi91+aRWyGDpFjREosPtBW/AkF2Npo
         HmtE+vBWXuzNUD5W6Tcp3uuv/42t/MryrUGCVaAhM2r+yeq5D8KGq/z3f+7v7whj7g/c
         8ZLz9kazrFZdf0k7qk842xy7So1fj1YkSAd4CeC7qgY4GssVAVlomNyztNHCjnZELcbe
         /Ej+svWpY7WLM/b0YTAow1XZU349qO4DrEKgNNL6k1HAcQmcSUTAsNsIO5jp4hhPw74g
         svbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188402; x=1788793202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erJdfcvgU798yKk0LLoInQNv2dnmFtm4EhSECQcyWlU=;
        b=UWgLTOmtSFmgXmHaFQHlOaykQgxYMFp1BZIGZ9VOHyW21eAZW81uLZ9m/MP5E0sUeh
         HFZgfsYQFYPh3kXgufQe+a0zNPUwXU2CTXFvO/7j2nzoxtEo0772iP5/GKA9kpunr060
         VHYVYE75yAbX2ojuW7+ySt54w9cFzUF03iojHGFGIyOPlt7A+ckB/ci3NoGoFuFEI3uY
         tsDR0OMs7IbE6tB7sGdjA3TsSBUTINnZcB5a+QY7vcKx/dOytEynUYmwItKNRV5+rf3H
         LRK4Gt90IJ5OX1P9cUGVEe4/MVG46AhEYN2Youjj4gEwZ6sRTRGEzVBDQeOAaSgTaNTs
         KWcA==
X-Gm-Message-State: AFuF++mzWdtcdW2eFXga1k1/OhwAvpliMjh3xrKnfzuYUHlLz8ejbhVZ
	wJ30cMqiUhIH6y9Il4tVsrTow9iQz+jrBQSWCf+ZI6M0DaW/4zMJIgIvthA7X3+u3t1hxOiPUBs
	NzfZeHXPfmrRzSJwB8Ir3pP4H+wQAYK8Jpo8xmMcmcsVLpZ4t+vhRsIriVM8+bGgzHCg=
X-Gm-Gg: AR+sD10XZS0LQNgCezBnOV544aBO8XW6NOAZ1PmXoeHpQEBQIu8B4xNRqpumP95zCuI
	tBl1n5Z27Oc/GLHEW9XAKLf+jFUTn/P34xtgLROdao0KQ7+OH6nuCA1yRemIyETgN+gXqyWALtc
	Iv1/uf5DnpxTvO7kCf3vnkqPpnYmktLY4SV8p/gbPxbnM4ZxqlLr6BNBRhatM7pyeOpD9IKS+hK
	H6G8ullxCvTWeSwRiZ4nHFxb4pESexd/NOylJNEEd1n9j+mwl9hOLHR0phrmipXCI7/ftOLuB7k
	igwICvzL1soTpa3NswNiO5pramfGp5vr/8jKzha6bEu/8goB+fYgWPU/sBOcK5punXMLUHWgYOp
	lRgeoAyE9pGFtCH4taj4AcGYNEkecjc9CTSg=
X-Received: by 2002:a05:620a:1a11:b0:936:9525:e952 with SMTP id af79cd13be357-939481360bfmr214548885a.41.1788188402196;
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a11:b0:936:9525:e952 with SMTP id af79cd13be357-939481360bfmr214540385a.41.1788188401647;
        Mon, 31 Aug 2026 08:00:01 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm219790525e9.1.2026.08.31.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 10/17] iommu/riscv: Reserve an MSI IOVA window for iommufd
Date: Mon, 31 Aug 2026 16:59:36 +0200
Message-ID: <20260831145943.313726-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX7UNEbouhCO/m
 TTumFx8x1rc3yDjXlNM7jmsJgmnaNxfxlg36gmd7zTP8Ulm821LIZglVJ9uH+fUBvw/M6REYyoe
 5k+jVP4pWVFwhpXJ5z1sGlvybUfg790=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BnA8ekc9z0NdPsKvynsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX0Yrn/G46CgcS
 LX+zPZ8S9mH/MYDLsuWzk/xNXd2MjPZ3ntRuGBAajeb99OWU6CD7fpSNo8h6jeXxWCjLVj1Qie1
 VvrFH89apEU1DE270h3o3apD0Rkw2+jxjhvmIEyGUfze+gEEz3iq2I6HH1HPfkyPjFHu0VJEz5G
 qCmmvfo4MhqUwi3vxQmGE9H0NZYXo/s1vk0yJYbDdhJPjAbYqd6vYiHT7eJ9KyzIDh4Ah9Rkpnk
 VZnQaJOhDyKyZb5q+YxhelysGSaPYgeLK9YfUoqdDLM7ta1/SYH356x+AldM4pdw4e0fxYcBihi
 iFFWxT45hBKL0dLD+P2diK6p32B2+02rCvcLvOlJC+g58MjzFfCd3ypxl9rGEY4egKE7zJFnJC9
 /5o/6rW6YER8CNEB5A+PNbdsd7oNc5QJ04IWG82GMOSKPe1pSt6coaXHaaL2+IxrXa+4jFVAYNd
 FvqwDbuRpc4386w3h0A==
X-Proofpoint-ORIG-GUID: MLxNPRbv45FtXPtz_BoV76jaQdsOAZ8_
X-Proofpoint-GUID: MLxNPRbv45FtXPtz_BoV76jaQdsOAZ8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

iommufd requires an IOMMU_RESV_SW_MSI region to allocate stable IOVAs
for MSI targets. Advertise such a region when the device uses an IMSIC
MSI hierarchy so interrupt remapping can map IMSIC pages instead of
falling back to physical addresses.

Reserve one page per possible CPU, sufficient for each supervisor IMSIC
page. Place the window at 128 MiB, matching the established ARM SMMU MSI
IOVA convention rather than introducing an architecture-specific choice.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c             | 20 ++++++++++++++++++++
 drivers/iommu/riscv/iommu.h             |  4 ++++
 drivers/irqchip/irq-riscv-imsic-state.c | 22 ++++++++++++++++++++++
 include/linux/irqchip/riscv-imsic.h     |  6 ++++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e5818ce44515..7c4a250d61ca 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -20,10 +20,12 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/generic_pt/iommu.h>
 
+#include "../dma-iommu.h"
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
@@ -1492,6 +1494,23 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct iommu_resv_region *region;
+
+	if (imsic_dev_has_imsic_msi_parent(dev)) {
+		/* Each hart has one S-mode IMSIC page, a.k.a MSI target page */
+		region = iommu_alloc_resv_region(RISCV_IOMMU_MSI_IOVA_BASE,
+						 (size_t)num_possible_cpus() * PAGE_SIZE,
+						 IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
+						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+		if (region)
+			list_add_tail(&region->list, head);
+	}
+
+	iommu_dma_get_resv_regions(dev, head);
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.capable = riscv_iommu_capable,
@@ -1502,6 +1521,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
 
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..078ed0ea65bc 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,9 +14,13 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/sizes.h>
 
 #include "iommu-bits.h"
 
+/* IOVA base for the SW MSI reservation; same convention as ARM SMMU. */
+#define RISCV_IOMMU_MSI_IOVA_BASE	SZ_128M
+
 struct riscv_iommu_device;
 
 struct riscv_iommu_queue {
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..df38a7670a89 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -64,6 +64,28 @@ const struct imsic_global_config *imsic_get_global_config(void)
 }
 EXPORT_SYMBOL_GPL(imsic_get_global_config);
 
+/**
+ * imsic_dev_has_imsic_msi_parent - Check for an IMSIC MSI parent
+ * @dev: Device to check
+ *
+ * Return: true if @dev's MSI domain or any parent domain is the IMSIC base
+ * domain.
+ */
+bool imsic_dev_has_imsic_msi_parent(struct device *dev)
+{
+	struct irq_domain *domain;
+
+	if (!imsic || !imsic->base_domain)
+		return false;
+
+	for (domain = dev_get_msi_domain(dev); domain; domain = domain->parent)
+		if (domain == imsic->base_domain)
+			return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(imsic_dev_has_imsic_msi_parent);
+
 static bool __imsic_eix_read_clear(unsigned long id, bool pend)
 {
 	unsigned long isel, imask;
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 61af3a5bea09..662cb0442424 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -81,6 +81,7 @@ struct imsic_global_config {
 #ifdef CONFIG_RISCV_IMSIC
 
 const struct imsic_global_config *imsic_get_global_config(void);
+bool imsic_dev_has_imsic_msi_parent(struct device *dev);
 
 #else
 
@@ -89,6 +90,11 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 	return NULL;
 }
 
+static inline bool imsic_dev_has_imsic_msi_parent(struct device *dev)
+{
+	return false;
+}
+
 #endif
 
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
-- 
2.43.0

