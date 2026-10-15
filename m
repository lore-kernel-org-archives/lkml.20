Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112533993
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100502; cv=none; b=mj031xgFZp88UevKEnxAk0YMlPrpGHFgJel0KNn9PfMFS79m3f1vkIacI0nYAFJieytbZ/fThMTF42RrrcKyIscegcxY+AKW8N8XyEUhYxyKuSHEE5gDuxpgE8gP0IUN+vLggkTieuppqUAGmzsUqan1Kwnuyn23OBvMDCoV2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100502; c=relaxed/simple;
	bh=jqh4GAjuZHvXurWqwsVOxX/o/cXPCWNBhJ0glYD7zSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg6cY6ypiNfOtg/hofVBqRG8RplaoVLfDkFh5A5z9k7KKHjQJZBjYgPnfSRad+OKaN7n38Xl+cAxRw2aWN5iRjiJCQ6tVApNaaXVcm9f9nlrFaL/H/n6owt77owTDijiqfC+H/avLgdnoB5G6WbNrhpHzSkzuIxNL+X5eP4rdmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMc+xYBQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMc+xYBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100501; x=1823636501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jqh4GAjuZHvXurWqwsVOxX/o/cXPCWNBhJ0glYD7zSA=;
  b=gMc+xYBQxa08qpLzeDUuZXDUgfzhdnnpQKVw+OXye6CoQ87xS6b5TI5y
   ymQkD7Z6g2aTZu6q19BshndJV/ePb3M4ZhKF5/wz7hyVcGoPdw0ow15wd
   F57L5OOufoua/qEW5uvlab/5tmBB/6Cs7aLFZSAZy8NbLbXkCvb4fkarF
   3ew94qxK6Yi66lInmlPHhHeCgZ39cjHyVPvzSi3hlxojU4TTY3Sga7sBw
   Fl6lOCWzj53kyPEHd6rWxGeNgqKH35c+lx6iiQcle/E5tRIcQkdG/4dDq
   jvG8oW4RJKDfadwh2ohDuKRthrYETX8kypdv6fomN29PiWmBZtGssBTCn
   g==;
X-CSE-ConnectionGUID: jYcEnbgTSdqCxgvGEW2yTQ==
X-CSE-MsgGUID: XDmONze+RK+rOFDlJI52WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902114"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:37 -0700
X-CSE-ConnectionGUID: ipnsH4xWQN2AuXTcvEd3Ow==
X-CSE-MsgGUID: 7/oGKf1BT52LSYw8ow9y2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104365"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:38 -0700
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
Subject: [PATCH v3 1/9] stop_machine: Refactor multi-CPU stop glue code
Date: Thu, 15 Oct 2026 21:14:18 +0000
Message-ID: <20261015211426.49114-2-chang.seok.bae@intel.com>
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

stop_machine_cpuslocked() currently configures struct multi_stop_data and
invokes the multi-stop operation. An upcoming stop_machine() variant will
have different configurations but the latter part will be shareable.

Extract the common part into stop_multi_cpus() to highlight each unique
front-end.

No functional change.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 kernel/stop_machine.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44..8dcd5be67b85 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -582,18 +582,8 @@ static int __init cpu_stop_init(void)
 }
 early_initcall(cpu_stop_init);
 
-int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
-			    const struct cpumask *cpus)
+static int stop_multi_cpus(struct multi_stop_data *msdata)
 {
-	struct multi_stop_data msdata = {
-		.fn = fn,
-		.data = data,
-		.num_threads = num_online_cpus(),
-		.active_cpus = cpus,
-	};
-
-	lockdep_assert_cpus_held();
-
 	if (!stop_machine_initialized) {
 		/*
 		 * Handle the case where stop_machine() is called
@@ -603,19 +593,34 @@ int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
 		unsigned long flags;
 		int ret;
 
-		WARN_ON_ONCE(msdata.num_threads != 1);
+		WARN_ON_ONCE(msdata->num_threads != 1);
 
 		local_irq_save(flags);
 		hard_irq_disable();
-		ret = (*fn)(data);
+		ret = msdata->fn(msdata->data);
 		local_irq_restore(flags);
 
 		return ret;
 	}
 
 	/* Set the initial state and stop all online cpus. */
-	set_state(&msdata, MULTI_STOP_PREPARE);
-	return stop_cpus(cpu_online_mask, multi_cpu_stop, &msdata);
+	set_state(msdata, MULTI_STOP_PREPARE);
+	return stop_cpus(cpu_online_mask, multi_cpu_stop, msdata);
+}
+
+int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
+			    const struct cpumask *cpus)
+{
+	struct multi_stop_data msdata = {
+		.fn		= fn,
+		.data		= data,
+		.num_threads	= num_online_cpus(),
+		.active_cpus	= cpus,
+	};
+
+	lockdep_assert_cpus_held();
+
+	return stop_multi_cpus(&msdata);
 }
 
 int stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
-- 
2.53.0

