Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111D3C09F8;
	Thu, 15 Oct 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053832; cv=none; b=X0FQDoIOCj6E6oDW/m+dde2Dp5frhGk+OnAT91xeI1shc3DeGYztzyLsF5qnUZR7EF4AODLS/YKIm0c7Ea8W1eWoxuEn5+MOUHVNGKmZOs514V7O7/oHgh3oGAw0G8aE5VuVM9cO+6Vu00W+mqhWZVq9aY+LAvVuD1Z8mjkjnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053832; c=relaxed/simple;
	bh=jNta5tJrlL+kVyd/VQA+FmuKKgibGSZIM2soOuLgHaA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MULtcEXc/1U+ZSDjR4+vXAmiCMTglrjQfnnEhoeBSNDrHBbdTTmYbR8KIgkjNCq9g+ID28b7m+jnaRze+UAma0HX3R7w7EDO5mnBwXXFc9hzwk4XkirhVGXY28EK8zLrSwVDtbVj1Rk8rrOcD0jYhuDWtUAjduj0d740Lh42Wik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l/+HCLej; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G6QHiYg6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l/+HCLej";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G6QHiYg6"
Date: Thu, 15 Oct 2026 08:43:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792053828;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VkRWmnE0pu7bXDyHBV80/xwlWFuBIFyo4Pp8FoJO5w=;
	b=l/+HCLejAX6gNwwkqIt7UJqLKqLzSyGXbYyukZRGmo2x8No9M7ipkANIt+z51X3ZJAeErS
	ZmHuzp5VALW8/ZxtGhhUqU/GlWGeGGkPZokQCNaNJT5NKBrsTB2tUSBM5pQKPDY+8PUwYU
	9SUWHYmpCAETDHcoIKATBmZYAuhk8HbD7VrRhlsnft0SP3UYaZlTm67sbUD+szWxx2KdDF
	E5EPZZJZIcx7WvYJfZp7QyB+qRIxLTVqEACD/lgwqUEryXTV9XqCa7hwBtTxr/uECWkM9I
	Vq/v6g83/kaiR8n6bU5/l2nxJPIrpksDlpilASUQBVQFOSFRVqpw4MGdpILRnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792053828;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VkRWmnE0pu7bXDyHBV80/xwlWFuBIFyo4Pp8FoJO5w=;
	b=G6QHiYg6VY7S7s5ml49rwM3C6eb95d1RavX7S4PG+An2hvj/GjjAxIyBCvBtp4zQbwEPX7
	K6S1FVeFaw00sVAg==
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
Message-ID: <179205382650.2666988.3089457189034425264.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     4351cc74202857f5b85b3573c477c9f798f5cd88
Gitweb:        https://git.kernel.org/tip/4351cc74202857f5b85b3573c477c9f798f=
5cd88
Author:        Haris Okanovic <harisokn@amazon.com>
AuthorDate:    Fri, 11 Sep 2026 13:31:59 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 10:38:14 +02:00

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
