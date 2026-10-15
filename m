Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B91E4B1CF4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100514; cv=none; b=RME0mqKHqrsLlh9uwer30pqrncaHI8Zv9Dcrztk34aT/LO73r9Gvb/zn2cHye4DZFz4AhkHcYsHROB1zQs2OEM2LMnrYyVP4HzKyEROmC0uIt5mrDlbonmAKM0EQVeWabpREZrvNNz+9ETvda9KdxqaZ0LydjI1aqp16UuDb7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100514; c=relaxed/simple;
	bh=RAZp1hOPzyF297ANA0pWW8PDGjD25bUIWdwYGxNs/aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqrDyU+9XDN7+eHA+npdqu95sTvk9CSiYm99roGlTHG7iMyT6OSCAIhvQju6canOQcUsPO+rI9JTRDdJ7Qh24+6o82TFio1khHATNGq+cnD2GMxnNBeqC1i1PxwYZl8DrkWreJfrKFxAnbyMc0KQEpOgk5qyR24MxkrNBdTcabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjHkPKu5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjHkPKu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100505; x=1823636505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RAZp1hOPzyF297ANA0pWW8PDGjD25bUIWdwYGxNs/aE=;
  b=cjHkPKu5VIFHjmU+IMwtWeAEiU++BklB7oTBqfVXeVhHGIIMi24uBDmh
   tFkdJRQENMDLN5YlBfcE3/mgcC4U+T2XbG3doyIigpcQ8skytlQQAN49n
   Cc6BZuF8xL818Vskza75eYavERxdOW7euotA1lHCJ6m4mHTaecAQvkCCM
   RD6//ke9CWrVHmwyGFMYig4A82VTZmCvD5H3yJgdFkC/7FZLovsP70RWj
   pCARsVV8jvGIcQNtsqmTkmoDoHm3vhM0AY9Z2z04UF7/3dh4JQBMfOsId
   l3790hOy+aLXGDV3LNtryJcBpyJp60Kth54PFK5T4LniznvoBHjT9TVnR
   A==;
X-CSE-ConnectionGUID: /5zOJersTMqGZFbofuE7jw==
X-CSE-MsgGUID: aiB40JSxTYyf4CROAniWpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902163"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:42 -0700
X-CSE-ConnectionGUID: bolIGW8NTPuUWkCH3dX4iQ==
X-CSE-MsgGUID: IKmoZsxzQVCe1UFMQPV3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104414"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:42 -0700
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
Subject: [PATCH v3 6/9] x86/microcode: Distinguish NMI control path on stop-machine callback
Date: Thu, 15 Oct 2026 21:14:23 +0000
Message-ID: <20261015211426.49114-7-chang.seok.bae@intel.com>
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

load_cpus_stopped() currently centralizes the stop_machine() callback for
both NMI and NMI-less rendezvous. microcode_update_handler() alone is
enough for the latter.

While the NMI-based rendezvous finally reaches the same update handler,
it requires additional logic to trigger and process NMIs. That machinery
will be replaced by stop-machine facility.

As preparation for that conversion, split the callback path to make
NMI-specific steps explicit and clear. Rename the function to align with
the change.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/core.c | 30 ++++++++++++----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 0dd0c7241c57..9c006cc90047 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -531,7 +531,7 @@ void noinstr microcode_offline_nmi_handler(void)
 	wait_for_ctrl();
 }
 
-static noinstr bool microcode_update_handler(void)
+static noinstr int microcode_update_handler(void *unused)
 {
 	unsigned int cpu = raw_smp_processor_id();
 
@@ -547,7 +547,7 @@ static noinstr bool microcode_update_handler(void)
 	touch_nmi_watchdog();
 	instrumentation_end();
 
-	return true;
+	return 0;
 }
 
 /*
@@ -568,19 +568,15 @@ bool noinstr microcode_nmi_handler(void)
 		return false;
 
 	raw_cpu_write(ucode_ctrl.nmi_enabled, false);
-	return microcode_update_handler();
+	return microcode_update_handler(NULL) == 0;
 }
 
-static int load_cpus_stopped(void *unused)
+static int stop_cpu_in_nmi(void *unused)
 {
-	if (microcode_ops->use_nmi) {
-		/* Enable the NMI handler and raise NMI */
-		this_cpu_write(ucode_ctrl.nmi_enabled, true);
-		apic->send_IPI(smp_processor_id(), NMI_VECTOR);
-	} else {
-		/* Just invoke the handler directly */
-		microcode_update_handler();
-	}
+	/* Enable the NMI handler and raise NMI */
+	this_cpu_write(ucode_ctrl.nmi_enabled, true);
+	apic->send_IPI(smp_processor_id(), NMI_VECTOR);
+
 	return 0;
 }
 
@@ -617,13 +613,13 @@ static int load_late_stop_cpus(bool is_safe)
 	 */
 	store_cpu_caps(&prev_info);
 
-	if (microcode_ops->use_nmi)
+	if (microcode_ops->use_nmi) {
 		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
-
-	stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
-
-	if (microcode_ops->use_nmi)
+		stop_machine_cpuslocked(stop_cpu_in_nmi, NULL, cpu_online_mask);
 		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
+	} else {
+		stop_machine_cpuslocked(microcode_update_handler, NULL, cpu_online_mask);
+	}
 
 	/* Analyze the results */
 	for_each_cpu_and(cpu, cpu_present_mask, &cpus_booted_once_mask) {
-- 
2.53.0

