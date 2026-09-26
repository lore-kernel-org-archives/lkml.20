Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4B3438BB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425602; cv=none; b=Vt5IAsianRIPrYBem1V3eOEz1rKwuZytwqmn2PWHIWeJ2LgYZTDbt7LaG6UYaACwaIySsjMQvRVtI+yLf6mJ3V3Gg71+p3gv28KMTISo0eRGjDgpYFMDkBDJ55zOOmzW4dc5BNOv7O+L1QSihpE3RVaVgNVoNsapgOhq9AfMXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425602; c=relaxed/simple;
	bh=E4R6wgDixVnx5WniKYyW3DclFz7kYE/SibDUhFQrY1A=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=tG/ls0K62LLibjjy99KV9OEh2mLMqwMoxCiTRn9h8Sm1lU7n0ZlEFSRn3pJv3ew4KXjfoGAAXhyRXmUfszz8QVJvS6Y9pI9BerFtUMfBDNC+gAzj8vRiK4YBNDHFViaRTme/lA9zkW5uD0cytVcUXz48emJwyXH4JbgCIePcdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo4eZAbR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo4eZAbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C481F000FF;
	Sat, 26 Sep 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790425600;
	bh=v9GahrCTAuW+XNGGeJo3b4DWy5wVhuBrnP1YI3KtbJ4=;
	h=Date:From:To:Cc:Subject;
	b=eo4eZAbRLNF30fKgqv2mbk9yvgywPiUABE/k/5oUHeH6+Vx2Uy9AMO74TUZRE6jZN
	 YFI0qxddLMoSJntt+Dq8xPXKlnTr5FqItVzwZHUn1JUAR8KndoIVJeOCk8IrTGJnlP
	 LXRzX9y3syzqzhkG8pRDLMSEOdpl9I9NI582LDYnMCucHctn4YRkmwwY1ta6Isss/7
	 9oLy/rUNwHhaiYYPFFHfpbCr2ihn1dX4huYvG+7/KiYe7YWQ+KnxG6RMC/YDJRphYM
	 ghOMa8Ij37usvpIrQkKW8OP7M1cS0JMfTiXJjNfcNx0lg+ZmXz8PO0ECoWwX6OqCZC
	 ZUqXM+Fp+5b5A==
Date: Sat, 26 Sep 2026 21:26:36 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrea Parri <parri.andrea@gmail.com>, David Carlier
 <devnexen@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.3-rc4
Message-Id: <20260926212636.26253345778ff20d31e62ca9@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi Linus,

Probes fixes for v7.3-rc4:

- kprobes: Fix permanent hang when flushing the kprobe optimizer
  Fix a deadlock when disabling kprobe optimization via sysctl or debugfs
  where flushers hung waiting for optimizer_completion. Replaced the
  completion with an optimizer_passes counter and wait_var_event_mutex()
  under kprobe_mutex so concurrent flushers can wait and wake up safely.

- fprobe: Terminate the fgraph_data list when the reservation is not filled
  Fix an issue where unused shadow stack data left uninitialized by
  fprobe_fgraph_entry() was misparsed as stale fprobe headers on return.
  Explicitly write a zero word to terminate the list and update
  read_fprobe_header() to handle the zeroed slot properly.

- ftracetest: Fix unique symbol check in kprobe_non_uniq_symbol.tc
  Fix false test failures in kprobe_non_uniq_symbol.tc on architectures
  like s390 where a symbol exists once in core kernel but also in modules.
  Anchor the /proc/kallsyms search regex to the end of the line so that
  module symbols are not incorrectly counted.


Please pull the latest probes-fixes-v7.3-rc4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.3-rc4

Tag SHA1: f300c5ce223f16f4affb9aae21d670efc673d219
Head SHA1: 5bfa9f1a9dcb6ecb607adbc1c0226605c972935b


Andrea Parri (1):
      kprobes: Fix permanent hang when flushing the kprobe optimizer

David Carlier (1):
      fprobe: Terminate the fgraph_data list when the reservation is not filled

Sven Schnelle (1):
      selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc

----
 kernel/kprobes.c                                   | 22 ++++++++++++++--------
 kernel/trace/fprobe.c                              | 15 +++++++++++++++
 .../ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc |  2 +-
 3 files changed, 30 insertions(+), 9 deletions(-)
---------------------------
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..4edd8ca5c657 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -42,6 +42,7 @@
 #include <linux/execmem.h>
 #include <linux/cleanup.h>
 #include <linux/wait.h>
+#include <linux/wait_bit.h>
 
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
@@ -526,7 +527,8 @@ enum {
 	OPTIMIZER_ST_FLUSHING = 2,
 };
 
-static DECLARE_COMPLETION(optimizer_completion);
+/* Bumped at the end of each kprobe_optimizer() pass, under 'kprobe_mutex' */
+static unsigned long optimizer_passes;
 
 #define OPTIMIZE_DELAY 5
 
@@ -654,9 +656,9 @@ static void kprobe_optimizer(void)
 		do_free_cleaned_kprobes();
 	}
 
-	/* Step 5: Kick optimizer again if needed. But if there is a flush requested, */
-	if (completion_done(&optimizer_completion))
-		complete(&optimizer_completion);
+	/* Step 5: Wake up flushers, and kick optimizer again if needed. */
+	optimizer_passes++;
+	wake_up_var_locked(&optimizer_passes, &kprobe_mutex);
 
 	if (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list))
 		kick_kprobe_optimizer();	/*normal kick*/
@@ -708,7 +710,8 @@ static void wait_for_kprobe_optimizer_locked(void)
 	lockdep_assert_held(&kprobe_mutex);
 
 	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
-		init_completion(&optimizer_completion);
+		unsigned long passes = optimizer_passes;
+
 		/*
 		 * Set state to OPTIMIZER_ST_FLUSHING and wake up the thread if it's
 		 * idle. If it's already kicked, it will see the state change.
@@ -717,9 +720,12 @@ static void wait_for_kprobe_optimizer_locked(void)
 			OPTIMIZER_ST_FLUSHING) != OPTIMIZER_ST_FLUSHING)
 			wake_up(&kprobe_optimizer_wait);
 
-		mutex_unlock(&kprobe_mutex);
-		wait_for_completion(&optimizer_completion);
-		mutex_lock(&kprobe_mutex);
+		/*
+		 * kprobe_optimizer() holds 'kprobe_mutex' for a whole pass, which
+		 * this drops while sleeping, so a new count means a full pass ran.
+		 */
+		wait_var_event_mutex(&optimizer_passes,
+				     optimizer_passes != passes, &kprobe_mutex);
 	}
 }
 
diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 1e9b00997ff2..9f2d98181779 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -171,6 +171,11 @@ static inline bool write_fprobe_header(unsigned long *stack,
 static inline void read_fprobe_header(unsigned long *stack,
 					struct fprobe **fp, unsigned int *size_words)
 {
+	if (!*stack) {
+		*fp = NULL;
+		*size_words = 0;
+		return;
+	}
 	*fp = arch_decode_fprobe_header_fp(*stack);
 	*size_words = arch_decode_fprobe_header_size(*stack);
 }
@@ -203,6 +208,12 @@ static inline void read_fprobe_header(unsigned long *stack,
 {
 	struct __fprobe_header *fph = (struct __fprobe_header *)stack;
 
+	if (!*stack) {
+		*fp = NULL;
+		*size_words = 0;
+		return;
+	}
+
 	*fp = fph->fp;
 	*size_words = fph->size_words;
 }
@@ -635,6 +646,10 @@ static int fprobe_fgraph_entry(struct ftrace_graph_ent *trace, struct fgraph_ops
 		}
 	}
 
+	/* Terminate the list, fgraph_reserve_data() does not clear it. */
+	if (used && used < reserved_words)
+		fgraph_data[used] = 0;
+
 	/* If any exit_handler is set, data must be used. */
 	return used != 0;
 }
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc
index bc9514428dba..07b1177c1634 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc
@@ -6,7 +6,7 @@
 SYMBOL='name_show'
 
 # We skip this test on kernel where SYMBOL is unique or does not exist.
-if [ "$(grep -c -E "[[:alnum:]]+ t ${SYMBOL}" /proc/kallsyms)" -le '1' ]; then
+if [ "$(grep -c -E "[[:alnum:]]+ t ${SYMBOL}$" /proc/kallsyms)" -le '1' ]; then
 	exit_unsupported
 fi
 

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
