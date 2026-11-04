Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802111;
	b=Byj9yJ6kttNmuhmOtjdiiniZ+GXiLHvPzP9l4aWCLBHZhFmPowoF4TS6rqbgGtvXIOfL
	 EBkZv6qsCI1VMYxvf76J+gW7QPTs+YW7cGVuAPemt7Vx6cl7oc0ZsN/tJHvHOLRfn1fG5
	 0NzHkeFI/eOAkCPYAKYgPF8EvFhwelSegZ9TaBe6U2lEy9mJlS8QlSrafK29NR5sSfgJ2
	 oFp3m7EQAOluAbuEzZHXrX5ddt4U+tG655dn9S5l4tj3jEM48IZKU7eTCudXq4cMl1vrs
	 igwtMcVkdVmpp0xqSo6X35BsxSbsvmhKg+NRJ9wgJynRqhkhke1PhzCui0G4yKY695A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802111;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=leDhR4PlAbqo4429lzozfM6eKEkQHmhRiR2WMVn0t3o=;
	b=reVgabQsVFbm+ytv9jKQO71zDxS9Hs60mfTw4mGkqI799po95XyYGjRoArdMQKzdKGlS
	 oxNYZHY02PDyoqv2M8izvlAdWpuZvdOo4C5drPb3sYOU7tYW4+nzL5/sbo2XAmZClkBSO
	 7TT8k7D2fPKH/LSCRoiWWGcurftAuh/Qtd05+WJsfs9MUhorW+6dK4M8jd9taGYs/LgHg
	 uHV+iyTfB/RONiDCajr3k2WXTjSL9MrDNVRkHYd8Oa9++S/yab4SrYoB3Sizc9h824SkR
	 kpgnrRKyxiZ/0jKWZlQW7PYDXf4xNZqEAhHS/fvFwLCHs5Rftqu8QU522PCW5QVIztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lnGD52sa;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF1606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CF1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lnGD52sa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jDeSXWBLkiDEIo9mIW3HLqLNQ8245vFAegvkXKNefFg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793802108; v=1; x=1794406908;
 b=lnGD52samrfS3MBuIirWqCYJAwbYi7EdNvm2dHwOTKGwm5B6/vXhxGDipWWKryvxzeY/LocX
 w+F0pUczOgs90xL3vTWGTgQLzwFDPsMjyTJk29JX4ZQpeFPFE4gyzkvPhxDmj4ByJsRFHEJmvip
 maWLJUXkLxo51o9O+YEUxc5I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3a1212f53063606c;
	Wed, 04 Nov 2026 14:21:48 +0000
X-Mizu-Trace-ID: 3a1212f53063606c
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 04 Nov 2026 14:21:40 +0000
Subject: [PATCH] irqchip/riscv-aplic: Process pending affinity changes on
 EOI
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
Message-Id: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTswNlKMVxEXSTrREYklScUSe
 veOdvk9eH+Dwlm4wKVrkPkjRd5JcTx0EB4u3RllVENP/UCWLLrpJQFdjJKkLhjli2dyJ2/Ij2Q
 Y9Dhl1vkfvd52l9k/OdRfCdZ1A2qOKu92AAAA
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=jDeSXWBLkiDEIo9mIW3HLqLNQ8245vFAegvkXKNefFg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmv7UtP7dqQLHRn+s1Zf/VuWa25m3Q0YNL0NwFards2R
 /2IETrwqqOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiVXMZ/qc9SK0slw07MPl2
 xsMV3V3Fc8I7JubuudlxNW7mPQVrfSZGhvOZ9+z+pa82zN7z1YktLsv86Iq0mjcdx/YXP6ln4al
 o4AEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

IMSIC rejects an affinity change with -EBUSY while a previous vector
move is still in flight, and the IRQ core then records the new mask as
pending. The change is meant to be applied by irq_move_irq() in the
IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
handle_fasteoi_irq(), which does not call irq_ack.

The pending change is therefore never applied. While it is pending,
later affinity changes only update the pending mask, so the interrupt
stays on its old CPU.

Call the parent's irq_ack from the EOI callback, before retriggering
level sources so that they fire at the updated target.

Fixes: 58d868b67a9a ("RISC-V: Select CONFIG_GENERIC_PENDING_IRQ")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..a10cc1fb50c2 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -57,9 +57,12 @@ static void aplic_msi_irq_retrigger_level(struct irq_data *d)
 static void aplic_msi_irq_eoi(struct irq_data *d)
 {
 	/*
-	 * EOI handling is required only for level-triggered interrupts
-	 * when APLIC is in MSI mode.
+	 * The fasteoi flow does not call irq_ack. Let the IMSIC parent
+	 * process affinity moves deferred while its previous vector move
+	 * was still in flight. Both edge and level sources need this.
 	 */
+	irq_chip_ack_parent(d);
+
 	aplic_msi_irq_retrigger_level(d);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-aplic-affinity-fix-80a4b30bd03e

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

