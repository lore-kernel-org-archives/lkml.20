Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAF1437467
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344206; cv=none; b=T1E5hltNzmB8ecO9sDjfk8fX5ZD51FebZi5S6fcVKItjmL56hN9crn4yWXeU3bsedmJ2Bd814Y9kBEDWQ5Pfju/B/X86tIGg5WuYmBCuWhbNinkafL+2hM+gdUByb5PFW/QeMEFIzcg6r8Q9/AW8x7s6to0qX75xaX13o0V122I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344206; c=relaxed/simple;
	bh=fFPGFWI402zKV2/sKWo875KorlNQL9YoQRPKk7KcXk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rbBTIOkEIeDutQMxQfWPyLlx59+fWykfXwvxnICCbGyjWgStyniyav1iVEGHL9RvVmbzM/73oU9hq/CBvlhooINg5dQnObsj0Svzg0XBoTcVe1f/nhbN6n+LnVvMstmbyiJqzTYq5adBqabPp2Mrb1hbSZn0P/xXdoCTe+BE5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WqX946np; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WqX946np"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E776C165C;
	Wed,  2 Sep 2026 03:16:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0B0B3F882;
	Wed,  2 Sep 2026 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788344204; bh=fFPGFWI402zKV2/sKWo875KorlNQL9YoQRPKk7KcXk4=;
	h=From:To:Cc:Subject:Date:From;
	b=WqX946np0NusNKATxBg446tNVXONDI79hj6bYydosZzUyqKN7pjc6Z7TNeApdtWFo
	 X1XoXsIntzUPW7JMG8joYhxdlprBHVhYeeu8ktrozk6taUDnD/WA/At3MYxPVVMOUu
	 tZElLyTuPXYnmUkCaqg8KIByKSPr3o1ZGPoYlj24=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Cc: mark.rutland@arm.com,
	meted@linux.ibm.com,
	ruanjinjie@huawei.com,
	sshegde@linux.ibm.com
Subject: [PATCH] sched: dynamic: Fix preemption model strings
Date: Wed,  2 Sep 2026 11:16:37 +0100
Message-Id: <20260902101637.232129-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We recently removed the enum values 'preempt_dynamic_none' and
'preempt_dynamic_voluntary', but forgot to update preempt_modes[]
accordingly. Due to this, preempt_model_str() and sched_dynamic_show()
produce incorrect output, with the wrong preemption model string in
backtraces, and empty output for /sys/kernel/debug/sched/preempt.

Update preempt_modes[] to account for the removed enum values. Given
that CONFIG_PREEMPT_DYNAMIC now depends on CONFIG_ARCH_HAS_PREEMPT_LAZY,
and given that only 'preempt_dynamic_full' and 'preempt_dynamic_lazy'
remain, sched_dynamic_show() no longer needs to skip any model strings.

Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
Fixes: 9650ce11f2e3 ("sched: dynamic: Simplify preempt model accessors")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Mete Durlu <meted@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c  |  2 +-
 kernel/sched/debug.c | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 545f49491bcde..5a61650f12b7d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7960,7 +7960,7 @@ static inline void preempt_dynamic_init(void) { }
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 const char *preempt_modes[] = {
-	"none", "voluntary", "full", "lazy", NULL,
+	"full", "lazy", NULL,
 };
 
 const char *preempt_model_str(void)
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9883e4c4976bf..fda10b3fa249a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -280,16 +280,10 @@ static ssize_t sched_dynamic_write(struct file *filp, const char __user *ubuf,
 
 static int sched_dynamic_show(struct seq_file *m, void *v)
 {
-	int i = (IS_ENABLED(CONFIG_PREEMPT_RT) || IS_ENABLED(CONFIG_ARCH_HAS_PREEMPT_LAZY)) * 2;
 	int mode = READ_ONCE(preempt_dynamic_mode);
-	int j;
 
-	/* Count entries in NULL terminated preempt_modes */
-	for (j = 0; preempt_modes[j]; j++)
-		;
-	j -= !IS_ENABLED(CONFIG_ARCH_HAS_PREEMPT_LAZY);
-
-	for (; i < j; i++) {
+	/* Stop at NULL terminator */
+	for (int i = 0; preempt_modes[i]; i++) {
 		if (mode == i)
 			seq_puts(m, "(");
 		seq_puts(m, preempt_modes[i]);
-- 
2.30.2

