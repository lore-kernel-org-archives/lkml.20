Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536984;
	b=Nlw9LP73fOndT657C9Kd2q8eu9rQHgrgxzbPIYs6XZlx8PkBDF7PYwOkf0PpeWQfDcQP
	 N0YrjQGMN5DrHKREIaIXcfPvXmNmLRemId/5X4N3L8Zo+NS0e+46qhycJdv7KCY66erFD
	 BtFIoCbCscj+zRHmbAqumhiiN8XDgJUXU67vs6jbBKAIhzV8Krvo/QWhvUUIlIYPGTKKQ
	 IgbRr/HXyznP7DKydneipUqqRgI161IwjofvQFct9/1L36Sw2DpuK+S+k6C+qQbcQwFFB
	 ge3v0UTsd1NoKlNTq6xCZEYp2fNvN47NkYMxBad0t4YuxHg1FIkkj6aNrO43qEavLVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
	b=fxKCj7olvy6twGbIusWdLo8UlRE3r/2NeLYnV+y3xlfD8F4ZcO7p2DPl/GIQv1uuKU/6
	 qKVubfsDlDVAfMXY2rtNPkW2YD5SMhbq6jWuwYhEYRy6pTtpFHu9s9e1vy7QGe98htw5x
	 LIZnPyA+RKTq9FLcU7b2mDlBQ0xVLDgunVFSOOe9ChNGmyibJh2ExM+gRW64TJDT338E7
	 EOfSraFbcG/Of/GIoqJEEwmtPuUnXgpdYLD9Fd+H8/3l80UnR0g4BsR2gsSWkJW6ZxY5H
	 OIPlp4xDdb7fQ2ZxR+LbkdUOwW/pcjsiiuywdg+mtA6UB2d+giztB2GK9aHlGdaK+Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9ZNtN+c;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB24D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB24D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9ZNtN+c
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so270733b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536983; x=1795141783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
        b=W9ZNtN+c83+LJXITyz+JvRMPGAu12mQN+kefo556qAM12XMIbFOiGoxgzaPc3hRrde
         iiEs4Itd0opDrpUN+1FS0b4xIQb5aiMTg7klO9bgLoluMgAiT95r67G+6lHgVLmrx6Tb
         YUJyxeAAn+PyoT04xIo41/TsVj7qqT0Mmt0WPZiv5ijOPaNxS0H0CyXpF1Szlu8vA740
         bbg858U/UN/YbOMVPfzwxXzcvvXcrjPNiSz6yRPcXmgRIpO2BJYlO1HDW8o/MEARC0fA
         39VPyIV8LWu0uNItDBXA1HxoFa1YEAjJC9nGv0TNFppFlu4CvOKCgnWpyw0q+SWKbxq+
         Vvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536983; x=1795141783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDx3QXV13JGuIpjRQ0OV+D6x+l2ABszc9Xk6Hk+7MWA=;
        b=pvgMYSEm0d6C+2hSlDUvXo5aSzyQzvuCNpoEbZecLTYjtdpviOBppetd4Vfyq7aXVE
         GRi1rfkAV18NhwRzBvsezt9eclvkLwGB2emOs38I+umbgnVDIBPekAgPJccqsh/LyhPt
         SHosytuIFuiAzwGXa2du4PMAU4jflih+rK17Jr88R/0vjyhNsqxpBMo4hIeR/SWorR/p
         +GJgcXV/DXXDTmh5ggd0kRqlSRt5yds1GMdrYKrp11/1/+rBFHHs/d/YCC+vfam3fCoh
         mE5FtqZQ5oo+jTym9XYnZkvx2Jr7BEl568ag8YhqddwiAhdt4MVZMJFj4ESzp+K1tZ9O
         qbZw==
X-Forwarded-Encrypted: i=1; AL+hErGMZcucbVxz4OgEWPtWHCQ/mofMRCZNVRTQZxLmXMNBUqkIb2nHc7fWqARlScdULGYDq3P1UT+vO28R3SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XfwkcsPzEseIeLOYIlEd9Z3q75AzGxHl0qNCU+9Nbi+YDmZsz
	JJodnP9/piv3BwgHFSf+mI7Y8HPLIkNvBl32vpPKVsYH5QgB11i7TfDoz1BeX2YOxxJWXg==
X-Gm-Gg: AYBFou3IJmpscTmfAlqo4kouoG0jWe4C2aRrPQFvaY0v9kna3IjD3FtjK4pO3OFzKYr
	grdgHRQHtgsh2JR7wDiCWMdOoKUE+OEONDemMd6SLqt50AjguRDJIJdfBJDK9vnpuGZwjYuOLgb
	weYZgMBDie6Kpb6Ts221BVWrz89H/IB/pRAjRvLALdWEKbmrs6Jad/5CmEphkVwah04sQyCttp8
	EOTTxwS6+y/LNvfIPvfgVq4yWrchuRS8mlb8f7akfAvGWh7Vj0ZPJHoTH2bTnIpcsRDDXR4Ek/E
	0sXB+rG5ThdMSREP+JlvLBoMFM8gVVibD3bVaKEGibW+fA/9VLuJj5oJG4jdv9lk8rsCF3VOruz
	Aa9/QfzDlIybTqJS5/kQTQBCb6Nwq9lZAbwgrs5qITxrdBfGPWHHYADpGCwm9700dZWdqtelYJu
	hcJF+5et6Uidt4b/hTDb4iEchL+eEeP/bHwWgR3vfAD/tUvEM2qhZ4OJ4RUcyIaPMRQ8aeMcFu6
	2gX3wEuzfehB+fSP4FSjAiiXvpWqbw6WbFwcqzSI3E94/1Dhs6wb8OElhvpAHqvj7fhIwWZDgM6
	o0tDYP241n7USs4+uIcVT45+UZ0ZOd8/HyTaEXUo
X-Received: by 2002:a05:6a00:aa07:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-8beb696f1f1mr1344865b3a.34.1794536982925;
        Thu, 12 Nov 2026 18:29:42 -0800 (PST)
Received: from fedora ([2601:600:cb86:7af0::c952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm335547b3a.10.2026.11.12.18.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:29:42 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aiden Hecker <heckeraiden@gmail.com>
Subject: [PATCH v2 1/2] cpufreq: amd-pstate: Enable hybrid CPU capacity scaling on heterogeneous Zen CPUs
Date: Thu, 12 Nov 2026 18:29:33 -0800
Message-ID: <20261113022934.13397-2-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113022934.13397-1-heckeraiden@gmail.com>
References: <20261113022934.13397-1-heckeraiden@gmail.com>
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

On heterogeneous AMD Zen 5 / Zen 5c processors (X86_FEATURE_AMD_HTR_CORES,
such as Ryzen AI 7 350 Family 1Ah Model 60h), physical Zen 5 cores
(5.09 GHz, CPPC highest_perf 196..208) and dense Zen 5c cores (3.51 GHz,
CPPC highest_perf 135) alternate inside a single shared 16 MiB L3 CCX.

Currently amd-pstate records prefcore_ranking and nominal_perf per CPU,
and disables amd_pstate_prefcore when amd_hfi is active, but neither
driver initializes x86 hybrid capacity scaling. As a result, all logical
CPUs remain at uniform capacity 1024 across the shared L3 domain.

Record per-CPU highest_perf and nominal_perf when X86_FEATURE_AMD_HTR_CORES
is present and program arch_enable_hybrid_capacity_scale(),
arch_set_cpu_capacity(), and topology_set_cpu_scale() once asymmetry is
observed across online CPUs. SMT siblings are explicitly synchronized to
the same capacity value so SD_SHARE_CPUCAPACITY never triggers asymmetric
SMT warnings, while rebuild_sched_domains() is deferred to a workqueue.

Developed with coding assistance from Antigravity (Google DeepMind).

Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/cpufreq/amd-pstate.c | 121 +++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 4bedfbfc1..3f4b6a2b0 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -36,9 +36,13 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/uaccess.h>
+#include <linux/cleanup.h>
+#include <linux/cpuset.h>
+#include <linux/mutex.h>
 #include <linux/power_supply.h>
 #include <linux/static_call.h>
 #include <linux/topology.h>
+#include <linux/workqueue.h>
 
 #include <acpi/processor.h>
 #include <acpi/cppc_acpi.h>
@@ -88,6 +92,23 @@ static int cppc_state = AMD_PSTATE_UNDEFINED;
 static bool amd_pstate_prefcore = true;
 static struct quirk_entry *quirks;
 
+struct amd_hybrid_cpu_cap {
+	u32 highest_perf;
+	u32 nominal_perf;
+};
+
+static DEFINE_PER_CPU(struct amd_hybrid_cpu_cap, amd_hybrid_caps);
+static DEFINE_MUTEX(amd_hybrid_cap_lock);
+static u32 amd_hybrid_max_perf;
+static bool amd_hybrid_cap_enabled;
+
+static void amd_hybrid_cap_workfn(struct work_struct *work)
+{
+	rebuild_sched_domains();
+}
+
+static DECLARE_WORK(amd_hybrid_cap_work, amd_hybrid_cap_workfn);
+
 /*
  * The numeric EPP value programmed for each named preference. First dimension
  * is CPU type (TOPO_CPU_TYPE_ANY for non-hybrid, TOPO_CPU_TYPE_PERFORMANCE/
@@ -969,6 +990,99 @@ static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 	sched_set_itmt_core_prio((int)READ_ONCE(cpudata->prefcore_ranking), cpudata->cpu);
 }
 
+static void amd_pstate_record_hybrid_cap(struct amd_cpudata *cpudata)
+{
+	struct amd_hybrid_cpu_cap *cap;
+	union perf_cached perf;
+	u32 highest_perf;
+
+	if (!cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
+		return;
+
+	perf = READ_ONCE(cpudata->perf);
+	highest_perf = READ_ONCE(cpudata->prefcore_ranking);
+	if (!highest_perf)
+		highest_perf = perf.highest_perf;
+
+	guard(mutex)(&amd_hybrid_cap_lock);
+	cap = per_cpu_ptr(&amd_hybrid_caps, cpudata->cpu);
+	cap->highest_perf = highest_perf;
+	cap->nominal_perf = perf.nominal_perf;
+}
+
+static void amd_pstate_sync_hybrid_capacity(void)
+{
+	u32 max_perf = 0, min_perf = U32_MAX;
+	bool updated = false;
+	int cpu;
+
+	if (!cpu_feature_enabled(X86_FEATURE_AMD_HTR_CORES))
+		return;
+
+	guard(mutex)(&amd_hybrid_cap_lock);
+
+	for_each_online_cpu(cpu) {
+		const struct cpumask *sib_mask = topology_sibling_cpumask(cpu);
+		u32 sib_max = 0;
+		int sib;
+
+		/*
+		 * SMT siblings share SD_SHARE_CPUCAPACITY and must expose identical
+		 * arch_scale_cpu_capacity() values to avoid scheduler warnings.
+		 */
+		for_each_cpu(sib, sib_mask) {
+			u32 p = per_cpu(amd_hybrid_caps, sib).highest_perf;
+
+			if (p > sib_max)
+				sib_max = p;
+		}
+		if (!sib_max)
+			continue;
+
+		for_each_cpu(sib, sib_mask)
+			per_cpu(amd_hybrid_caps, sib).highest_perf = sib_max;
+
+		if (sib_max > max_perf)
+			max_perf = sib_max;
+		if (sib_max < min_perf)
+			min_perf = sib_max;
+	}
+
+	if (!max_perf || min_perf >= max_perf)
+		return;
+
+	if (!amd_hybrid_cap_enabled) {
+		if (!arch_enable_hybrid_capacity_scale())
+			return;
+		amd_hybrid_cap_enabled = true;
+		updated = true;
+	}
+
+	if (max_perf != amd_hybrid_max_perf) {
+		amd_hybrid_max_perf = max_perf;
+		updated = true;
+	}
+
+	for_each_online_cpu(cpu) {
+		struct amd_hybrid_cpu_cap info = per_cpu(amd_hybrid_caps, cpu);
+		unsigned long prev_cap;
+
+		if (!info.highest_perf || !info.nominal_perf)
+			continue;
+
+		prev_cap = arch_scale_cpu_capacity(cpu);
+		arch_set_cpu_capacity(cpu, info.highest_perf, max_perf,
+				      info.highest_perf, info.nominal_perf);
+		topology_set_cpu_scale(cpu, arch_scale_cpu_capacity(cpu));
+
+		if (arch_scale_cpu_capacity(cpu) != prev_cap)
+			updated = true;
+	}
+
+	if (updated)
+		schedule_work(&amd_hybrid_cap_work);
+}
+
 static void amd_pstate_update_limits(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata;
@@ -1130,6 +1244,7 @@ static int amd_pstate_cpu_init(struct cpufreq_policy *policy)
 	if (ret)
 		goto free_cpudata1;
 
+	amd_pstate_record_hybrid_cap(cpudata);
 	amd_pstate_init_prefcore(cpudata);
 
 	ret = amd_pstate_init_freq(cpudata);
@@ -1769,11 +1884,14 @@ static int amd_pstate_register_driver(int mode)
 	if (amd_pstate_prefcore)
 		sched_set_itmt_support();
 
+	amd_pstate_sync_hybrid_capacity();
+
 	return 0;
 }
 
 static int amd_pstate_unregister_driver(int dummy)
 {
+	cancel_work_sync(&amd_hybrid_cap_work);
 	cpufreq_unregister_driver(current_pstate_driver);
 	amd_pstate_driver_cleanup();
 	return 0;
@@ -1985,6 +2103,7 @@ static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
 	if (ret)
 		goto free_cpudata1;
 
+	amd_pstate_record_hybrid_cap(cpudata);
 	amd_pstate_init_prefcore(cpudata);
 
 	ret = amd_pstate_init_freq(cpudata);
@@ -2149,6 +2268,8 @@ static int amd_pstate_cpu_online(struct cpufreq_policy *policy)
 		return ret;
 
 	cached_floor_perf = freq_to_perf(perf, cpudata->nominal_freq, cpudata->floor_freq);
+	amd_pstate_record_hybrid_cap(cpudata);
+	amd_pstate_sync_hybrid_capacity();
 	return amd_pstate_set_floor_perf(policy, cached_floor_perf);
 }
 
-- 
2.56.1

