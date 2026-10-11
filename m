Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AEB3BE154;
	Sun, 11 Oct 2026 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695148; cv=none; b=XcOSpDYx7bGVID+3N+1xEq8aWyyhg2fspvfQr96mRfi2Olm3WZQ2Gho7eX/sKkIJwhUPtPFuCJT4uQRtXIjdanGehKX0YWSX5KD4E2Is2QGk1A6vqwyd1ckoK3Th8TWkRk/JOlWhX8Ki8kCGPjdzGPTIj64e/7UI89JHFLmlQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695148; c=relaxed/simple;
	bh=WBvcrvYI2MYxoxqjS3yUbtyt3Qs9ojZqk2nYO2M5B4s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iITC/rIAn4Z2+sqpaDnfXzUF2Vd+EQ22F9z6pBnkYcvL41nCCISQQBhY5tUp33lfK8s6Z8OXpMpuYQB+j/VNetz93Ie3oWkX8/BAOslx6QQMzLl1SmItlTwXwIpk/ZyZrV4sMJwwv3sU9MlJwMejZVcHDXEf3WqH6H+lEVGjNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Ub2drlGw; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Ub2drlGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695146; x=1823231146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tAcjk68uS0hDEwT4Hiua79fNKKKfa4i+E5fNKoHZJRM=;
  b=Ub2drlGw+Upr7u7HSh+jjiRbTbmcHSiguMzaDJCRBBzV4wzwO0CC+R6Q
   t3yQ2hIGbURPD8VplIo0XZozAA8RPuUWLZiYCRO1YzbVnJnFDcNXajDMk
   U+km34mCgb7+AyMR/U9aEDWfeuvFHSiQin3dXyg8lLr0vsQWykEpIgsc9
   4oyK4frIYrNUj55irYDNSuHu4VtCyg4G55yWX89epwEsBi6Oc3WlCRQzJ
   +Vm2juOlHd6DgOMoZrR1I8tZ44J+GeUF9/81PzrHnPkYUc5xWwL64BPDO
   WBhqxknIIxd9wxbqb+rw1/A4Vy6wafj5geB9SBrFKThLo/GiRyue8Djty
   Q==;
X-CSE-ConnectionGUID: YpP7yDQzSCebtflLw9y4tA==
X-CSE-MsgGUID: jhUxYYySQpqS1S7hUtrkKw==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30723804"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:05:44 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1724]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.50:2525] with esmtp (Farcaster)
 id 766b34eb-5a25-4958-9fb1-aa520357ae17; Sun, 11 Oct 2026 05:05:44 +0000 (UTC)
X-Farcaster-Flow-ID: 766b34eb-5a25-4958-9fb1-aa520357ae17
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:05:44 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:05:42 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 9/9] irqchip/al-fic: support per-child affinity via interrupt redirection
Date: Sun, 11 Oct 2026 05:04:48 +0000
Message-ID: <20261011050449.41903-10-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

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
---
v5: rewritten from scratch. Thomas Gleixner rejected the
    IRQ_SET_MASK_OK_DONE approach below ("That's a horrible hack and just
    pretends to solve a problem. We have the interrupt redirection
    infrastructure to handle that correctly."). This patch instead wires
    al-fic into that infrastructure (irq_chip_redirect_set_affinity(),
    generic_handle_demux_domain_irq(), and an irq_pre_redirect callback
    that moves the ack - and, for a level configured group, the mask -
    into parent context), per Radu Rendec's confirmation of this shape on
    the v2 thread and the dw_pci driver he and Thomas pointed at as a
    reference. Tested on our hardware: with a child's affinity pinned
    away from the CPU taking the parent SPI, the handler body runs on the
    target CPU and the ack still happens on the parent's CPU, with no
    re-fire storm on a level configured group, and no change to the
    inline (non-redirected) path. This replaces every version of the
    irq_set_affinity callback below; the v2-v4 history is kept for the
    record of how the approach got here.

v4: no change. The question Radu Rendec raised on this patch - whether an
    unconditional IRQ_SET_MASK_OK_DONE is the right contract, or whether
    it should fail with -EINVAL - is still open.

v3: no change. The question Radu Rendec raised on this patch - whether an
    unconditional IRQ_SET_MASK_OK_DONE is the right contract, or whether
    it should fail with -EINVAL - is still under discussion on the v2
    thread and is answered there.

v2: add Co-developed-by/Signed-off-by: Talel Shenhar. No code change from
    v1.

 drivers/irqchip/irq-al-fic.c | 46 ++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 13a945a1d312..77cff6308eba 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -142,7 +142,13 @@ static irqreturn_t al_fic_irq_handler(int irq, void *data)
 	pending &= ~gc->mask_cache;
 
 	for_each_set_bit(hwirq, &pending, NR_FIC_IRQS)
-		generic_handle_domain_irq(domain, hwirq);
+		/*
+		 * Redirect a child whose affinity excludes this CPU to its
+		 * target CPU via irq_work. The ack moves to
+		 * al_fic_irq_pre_redirect(), because the whole flow handler is
+		 * deferred when that happens.
+		 */
+		generic_handle_demux_domain_irq(domain, hwirq);
 
 	return pending ? IRQ_HANDLED : IRQ_NONE;
 }
@@ -157,6 +163,32 @@ static int al_fic_irq_retrigger(struct irq_data *data)
 	return 1;
 }
 
+#ifdef CONFIG_SMP
+/* The ack happens in al_fic_irq_pre_redirect() on both paths instead. */
+static void al_fic_irq_noop(struct irq_data *data) { }
+
+/*
+ * Runs in the parent interrupt context on every dispatch, redirected or not.
+ * Clear the cause bit here: once the flow handler is deferred, the FIC keeps
+ * driving its output until the irq_work runs, and a level parent SPI re-fires.
+ *
+ * A level configured group is masked too, because its cause bit re-latches
+ * while the input stays asserted; the deferred handle_level_irq() unmasks
+ * when the handler is done. An edge configured group is only acked, since
+ * handle_edge_irq() never unmasks unconditionally and the mask would stay.
+ */
+static void al_fic_irq_pre_redirect(struct irq_data *data)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	struct al_fic *fic = gc->private;
+
+	if (fic->state == AL_FIC_CONFIGURED_LEVEL)
+		irq_gc_mask_set_bit(data);
+
+	irq_gc_ack_clr_bit(data);
+}
+#endif /* CONFIG_SMP */
+
 static int al_fic_register(struct device_node *node,
 			   struct al_fic *fic,
 			   enum al_fic_id fic_id)
@@ -195,9 +227,19 @@ static int al_fic_register(struct device_node *node,
 	gc->chip_types->regs.ack = AL_FIC_CAUSE;
 	gc->chip_types->chip.irq_mask = irq_gc_mask_set_bit;
 	gc->chip_types->chip.irq_unmask = irq_gc_mask_clr_bit;
-	gc->chip_types->chip.irq_ack = irq_gc_ack_clr_bit;
 	gc->chip_types->chip.irq_set_type = al_fic_irq_set_type;
 	gc->chip_types->chip.irq_retrigger = al_fic_irq_retrigger;
+#ifdef CONFIG_SMP
+	/*
+	 * The FIC has no hardware affinity control, so give each child real
+	 * affinity by redirecting its handler to the target CPU.
+	 */
+	gc->chip_types->chip.irq_ack = al_fic_irq_noop;
+	gc->chip_types->chip.irq_pre_redirect = al_fic_irq_pre_redirect;
+	gc->chip_types->chip.irq_set_affinity = irq_chip_redirect_set_affinity;
+#else
+	gc->chip_types->chip.irq_ack = irq_gc_ack_clr_bit;
+#endif
 	gc->chip_types->chip.flags = IRQCHIP_SKIP_SET_WAKE;
 	gc->private = fic;
 
-- 
2.47.3
