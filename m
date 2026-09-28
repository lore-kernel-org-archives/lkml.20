Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E545D1B1;
	Mon, 28 Sep 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578895; cv=none; b=PdgEeha4Ob2pNwO04CEgEQjrgZlcjAElNlJo4OLDPXJMACv0/ETYBL91n3jMvf6e22tXYZDJyHhAe5ZDubspXuIEv2sIolOgVkQY6rCbUVI2iUQpweXV9++Z8ZLTwtqDe2Y0J74sToumyL0vfwB+pEDUQjdZuBbki+BBGSkYBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578895; c=relaxed/simple;
	bh=XqcXhLP2KkFThLktPs3QBTBzFw3+JucbEdIzHVyTZUw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YMhcY+jFAUA5rifUGGwVABO7rVWiMhUZPGewiDvLG/i5s1lihLRJj3+WHxDGa2S5wuednol6SyC1XZMCJikw1pn0Z3eBojVwcFav6NxgrfB4JwvueXG0SzrhXYz5a35PCqhg06AuBUbpw0QpcgaJH/1YRIwhrREUQusVjK8mXZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ocjE1pdk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c/TQ3NcK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ocjE1pdk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c/TQ3NcK"
Date: Mon, 28 Sep 2026 07:01:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578889;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72yQgA4lt8PSqDsyxKl42ZoMtrIR4o1RuT8OXO5r7n0=;
	b=ocjE1pdkMo7S+1J+jXUI5BSX9qDZpn4PCdEgf8nBxyzrupFVWNbDjEVeOLL7gG2pwAl7Ll
	AIuwlPN/u1Yhs8UwWeOO++MmDlHBUjZFgXvLHsHqUL/P55b0rKw4svSKXBJFyg7/9gFjVs
	5gCAcAIiY3yIekBSR0amNsIiPxIJ0Rn+cMEZ7knuj9fqNghKZdXVj5jChy49GR01hpMyCa
	MvmKzdLC8smVwTJPjSMS3evGa0CjakJ81qjHvZg6y5yJacRWwlkQOirTQeY9EuiIZ5x6RR
	SAgV4Wa10PxYE/Mv1BH8X0A7sE/pZuSoeuGaPGLiC3CwIfSZoHyj4otJHIj1kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578889;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72yQgA4lt8PSqDsyxKl42ZoMtrIR4o1RuT8OXO5r7n0=;
	b=c/TQ3NcKYtNvruECOtLUa/Vz02GT0LGriV7TJpsuRGonaxtXXpHU2mMzM8tmSDagbTGmdz
	ZZnW8hF8wjIGnQAg==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] cpumask: Introduce cpu_preferred_mask
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-5-sshegde@linux.ibm.com>
References: <20260928053728.797539-5-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888769.3910103.11706346503084215657.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     518b32bd5bb373aa334e4b73d359689071d50b5c
Gitweb:        https://git.kernel.org/tip/518b32bd5bb373aa334e4b73d359689071d=
50b5c
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:19 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:41 +02:00

cpumask: Introduce cpu_preferred_mask

Provide the preferred CPU infrastructure. Define get/set macros
which could be used to get/set CPU state as preferred.

CONFIG_PREFERRED_CPU will be selected by the driver which handles
steal time values. It is going to set/clear preferred CPU state.
This driver will be called steal_governor and it is introduced in
subsequent patches. It periodically computes the steal ratio and
decides on preferred CPU state.

A CPU is set to preferred when it becomes active. Later it may be
marked as non-preferred depending on steal ratio by the steal_governor.

Always maintain design construct of preferred is subset of active.
i.e. preferred =E2=8A=86 active =E2=8A=86 online =E2=8A=86 present =E2=8A=86 =
possible

With CONFIG_PREFERRED_CPU=3Dn, ensure set_cpu_preferred is a nop and get
method returns the active state in that case.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-5-sshegde@linux.ibm.com
---
 include/linux/cpumask.h | 24 ++++++++++++++++++++++++
 kernel/Kconfig.preempt  |  4 ++++
 kernel/cpu.c            |  6 ++++++
 kernel/sched/core.c     |  5 +++++
 4 files changed, 39 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 7c8f167..bf89bb3 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -121,12 +121,20 @@ extern struct cpumask __cpu_enabled_mask;
 extern struct cpumask __cpu_present_mask;
 extern struct cpumask __cpu_active_mask;
 extern struct cpumask __cpu_dying_mask;
+
+#ifdef CONFIG_PREFERRED_CPU
+extern struct cpumask __cpu_preferred_mask;
+#else
+#define __cpu_preferred_mask __cpu_active_mask
+#endif
+
 #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
 #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
 #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
 #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
 #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
+#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
=20
 extern atomic_t __num_online_cpus;
 extern unsigned int __num_possible_cpus;
@@ -1181,6 +1189,12 @@ void init_cpu_possible(const struct cpumask *src);
 #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (a=
ctive))
 #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dyin=
g))
=20
+#ifdef CONFIG_PREFERRED_CPU
+#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred=
_mask, (preferred))
+#else
+#define set_cpu_preferred(cpu, preferred) do { } while (0)
+#endif
+
 void set_cpu_online(unsigned int cpu, bool online);
 void set_cpu_possible(unsigned int cpu, bool possible);
=20
@@ -1275,6 +1289,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return cpumask_test_cpu(cpu, cpu_dying_mask);
 }
=20
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_preferred_mask);
+}
+
 #else
=20
 #define num_online_cpus()	1U
@@ -1313,6 +1332,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return false;
 }
=20
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpu =3D=3D 0;
+}
+
 #endif /* NR_CPUS > 1 */
=20
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 985aea6..edc067a 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -194,3 +194,7 @@ config SCHED_CLASS_EXT
 	  For more information:
 	    Documentation/scheduler/sched-ext.rst
 	    https://github.com/sched-ext/scx
+
+config PREFERRED_CPU
+	bool
+	depends on SMP && PARAVIRT
diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553..376d297 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3103,6 +3103,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
 atomic_t __num_online_cpus __read_mostly;
 EXPORT_SYMBOL(__num_online_cpus);
=20
+#ifdef CONFIG_PREFERRED_CPU
+struct cpumask __cpu_preferred_mask __read_mostly;
+EXPORT_SYMBOL_GPL(__cpu_preferred_mask);
+#endif
+
 void init_cpu_present(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_present_mask, src);
@@ -3160,6 +3165,7 @@ void __init boot_cpu_init(void)
 	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
 	set_cpu_online(cpu, true);
 	set_cpu_active(cpu, true);
+	set_cpu_preferred(cpu, true);
 	set_cpu_present(cpu, true);
 	set_cpu_possible(cpu, true);
=20
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index acc8931..d4edee7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8632,6 +8632,9 @@ int sched_cpu_activate(unsigned int cpu)
 	 */
 	sched_set_rq_online(rq, cpu);
=20
+	/* preferred is subset of active and follows its state */
+	set_cpu_preferred(cpu, true);
+
 	return 0;
 }
=20
@@ -8645,6 +8648,8 @@ int sched_cpu_deactivate(unsigned int cpu)
 	if (ret)
 		return ret;
=20
+	set_cpu_preferred(cpu, false);
+
 	/*
 	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
 	 * load balancing when not active
