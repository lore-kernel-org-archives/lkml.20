Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968851AEF3;
	Thu, 15 Oct 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058779; cv=none; b=X7AnWWxK63ouWeU6JSTdyJgkPacJiC67WSggUUp7zeOL6nd1+4RNX6ROToWmFCT2EsbipXRXZZH7SovUhypmHOk4wGwKGSNry3sJ9T+uAiGdatCxBP/x3aYkoej+QKaH2TISYgpJY2E/ceACgMRhQIQkjuMPVc5YhzkzQ//rGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058779; c=relaxed/simple;
	bh=ZX5k/EnZRi1utnC1pbChceK0LiGn25KFfm74256dcIg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OMGSpx3khHpn2jEaf7zbv4eFcRNeXTMn8BkZl9G+0RywC4ulvIxQEiR+kqLV+OEOXfKXWklw7+h0Y6FAz7Hv8Grc93/IMtsH3/c8ab+FaNiMlVngoEfRgExa+w6ULWzeCApFzFLpMhO6DqI+sqJnhNjZnLYgh4tHG52w40IUnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QOGsoKo/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0HaWPnh6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QOGsoKo/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0HaWPnh6"
Date: Thu, 15 Oct 2026 10:06:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058775;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLazE3xna2zS2GaFly8hjwdXTcnAIzvkVmc+2iB4H/0=;
	b=QOGsoKo/4ET3p+DW2KNDvLGEhph/7/Y4fFd4PN4uF1V6sarhEJxvqjotHvbbjRowHQBPrZ
	hP4nW4tiIz+hG7oHBWJ+nOge2LebrAwH88/oqJDreJiOE3N4jZ/qbjOmqcC51i4LuPQJaQ
	heebTSNtksgxLmRkNlT6KsfPqrIYpO8t8kxShBxwGFcCCiLTt4cV5Yi96ZEFMBnX6Z4gNL
	Pb+ZbSmfd5/BqqoW0HEb3dEjG+DYC5LIwZTNs7ZmG8OtHGbOX1LPx+qhUuqmZV05q9xfCW
	qfO3jv+Eo2pjacuiejk/hkRS5gESEo3ugJ9UOasU3hJm59l+VlaGL/MsWWRNIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058775;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLazE3xna2zS2GaFly8hjwdXTcnAIzvkVmc+2iB4H/0=;
	b=0HaWPnh6e0mW3XqjS2oV1ycUA8xx4v80qroi45dkSad7kSOlJubua9FkLyygzSERRN3P4i
	hFW+W9RXWpyIMGBA==
From: tip-bot2 for =?utf-8?q?Beno=C3=AEt?= Monin <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/mips-gic: Transfer interrupt mask state
 across clusters
Cc: benoit.monin@bootlin.com, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929-sync-gic-counters-v4-3-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-3-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205877383.2666988.17074037590508874433.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     a5f0dc656e89d0eb140547823a36212902cdf673
Gitweb:        https://git.kernel.org/tip/a5f0dc656e89d0eb140547823a36212902c=
df673
Author:        Beno=C3=AEt Monin <benoit.monin@bootlin.com>
AuthorDate:    Tue, 29 Sep 2026 14:14:10 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:02:17 +02:00

irqchip/mips-gic: Transfer interrupt mask state across clusters

When an interrupt's affinity is moved to a CPU in another cluster,
gic_set_affinity() updates the routing (GIC_SH_MAP_VP) and trigger type
in the destination cluster, but never touched the interrupt's mask state.

The interrupt mask is per-cluster. After such a move the interrupt may
be left disabled in the destination cluster, so it never fires despite
being correctly routed to its new VP.

Move the mask state along with the interrupt: disable it in the old
cluster while clearing the route so it is no longer delivered, then
configure the trigger type in the new cluster and re-enable it there
if it was enabled in the old cluster.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Link: https://patch.msgid.link/20260929-sync-gic-counters-v4-3-ec70c4b60434@b=
ootlin.com
---
 drivers/irqchip/irq-mips-gic.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f2ae60d..be38989 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -368,6 +368,7 @@ static int gic_set_affinity(struct irq_data *d, const str=
uct cpumask *cpumask,
 	unsigned int irq =3D GIC_HWIRQ_TO_SHARED(d->hwirq);
 	unsigned int cpu, cl, old_cpu, old_cl;
 	unsigned long flags;
+	bool enabled;
=20
 	/*
 	 * The GIC specifies that we can only route an interrupt to one VP(E),
@@ -389,15 +390,20 @@ static int gic_set_affinity(struct irq_data *d, const s=
truct cpumask *cpumask,
 	raw_spin_lock_irqsave(&gic_lock, flags);
=20
 	/*
-	 * If we're moving affinity between clusters, stop routing the
-	 * interrupt to any VP(E) in the old cluster.
+	 * If we're moving affinity between clusters, save the interrupt's
+	 * mask state, stop routing it to any VP(E) in the old cluster and
+	 * disable it there so it is no longer delivered.
 	 */
 	if (cl !=3D old_cl) {
 		if (gic_irq_lock_cluster(d)) {
+			enabled =3D read_gic_redir_mask(irq);
 			write_gic_redir_map_vp(irq, 0);
+			write_gic_redir_rmask(irq);
 			mips_cm_unlock_other();
 		} else {
+			enabled =3D read_gic_mask(irq);
 			write_gic_map_vp(irq, 0);
+			write_gic_rmask(irq);
 		}
 	}
=20
@@ -409,10 +415,20 @@ static int gic_set_affinity(struct irq_data *d, const s=
truct cpumask *cpumask,
=20
 	/*
 	 * If we're moving affinity between clusters, configure the interrupt
-	 * trigger type in the new cluster.
+	 * trigger type and, if it was enabled in the old cluster, enable it
+	 * in the new one.
 	 */
-	if (cl !=3D old_cl)
+	if (cl !=3D old_cl) {
 		gic_set_type_locked(d, irqd_get_trigger_type(d));
+		if (enabled) {
+			if (gic_irq_lock_cluster(d)) {
+				write_gic_redir_smask(irq);
+				mips_cm_unlock_other();
+			} else {
+				write_gic_smask(irq);
+			}
+		}
+	}
=20
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {
