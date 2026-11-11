Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426988;
	b=Ul0SfhnFF/g3JKxQTRAvZ1A18iCKyryjJU5bYlii9HRCzSWSxxdlquIkwxT0er0cZ9ke
	 5KfgbfDHADxF7ZGLAd2Otfm8EyV5vzGJIWiKxMJ+730++bBDTpMCoZ/YXfelv3o+HXVWw
	 JXxWo1H5HvlwKMJu9cVRTpVGVrlrEm7BcrmQsmDc4ObgTbSUibr7oEgjAhOB6fDHwz/yc
	 K7edGuZ2zHOYpfXbZZ2Q1TxURg9ySgwNTjsCoeT0NreKI8S1ppbbT2DHkO1/J/j2kq0US
	 FoKJZMI4ZEWdVu424xqkrfN1wu3/AuCeDf3Z3C6tkH1xl47TqKCUg6ZbHoDSgkShngQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426988;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=v3Qa5vOCuuvOXb/Xv35GctSnGrHaFWpH9kgty02qfxM=;
	b=un7Bo/MlBg9YzipW4kRxFyJTyK6nnEZWMf9Arel4qpOnqoyKPTDmoTYya+gCC7STbLhm
	 ihw2DnYHeLqJPep4Jko+8aaw6EIrCpFQax0Vuueekb8AtbgtMWfwoqJY62ozEBnP1o3/H
	 ncajELubyzKNl3BmJ2wy4jcwIl2x42lOBqyPKd0zJARfLEV17FXLDYvPPLavWmvKgz/vy
	 lEKIFYVoHHzAvdFJVST1U7ezTFhWkWrbBK3rp7rLXfQ6QVknhACeZlqD1jFdXoPK2vGaA
	 D+KJDMaXl6vQGcGUXN7W4E/SpV8QLmoREX05mHaxWoML8aes6TmowGFguVjN/kahGpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ywxRhDZD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CIYcXcjD;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948160A2633;
	Wed, 11 Nov 2026 19:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9948160A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ywxRhDZD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CIYcXcjD
Date: Wed, 11 Nov 2026 19:56:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794426986;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3Qa5vOCuuvOXb/Xv35GctSnGrHaFWpH9kgty02qfxM=;
	b=ywxRhDZDlB6lvZtz1OFgHVmpKtfC67+/KrExNc0NDRLfyZSx2J28LQo7tGJ+cbub9HEl5Z
	Xj2V1yxEeTPXDR0PF8X1CLZj6pzqL7u1BRBaVntsP/8cQDCzB+lixOs1vIw/fgGtHzcVIE
	m69K0h9sVxj57MPDo+cQWpXaSF4swKCnJWSvIIoGC4dyW6M8GqmWe92y5L21xkyhTPkGlX
	Mr3s2wdjT3s/m3CUNYyqRQZQGqbzFnNNlHlSpIK6Xr9NhZOET5j0ZKOI2O58OzgEIFhwex
	OxE2qGEnyUym28EaP0GXgiR8wrYgNgwtTHwmUfIGbp0AYQaqodJLm93RT7WUsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794426986;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3Qa5vOCuuvOXb/Xv35GctSnGrHaFWpH9kgty02qfxM=;
	b=CIYcXcjD0Tb635P5hkG+5PLlT2ICRAG83dQBY/5z3N29UY/crVrm9jHr5tQepXHu4fPamO
	YMZKm8drhOVLhNBA==
From: "tip-bot2 for Zyta Szpak" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/mediatek: Add Kconfig option for MediaTek
 SYSIRQ and CIRQ
Cc: Zyta Szpak <zyta@google.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105104234.2734199-1-zyta@google.com>
References: <20261105104234.2734199-1-zyta@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179442698465.2093942.14344894051795365589.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     702ae15488ce96d9818deee812d9fc271316fa6e
Gitweb:        https://git.kernel.org/tip/702ae15488ce96d9818deee812d9fc27131=
6fa6e
Author:        Zyta Szpak <zyta@google.com>
AuthorDate:    Thu, 05 Nov 2026 10:42:34=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 11:16:45 +01:00

irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ

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
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261105104234.2734199-1-zyta@google.com
---
 drivers/irqchip/Kconfig  | 14 ++++++++++++++
 drivers/irqchip/Makefile |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 1620a57..90daedb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -793,6 +793,20 @@ config MST_IRQ
 	help
 	  Support MStar Interrupt Controller.
=20
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
index 16a5fd1..eb539d4 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -72,7 +72,7 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+=3D irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+=3D irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+=3D irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+=3D irq-mips-gic.o
-obj-$(CONFIG_ARCH_MEDIATEK)		+=3D irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_IRQ)			+=3D irq-mtk-sysirq.o irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+=3D irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+=3D irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+=3D irq-ingenic.o
