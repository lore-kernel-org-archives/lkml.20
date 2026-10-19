Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65414E4303
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415366; cv=none; b=TlbFCFVaTuOmSRZmffcP475uCFi098I74pDbGe2eVtPuvN/MBL/ukaGd6FWJU8lsltCHtuO4Yw4Es36QL04sp7zKr/mnhURMFengrFgqgUz8jQQdGwzp0VgzoJSmB0yaEJJsoyUbYkp/XuMSprIp+43nwBvjzGGVsefAhWTR+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415366; c=relaxed/simple;
	bh=DqL3cOEHfXzrxIJubV/T8jeWpB8JEOyAvV8CsHOA650=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/xXCvqBKhdfz9TtM1+DJeuTnn/d2ks2/7ljr3StQofDKnMi0eM190AQJHEtjvU2ikXW6PTp/2hPhZH8WeMK57DuLh+MlRnZFC4G9V3mKwMR4sJQPd3rbihNkp2JHJtLyh1paKqwtLnTyZVJkDZb6ry5pdvXh+sf/UsyUuAj5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrrEwIPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrrEwIPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398F11F000C5;
	Mon, 19 Oct 2026 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415365;
	bh=pqM9t0QqCSFH/hDkrc9NQbwTDyDkgEma6dueNWHdCeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrrEwIPsVZnzJp3zS9x+Uh9zwGzLiG+zBk0L8icLzpIwY8/YaS9H42g4kTn9+/WIf
	 w9JJzZq2re9f3PtRGkcZOtUmCFgKJOmdEKehHNNyvODJp+zWkwF07fniywnhHzNF1Y
	 DGUtdKB9JqaNssu2HkT9vc9C3fA9owLUdRjme+pswVsWs42nAAwc7/mYdZ16i+tLv4
	 3qs8+CpvOGDUuA1UvA3KTGAfQi6Z1Os+1hhrjfyhEwp39L9tWPgD0sLY0W8WnqAOXn
	 4ky72Z30InNOVlunBIRE7edNkGhRyluTqMPnmFlz92kKklNJVD0ucpB39c9mtRltBa
	 XadtmrJS1jFlg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [RFC PATCH 07/49] irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:14 +0200
Message-ID: <20261019130856.49711-8-frederic@kernel.org>
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

The teardown callback here just masks the per-cpu IRQ in the chip and
shouldn't race with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 293dbb73d940..db73cdfbf1d0 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

