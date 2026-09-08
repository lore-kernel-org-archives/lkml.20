Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4B3D5C26;
	Tue,  8 Sep 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900719; cv=none; b=mDBicxpFYtxxIVZn72OTB5FLxiBe3cu4LFVxKf78qT6dIQ3gfz/yE31ry4/3B34mnkwBtl0Mdyq3L/YrbE96tsxfcv5UsQtTu048MDLPxfgZNDIAk2OBIvhH7HjjDLOHSknapT7dKnBGgd9c0KKdb5wNKOHtgI3NRlFbVa7HbGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900719; c=relaxed/simple;
	bh=YNc37tA6Zvq5Dqxaudf0IBGWrRyYb41k23qdzk7ItaE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jgUpk1z/nOdAPTN56NZ5FYBh8QNtZC0DavOTskmIUb93cYL/g2b9nkp+PPKqtYifNDeUqXg6mSV7FnDxiOUACbpONMhYpRpJyUZDhgkrBvJJWlqI3kj2hq8U9Uxr4J3HcVK8EQLScUPQyLhveSfG8AbGN0VzBxa8hvr0HWw3deI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DusnLp5R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IRRNzSZ5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DusnLp5R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IRRNzSZ5"
Date: Tue, 08 Sep 2026 20:51:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF3UCNhjfhBMJVVf/hpFZLnmAwATJXN9COzf+3o4lWY=;
	b=DusnLp5RWRuFl6z84EecK2v39aiUBfLZDiW5L+dS6GWcGf/jSujqZWfgDqJW/9XI0wRCL/
	GMzxt44/JiDvzt0sequEXIuGvCcWHyL0lYJOPwC5pVEzq/FzeCLp9z8twnBWMGvo9LWbRW
	yqqJopNKtI3iZukYj6bjvVgkUrgG6+H9M93R73KLmw9mDCPEJ8tgCNbydcto79DJLRwTOR
	GoZmsR7AwtCVJq9iW5pLqIQdlbd/PkF4qCmGIGaqRpjBrP6GykurbcWtu+7yXq5sTAN7/j
	yha303YMgkjE5hI+wn3p8yeZaZwpQ5PRbcAgnTTPnWX74xbokMwzJP+TQ1kp3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF3UCNhjfhBMJVVf/hpFZLnmAwATJXN9COzf+3o4lWY=;
	b=IRRNzSZ5pl3QjjNOouFiiY7YiK6k/xSlJUB4GGWS26pPLT6ACeXCLX/+cNGzlZ16isGfWK
	UO4xG0bIL4URggDg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Use x86_perf_regs in NMI handlers
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-6-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-6-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071384.623050.10237595532260851731.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     9c05620b49718544ba163c2ccc3c5a6b1f0bc8b0
Gitweb:        https://git.kernel.org/tip/9c05620b49718544ba163c2ccc3c5a6b1f0=
bc8b0
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:13 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:41 +02:00

perf/x86: Use x86_perf_regs in NMI handlers

Support for sampling additional register state in NMI context
(e.g. vector registers and SSP) requires an x86-specific register
container. The generic pt_regs structure cannot represent all of
the required x86 register data, so switch x86 NMI handlers to
x86_perf_regs.

pt_regs is still passed to x86_pmu_handle_irq(), so there is no
functional change to existing handling.

AMD IBS NMI handling does not use x86_pmu_handle_irq(), so this
conversion does not apply to IBS. IBS support for extended register
sampling can be added separately in follow-up patches.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-6-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/events/core.c | 5 ++++-
 arch/x86/xen/pmu.c     | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 75358a2..3368270 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1800,9 +1800,11 @@ void perf_put_guest_lvtpc(void)
 EXPORT_SYMBOL_FOR_KVM(perf_put_guest_lvtpc);
 #endif /* CONFIG_PERF_GUEST_MEDIATED_PMU */
=20
+static DEFINE_PER_CPU(struct x86_perf_regs, x86_intr_regs);
 static int
 perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
 {
+	struct x86_perf_regs *x86_regs =3D this_cpu_ptr(&x86_intr_regs);
 	u64 start_clock;
 	u64 finish_clock;
 	int ret;
@@ -1826,7 +1828,8 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs=
 *regs)
 		return NMI_DONE;
=20
 	start_clock =3D sched_clock();
-	ret =3D static_call(x86_pmu_handle_irq)(regs);
+	x86_regs->regs =3D *regs;
+	ret =3D static_call(x86_pmu_handle_irq)(&x86_regs->regs);
 	finish_clock =3D sched_clock();
=20
 	perf_sample_event_took(finish_clock - start_clock);
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 5f50a3e..3f4dd3f 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -456,12 +456,14 @@ static void xen_convert_regs(const struct xen_pmu_regs =
*xen_regs,
 	}
 }
=20
+static DEFINE_PER_CPU(struct x86_perf_regs, x86_xen_intr_regs);
 irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id)
 {
 	int err, ret =3D IRQ_NONE;
 	struct pt_regs regs =3D {0};
 	const struct xen_pmu_data *xenpmu_data =3D get_xenpmu_data();
 	uint8_t xenpmu_flags =3D get_xenpmu_flags();
+	struct x86_perf_regs *x86_regs =3D this_cpu_ptr(&x86_xen_intr_regs);
=20
 	if (!xenpmu_data) {
 		pr_warn_once("%s: pmudata not initialized\n", __func__);
@@ -472,7 +474,8 @@ irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id)
 		xenpmu_flags | XENPMU_IRQ_PROCESSING;
 	xen_convert_regs(&xenpmu_data->pmu.r.regs, &regs,
 			 xenpmu_data->pmu.pmu_flags);
-	if (x86_pmu.handle_irq(&regs))
+	x86_regs->regs =3D regs;
+	if (x86_pmu.handle_irq(&x86_regs->regs))
 		ret =3D IRQ_HANDLED;
=20
 	/* Write out cached context to HW */
