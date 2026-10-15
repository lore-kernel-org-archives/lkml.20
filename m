Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D249CF58
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100504; cv=none; b=csZ6xKl09XhzeB67g9Nl2+UvmJCxaYE9hgu29MLQz+kgswSYI/Hnxe3UUlDR3xLhygdNl0ALD4HP0McMAoGj+FSNXOItI7uGPc8LMzDzGDyRLA6UpFhMBPQKfjx74uJolCFo8pCD9sDYPqbWpfO/22wtqxbH47gZTnXA3phqyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100504; c=relaxed/simple;
	bh=PSGXJC5/woVBkh5vkJXT5CswFTU+mjBFwBoxPF747sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMtea3LH8EGhZNSopvmCqzp9tdNoB+xUeSvkPjALKfNwwk8QDXujODSCKYpOg8lutOe06pwJl9SXdKsKXDCCTGaGXnmeKW/BEJlNFeIlYUoaA7UHwqIK6xHeVtvWhMoJcVHa1m+FsiVNJEOdAkLUCPrqtn8nDX3iEPYhDDFeGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EntIpe7u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EntIpe7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100502; x=1823636502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PSGXJC5/woVBkh5vkJXT5CswFTU+mjBFwBoxPF747sc=;
  b=EntIpe7u/qesm6b0yu31R3wM8ShxfTPDcdfailtW/3vZ7IySzxmgwifd
   Wlgle6hc344n/wcrw67wDxb015hC91q3QzsLsJy90eRyqbe+ggVJPuM8r
   LeOcVtZ9fz5oz3toipXqhEOeaVF0xe1cs+0H9xG1ryUzRBo0yMotUp2aB
   ZOt1cB7TiVmbz5OOWDLgDu2kLL155+AuRFRD5K0kgwHa2MrSuyGljKhxr
   Ug7ZzoK+ISz6Si30dYtEjpjL8qg9zDxZbzHZu1I0WS6zpj/2FjU6Q3dWy
   NUThZ6XxlbZMSKttPc9iyuC4tBYlJ/mVZ6WCV9lBaKFyAA3E6YWkuJoqb
   Q==;
X-CSE-ConnectionGUID: CV8HCLnGQ8ynXwcm9QXhiQ==
X-CSE-MsgGUID: 7AVCo6NpSGKINjJC0gktWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902134"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902134"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:39 -0700
X-CSE-ConnectionGUID: WyI1IzI8Q4qwRu55Qj3B9w==
X-CSE-MsgGUID: 8zX2zZ2HSQCQntMxuZjLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104374"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:40 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 3/9] stop_machine: Introduce stop_machine_nmi_cpuslocked()
Date: Thu, 15 Oct 2026 21:14:20 +0000
Message-ID: <20261015211426.49114-4-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015211426.49114-1-chang.seok.bae@intel.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the NMI control logic in place, introduce an API to run the target
function from NMI context.

Originally-by: David Kaplan <david.kaplan@amd.com>
Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://lore.kernel.org/lkml/20260202105411.GVaYCCUygtEUNrMUtG@fat_crate.local
---
V2 -> V3: Address Sashiko review
* Ensure runtime only via `stop_machine_initialized`
* Ensure target CPUs online
* Add a fallback prototype
* Adjust function description (to align with mainline changes)
---
 include/linux/stop_machine.h | 27 +++++++++++++++++++++
 kernel/stop_machine.c        | 46 ++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index b53b028296e0..b05e65f4bb6d 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -198,8 +198,35 @@ stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
 void arch_send_self_nmi(void);
 bool noinstr stop_machine_nmi_handler(void);
 
+/**
+ * stop_machine_nmi_cpuslocked() - Freeze CPUs and run a function in NMI context
+ *
+ * @nmisafe_fn:	The function to run
+ * @data:	The data pointer for @nmisafe_fn()
+ * @cpus:	The CPUs to run @nmisafe_fn() on (NULL = one unspecified online CPU)
+ *
+ * Description: This stop_machine() variant runs @nmisafe_fn() from NMI context
+ * to prevent preemption by other NMIs. The callback must be built with noinstr.
+ * Other than that, the semantics match stop_machine_cpuslocked().
+ *
+ * Context: Must be called from within a cpus_read_lock() protected region.
+ * Avoid nested calls to cpus_read_lock().
+ *
+ * Return: 0 if all invocations of @nmisafe_fn return zero, -ENOMEM if cpumask
+ * allocation fails, -EINVAL if not initialized yet or any target CPU failed to
+ * receive NMI. Otherwise, the value returned by an arbitrarily chosen member of
+ * the set of calls to @nmisafe_fn that returned non-zero.
+ */
+int stop_machine_nmi_cpuslocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data,
+				const struct cpumask *cpus);
+
 #else
 static inline bool stop_machine_nmi_handler(void) { return false; }
+static inline int
+stop_machine_nmi_cpulocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data, conststruct cpumask *cpus)
+{
+	return 0;
+}
 #endif /* CONFIG_STOP_MACHINE_NMI */
 
 #endif	/* _LINUX_STOP_MACHINE */
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index ad01b7c5266c..2f3fe13cd3aa 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -802,6 +802,52 @@ static int multi_stop_run(struct multi_stop_data *msdata)
 	return msdata->use_nmi ? nmi_stop_run(msdata) : msdata->fn(msdata->data);
 }
 
+int stop_machine_nmi_cpuslocked(cpu_stop_nmisafe_fn_t nmisafe_fn, void *data,
+				const struct cpumask *cpus)
+{
+	struct multi_stop_data msdata = {
+		.nmisafe_fn	= nmisafe_fn,
+		.data		= data,
+		.num_threads	= num_online_cpus(),
+		.active_cpus	= cpus,
+		.use_nmi	= true,
+	};
+	int ret;
+
+	if (!stop_machine_initialized)
+		return -EINVAL;
+
+	if (!zalloc_cpumask_var(&msdata.nmi_cpus, GFP_KERNEL))
+		return -ENOMEM;
+
+	/*
+	 * NMI CPUs should be exactly those 'active' CPUs executing the
+	 * stop function. Follow the selection logic in multi_cpu_stop()
+	 * if not provided.
+	 */
+	if (!msdata.active_cpus)
+		cpumask_set_cpu(cpumask_first(cpu_online_mask), msdata.nmi_cpus);
+	else
+		cpumask_and(msdata.nmi_cpus, msdata.active_cpus, cpu_online_mask);
+
+	lockdep_assert_cpus_held();
+
+	ret = stop_multi_cpus(&msdata);
+
+	/*
+	 * The NMI handler clears each CPU bit. If any of those NMIs were
+	 * ever missed out, return error clearly.
+	 */
+	if (!cpumask_empty(msdata.nmi_cpus)) {
+		pr_err("CPUs %*pbl didn't run the stop_machine NMI handler.\n",
+		       cpumask_pr_args(msdata.nmi_cpus));
+		ret = -EINVAL;
+	}
+
+	free_cpumask_var(msdata.nmi_cpus);
+	return ret;
+}
+
 #else
 
 static int multi_stop_run(struct multi_stop_data *msdata)
-- 
2.53.0

