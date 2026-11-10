Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312410;
	b=A0RBF5hTeyNiiZ+nPQdUrmJGim8d/6z8uRn+GPUSbXF/iUCGwiZpYSF7RPzUc1hvOjnm
	 FwRKP7w9ALRiQ0Wx2z1+89ZAQIJ4MyGscxytlUfQfz4k7FL3kwnbzW7vFpfOc57xHwCTN
	 35FjF1EHlkiRubb0tXXFUJrvfPofiKi4CIpjOXDGuUG1Z8YWXf98+35b6W+Q4tzfUmJvK
	 STgcEr38cKetNkNbfpASp7umm0JfSm7euY3WE2KV5xW0xk3Zt+SmyIoNOjHu1r2tcKbpZ
	 eliQaO3eZtGQpxJVFJWardsNhG4FHChFVuOHBX66eI93ylA0R5Lfk0ArEGGiD3OhGBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312410;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yqcRrQ1PD0Rimv0R7GX3nFO6v/MsoH7340hS5dB2COA=;
	b=W1OMJHX5Pm1YH7TIrdOC3JXllsL2In3551c+6yd883ZhVrngqTW2t6MjN2fFfFW+VRir
	 bSqOdoMs6oE6oBuiizAjFzXdD/jNeOrN7BoVwyPRuoT5iRHV8vozBrIgXauVsZQ4Vv2st
	 ubRCtgI/Jk7gJXnlxmY5meuS0PudIDt9XuwwKYGNGtUl4JLScOdJDT2zSWXoep+6+juIo
	 PuEOmjhYVtflKQfaIn8iD0ubHgMEyB1D0aWcpl9whMSHdRBHGiJCx0q3NZhB76Ex/UcbO
	 h079weTl/vwY7jafoO7FVRtg96uMBI29J2Av4xIdw+wIJto9clkXsVAd6+dzcY0yG7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XShnS3CP;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B603E60A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B603E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XShnS3CP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B8vP+nfvf+L5pSvxIzqaD3WoBVS7IeYmJsXVBIxFPvg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312407; v=1; x=1794917207;
 b=XShnS3CPjuawOXPiL7E9K0OUeg3/G7kd1rBhMcwzz6vDnxNtMZeG4Eme0IyZIsj+z7oOLEt/
 7bQVM1d4+98jvPtZszTfrxVitvkacKIeAHMubTbVZSL14iDIdogqAjzAZtPUNT1VN8qr85nQkwq
 Wb18Ext9kNX+a6YOXkeTjGI4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4bd8311dc589fd4f;
	Tue, 10 Nov 2026 12:06:46 +0000
X-Mizu-Trace-ID: 4bd8311dc589fd4f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 10 Nov 2026 12:06:30 +0000
Subject: [PATCH v2 2/2] irqchip/riscv-aplic: Apply pending affinity changes
 for level MSI sources
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
Message-Id: <20261110-aplic-affinity-fix-v2-2-6c143b8b4e8c@linux.dev>
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
In-Reply-To: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2720;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=B8vP+nfvf+L5pSvxIzqaD3WoBVS7IeYmJsXVBIxFPvg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY5fKZm5aKVk/v65+zxmrcu9/9f4w2G9s2wFc50kZ
 proKLfO6ShlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZhIy2mGP9xLj8gExJWKpsx3
 0dtS3d14bqVsgBTH+ikzaoJaI5aey2D477dnY+Z3S7voTXLbxE8azChZUaQft8TwsME91hNSEQw
 fmQE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

IMSIC rejects an affinity change with -EBUSY while a previous vector
move is still in flight, and the IRQ core then records the new mask as
pending. The change is applied by irq_move_irq() in the IMSIC irq_ack
callback, but level-triggered APLIC MSI interrupts are handled by
handle_fasteoi_irq(), which never calls irq_ack.

The pending change is therefore never applied. While it is pending,
later affinity changes only update the pending mask, so the interrupt
stays on its old CPU.

Use handle_fasteoi_ack_irq() for level-triggered sources. It acks the
interrupt before invoking the handler, so a pending affinity change is
applied on the next interrupt, and the EOI retrigger then targets the
new CPU.

Fixes: 58d868b67a9a ("RISC-V: Select CONFIG_GENERIC_PENDING_IRQ")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/Kconfig               | 1 +
 drivers/irqchip/irq-riscv-aplic-msi.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..a639a0c2f3d2 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -645,6 +645,7 @@ config RISCV_APLIC_MSI
 	bool
 	depends on RISCV_APLIC
 	select GENERIC_MSI_IRQ
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	default RISCV_APLIC
 
 config RISCV_IMSIC
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 44f0df83f93e..0e71b427da34 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -75,13 +75,16 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 	 * acknowledged before the handler runs. The edge flow handler also
 	 * replays an interrupt which arrives while the previous one is
 	 * still being handled on another CPU after an affinity change.
+	 *
+	 * Level-triggered sources use the fasteoi flow, but still need the
+	 * ack so that the IMSIC parent applies deferred affinity changes.
 	 */
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
 						 handle_edge_irq, "edge");
 	else
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
-						 handle_fasteoi_irq, "fasteoi");
+						 handle_fasteoi_ack_irq, "fasteoi");
 
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
@@ -181,7 +184,7 @@ static const struct msi_domain_template aplic_msi_template = {
 	.info = {
 		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
 		.flags			= MSI_FLAG_USE_DEV_FWNODE,
-		.handler		= handle_fasteoi_irq,
+		.handler		= handle_fasteoi_ack_irq,
 		.handler_name		= "fasteoi",
 	},
 };

-- 
2.56.0

