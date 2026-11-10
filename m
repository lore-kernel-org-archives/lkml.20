Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312407;
	b=Tb3NZ4YKtp6CyHCdlLA+HPBxVW8xV8W8ikDH+mr/4jN6E4nYQSxzKtW5NfyFFNiXEihY
	 8YG7i6LRyJatcJVfPU/a4+WMPsoLqjDygkf9FLPmvS+sE4a5W+6gTTjoJOsQ1tRfIhlVI
	 p1TAcwQvIj4HzLh68bpy9LVRZDSoTnI3+kcEeFCFxhoCyHsPju51wDxCR83S7EiWDBU5U
	 MetvljBk7oqFuUDtvShCA3doZyKRLWFFzm9xZKhOj6Y/ui3VeAv8aLwLjv3zmbuhW/khB
	 QhTqiBHpSObErQ46FvLAq5LdX0IipXmsDOnGAjyJUk5FAnG7RCDbt5mCDuer3A3Hwkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312407;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=m07VtUmPABm/CEZlUcztGTJnxcmqsETQhv6cZfLh7/Q=;
	b=3nkor5oOCExRiab90U0hPAlTVNCoV5LF8yQVF6y+1bhO1jJadIe9hBhKxHDDAke+4Ms/
	 1l7McCVguxhLlpQKwvyEftqSOFIWFxsCOWe9vqguISU37+isDws+WGAPqIEWZO84dnpxJ
	 HogVcFu5Sm63NkjrY9GlUc+4lvix0fn0a6Cok302TBnEK5H3zPrd3EZP149EHR8xMqI4K
	 RR1H6ZZMy7wxtU2YNRZ6+1U6QjmpodAgIC32GXB5bt7nZobZALlVD1TZ0rTmWM9gGsM+O
	 xg5Wyo0ljo5MJLfUghwtQsW0Zylh/7CKRth5noVeQ5eBzZc3zubNmnFJN7ZYE+oVw+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvWG8aAK;
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5851560A2600
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5851560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvWG8aAK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ml9Y2L0WRshHOEyX3Fcfgu4Ny7zTrj4mhFqLWDOSppY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312404; v=1; x=1794917204;
 b=KvWG8aAKFIcvuNrMws3WpxjIZReiE0YN8vFQN0lb2LJcqj04Be+4cwbXABqn/NDO8/wldul+
 CvSBHRc1BOw4UmabKStFqvqmPE+EZqaPanEFeCvEFWCNTNQEg8pc7R9ko/TEi2EuFl6yVkNuCxE
 jbW1da3Z6t2zVHk2HKtLZiN4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4ba640714a9ce6fe;
	Tue, 10 Nov 2026 12:06:44 +0000
X-Mizu-Trace-ID: 4ba640714a9ce6fe
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 10 Nov 2026 12:06:29 +0000
Subject: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
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
Message-Id: <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=Ml9Y2L0WRshHOEyX3Fcfgu4Ny7zTrj4mhFqLWDOSppY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmfOY6bGMff2F5vf883UFlIKXtLdOTmFENB9n8Oxw+6P
 /Oe2fmzo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCLZ/xgZ5v9qDrX0OP81Pq79
 qLHAvv2dQkox0XaJi/9kMP/899C5mZHhm6ix1y/1Y3vOdvp5Xftcr6Ayq//SGX7Zqqhri60u1K/
 jAAA=
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
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..44f0df83f93e 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -69,6 +69,20 @@ static int aplic_msi_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (rc)
 		return rc;
+
+	/*
+	 * Edge-triggered sources are fire and forget, so they must be
+	 * acknowledged before the handler runs. The edge flow handler also
+	 * replays an interrupt which arrives while the previous one is
+	 * still being handled on another CPU after an affinity change.
+	 */
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_edge_irq, "edge");
+	else
+		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
+						 handle_fasteoi_irq, "fasteoi");
+
 	/*
 	 * Updating sourcecfg register for level-triggered interrupts
 	 * requires interrupt retriggering when APLIC is in MSI mode.

-- 
2.56.0

