Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F4E2F7EE8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967041; cv=none; b=DJveMrK+rKwN36I2tJT7fag0SitmXQL9prKw5eG5sipw3xHoiUXYxNwytG3kFkE7gvYcmDtGiA0sfcheHg/eFgIOjwGMhq2cpelxg0pldm4XP4SG45uE+kgdV4zjgjcAH0Xwt4uNyPuLIlu7DQwVpiT8kNEDTA8Sh9t1nX8pOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967041; c=relaxed/simple;
	bh=0rKL/sntDWjhjNag3YhT5JgZlGagP+D5gz7cHsvcXq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCSsgiyKSfNxcOXkTQHiwDkVUloLYJmUCXvadq9iar3fOMOerChjUtlbhcmLBgJwHZkRC24wWy7+8jX4r3QRqlXrJtDJrf1CW1XTpDxoIF6SgL3vCS75CH/w3DBMSagiCJg29pnqC0GtgyZds0WL5a1fkraxxnwMDHuvSA+JEUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oFZtMjZz; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oFZtMjZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=yMh2mWXeWvA8NfyONSqN0Rmq/409N/eVHMWQHvqQi+c=;
	b=oFZtMjZzdrJr2/JHikUy911wxW8jdzyfBUqySExqOmaQ3gEP1f7M18DBDlF5dJ
	K9dmukiBPexXJVtWteJ/WCjxOuvzpGqJyN2ZiVkgBN9OO7yec9ZU+V66tsc8dSmo
	q8oGF1PyyxCQc2Ju3+GTvOGqUhM2HaQhCBKG3b+trg2IU=
Received: from LAPTOP-EGO65D59.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBXZHmMurBqntMWCA--.22003S2;
	Mon, 21 Sep 2026 13:03:14 +0800 (CST)
From: =?UTF-8?q?=E6=9E=97=E6=BF=AC=E5=93=B2?= <m18667909625@163.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	m18667909625@163.com
Subject: [PATCH] printk: fold consecutive duplicate messages
Date: Mon, 21 Sep 2026 13:03:04 +0800
Message-ID: <20260921050304.73440-1-m18667909625@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXZHmMurBqntMWCA--.22003S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4rtr4fJryDWF1UXFyfCrg_yoWrZF1xpF
	s3WF43CF4kAr1xZ3yfXa1jvr1S93W8Cry7tF90kFWUAa13tr45Zwn2qr1YvF1UWryxCry3
	JFnxXryqkr42v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRQJ5bUUUUU=
X-CM-SenderInfo: bpryllixzqmlisv6il2tof0z/xtbC4hKZn2qwupLvygAA3h

A kernel bug can flood the console with thousands of copies of the
same message, drowning out everything else. Fold consecutive
duplicates into a single "last message repeated N times" summary,
flushed when 10 repeats accumulate or a 1s window elapses.

The dedup key is built from facility, level and the format string
address; format parameters are not part of the key since va_list can
only be consumed once and hashing rendered text would put string
comparisons on the printk fast path.

Messages at LOGLEVEL_ERR and above are never folded, and dedup is
skipped after suppress_printk / panic take effect since the call site
sits behind those checks. The dedup state is protected by a raw
spinlock, and the summary is printed only after dropping the lock to
avoid recursive self-deadlock.

Disable with printk_dedup=0 on the kernel command line or via the
printk_dedup module parameter.

Known limitation: dedup_lock is not NMI safe; a message from NMI
context while another CPU holds the lock will spin.

Signed-off-by: 林濬哲 <m18667909625@163.com>
Assisted-by: AI coding assistant (disclosed per kernel AI guidelines)
---
 kernel/printk/printk.c | 89 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6d3d18a50da7..0c93767d041f 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -20,6 +20,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
+#include <linux/hash.h>
 #include <linux/mm.h>
 #include <linux/tty.h>
 #include <linux/tty_driver.h>
@@ -104,6 +105,91 @@ DEFINE_STATIC_SRCU(console_srcu);
  */
 int __read_mostly suppress_printk;
 
+static u32 dedup_last_key;
+static u32 dedup_repeat;
+static bool dedup_active;
+static u64 dedup_window_start;
+#define PRINTK_DEDUP_WINDOW_NS	1000000000ULL	/* 1s */
+static bool printk_dedup = true;
+module_param(printk_dedup, bool, 0644);
+MODULE_PARM_DESC(printk_dedup, "fold consecutive duplicate printk messages");
+/* protects the dedup state above; never held while printing */
+static DEFINE_RAW_SPINLOCK(dedup_lock);
+
+static int __init printk_dedup_setup(char *str)
+{
+	return kstrtobool(str, &printk_dedup);
+}
+early_param("printk_dedup", printk_dedup_setup);
+
+/*
+ * Detect consecutive duplicate printk messages and fold them away.
+ * Returns true if this message should be dropped.
+ *
+ * The dedup key is built from facility, level and the format string.
+ * Format parameters are intentionally not part of the key: va_list
+ * can only be consumed once, and hashing rendered text would put
+ * string comparisons on the printk fast path.
+ */
+static bool outputs_dedupe(int facility, int level, const char *fmt)
+{
+	unsigned long flags;
+	bool drop;
+	u64 now;
+	u32 key;
+	u32 n;
+
+	/* error and above must never be folded */
+	if (level <= LOGLEVEL_ERR || !printk_dedup)
+		return false;
+
+	key = hash_64((unsigned long)(fmt ? : ""), 32) ^
+	      hash_32(facility ^ level, 32);
+	now = ktime_get_ns();
+
+	raw_spin_lock_irqsave(&dedup_lock, flags);
+
+	if (dedup_active && key == dedup_last_key) {
+		dedup_repeat++;
+		/*
+		 * Force a flush when 10 repeats have accumulated or
+		 * the 1s window has elapsed, so the summary shows up.
+		 */
+		if (dedup_repeat >= 10 ||
+		    now - dedup_window_start > PRINTK_DEDUP_WINDOW_NS) {
+			n = dedup_repeat;
+			dedup_repeat = 0;
+			dedup_window_start = now;
+			drop = false;
+		} else {
+			drop = true;
+		}
+	} else {
+		if (dedup_active && dedup_repeat) {
+			n = dedup_repeat;
+			drop = false;
+		} else {
+			n = 0;
+			drop = false;
+		}
+		dedup_last_key = key;
+		dedup_repeat = 0;
+		dedup_window_start = now;
+		dedup_active = true;
+	}
+
+	raw_spin_unlock_irqrestore(&dedup_lock, flags);
+
+	/*
+	 * Print only after dropping the lock: pr_info() re-enters
+	 * vprintk_emit() and would deadlock on dedup_lock otherwise.
+	 */
+	if (n)
+		pr_info("last message repeated %u times\n", n);
+
+	return drop;
+}
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map console_lock_dep_map = {
 	.name = "console_lock"
@@ -2441,6 +2527,9 @@ asmlinkage int vprintk_emit(int facility, int level,
 	    !panic_triggering_all_cpu_backtrace)
 		return 0;
 
+	if (outputs_dedupe(facility, level, fmt))
+		return 0;
+
 	printk_get_console_flush_type(&ft);
 
 	/* If called from the scheduler, we can not call up(). */
-- 
2.53.0

