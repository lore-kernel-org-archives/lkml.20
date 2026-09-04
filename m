Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A341D11C;
	Fri,  4 Sep 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504504; cv=none; b=CeHLYKXt6sCr5kVf88iE45fT++j9QGABO9CQRRnj1bPXlvyil+o6rrITe+7t+yfNJkujv5sBIUBB0OglXpVVRK0QU/OHVpGhS0vN30Xhm6QsRcIctlXDi2a6p/vP6VWxzPEMrqCLuEKIZ6m1+6DGNqny4j6wa6b/XyPhBr9XBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504504; c=relaxed/simple;
	bh=ru8+PbsySnyFuAnIWJ+8XSmkp79f3wVE67Ya8rQgZx0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bHsWct50h9A5P9NbZZ4/lyMLYwU9wwcKYV5fMBELlvkx0fc/0TW2DNiMyquvnkKKt3nhC9fo0DUA/IalaC6edOg2rqJonRDrnba82+X34JG3sdRTSVV5m73CS6YZw2xLxvY/GdV+iaM7bRMDwfikkfvvEXl1gvyBVN3PH00UoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LeYSiobC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hvH/xtNh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LeYSiobC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hvH/xtNh"
Date: Fri, 04 Sep 2026 06:48:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788504499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABeTtOm9/GFt7/K5AQpQ/ZEcVx3UyLZ8bkR9WvhbhHY=;
	b=LeYSiobCpmul2p05ErA03ej1NBBBQlBGwrqgkuAlaakrw7xxr7L+ZXSuXS1a2C6S93Cevi
	GfcC2jGMAaScpGqyRIB58iZBJnli1RG0BbczBaTaD/+x64YRNoPed6Jz4Ah5S5nKl1spfx
	Vk52/AyLt47vaFlii2C93M72frhxk+LCkCj23ZGvD1Z+PctXfrFT+WL4GAoPoojNcn9fsO
	5ME3oClmXpQKILqlBf46Y6JbK9ZII1qC8Fw6eYqCRlmwXVWYDJumlECrmzkVRl9cS9IONi
	iIFf7GSg/fplrjkMgUiG4lCJmOEsAQeu0h7zT/bhFCTXM48H4fWguM4EhukoxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788504499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABeTtOm9/GFt7/K5AQpQ/ZEcVx3UyLZ8bkR9WvhbhHY=;
	b=hvH/xtNhnnmRbVI9fth+OefZIvgFdUiCsGa5xpxu4RhHmSvhgh8wbJS+QEdw4QPfGNl+tD
	UmtKS7oc6hFIUACQ==
From: "tip-bot2 for Lukas Beckmann" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/core] genirq: Discard cpumask of irqaffinity= boot
 parameter if parsing fails
Cc: Lukas Beckmann <lbckmnn@mailbox.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org,
 maz@kernel.org
In-Reply-To: <20260822160502.4665-1-lbckmnn@mailbox.org>
References: <20260822160502.4665-1-lbckmnn@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178850449763.3717435.10403062352068056152.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     94235414a0568f260b60b89ec584ff4829d5e8c9
Gitweb:        https://git.kernel.org/tip/94235414a0568f260b60b89ec584ff4829d=
5e8c9
Author:        Lukas Beckmann <lbckmnn@mailbox.org>
AuthorDate:    Sat, 22 Aug 2026 18:05:00 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 08:44:17 +02:00

genirq: Discard cpumask of irqaffinity=3D boot parameter if parsing fails

irq_affinity_setup() ignores the return value of cpulist_parse(). This
can result in using a "half parsed" cpulist. E.g. on a system with 8
cores, the parameter "irqaffinity=3D0,1,6-10,4" would result in using only
CPU 0 and 1, since the parsing fails at 6-10. Other boot parameters
which take a cpulist (e.g. isolcpus=3D, workqueue.unbound_cpus=3D) already
handle this by falling back to a default.

Check the return value of cpulist_parse() and let
init_irq_default_affinity() set the default in early_irq_init()
later, if parsing fails.

Signed-off-by: Lukas Beckmann <lbckmnn@mailbox.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260822160502.4665-1-lbckmnn@mailbox.org
---
 kernel/irq/irqdesc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 3a818f0..7cbcc3f 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -28,7 +28,15 @@ static struct lock_class_key irq_desc_lock_class;
 static int __init irq_affinity_setup(char *str)
 {
 	alloc_bootmem_cpumask_var(&irq_default_affinity);
-	cpulist_parse(str, irq_default_affinity);
+	if (cpulist_parse(str, irq_default_affinity) < 0) {
+		/*
+		 * Clear the mask so that init_irq_default_affinity()
+		 * defaults it later.
+		 */
+		cpumask_clear(irq_default_affinity);
+		pr_warn("irqaffinity: incorrect CPU range, using default\n");
+		return 1;
+	}
 	/*
 	 * Set at least the boot cpu. We don't want to end up with
 	 * bugreports caused by random commandline masks
