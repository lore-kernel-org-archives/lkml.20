Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818245;
	b=iCEcoyTRzobA6GenQ9ohNqv26YvxRIjtAykZYWqoF6iKLmqUeMN8bo8Kmj2kEnXo1pTg
	 +5duMUrtVqeYkEn72+W0czgRhojaiIyfETqtmdTGDCwWWZrnlAITR2FBehZB7UjLOfMJH
	 4FDeyJGUWLQCLw8KhDJQKkHTQ920ILaPOfEWLhl1ENIxiDnhMnRkUhgPNMjcBJ3mL9HxS
	 l9aqm5TE+0vc2HI/IVxdgrGpL2p3DORnqNoN/mqkPpk6sRB2vnqqeE9H/1aQI35c26gQF
	 A74NgfX+CXIr+NYPdPp3t0zN9c4EHMG8/iBevYtAMh7dEknppxkCR9gAldEkNaRxt9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hpz6q9V3RGMLVq0S1modg88nqymvlaOMiM9Nu/j9bU8=;
	b=4a2T2C/iPJN0gSXDtWr7pqAMNpW4gDoBkHjfKaQQvirpPOWkB1us928QwqXfVCWVcCq8
	 whiRi/EAqJoak/hGpXDMzdG5oVtcbvhOZaIFhPiq3XCz9gKUtkhYLOrFDHJI6MufToEEG
	 JrWV59768hd8j1Edh78fsOxhTc5tiBVkOu4JJGYJ8H0p8tUkbuQwnYXW9CE/B+aihmhUo
	 /EfMJXNXTTentqrZQ226QAasZrpq0xHRl6nHJ6Gq3hzvr9FNURCMBO/GmCKD/jOtMyRfX
	 q92u/06IVH9Xq2fFQYKi05PgR8rEIo3YFOQTygVJUT5nnD1GRejR2lfzvGS64OTj2IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SZ5gr8O+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348516082BF4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348516082BF4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SZ5gr8O+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818244; x=1825354244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jqh4GAjuZHvXurWqwsVOxX/o/cXPCWNBhJ0glYD7zSA=;
  b=SZ5gr8O+/RGgUaLjAysQFbSHl0N9orGoCMs2lGQuP1OFjqDxuLp6frRN
   q+Fid25t84SfjAlGpBIoscNTf2xOdt4vL79YlewdXYW9iYiOlkYmYNr3v
   VD2GJYdauA6d1kSBjZ3y+sInC+gFkI7B71UOt/gzp6mdWyxR2w+lxOa1f
   u3VUUDELRD2zy3bRwXmmSFTrlVdqxydQWzoVI7hXFU0k17RoHHntVt/2f
   MStUjuiclFuQAO9iz9GqkkNz3i7mxZFxlZiCTmL5l9kwG9C4dhF5BWYwN
   /361gDdO5cex00fjEL12/QT8o8OAcpjBsP+UXPsfpMg9WWfNIMWdnTldl
   Q==;
X-CSE-ConnectionGUID: iBzSMGcoRR2eWPJphfZKOg==
X-CSE-MsgGUID: +MV2wUPaRwKTzi9PRBB+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485002"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:44 -0800
X-CSE-ConnectionGUID: WJkVBF6PSMWg2fVb5ExEvQ==
X-CSE-MsgGUID: bR2BlVQdThOn+mfN3om4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336739"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:44 -0800
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
Subject: [PATCH v4 1/9] stop_machine: Refactor multi-CPU stop glue code
Date: Wed,  4 Nov 2026 18:23:14 +0000
Message-ID: <20261104182322.578066-2-chang.seok.bae@intel.com>
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

