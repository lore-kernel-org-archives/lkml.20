Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DCB3BED66
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132733; cv=none; b=cVG4saMkFx7JQd2S30lftR9lIdzGsAtoyeEO6HztRA58EwPVQ/7bd8kzKgnOhFlk26NFNznzJ85g4IYhrm5AMyciD8JANcNGcNiWg7Pzbnso8AXRwplyS77L8tTKLdkqp0uwMFzPsziu2fO8oLRicnBuLWDKGjwP1bCE3PJd8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132733; c=relaxed/simple;
	bh=2ENNaeAAtpbFqBLkjBvhpXgbldYS98epZqFk8iUUZdM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=h5qErHXlV3aR9LPi0kkJkUfymAwuskpkMXU74nJNdmXSDTOgaQmELLv/n/rmBOLEZoZqtbBrG2eGjIrAYmj92M1nghWqYv80HWdnGHMQStVatJODJPuvGkyzQa5cBHuoQFV9CbE5FCBFIWYaUfKhsN8nvynS2pNn6ou/XerIY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iu7j4QgW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b5Nb+a7l; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iu7j4QgW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b5Nb+a7l"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791132695; bh=DUKvf4KEW9kFZVabVluWgt5
	RqPGEcg1nrffXzaBOtj4=; b=iu7j4QgWhS3kmFXgMmybM3m6y4tb/6gb96lLIPrMC6k3l36gfS
	y9SDfc3tCk6MyUo3251kycFhHK1kJtPxRFjyfxIg387Ea1sluPW9lQkpj6DGYG5EkN85CmVPoOw
	B8zHrbAfHt8znP/VRSg9sN1FCdeUqTHf3blTAQ2ytsxTr5edK47MJvuu+7XtEQl1M+uSSLr9kBl
	pU8klsM0HmkageiKVTp9JdoJO9QXvZWZyE9KfZVxN9xH8gge7gANTGegn//5IR8BV/Sp+gOc0Si
	hF5aUUPXueWmJ0OfrYQqcjM3f+b3jsR8W94YTNzND7Os6UodAsGRZHM9cIZhE9wLhRw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791132695; bh=DUKvf4KEW9kFZVabVluWgt5
	RqPGEcg1nrffXzaBOtj4=; b=b5Nb+a7lMPy39E0ELwhMJqIzqB6i7Q+G50PpBWWEZwD4nyQAdQ
	kGM6+WUE/Qf1bb9Yk4TxF2to+6TFostkfMCg==;
Date: Sun, 04 Oct 2026 17:51:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
 lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com
CC: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 atomlin@atomlin.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com,
 steve@abita.co, mproche@gmail.com, nick.lange@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v11_1/2=5D_hung=5Ftask=3A_Reset_wa?=
 =?US-ASCII?Q?rning_budget_when_problem_gets_resolved?=
In-Reply-To: <20261004163610.413506-2-atomlin@atomlin.com>
References: <20261004163610.413506-1-atomlin@atomlin.com> <20261004163610.413506-2-atomlin@atomlin.com>
Message-ID: <6D2CB611-9C42-405E-A127-781EC892703F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 October 2026 17:36:09 BST, Aaron Tomlin <atomlin@atomlin.com> wrote:
>The sysctl hung_task_warnings currently holds both the configured warning
>limit and the remaining budget. Each detailed report decrements the
>sysctl, so once it reaches zero, the configured limit is lost and cannot
>be restored automatically.
>
>Keep sysctl_hung_task_warnings as the configured warning limit and make
>khungtaskd the sole owner of the remaining budget. A check that finds no
>hung tasks reloads the budget directly from the configured limit. A
>successful sysctl write publishes an atomic reset request, which
>khungtaskd consumes at the start of the next check.
>
>Suggested-by: Petr Mladek <pmladek@suse.com>
>Suggested-by: Lance Yang <lance.yang@linux.dev>
>Tested-by: Lance Yang <lance.yang@linux.dev>
>Reviewed-by: Lance Yang <lance.yang@linux.dev>

LGTM:

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
>---
> Documentation/admin-guide/sysctl/kernel.rst |  5 ++-
> kernel/hung_task.c                          | 49 +++++++++++++++++----
> 2 files changed, 44 insertions(+), 10 deletions(-)
>
>diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>index ffea61d448eb..c03369e234a9 100644
>--- a/Documentation/admin-guide/sysctl/kernel.rst
>+++ b/Documentation/admin-guide/sysctl/kernel.rst
>@@ -459,8 +459,9 @@ hung_task_warnings
> ==================
> 
> The maximum number of warnings to report. During a check interval
>-if a hung task is detected, this value is decreased by 1.
>-When this value reaches 0, no more warnings will be reported.
>+if a hung task is detected, the internal warning budget is decreased by 1.
>+When this budget reaches 0, no more detailed warnings will be reported. The
>+warning budget is reset to the configured limit when no hung task is found.
> This file shows up if ``CONFIG_DETECT_HUNG_TASK`` is enabled.
> 
> -1: report an infinite number of warnings.
>diff --git a/kernel/hung_task.c b/kernel/hung_task.c
>index 6fcc94ce4ca9..a5043188456d 100644
>--- a/kernel/hung_task.c
>+++ b/kernel/hung_task.c
>@@ -57,8 +57,20 @@ unsigned long __read_mostly sysctl_hung_task_timeout_secs = CONFIG_DEFAULT_HUNG_
>  */
> static unsigned long __read_mostly sysctl_hung_task_check_interval_secs;
> 
>+/*
>+ * Limit the number of printed hung tasks to prevent printing
>+ * the same or similar backtraces repeatedly.
>+ */
> static int __read_mostly sysctl_hung_task_warnings = 10;
> 
>+/*
>+ * The number of hung tasks which still can be reported.
>+ * The budget gets restored to the original limit when
>+ * the previous stall is resolved.
>+ */
>+static int hung_task_warnings_budget = 10;
>+static atomic_t reset_hung_task_warnings = ATOMIC_INIT(0);
>+
> static int __read_mostly did_panic;
> static bool hung_task_call_panic;
> 
>@@ -245,11 +257,11 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
> 	/*
> 	 * The given task did not get scheduled for more than
> 	 * CONFIG_DEFAULT_HUNG_TASK_TIMEOUT. Therefore, complain
>-	 * accordingly
>+	 * accordingly with full details if the budget is not exhausted.
> 	 */
>-	if (sysctl_hung_task_warnings || hung_task_call_panic) {
>-		if (sysctl_hung_task_warnings > 0)
>-			sysctl_hung_task_warnings--;
>+	if (hung_task_warnings_budget || hung_task_call_panic) {
>+		if (hung_task_warnings_budget > 0)
>+			hung_task_warnings_budget--;
> 		pr_err("INFO: task %s:%d blocked%s for more than %ld seconds.\n",
> 		       t->comm, t->pid, t->in_iowait ? " in I/O wait" : "",
> 		       (jiffies - t->last_switch_time) / HZ);
>@@ -264,7 +276,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
> 		sched_show_task(t);
> 		debug_show_blocker(t, timeout);
> 
>-		if (!sysctl_hung_task_warnings)
>+		if (!hung_task_warnings_budget)
> 			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
> 	}
> 
>@@ -304,7 +316,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
> 	unsigned long last_break = jiffies;
> 	struct task_struct *g, *t;
> 	unsigned long this_round_count;
>-	int need_warning = sysctl_hung_task_warnings;
>+	int need_warning;
> 	unsigned long si_mask = hung_task_si_mask;
> 
> 	/*
>@@ -314,6 +326,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
> 	if (test_taint(TAINT_DIE) || did_panic)
> 		return;
> 
>+	if (atomic_xchg_acquire(&reset_hung_task_warnings, 0))
>+		hung_task_warnings_budget =
>+			READ_ONCE(sysctl_hung_task_warnings);
>+	need_warning = hung_task_warnings_budget;
>+
> 	this_round_count = 0;
> 	rcu_read_lock();
> 	for_each_process_thread(g, t) {
>@@ -340,8 +357,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>  unlock:
> 	rcu_read_unlock();
> 
>-	if (!this_round_count)
>+	if (!this_round_count) {
>+		hung_task_warnings_budget =
>+			READ_ONCE(sysctl_hung_task_warnings);
> 		return;
>+	}
> 
> 	if (need_warning || hung_task_call_panic) {
> 		si_mask |= SYS_INFO_LOCKS;
>@@ -425,6 +445,19 @@ static int proc_dohung_task_timeout_secs(const struct ctl_table *table, int writ
> 	return ret;
> }
> 
>+static int proc_dohung_task_warnings(const struct ctl_table *table, int write,
>+				     void *buffer,
>+				     size_t *lenp, loff_t *ppos)
>+{
>+	int ret;
>+
>+	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>+	if (!ret && write)
>+		atomic_set_release(&reset_hung_task_warnings, 1);
>+
>+	return ret;
>+}
>+
> /*
>  * This is needed for proc_doulongvec_minmax of sysctl_hung_task_timeout_secs
>  * and hung_task_check_interval_secs
>@@ -480,7 +513,7 @@ static const struct ctl_table hung_task_sysctls[] = {
> 		.data		= &sysctl_hung_task_warnings,
> 		.maxlen		= sizeof(int),
> 		.mode		= 0644,
>-		.proc_handler	= proc_dointvec_minmax,
>+		.proc_handler	= proc_dohung_task_warnings,
> 		.extra1		= SYSCTL_NEG_ONE,
> 	},
> 	{
>


--- Thanks!
"I'm not a very positive person" - Linus torvalds
