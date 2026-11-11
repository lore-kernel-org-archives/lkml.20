Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426989;
	b=qjDI8N1DufrdB1XsYCKJACgRquJXwywR6fdRW/HGhLNBtRejt1KIQbxPkLjqCCYAmG2J
	 61+Jc0hwx+EdVaDp7HCbj7Ofg3EaS6du+yBGwcC9qx7dmHyvZ+CGoM/5VXZgL8E5tGNT/
	 0IUnt9e62IKZQtngNg52Tw9kL3dMr88d5iLLCLgVFvONqFeOsbeuL6RbIofz0xxtEgG0E
	 FzxeLVL0GEejqO5oRIYSZyFh0QL2pyICyUW2WiVOu1uvv5QzBKj4KuYLv/hZtbXnGC6Wu
	 /J1s5tiMaYlFFkmDkYnm3EV6UpB2jy474T3Z13hG/R3jlGY6A6bYsE6+60GTtDxatJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426989;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=IZC92NAT45T5ByMF8WzT4ou/UAFGH2EerpRaarMuct4=;
	b=fqe8P713H9/3NJnKJzp/rbYxLpsEF1zb52h5JxEQaDRQZkm2FeAo9vFB6x9IrINTTDEM
	 mnob2crhzn9v4vpKdj/N4b5+oADiGjbvEUiiNZZiMKJ5Ssjr042rSz5c17a8VAK7tbYHx
	 6evjzMd2ZhoK4bUkF3ko6ccL0AYbiAnE+VZGrEBwLnOK79sRmKIvaJomb+hC3JnOfk5la
	 6g3mnfz0lje6tLvQv4DZBmbQXPLHMlS3DAixUlgcCQL/ZBIPWebILrp32ksp1IzIOIZWE
	 X/T/9WwLYA4xRGLGeUo2kSzU81bKNJmqVju8Y7vGOWF5G97eV7GIbLuZ18cIx8/svow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=czYYqTpc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cDsVAqne;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF0F60A3813;
	Wed, 11 Nov 2026 19:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF0F60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=czYYqTpc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cDsVAqne
Date: Wed, 11 Nov 2026 19:56:26 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794426987;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZC92NAT45T5ByMF8WzT4ou/UAFGH2EerpRaarMuct4=;
	b=czYYqTpc4crt2sx8vwqKPTv1JtwuTm4T4Czp5Yjid1GY+xRKoVvE/fMfNEwRLoWw2C3NHu
	+MzCOTGTZB0JiDKhydFRs5ZG820ZeSj13H76gtiXlb7brorBkJZcXoutHdxElN/nRzmRp3
	znd13/ll3wpxTlpqoISZ0Rdhp5ASZolqewrxsaJKPiBzmespXUKNknvyWEyJ4WChbz+Dnl
	9aqCYLIMuBXUp96ypqXXzs1Yi+edfe0gceYKC35R0C0NC4shWFDsGDZn8s+Irsw3lxPbEF
	UsDFE/My6kWxzzEydARAxDLMOUfaMgJ6NnPAWWFh1CaWczcY1uimPjNyi5WhVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794426987;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZC92NAT45T5ByMF8WzT4ou/UAFGH2EerpRaarMuct4=;
	b=cDsVAqneaHQztUPck5cut8iAPaBJHZIGvCosfTAk2BNTszguAhpBIP0wLLCu92HRe+2eDQ
	J4fTPDSF1DDzl1DA==
From: "tip-bot2 for Konrad Dybcio" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-topic-pdc_map_espi-v2-1-64431c8f8ac3@oss.qualcomm.com>
References: <20261102-topic-pdc_map_espi-v2-1-64431c8f8ac3@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179442698609.2093942.16767483897709073950.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     d793f5346645adbafa2385dee4c16bd6b5d384a5
Gitweb:        https://git.kernel.org/tip/d793f5346645adbafa2385dee4c16bd6b5d=
384a5
Author:        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
AuthorDate:    Mon, 02 Nov 2026 16:45:48 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 11:16:44 +01:00

irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges

The qcom,pdc-ranges property maps GIC interrupts to PDC output pins.
That data is then subsequently used by irq_domain to resolve into the
interrupt parent (which again, is always GIC).

The code that handles this hardcodes parent_fwspec.param[0] =3D 0
(GIC_SPI). Make that conditional to prevent this warning at boot:

GICv3: SPI 4115 out of range (use ESPI?)

Fixes: 81ef8bf88065 ("irqchip/qcom-pdc: Add irqdomain for wakeup capable GPIO=
s")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102-topic-pdc_map_espi-v2-1-64431c8f8ac3@=
oss.qualcomm.com
---
 drivers/irqchip/qcom-pdc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 29025a2..6c2a2d1 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
=20
 #define PDC_MAX_IRQS			256
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
@@ -597,8 +598,14 @@ static int qcom_pdc_alloc(struct irq_domain *domain, uns=
igned int virq,
=20
 	parent_fwspec.fwnode      =3D domain->parent->fwnode;
 	parent_fwspec.param_count =3D 3;
-	parent_fwspec.param[0]    =3D 0;
-	parent_fwspec.param[1]    =3D pin_to_hwirq(region, hwirq);
+	/* GIC ESPIs start at 4096 */
+	if (pin_to_hwirq(region, hwirq) >=3D 4096) {
+		parent_fwspec.param[0] =3D GIC_ESPI;
+		parent_fwspec.param[1] =3D pin_to_hwirq(region, hwirq) - 4096;
+	} else {
+		parent_fwspec.param[0] =3D GIC_SPI;
+		parent_fwspec.param[1] =3D pin_to_hwirq(region, hwirq);
+	}
 	parent_fwspec.param[2]    =3D type;
=20
 	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
