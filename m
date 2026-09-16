Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EFB51FCBE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568829; cv=none; b=UzRFzhaUIK6qC1ty6dgaVhZlaVIx5zhF3IMVn2c2l61NVACf11Pnj38pB4Om1Yb1aen1GyaM2Ke7q1LaPI7Db6z4aDk2nTSV+u6tc9l1tO87snrEtVG4ByKkapWCXrNYlCI3JeEGfiBqdHeAhk88oPifnuNvycWfIC1rSCw3tk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568829; c=relaxed/simple;
	bh=5gx3hFy8w0hJVCf6w05eXatJkfbVEQiR6oApXJvvce8=;
	h=Message-Id:Cc:Mime-Version:Content-Type:To:Date:References:
	 In-Reply-To:From:Subject; b=bNArdxRzy8Lm83rELyYxhATa8/B0rA5TRUOjcCtgSMErdeLuYEliSBZyEBaS4NJbfmmefc2EVpzLFwoAYMvgVczP9yg1ufE2+2JXhCXgtrO4nVPOmOnjLlI29TviYPi1yMfTnMB6y6XYodGOoRa+DYFEUlpa3YWg5ewFYcwpy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QOo3YAg9; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QOo3YAg9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789568816; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tudkbI/Wzi+fx+PxY1Tz+PO+3o83pqkwPsAyJdML/jU=;
 b=QOo3YAg9pd3gCVNj5U1y+HjZNJFRhlxdXMEcjD0QWbte5vqan78PgFrulZGAMZGuFsGJ5v
 K/xSo5T0EDyNnvXEaftM/j+hkwix6GrdPcuv97eGxLe/BQSJObbmYdRYM9khEHigY303ZV
 g6aP0zdZsCEJErBwLTw95r6onJCN5Y3AILcsZ4ARpEZB74la1hjNUUj+OjhanD9VmdSpk7
 jplN93hv9VqETTog3c0rDbFZ6bMEiXxN1R9Qrb2pB7Ft1nMAwdWXke5lVinBXBdEqpD1Be
 m3IvShozKl2y90VfQKV5ORnfi+h9aJnuReDjexC0zjrvfsBcdGDJsM04T6c/Fw==
Message-Id: <20260916142623.359336-2-zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aaaa72e+279e9f+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, 
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>, 
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, 
	<beata.michalska@arm.com>
Date: Wed, 16 Sep 2026 22:26:21 +0800
References: <20260916142623.359336-1-zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <20260916142623.359336-1-zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 1/3] x86/aperfmperf: Separate hardware feedback from fallback reporting
Content-Transfer-Encoding: 7bit

arch_freq_get_on_cpu() reads cached APERF/MPERF samples and falls back to
cpufreq_quick_get() or cpu_khz when no usable sample is available. Its
callers cannot distinguish that fallback from a measured frequency.
This prevents a hardware feedback consumer from reporting missing
samples while preserving the fallback used by existing interfaces.

Extract the sample lookup and calculation into arch_freq_get_avg().
Return -EOPNOTSUPP when APERF/MPERF is unavailable and -EAGAIN when the
sample is too old or has a zero MPERF delta. Keep the existing seqcount
read, age limit and frequency calculation.

No functional change intended. This prepares cpuinfo_avg_freq to use
hardware feedback without fallback values.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/kernel/cpu/aperfmperf.c | 25 ++++++++++++++++++++-----
 include/linux/cpufreq.h          |  1 +
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index 7ffc78d5ebf2..de6297b1284b 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -503,15 +503,22 @@ void arch_scale_freq_tick(void)
  */
 #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
 
-int arch_freq_get_on_cpu(int cpu)
+/**
+ * arch_freq_get_avg() - Read cached APERF/MPERF frequency feedback
+ * @cpu: CPU to read.
+ *
+ * Return: Frequency in kHz, -EAGAIN if no usable sample is available, or
+ * -EOPNOTSUPP if APERF/MPERF is unsupported.
+ */
+int arch_freq_get_avg(int cpu)
 {
 	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
-	unsigned int seq, freq;
 	unsigned long last;
+	unsigned int seq;
 	u64 acnt, mcnt;
 
 	if (!cpu_feature_enabled(X86_FEATURE_APERFMPERF))
-		goto fallback;
+		return -EOPNOTSUPP;
 
 	do {
 		seq = raw_read_seqcount_begin(&s->seq);
@@ -525,11 +532,19 @@ int arch_freq_get_on_cpu(int cpu)
 	 * which covers idle and NOHZ full CPUs.
 	 */
 	if (!mcnt || (jiffies - last) > MAX_SAMPLE_AGE)
-		goto fallback;
+		return -EAGAIN;
 
 	return div64_u64((cpu_khz * acnt), mcnt);
+}
+
+int arch_freq_get_on_cpu(int cpu)
+{
+	int freq = arch_freq_get_avg(cpu);
+
+	if (freq >= 0)
+		return freq;
 
-fallback:
+	/* Preserve the fallback used by scaling_cur_freq and /proc/cpuinfo. */
 	freq = cpufreq_quick_get(cpu);
 	return freq ? freq : cpu_khz;
 }
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..dab1d921183d 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1224,6 +1224,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 }
 #endif
 
+extern int arch_freq_get_avg(int cpu);
 extern int arch_freq_get_on_cpu(int cpu);
 
 #ifndef arch_set_freq_scale
-- 
2.20.1
