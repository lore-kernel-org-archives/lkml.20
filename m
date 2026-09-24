Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D13D47A7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266535; cv=none; b=X7huI1vvNCtb3+4Wyhw8V00/KhD3RaeNJYuAMQSU3TCvonj/5ObtZGV/AwZDJ5L8p99g9zXTJcqoxvm3yD5nTz9c8SBmhlY+bmHfHc6FsEhbVjxKT7r7YIvezaAcIgNucg91MrTX8ApWeNXFpDjtMvddSqpTh08y3cfi7330bfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266535; c=relaxed/simple;
	bh=dp3KJ7rutPRJZmO1yc+sOK8ZIrQBmZVNRnPhzkGaBb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q8wSTonl8Ly+Okz8FOOUAQ5UFcaFCEbwwmnimq59rNgZuJPKOxGfTDclIfJsN0yz5dIigo3xwRUlFgOv1TK95QQlhYmZDDZI5tb38P3o5gps4YFjwq7ZuX/lmlzunWpBioNtWO32HArUXciPA5xv/0cOI54kgz3rt2r2HRPmOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VDwRURR5; arc=none smtp.client-ip=91.218.175.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VDwRURR5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dp3KJ7rutPRJZmO1yc+sOK8ZIrQBmZVNRnPhzkGaBb0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266531; v=1; x=1790871331;
 b=VDwRURR5LrPMl6OqwzG7mWdOJjB4IUP3NXsmGUnVgW0IEIgaFGT6J90ti2E5XQqd0Jls0VKU
 FT9ruLFGDXQ1pndniJaMFnmVCqrPQjxE/3Bly00+dH+rNh2iW1WPV1f0iXqvI2aDhbfz7MM6WKg
 PkWUodE8QkGJUC+6LhKzf/xk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5d62044b9547a85;
	Thu, 24 Sep 2026 16:15:31 +0000
X-Mizu-Trace-ID: a5d62044b9547a85
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
Subject: [PATCH 3/3] irqchip/gic-v3: Don't register a redistributor that was never counted
Date: Thu, 24 Sep 2026 17:15:14 +0100
Message-Id: <20260924161514.1112730-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260924161514.1112730-1-fuad.tabba@linux.dev>
References: <20260924161514.1112730-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gic_acpi_match_gicc() counts only the enabled GICCs with a non-zero
gicr_base_address, and that count sizes redist_regs[], but
gic_acpi_parse_madt_gicc() registers every enabled one. For an enabled
GICC with a zero GICR base, gic_acpi_register_redist() therefore writes
a struct redist_region past the end of the array.

Commit fa2dabe57220e ("irqchip/gic-v3: Don't return errors from
gic_acpi_match_gicc()") removed the check that kept the two consistent;
its message says such entries are still caught by gic_populate_rdist(),
but that runs from gic_cpu_init(), after the write. Skip the entry
instead.

Fixes: fa2dabe57220e ("irqchip/gic-v3: Don't return errors from gic_acpi_match_gicc()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc4..fb6a0570fb154 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2344,6 +2344,12 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 		return 0;
 	}
 
+	/* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
+	if (!gicc->gicr_base_address) {
+		pr_warn(FW_BUG "GICC entry with ACPI UID %u has no GICR base address\n", gicc->uid);
+		return 0;
+	}
+
 	redist_base = ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
-- 
2.39.5

