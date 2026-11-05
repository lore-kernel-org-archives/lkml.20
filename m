Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896290;
	b=CWSuQakv+FAf3khl0XzZZdb7RS8xUc9/cElvwZ0JbOZ7jl0SnRYf44xZn8/3TSV+SYSK
	 wdqSMo85m54irAZMUM7u8fkGQmx8r2rWZc7om394kHmtf/+Pzu1/CeRqGLBuAq77so3RJ
	 TA59XhIpjVGuCPD6MRHuk6OALX8Ynb9Ou2HZqf/gJrUcXZx2/apBicLdXnaiqKjMZtrSR
	 v+6uAQdOPt472tkDDA0xabz3vuDef+ynFNLHT8QgfetpcDyFgI1IpjLgNNwpYun7lSV3B
	 hR1zmCkcw25i757ACW7aGewXYNNC1EDgymFMlDCtMISZt0vA1Ji816yVZ4hmA2JfF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896290;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tYa2kVcQJggBzf30cyG9hxA6HXv+PyuWty9AqwH1tx0=;
	b=AVi9WeNvJEEXG+U4X1nA9HVYnZpmWmVR53SfNhc9TCsCbWzdiQs+CmXRHKYlYLyszfqy
	 rlFrzQ2fySx3mgmrsDm/LqXq5UeDyMcJlRUs8yeuKWmMIyPfFAvUM+1tCTe+O4A3F0RB5
	 UIVElxOnlnReYfyDsAdCl8xxlow0CONAu8Bz+yrXDtEEChTibqCy9kEeHGY0wqlK69fAr
	 RdBB35eDJXU9GXig/4FeIpzL3xXzW+po5ZG0EQC1P2E5Zr2eIpjMyFtqJe6lIVDqeXjZR
	 hkv5ZEUE1WDem0kq9hgI9CALwKrbha96aN3vP1qIyOAVxalBfWeUWSgODCNUbhJfhqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Okt5JcID;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76521606D81E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Okt5JcID
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD551F00919;
	Thu,  5 Nov 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896290;
	bh=tYa2kVcQJggBzf30cyG9hxA6HXv+PyuWty9AqwH1tx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Okt5JcID6lqYQk81BhtmQVx0ZDemw/aCKTU/Bjy47LZPWA2PuE7Az4nfV/beqI8gc
	 UkmIOr9JHshoJvgEhX55n+FNyrANHSc3fZdOC2ImWkQimI1G/m7PvbWlHbAdK/B0dM
	 3hdelEbjqCsynL0JJx4p6RJNuwC36D6C7xX9KJAb1Cd761+N+PAZsIAOuSrRKIS/79
	 yOsahGFSbEe1DZWVoc4CvjsxTHKZX/B7kplvSN3XqTyPLKmKSOBj+U/vezAqyPP80c
	 XHVmYcxncvYWTrDsJ0sswzC4EGtNA4He1rl4nkEvY2Bs5NItB4Kas+9Oq0UtqqwTcc
	 ggOnpG/fYnqqQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 12/47] irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:10 +0100
Message-ID: <20261105163045.38862-13-frederic@kernel.org>
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

The callback here disables the current CPU IPI, which nobody should
touch concurrently since it is seen offline by other CPUs.

The sync protects internal datas with &lpriv->lock and the IRQ matrix
offline is protected by &imsic->matrix_lock. Therfore it can run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c86570b13fed..151e4d9673b9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

