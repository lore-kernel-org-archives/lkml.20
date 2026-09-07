Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B53F1048
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799249; cv=none; b=HX1OZaasGM8MJXcGDeD/jq1RrDtqpiFEnyEkL1euwUn4YABkUk37Kfg2Irr2l9OQWtH7YdEufHRBY6wfbgIOczCXh2LmRvE0mIwzE+of6lQ7Sw+hOywlWbTmrHYdOrJW0UwxXRfjYXCBGBmo07ayuexs/GaJtveDxfn9cH3Ue/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799249; c=relaxed/simple;
	bh=1/7B6N+5CnRAnlVZhEKGzvfB8XQacud8b5o8MAyjDSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DK/8Avvrv303wYSIA348qPxbIWJB/FaLZPqr4KUS3qjOZtUFdrbkqtHBR/nGl8CENfutFjXw4mClkP3dbnCPd8qN8VO05mEyE7pggQ0CMp5PKa4EwoCLyAmDMUR/FclwQXwhxHmxrWTo25dwjXIr3x0Oz6MIXZISYksKnHl9IZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxGmw1rD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxGmw1rD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F281F00A3A;
	Mon,  7 Sep 2026 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799246;
	bh=1trb6sOqqOL4Nzv46ncJB/f9wXUiCIM1M1i+sR/0Dd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KxGmw1rDW6DoBlnXfG7919mo46pF1j91hFaT2fajfjZ52NazOaNnNUHbofkElmOn3
	 fqTGBVt7K1L64uB7APqwaZfNer/ZAGm/BDvMd4X7uxjbOW6uFWFSdymFMTTs8K0n5o
	 /WmUzZh16xOL7ZXO8w/aTlJY3prb0maYtHOUVe49XFZYdd9czRDctiymPdRgEviguG
	 a4hD5vyyuaq+TCgRJBhNdEiNrrn0EY8Igb5u3NvYowm5WUotI4hHmG1ORegpovXil5
	 WRfz1d5bd4SgcR0mnVSRyU7Md+uUa08z8Zi2Siol4TVgoV0Y20PeZXQygQDo0gC4ae
	 GLzyKFRLDK1qA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 04/19] cpu/hotplug: Propagate bring-up status to arch_cpuhp_cleanup_kick_cpu()
Date: Mon,  7 Sep 2026 17:40:07 +0100
Message-ID: <20260907164024.17164-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for enabling the generic CPU hotplug machinery on arm64,
which has architecture-specific handling of early bringup failures,
extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
indicating whether or not the target AP reached the alive state.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/x86/kernel/smpboot.c  | 4 ++--
 include/linux/cpuhotplug.h | 2 +-
 kernel/cpu.c               | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 362f85cbdbaf..ce4e8fba5fed 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1074,7 +1074,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
 
 	/* If the wakeup mechanism failed, cleanup the warm reset vector */
 	if (ret)
-		arch_cpuhp_cleanup_kick_cpu(cpu);
+		arch_cpuhp_cleanup_kick_cpu(cpu, false);
 	return ret;
 }
 
@@ -1122,7 +1122,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 	return smp_ops.kick_ap_alive(cpu, tidle);
 }
 
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 {
 	/* Cleanup possible dangling ends... */
 	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index bbcee650155f..83ef0c4d8bbe 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -510,7 +510,7 @@ struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
-void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index d9fe204f02cb..595258e2b6cc 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -432,7 +432,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	return true;
 }
 
-void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
+void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
 
 /*
  * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
@@ -451,7 +451,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
 	}
 
 	/* Let the architecture cleanup the kick alive mechanics. */
-	arch_cpuhp_cleanup_kick_cpu(cpu);
+	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);
 	return ret;
 }
 #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */
-- 
2.55.0.979.g7e5102b832-goog

