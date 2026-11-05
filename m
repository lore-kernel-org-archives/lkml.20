Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875402;
	b=RlW0jYUDysfmv12GOZdna5eROLVgwoGG8v5BuE2im/iotiFbPD/PYR+V83EiUcDuJhkl
	 dEJISuklPLst8NQHNA48FhAgkZ7eA0fXADMQYwuP2vh422Q6fW9RWHD/h52MOtcHMwczb
	 GiV3mGC/DNsfrf0dyhCyP+KpLdDC45Rdy8dSjSrjDftIu8lMOHnuaeWkqmo7NgX44FrBC
	 ZWuHfSrVFK456v2z+NAkTqLA6O3/d51ZuXKjpXtIBqaG9s0TbDRpV5S4zd60ElECiOB1Y
	 DleIxWoksL3TwdRdVPjFght5vXtmcQ6sKHJyWrlXG0y4okvt7gnDUim5GPfSxbIjjHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=;
	b=1JC3/UBdC2TcjEw8XAM1Vw2ziwejhpc3gBbdak1ys7nFkial+LB6QagniXEs72CHB/OO
	 aap5u8JW1gkzbuokLYGtyP/Z1wq5GELlkp/F0OAACt7obZZpJBuJ1vxi1LOFeHFPRcugF
	 wNnSADvUs9rhlH1+BOVzI4GBJ3nx4Su7UtWn7nzxqHoX5SBYBvq8YgiCM07EdZv6i8ljl
	 tCFdwsV2iIrB7G/a2PGSLT6f5N1UKiNVx4Q3ZQME+IVjStekTc8/RmuhWAU6yYaAXQXVk
	 DxbPNqiDiBm3xvyndT24DWU7xMx5xkfLCpHj5Ekj8PkTWaiUkDc3ziMDZIPj97tlYHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zyta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THdUeKnB;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C389606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C389606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zyta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THdUeKnB
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b3dc91781fso1844841a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793875400; x=1794480200; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=;
        b=THdUeKnBiBTn2SB6gxDxCinrJRPMq44JKrGQEdC/ISjQLeRR/ApqCnpyslvsZTUekR
         RBafyM9Nn4GcFjyPQ8GqX+yCSX9lIDha/IUPIHPX/DAMlPXfh87IHZm06rkDlqFucFVU
         pnXKZict1tyiMzQu9NkY6TL1Sbwio+aaB5kVm8cBnUAVIRa/Efz82iwvZfsdjh0QVV5y
         +mjiw1a0V6CnAY1J/sIMRKyjEkFKdRfh1aEvnJRFAiTrClyZ5YoSPWIqRxfMgNXgaoMN
         8T8DTblZ1mtcOY7jXR2zajDl1+yGi8y8h134ZlDAfeFoPqaJkNcoopv6tQHDtFLAQOeF
         OvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875400; x=1794480200;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMqzSCS0erpbygzu/gLDyREb4eAHjrFX8W3+ToVWtNg=;
        b=grVEbjrdzhBco2UHJy2Ocf3kIv4LrcxCmHVJr53qqgPg7CVTd8RXN1f5pL4XZ8VKk8
         OVTmX/yD0C6EtI6C+5WZedsrfC27xvLvWgBYO5r7NRymqARSSu07vDgZ+G+d335+yWS6
         hDVrwqkq+kShNXcu3iJnrWiowA9vSmtMD8kgyGx5WSHFc9Zn0w9lGpwtAneiyHiGmZzU
         iCTLx29eQDln0tdP4vmjOBIToQLVzoGENiXCyZ29ySoeIBMylCjZJAUwZEFQwzGNwlg4
         +xAQSUcblIVDWfW8gfNKUNnmeFC1/0c+8ItfKPweLl5xPWAJkhhzdXxtkC7FBeyZXjq6
         19yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMgwbvjNv9bz4tDQuphBqwCGQ2XJ0Ndm77Ny1Icel6ZDIoCX14X95dkP+yY+SldC1d0CZd1W2MJ6uD5YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hSwNg9E2m77n9VEMk3ATXoQyXvnVpbpUgczxPnyCC6agI0lnr
	HNIT0phVs4aZ7LM+vmgUjqIB+NQV4sicqyrcmu2lxQyCltEYYwieAHHytTI+rwrFRkbY5XC3aQ=
	=
X-Received: from edtr26.prod.google.com ([2002:aa7:cb9a:0:b0:6b4:1882:2675])
 (user=zyta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c4d2:20b0:6b4:16be:4fa
 with SMTP id 4fb4d7f45d1cf-6b4d467583fmr11096477a12.15.1793875399815; Thu, 05
 Nov 2026 02:43:19 -0800 (PST)
Date: Thu,  5 Nov 2026 10:42:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105104234.2734199-1-zyta@google.com>
Subject: [PATCH] irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ
From: Zyta Szpak <zyta@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Zyta Szpak <zyta@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, the MediaTek SYSIRQ (irq-mtk-sysirq) and CIRQ (irq-mtk-cirq)
interrupt controller drivers are unconditionally built whenever
CONFIG_ARCH_MEDIATEK is enabled, without a dedicated Kconfig symbol.

Not all MediaTek SoCs require SYSIRQ or CIRQ (for example, newer ARMv8
SoCs and platforms using the MStar interrupt controller), so building
these drivers unconditionally prevents disabling them in tailored kernel
configurations. Tying the build rule directly to CONFIG_ARCH_MEDIATEK in
the Makefile also prevents compile-testing these drivers on non-MediaTek
architectures via CONFIG_COMPILE_TEST.

Introduce the CONFIG_MTK_IRQ Kconfig option to control building
irq-mtk-sysirq.o and irq-mtk-cirq.o. Make it depend on ARCH_MEDIATEK ||
COMPILE_TEST, default to ARCH_MEDIATEK to preserve existing behavior for
all MediaTek configurations, and select IRQ_DOMAIN and
IRQ_DOMAIN_HIERARCHY as required by both drivers.

Signed-off-by: Zyta Szpak <zyta@google.com>
---
 drivers/irqchip/Kconfig  | 14 ++++++++++++++
 drivers/irqchip/Makefile |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..2edf121c7841 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -793,6 +793,20 @@ config MST_IRQ
 	help
 	  Support MStar Interrupt Controller.
 
+config MTK_IRQ
+	bool "MediaTek Interrupt Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default ARCH_MEDIATEK
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support for the MediaTek System Interrupt Controller (SYSIRQ) and
+	  Core Interrupt Controller (CIRQ) found on various MediaTek SoCs.
+	  SYSIRQ provides interrupt polarity configuration in front of the
+	  GIC, while CIRQ records and flushes external interrupts during
+	  system suspend and resume when the primary interrupt controller
+	  is powered down.
+
 config WPCM450_AIC
 	bool "Nuvoton WPCM450 Advanced Interrupt Controller"
 	depends on ARCH_WPCM450
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..eb539d41251e 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -72,7 +72,7 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
-obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_IRQ)			+= irq-mtk-sysirq.o irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.56.0.398.g882cbad275-goog

