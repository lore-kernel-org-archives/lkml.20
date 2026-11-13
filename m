Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536981;
	b=jAjDzKHz88In/DrVk6chqaMY4r1EEFRaQBWytoq1Ob/tvEbqjb4eYVRoPpCxrcGUlCPD
	 h8SsbT/P6QZPjjSDR5DJQ7q7nqanNYCcFyqyL+98X5HjKOH1YHk7G6Ldyr5J7J+yC0kyz
	 wUQ7IU0KaVTygU5WTyp8ZAvIoGmE8TnZVle45oaMLcJgqdhseDS5VSMoJIWQMSwNT3jkw
	 ZZ6nwsCbSunjKaw5CSstDLqiUpo3s46/B94wvUtXWDsNKtkcZxUDRnDG6uNnR6WXBcJdb
	 ZsxHKVPHSUtOYWjYHBQDa6G0RP3qVQ1HDogID/V6PjstNOLw0XOpU9xVcqIFU0iqd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v43qrtIVqNMJqQE5xu9+Ge4cqhglAQOPGlfnsSn0+3Y=;
	b=k7TrpqzBYX2BHUx7Wke6lLUsME1J44XHFi5DzN8p3QI/nSPBF1YhY0yBtgI4OCqJb31p
	 jFRbHl0vj0vQw1X4kzsOezSYOfWJOLo7AV/2bKtx8UhlvpErP9hwfiWMtLQNLGyFdvRt9
	 rFPJx+x25ivZ7Dq04eBNpE8onDnptNKWz7Yhrgr5Y6wB7AV890BWjSp+iUgxEMEfbabbm
	 eND6eEEfl9sAO3ZCJMe/0zGboxuelTcPcUsqG5iLbgeuXdcdg0nk3K4POZhW0V3WBFyDy
	 HNPqmAn7XfE7cyVsnq8+Uk17p1Gd/+pht+BRZC2g1sZJbcjDOeVTmzXU7MBa17nrKnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNPGWpXs;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC0B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XNPGWpXs
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5efadd183so736039b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536980; x=1795141780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v43qrtIVqNMJqQE5xu9+Ge4cqhglAQOPGlfnsSn0+3Y=;
        b=XNPGWpXsCjETwnFCuffPp7eCJFAjPVi/99mZwpTMb2DRNM4I5cgZJAoZ3JYWiM1wLJ
         w1nHmltwfpFRpKNUP6d7AyFQVX+NMTf28PpTpWEl1YgnNNcPki/L57XvC+tMAYCV9L31
         nK4dy11iSbOfh/VboH5uGugu9tRroMUmd5AQ0LBfc/oVpaOeYAIoIi1/NgKjh0uT5DRE
         AOxsh5MmLvbDo5yd9ylcpzf84EuxXXZAn5O0WeLvbT79xt8GMZnVxzO80xNl4XHpkaBe
         ENbml10NvkFGneq/l0ckCzHD4yPQWwsdRhrcmkoEWGGidgxPJid1Hi6TPTbOBAUbyYH0
         2/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536980; x=1795141780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v43qrtIVqNMJqQE5xu9+Ge4cqhglAQOPGlfnsSn0+3Y=;
        b=MOprf2xuDLZF0OqGkON48qKRrdprTv7TfLT8DFmmw9pOjakngi3pkWFpHUr6A0aSw9
         5m1Xgn4tdirXoiuMNGSy88Mqlwk+a4/86VzTmRXv65K1mh2i1rR2HIOxQUGGFjFuPOQ+
         BTziW+N0h616PhMRRLDc/TjirLUpIBkzXlwd+d2kEJ/YT/7bwe3yChSppdrXmoQyPYUm
         Nmi5J881i8IfN3oD/gNoYpToI/i2EvvZU+2ewThFFE9yztL6y28DXLwfuvnE5hNzo0Bx
         hdr0IpP581okh0nzbZea/w50uI+KusL81QE+SUXAJWE2wqTwDD0zJGghLtH0xsroQi/G
         qipQ==
X-Forwarded-Encrypted: i=1; AL+hErE6I0FVGHJPQfaEnXywrv8+1GAuTHDDMSUkQGL5FhdeMZbVTqjEJVriKYnnNw7OKzml9MXnJqLCQ6Ta1Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g8VKDl5Lqjt/PsiF8jiRE8MSiZ44XmVK6uHQ3bjTyPdRhdBLY
	xG3cIMT0dj2gYId5JrFK9JFhtOZRY6moPrLSGqj0DuR4wc2bzKQefZkx
X-Gm-Gg: AYBFou1G8jfVg1TiGFshZ1IeaapEUeAk0zOoPiiIgSpXJDtW2aMlqloQToJ5gsP34Sa
	a2YQXowyt+XUEU42KNFFQSrWsVBihw9iFBjPG8r3ysFcs4X6Er7X7fHaxh4QnPKPyXToJXFEu9M
	5ir7uGSVT+DqoNQ+L9M+Wb0B7vwoHpkU2EdO2aEnfVkyrP7cqKpbOPU4Wugv+SCbhdot5tTKXag
	+OKQmYvY0ub+t4yZJ5YmhnvpVmK4InlOdgO3JveP+jY1DukpAXPIs8JsdYX52JYB2IyY+TFmpS5
	E2n+snactGq9N7SE8+SlVqfHAx0E4CsfavaLYheiNxnceJVeO26VYOMRVuwet9RHamhbme0c4hy
	X9A6BEgSWAdf2KZdLbl8XFm7F9S9ETJOvoozt5gV9AnFnbUOjItx/eT7sv2J+eeJPKSFc+dDVyr
	H3+BsnMSVoTJ1BCgjhNr/XSdGPlEBzFUhqFFKT9fy1RqBu5WSnefkVkxNMuGHmwVPoU+OB8/lfR
	MtS1h/NP4glBMwnomOiEkIeX8gErNJrsoATzaui4Nk1fipLhrPQdrV6hA7M/GPtN6p+nPMT10rP
	yTqytBycZKokUAUtiVJwlh6itYxnx6Y7H/GfHJvq
X-Received: by 2002:a05:6a21:d82:b0:3e1:8a37:bf1e with SMTP id adf61e73a8af0-3f7aa8e5c67mr648446637.42.1794536980123;
        Thu, 12 Nov 2026 18:29:40 -0800 (PST)
Received: from fedora ([2601:600:cb86:7af0::c952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm335547b3a.10.2026.11.12.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:29:39 -0800 (PST)
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
Subject: [PATCH v2 0/2] cpufreq: amd-pstate, platform/x86/amd/hfi: Enable hybrid capacity scaling & SMT ITMT ordering on Zen 5 / Zen 5c
Date: Thu, 12 Nov 2026 18:29:32 -0800
Message-ID: <20261113022934.13397-1-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hardware Observation on AMD Ryzen AI 7 350 ("Krackan Point", Family 1Ah Model 60h)
=================================================================================
On AMD Ryzen AI 7 350 (Fedora 45, Linux 7.3.3-300.fc45.x86_64 and linux-pm 7.4-rc2),
the silicon interleaves 4 Classic Zen 5 physical cores (5.09 GHz max, CPUID
0x80000026 CoreType=0 / TOPO_CPU_TYPE_PERFORMANCE, ACPI CPPC prefcore_ranking
208/202/196) and 4 Dense Zen 5c physical cores (3.51 GHz max, CoreType=1 /
TOPO_CPU_TYPE_EFFICIENCY, prefcore_ranking 135) inside a single 16 MiB L3 CCX:

  * Even CPUs (0, 2, 4, 6; SMT 8, 10, 12, 14): Classic Zen 5 (5090.9 MHz)
  * Odd CPUs  (1, 3, 5, 7; SMT 9, 11, 13, 15): Dense Zen 5c  (3506.5 MHz)

Observed Issues in Mainline Linux
---------------------------------
1. When X86_FEATURE_AMD_WORKLOAD_CLASS and CONFIG_AMD_HFI are enabled,
   amd_pstate_init_prefcore() disables amd_pstate_prefcore and delegates ITMT
   priorities to amd_hfi (`AMDI0104:00`). However, neither amd-pstate nor amd_hfi
   calls arch_enable_hybrid_capacity_scale(), arch_set_cpu_capacity(), or
   topology_set_cpu_scale(), leaving /sys/devices/system/cpu/cpu*/cpu_capacity
   and arch_scale_cpu_capacity() at a uniform 1024 across all 16 threads.
2. In drivers/platform/x86/amd/hfi/hfi.c, amd_set_hfi_ipcc_score() passes the
   class 0 IPCC score identically for primary threads and secondary SMT siblings,
   without distinguishing SMT secondaries via topology_sibling_cpumask().

Measured Impact on Real Silicon (Ryzen AI 7 350)
------------------------------------------------
- High-entropy 64 KiB pointer-chase + branch workload (450M instructions):
    * CPU  4 (Zen 5 Golden, CPPC 208):  66.69 ms
    * CPU 12 (Zen 5 Golden SMT)      :  66.09 ms
    * CPU  1 (Zen 5c Dense, CPPC 135):  95.18 ms (+42.7% latency penalty)
- 16-thread mixed desktop/audio contention benchmark (2 critical + 6 worker
  + 8 background cruncher threads):
    * Unfenced equal-capacity placement: 75.77 ms avg | 109.22 ms worst-tail
    * Hybrid core partitioning:          34.66 ms avg |  39.42 ms worst-tail

Changes in v2
-------------
- Rebased cleanly onto rafael/linux-pm.git (v7.4-rc2) and generated with git
  format-patch; full `bzImage` + modules + `W=1 KCFLAGS="-Werror"` build-tested
  and verified `0 errors, 0 warnings, 0 checks` with `scripts/checkpatch.pl --strict`.
- Patch 1/2 (`drivers/cpufreq/amd-pstate.c`):
  * Uses x86 `arch_enable_hybrid_capacity_scale()`, `arch_set_cpu_capacity()`,
    `topology_set_cpu_scale()`, and workqueue-deferred `rebuild_sched_domains()`
    rather than writing generic `cpu_scale` directly.
  * Synchronizes SMT sibling capacities via `topology_sibling_cpumask()` so
    `SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY` warnings never trigger in
    `kernel/sched/topology.c`.
  * Removes hardcoded CPU index checks and boot-order `num_online_cpus()` races.
- Patch 2/2 (`drivers/platform/x86/amd/hfi/hfi.c`):
  * Scales secondary SMT sibling ITMT priorities (7/8 of primary IPCC score) via
    `topology_sibling_cpumask()` when `X86_FEATURE_AMD_HTR_CORES` is set.
  * Removes unreferenced module-parameter stubs and raw per-CPU `cpuid_count()`
    loops.
- Updated recipient list using `scripts/get_maintainer.pl`.

Aiden Hecker (2):
  cpufreq: amd-pstate: Enable hybrid CPU capacity scaling on
    heterogeneous Zen CPUs
  platform/x86/amd/hfi: Rank SMT siblings below primary cores for ITMT
    packing

 drivers/cpufreq/amd-pstate.c       | 121 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hfi/hfi.c |  18 ++++-
 2 files changed, 138 insertions(+), 1 deletion(-)

-- 
2.56.1
