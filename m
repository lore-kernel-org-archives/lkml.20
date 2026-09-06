Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118503E16A4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682190; cv=none; b=B1JdCRrRfPldhq4owP5It+LhtoLUZI13Ktr0/XRS3uOXVcnUD1NXFiQzeDFd6xEU394/B/B89zu8r60IaK+5PJxqHEFpTQkchsJVL1HROuqaN/LVZNtTVPWlJHJbFpho0y51kHzU6o5gddst1E8cyH4uJb0XLayX1Zo0W5mJ/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682190; c=relaxed/simple;
	bh=icoXd4EqGIjVIkvVnW3UuRrq1VbYCkHiUXDFdj+sOAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zykw3JBpHr6mKQSMWD8X92h5YVPg5oYPFZY1J2GQ3Y+9q96XNOrqlniPyispcvAp9+BPIomPEorIIrcjNlNMlmz3Y2XD1LCu3FcdOX5TChupTx15x+v5fD2pCvfvlzpkZfdGOfT49XaSgDz90ojrEbNZhLs7HXjOSex91Z/QRqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pUy0aq06; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pUy0aq06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=GvAqQK57ZWsJcPI7j7zHlBh2SbXaHXwqO5NcbulIhVU=;
	b=pUy0aq067NZn4Z5oK8VMuQyhZSuEKlCSuwZ9XrtmZoGVNpJOYTKp3QHcIdjThg
	WYG4l6IdXs30WdIHzbT9djpSWa6gjBboWVHXH+BK/y9Vpt9XaGkiVIThH5vzwpIQ
	z9Lxdi57Y/YpSBxx4B7sFOxDGdthE5VJyRZ2P8YgUBTXE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn35mOH51qmtDoAw--.41881S2;
	Sun, 06 Sep 2026 16:08:47 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Bjorn Topel <bjorn@kernel.org>
Subject: [PATCH 1/2] irqchip/riscv-imsic: Ignore unused group index shifts
Date: Sun,  6 Sep 2026 16:08:44 +0800
Message-ID: <caplitmus-rv.4882de641c0d41f9bef843fe41b3084f.imsic-zero@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn35mOH51qmtDoAw--.41881S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1rWFWDtw45tF1DZFyrJFb_yoWrWF4rpr
	sxCFWjqr1UGF40gw4Syay0qa4ft3s2ya9rKrW8Cws0kr12qF93GwnIyryruwn8JF4fCa4r
	AF45ZFyUGa18Ca7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3HUgUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q-stWqdH4-stgAA3G

The IMSIC parser validates and uses group_index_shift even when the
group index has zero width. The binding permits a zero-width group with
shift zero, but bits + shift - 1 underflows and rejects that layout.
APLIC MSI setup also validates HHXS although HHXW is zero.

Only validate and clear group-address bits when the group width is
nonzero. Use zero for APLIC HHXS when there is no group field. This also
avoids shifting an empty mask by an otherwise unused shift value.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Assisted-by: GPT-5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838..569b3ff4 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -223,17 +223,21 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 		return -EINVAL;
 	}
 
-	/* Find first bit position of group index (HHXS) */
-	mc->hhxs = imsic_global->group_index_shift;
-	if (mc->hhxs < (2 * APLIC_xMSICFGADDR_PPN_SHIFT)) {
-		dev_err(dev, "IMSIC group index shift should be >= %d\n",
-			(2 * APLIC_xMSICFGADDR_PPN_SHIFT));
-		return -EINVAL;
-	}
-	mc->hhxs -= (2 * APLIC_xMSICFGADDR_PPN_SHIFT);
-	if (APLIC_xMSICFGADDRH_HHXS_MASK < mc->hhxs) {
-		dev_err(dev, "IMSIC group index shift big for APLIC HHXS\n");
-		return -EINVAL;
+	if (mc->hhxw) {
+		/* Find first bit position of group index (HHXS) */
+		mc->hhxs = imsic_global->group_index_shift;
+		if (mc->hhxs < (2 * APLIC_xMSICFGADDR_PPN_SHIFT)) {
+			dev_err(dev, "IMSIC group index shift should be >= %d\n",
+				(2 * APLIC_xMSICFGADDR_PPN_SHIFT));
+			return -EINVAL;
+		}
+		mc->hhxs -= (2 * APLIC_xMSICFGADDR_PPN_SHIFT);
+		if (APLIC_xMSICFGADDRH_HHXS_MASK < mc->hhxs) {
+			dev_err(dev, "IMSIC group index shift big for APLIC HHXS\n");
+			return -EINVAL;
+		}
+	} else {
+		mc->hhxs = 0;
 	}
 
 	/* Compute PPN base */
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 9505ddbd..44b9c34c 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -741,10 +741,12 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 	}
 
 	/* Sanity check group index shift */
-	i = global->group_index_bits + global->group_index_shift - 1;
-	if (i >= BITS_PER_LONG) {
-		pr_err("%pfwP: group index shift too big\n", fwnode);
-		return -EINVAL;
+	if (global->group_index_bits) {
+		i = global->group_index_bits + global->group_index_shift - 1;
+		if (i >= BITS_PER_LONG) {
+			pr_err("%pfwP: group index shift too big\n", fwnode);
+			return -EINVAL;
+		}
 	}
 
 	/* Sanity check number of interrupt identities */
@@ -773,8 +775,9 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 	global->base_addr &= ~GENMASK(global->guest_index_bits +
 				       global->hart_index_bits +
 				       IMSIC_MMIO_PAGE_SHIFT - 1, 0);
-	global->base_addr &= ~((BIT(global->group_index_bits) - 1) <<
-			       global->group_index_shift);
+	if (global->group_index_bits)
+		global->base_addr &= ~((BIT(global->group_index_bits) - 1) <<
+				       global->group_index_shift);
 
 	/* Find number of MMIO register sets */
 	while (!imsic_get_mmio_resource(fwnode, *nr_mmios, &res))
@@ -854,8 +857,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		base_addr &= ~GENMASK(global->guest_index_bits +
 				      global->hart_index_bits +
 				      IMSIC_MMIO_PAGE_SHIFT - 1, 0);
-		base_addr &= ~((BIT(global->group_index_bits) - 1) <<
-			       global->group_index_shift);
+		if (global->group_index_bits)
+			base_addr &= ~((BIT(global->group_index_bits) - 1) <<
+				       global->group_index_shift);
 		if (base_addr != global->base_addr) {
 			rc = -EINVAL;
 			pr_err("%pfwP: address mismatch for regset %d\n", fwnode, i);

base-commit: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515

