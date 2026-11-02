Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626451;
	b=1wMmjtE16ip/7q+Z70rJOD+qMODfmPZfgvOhgBsNUwhxIALy4JTuUX8uU7ZMsFOUsoXH
	 wEQWxJXCQOw6OET9dJvLUjE/KhMDA5u+9RM6UwlHZk4NLA+M1mc2iNM1SYjXh4GuDU+aP
	 43bf2QL/Z+X8btZNERJQi3ezK/dVFe+nXSpdhkKuVrcPOeHtWxT8j0dpGa9mvCZlUiWxa
	 oeZUeHsrIEIdHeej0ZIRBOR8VAIN02DxjI8lzKK5K5WVxkANymJOiSkmjowUeoX1skZyz
	 i//Y6E3fwTtQ3rNEAVhhhWVONqPwklrglJ2mC66Xb8XdYYEv89togwkERqJ/AQxUuew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626451;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hQVfT3r8P83Um33W/Vm6+PugPIwjNg8kh2hn41VZV/Q=;
	b=WSWtWvFFj+XG/z9aJIvqn6JuNoCvOcVskLxtbEMiQcvYuDNTwZho69K15zEV++OHeYAm
	 EksVsE12AMJVCr0O7W3RNV7C/bn9bsYaxWHUzNepfdM0YSvBN1e3Npae5nwAWuAh59yq4
	 oiCMHJsRHI18mIhtI06b6QVnBKkfOhpdMOQIoPNhyh8dcu2cx8UO6b4QtdMUdP5htZe/1
	 9YDcyAnffGXP5ipKYlld/ahe+hHS8UoF8lc4InROuoP0tW4HDLhO8Aa5vqctW9uBLbUK+
	 RvNVSIxMWQNjnc/Wf0gJLBKk9P1gvEcG15+EtJvkLxoE2waeLVvNX4f3uPM1Q3i/r0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LCluMqOq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A05E606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A05E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LCluMqOq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCF67293B;
	Mon,  2 Nov 2026 05:34:06 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A921B3F632;
	Mon,  2 Nov 2026 05:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626450; bh=C0peWmcxC+yQDPcV/6U1MLKKUezIutn5fgUmrA8qTl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LCluMqOqIXP0JwVixNdBTxTqsHMkzO578lM2v3Jog8TAtttF0ICP13/fDlHszJY51
	 Tl3wvU5SzOJup3FHb+V3eETDvpw2RI2vt6XKgP+BDzSXC2pFAmAgrgDGeE7zrSNyxS
	 Jpfe9SfD/9zWvm6KTZbipLLGtK9FX9K87l3Nd4T0=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:33:00 +0000
Subject: [PATCH 07/10] irqchip/gic-v5: Use firmware node name in ITS
 warning
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-7-743b61626fc5@arm.com>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
In-Reply-To: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

The common ITS initialiser can be called with an ACPI firmware node.
If firmware leaves the ITS enabled, the warning dereferences the DT
node pointer, which is NULL on that path.

Use the firmware node name for the warning and drop the DT-only pointer.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index c5d057f713134..8628de326f28d 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
 static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
 				       struct irq_domain *parent_domain, bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	struct gicv5_its_chip_data *its_node;
 	u32 cr0, cr1;
 	bool enabled;
@@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
 	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
-	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
+	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
+		 fwnode_get_name(handle))) {
 		ret = gicv5_its_disable(its_node);
 		if (ret)
 			goto out_free_node;

-- 
2.34.1

