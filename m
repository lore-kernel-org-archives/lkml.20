Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2B851AFCE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415476; cv=none; b=fYCNu8LJdKFJZAYScRNy8c6f2L30a2SdVrVzVmPqmtQjJo19x+VuW23QWzoaCxBqWLnb/Mx/svkEjCa9O94P3X7iVYab8EgIe3U9ICd7FM+tuPUXPvguy/zwc7EwNxyCPvgyU3Ev1iR2WWeXHYac5fos2Krq7O8csPz4omGX6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415476; c=relaxed/simple;
	bh=H6/Q2TVBdBP57MtczPjj0vxQqab9RCuJ0Zuyi4Zb5rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSQQdLXKQv1K8fStkZ5ZlCTMz9JRa/Smme8P2xd0OKMladNw3IDgBj3Xp+WH0wv+BM7VF/oTT+Ly34uk7Rb6Z963VHLUHSocVDRltUalP3dH3f3AC5XCHyEM3r8H6LBtfk5r8nBFOF3Gsxy47hrgRPKQzDu+JjAA5XAAvmNQzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmacM4HP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmacM4HP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC68B1F000C6;
	Mon, 19 Oct 2026 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415474;
	bh=xrvtHIQ66eMDyIWnguwKjohMEyUJ6ZEzNiuzwJ8D6sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XmacM4HP2351LhSNVP9HpBQ5p2NjBqeXQ1uCJ6oFN/kplUlm0Zx4mQcVXoHbOT3RL
	 4/OGB3P1rAWN0tV/XPWXih8Gl2xz2E+xUko3NFyK/X8kRA109n3gs/vuQJoq8MZp6Y
	 WWm0dHbNVMKZzYHo9vpYJH8T/NiyPJQyNAvwRkjSoKmAlGRUdzyxXikgjt6MlBmSKb
	 b7gae3bGB6o9SGRBqqAivQbjySBzqsGYOS+/VSyZaNRH6/IjlHnqaAlaxBsayDBzxl
	 XQSyCVVsJmiutQR/S4KXp+uAfS1vQBx0I7/L9thatmOQZ+XjyO8gnEYwXRcrQnyO63
	 uYWCSDY9jv9lA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ning Sun <ning.sun@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	tboot-devel@lists.sourceforge.net,
	x86@kernel.org
Subject: [RFC PATCH 48/49] x86/boot/tboot: Move CPUHP_AP_X86_TBOOT_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:55 +0200
Message-ID: <20261019130856.49711-49-frederic@kernel.org>
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

tboot waits for all previously outgoing CPUs to be in Wait-For-SIPI mode
when the last secondary CPU goes down.

Although the expectation looks strange because the number in
ap_wfs_count should only match tboot->num_in_wfs + 1 at this hotplug
stage, anyway the CPU can run this wait loop while the other online CPU
is running concurrently.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 59ffcd4534c8..87680f7c6493 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TICK_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_TICK_DYING);
+	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

