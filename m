Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C883CF1E5;
	Wed, 14 Oct 2026 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971604; cv=none; b=r+cP2CxiuoIWnTogwKCi8EMKXoMlX/qx6Bk8/Leev0/j+HH0L0gd7I2xtt4DvMggZ+YGg7oUajZAl/SMguneDUP2SBdxMfFFOAcmNih0rIiQCkVd7c6rSqNnsvfhrIhut3U7WLL0eN31Ec7k4MNBmT0MIXFzcNdyBwfiMyvvRBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971604; c=relaxed/simple;
	bh=biPtmC0wOFMGfWl9M/PsEX6DOpe2VvgmQEmZJgJUhrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMCFkZcGEAdRRJwDWAGKcafQF4C6ctNv6zhyoGAPBgu1Kulqfhh4OrKONl8Xs3t3SfbLCdUiX8OhQfXXZ8ZIA7F98UfMrIEdwBjk9xPKay5kgyC85KOIB8WrArqoMPBelRQzLV1g9GLJGinaqObsBspO2sbrsUWzjN4dd64bSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j/iRy6Hg; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j/iRy6Hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nj
	il1zqbwsx3R7+HXKM6YsB1392h9RcOPNgYxsO1yKc=; b=j/iRy6HgRoWPCvfRRV
	g0u3x5Y4FnZbesFrH3r7CNz1szgPhvuZx2bVI8ots++53TKgNpTRGkreDrO3satZ
	QWzMSmxfLV14iIwULyHks3N5uBrt5qmvOKEFPGr8BpeX6+Tor8PpgN1rbqVytH9c
	glC1f/KUaPkVik5/OJmFMDBng=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAnTvTnUM9q6kpbEQ--.10126S2;
	Wed, 14 Oct 2026 17:52:40 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: elver@google.com,
	dvyukov@google.com
Cc: kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] kcsan: add targeted watchpoint matching
Date: Wed, 14 Oct 2026 18:52:35 +0900
Message-ID: <20261014095238.2132580-2-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnTvTnUM9q6kpbEQ--.10126S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw15XF4fCry5tFWxJr4xZwb_yoW5ZFyDpF
	yDKryrJ398XFWavF43A3WDZr1rGw1kGry7tFWxC39293W5Kr9ag34kWr9rtF4jgrZF9F15
	GFZ8ArZ5CrWUJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb8n5UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QjcPGrPUOjT4QAA3u

Add target state and a static key to KCSAN. When a target is set, only
non-atomic instrumented accesses containing that address are eligible for
watchpoint setup. Other accesses do not consume the skip interval. Keep
report filtering independent from target matching.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/kcsan/core.c  | 37 +++++++++++++++++++++++++++++++++++++
 kernel/kcsan/kcsan.h | 10 ++++++++++
 2 files changed, 47 insertions(+)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 2db82661cd60..2a58a3a53adb 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -12,10 +12,12 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/minmax.h>
 #include <linux/moduleparam.h>
+#include <linux/mutex.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/sched.h>
@@ -108,9 +110,40 @@ static atomic_long_t watchpoints[CONFIG_KCSAN_NUM_WATCHPOINTS + NUM_SLOTS-1];
  */
 static DEFINE_PER_CPU(long, kcsan_skip);
 
+static DEFINE_STATIC_KEY_FALSE(kcsan_target_key);
+static DEFINE_MUTEX(kcsan_target_lock);
+static unsigned long kcsan_target_addr;
+
 /* For kcsan_prandom_u32_max(). */
 static DEFINE_PER_CPU(u32, kcsan_rand_state);
 
+void kcsan_target_set(unsigned long addr)
+{
+	unsigned long old;
+
+	mutex_lock(&kcsan_target_lock);
+	old = READ_ONCE(kcsan_target_addr);
+
+	if (!old && addr) {
+		/* Publish the address before enabling the fast-path branch. */
+		WRITE_ONCE(kcsan_target_addr, addr);
+		static_branch_enable(&kcsan_target_key);
+	} else if (old && !addr) {
+		/* Disable the fast-path branch before invalidating the target. */
+		static_branch_disable(&kcsan_target_key);
+		WRITE_ONCE(kcsan_target_addr, 0);
+	} else if (old && addr) {
+		WRITE_ONCE(kcsan_target_addr, addr);
+	}
+
+	mutex_unlock(&kcsan_target_lock);
+}
+
+unsigned long kcsan_target_get(void)
+{
+	return READ_ONCE(kcsan_target_addr);
+}
+
 static __always_inline atomic_long_t *find_watchpoint(unsigned long addr,
 						      size_t size,
 						      bool expect_write,
@@ -277,6 +310,10 @@ should_watch(struct kcsan_ctx *ctx, const volatile void *ptr, size_t size, int t
 	if (is_atomic(ctx, ptr, size, type))
 		return false;
 
+	if (static_branch_unlikely(&kcsan_target_key))
+		return kcsan_target_matches(READ_ONCE(kcsan_target_addr),
+					    (unsigned long)ptr, size);
+
 	if (this_cpu_dec_return(kcsan_skip) >= 0)
 		return false;
 
diff --git a/kernel/kcsan/kcsan.h b/kernel/kcsan/kcsan.h
index ae33c2a7f07e..2a36813c3a76 100644
--- a/kernel/kcsan/kcsan.h
+++ b/kernel/kcsan/kcsan.h
@@ -25,6 +25,16 @@ extern unsigned int kcsan_udelay_interrupt;
  */
 extern bool kcsan_enabled;
 
+void kcsan_target_set(unsigned long addr);
+unsigned long kcsan_target_get(void);
+
+static __always_inline bool
+kcsan_target_matches(unsigned long target, unsigned long addr,
+		     size_t size)
+{
+	return size && target >= addr && target - addr < size;
+}
+
 /*
  * Save/restore IRQ flags state trace dirtied by KCSAN.
  */
-- 
2.55.0

