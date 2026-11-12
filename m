Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471315;
	b=FRE3o5H9rqLu1nx22QnhyM1sG3YrroF14zsCHP+/JV8+VfaDXZINtzGevK5uPPzLQucQ
	 EDUom4djRFTEelv1KksRFDqZp7GSPn2+IbqKh3YdIInopEAomnCLPQuxYoZS3w6tS3HF5
	 KyPwV5RK1IQPzk713un/Ev8UWv+BenTvjLtHtJZG2ZERMfL17VgOWGR/pM71TpJr7kYxr
	 tFOJ62p1+y3nWKTvuexixg5+33SHYfeDpWs5te6jBim38pqw6TD3T3e1HCKd/fGVv0NYv
	 Q54fDqG63PqD7gCbFjHobCVB+4po8OBt9x262A6S1lgucCxi07CbaHqdjZAwm+9FLDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471315;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fzZmTmGh6zxrlmuOofdQSMLS/zE4pvLqaLe8jBYsJAM=;
	b=oEtWE9UYhx9IfjqMaznW33hYUAPtob2/n0y+UccZ6I1hgf7FNPZ/VdcUlXYHlBm50MMU
	 UNvJGVM7/hBlm1elyirf1uwt1094JYIJBeKRTFzZWaUkXFn71SlEmt+VNVnL11GbJc5KK
	 7jH7NQE2T7m2eBwIEgf9dZ1hRIw1f5Wf04Tp0YFfRzUQ3THreooscIOvncdEJoPk030Mm
	 mObJpmtoz1jl6aCRQaAzAfkhYyARacSB71FMAgX8Dw+0SNbDM3JfqSUOhfmm75WZxz8uZ
	 /pVt7a6QpjKH6nEN2rw2arYGebecKkEYTjrO4nZv0A3RW2q/YbohlbnUOWPnvcPyBSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R8D9mx6z;
	arc=none smtp.remote-ip=95.215.58.71
Received: from mta1.migadu.com (out-71.mta1.migadu.com [95.215.58.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E70B606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E70B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R8D9mx6z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471312; v=1; x=1795076112;
 b=R8D9mx6zQHUZbbGxKBHh4exu87hLkHXIBeiDham+HISBIpLYPwJ63riDJ5x0JE+yixBWqvA1
 EU7bgD4NYCVPEUJNjRsyM8ePnkBccYshrVHnm01B0mrW8gdnRJEi5YXk3WTGiyrE79bSK2995z3
 9GpXwsHSUewzC1buyaavobHM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a198511cfc691750;
	Thu, 12 Nov 2026 08:15:11 +0000
X-Mizu-Trace-ID: a198511cfc691750
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Thu, 12 Nov 2026 08:14:42 +0000
Subject: [PATCH v3 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
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
Message-Id: <20261112-aplic-affinity-fix-v3-1-943d25cfbfad@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=ZSMnWkJIamVO8pDMKRsa4dzIAxKB5tL43vgFe5Xu4T8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfSxu/JzzXca81PZ95Pr3nqqx429eG2vKfMX//Oe/ft
 KyUvTi6o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLzEhgZNm0vqZZoDBeVjy29
 /fKm8ybDZwUH7cQenH2mX1d5l0niIsMfjheLa5T29b5Y+f9n3tTWH6ecbp8Kjf69KCWmRM/QQEq
 PEQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
For an edge-triggered source the APLIC forwards each edge as an MSI and
keeps no state after that, so an edge which the CPU side drops is lost.
After an affinity change, the next MSI can arrive on the new CPU while
the previous one is still being handled on the old CPU, and
handle_fasteoi_irq() then drops it.

The fasteoi flow also never calls irq_ack(), which is where IMSIC applies
an affinity change that was deferred while a previous vector move was in
flight. Such a change stays pending, and later affinity changes of the
interrupt only update the pending mask.

Use handle_edge_irq() for edge-triggered sources. It acknowledges the
interrupt before invoking the handler. If the interrupt is still in
progress on the previous target CPU, it either waits for it to complete
or marks it pending so that the handler runs again.

Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..5aa9607fbd83 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -69,6 +69,21 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (rc)
 		return rc;
+
+	/*
+	 * Edge-triggered sources are fire and forget, so they must be
+	 * acknowledged before the handler runs. The edge flow handler also
+	 * replays an interrupt which arrives while the previous one is
+	 * still being handled on another CPU after an affinity change.
+	 */
+	if (type & IRQ_TYPE_EDGE_BOTH) {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_edge_irq, "edge");
+	} else {
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_fasteoi_irq, "fasteoi");
+	}
+
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
 	 * requires interrupt retriggering when APLIC is in MSI mode.

-- 
2.56.0

