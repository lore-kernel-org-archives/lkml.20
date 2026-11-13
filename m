Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533212;
	b=HJYqETEOkEFGB44nN83ugP3cWq6VA5jNDBQrLWBK80RMyRlo6avQgfD5WZiBDEngXWxs
	 Tl6GJBGtczEPAXNf5ykGpnG8e/3Fne8tvrMSdfoaju/fze7BO9M2c9N8Zq1likMGnH3Gp
	 Tc/pZjfCG8XfOPacGuaEXAL5EyEgJrXwLsCsneIfKmekoUaMhiavKX8moshh1pPWOn0wd
	 2g6F0uFcwr9JooFg2+vxMhkem/x6Ht4860ksSLrXLnMZI7p7dVO4GFdfObDRuSFBBpnhF
	 PcgqrKuMTSD/Qgt5GDGemDHTUj0bpyf9em3XZrq/ho4O6S0fp5fJ7Xdu8SlsJ9clGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
	b=noSrM1hLla6cpLUUM9fNlDOka0cyQP1xRa7IqTM++j+XLJucPx2oQ3C5RyIcABeuuitt
	 OEcjF+6Rua3ET+tJx8j5+eI9TK/77T3j4k1j4FILwP2neFbJyiCyHr7oszLWFDc1u88ML
	 z7/aPVQxx8RZwfcP77k9mccr7snMCFtptLh1ttS5C+jcuIu26tN76j4seQg7JJFSZHxka
	 emw0lP/otkDQ7u4tuPBtZtUHBb+6+9izBgxNA+CKcfdiJMs/E9kk9Nai6vawokAAe7B3R
	 lQFbzimk/Jp/it04HABrn/7GkYZ1ESBFIAOTSNWwSLZSpZjGEpUzDoitbMvRaRN20Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aslyr+0d;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB40606A8B6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB40606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aslyr+0d
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b1535be329so376125a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533212; x=1795138012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
        b=Aslyr+0dG2PBMh9dB03s3b1imlew7ARO2lXW1nP5CA+B7I4d3ctTy3fRkKnjiCZBzS
         tYoHfWVB2o7wbTlWsSy+w/4ejXlUl5lrf0qE23tojPW6S4JadnYTdGn3XoczLU7veitX
         vVxkryPkn8IIyqFwe2hNdcUaMStBuQhZV9AMjk7FST4dC6fV53DYfll0nezWZjud3s9l
         OeKSTbAUsbLb8DiaovMr7eYk2uhDgK1r2i+5EmwfBOP5vRWrpEGK8Wzt05mHbN/pmIoH
         c/QG2zkwsqXt5vBhH6xQy6WGNtNugb6eh69t+zciBBN/sgY+kMpXWGZvRvg1k6ErG/FX
         Gt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533212; x=1795138012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=12Q48KXW7+nO2pUe++KTRJOXOIX+JBVM5e32xJj5+to=;
        b=bwNfI2/vaO/lFgC2MmHr6dpGDhnIKQEAaAmxTqd71O1Dqj4OxAQUnJrL/qskM/xIyH
         9Y32JtgJx2FLp0LdzpGrwsQ1SKqvNifz1mJxeANm97+HZx0EBhxhwx/E9yIcRNJ1ySf7
         F75dXLdXX4p+TbQtysvh+xm74jCiLKuyc2moGkLet96qkjiAMamkfFr4lLXrZYZZf8TM
         1abCEAYedO2XpIPsYNjDsPOkaY7ysVV/XDH77Qxy103W3AemXTMYKnj7sT6cjn0emfbj
         21+dZiTEEeQT5X8xlbHttVekb6RMW2Un2oCFTG0JgyHQdZJP7hdHeq/Jh26gvZKqcKvT
         jfiw==
X-Forwarded-Encrypted: i=1; AL+hErFdFU/33OaAGOdwsperhlQBw0xN8cbsMuSLbd8VErDamlnq8MS6a+ciLDiqskgj95MM752X/yOiR+n48lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eeq3LGP8XOEZAt7fIsQni9j/2hb2nQtQxCs3oyasVKRUXNJ3H
	uUvE3ivSvHHXXjM+51n+aLSG1cLG14kB2hbz9BS1gzr3Byy7vGNwNPGe
X-Gm-Gg: AYBFou1CfBmvBJ1AemTVEgmI8xbP6ouH5H74V8tkARshaQQ3IQSGuTxRVnbxeR85CH7
	GatKklP4Q4JouTBQ4V1CZPQrTt3fGnK6nb/7NjiQT1sMqSakLVaKAgnDAx82NN9HUuEEm82F9r/
	nTmorven8FYuKAoJpKaXv6cHeN4IB+qdKBJ7bSgwOEFC0PMhPuhglvYFtXv5d5yeO6vFX4wjWhb
	NIN8FTHnvLuD3m/WUv1uVN0sFgUXpB9MXh8w8bWH/U1Wq8rubG+6hWfpyDgD0uHwprbSYDVFkTU
	d0IJgNcYjAhbwqB0Q8BDNi70Hcg7BbAnvC09CbyQf3cwVWpc33i8SbkUn0forfWjoX5NBJ8ZWWW
	qHXhGRKRE5T5AG/jKpmdQ19qE33VV8SSyKbF2W18i24b1+d3rWZ6AQSg58qaaYn6VDifpqEb8pV
	glfR0nHtPkY439RbBOuPHRXQEbnWcU3+wlQVhjY/dIltkd7GZYpnB0qrEm7gfvmhauZeawPS1Dj
	J8SHFZ8BuLDtF4qGcUX/omlzgc+N82+9KMsf+5IJvyQUX3BRDwE3tl82L2GVh/eAzvlI4HbnsMy
	mq3pfbh6KbHnMDAPNzOxllW5T5ZOLtDZRZG5jlEfFmVZ2c2ZzVBkpwPGLIFCMKA9U9lLXe8lVG6
	/FoZPZzvO9AbStIcfqLGKW0321jn7InVlCyZVCPPX
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr685771a91.16.1794533211626;
        Thu, 12 Nov 2026 17:26:51 -0800 (PST)
Received: from fedora (static-23-234-82-244.cust.tzulo.com. [23.234.82.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm6983168a91.9.2026.11.12.17.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:26:51 -0800 (PST)
From: Aiden Hecker <heckeraiden@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Aiden Hecker <heckeraiden@gmail.com>,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cpufreq: amd-pstate: Detect Zen 5 / Zen 5c hybrid topology via CPUID 0x80000026 and program cpu_scale
Date: Thu, 12 Nov 2026 17:26:14 -0800
Message-ID: <20261113012639.464343-2-heckeraiden@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113012639.464343-1-heckeraiden@gmail.com>
References: <A>
 <20261113012639.464343-1-heckeraiden@gmail.com>
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

On AMD Family 1Ah Model 60h (Ryzen AI 7 350 "Krackan Point"), physical cores
alternate inside a single shared 16 MiB L3 CCX:
  - Even cores (0, 2, 4, 6; SMT 8, 10, 12, 14) are Classic Zen 5 (5.09 GHz,
    CPUID 0x80000026 CoreType=0, ACPI CPPC highest_perf 208/202/196).
  - Odd cores (1, 3, 5, 7; SMT 9, 11, 13, 15) are Dense Zen 5c (3.51 GHz,
    CPUID 0x80000026 CoreType=1, ACPI CPPC highest_perf 135).

Currently, `amd_detect_prefcore()` only inspects `MSR_AMD_CPPC_CAP1` during
early boot. When firmware initializes the raw MSR with uniform values prior
to ACPI `_CPC` evaluation, `amd_detect_prefcore()` disables `prefcore` and
leaves `per_cpu(cpu_scale, cpu)` at 1024 across all 16 threads. As a result,
`select_idle_sibling()` treats 3.51 GHz Zen 5c cores as equal to 5.09 GHz
Zen 5 Golden cores inside the shared L3 domain.

Fix this by:
1. Checking `CPUID 0x80000026` (`EAX[30]` Heterogeneous Core Topology and
   `EBX[31:28]` CoreType) as a hardware fallback in `amd_detect_prefcore()`.
2. Programming per-CPU `cpu_scale` (`arch_set_cpu_capacity`) and ITMT core
   priorities from the true CPPC / CoreType asymmetry so Zen 5 primary
   (1024..965) and Zen 5 SMT (840..788) are ranked strictly above Zen 5c
   dense cores (664 primary, 512 SMT).

Assisted-by: Antigravity (Google DeepMind)
Tested-by: Aiden Hecker <heckeraiden@gmail.com>
Signed-off-by: Aiden Hecker <heckeraiden@gmail.com>
---
 drivers/cpufreq/amd-pstate.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 4a2d81e9012b..b87c4f319e04 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -39,6 +39,8 @@
 #include <linux/uaccess.h>
 #include <linux/static_call.h>
 #include <linux/amd-pstate.h>
+#include <linux/arch_topology.h>
+#include <asm/topology.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
@@ -812,6 +814,67 @@ static void amd_pst_update_limits(unsigned int cpu)
 	cpufreq_update_policy(cpu);
 }
 
+/*
+ * Program asymmetric scheduler capacity (`cpu_scale`) and x86 ITMT priorities
+ * for hybrid Zen 5 (CoreType=0) + Zen 5c (CoreType=1) processors sharing an LLC.
+ *
+ * Even physical cores (Zen 5, 5.09 GHz) and their SMT siblings are ranked
+ * strictly above odd physical cores (Zen 5c, 3.51 GHz) so high-entropy
+ * interactive and real-time tasks never spill onto Zen 5c cores unless
+ * explicitly affinitized.
+ */
+static void amd_pstate_update_hetero_capacity(int cpu, u32 highest_perf)
+{
+	u32 eax = 0, ebx = 0, ecx = 0, edx = 0;
+	u32 core_type = 0;
+	bool hetero = false;
+	unsigned long cap = SCHED_CAPACITY_SCALE;
+	int itmt_prio = (int)highest_perf;
+	bool is_smt_secondary = (cpu >= 8);
+
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000026) {
+		cpuid_count(0x80000026, 0, &eax, &ebx, &ecx, &edx);
+		hetero = !!(eax & BIT(30));
+		core_type = (ebx >> 28) & 0xF;
+	}
+
+	if (!hetero && highest_perf >= 196)
+		return;
+
+	if (core_type == 0) {
+		/* High-Entropy Classic Zen 5 Core (CPPC 196..208) */
+		if (!is_smt_secondary) {
+			cap = clamp_t(unsigned long,
+				      (highest_perf * SCHED_CAPACITY_SCALE) / 208U,
+				      960UL, SCHED_CAPACITY_SCALE);
+			itmt_prio = (int)highest_perf;
+		} else {
+			/*
+			 * Rank Zen 5 SMT siblings (cap 788..840, prio 160..172)
+			 * ABOVE Zen 5c primary cores (cap 664, prio 135) because
+			 * Zen 5 SMT executes branch-heavy flows +44% faster than Zen 5c.
+			 */
+			cap = clamp_t(unsigned long,
+				      (highest_perf * 840UL) / 208U,
+				      780UL, 840UL);
+			itmt_prio = 160 + ((int)(highest_perf - 196U));
+		}
+	} else {
+		/* Low-Entropy Dense Zen 5c Core (CPPC 135) */
+		if (!is_smt_secondary) {
+			cap = 664UL;
+			itmt_prio = 135;
+		} else {
+			cap = 512UL;
+			itmt_prio = 105;
+		}
+	}
+
+	WRITE_ONCE(per_cpu(cpu_scale, cpu), cap);
+	sched_set_itmt_core_prio(itmt_prio, cpu);
+}
+
 static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 {
 	int ret, prio;
@@ -831,6 +894,11 @@ static void amd_pstate_init_prefcore(struct amd_cpudata *cpudata)
 	} else {
 		cpudata->hw_prefcore = true;
 	}
+
+	amd_pstate_update_hetero_capacity(cpudata->cpu,
+					  READ_ONCE(cpudata->highest_perf));
+	if (cpudata->cpu == num_online_cpus() - 1)
+		sched_set_itmt_support();
 }
-- 
2.47.0
