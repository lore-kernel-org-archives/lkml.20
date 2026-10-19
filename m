Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8D4F85C3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415374; cv=none; b=R6cJ/tnGqxcSIq4bNhEckmGcGmFcZS0wM6Z5ZuMyWTy4Q3X+VNTdA3XTjodyqzQMKqFHdoNH5PhEzZBWtZvfaki86Z7ZEI8T/0QeiOA1ExdUEyHaPSk+Mm+rUZVOIv9FBPmyW9N34i9er2awtq7sR2RZsP/p0a5HMn16Kk2mAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415374; c=relaxed/simple;
	bh=8itq7aOhGhsRTq4/qPOUQcU8j0L1r0aMJDMGZJEqMw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uw0Io2ZvHV1fMhXMhOIilYjjKeKSxFyAz2qV3MC7j0VNiv1qtQ5vQY/0tJhCu7gtseHCvTGLCRrsRFtNDuUUB6qd0RwTTggEPDer319Eu+BTiL6X0gVzF2fNY6nVyVgle3mFC52rq1iUxIjS08l9HkTDCzTWDUsQUcY9WpzvwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezjbMz2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezjbMz2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30841F000C4;
	Mon, 19 Oct 2026 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415373;
	bh=YgeuaqRtp5CK1SLmK81XKrsJHhQCxQdrEiseHucAYLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ezjbMz2uVDoG9WVlXEnf3OTSz5PFTTX/ucD/14duckHlDn5mtVv2Cxm5kQtDRDgue
	 cofZxcfSR/CHqq8JZnhxgPnPhjqLcERiEVmvIFaaP0Ae2Y8uVyXCkv3qoLOTm6q+qO
	 F1fvDCyjIrzo8Czkt1zjSy9k/V5HUI6MlLO6mEQYPqKxB0sbQpheRxzDC+zk1haqth
	 N0zNvQiXBy+4YIEcCG1byKAu91XSJzE8Seo0aivOmDMbtuwrk1wI4Qhg+ATGP/7/dB
	 m3z190i75KJ4iI3b+l1iwE+EFcb59NjH1eT5QvmE7IEbRbrKtja5brLARWSSouFjfJ
	 EddHMIHT79m8w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 10/49] irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:17 +0200
Message-ID: <20261019130856.49711-11-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The callback here simply disables a per-cpu IRQ, which internally locks
the irq desc. Therefore it can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f32404821731..661648ada894 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_AVECINTC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_AVECINTC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

