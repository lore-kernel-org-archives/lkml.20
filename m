Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E245FFAA;
	Mon, 28 Sep 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578895; cv=none; b=E+noNXD7ailo9KFuOAApIusfg63sCTou3R4WMAk72vaJidTFMlAh8NnFtCcehIH5KDY5Yea3CPFB0IUWXN4AtU4hhEBzKfldnifbAcBPcC8a2XlroP4Cf/rAC8t4vEl49nqXpUZUNQ4k7EnEl3MG4v+QewK/STgtMYyQcrhZekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578895; c=relaxed/simple;
	bh=Tjwbx1n21ZCSWAdW/i6bi3Xs8KRqXD2PPsM4CENfhKg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cTxpEgbDdxxDE12gLQR4Dj0sHOcCoJvrt554t+OCAYnEJ55eOIoXLHOLMnteZcAu4BoomyDJxsjb3RcGik9gvC1sBH55y5hswACE/ifORbOOqyXUT0m3gMvAGHJogquAQLiTP9mRIKEtb3cjdz69F5huU91VR0kwDn5hxu4fKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4j7jCFwK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=liiLa/m3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4j7jCFwK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="liiLa/m3"
Date: Mon, 28 Sep 2026 07:01:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578891;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3j1tkGJjeUXCd5P2QI+RNZN08dZ6kOLRcGVZC3oMPDA=;
	b=4j7jCFwKG9kXpc0OyDnFl9stibpOndUzDeEzlvCI2h9Tc7GkdLBBVvoCtgndEKQGW3VVu9
	sEA5kJRDnWgfnz5/RmeSVWNB6q4NcdGFnpQJHTDsqaka2xd2BohtFZUnqcI+z3z82AFeY2
	2mq4GGjBg4VzLFdMQrczL7dmPmft3S3+ISB4BwsrTaFYjokmfgEdv2kst1LOJA7CwFgJkl
	Mbu2OEWuvJCsNiPyc9HLJXJPAJ8ijaLoPFPv67V+f6ApgfjmzAQUnic1cPpEMVRt+Q8doL
	oSM9qVJD4aec/s/ZhJGzL978KvgFUmzsx7QMjHAuqzSd0+A2OYFpIyFRYKfxTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578891;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3j1tkGJjeUXCd5P2QI+RNZN08dZ6kOLRcGVZC3oMPDA=;
	b=liiLa/m3i0u1r/7DIwDvq6eOYZVYPJeMFIiT6NrTq897bZ1Ul0+pVa52NquROM7s4zhe2u
	0Kar7OLFCEvC+uBw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/docs: Document cpu_preferred_mask and
 Preferred CPU concept
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-4-sshegde@linux.ibm.com>
References: <20260928053728.797539-4-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888953.3910103.11536572049295317167.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     06a49ef784acf91cee78d50c5307d400f86ccafb
Gitweb:        https://git.kernel.org/tip/06a49ef784acf91cee78d50c5307d400f86=
ccafb
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:18 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:40 +02:00

sched/docs: Document cpu_preferred_mask and Preferred CPU concept

Add documentation for new CPU state called preferred CPU state and
corresponding cpumask called cpu_preferred_mask.
This could help users in understanding what it is and how to use it.

Document the role of scheduler and driver for this feature to work.
Details regarding the driver documentation will be added in
later patches under Documentation/driver-api/steal-governor.rst.

Newly added file could be used for other paravirt usecase documentation.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-4-sshegde@linux.ibm.com
---
 Documentation/scheduler/index.rst          |  1 +-
 Documentation/scheduler/sched-paravirt.rst | 67 +++++++++++++++++++++-
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/scheduler/sched-paravirt.rst

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/inde=
x.rst
index 17ce8d7..a43647b 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -23,5 +23,6 @@ Scheduler
     sched-stats
     sched-ext
     sched-debug
+    sched-paravirt
=20
     text_files
diff --git a/Documentation/scheduler/sched-paravirt.rst b/Documentation/sched=
uler/sched-paravirt.rst
new file mode 100644
index 0000000..311cdbf
--- /dev/null
+++ b/Documentation/scheduler/sched-paravirt.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _sched-paravirt:
+
+Preferred CPUs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+In paravirtualized environments CPU overcommit is a common scenario.
+i.e. the sum of virtual CPUs (vCPUs) of all VMs is greater than number of
+physical CPUs (pCPUs). Under such conditions when all or many VMs have
+high utilization, hypervisor won't be able to satisfy the CPU requirement
+and has to context switch within or across VMs. The hypervisor needs to
+preempt one vCPU to run another. This is called vCPU preemption.
+This is more expensive compared to task context switch within a vCPU, since
+hypervisor lacks vCPU context and could preempt a critical section which
+slows forward progress.
+
+In such cases it is better that combined vCPU demand from all VMs is reduced
+by not using some of the vCPUs in each VM. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called
+"Preferred CPUs".
+
+One of the main design constructs is that preferred CPUs are always
+a subset of active CPUs. In most cases preferred CPUs will be same as
+active CPUs. When there is pCPU contention, Preferred CPUs will reduce
+based on the steal time. When the pCPU contention goes away as indicated
+by steal time, Preferred CPUs could become same as active CPUs again.
+The policy decisions are to be taken by driver.
+For example, steal_governor. Look at its documentation for more
+details. (``drivers/virt/steal_governor.c``)
+
+Scheduling decisions such as wakeup, pushing the task etc, need this
+CPU state info. This is maintained in ``cpu_preferred_mask``.
+vCPUs which are not in ``cpu_preferred_mask`` should be treated as vCPUs whi=
ch
+should not be used at this moment provided it doesn't break user affinity.
+
+This is achieved by:
+
+1. Selecting a preferred CPU at wakeup using fallback mechanism.
+2. Pushing the task away from non-preferred CPU at tick.
+3. Selecting only preferred CPUs for load balance.
+
+``/sys/devices/system/cpu/preferred`` prints the current ``cpu_preferred_mas=
k``
+in cpulist format.
+
+Notes:
+
+1. This feature is available under ``CONFIG_PREFERRED_CPU``. Driver which
+   makes decisions should enable it. For example, steal_governor driver
+   (``CONFIG_STEAL_GOVERNOR``). On enabling the driver, CPU preferred state
+   can change based on steal time. Without the driver, preferred CPUs is
+   same as active CPUs.
+
+2. This feature works for the FAIR class only.
+
+3. A pinned task, which can't be moved to preferred CPUs will continue
+   to run based on its affinity. But no load balancing happens if it is affi=
ned
+   only on non-preferred CPUs.
+
+4. Decision to change the preferred CPU state is driven by the kernel.
+   Hence it shouldn't break user affinities. One of the main reasons why
+   CPU hotplug or Isolated cpuset partitions was not a solution.
+
+5. This feature works best only when all the Guest VMs enable the feature as
+   it is a co-operative scheme. If a specific VM doesn't enable this feature
+   it may end up with more CPUs than others, still should lead to better
+   performance when seen from system view.
+   Users who enable this driver must ensure it is enabled in all Guest VMs.
