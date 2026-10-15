Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93135208CB;
	Thu, 15 Oct 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067550; cv=none; b=LnpaOAku3HbRbxX/n8lgP1BqV+TDqf++5uiI48FVXdjw7thHhWirC+NlIwCdTtKXN8Cr3Zmg05qWPUh+BT9tgI253fmPe3Dh3QLDxAYPBwAPE2hlc03SM7nAoDZFGRzwjSG2rIBNCoNLTZZGU0AJqZpJcZwdsywK6KgsU68ByQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067550; c=relaxed/simple;
	bh=rFPVi4EOEXxOsbNDVWQ3y9/46UUFL4G9T6zdHHNFgrw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=DgCCYBkzZwDUEUeAE/cE78ZUxjD8mEpXwhqCmSotmLU+E/XDQlpVWX4e2VJlu3615IfgJSUOTbO1pwDnGMhyHtfGhscIudCvikmncyF6zai74S3DXqkxmMQvGOXH25Pd+cEKfPcwC8wkpB7Jc/ixAluxsRz4sPs4eJaiiZKWEqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3si+jiRT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m1RX/Yp5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3si+jiRT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m1RX/Yp5"
Date: Thu, 15 Oct 2026 12:32:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067547;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mp1A6eeebhTW2VRNauhmOz5hDaI3gcXzhZzn6K+2FY=;
	b=3si+jiRTppe64KE5HPjIWOkYqLh5S9yR/8cnFUrBExNEAmv8k6Vh8v4xi4VO/jQHoKwUu+
	wqDfQbEl+UgJy4LwRcNcJVYJxkBiMkz1xFKQyBSS8PI8iBvXOFmkBmZbd6tmf3s3OrVPj2
	eyiQYX8HYtj6NFfWvpjq4GcSp8V4B5vR8UR9V+9rrVDcoo1nFt5O9/OBaPxkoIo/TFpKoF
	2BlHW3migKfHeoo/vJpv0CPii3b4pwQRnlPdGNmHLv9gib366cenFB3qtf4KwtY3jZouSm
	vjj/XapPyP3+kAvmaVxZT+2Rslh3KSZtHDNbPwK2EPqpb2jiOxO1lcI6ZZThUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067547;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4mp1A6eeebhTW2VRNauhmOz5hDaI3gcXzhZzn6K+2FY=;
	b=m1RX/Yp5cJ0wqqEZvIcHli+rVZd1OZyGsVHJ56cYeeYTlIbNMngc642iRwLs0Jq8DjE+LB
	cwbY1bIaLiNfP5Dw==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Switch to shared parent interrupt
Cc: Talel Shenhar <talel@amazon.com>, Eliav Farber <farbere@amazon.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-6-farbere@amazon.com>
References: <20261011050449.41903-6-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754558.2666988.7125314153372781286.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     8db4c1dede9b7adb53e2ff3e448718d5e924ec35
Gitweb:        https://git.kernel.org/tip/8db4c1dede9b7adb53e2ff3e448718d5e92=
4ec35
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:44=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip/al-fic: Switch to shared parent interrupt

Until now the driver requested its parent interrupt using the chained IRQ
API (irq_set_chained_handler_and_data()), which only works when each
parent interrupt is wired to a single FIC instance.

A FIC controller is built from groups, each described by its own DT node,
and the groups of one controller share that controller's output line
toward the parent. So a real devicetree has several FIC nodes on one
parent GIC SPI, and a chained handler can only be installed once per
parent. Cascading compounds this: an aggregating group collects several
peripherals' outputs onto the line above it.

To support that, request the parent interrupt as a shared interrupt
(IRQF_SHARED) instead of installing a chained handler. The handler now has
the standard irqreturn_t prototype and reports whether this instance had
anything pending, so the shared-IRQ core can tell which instance on the
line raised the interrupt. IRQF_NO_THREAD is set because the handler only
demultiplexes to the child domain and must not be forced-threaded; all
instances sharing a parent line agree on this flag, as the shared-IRQ core
requires.

The handler reads the group's cause register and returns IRQ_HANDLED when
any unmasked cause bit is set, IRQ_NONE otherwise. That is the signal the
shared-IRQ core needs - "did this instance's hardware raise the line" -
rather than the result of dispatching to the child domain.

For that filter to be right, gc->mask_cache must be valid before the parent
is requested. IRQ_GC_INIT_MASK_CACHE seeds it from the mask register only
on the first child mapping, and never at all for a group with no consumer
in the devicetree; until then the cache reads 0 and every latched cause bit
passes the filter. Seed it from the value al_fic_wire_init() programmed and
drop the flag; nothing can change the register in between, so the read
could only have returned that same value.

request_irq() can fail, unlike irq_set_chained_handler_and_data(), so add
an error path for it. Set IRQ_DOMAIN_FLAG_DESTROY_GC on the domain after
creating it, so irq_domain_remove() tears the generic chips down too and
the single call suffices for both the chip-allocation and request_irq()
failure paths.

Co-developed-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Talel Shenhar <talel@amazon.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-6-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 30740d7..e664c33 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -4,9 +4,9 @@
  */
=20
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -94,24 +94,21 @@ static int al_fic_irq_set_type(struct irq_data *data, uns=
igned int flow_type)
 	return 0;
 }
=20
-static void al_fic_irq_handler(struct irq_desc *desc)
+static irqreturn_t al_fic_irq_handler(int irq, void *data)
 {
-	struct al_fic *fic =3D irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
+	struct al_fic *fic =3D data;
 	struct irq_domain *domain =3D fic->domain;
 	struct irq_chip_generic *gc =3D irq_get_domain_generic_chip(domain, 0);
 	unsigned long pending;
 	u32 hwirq;
=20
-	chained_irq_enter(irqchip, desc);
-
 	pending =3D readl_relaxed(fic->base + AL_FIC_CAUSE);
 	pending &=3D ~gc->mask_cache;
=20
 	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
 		generic_handle_domain_irq(domain, hwirq);
=20
-	chained_irq_exit(irqchip, desc);
+	return pending ? IRQ_HANDLED : IRQ_NONE;
 }
=20
 static int al_fic_irq_retrigger(struct irq_data *data)
@@ -136,9 +133,15 @@ static int al_fic_register(struct device_node *node, str=
uct al_fic *fic)
 		return -ENOMEM;
 	}
=20
+	/*
+	 * Let irq_domain_remove() free the generic chips on either error path
+	 * below, instead of calling irq_domain_remove_generic_chips() by hand.
+	 */
+	fic->domain->flags |=3D IRQ_DOMAIN_FLAG_DESTROY_GC;
+
 	ret =3D irq_alloc_domain_generic_chips(fic->domain, NR_FIC_IRQS,
 					     1, of_node_full_name(fic->node), handle_level_irq,
-					     0, 0, IRQ_GC_INIT_MASK_CACHE);
+					     0, 0, 0);
 	if (ret) {
 		pr_err("fail to allocate generic chip (%d)\n", ret);
 		goto err_domain_remove;
@@ -156,7 +159,21 @@ static int al_fic_register(struct device_node *node, str=
uct al_fic *fic)
 	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
 	gc->private =3D fic;
=20
-	irq_set_chained_handler_and_data(fic->parent_irq, al_fic_irq_handler, fic);
+	/*
+	 * Seed the mask cache with the value al_fic_wire_init() programmed,
+	 * rather than having the generic chip read the register back on the
+	 * first child mapping: that is later than the parent is requested, and
+	 * never happens at all for a group with no consumer in the devicetree.
+	 */
+	gc->mask_cache =3D ~0U;
+
+	ret =3D request_irq(fic->parent_irq, al_fic_irq_handler, IRQF_NO_THREAD | I=
RQF_SHARED,
+			  of_node_full_name(fic->node), fic);
+	if (ret) {
+		pr_err("fail to request irq (%d)\n", ret);
+		goto err_domain_remove;
+	}
+
 	return 0;
=20
 err_domain_remove:
