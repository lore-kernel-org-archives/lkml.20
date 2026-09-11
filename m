Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C64AD7D8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151549; cv=none; b=Kx9LJBnk4n0Bv9D2SOF+NTfDcVKpRKy8iO/I4xKbRZzgvPtKA/9bYGKoyyeBq7oTT0OJTi9U2vs5X9MCGXLRML2Earnjv/t0R7rmj0WPPHaQZv/y7fV+NJAF2fSS++jJvPxuoLzKPcVGSRqirfZ9pE0XsYrJcmASJy962QysVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151549; c=relaxed/simple;
	bh=n2azhLZXdzWegaDSQnj/+gX70MqPNOQVOwwbAauONdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=qKD/2lqqmAENjn+zzI4Ce5XI5zsjP9s159Wh/Jvm6G1IhG6BMHgcE86NaHHm6MEnoNVV3iMr+69nVRJHb6p6vIwRQYnKqnvi9GPPq5echqEkNFz1bzawPRRffxz3/pa0rZQ/pN+IrTysEOqIsuVlM38g0zM4p7EYbebVXe5ASDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=EEJLXfHt; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="EEJLXfHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789151548; x=1820687548;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=D/t1U/OFeOnJtEcDtay4ZAYvDHA8RDm7HswhIFlhJR4=;
  b=EEJLXfHtiZx0c8Vt8Nb7JopAKrER7HOBjXahpZkdS9aNPuoCClWA1Smr
   eZLxsbOEWo7BP5fNcsWIA9ftUWAvCQJf43mxxTx8b4aKfWIqCoM3VABds
   RG6qupAX0zL+oMkq08nTYNv3H1hlXtAmwFvbUMjDNjuDQ+htCvpN4jaNe
   NkA3rSWoLrXFf/4K10W5+Ry2rLnHm/se0qB82bIUfP1qX4EmF1VaZcXGe
   0xG/OQE3iiLcw7Gk1pUFH8zSPzj7MoSCqX47OCvkhMbF1v9WylfQt9zEx
   Wn89kkka8oVyxqFhbBfGUR2x0a+98xmJHLyCvY5bOHqBHzrzAsWdmZfRt
   w==;
X-CSE-ConnectionGUID: CqTmCPo/TPCTtCmBatobnQ==
X-CSE-MsgGUID: H51f8A4ZS26yCpWRqNb13Q==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="28425294"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 18:32:28 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:10016]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.49:2525] with esmtp (Farcaster)
 id 0a00a40f-e377-4d30-b5f7-4f224b500de8; Fri, 11 Sep 2026 18:32:27 +0000 (UTC)
X-Farcaster-Flow-ID: 0a00a40f-e377-4d30-b5f7-4f224b500de8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 18:32:27 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.179.27) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Fri, 11 Sep 2026 18:32:26 +0000
From: Haris Okanovic <harisokn@amazon.com>
Date: Fri, 11 Sep 2026 13:31:59 -0500
Subject: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
X-B4-Tracking: v=1; b=H4sIAB5JpGoC/yXNQQqDMBCF4avIrDtgRKv2KqULk4x1WkjCTJSCe
 HfTdvnx4H87KAmTwq3aQWhj5RgKzKUCt0zhSci+GJq6udajMehpw2US1vgOmCQ65JBJZE1ZceY
 P2hb7dhzmnszgbQellITK8nu5P/7W1b7I5W8ajuMEnvqgPIcAAAA=
X-Change-ID: 20260911-dev-harisokn-proc-interrupts-fix-b4-7498f7e18db5
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, "Dmitry
 Ilvokhin" <d@ilvokhin.com>
CC: Michael Kelley <mhklinux@outlook.com>, <linux-kernel@vger.kernel.org>,
	Haris Okanovic <harisokn@amazon.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

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
---
 kernel/irq/proc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 1b835725f7b1c..0c0df16de5816 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -462,7 +462,7 @@ int __weak arch_show_interrupts(struct seq_file *p, int prec)
 static DEFINE_RAW_SPINLOCK(irq_proc_constraints_lock);
 
 static struct irq_proc_constraints {
-	bool		print_header;
+	loff_t		first_pos;
 	unsigned int	num_prec;
 	unsigned int	chip_width;
 } irq_proc_constraints __read_mostly = {
@@ -543,14 +543,13 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	struct irqaction *action;
 
 	/* Print header for the first interrupt? */
-	if (constr->print_header) {
+	if (p->index == constr->first_pos) {
 		unsigned int cpu;
 
 		seq_printf(p, "%*s", constr->num_prec + 8, "");
 		for_each_online_cpu(cpu)
 			seq_printf(p, "CPU%-8d", cpu);
 		seq_putc(p, '\n');
-		constr->print_header = false;
 	}
 
 	if (desc == ARCH_PROC_IRQDESC)
@@ -635,14 +634,25 @@ static void *irq_seq_next_desc(loff_t *pos)
 
 static void *irq_seq_start(struct seq_file *f, loff_t *pos)
 {
-	if (!*pos) {
-		struct irq_proc_constraints *constr = f->private;
+	struct irq_proc_constraints *constr = f->private;
+	bool first = !*pos;
+	void *ret;
 
+	if (first) {
 		constr->num_prec = READ_ONCE(irq_proc_constraints.num_prec);
 		constr->chip_width = READ_ONCE(irq_proc_constraints.chip_width);
-		constr->print_header = true;
 	}
-	return irq_seq_next_desc(pos);
+
+	ret = irq_seq_next_desc(pos);
+
+	/*
+	 * Record position of the first output record so that irq_seq_show()
+	 * knows where to write the header.
+	 */
+	if (first)
+		constr->first_pos = *pos;
+
+	return ret;
 }
 
 static void *irq_seq_next(struct seq_file *f, void *v, loff_t *pos)

---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-dev-harisokn-proc-interrupts-fix-b4-7498f7e18db5

Best regards,
--  
Haris Okanovic
AWS Graviton

