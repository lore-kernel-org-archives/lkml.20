Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C0B3A9D8B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712687; cv=none; b=JpDQ+qnkqNKAw6rbLZmkL2jdawZR3i+lusYXPP6Wui6tbn0E6JGKbCS90ii0WcaL5HAtzUzkvuB829SHZfbH52CCodng1ixh5S0DsEbG1PLO63a02FKQT9U0uhe90NF7LX9AZM/+/NKWNdA+gv97r/MIinrBoz4Bi5bd2Ju+yGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712687; c=relaxed/simple;
	bh=2A/bFpgouVbrudsY/DKa70GuRJvEHtXMkw6oxpmlIoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShJwWv53l6wmV/pQ1gBCCwkyW2hg0s5jAvUb09tOkhGqXbkN1SS4CD2Y6IZNtGy+Q/aYluxs2wcWB5/erK4JiFZZ/ZXfyHsD0ki04eKLIGjljhBstWnVOoBov5hQykvMxS+4/slNO4d9I2XpiM2gi2MIr+P3QBO3UPHWiVuPRLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyGuLSlX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyGuLSlX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so2344138f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712684; x=1789317484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unH3oepzWSgpuS34FgHtBwo/OR2UjhvPi9YUi7nKPQc=;
        b=pyGuLSlX2VHPbmGqO8T/l3rZmM3OEJE+UAhDZcGeHwf/wTNHNo84kUWunaXnVUmiuu
         uN22h7sG/toz8zCU2KXRujsGuqoyJvnyLt8uEvst4UU/DriQrIkCMGMCX0LB+reqp3yW
         Lg841XO+00grASV+YhrpjmVIqTNf/PdJU9OsRF1U9hxKaDX/0dAJmttQhBFPDfJhnvAh
         3dUQrS//UdTcS65yahw2yEBVoEZK4IGmYvBxyr6OxXp9zqJhRd98KyWqU99pZj2jDnrL
         /vzdfjXkr7xiGeaz9CtRnC0Si2TTHL4IqkYm7CgV18uIUZxPSHshjbSby7ySh19WGsxY
         ksJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712684; x=1789317484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unH3oepzWSgpuS34FgHtBwo/OR2UjhvPi9YUi7nKPQc=;
        b=UeH3sWbVGdGSlPFe6iBPrHBwBcly+/ONZAtHmaObaFwCYwoJIFCY7QHBEcggKal0ws
         SkR+iXcay7DltQFP+ucDTgcOVsKHIA61LeJXT4XNfH1J2zYEGb1H9P2Bo0HHS2Tf5IfU
         r2Bt8OcyAqsiVi5/UhDJsUsYLJ/THiS14S21+yTnWwBDFDdYjJsOVCsMzY028VUN+Rj3
         e0DecCVWeMGx30eh7/OYqN8494Y6FuaPL1jZwFN9n4DTFv764TgmN8t4oIQaLmylcl0p
         mbTKTyBK+1v2xx3qy91Zd6tGCt9sg2IEi1LMEuriUQqsUzKjhVskKt+pzZRdSmuVtXZG
         D6EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRWWxBn+8pbezR2wY8AWISyV6+HOINPlGQwR8pJt5d0yYjQMVDNomQJ8qqQJ5n2gAhDkvpYWCVS6ExS2U=@vger.kernel.org
X-Gm-Message-State: AFuF++m3wunWlrT2ffdd2UhGiVQT3HZstctIfzWQBwSwqdg5SZzGA3zu
	92g0A/bLiO6ahhuYq/ebMQOwu7Zowy7tCNKV7w6lmHPdRw/YGdWIsG1b
X-Gm-Gg: AYBFou3FCp7pXxVv+AP48Dgj691n/eWwWXdkNniKlwzUwMoSgqmsEkGnSEF9rq3nkzz
	JpbALszhJVOAnnpQexS0TP2oVQzzKsRpVW3kVYqCtMqQoa9iyk7hCl1O31oY0aMs+vXOmuPGYvw
	9RWDCUHwN9OXPlgNfXa3nUQekVXZkoH3WmZsaBnMOHBGNeHsLrokJuEdeoTyZguTVKUV/iAwEz+
	ozyS5rn3JYxjIc2k9x0wsRTOK6t5mgmMUSnu4vHGGFZ09fCHIjSTopNZjtYP8j8Srn5k9V3pLnH
	7aK2N2qNs0uFV7L3Ma8Te9his5G+9HDL4IXxfJ/TnZ3Cc9uENgV304iIabsPLgcQZQx++ai+gtH
	21DbIVzkUmq1HoeGL2ga/hPaagLQt3BIcGh1q+LLqmEIVF2uDOYuIlNVRNJLZ5TBuuWFhmZcBnd
	WbZPusabeFdKmDHYd4TDhOq8trLMPxEBmBCfu30D/HSgIi7rZt7Ei6mQjaSaxmGSXU0rijvnv1h
	PqWOa87a+BtQMJF+NlG7sxWLDU=
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr215148465e9.12.1788712683872;
        Sun, 06 Sep 2026 09:38:03 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:38:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 2/2] cpufreq: update capacity_freq_ref when the boost state changes
Date: Sun,  6 Sep 2026 18:37:15 +0200
Message-ID: <44b381bd07c299a3551037e57fdd5fa9f272dc25.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY, and never
updated afterwards.

cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
latched value is the non-boost maximum.  Enabling boost later raises
policy->cpuinfo.max_freq but leaves capacity_freq_ref behind.

Two things then go wrong on arm64, where the AMU drives frequency
invariance.  amu_scale_freq_tick() caps the computed scale at
SCHED_CAPACITY_SCALE, so a CPU running above capacity_freq_ref
saturates at 1024: the scheduler cannot tell a boosted CPU from one at
the sustained maximum, and utilisation is underestimated.  And
arch_freq_get_on_cpu(), which reverses that computation, cannot report
more than capacity_freq_ref, so cpuinfo_avg_freq is pinned to the
non-boost maximum.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP, cpuinfo_avg_freq reads exactly 4032000
while the CPU runs at 4723200; a fixed workload completes in 1.72 s
rather than the 2.01 s that frequency would imply.

Factor the update out of init_cpu_capacity_callback() into
topology_update_freq_ref() and call it from policy_set_boost(), which
is the common path for the global boost knob, the per-policy one, and
the CPU online path.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 7 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index ad36b6570067..a776a79885ee 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -11,6 +11,7 @@
 #ifndef CONFIG_BL_SWITCHER
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad7085..a4b96a7ee4a5 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -22,6 +22,7 @@ void update_freq_counters_refs(void);
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index fe1a8bf6902d..a363d72c174f 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -11,6 +11,7 @@
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick		topology_scale_freq_tick
 #define arch_set_freq_scale		topology_set_freq_scale
+#define arch_update_freq_ref		topology_update_freq_ref
 #define arch_scale_freq_capacity	topology_get_freq_scale
 #define arch_scale_freq_invariant	topology_scale_freq_invariant
 #define arch_scale_freq_ref		topology_get_freq_ref
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..79eb1681065d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -317,6 +317,18 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 	return !ret;
 }
 
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		per_cpu(capacity_freq_ref, cpu) = max_freq;
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+	}
+}
+EXPORT_SYMBOL_GPL(topology_update_freq_ref);
+
 void __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
 {
 }
@@ -392,7 +404,6 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 			   void *data)
 {
 	struct cpufreq_policy *policy = data;
-	int cpu;
 
 	if (val != CPUFREQ_CREATE_POLICY)
 		return 0;
@@ -403,11 +414,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
-	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
-		freq_inv_set_max_ratio(cpu,
-				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
-	}
+	topology_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
 
 	if (cpumask_empty(cpus_to_visit)) {
 		if (raw_capacity) {
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d0df986fa3d..289649baa061 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -594,6 +594,8 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
+	arch_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
+
 	return 0;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..4974f5e1a7fe 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -31,6 +31,7 @@ static inline unsigned long topology_get_freq_scale(int cpu)
 
 void topology_set_freq_scale(const struct cpumask *cpus, unsigned long cur_freq,
 			     unsigned long max_freq);
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq);
 bool topology_scale_freq_invariant(void);
 
 enum scale_freq_source {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..5b904e13eb21 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1235,6 +1235,13 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 }
 #endif
 
+#ifndef arch_update_freq_ref
+static __always_inline
+void arch_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+}
+#endif
+
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
 extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;
-- 
2.55.0

