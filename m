Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818255;
	b=nq5JbWjhyvO72pA8DjMcjitzQr05RbeKq74czOXlUN/kU1rbvDXS+2JSQmZD8B17rkLs
	 sd9SrTMVeh11Elc6ofuCJEODFBKT6MnsbTyOvCO+MdVEzZZaHG5AghrajDwuS5kFgNB1N
	 bYWOH171NfkQJIaUBum2vTzAhp/JUz70TC5rekLy88nH0WvwqmZWplpUkCKVDVkVm/gBo
	 01r02IwpJTf0Z1Q/JcTUMFZPjke3fSY9n5sEQ66fHSL/TZ/qcdpkRe6pbR4VDeZr7GMqu
	 uOea+AOVmyGRJG+xYqB60buG2acDZxdwDuQ2qsjvePyIRC7HZzPAgRK065dKevDL3vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818255;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2op15++Hsgw3Q/zh07TmvP/aOpA26M9cijC0GLwzCS8=;
	b=BQhc/B+Bw86JfRPVwENO7zTfKahWGaVM2lp+sFHUnxvWIUCiK6t9n0aAtOFsaDvvwaa7
	 tkgKJ1tAXXxgaOOvxa8jS7quEYVfrsA8mfu1Y8tSkWi9bSgpUtYtfiQU38zjOL4FfkDbv
	 a7snw1QC1HDl1uNWfcUA6dECJlnMir1aGs2fr/ZAqYSxTFE2H6yljldF+rPzx08ODl0zn
	 WikCcbpg6LJXlBqmWPMPdituBrNkpTPFY9ei53nC8K+Dswypj+b0ESfrZ7DN7JoEbatKs
	 3hWja4Sc7/F4qhAEsN1z8nPIxQVB4ViTPZqiYPzjkHCBjETqLr9wh9otyY+GDYjQxnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OgXhTOO8;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824F6083620
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1824F6083620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OgXhTOO8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818254; x=1825354254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LoKVluqQ41GY7+Dy62KbGR5ZRqIgYbzzxCMALHssdtM=;
  b=OgXhTOO8BBw8ctBoWyjU1fzlHVFdLTxmleyeiM41VwyHhP/pQJ0jXig/
   xGUtwYTUTUZbf2PM/SseqYkaLwjANNMJMOERNuINs0fBvE5MeGHwMIyxe
   4NRjSEYUAcmQh655+3IBBfVgX5ere8FMtgnWrkCCL/1E4Q+nef26KEqBv
   SSPnq0JsG0b7pT9ss5o/aDTtcSQ4W1C9Oa4HfMcjlfgPGj1ZskDUVkJou
   CfEPNGBp8ddw9kjef7GEOMGQt9Vw0yqeFOFDA0Toym1Ip9cH77fnGw9P+
   0+jDvV6BDb+uyz7PTOqSKokm55YP3D5AIyYjZ++M+e6wcUpW9s/cFAAFY
   Q==;
X-CSE-ConnectionGUID: 4zTtOBxgQCGiKok6fTaL9w==
X-CSE-MsgGUID: 5Q+PY3nNQ0mH7QuMchGRrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485066"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:53 -0800
X-CSE-ConnectionGUID: U0yHItWNRx++L17iqf97Ag==
X-CSE-MsgGUID: UN6wm9OwRTeDKX8g/KvYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336817"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:53 -0800
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
Subject: [PATCH v4 6/9] x86/microcode: Distinguish NMI control path on stop-machine callback
Date: Wed,  4 Nov 2026 18:23:19 +0000
Message-ID: <20261104182322.578066-7-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104182322.578066-1-chang.seok.bae@intel.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
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

load_cpus_stopped() currently centralizes the stop_machine() callback for
both NMI and NMI-less rendezvous. microcode_update_handler() alone is
enough for the latter.

While the NMI-based rendezvous finally reaches the same update handler,
it requires additional logic to trigger and process NMIs. That machinery
will be replaced by stop-machine facility.

As preparation for that conversion, split the callback path to make
NMI-specific steps explicit and clear.

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

