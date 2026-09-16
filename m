Received: from va-2-114.ptr.blmpb.com (va-2-114.ptr.blmpb.com [209.127.231.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416E52ED24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568816; cv=none; b=Zzb79tCZl/Wyp5qSB4NblHwOYLhxA95VJBDaFGRYhA1hDcoWPzXbysQVE2y0Dv+I1w+tF5lRd0/cE30v5c49UKeIiJAFAzjdXGAzoeE8LbUjdjhhpM8qq/NGOUklnMlnB+1fHcSDcu6puO1jEfzBptU3KGjGIGgRNEp0vrdurgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568816; c=relaxed/simple;
	bh=X2Xnsna0dYTGFOJop7L6RRyyCMufmZ5GNsjmkIHjfjM=;
	h=Mime-Version:From:Date:Message-Id:Content-Type:Cc:Subject:To; b=QRMOZA2cv7Q3JhGHdBzkuTwCVFs6+9Cf1Nh17z5UHIkF7SfNQag0yNRq41z6VLQ0a7164ZpPAuzOo/SobF1+XQ0hvkIwnaS/wtG61NaF4H123q2SKumOrfS6N+6Y04cktbshq+D9vzviSRoqGNN3gewElGOrMFLWdMYNDAAe0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JB3v4WFX; arc=none smtp.client-ip=209.127.231.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JB3v4WFX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789568802; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=bgA5ULrPoskRn6T0ivduQvEJbwCvZD2o6HNY0J1YZGo=;
 b=JB3v4WFXcLO1dTt51m3MwWDAtRvl4/czruIEUMk95MqSgXhrK9jmtse6KO9IVgRnCRV9zZ
 AoQBwM3LSaRfG/3tfYbpULUEl3CeUQ5zmJ2xj0/YQAytnEQ/M0CCO0mcFGzC6wtH2gmyP4
 2p5uPtHP/7IU6HmGoBDDHNfF9QIB0zSV1Gv5my9UVU1D+dKjxeOFNvMPVSok35IGue0tgX
 y7CR2yBpIMPQTNaBWMHAr6q61U63Wjxzu7KZg//XNJfygNSFplw5mEuwk999uha5LOQYUA
 47Fvh5IjO9L5NtGn/msNAABQYvvX4E0ySIwILoOPjShgskHnir0eaMhvy/aayg==
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26aaaa720+804ff6+vger.kernel.org+zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Wed, 16 Sep 2026 22:26:20 +0800
Message-Id: <20260916142623.359336-1-zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 0/3] cpufreq: Avoid fallback values in cpuinfo_avg_freq
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, 
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>, 
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, 
	<beata.michalska@arm.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>

Introduction
============

cpuinfo_avg_freq is intended to expose an average operating frequency
derived from hardware feedback over a short time interval. On x86, it
can instead return a policy value or cpu_khz when no usable sample is
available. Userspace cannot distinguish that fallback from a measurement.

Provide a separate hardware feedback getter for cpuinfo_avg_freq so that
missing measurements are reported as errors. Keep the existing frequency
reporting behavior of scaling_cur_freq and /proc/cpuinfo.

Background
==========

The x86 frequency reporting path uses APERF/MPERF samples collected by
the scheduler tick. Reading the cached samples avoids sending IPIs to
wake idle CPUs or interrupt isolated CPUs. If a sample is older than
approximately 20 ms or has a zero MPERF delta, arch_freq_get_on_cpu()
falls back to cpufreq_quick_get(), and then to cpu_khz if that returns
zero.

Commit fbb4a4759b54 ("cpufreq: Introduce an optional cpuinfo_avg_freq sysfs
entry") reused arch_freq_get_on_cpu() for cpuinfo_avg_freq. This exposed
the x86 fallback through an interface intended to report the frequency
at which the hardware actually ran.

For example, the active amd-pstate-epp driver sets policy->cur to
policy->min, including under the performance policy. When a sample
expires, cpuinfo_avg_freq can therefore switch from a measured frequency
to the policy minimum. Monitoring software can interpret this as a
frequency drop even though no measurement supports that conclusion.

Commit 9e4cb21f2940 ("cpufreq: intel_pstate: Adjust policy->cur in active
mode to policy") changed the Intel performance-policy fallback to the
requested frequency. That value cannot establish that the hardware
reached the requested frequency, so the same ambiguity remains.

Missing samples are not limited to idle CPUs. The scheduler skips
frequency sampling on CPUs excluded from HK_TYPE_KERNEL_NOISE
housekeeping. A nohz_full CPU can lack a usable sample while running a
busy workload. Conversely, a CPU that has just entered idle can still
have a valid cached sample.

Changes
=======

Introduce arch_freq_get_avg() to separate hardware feedback from the
compatibility fallback. Use it for both cpuinfo_avg_freq reads and the
attribute's support probe. On x86, the behavior changes as follows:

  Condition               Before                 After
  ---------               ------                 -----
  Usable sample           Measured frequency     Measured frequency
  Expired sample          Fallback frequency     EAGAIN
  Zero MPERF delta        Fallback frequency     EAGAIN
  No APERF/MPERF support   Fallback frequency     Attribute absent

ARM64 reuses its existing AMU implementation without changing its behavior.

Chuyi Zhou (3):
  x86/aperfmperf: Separate hardware feedback from fallback reporting
  cpufreq: Use hardware feedback for cpuinfo_avg_freq
  x86/aperfmperf: Clean up includes after removing IPI sampling

 Documentation/admin-guide/pm/cpufreq.rst | 11 ++++++--
 arch/arm64/kernel/topology.c             |  7 ++++-
 arch/x86/kernel/cpu/aperfmperf.c         | 33 +++++++++++++++++-------
 drivers/cpufreq/cpufreq.c                | 19 ++++++++++++--
 include/linux/cpufreq.h                  |  1 +
 5 files changed, 56 insertions(+), 15 deletions(-)


base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
-- 
2.20.1
