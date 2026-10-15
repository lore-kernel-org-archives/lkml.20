Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240051B181;
	Thu, 15 Oct 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058781; cv=none; b=au7QdJeyEX7EGux2HStuWMFFjynzHdgETp5rH4j66Qv+HK6Rn2+nJ0qYjPSTUyyf0DyU+VkAQcOV0LqFeljLNhoLf6M+kywfR6tnkRf5xgonoeAlxkydCZFnDXtUfX1Fvbipd+58O+ahrnst4Ajt7zSrKCejExZ4gHWOi67d9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058781; c=relaxed/simple;
	bh=4fxQVKkn2H3oAPrajRjukfzmDPMHQgQWq0dstD2of98=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oNyOr/HqKVb6ctnSZ7M25MenV0apxAOdQh3yvhINxXDjpH9Fel2o1LvqP+I9I3ykpHloRNQZhNgTJ5xpWxGg7OgXgidIGKiMUt3kJ4WywCJ+7p/4vDO1q6G4GziDmnhcbKYZkDqvA5woGr34WYlPTVVqxmgH/HlJBsuzU6SluLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vRrSv2IT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L4JXL2rV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vRrSv2IT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L4JXL2rV"
Date: Thu, 15 Oct 2026 10:06:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058777;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEpVBLqQGVMe66qTgV8yH880jU7K3cG9XMrDZ6pJZyE=;
	b=vRrSv2IT4pDPHySH2HdBpb9HgFLw7K7GpAeGd3NljJ1hesOZzRHUS7hVbinzEnirELX+CA
	3MKWVw8A0TTTy/L3vJyFwkGJLaccd7NFqNrY2RxzBN79Tk3xBkuu3P2UlJQIa3/wanGL0+
	gFEGsqZEzPKelWdXaaJE6jwF24xzPSmceZD4Rjr+VCNe1PSKUiEddMB4DanoPES+mFPY3t
	f4ZtrRVnTVKeNILNZjVIL2A+2+wFppkNEhZx3yuwXlV8ThgFyi2q0uPuxW2+7XEuSxlWdF
	8icaP1aq7Zmg9MTIWZPhoA9HR/GKBR4HIVUZOVM/l5nj3xYF5EwTe92ONDNDSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058777;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEpVBLqQGVMe66qTgV8yH880jU7K3cG9XMrDZ6pJZyE=;
	b=L4JXL2rVSLpVD9sxkikcns2czIAJExjw+nbmGGRzQ5RP8Hn0QjDANlwER+ZcDNCy3wV7/1
	ZjpPRzlt20+hm5DA==
From: tip-bot2 for =?utf-8?q?Beno=C3=AEt?= Monin <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/mips-gic: Fix recursive acquisition of
 gic_lock in gic_set_affinity()
Cc: benoit.monin@bootlin.com, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929-sync-gic-counters-v4-2-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-2-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205877544.2666988.10433841873658715684.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1bae25dcc6beb8b874f23601d2efa142ac4f9f36
Gitweb:        https://git.kernel.org/tip/1bae25dcc6beb8b874f23601d2efa142ac4=
f9f36
Author:        Beno=C3=AEt Monin <benoit.monin@bootlin.com>
AuthorDate:    Tue, 29 Sep 2026 14:14:09 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:02:16 +02:00

irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_affinity()

Commit 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
made gic_set_affinity() call gic_set_type() when an interrupt's
affinity is moved between clusters. gic_set_type() takes gic_lock with
raw_spin_lock_irqsave(), but gic_set_affinity() holds gic_lock at that
point, so the same raw spinlock is acquired twice, triggering a deadlock.

Split gic_set_type() into a gic_set_type_locked() helper that assumes
gic_lock is already held. gic_set_type() takes gic_lock and calls the
helper, and gic_set_affinity() calls gic_set_type_locked() directly,
since it already holds gic_lock.

Fixes: 322a90638768 ("irqchip/mips-gic: Multi-cluster support")
Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Link: https://patch.msgid.link/20260929-sync-gic-counters-v4-2-ec70c4b60434@b=
ootlin.com
---
 drivers/irqchip/irq-mips-gic.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 3b31cbc..f2ae60d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -297,14 +297,14 @@ static void gic_ack_irq(struct irq_data *d)
 	}
 }
=20
-static int gic_set_type(struct irq_data *d, unsigned int type)
+static int gic_set_type_locked(struct irq_data *d, unsigned int type)
 {
 	unsigned int irq, pol, trig, dual;
-	unsigned long flags;
+
+	lockdep_assert_held(&gic_lock);
=20
 	irq =3D GIC_HWIRQ_TO_SHARED(d->hwirq);
=20
-	raw_spin_lock_irqsave(&gic_lock, flags);
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
 		pol =3D GIC_POL_FALLING_EDGE;
@@ -351,11 +351,16 @@ static int gic_set_type(struct irq_data *d, unsigned in=
t type)
 	else
 		irq_set_chip_handler_name_locked(d, &gic_level_irq_controller,
 						 handle_level_irq, NULL);
-	raw_spin_unlock_irqrestore(&gic_lock, flags);
=20
 	return 0;
 }
=20
+static int gic_set_type(struct irq_data *d, unsigned int type)
+{
+	guard(raw_spinlock_irqsave)(&gic_lock);
+	return gic_set_type_locked(d, type);
+}
+
 #ifdef CONFIG_SMP
 static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumas=
k,
 			    bool force)
@@ -407,7 +412,7 @@ static int gic_set_affinity(struct irq_data *d, const str=
uct cpumask *cpumask,
 	 * trigger type in the new cluster.
 	 */
 	if (cl !=3D old_cl)
-		gic_set_type(d, irqd_get_trigger_type(d));
+		gic_set_type_locked(d, irqd_get_trigger_type(d));
=20
 	/* Route the interrupt to its new VP(E) */
 	if (gic_irq_lock_cluster(d)) {
