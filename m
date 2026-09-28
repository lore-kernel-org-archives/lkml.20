Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A144DEC05
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605950; cv=none; b=LQIVj8tz8gY/8EqCL8KihNVA3WXuvC9M0eXZEqP6cCqWoWYZBYrv/PJbjPZUemXvWUl1hk4CIEQkMi8f5RyCO2AC04qJndIl4XRhpiIw4C4IyBmSRbSXtDdbxxPVLY1lWCKbhjAYoJWK/U7Z0LcVAt2P/rq8CmhE6AFluNQbFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605950; c=relaxed/simple;
	bh=QK1xPKGlhjKwDuXR0JG5Ewy7OmgMLc/uz1eHJtBc8+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlD1n7FB2p/bmKRhFO3loSsOyXe3+WTHJbU6Qt+TGmkdERvEZSDG9txQ97/iinE4Ik7qdoapPzDP5cqaxlLevrJwmqd25Nj4hnMfvXeGjHh5lzxoSJ8wwW8m44C2nfUJQK14869XQDkHxscu9A7CPf+aJqVX9BWKarlkLu5w1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8NI/Lob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kB5KTI55; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8NI/Lob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kB5KTI55"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA93C1189333
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tI0/0AlrGk4
	2VaUy8+Xxm3J8luGbxvuymvvOE+J35b8=; b=A8NI/LobiXh3JAgoo9EIqClixRv
	HGKgrcNTY20la81ohTExobt76KZw5Zf+sqOIb+kIrJ5vx+OAdGlKhnVn9PWBVLT1
	/jcH57XUMj7RLl7Smv+Vq3DHFhKObWtmGPMyIsQInCPEgluIUC2HFvQx1rCO2qep
	09zFysoeJ1GamOTXMY3FX/J73ozjUgHowlAfBFfeOwoUW7Gpt0ayPKwZt0kYernI
	HZpoC7BdXpXOaEw+SFquZeaTtQbD8XBPB7g7m1uLI38Y5QyLYS4wVafTbtDnNsKi
	vYn+9bVHZe2FGU7FcC/oMM+E6pnrLTAaZKPGliQTelNmUrtJhw1yiqFPhDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc15xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b2f700b30bso633941137.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605936; x=1791210736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tI0/0AlrGk42VaUy8+Xxm3J8luGbxvuymvvOE+J35b8=;
        b=kB5KTI55V1V20f4Ac2RlOiWR8JD/6v882bKbOY8WCI0qzVHTe3LAWjXJeHx+eet0RK
         wijOsk+repDlx7rcJDZ4ArpbJPmO4u5ip8OsjSfYSfk3h9PpU01TObAzlUl8TnOqD0MC
         raZqvs8SFELOiWg7s7+CvEhehHdR2XVJSK1hzxinQAKEgbB2R8dxDDuZvym4zfAl0alK
         imstvt2kTAlrgrnpGhfsQH6yNkM+FQ5iI5KpoCgrv9uKbbqTBnI9R1W5jOb0XfrqcANN
         iP8s5nwjlApZDNp9oM3HpxBKOL/uB53tFRVLxuO7zvpSL1Hf7CHFRnWL82Y1qMHXv4Yh
         JL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605936; x=1791210736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tI0/0AlrGk42VaUy8+Xxm3J8luGbxvuymvvOE+J35b8=;
        b=G5p1YYhpx2/uax3PbTDB6sGTz+kvwcUbpMucHeHdT9pv6ZHj8LXPqSVmkGiPyrStkV
         PhDcQhOYvRmhg7YlnpQHjUn5nnG8dsKjGx6UjzMGHFSjvYCxQKqrlQ4uVQ9GFuxLY8+j
         oFfvmUYwfvu6NpjL93TRb/Ee2x8T6vC3GJPJ3UxZMxqxXF9REmgjpmmUwoQa/ev736GO
         7buyzavAzUiHQ5eEGXl8D1TXQ+kcbQofnhZu340OuzgZVR7Y81109POLTywHIxqFPx5y
         zehdHrwKd1JvfPabsiVJiQHh+yH/kUzld0aTt6qMWGgCPRr1SM1++OQ4irhpJvXQomxr
         hI0A==
X-Forwarded-Encrypted: i=1; AKwUvBzTd3+IkO4gt3ucDTlyt8wb/+fOwAhbg/WwR9KOLhyNgo3sNnOQR+TWkmA4BPh2heToclbVQjJt0e4HyCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcdzuOP2B7tscbfaAQwRlEutkcxiWPbmga1AHJ/UmgK9HqzTku
	whEiNuVJoLg9Rbw6J6bl00O0evbUo1guLafkTFtB/Al/GW5/G+3OlfOX/cvxNm6nFp5Dv9z/Nv8
	UqDtBXvAXSQ8Bod3Ym8Z3Rhu3wmEB6HUpImQbxnXGgZiRKt40IBKgbCVegF8tFeAK00Y=
X-Gm-Gg: AYBFou3y5vOT2DgJafee9ELVNKPVxa9WQFnw59RM0MfzpLn7ZrHOmtwnjxPWPeB3kvi
	qyfiRD9YFnBIrrRnT0kQNK8tDHgEEaXsGoQ8SlN4XeCOaq8x7REVoAgat+w7b8y1iTUUqWWlTh2
	AacC/UnjfWYI8szZMhZD3i94siuOy9kBNvmAmqjp1ncdVOmBqU9Zhk4nZjxXP2W4eHGWFVVPKTE
	bh6vRew/PnfPN+p2OpGPmVM3nKcQkUTWXOfEKU14A4FvHMLuOiLD8wtXB8b51EMLbvou+masVFL
	Tkxn6tqGZTogYOIezaACXTXUCznsM6b/wjbFkqYB2lE/YEvw8n8hxEIIyt5DkXu42AfPclYyjlP
	VJQcoil7XnBROvxyis4iuaK2Gu15hIhPqZpE3Cw==
X-Received: by 2002:a05:6102:548a:b0:7b8:1a1b:8e79 with SMTP id ada2fe7eead31-7b81a1b939bmr496629137.0.1790605936223;
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:7b8:1a1b:8e79 with SMTP id ada2fe7eead31-7b81a1b939bmr496616137.0.1790605935660;
        Mon, 28 Sep 2026 07:32:15 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4296245a12.14.2026.09.28.07.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 10/14] iommu/riscv: Add IRQ domain for interrupt remapping
Date: Mon, 28 Sep 2026 16:31:09 +0200
Message-ID: <20260928143113.49838-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba7a71 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=35qlKtXXEZa0C2bHkQ4A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: U8hDAggafp0Wm7OETa0yAsYfbBj35GHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXwVbZ9sEbCw2D
 bu7MO5pQZoWTMCpV4BXO1rYFw8+d2VPpY15umQYkLKl2ndvt9/PUISwwBJcDnVoc7zAL4e0Yqy7
 RvtaeURE3CzrkUNB4RsAZSwsoKP/cpZduDwWk3wk6e8PF8aF5SRVBfPnL3xHoDO2xG57pbbvzbt
 CI6pNCBTmF+MJgYzce/mcHB5Obc9izxWycSvzIpXGyIYlewdi5hx9fWsWz3HekVeMvJrVInV11s
 oHzuPmbf2pAPQ04L+VblxVOPskb1noI8FnmbKt1HRrmp/ZfpIrKZctY4lno8VfYM6vDWup4FOhS
 JuXoyXE7bVtIQspQ0+fVP/ARMYor/2Ey0tjw0lg82l4+t+EvaTFEOO9hWUMlwLmpoO6/W5ou+60
 O1egqP49K0aSZ9KpBOzo8mxpainw4tJR89alBR/Y4/faD7RKSPWHmH4wsBSoHuXt2AZV9kJ29B7
 MsIVH8DpXLA2Gca1E3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX42d4uWUKKF/w
 jpvJLoVrXJkMiEyQXEjlQzGoVS1MQ6dlrtp/RSft/I2YMp9YZEVBlzC38cYlgXMaHGQkhWhSPsD
 N5R9VhzkhPkJsVLaCZUfAPR+WwXmrEU=
X-Proofpoint-ORIG-GUID: U8hDAggafp0Wm7OETa0yAsYfbBj35GHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280057

Create a per-IOMMU MSI parent irqdomain as the hierarchy hook for
future interrupt remapping. The remapping tables will be owned by the
attached paging domain since the MSI mappings live in its MSI table.

The IRQ domain is created lazily from probe_device(), installed on
eligible devices for their managed lifetime, and removed with the
physical IOMMU. This is only the initial skeleton: it does not remap
interrupts yet, and non-paging IOMMU domains will fall back to the raw
IMSIC physical address when remapping is added.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/Makefile            |   1 +
 drivers/iommu/riscv/iommu-ir.c          | 148 ++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c             |  25 ++--
 drivers/iommu/riscv/iommu.h             |  36 ++++++
 drivers/irqchip/irq-riscv-imsic-state.c |   6 +
 include/linux/irqchip/riscv-imsic.h     |   8 ++
 6 files changed, 213 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index b5929f9f23e6..891810146fce 100644
--- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += iommu.o iommu-platform.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
+obj-$(CONFIG_RISCV_IMSIC) += iommu-ir.o
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
new file mode 100644
index 000000000000..c5603cb9f258
--- /dev/null
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IOMMU Interrupt Remapping
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+#include <linux/cleanup.h>
+#include <linux/irqchip/riscv-imsic.h>
+#include <linux/msi.h>
+#include <linux/slab.h>
+
+#include "iommu.h"
+
+static struct irq_chip riscv_iommu_ir_irq_chip = {
+	.name			= "IOMMU-IR",
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
+static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
+						unsigned int irq_base, unsigned int nr_irqs,
+						void *arg)
+{
+	int ret;
+
+	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < nr_irqs; i++) {
+		ret = irq_domain_set_hwirq_and_chip(irqdomain, irq_base + i,
+						    irq_base + i,
+						    &riscv_iommu_ir_irq_chip, NULL);
+		if (ret) {
+			irq_domain_free_irqs_parent(irqdomain, irq_base, nr_irqs);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
+	.alloc			= riscv_iommu_ir_irq_domain_alloc_irqs,
+	.free			= irq_domain_free_irqs_parent,
+};
+
+static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
+	.prefix			= "IR-",
+	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
+				  MSI_FLAG_PCI_MSIX,
+	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
+	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
+};
+
+static struct irq_domain *riscv_iommu_ir_irq_domain_create(struct riscv_iommu_device *iommu,
+							   struct irq_domain *irqparent)
+{
+	char *fwname __free(kfree) = NULL;
+	struct irq_domain *irqdomain;
+	struct fwnode_handle *fn;
+
+	fwname = kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(iommu->dev));
+	if (!fwname)
+		return ERR_PTR(-ENOMEM);
+
+	fn = irq_domain_alloc_named_fwnode(fwname);
+	if (!fn)
+		return ERR_PTR(-ENOMEM);
+
+	irqdomain = irq_domain_create_hierarchy(irqparent, 0, 0, fn,
+						&riscv_iommu_ir_irq_domain_ops, iommu);
+	if (!irqdomain) {
+		irq_domain_free_fwnode(fn);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * The RISC-V IOMMU doesn't validate MSI data, so we can't set
+	 * IRQ_DOMAIN_FLAG_ISOLATED_MSI. The means VFIO requires its
+	 * allow_unsafe_interrupts module parameter.
+	 */
+	irqdomain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
+	irqdomain->msi_parent_ops = &riscv_iommu_ir_msi_parent_ops;
+	irq_domain_update_bus_token(irqdomain, DOMAIN_BUS_MSI_REMAP);
+
+	return irqdomain;
+}
+
+void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_device *iommu)
+{
+	struct irq_domain *irqdomain = iommu->irqdomain;
+	struct fwnode_handle *fn;
+
+	if (!irqdomain)
+		return;
+
+	fn = irqdomain->fwnode;
+	irq_domain_remove(irqdomain);
+	iommu->irqdomain = NULL;
+	irq_domain_free_fwnode(fn);
+}
+
+int riscv_iommu_ir_probe_device(struct riscv_iommu_device *iommu, struct device *dev,
+				struct riscv_iommu_info *info)
+{
+	struct irq_domain *msi_parent = dev_get_msi_domain(iommu->dev);
+	struct irq_domain *irqdomain;
+
+	info->old_msi_parent = NULL;
+
+	if (iommu->fctl & RISCV_IOMMU_FCTL_WSI)
+		msi_parent = imsic_get_base_domain();
+	else if (!imsic_dev_has_imsic_msi_parent(iommu->dev))
+		return 0;
+
+	if (!msi_parent || dev_get_msi_domain(dev) != msi_parent)
+		return 0;
+
+	irqdomain = iommu->irqdomain;
+	if (!irqdomain) {
+		irqdomain = riscv_iommu_ir_irq_domain_create(iommu, msi_parent);
+		if (IS_ERR(irqdomain))
+			return PTR_ERR(irqdomain);
+		iommu->irqdomain = irqdomain;
+	} else if (irqdomain->parent != msi_parent) {
+		return 0;
+	}
+
+	if (!device_link_add(dev, iommu->dev, DL_FLAG_AUTOREMOVE_SUPPLIER))
+		return -ENODEV;
+
+	info->old_msi_parent = msi_parent;
+	dev_set_msi_domain(dev, irqdomain);
+
+	return 0;
+}
+
+void riscv_iommu_ir_release_device(struct device *dev, struct riscv_iommu_info *info)
+{
+	if (info->old_msi_parent)
+		dev_set_msi_domain(dev, info->old_msi_parent);
+}
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index db4539fbcb95..7a8b40d311ea 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -869,13 +869,6 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/* Private IOMMU data for managed devices, dev_iommu_priv_* */
-struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
-	struct riscv_iommu_dc dc;
-	unsigned int nr_forwarded_irqs;
-};
-
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain;
@@ -1465,13 +1458,15 @@ static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
 }
 
 static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
-				       struct riscv_iommu_device *iommu)
+				       struct riscv_iommu_device *iommu,
+				       struct riscv_iommu_info *info)
 {
 	struct riscv_iommu_msi_table *msi_table = &domain->msi_table;
 	struct riscv_iommu_msipte *root;
 	size_t size;
 
-	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT))
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT) ||
+	    !riscv_iommu_ir_device_enabled(info))
 		return 0;
 
 	guard(mutex)(&domain->mutex);
@@ -1544,7 +1539,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
 			return -ENODEV;
 
-		ret = riscv_iommu_msi_table_alloc(domain, iommu);
+		ret = riscv_iommu_msi_table_alloc(domain, iommu, info);
 		if (ret)
 			return ret;
 
@@ -1811,8 +1806,8 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_info *info;
 	struct riscv_iommu_dc *dc;
+	int i, ret;
 	u64 tc;
-	int i;
 
 	if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
 		return ERR_PTR(-ENODEV);
@@ -1847,6 +1842,12 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 		WRITE_ONCE(dc->tc, tc);
 	}
 
+	ret = riscv_iommu_ir_probe_device(iommu, dev, info);
+	if (ret) {
+		kfree(info);
+		return ERR_PTR(ret);
+	}
+
 	dev_iommu_priv_set(dev, info);
 
 	return &iommu->iommu;
@@ -1856,6 +1857,7 @@ static void riscv_iommu_release_device(struct device *dev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
+	riscv_iommu_ir_release_device(dev, info);
 	kfree_rcu_mightsleep(info);
 }
 
@@ -1950,6 +1952,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+	riscv_iommu_ir_irq_domain_remove(iommu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index deb57b6a6c4b..4c1c681ba2a2 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -15,6 +15,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/irqdomain.h>
 #include <linux/sizes.h>
 
 #include "iommu-bits.h"
@@ -23,6 +24,7 @@
 #define RISCV_IOMMU_MSI_IOVA_BASE	SZ_16M
 
 struct riscv_iommu_device;
+struct riscv_iommu_domain;
 
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
@@ -66,6 +68,9 @@ struct riscv_iommu_device {
 	unsigned int ddt_mode;
 	dma_addr_t ddt_phys;
 	u64 *ddt_root;
+
+	/* MSI remapping */
+	struct irq_domain *irqdomain;
 };
 
 struct riscv_iommu_msi_table {
@@ -78,6 +83,19 @@ struct riscv_iommu_msi_table {
 	u64 msi_addr_pattern;
 };
 
+/* Private IOMMU data for managed devices, dev_iommu_priv_* */
+struct riscv_iommu_info {
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_dc dc;
+	struct irq_domain *old_msi_parent;
+	unsigned int nr_forwarded_irqs;
+};
+
+static inline bool riscv_iommu_ir_device_enabled(const struct riscv_iommu_info *info)
+{
+	return info->old_msi_parent != NULL;
+}
+
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
@@ -86,6 +104,24 @@ void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsign
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
 
+#ifdef CONFIG_RISCV_IMSIC
+void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_device *iommu);
+int riscv_iommu_ir_probe_device(struct riscv_iommu_device *iommu, struct device *dev,
+				struct riscv_iommu_info *info);
+void riscv_iommu_ir_release_device(struct device *dev, struct riscv_iommu_info *info);
+#else
+static inline void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_device *iommu) { }
+static inline int riscv_iommu_ir_probe_device(struct riscv_iommu_device *iommu,
+					      struct device *dev,
+					      struct riscv_iommu_info *info)
+{
+	info->old_msi_parent = NULL;
+	return 0;
+}
+static inline void riscv_iommu_ir_release_device(struct device *dev,
+						 struct riscv_iommu_info *info) { }
+#endif
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index abd1cdb640ea..0e6c86840242 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -64,6 +64,12 @@ const struct imsic_global_config *imsic_get_global_config(void)
 }
 EXPORT_SYMBOL_GPL(imsic_get_global_config);
 
+struct irq_domain *imsic_get_base_domain(void)
+{
+	return imsic ? imsic->base_domain : NULL;
+}
+EXPORT_SYMBOL_GPL(imsic_get_base_domain);
+
 /**
  * imsic_dev_has_imsic_msi_parent - Check for an IMSIC MSI parent
  * @dev: Device to check
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index d024a6524baa..02a836ce03b4 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -11,6 +11,8 @@
 #include <linux/device.h>
 #include <linux/fwnode.h>
 
+struct irq_domain;
+
 #define IMSIC_MMIO_PAGE_SHIFT		12
 #define IMSIC_MMIO_PAGE_SZ		BIT(IMSIC_MMIO_PAGE_SHIFT)
 #define IMSIC_MMIO_PAGE_LE		0x00
@@ -81,6 +83,7 @@ struct imsic_global_config {
 #ifdef CONFIG_RISCV_IMSIC
 
 const struct imsic_global_config *imsic_get_global_config(void);
+struct irq_domain *imsic_get_base_domain(void);
 bool imsic_dev_has_imsic_msi_parent(struct device *dev);
 
 #else
@@ -90,6 +93,11 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 	return NULL;
 }
 
+static inline struct irq_domain *imsic_get_base_domain(void)
+{
+	return NULL;
+}
+
 static inline bool imsic_dev_has_imsic_msi_parent(struct device *dev)
 {
 	return false;
-- 
2.43.0

