Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2303EEAEF;
	Thu, 15 Oct 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102785; cv=none; b=u36lUg4n9GG+VjrcrLpt4LG6XgttQqB1cZLGfN+gWLmrjNMb9WERBcazSX2cHgcWcom8whm6TO6IzdV6fEC0C5Tc+5UzeOJNcOtt8YftrNTIrXEVwHHcizGohFe3eMzplAtBmJWOqm7SuLhl3XLhVjySymkcdpIMmg49v8jAi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102785; c=relaxed/simple;
	bh=bXBdhN0xSk8PWcnU7+cSoETKsLsuS2cAgHsJ7LDDw/4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=H5F1HLCi2PtnrKDD4v7OTzlzCSIyrNTvAo6bgvEyipDoC4T8VNWCnCQM4C/iCruya/9RSudPvE9xdBEsnPX6tDpA4rbKfn/5GIhUVFvVcqNTGAt6VZCHtaEleJd1ndzMV5h6X6kVP1Fc8pfMdOSbXr1btLBOYah01l46sPXXHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VQX36BYb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Mu+p+QMN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VQX36BYb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mu+p+QMN"
Date: Thu, 15 Oct 2026 22:19:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792102782;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFdEe0s2iHZd3drVJt0S/z67DXVWb60NLMJH+HLDg58=;
	b=VQX36BYb6jaYPH3i8lXkWZ9WzoQe8h9/Yk36bq9P07ZRmyjStboeArEG18v2Nz7GZQ4ODm
	TjUtZvDjinSmuTXrzsIDyBEuDCBfkWbJyey84x44tB7iS2psE9/3jNTcfkPwJypMaEMSrx
	vk37aSaDgXhGwRnGmBU96uKYn6NfF9dYkn+b+0tb6hVxgHay+i0RzDP2Vw84nNbtEBGixb
	en7j6qsOaoPxJc4R5uEeCS5rh7bJALavM4WIaMTOe+xIV0zzuHznafyPguixEvmzAz2KWr
	NFf6uvbdWG3XTjipZgE3099cAUzbSMN6NgtgXwiEE7q0HwG0uxiRsouAGDDhmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792102782;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFdEe0s2iHZd3drVJt0S/z67DXVWb60NLMJH+HLDg58=;
	b=Mu+p+QMN3KbEXL77dYDXhavGntLG0WBg3zjYEfgJKtXEx+4WnEDSD4g4tLJQKcI3Vnwu4U
	TKhQ1+UipkTrKdAw==
From: "tip-bot2 for Haris Okanovic" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/core] genirq/proc: Fix missing CPU header in /proc/interrupts
Cc: Haris Okanovic <harisokn@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Michael Kelley <mhklinux@outlook.com>, Radu Rendec <radu@rendec.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To:
 <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
References:
 <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179210277987.2666988.18317508694042559788.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     e74798f2f8e1562f2bbd2fed8d81929eeef39ffc
Gitweb:        https://git.kernel.org/tip/e74798f2f8e1562f2bbd2fed8d81929eeef=
39ffc
Author:        Haris Okanovic <harisokn@amazon.com>
AuthorDate:    Fri, 11 Sep 2026 13:31:59 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 16 Oct 2026 00:18:41 +02:00

genirq/proc: Fix missing CPU header in /proc/interrupts

irq_seq_show() must be idempotent since it may be called multiple times
to render the same record, e.g. when seq_file's buffer is exceeded. It
emits the CPU header behind the one-shot print_header flag, which the
first pass clears, so the header is lost with the discarded buffer.

This can be seen on large systems, such as 8g.48xl (192 CPUs) and
8i.96xl (384 CPUs) AWS instance types:

  $ head -1 /proc/interrupts
     9:          0          0 ...  0  GICv3  25 Level  vgic

Replace print_header with the position of the first record and include
the header whenever that record is emitted.

Fixes: 171cc0d9eed1 ("genirq/proc: Speed up /proc/interrupts iteration")
Signed-off-by: Haris Okanovic <harisokn@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260911-dev-harisokn-proc-interrupts-fix-b4-v=
1-1-f9ff208efcfa@amazon.com
---
 kernel/irq/proc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 1b83572..0c0df16 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -462,7 +462,7 @@ int __weak arch_show_interrupts(struct seq_file *p, int p=
rec)
 static DEFINE_RAW_SPINLOCK(irq_proc_constraints_lock);
=20
 static struct irq_proc_constraints {
-	bool		print_header;
+	loff_t		first_pos;
 	unsigned int	num_prec;
 	unsigned int	chip_width;
 } irq_proc_constraints __read_mostly =3D {
@@ -543,14 +543,13 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	struct irqaction *action;
=20
 	/* Print header for the first interrupt? */
-	if (constr->print_header) {
+	if (p->index =3D=3D constr->first_pos) {
 		unsigned int cpu;
=20
 		seq_printf(p, "%*s", constr->num_prec + 8, "");
 		for_each_online_cpu(cpu)
 			seq_printf(p, "CPU%-8d", cpu);
 		seq_putc(p, '\n');
-		constr->print_header =3D false;
 	}
=20
 	if (desc =3D=3D ARCH_PROC_IRQDESC)
@@ -635,14 +634,25 @@ static void *irq_seq_next_desc(loff_t *pos)
=20
 static void *irq_seq_start(struct seq_file *f, loff_t *pos)
 {
-	if (!*pos) {
-		struct irq_proc_constraints *constr =3D f->private;
+	struct irq_proc_constraints *constr =3D f->private;
+	bool first =3D !*pos;
+	void *ret;
=20
+	if (first) {
 		constr->num_prec =3D READ_ONCE(irq_proc_constraints.num_prec);
 		constr->chip_width =3D READ_ONCE(irq_proc_constraints.chip_width);
-		constr->print_header =3D true;
 	}
-	return irq_seq_next_desc(pos);
+
+	ret =3D irq_seq_next_desc(pos);
+
+	/*
+	 * Record position of the first output record so that irq_seq_show()
+	 * knows where to write the header.
+	 */
+	if (first)
+		constr->first_pos =3D *pos;
+
+	return ret;
 }
=20
 static void *irq_seq_next(struct seq_file *f, void *v, loff_t *pos)
