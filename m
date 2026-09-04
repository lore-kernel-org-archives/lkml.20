Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0D34A3F33;
	Fri,  4 Sep 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529228; cv=none; b=jhpCrRMLwV9Bw/4m8+ggLJvlIn29Dg1k0ud9yDCXJuSIYksJXSsTB58oIjp7MOyYhDlYBjaKbMgLeglNwP9Nr6GJs0QIobvuK3vX1Enj7HENBiF5PUhAX9KbMzmCW1ZRXZMNV6hYk4rv2CzT3EB+XSniA5gAp5biooQ+rEFWhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529228; c=relaxed/simple;
	bh=6BdSLb+cHO+eSvDed6YmUg9Wb1s//L6KyADIDMhPZfo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=b7GAeZtnxy2q1+m3Rwbnw8Wm9x47AD1NWuzM19jxFMm0HNrf1JpEUgtxGBjTT/oJ5Kpal7OndyOiaxKJDHNKA4LFuO12thiwD65s7iUWPi1Dg5pRQxoj6ST9fi3KZVROcaM4BKYQLkcY/MA/6B4z3tTtjhP2rjeOK1JYQ6G1eWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TQNZoTAW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r43i7u7z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TQNZoTAW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r43i7u7z"
Date: Fri, 04 Sep 2026 13:40:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788529224;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTPX0eY6XhP327UQ/YafCCChkVVlIIKoUd1o0JDTo1A=;
	b=TQNZoTAWdwXy6bkNBNPnmO/s5NgQvrDMFDzVWXsxOHwVN+NH7REvTf2f0W2RBM4w7Vvz8T
	bY8Ae1rrGe9Ev+Z/iDmGK9QJXw9IzpeUKf4zzQ+IdQI7B9LTyE9gII6IrLzrR04AROYcQ+
	xSX+cMeT5TcznbfS7KpWyLx3DlNK2PNaUzopLxtOIWpeZjb8SshsF5rpVUzBnyLkenRfP7
	MUfCL6Jn28PxAcL61koTw0eIVf+NhYjh7ep49Dq7R7/x+R3vVCY+cCAnskxrqWHH9vxsM8
	VTxomDUyyw8TLyQPfywL21hPurbNA6PkbX7WC53aXGwZKCfaoyQrxFbDKcR27w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788529224;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTPX0eY6XhP327UQ/YafCCChkVVlIIKoUd1o0JDTo1A=;
	b=r43i7u7zcUKAMhMtrv7rdrzICWLTu8tZ0NEGH7ETD4mqf6a7bDaEtpgTumDo3nwhcbbTsf
	+8JvMeiGU6OlNeBw==
From: "tip-bot2 for Marc Zyngier" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/gic: Simplify Maintenance Interrupt ACPI parsing
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Radu Rendec <radu@rendec.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260725155941.114322-1-maz@kernel.org>
References: <20260725155941.114322-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178852922284.3717435.18102933094253806116.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     b36bfa477b77901a247e7a192e7404b39e9f522d
Gitweb:        https://git.kernel.org/tip/b36bfa477b77901a247e7a192e7404b39e9=
f522d
Author:        Marc Zyngier <maz@kernel.org>
AuthorDate:    Sat, 25 Jul 2026 16:59:41 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:33 +02:00

irqchip/gic: Simplify Maintenance Interrupt ACPI parsing

The ACPI spec describes the vgic Maintenance Interrupt with attributes
indicating whether the signalling is Level or Edge. While this
superficially looks like a sensible thing to do, it doesn't actually
make much sense.

By construction, this interrupt is Level, and cannot be anything
else, as the hypervisor actively needs to interact with the vgic
for the level to drop. This indicates a state, and not an event.

Get rid of this nonsense, always register the corresponding GSI as
Level, and let the user know that they run on quality FW should
the interrupt be advertised as Edge.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260725155941.114322-1-maz@kernel.org
---
 drivers/irqchip/irq-gic-v3.c | 10 +++-------
 drivers/irqchip/irq-gic.c    |  8 ++++----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b..b0fca8f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2276,7 +2276,6 @@ static struct
 	bool single_redist;
 	int enabled_rdists;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
=20
@@ -2454,21 +2453,19 @@ static int __init gic_acpi_parse_virt_madt_gicc(union=
 acpi_subtable_headers *hea
 {
 	struct acpi_madt_generic_interrupt *gicc =3D
 		(struct acpi_madt_generic_interrupt *)header;
-	int maint_irq_mode;
 	static int first_madt =3D true;
=20
 	if (!(gicc->flags &
 	      (ACPI_MADT_ENABLED | ACPI_MADT_GICC_ONLINE_CAPABLE)))
 		return 0;
=20
-	maint_irq_mode =3D (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-		ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
+	if (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
=20
 	if (first_madt) {
 		first_madt =3D false;
=20
 		acpi_data.maint_irq =3D gicc->vgic_interrupt;
-		acpi_data.maint_irq_mode =3D maint_irq_mode;
 		acpi_data.vcpu_base =3D gicc->gicv_base_address;
=20
 		return 0;
@@ -2478,7 +2475,6 @@ static int __init gic_acpi_parse_virt_madt_gicc(union a=
cpi_subtable_headers *hea
 	 * The maintenance interrupt and GICV should be the same for every CPU
 	 */
 	if ((acpi_data.maint_irq !=3D gicc->vgic_interrupt) ||
-	    (acpi_data.maint_irq_mode !=3D maint_irq_mode) ||
 	    (acpi_data.vcpu_base !=3D gicc->gicv_base_address))
 		return -EINVAL;
=20
@@ -2511,7 +2507,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	gic_v3_kvm_info.type =3D GIC_V3;
=20
 	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <=3D 0)
 		return;
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index f6bc29f..b2926a3 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1527,7 +1527,6 @@ static struct
 {
 	phys_addr_t cpu_phys_base;
 	u32 maint_irq;
-	int maint_irq_mode;
 	phys_addr_t vctrl_base;
 	phys_addr_t vcpu_base;
 } acpi_data __initdata;
@@ -1553,10 +1552,11 @@ gic_acpi_parse_madt_cpu(union acpi_subtable_headers *=
header,
 	if (cpu_base_assigned && gic_cpu_base !=3D acpi_data.cpu_phys_base)
 		return -EINVAL;
=20
+	if (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
+		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
+
 	acpi_data.cpu_phys_base =3D gic_cpu_base;
 	acpi_data.maint_irq =3D processor->vgic_interrupt;
-	acpi_data.maint_irq_mode =3D (processor->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
-				    ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
 	acpi_data.vctrl_base =3D processor->gich_base_address;
 	acpi_data.vcpu_base =3D processor->gicv_base_address;
=20
@@ -1616,7 +1616,7 @@ static void __init gic_acpi_setup_kvm_info(void)
 	vcpu_res->end =3D vcpu_res->start + ACPI_GICV2_VCPU_MEM_SIZE - 1;
=20
 	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
-				acpi_data.maint_irq_mode,
+				ACPI_LEVEL_SENSITIVE,
 				ACPI_ACTIVE_HIGH);
 	if (irq <=3D 0)
 		return;
