Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52B395ACC;
	Mon,  7 Sep 2026 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811025; cv=none; b=g9BD3gkcmfr+ggDBRU3w75Y6i3tSwcMuVsmQcMMdPr8CrUKchXiuVcMaMB5tNO6oTCqFQCBA7u7gw3JoWxQEYJ8x8SmdfoKRpspU4bxzlZoRMrT9pi5eCV1s9QQmgBSTAE34OEooeeDktM+vakt9Kkm5ywzj+o5FZ4BTkuJpQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811025; c=relaxed/simple;
	bh=b3UCEhQ3Ny1Yb8/Kr5Ss7x2pIj1yiWeZOYv3UnFdBsM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AYm1dg1jFlU8CF12dhfIjW2nv/FO0QBsXzTEEl3lEsjm9JfZws1cBjq1JeYplb3A/z0Ld9fSNoe3hw17/LRyR2xjaLglpvdt7al13K7SObnXk9MIvz+n5IYV5uLEpFuFs7QfZTPl5aF7rtHLfmIqONZIdUVPLvPV3xXgMXw5s/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Eeo78cw1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fEZUoVjq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Eeo78cw1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fEZUoVjq"
Date: Mon, 07 Sep 2026 19:56:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788811021;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXreyWHGrAqrSjarZl4/3x3sJa774oc3lKWjuD5gbH8=;
	b=Eeo78cw1fYmw7t0v2JFLcQJYXPyMAK/WdUqaFoBPw8PXxqRkrWSn/DMhpop1UvH/P5rb6+
	Rut/TantcxZ9RXpqMWbeR/GpQgyZzt69Fvkc5V33aJ3y8X4jLdqKC1j3Hp0f7BFoMNMoOx
	kra3Wz4dxytae0LnFxw/fKJk7faiteb912bWT7ei3iuFDyVlX9X3I9jzKxsvULHQo3dOo1
	qx8JoDgOTV5tjgN8fIiAgCX9mfvavy0pbrfX5ZXxRV3k8akOpBEVzb8gDy7ezYtmYqHW/8
	zH+nDGA5gRtvjIPFfDn0/ScHqlXHPUwLZS68YGe+6nsKCvcDEx1Tp+3kUlkTUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788811021;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXreyWHGrAqrSjarZl4/3x3sJa774oc3lKWjuD5gbH8=;
	b=fEZUoVjqEjWZSwAS3JIYyu39osqTynSU+1a0giNGR4Lc6rEEI1lCnHg9ihIIJdymC4fntX
	rcPOYmUlLi5ZfYAw==
From: "tip-bot2 for Adrian Ng Ho Yin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600
 DMA32 erratum workaround
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Cfc927e43892b86200e157fa303b0d1dd344caffd=2E1788751?=
 =?utf-8?q?033=2Egit=2Eadrian=2Eho=2Eyin=2Eng=40altera=2Ecom=3E?=
References: =?utf-8?q?=3Cfc927e43892b86200e157fa303b0d1dd344caffd=2E17887510?=
 =?utf-8?q?33=2Egit=2Eadrian=2Eho=2Eyin=2Eng=40altera=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881101929.623050.5833110394894249071.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     0c65a1331928d0207c385f03fb5eba0cfecce0e6
Gitweb:        https://git.kernel.org/tip/0c65a1331928d0207c385f03fb5eba0cfec=
ce0e6
Author:        Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
AuthorDate:    Mon, 07 Sep 2026 16:22:59 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:53:05 +02:00

irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600 DMA32 erratum workaround

Agilex5 integrates GIC600 with an ACE-lite interface limited to a 32-bit
address bus, so the ITS can only access the first 4 GB of physical address
space. Register intel,socfpga-agilex5 on the existing
dma_32bit_impaired_platforms list so ITS allocations use GFP_DMA32.

The workaround is guarded by ALTERA_ERRATUM_AGILEX5_2_1_23, which is
selected by ARCH_INTEL_SOCFPGA as all Agilex5 devices are affected.

This limitation is documented as Agilex 5 ES Device Errata 2.1.23 (825514).

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://docs.altera.com/r/docs/825514/current/agilex-5-es-device-errata=
-and-user-guidelines/hps-gicv3-its-and-lpi-unable-to-access-physical-memory-l=
arger-than-32-bits-causing-msi-x-interrupt-failure
Link: https://lore.kernel.org/linux-arm-kernel/372f059069a5551ea1096015f855cc=
306dbd7cd4.1747368554.git.adrianhoyin.ng@altera.com/ # v1
Link: https://lore.kernel.org/linux-arm-kernel/6a44509ca0edaabc17e59d2e27fef1=
c782183456.1751618484.git.adrianhoyin.ng@altera.com/ # v2
Link: https://lore.kernel.org/linux-arm-kernel/20260622024945.21354-1-muhamma=
d.nazim.amirul.nazle.asmade@altera.com/ # v3 (untagged)
Link: https://lore.kernel.org/all/20260904091114.2259616-1-adrian.ho.yin.ng@a=
ltera.com/ #v4
Link: https://patch.msgid.link/fc927e43892b86200e157fa303b0d1dd344caffd.17887=
51033.git.adrian.ho.yin.ng@altera.com
---
 Documentation/arch/arm64/silicon-errata.rst |  3 +++
 arch/arm64/Kconfig                          |  9 +++++++++
 arch/arm64/Kconfig.platforms                |  1 +
 drivers/irqchip/irq-gic-v3-its.c            |  3 +++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch=
/arm64/silicon-errata.rst
index ac3248b..25afa79 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -53,6 +53,9 @@ stable kernels.
 | Allwinner      | A64/R18         | UNKNOWN1        | SUN50I_ERRATUM_UNKNOW=
N1     |
 +----------------+-----------------+-----------------+----------------------=
-------+
 +----------------+-----------------+-----------------+----------------------=
-------+
+| Altera         | SoCFPGA Agilex5 | 2.1.23          |ALTERA_ERRATUM_AGILEX5=
_2_1_23|
++----------------+-----------------+-----------------+----------------------=
-------+
++----------------+-----------------+-----------------+----------------------=
-------+
 | Ampere         | AmpereOne       | AC03_CPU_38     | AMPERE_ERRATUM_AC03_C=
PU_38  |
 +----------------+-----------------+-----------------+----------------------=
-------+
 | Ampere         | AmpereOne       | AC03_CPU_57     | N/A                  =
       |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0..d25c77a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1427,6 +1427,15 @@ config NVIDIA_OLYMPUS_1027_ERRATUM
=20
 	  If unsure, say Y.
=20
+config ALTERA_ERRATUM_AGILEX5_2_1_23
+	bool
+	help
+	  The Altera SoCFPGA Agilex5 GIC600 SoC integration has ACE-lite
+	  addressing limited to the first 32bit of physical address space,
+	  so the ITS cannot access memory above 4GB.
+
+	  Selected by ARCH_INTEL_SOCFPGA, as all Agilex5 devices are affected.
+
 config RENESAS_ERRATUM_GEN4GICITS1
 	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above 4 =
GiB"
 	default y
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac..07127f7 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -361,6 +361,7 @@ config ARCH_SEATTLE
=20
 config ARCH_INTEL_SOCFPGA
 	bool "Intel's SoCFPGA ARMv8 Families"
+	select ALTERA_ERRATUM_AGILEX5_2_1_23
 	help
 	  This enables support for Intel's SoCFPGA ARMv8 families:
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index b0fdc2b..b6509b4 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4896,6 +4896,9 @@ static bool __maybe_unused its_enable_quirk_hip09_16210=
0801(void *data)
 }
=20
 static const char * const dma_32bit_impaired_platforms[] =3D {
+#ifdef CONFIG_ALTERA_ERRATUM_AGILEX5_2_1_23
+	"intel,socfpga-agilex5",
+#endif
 #ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
 	"renesas,r8a779f0",
 	"renesas,r8a779g0",
