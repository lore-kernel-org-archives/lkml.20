Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509242;
	b=SBH1ogUuKKziWfAV4HCQlLIDFIrm4enZhUyEW2A1UpisvjwYTxiLSx83KkeXUA832LbA
	 ePfM8CYqnr1jBWlIcae/DKVXW3I0clCtNKEj700uoytid2hL1IKb0L/3AL414jawwE1g7
	 mVPmCW8guPHcc3R/cilX61dGViBnCsGzECbnzM0DE2VbeaaXlZIlMz76DrzkPh48qNBt+
	 CyQdqGQOcd7b/m1EmKQ1h6qSnIkg5sml25R8AllDhvHDYUGe5Ck7Hx4cpQXSKo0nIwpSA
	 oUTY9oS2lrIAS289VVLEDvAmjv5gISGfGD/2Ua3P+LvEWZZiDtNMInA7TNJ6ABPq5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509242;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=veLKnRY62zTIqxBWnrcQ0gPv1vv6tOtFBDOf6tmVKc4=;
	b=NZgcuJN6FBKkCiZZcxy5vXmaazlPDHHF55H4ha3cRUvfV5e817fHZck+qbv7CqSKTVRK
	 LP7hKHgd6B+GpR3t6WVM9BjgOfg/4ej3TQqvyGy5p9v4LrQmVZ2VkCk5ETvEF9uKbuUYm
	 9JjyA6fJnUZG8cyBkqT6IXtMf+PSst2ZJ9TNQSFSCwCIEOOOeL5grE5MVmbU3nD3Gz3wQ
	 y3dT44Rl9l0rRUzU+9+sWYQ6gLaWOCRruJVnXpWISIFHEKR5IqHeqZXoBPOPOLw84nUJ+
	 yrQ/TCHG14xbH9RbSigui47sG4+MLFf7ohq43t4aaPLJ3uBBr8GGvJM0X0dwuL+0kbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ey9NJclt;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE89606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE89606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ey9NJclt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CX5MT6+fMmm76OEcX3Nwd/7nHwJ/bCIAJ1rrCcf4AtQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792509238; v=1; x=1793114038;
 b=ey9NJcltneG6hcGVpaXejSRya2thLDKvTBJP00I7DU+xoK3U8yGTCCsfYc4F2Or3I7iasg7B
 Hud5ybYQkbM7Q71G0BJpXXYcSZWg1Cfmdw1vkwNmCId+iJ5Y9G8yYaGjXeHjf5JigxPTsVmU8Vc
 pEZSQsX9HPf3E0A1kL3ITcrc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 786fde7ad19e055f;
	Tue, 20 Oct 2026 15:13:58 +0000
X-Mizu-Trace-ID: 786fde7ad19e055f
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Newman <peternewman@google.com>,
	Meta kernel team <kernel-team@meta.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] x86,resctrl: Read event counters with an IPI when the read cannot block
Date: Tue, 20 Oct 2026 08:13:52 -0700
Message-ID: <20261020151352.2346257-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
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

In the Meta fleet, readers of the resctrl mon_data files often sleep
while holding rdtgroup_mutex. Over several hours, a lock profiler on
several thousand hosts (almost all AMD) caught:

  - 96,368 reads that held rdtgroup_mutex and cpu_hotplug_lock for
    17 ms on average and up to several seconds, mostly sleeping.
  - Three different userspace applications [1, 2, 3] doing these reads.
  - Other readers and the MBM overflow worker waiting for the mutex.

These long stalls put gaps in the monitoring data for these
applications.

The read has to run on a CPU in the L3 domain. mon_event_read() uses
smp_call_on_cpu() for that. It queues work on that CPU and sleeps until
a kworker runs it. When that CPU is busy, this takes a long time, and
the mutex stays held all along.

Commit 09909e098113 ("x86/resctrl: Queue mon_event_read() instead of
sending an IPI") did this for MPAM, whose reads may sleep. On x86 a
read is just one WRMSR and one RDMSR and it don't need to sleep.

Add CONFIG_RESCTRL_MON_READ_IRQSAFE, which x86 selects. With it, read
the counter with interrupts off: on the current CPU if it is a
housekeeping (not nohz_full) CPU in the domain, otherwise with an IPI
to one. If every CPU in the domain is nohz_full, keep the existing
smp_call_function_any() fallback. MPAM and other architectures keep
the old path. Peter Newman posted a similar change in 2024 [4].

Results on a 316-CPU AMD EPYC with busy target CPUs, and readers that
copy the fleet agents, per 60 s run:

                                       before    after
  hold time per read, average          350 us    4 us
  hold time per read, worst            3.4 ms    109 us
  time off CPU while holding           9 s       0
  one pass over 750 files, average     360 ms    7.4 ms

The cost: interrupts are off on the reading CPU for about 0.5 us per
counter, and up to 131 us for a root group read with 128 MON groups.
A reader that runs every 100 ms used up to 29% more system time,
because it now spins for the IPI. A kernel with lockdep and
DEBUG_ATOMIC_SLEEP gave no warnings while groups were created and
removed and CPUs went offline under the readers.

Link: https://github.com/facebookincubator/below [1]
Link: https://github.com/sched-ext/scx [2]
Link: https://github.com/facebookincubator/dynolog [3]
Link: https://lore.kernel.org/20241106154306.2721688-2-peternewman@google.com [4]
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 arch/x86/Kconfig         |  1 +
 fs/resctrl/Kconfig       |  8 ++++++++
 fs/resctrl/ctrlmondata.c | 12 ++++++++++--
 include/linux/resctrl.h  |  5 +++++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..8512b0980f6a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -523,6 +523,7 @@ config X86_CPU_RESCTRL
 	select ARCH_HAS_CPU_RESCTRL
 	select RESCTRL_FS
 	select RESCTRL_FS_PSEUDO_LOCK
+	select RESCTRL_MON_READ_IRQSAFE
 	help
 	  Enable x86 CPU resource control support.
 
diff --git a/fs/resctrl/Kconfig b/fs/resctrl/Kconfig
index 21671301bd8a..912626bb18f6 100644
--- a/fs/resctrl/Kconfig
+++ b/fs/resctrl/Kconfig
@@ -37,3 +37,11 @@ config RESCTRL_RMID_DEPENDS_ON_CLOSID
 	  Enabled by the architecture when the RMID values depend on the CLOSID.
 	  This causes the CLOSID allocator to search for CLOSID with clean
 	  RMID.
+
+config RESCTRL_MON_READ_IRQSAFE
+	bool
+	depends on RESCTRL_FS
+	help
+	  Enabled by the architecture when reading a monitoring counter
+	  never sleeps. resctrl then reads it with interrupts off, on the
+	  local CPU or by IPI, instead of sleeping with rdtgroup_mutex held.
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index cafebdff70dc..c6fea953e962 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -601,10 +601,18 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
 	 * MPAM's resctrl_arch_rmid_read() is unable to read the
 	 * counters on some platforms if its called in IRQ context.
 	 */
-	if (tick_nohz_full_cpu(cpu))
+	if (tick_nohz_full_cpu(cpu)) {
 		smp_call_function_any(cpumask, mon_event_count, rr, 1);
-	else
+	} else if (IS_ENABLED(CONFIG_RESCTRL_MON_READ_IRQSAFE)) {
+		int this_cpu = raw_smp_processor_id();
+
+		if (cpumask_test_cpu(this_cpu, cpumask) &&
+		    !tick_nohz_full_cpu(this_cpu))
+			cpu = this_cpu;
+		smp_call_function_single(cpu, mon_event_count, rr, true);
+	} else {
 		smp_call_on_cpu(cpu, smp_mon_event_count, rr, false);
+	}
 
 out_ctx_free:
 	if (rr->arch_mon_ctx)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 10dfdca7f4bf..2c6a19263d98 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -570,6 +570,9 @@ void resctrl_arch_pre_mount(void);
  * a CPU that belongs to domain @d. e.g. use smp_call_on_cpu() or
  * schedule_work_on(). This function can be called with interrupts masked,
  * e.g. using smp_call_function_any(), but may consistently return an error.
+ * If the architecture selects CONFIG_RESCTRL_MON_READ_IRQSAFE, event file
+ * reads that must run in domain @d are done with interrupts masked. The
+ * overflow and limbo handlers still call it from process context.
  *
  * Return:
  * 0 on success, or -EIO, -EINVAL etc on error.
@@ -679,6 +682,8 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
  * Called on a CPU that belongs to domain @d when "mbm_event" mode is enabled.
  * Called from a non-migrateable process context via smp_call_on_cpu() unless all
  * CPUs are nohz_full, in which case it is called via IPI (smp_call_function_any()).
+ * If the architecture selects CONFIG_RESCTRL_MON_READ_IRQSAFE, event file
+ * reads are instead done with interrupts masked, directly or via IPI.
  *
  * Return:
  * 0 on success, or -EIO, -EINVAL etc on error.
-- 
2.53.0-Meta

