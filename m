Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7F248893
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113092; cv=none; b=mDW8OKekH/sx3yluPF9XmVmzp8qAWntevv82es2YczcyCMHm8HujG41hv7GvTsLkujnBBwFZtkuwEbP8fA34ms3zk4IZHWB/0zf+0YlzxgMK4huZVpxw2Lw3WO5axDqbbfitP8sa3WnOhwp6ddmDYIXgsZFc0anRSRHJezdmdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113092; c=relaxed/simple;
	bh=blFSD9HXT2hNe75PNjykw1z95zts/JBmC+OpY54dlZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcLlH52Vy9aDmNFAU70bmbrbmgNhc7dJJ3egaXMS3CUPtaCsNXZGVkiinRaBzvGyMK8M2GBqX+SG7cNwPnorvXEi82zIyVFxoZaWPhKiPO0/ivBTAVZYAyicOrGx4WLs7wz0abEKfdCaO/zxbt5ZURTdSYF7iWsCWj0pcxvtGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SD1afjOe; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SD1afjOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FU
	wioYPUUifUOagZ2TpsPc4KhYDlgUCERvpikYJkq0Q=; b=SD1afjOeNX+S9pR1Dv
	K39GqlIsNVQpxEo9oyWcViBTZicueYQkiOULKaXlUCi9HREz8zxoNmILw5nUrgSB
	S6cqY03T9CPBvGDGzaYorTK5Wq9cadtjN1C3vBRfD5o79hd1FQH4ikr1qBplBvBI
	P/3XYdoEKGIsdpz2NruBRRrJc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnr2dbedFqXnZ8AA--.60079S2;
	Fri, 16 Oct 2026 09:09:47 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	rafael.j.wysocki@intel.com,
	jacob.jun.pan@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 1/2] hrtimer: Add cleanup class for on-stack timers
Date: Fri, 16 Oct 2026 10:09:43 +0900
Message-ID: <5f48c32490d19f51035e4209174f9cfe44472c71.1792083743.git.sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792083743.git.sh_def@163.com>
References: <cover.1792083743.git.sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr2dbedFqXnZ8AA--.60079S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrW8Kw1UXrW5Aw45XFW5ZFb_yoW5uryxpF
	WDJas3Jrs8Xry0kF48A3WkAFyUGan3Jr13JrySgr4qyr17K3WjqFW0vF1SyF43ZrZFyw47
	Ja48trn8Ww1rJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zirOz7UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RyE42rReVwYhgAA3S

hrtimer_setup_on_stack() requires callers to destroy the timer before its
backing stack storage goes out of scope, but the setup interface does not
encode the required teardown pairing.

Add an hrtimer_on_stack cleanup class that pairs on-stack setup with
destroy_hrtimer_on_stack(). Document the existing setup API's lifetime
requirement.

The cleanup class provides debug-object teardown, not timer
cancellation. Callers must ensure that no hrtimer operation can still
access the timer before the scope ends; in particular, the timer must
no longer be queued and any running callback must have completed.

Signed-off-by: Hui Su <sh_def@163.com>
---
 include/linux/hrtimer.h | 24 ++++++++++++++++++++++++
 kernel/time/hrtimer.c   |  8 ++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 29072d89e5cb..1877beb81d5c 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_HRTIMER_H
 #define _LINUX_HRTIMER_H
 
+#include <linux/cleanup.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/hrtimer_types.h>
 #include <linux/init.h>
@@ -201,6 +202,29 @@ extern void destroy_hrtimer_on_stack(struct hrtimer *timer);
 static inline void destroy_hrtimer_on_stack(struct hrtimer *timer) { }
 #endif
 
+/*
+ * The cleanup class pairs on-stack setup with debug-object teardown. Callers
+ * using it must not call destroy_hrtimer_on_stack() manually.
+ *
+ * This class provides debug-object teardown, not timer cancellation. Callers
+ * must ensure that no hrtimer operation can still access the timer before
+ * leaving the scope. In particular, the timer must no longer be queued and
+ * any running callback must have completed.
+ *
+ * Callers using hrtimer_setup_on_stack() without this class retain
+ * responsibility for destroying the timer before its backing storage leaves
+ * scope.
+ */
+DEFINE_CLASS(hrtimer_on_stack, struct hrtimer *,
+	     destroy_hrtimer_on_stack(_T),
+	     ({
+		hrtimer_setup_on_stack(timer, function, clock_id, mode);
+		timer;
+	     }),
+	     struct hrtimer *timer,
+	     enum hrtimer_restart (*function)(struct hrtimer *),
+	     clockid_t clock_id, enum hrtimer_mode mode)
+
 /* Basic timer operations: */
 extern void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
 				   u64 range_ns, const enum hrtimer_mode mode);
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index cbf1693c86b3..12e136d5691f 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1975,8 +1975,12 @@ EXPORT_SYMBOL_GPL(hrtimer_setup);
  * @clock_id:	The clock to be used
  * @mode:       The timer mode
  *
- * Similar to hrtimer_setup(), except that this one must be used if struct hrtimer is in stack
- * memory.
+ * Similar to hrtimer_setup(), except that this one must be used if struct
+ * hrtimer is in stack memory.
+ *
+ * Callers that do not use the hrtimer_on_stack cleanup class must call
+ * destroy_hrtimer_on_stack() before the stack storage goes out of scope. The
+ * cleanup class pairs setup and destruction automatically.
  */
 void hrtimer_setup_on_stack(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
-- 
2.55.0

