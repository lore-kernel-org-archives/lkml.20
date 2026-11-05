Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896363;
	b=UEPwYmP6PCWX+AJ+zvjvztCa7ghTgmzRWiwi3EbOJJD0UfvXFopD+L1kNOSWU3JDU6NF
	 olgDc63SBtzgvPewclSjJgyTxbhwoFQd7gAfy5FZNdcN5BEsae0Nfbf1wIB++evj83fXl
	 nXuQJd2wlWkr1yBpz4ych6qOTHndtQH/cNQYZSDafrrbfgpqTLgq44e+EDkYK1LU8swHE
	 xhFxrumtcNJkOx+mY6iAqdOaL3li4u6sXiS1RKhgPwgiqpxFx93dtw1yx9Do+QnjV7jkj
	 M1cUQBhhDiW0NZzzE2Ixnal/710yaPz+LYc3rVQnVaDAjtaOm8M29TLZS0GdORD9NDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896363;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/6b82kuaXepaTz9CSFQJQO5cBsE6n/mAmFqD9IAh1wU=;
	b=fZ/RqQgcEQimh4I1G5hQN3x6WtvMcRBqJZglPylabaOHkjTC7MMvbBwL0kOr9U26MZ1Z
	 VsdFTFO1z1lNSM+E2YcYRBzzQspXzlUQYJzEeSXvnvQH8mD8QuJNf5ab76MPuvr17h96p
	 Vw8PPuFaOZag3HEfiUginV6KwatnR0xxNSq8S6ZZBMJA/Fq3+Exn2SLQ5Wf5zDJxQByL7
	 C42NpCL5oscQX29OfRdlcpJuY/8gbpFCtzqNyg8LsVn0JElqt5q6+R4AzfGiT/YOsQi59
	 O1qgDIZYpAE/HpjArADu9Zm/UyDJXK5sX0xh40y+HPzIsSDH7b5zqZWp3o/u60fKIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQMLrVGi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158B606CBD5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQMLrVGi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B021F00A02;
	Thu,  5 Nov 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896363;
	bh=/6b82kuaXepaTz9CSFQJQO5cBsE6n/mAmFqD9IAh1wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AQMLrVGiVtQdT3qwLRkoB4rp7fh4KL//wmhNTP+/Tk+B2u3N1CQMf5Ov5mbjs5H4e
	 poSJt0QhIyiqwfwjaHU4+H26s4M1hLezmC3Z7zXa85i3rB70wovzTd1HWaAYJuApVK
	 PDL/GBsJyPX75XytLz80kp2FghIUPD41WAtHayL6CjDGo4IbBMopa5SdIQHzp3ojEv
	 WV3JSjGSOJzSFKQx0AAnfat4PFiPR37QJwECY6Zx2ciBmz34zs3m5JVFmvI55KA5d5
	 t5eVw8A57N5Dukm7jlpqh2BDP63yZ6NN+6psGP2k+ah8psl3w1b/3UsumnsldkCZVh
	 vi1Ih4zBSOuJg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 35/47] clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:33 +0100
Message-ID: <20261105163045.38862-36-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

The teardown callback here simply performs timer and IRQ disablement,
both of which can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 9b2e5862252e..04692ae09199 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RISCV_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_RISCV_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

