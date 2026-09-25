Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7291041D63C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326229; cv=none; b=It/AjRO9Cczg4h2OErkp4FTQFuvJsKZjgDASh0tHG45g0E/HmiYZisWDkqafxMgKw/jtPOuYpdg3ICM4OgxuO9M3S1TtJQFMdn7mgEdXitVHOwE5GElNRBbDZl/sCisDNqAgeklhOKirKiUuwmJgI8SnMc1gbj5SNZMVceTA6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326229; c=relaxed/simple;
	bh=kacAke/FI9BR5UARy2fk/gkWdN8kBdKaAW1g75U8sWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/al3zzTAg0gQyTolvQ59kujaBXVD6f1vMIslnyRsGTVjW1d31/qC82jLa/0xhdxz7cPfwL7bUpixPuC2tgjfgRSLP6iQiAiUNcw+ySRcxMbB8IIe9NB/JKarJEUOmbDWpHHlbYos1TZyRYyxZJhfM1qZq+d4HAGttmC83iyqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Yg/d9xwg; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Yg/d9xwg"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kacAke/FI9BR5UARy2fk/gkWdN8kBdKaAW1g75U8sWY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790326218; v=1; x=1790931018;
 b=Yg/d9xwgYX1BaszIKwk4PCCDz1keqWPk+U6pC9/3X7FQe4kRS5NvKy5RcusOudXjYpIEUbgc
 KIFFyZI4MgN6pUDtDk6lcbSRTpS5TCFEtLngPXx3e+niVTh77iMY9rz0o+W+hGB83+d0P1qehKF
 dywnlInlLs3dz6pJtVl31HC4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4c9ed797f156344;
	Fri, 25 Sep 2026 08:50:17 +0000
X-Mizu-Trace-ID: e4c9ed797f156344
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] irqchip/gic-v3: Don't register a redistributor that was never counted
Date: Fri, 25 Sep 2026 09:50:00 +0100
Message-Id: <20260925085000.753400-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925085000.753400-1-fuad.tabba@linux.dev>
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gic_acpi_match_gicc() counts only the enabled GICCs with a non-zero
gicr_base_address, and that count sizes redist_regs[], but
gic_acpi_parse_madt_gicc() registers every enabled one. On a MADT with
no GICR entries, an enabled GICC with a zero GICR base therefore makes
gic_acpi_register_redist() write a struct redist_region past the end of
the array.

Commit fa2dabe57220e ("irqchip/gic-v3: Don't return errors from
gic_acpi_match_gicc()") removed the check that kept the two consistent.
Its message says such entries are still caught by gic_populate_rdist(),
but that runs from gic_cpu_init(), after the write.

Skip the entry instead, and mark the CPU's redistributor broken as the
online-capable path does, so that gic_check_rdist() rejects the CPU.
gic_starting_cpu() runs past cpuhp's last failure point, so without the
mark the CPU would come online with its redistributor and CPU interface
unconfigured. With an ITS, its_cpu_init() would then dereference a NULL
rd_base.

Fixes: fa2dabe57220e ("irqchip/gic-v3: Don't return errors from gic_acpi_match_gicc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..bfc10d657fd57 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2344,6 +2344,17 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 		return 0;
 	}
 
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		int cpu = get_cpu_for_acpi_id(gicc->uid);
+
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address, CPU kept offline\n",
+			gicc->uid);
+		if (cpu >= 0)
+			cpumask_set_cpu(cpu, &broken_rdists);
+		return 0;
+	}
+
 	redist_base = ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
-- 
2.39.5

