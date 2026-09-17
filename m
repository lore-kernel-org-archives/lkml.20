Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D8344DB7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649501; cv=none; b=MDlD7c9/CaNQNJ7iifKqraeAQzXDSYVAyWdtw9W2zIm2Ol5/nznmrq4r64AKKpUEaXhIc8clDu1R4ICZHhFPoyyX0AO3Why3SM9fFVVcIU1d6nqkKzVkYTdYsandI0QxXq7MzcypZD4XA/Cd6KxOdUxjZsxo4KjYXh/sCDkOyak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649501; c=relaxed/simple;
	bh=EdyvNUGzZQfOCichJt6a2G8qG+Z+dq696yNIz94RDV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNGmDaSjy4e+xxQ8MOJ2JkH2yOvyOOSPLLIeGRcEGjuA1g5tlJTGxq35sPdb6n1ZO9MFUJiOFYf5DX6oIKH760l3zNdopat/OV5oCFYoAO6yTQgZK5ioJzBAuT/xYKr0Bx4nwlz88OysZOyXBzGNR7rX8eubgnw6whQIVWELyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxOnDJqZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxOnDJqZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so4225455e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649484; x=1790254284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=lxOnDJqZWJQ6rUn3e8fZTgqNyRiIZadguNCaYIQZdw9XJnL6c3wGngXimE3m9TvTqu
         Q89Gdbail7OHKTjI5eMDDOPOVbhlzFpDQz54d5VPPx1iBWbnBOBV7c5rpu/8fkCT8tC9
         LtWcbI0ZEw43F2kX5OXG8o/NpLDX54bCQM64nCBOMNuaFEnEDaDIzqVH7zMMho3dkGH2
         C8npca9FkmH3cMfaYbgVW8WALx3KjHAvWhqEp9LevTtYn40ZJsTeHMt1BSkVq4newc6b
         tw+vrSw6Aagu+urT8vYSEKZf/j9Hg+xNGBEDCrmA/qftUt8jVNOgaHG3pjykUrhhKR9Y
         tocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649484; x=1790254284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=2eAi3W+JtxOPeHTPTxLwKusvoMvoV3ipDcCVgQ4dXp8Nj47QpfTTKWBwslBuZJjs9j
         zDT4KH0U5c+EU++zIQ8Z5uYGaJAJGfFRpNUFgYfVo+WvmRDrIirn7DA24agHtah41+MK
         p0EYfHl2Gfqa9Qas6FU1wqraMQ69wD0p42/7zNBy9Rimfa0o4NFkPsewmlEqnRFmN9w8
         Px2OVEpj22xzWkRX7sgJFmUG6pS5gKdh/0NVRKVCTcjnSZPoq/uI06bgrDlsucnNCjpT
         NXALU4RfuTpt58gpWduRhHpwOSfNAUpVOD0ewwVV5U4XEjBVNVYXvY7TAAtZVYWdBjgL
         XJ9w==
X-Forwarded-Encrypted: i=1; AKwUvByfBHtZOEc5qH06yc/6Kv8JYOrd+MRGCh9FaQorNCDMFQMrpfTXHPmPDPZA1gwIQPGDgwCdkZm67ti9OFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lpUdGOw9ZQIfaVink9+OBnndgWGzyPRn8vPG+wNkEK0wNMmY8N
	8HDtAfZ1y3+ZbbELoLFTzpyQIxEVXmyKiyvPRrZOOmZiB46eoaaBS2KA
X-Gm-Gg: AYBFou244FJ+9qHlvGgT4NOwge7Qu9GJTPhDPWFPy2XKOkFWDOTcjB9dkMpOiSijLov
	Q7/WZLi+5enPsKvNUDcW7DrQ+sAEFZEbAkPHgm4A4nao49eCwXL4jj+z0zP/1JW3t0zNIpBi6Lh
	g38NjFS9pXGdAgvdwgINZxsxFI8di4ZAQuQf/26nVsRAlruJTZwmsz9z2gjmCq6HvJoBY/PzgcR
	v7W5TxC/2fNOnb02SuDXewjkvkvs1dF0f1dzwfxE1XWeVFzppv/smQ8aAEDBTQDuhgUiGPiRc6V
	3jGSdeenbrA9kGVgnSCdHjYUUOlB0zNgYyJDgjDlIFb5suGRKbtKbXe95er1R9rAvHqI74sAU72
	C2yFTPJqlrycIZHyMcEtvLwxHCJ+fQamMl1SdDWWXVkchFd7HulL8+Bc4xTRmn+ZVdfVl5coFmQ
	kOf6RpsKf7vvT8TRcAuZ3sqPoFQRvy/JfcRdgA1+dGKacjG6eGjHmUowhJBhK/IH1gT5+i/psiz
	6r1BcjL
X-Received: by 2002:a05:600d:4442:10b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fbd1e4f0amr32449375e9.13.1789649484234;
        Thu, 17 Sep 2026 05:51:24 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 2/2] arch_topology: use the boost frequencies for capacity_freq_ref
Date: Thu, 17 Sep 2026 14:51:12 +0200
Message-ID: <20260917125112.2283-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917125112.2283-1-okerixx@gmail.com>
References: <20260917125112.2283-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY.
cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
reference is the non-boost maximum and stays there.

Once boost is enabled the CPU runs above its reference.  On arm64, where
the AMU drives frequency invariance, amu_scale_freq_tick() caps the scale
at SCHED_CAPACITY_SCALE, so the scheduler cannot tell a boosted CPU from
one at the sustained maximum, and arch_freq_get_on_cpu() cannot report
above the reference, so cpuinfo_avg_freq is pinned to it.

CPPC based systems do not have the problem: their reference comes from
highest_perf, and a disabled boost shows up as cpufreq pressure.  Do the
same for frequency table drivers and take the highest valid table entry,
boost entries included, as the reference.  With boost off
cpufreq_update_pressure() then reports the difference as pressure.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP this moves the reference of the big cores
from 4032000 to 4723200 kHz.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/base/arch_topology.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..300f64ffea2f 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -386,6 +386,20 @@ static cpumask_var_t cpus_to_visit;
 static void parsing_done_workfn(struct work_struct *work);
 static DECLARE_WORK(parsing_done_work, parsing_done_workfn);
 
+static unsigned int topology_policy_max_freq(struct cpufreq_policy *policy)
+{
+	unsigned int max_freq = policy->cpuinfo.max_freq;
+	struct cpufreq_frequency_table *pos;
+
+	if (!policy->freq_table)
+		return max_freq;
+
+	cpufreq_for_each_valid_entry(pos, policy->freq_table)
+		max_freq = max(max_freq, pos->frequency);
+
+	return max_freq;
+}
+
 static int
 init_cpu_capacity_callback(struct notifier_block *nb,
 			   unsigned long val,
@@ -404,7 +418,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = topology_policy_max_freq(policy);
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
-- 
2.55.0

