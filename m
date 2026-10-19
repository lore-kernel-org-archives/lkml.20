Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C814F96BE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415460; cv=none; b=QZmBgWEMe+IqbYETiNmyrZDJ0zk2sVYkEG4yndKSWvGBU2TLClOLoMMX+2eK7QkSfl2QqTGgNsjrjFP7ERsr3gvR+s1EE3r32HD5uW/dLLLrwoVvBLA22aura64jd0X/jJGTO+Xv1fyiWsUpx16lRton1BhfZe1qfRXekgosiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415460; c=relaxed/simple;
	bh=9nBbjqqFe4SOeRSjmDyLFruaCTKLRTDfItgFOQXxDiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUdW6OFDuK+LMNUJSIK5mosUO8CfBp78d9XvVrqzq51au8e3zk/y6HdhHnwChuxK+7aChbDUlfARQjbyhK5dh7zySeP+AGIdWoFi0+2nooovQlKq4abaL6XcbwVb6PdXOqCDoH07jY99niSAigFFMyOjTCNyO316MIT4Ki65Fa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYYhVV8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYYhVV8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E045C1F000C7;
	Mon, 19 Oct 2026 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415459;
	bh=sQ4wV/CtE843TsaJyn8NdxjU1otXO+lUSiOR4zR4+6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UYYhVV8DRwSugxc4w9TTb0o/rWDNMV80kuTV12atH3lBKClROKPctzL7bZd9hdFgv
	 PfWhK+tqVWRVA7qQkMj7dT0dnWY0hXHvfIgvLn8S4zOeBl+0okkfv7UJGsT9ZK+x6J
	 U3DvNv+Ss6hZiw4sprDxO9KEs6F6axzzZ84A2hpzBy9wwYEzr/G1ANlH5AHofU6Tiz
	 Uy5kF15EDPm7FE+G0xVDrufXD7ZER+IyTbn1RCyhJvJHjP5VxCxTbulIjhEpKg1U1Q
	 KtgogEtCjb3O4RgR5JeRmDA4jgOCJgFdhH96o7W3KYEtrATjxWWPIzXGacLidHxxvZ
	 5imvBcCnwnNnQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 41/49] ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:48 +0200
Message-ID: <20261019130856.49711-42-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc06cb1f0282..8509c6377a61 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

