Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332AE538D94
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568841; cv=none; b=S0gTlpfQW/m3RYhj8+SPKSf2RbEOREqe/hwfeLNjCd9jCMIkhdqSg8sltHDv3MsLW8vEL9lR6HlNV2QsUUC6Td2PDyz4M6J+QlXPszpTrlAmgrAr6BfTDr1qmiRYdW4UBijTllIa+5Lxk2Ja5l3wMDCc8XMvYvr0JsD8HpI88Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568841; c=relaxed/simple;
	bh=GaTQ9iTfa2fiJ8vtF/8FEnHCAP5RxQ/mXmTN4K28/Ts=;
	h=From:Date:Message-Id:To:References:In-Reply-To:Mime-Version:
	 Content-Type:Cc:Subject; b=Qvj0K538zDfhmYMOJw53p59CfPzc8IrMxkfnuDJjIWPg/6rMmwPT6YIs+42MQYEs9K50ExMUSEo2zlQHpg8FIOFAFhD1SHDNp48HWU0bV5ZIIApyBcDUj8747/NNeIKQINR6Jp7Fu+Exx+cfXlO04qZyW6xFyZjyRvXRzn5gWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JAK5lPm2; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JAK5lPm2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789568828; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YarYGRxch6A9B+7ga7PZoJ3GuLBezPPbSeknKvqJqAo=;
 b=JAK5lPm2qfyR26bEhkJuW/SrmCU0rj4ZHWeyBPrhxdolKXJ7nv0OfAW4HKQNDDQRJ6YNGx
 XgGgDMciFFRsZ/Sgrq6LolJyGt5OiCDMz2J4JDQl7bhwtaoMPJHANGQ+yrOk1YJP6UDSEe
 j7TM3WZDK6c4RLX6hyrEbnb7aMT6xjLAFrP2+AohNKQDy7SW8fHnm3UKTAPSLPioBFLtzI
 WZOL3qyjQBd6bqzTWe2459TmppweSEnDG8wXiQDxXtbLSaZr8WmpNMDj7vepGXvU0lOUTF
 +6NXDBgzqoz1SKu02aZqL9o2sce9yYZw79//T1bLOzrKJ448FITqi6wMBDIV+g==
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Wed, 16 Sep 2026 22:26:22 +0800
Message-Id: <20260916142623.359336-3-zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, 
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>, 
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, 
	<beata.michalska@arm.com>
References: <20260916142623.359336-1-zhouchuyi@bytedance.com>
In-Reply-To: <20260916142623.359336-1-zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26aaaa73a+3ec67b+vger.kernel.org+zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 2/3] cpufreq: Use hardware feedback for cpuinfo_avg_freq
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>

cpuinfo_avg_freq is documented as a frequency derived from hardware
feedback, but it uses arch_freq_get_on_cpu(), which supplies a fallback
on x86 when the cached sample is unavailable. Userspace cannot distinguish
that value from a measurement. With amd-pstate-epp, for example, the
fallback is policy->min even under the performance policy. A fallback
based on the requested frequency also does not establish the frequency
at which the hardware actually ran.

Use arch_freq_get_avg() for cpuinfo_avg_freq reads and support detection.
On x86, unavailable samples then return -EAGAIN instead of a fallback
frequency, and the attribute is omitted when APERF/MPERF is unsupported.

Provide a weak default returning -EOPNOTSUPP and reuse the existing ARM64
AMU implementation. Preserve the behavior of ARM64, scaling_cur_freq
and /proc/cpuinfo.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 Documentation/admin-guide/pm/cpufreq.rst | 11 +++++++++--
 arch/arm64/kernel/topology.c             |  7 ++++++-
 drivers/cpufreq/cpufreq.c                | 19 +++++++++++++++++--
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index 34baf20cc202..3057829b01bd 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -255,12 +255,19 @@ are the following:
 
         This is expected to be based on the frequency the hardware actually runs
         at and, as such, might require specialised hardware support (such as AMU
-        extension on ARM). If one cannot be determined, this attribute should
-        not be present.
+        extension on ARM or APERF/MPERF on x86). This attribute is not present
+        when hardware feedback is unsupported.
 
         Note that failed attempt to retrieve current frequency for a given
         CPU(s) will result in an appropriate error, i.e.: EAGAIN for CPU that
         remains idle (raised on ARM).
+        The attribute remains present during temporary sampling gaps.
+
+        On x86, reads use cached APERF/MPERF samples without waking the target
+        CPU to collect new samples. An expired sample or a zero MPERF delta
+        results in ``EAGAIN`` instead of a fallback to a policy or reference
+        frequency. A CPU that has just entered idle can still have a usable
+        sample, while a busy CPU excluded from periodic sampling can lack one.
 
 ``cpuinfo_max_freq``
 	Maximum possible operating frequency the CPUs belonging to this policy
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..939d3e4ce5d2 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -181,7 +181,7 @@ void arch_cpu_idle_enter(void)
 
 #define AMU_SAMPLE_EXP_MS	20
 
-int arch_freq_get_on_cpu(int cpu)
+int arch_freq_get_avg(int cpu)
 {
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
@@ -250,6 +250,11 @@ int arch_freq_get_on_cpu(int cpu)
 	return freq;
 }
 
+int arch_freq_get_on_cpu(int cpu)
+{
+	return arch_freq_get_avg(cpu);
+}
+
 static void amu_fie_setup(const struct cpumask *cpus)
 {
 	int cpu;
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d0df986fa3d..21bec6b7f538 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -705,9 +705,24 @@ __weak int arch_freq_get_on_cpu(int cpu)
 	return -EOPNOTSUPP;
 }
 
+/**
+ * arch_freq_get_avg() - Get an average frequency from hardware feedback
+ * @cpu: CPU to read.
+ *
+ * Provide cpuinfo_avg_freq with an average operating frequency derived
+ * from recent hardware feedback for @cpu or its frequency domain.
+ *
+ * Return: Frequency in kHz, -EOPNOTSUPP if feedback is unsupported for the
+ * CPU or policy under the current configuration.
+ */
+__weak int arch_freq_get_avg(int cpu)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
 {
-	return arch_freq_get_on_cpu(policy->cpu) != -EOPNOTSUPP;
+	return arch_freq_get_avg(policy->cpu) != -EOPNOTSUPP;
 }
 
 static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
@@ -769,7 +784,7 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_policy *policy,
 static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
 				     char *buf)
 {
-	int avg_freq = arch_freq_get_on_cpu(policy->cpu);
+	int avg_freq = arch_freq_get_avg(policy->cpu);
 
 	if (avg_freq > 0)
 		return sysfs_emit(buf, "%u\n", avg_freq);
-- 
2.20.1
