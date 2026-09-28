Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D945FFD2;
	Mon, 28 Sep 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578897; cv=none; b=cN7eGtW8AEl0j9WSh0R3jikhTquUMHVbj91H/cZYOdGihvCF3WEGZTKFayqve9RlINTNlszwy1pXBgbCIoXK4RpVkAImT5y2C08kL8w+hd/BU4dhB6Lf3GnD4Zyrhq5Z4rHXLSLz+VJrK7hdE4F0j+wyeUScTF5sLE0SXPMyDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578897; c=relaxed/simple;
	bh=01WjWi6OQPQ4Sltv8boNZGN9o1pfsVOaL8S8/H2CfUA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Zqv3O7xLVTpvJ5L/ddXTZRlvHaGb4SeON/QG32k0ThrGhImU5mtY/P56Ih38d5kfdhYiHz1dI/jPpSCluRgmgHKMx7+wrPY5OUgaqZg1D2xWOMrX54OxUy/OogEFDv9BzCcHLFUmT9Zm/rrcIzTvuJ9vlXmEKo8nufwgE9FB6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qRkCIvWy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yDFzqLMX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qRkCIvWy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yDFzqLMX"
Date: Mon, 28 Sep 2026 07:01:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578894;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCiPp2A94KvjKHCXpQP9LoUnQOMUJEotPICm4uipelY=;
	b=qRkCIvWydp2wCJifBMxU+/Gr+3X8j2h+EdXdX1orWt88F6mvVMUckTjcVHddvvEw0V9h15
	z8zdURBzspCoBrafgN8GBvEZ+jy2ZknXXJy4E/NmDyMFBA1xSSreVXV4B385NEqGvBgQ6Q
	IWzbOXMvKWbxh2MZw0GfPaIaTdKUIVCB5JrsTakw61y/Pa2owqAkbtg7RHREk3zVOmZU2w
	pCVaOAXcn18p/AGiVLRsJTXFbza2Ghl/eBYzVuTAbqFXqztF39gLwRP5c/Q/gsxLpGqrjI
	t3uRHRJZM9PBtQYhIOtmmsG75f45bgk4JIaAqeIsz2aadF6WcWlcf90k34Sf0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578894;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCiPp2A94KvjKHCXpQP9LoUnQOMUJEotPICm4uipelY=;
	b=yDFzqLMXYoWd/vcgMF07E0s1WBDVLRNGZ5VJ9kIMGCBouiEILXT+KTnh6OLQqVf/b8u6/l
	/beDkfL8w7FycrCA==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/cputime: Add kcpustat_field_total helper
Cc: Yury Norov <yury.norov@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Yury Norov <ynorov@nvidia.com>, Mete Durlu <meted@linux.ibm.com>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-2-sshegde@linux.ibm.com>
References: <20260928053728.797539-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889285.3910103.14197792731457052758.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     a8d0854a76a876ea474e17322acb680716a09da2
Gitweb:        https://git.kernel.org/tip/a8d0854a76a876ea474e17322acb680716a=
09da2
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:16 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:40 +02:00

sched/cputime: Add kcpustat_field_total helper

Provide a new helper function which sums up a given type of cpustat
over a specified cpumask.

This allows the caller's code to be simpler and avoids duplication.
For example, subsequent patch in the steal governor use this exact
same pattern when calculating steal time.

Number of cpus can be derived from cpumask_weight() where necessary.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Reviewed-by: Mete Durlu <meted@linux.ibm.com>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260928053728.797539-2-sshegde@linux.ibm.com
---
 arch/s390/kernel/hiperdispatch.c | 10 +++-------
 fs/proc/uptime.c                 |  6 +-----
 include/linux/kernel_stat.h      | 11 +++++++++++
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/s390/kernel/hiperdispatch.c b/arch/s390/kernel/hiperdispatc=
h.c
index 2172065..c21496f 100644
--- a/arch/s390/kernel/hiperdispatch.c
+++ b/arch/s390/kernel/hiperdispatch.c
@@ -207,16 +207,12 @@ static unsigned long hd_calculate_steal_percentage(void)
 {
 	unsigned long time_delta, steal_delta, steal, percentage;
 	static ktime_t prev;
-	int cpus, cpu;
+	int cpus;
 	ktime_t now;
=20
-	cpus =3D 0;
-	steal =3D 0;
 	percentage =3D 0;
-	for_each_cpu(cpu, &hd_vmvl_cpumask) {
-		steal +=3D kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
-		cpus++;
-	}
+	steal =3D kcpustat_field_total(CPUTIME_STEAL, &hd_vmvl_cpumask);
+	cpus =3D cpumask_weight(&hd_vmvl_cpumask);
 	/*
 	 * If there is no vertical medium and low CPUs steal time
 	 * is 0 as vertical high CPUs shouldn't experience steal time.
diff --git a/fs/proc/uptime.c b/fs/proc/uptime.c
index 433aa94..53143c6 100644
--- a/fs/proc/uptime.c
+++ b/fs/proc/uptime.c
@@ -15,12 +15,8 @@ static int uptime_proc_show(struct seq_file *m, void *v)
 	struct timespec64 idle;
 	u64 idle_nsec;
 	u32 rem;
-	int i;
-
-	idle_nsec =3D 0;
-	for_each_possible_cpu(i)
-		idle_nsec +=3D kcpustat_field(CPUTIME_IDLE, i);
=20
+	idle_nsec =3D kcpustat_field_total(CPUTIME_IDLE, cpu_possible_mask);
 	ktime_get_boottime_ts64(&uptime);
 	timens_add_boottime(&uptime);
=20
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index 9ca6c22..c1e8555 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -196,6 +196,17 @@ static inline void kcpustat_cpu_fetch(struct kernel_cpus=
tat *dst, int cpu)
 }
 #endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
=20
+static inline u64 kcpustat_field_total(enum cpu_usage_stat usage, const stru=
ct cpumask *cpus)
+{
+	u64 total =3D 0;
+	int cpu;
+
+	for_each_cpu(cpu, cpus)
+		total +=3D kcpustat_field(usage, cpu);
+
+	return total;
+}
+
 extern void account_user_time(struct task_struct *, u64);
 extern void account_guest_time(struct task_struct *, u64);
 extern void account_system_time(struct task_struct *, int, u64);
