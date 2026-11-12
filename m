Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471319;
	b=w4K7dwM2Etznq4dh8Rc2Y8veQzPtxlcrOmSQ7ggj5PYf98+SUVAwpfSEvto0Yb1mG5ZI
	 JDW+yefRsNOJCSaU52/LM83BDZm0viZ4L/zd3AM/ZoOkod4MDwdgckz7Ww4pgCIDWFEcQ
	 J/8gJHkbQ0h5MfoTCKGQLSAn60ysXM6rOTIO3DR+VPzJdM2Na45pc3T6SjJPGfTL1f7X0
	 2DhEAbV7d5tM7HyB5ALTbhBySgSvQRb8PBlyixlsNGhqjxaxol6nUL+sYIyvUt2nlb32V
	 xm53elmE4c75GRGYztAQYAM29LoTWawgsrmAN3YsSSzWCM897JeJcFuRI24DdA+2NYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471319;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rf99RzV+IBte65wKj85e0v1z7kVTjzpjZAL1sO94Ifo=;
	b=tWqic9thp7ym5Yr5X+ansCpXzJPa09mTyO6mcsDY4ed2K0xMxCH2pTl8z3F+pKByO66b
	 Vik+TQHDy+QikAfV0XJn2fMgRBI1GSYfgUbVQvpEfU0Ezm/4VXa6Z+VXqQ/n7MgIePWRT
	 IIzhbAavdZRYL7WvggM/+/P1LxQJUYdO9W5zGfAsybc7QBePNGCkYQmSPhvzWJsnRRTkN
	 P63Z/JyAXVGPlMYcJ/gFL4wDbn++1mmGbuqpZ1c2xBUWdnbNEGOadilb2dpt3pg174dvE
	 wXU/cMiY6wMHDCZJgJTCV4B8Ct3IiTTQx/dEUCwqI73JaGlpLot+fTX+EU+VFU0CZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=umyWec+V;
	arc=none smtp.remote-ip=91.218.175.48
Received: from mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A7606A8B7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979A7606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=umyWec+V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sOgtWAxcrlGbQSoX1V5yIO89uZD0ppP6b0dzshzQZsc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471316; v=1; x=1795076116;
 b=umyWec+Vmq1LG1Afkr07LfwgNC7EO7yZaxrVzgKzSbA4xrb2ufFZwq7fLCGFMgXbx/ljAe7l
 g3JRWHA5ZyIujwD2UbdJg1Mcrm/ODzzCpJg1ZQMkrwxdiNVoRLYWsst4WhKNj0Qo1l9+6MWsiKb
 c8c2GkpfyC44U//P6QqXc3Wg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d04481d91be052fc;
	Thu, 12 Nov 2026 08:15:15 +0000
X-Mizu-Trace-ID: d04481d91be052fc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 08:14:43 +0000
Subject: [PATCH v3 2/2] irqchip/riscv-aplic: Apply pending affinity changes
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
Message-Id: <20261112-aplic-affinity-fix-v3-2-943d25cfbfad@linux.dev>
References: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
In-Reply-To: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=sOgtWAxcrlGbQSoX1V5yIO89uZD0ppP6b0dzshzQZsc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfS5vsPBxTf2U+i7f0VfvNnhT69+J0683+CR+F1ywyf
 HfYdN3ljlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImcfMLI8Kz1jhDD/xhGWes0
 X9/l6tcMhCc2NLu8zWOyupC6JNFTkOGfscHKrKWLbfu4Yrd2rKs+m32xPiqqteWcpEj0O+Xg0uP
 MAA==
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
index 5aa9607fbd83..7a8e569002c1 100644
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
 	if (type & IRQ_TYPE_EDGE_BOTH) {
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
 						 handle_edge_irq, "edge");
 	} else {
 		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
-						 handle_fasteoi_irq, "fasteoi");
+						 handle_fasteoi_ack_irq, "fasteoi");
 	}
 
 	/*
@@ -182,7 +185,7 @@ static const struct msi_domain_template aplic_msi_template = {
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

