Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0549CF5E;
	Thu, 15 Oct 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067544; cv=none; b=fAmWzxGf8adTth06k5vY9ra3K4LOXerNX5esIXXRmI1XZnMkCT0BCFSE3aPpEp4fZYifMeotI3vj64Kx0fw5dQORuG/q3yehiz6oszkAM8axg/nQqBx9Bbs8GEv2r36iKQmBkzwPn3u6+sj490PqthE6otbs6WYgtahWipKPWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067544; c=relaxed/simple;
	bh=FyyaOEhnBF94hZV0JMAkfk8DL52D9flspgyyEVYeo7Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=QSGRedRhbf0dxHu+HbCwA2EvOJ36Zxiee/6SYXzlIv1e0HhuT9VZATozFOODg5+9pZjUnIE6MX4VD35LcM738SfYAWWhM2k0QQ4HHfrgxc9OAJbhOFFX12E5N9gZjuTjFSXEmsbSJNSXQ5cDnO+3vlNcXNpeo5H3xjr3vYFkAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f4SjTBmo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=muV5442J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f4SjTBmo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="muV5442J"
Date: Thu, 15 Oct 2026 12:32:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067541;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WEvIjzAjOLQ9j1wMuXr93SLf3PUmNMOIdbcxcme+g+I=;
	b=f4SjTBmoL+2IxXCicpqUPhaqKqy1JQN4pbbzN21LNq6iEYtM8CuFv+xVPQmyun1VA8I7jl
	LPkw5hCofliSfXx5y7gXPoOBvJ6MwpvF3htsnT75fSwO5I5QOhZN4RBrqrOXiVWgs+42pQ
	cko+NEj5yuRSLytXlHFGCUNlCXpuO/RxShYCaGf3LGWxvk5Bexq0NlEob39AWjryBC1pkK
	AUfoQN215oryRFE/bUX6n3Miolta1EEER0/awd7QdIiBswL2Kw/HUs/X6AOOAYYOqf61Gz
	TB+ikI1h2+FnKXjEmNmAI3Nl3j/KiFnLRZvycn9msVmnT3ITHYxXTCh+i8VxJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067541;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WEvIjzAjOLQ9j1wMuXr93SLf3PUmNMOIdbcxcme+g+I=;
	b=muV5442JBuPe3oUvDcXCxBhTr9+cfJicPIQtvXTomgMdvk7KZrnwXTktbI/PkxS80QxwtL
	HFk/uK1X4FZrpTBw==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/al-fic: Support per-child affinity via
 interrupt redirection
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-10-farbere@amazon.com>
References: <20261011050449.41903-10-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206753915.2666988.12699252625128366474.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     9376df3496753563e3d7f7cb5d91525f9a6e9497
Gitweb:        https://git.kernel.org/tip/9376df3496753563e3d7f7cb5d91525f9a6=
e9497
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:48=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:07 +02:00

irqchip/al-fic: Support per-child affinity via interrupt redirection

The FIC multiplexes up to 32 sources into one parent GIC SPI, and a
child's handler runs in the parent's context, so a child has no affinity
control of its own. irq_set_affinity() therefore fails with -EINVAL, and
drivers that treat that as fatal cannot probe when their interrupt
arrives through a FIC group. The parent routing cannot be changed on
behalf of one child either, because several FIC groups may share one SPI
and all of them would move with it.

Use the interrupt redirection infrastructure. Dispatch children with
generic_handle_demux_domain_irq() and set irq_set_affinity to
irq_chip_redirect_set_affinity(), so a child whose affinity excludes the
CPU taking the parent interrupt runs on its target CPU in IRQ work
context. The interrupt is still taken on the parent's CPU; only the
child's handler body moves.

Redirection defers the whole flow handler, so the cause bit is cleared in
al_fic_irq_pre_redirect(), which runs in parent context on both the
inline and the redirected path. A level configured group is masked there
too, because its cause bit re-latches while the input stays asserted; the
deferred handle_level_irq() masks again and unmasks when the handler is
done. An edge configured group is only acked, since handle_edge_irq() has
no unconditional unmask. irq_ack is a noop because irq_pre_redirect runs
on every dispatch and the ack must not happen twice.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261011050449.41903-10-farbere@amazon.com
---
 drivers/irqchip/irq-al-fic.c | 49 ++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index eb74c52..e6068e0 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -140,8 +140,15 @@ static irqreturn_t al_fic_irq_handler(int irq, void *dat=
a)
 	pending =3D readl_relaxed(fic->base + AL_FIC_CAUSE);
 	pending &=3D ~gc->mask_cache;
=20
-	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
-		generic_handle_domain_irq(domain, hwirq);
+	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS) {
+		/*
+		 * Redirect a child whose affinity excludes this CPU to its
+		 * target CPU via irq_work. The ack moves to
+		 * al_fic_irq_pre_redirect(), because the whole flow handler is
+		 * deferred when that happens.
+		 */
+		generic_handle_demux_domain_irq(domain, hwirq);
+	}
=20
 	return pending ? IRQ_HANDLED : IRQ_NONE;
 }
@@ -156,6 +163,32 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
=20
+#ifdef CONFIG_SMP
+/* The ack happens in al_fic_irq_pre_redirect() on both paths instead. */
+static void al_fic_ack_noop(struct irq_data *data) { }
+
+/*
+ * Runs in the parent interrupt context on every dispatch, redirected or not.
+ * Clear the cause bit here: once the flow handler is deferred, the FIC keeps
+ * driving its output until the irq_work runs, and a level parent SPI re-fir=
es.
+ *
+ * A level configured group is masked too, because its cause bit re-latches
+ * while the input stays asserted; the deferred handle_level_irq() unmasks
+ * when the handler is done. An edge configured group is only acked, since
+ * handle_edge_irq() never unmasks unconditionally and the mask would stay.
+ */
+static void al_fic_irq_pre_redirect(struct irq_data *data)
+{
+	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
+	struct al_fic *fic =3D gc->private;
+
+	if (fic->state =3D=3D AL_FIC_CONFIGURED_LEVEL)
+		irq_gc_mask_set_bit(data);
+
+	irq_gc_ack_clr_bit(data);
+}
+#endif /* CONFIG_SMP */
+
 static int al_fic_register(struct device_node *node, struct al_fic *fic, enu=
m al_fic_id fic_id)
 {
 	struct irq_chip_generic *gc;
@@ -188,9 +221,19 @@ static int al_fic_register(struct device_node *node, str=
uct al_fic *fic, enum al
 	gc->chip_types->regs.ack =3D AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask =3D irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask =3D irq_gc_mask_clr_bit;
-	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type =3D al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger =3D al_fic_irq_retrigger;
+#ifdef CONFIG_SMP
+	/*
+	 * The FIC has no hardware affinity control, so give each child real
+	 * affinity by redirecting its handler to the target CPU.
+	 */
+	gc->chip_types->chip.irq_ack =3D al_fic_ack_noop;
+	gc->chip_types->chip.irq_pre_redirect =3D al_fic_irq_pre_redirect;
+	gc->chip_types->chip.irq_set_affinity =3D irq_chip_redirect_set_affinity;
+#else
+	gc->chip_types->chip.irq_ack =3D irq_gc_ack_clr_bit;
+#endif
 	gc->chip_types->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
 	gc->private =3D fic;
=20
