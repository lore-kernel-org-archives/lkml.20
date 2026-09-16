Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A053FD40
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568852; cv=none; b=HFQtGiNCUo4k9bkBQbYkpHfnqL1eJFfPr3khPQr+S4QhS7CeRyzNL5c3Vs4wjggLDSEHKgAumvARGZ9jjfj5XnuGlEgkWoM/hY733PyEBuJAYtY5n7bN5nmMctnmCjtlyRsrNDGkil/t+yzSCvB0JmkVv6lgr0/4nmEs479YufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568852; c=relaxed/simple;
	bh=Z4jzHhEkvT75dgKmXLBZDSx6Kwuwt1KpudwXMyg5eEM=;
	h=References:To:From:Content-Type:Date:Message-Id:In-Reply-To:Cc:
	 Subject:Mime-Version; b=WjVr2AFQANmKnv67DCg1nPDYpKkgHfrK6xu/N1FCy4sMcrGdDAci7ugfr5GZWuflKV9Zyvbom9+u3qnytY17MPVH5uesmYWJmpmJwbOq8wzoUFf6/b/lLhSeb1LqAk1wcTLW613P3rLr7WYxVWawLLNZGUULdRjeua/pyW/Z7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Nr/9opxA; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Nr/9opxA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789568839; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=E9Oz00dh7xaWWymhv+e2YK9j5EQ5QPEt135OYIOJYtA=;
 b=Nr/9opxAIcMhG1dr0U10DydcrijuIx55l4IY39FCOGNwEaVQL4FwkAlyuJqVQTqq94Wstj
 qe0nKl8hJXnfowXboYOLn7rzjG+F1mns9p2FL+SSR1YxT5Kp2F41SZy0lmK/uEKu31aCoe
 bElLo+brev9Y826lDwG3YaA1mEZz3rBlOTHjyAqvFMk2ZggYukxxWw3e8kuu4wM+XUWEPr
 /VC1Opwex7uIjfxSZtStN59nNT94B6Lt+tKklosNdLsYO9CdA9uwWka8PW3626EQ6zofEB
 aGzaCPmEDJQcRrYffqxgYVJTWIKHi2ABqgK09JKRFkW2mrrOWghqyENOzzHgbw==
References: <20260916142623.359336-1-zhouchuyi@bytedance.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, 
	<catalin.marinas@arm.com>, <will@kernel.org>, <tglx@kernel.org>, 
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, 
	<beata.michalska@arm.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Date: Wed, 16 Sep 2026 22:26:23 +0800
Message-Id: <20260916142623.359336-4-zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26aaaa745+b8fa82+vger.kernel.org+zhouchuyi@bytedance.com>
In-Reply-To: <20260916142623.359336-1-zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 3/3] x86/aperfmperf: Clean up includes after removing IPI sampling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Commit f3eca381bd49 ("x86/aperfmperf: Replace arch_freq_get_on_cpu()")
removed the ad hoc sampling code, including its delays, ktime timestamps,
RCU idle checks, housekeeping checks and remote function calls. The
corresponding includes remain even though the file no longer uses those
interfaces directly.

Remove the obsolete includes and explicitly include the headers for
jiffies, sequence counters and workqueues used by the current code.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/kernel/cpu/aperfmperf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index de6297b1284b..8cf9decea07c 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -7,15 +7,13 @@
  * Author: Len Brown <len.brown@intel.com>
  */
 #include <linux/cpufreq.h>
-#include <linux/delay.h>
-#include <linux/ktime.h>
+#include <linux/jiffies.h>
 #include <linux/math64.h>
 #include <linux/percpu.h>
-#include <linux/rcupdate.h>
-#include <linux/sched/isolation.h>
 #include <linux/sched/topology.h>
-#include <linux/smp.h>
+#include <linux/seqlock.h>
 #include <linux/syscore_ops.h>
+#include <linux/workqueue.h>
 
 #include <asm/cpu.h>
 #include <asm/cpu_device_id.h>
-- 
2.20.1
