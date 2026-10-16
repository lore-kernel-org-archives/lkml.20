Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBCA4EB862
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160076; cv=none; b=KSkm5Tf3imbXbWq9Xfgvnh5m10AMeFhZm6j6pBQA95ewVNXarn+hdOX5wxmQj2GRS5Dm6vX4XHcoBxpwY1ysaDf3IYv5t/bLhVGo5l6Vx3T3bip19rdpW6C6MCchNGfuJR2af9HEfKMVRG6rTLDrJ6J1M2iFzAg8oHUfUwnanDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160076; c=relaxed/simple;
	bh=dGs13ct5Mrd5T310v+brRzYv9BXMPVda4TmTcmmxJPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejX0GTF2gpuhMPSUPONs5bn0lmeT6PXYsuj9qyQdeHJnW9yB/NZPfrAcMRUpOmp++PKI2Xs57ZI9zs0xgR/85Ba9evtoSdtgiHx03N8GxuVJy6OxzRrrRPGEREiktbHHqS7GzvOdyIJGzxK2FKl7erGlglz7MjaEX0ycTsn/qgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eBLD4gdM; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eBLD4gdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vY
	rfBARzjSJRwgwnu3KNkkTr5qVQ7Erdz8gVXYHy7jU=; b=eBLD4gdMcEjnkWBKpr
	rTE2HBiX9dpgOVTvIpCS2zCPomXN0xbg8Mvv636iWwL40SapC7s1+2X2g4Tf/81Q
	CM3gHZ1xHGeHkGBnezF8rJjoh4D3K/dn5N1zJ1wxnC2M+i7WmRVzwxIbtEp+Eb+z
	EkJsxy7+gXiqqz3A7gxAonUww=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S5;
	Fri, 16 Oct 2026 22:14:03 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/6] irqchip/gic-v3: validate MADT records before use
Date: Fri, 16 Oct 2026 22:13:54 +0800
Message-Id: <20261016141357.2793046-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3NysnMdJq1dUUAg--.27711S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryxWF45tryxCw18ury7GFg_yoW5Aw4xpF
	4UKF90kw43trWSqr48Jw45Zay5Jw4IyF9FqFWxC343Kw45KrWjvFWI9Fya9Fn7JF48ua12
	vr4FqayUCF48A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_zVbPUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Aul32rSMSurZwAA3v

The GICv3 ACPI paths cast generic MADT headers to distributor,
redistributor, and CPU interface records before confirming that the
corresponding fixed-size structures are present. Truncated records can
therefore cause out-of-bounds field reads while probing or setting up
virtualization data.

Check each typed MADT record before its first field access. Also reject
a short distributor record in the version validator, which runs before
the probe callback.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..0588d6d83b31 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2299,6 +2299,9 @@ gic_acpi_parse_madt_redist(union acpi_subtable_headers *header,
 			(struct acpi_madt_generic_redistributor *)header;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(redist, end))
+		return -EINVAL;
+
 	redist_base = ioremap(redist->base_address, redist->length);
 	if (!redist_base) {
 		pr_err("Couldn't map GICR region @%llx\n", redist->base_address);
@@ -2325,6 +2328,9 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
 	void __iomem *redist_base;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/* Neither enabled or online capable means it doesn't exist, skip it */
 	if (!(gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2391,6 +2397,9 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 	struct acpi_madt_generic_interrupt *gicc =
 				(struct acpi_madt_generic_interrupt *)header;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
 	 * GICR base is presented via GICC. The redistributor is only known to
@@ -2437,6 +2446,9 @@ static bool __init acpi_validate_gic_table(struct acpi_subtable_header *header,
 	int count;
 
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (header->length < sizeof(*dist))
+		return false;
+
 	if (dist->version != ape->driver_data)
 		return false;
 
@@ -2457,6 +2469,9 @@ static int __init gic_acpi_parse_virt_madt_gicc(union acpi_subtable_headers *hea
 	int maint_irq_mode;
 	static int first_madt = true;
 
+	if (BAD_MADT_ENTRY(gicc, end))
+		return -EINVAL;
+
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
@@ -2547,6 +2562,9 @@ gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 
 	/* Get distributor base address */
 	dist = (struct acpi_madt_generic_distributor *)header;
+	if (BAD_MADT_ENTRY(dist, end))
+		return -EINVAL;
+
 	acpi_data.dist_base = ioremap(dist->base_address,
 				      ACPI_GICV3_DIST_MEM_SIZE);
 	if (!acpi_data.dist_base) {
-- 
2.34.1

