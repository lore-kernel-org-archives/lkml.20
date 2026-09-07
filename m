Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12CF525A8D;
	Mon,  7 Sep 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810694; cv=none; b=T7vPVylzHOajdI9RCqLuNq2heLeNAqhmst8B6sbIx2NBMEgs0jMAgmhkD8hA6y/Zrm3556g5iTqfF+L7hWqc0LO14eNzblWlthWpanCCerUBROyJb7Zf7wGsMtbKcjniTFjNj+oV5GpXerCAXQhz8/lK3B2T948CsU9nOQ8zB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810694; c=relaxed/simple;
	bh=BSxWBoTmX9GCG0skBxZT5HN+FpoySfHZ7zROzK1UpsE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=I4CgkNDuFxdJpqPwl4pF/e86IIQqcgTDcxAi0gg/gRD+GUFjUHWkjwH7RajQxdVvDrTB1vJyM7XwdilUX/KOHpNjodFOLkqZhB33GMj7nIfhJsLaxN6dt4+pQkIB02h1BSr2YaUdoRXVo4i8m/fDIf1J7wXAcodyAirYkJKtcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pQf/AuMK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6R3FXGey; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pQf/AuMK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6R3FXGey"
Date: Mon, 07 Sep 2026 19:51:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Yq/jOU8sAx1HAKEUrmx2YMcRCVfwBpe8GkzKmaIlZo=;
	b=pQf/AuMK/D+4t74ZY9RsghZ0drsiFvyIdAqspPb2+TPUJ2WSYRrvlktaZ9NR3WGqw7s27L
	dDH+kpG8tDjCgm9WdAF67iTb6woOPi+QXExzd27rU16cIFZci7M2EPcSMbORd0JIJeQASY
	ylTv1XDw3WVaNG1OmN88bi+Qt47k+Cu6AdadxPoxiYu/OiffUnAUD9AGxIZR7Y26cByzi9
	QRm0/9Yzpk6DW/DpvPjtxJL61muuD0XgiPnRwVAnExvqyxghlKlNdzeG0SpWZh4QnP1jRA
	CK2RsWyb8NJHokncgLpsqGaWbhMKgCdTsdfIzgs+Y/MJXLPtN0WT34pcglcnyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Yq/jOU8sAx1HAKEUrmx2YMcRCVfwBpe8GkzKmaIlZo=;
	b=6R3FXGeypq8+rikCDF9vYMTW881fwgOMweFEHCBNc0B1yzKYR3mpQ7DmmsgvpdIK0F3bNW
	8+q7YJK570Ih6iBw==
From: "tip-bot2 for Hemanth Selam" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip: Fix typos and repeated words in comments
Cc: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907065659.12034-1-hemanth.selam@gmail.com>
References: <20260907065659.12034-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881068966.623050.3136487297089456124.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     726285316f8fd8965d360ea6546da9b2677e7c7c
Gitweb:        https://git.kernel.org/tip/726285316f8fd8965d360ea6546da9b2677=
e7c7c
Author:        Hemanth Selam <hemanth.selam@gmail.com>
AuthorDate:    Mon, 07 Sep 2026 12:23:28 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:47:51 +02:00

irqchip: Fix typos and repeated words in comments

Fix typos and repeated words in comments as reported by
scripts/checkpatch.pl.

[ tglx: Fold the two trivial patches ]

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: Cursor:claude-opus-5
Link: https://patch.msgid.link/20260907065328.32009-1-hemanth.selam@gmail.com
Link: https://patch.msgid.link/20260907065659.12034-1-hemanth.selam@gmail.com
---
 drivers/irqchip/irq-al-fic.c      | 2 +-
 drivers/irqchip/irq-gic-v3.c      | 2 +-
 drivers/irqchip/irq-mtk-cirq.c    | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 drivers/irqchip/irq-vic.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b..760317d 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -180,7 +180,7 @@ err_domain_remove:
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuratio=
n is
  * to be determined based on connected hardware to this fic.
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index b0fca8f..19a15c2 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >=3D 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d6..d30c34c 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
=20
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg =3D mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value =3D readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-p=
lic.c
index 5b0dac1..a7cddad 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handle=
r *handler, void __iome
 		return 0;
=20
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c..607e328 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int par=
ent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */
