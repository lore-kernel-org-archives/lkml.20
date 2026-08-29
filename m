Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB237F8C4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016968; cv=none; b=pBCMl1KvYgAZfVXagL9YF4kZazmsINgTSGE5ZwKlJKn3EBkyeotvxzHZDOAXj9zGTBXaCGy/+K7InlFF+eH/fYgIsdn/6QSDtYzr2fdtw3IhFdqmbjqLQeerhrpmGq9CLeoAMLUXesFA/laRD12UAXy7vPU+9QOu+ZZP05fyGWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016968; c=relaxed/simple;
	bh=RJokLjFBw8XGvTdzB73iwGmk3lSuWcPfXxc0MAxraNA=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=iZVYPDdQl1gu9gWD+jie8x01HCZEPbRKPSthJHcMVv2eqQ4AVWVehB8q76pTIxX3CZLR/GasqCWrMUCgjIWVCPFAcHp7Y4hC1kyq24EEY17ESySNjNUnqle+AhQloguDK/1yJNV6N/33QxjVjoFHs+1lEIJwG246O8z7F9IXc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=owtBKJcC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4Sdq0IoN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="owtBKJcC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4Sdq0IoN"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788016950; bh=ZfNv9Mocg/AkDbBuad2Wj/A
	4dXk4VtLjNROEqtR3IJg=; b=owtBKJcCubDznJOIKZNuYshC1fPy+IB1uxw258WA47xvUP7c2n
	hIKq/CNWBmR+f2yCjsj8q1upxx+uqKL4tovNryM+TJPE45LRfMmHr8dtUErR0rDUUUP5yk6pCoA
	/+S5YCt1Jp+36MUQ1Xyva7j/HVNlwza7BqPuu105InByM5VLaXpwJS8yR1Ksrz5zfW2Et5efXUh
	//6DNG3UEmO/9NF8k0zg/a7i7+g6tclpbixuf8btfU4ATvCOoHN8r3ydx7qMvMvMAyMRZOGukxj
	lB0w09Yh4BRXf+qDtEBibuPXS7MBY3rpmZF7H5yi1IbgtZIghZc/5gH7b/FTPqtoSKQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788016950; bh=ZfNv9Mocg/AkDbBuad2Wj/A
	4dXk4VtLjNROEqtR3IJg=; b=4Sdq0IoNM0s4crs5zk9ukREoXOtj//mBP6i0wZJ1t+PjXYoixJ
	O5wgfa7PjQl5uf3vrGRCyZ+dd/P3d5sKI4Bg==;
Date: Sat, 29 Aug 2026 16:22:31 +0100
From: Bradley Morgan <brads@mainlining.org>
To: atomlin@atomlin.com
CC: akpm@linux-foundation.org, chjohnst@gmail.com, david.laight.linux@gmail.com,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 mproche@gmail.com, neelx@suse.com, nick.lange@gmail.com, pmladek@suse.com,
 sean@ashe.io, steve@abita.co
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v10_2/2=5D_hung=5Ftask=3A_Log_summa?=
 =?US-ASCII?Q?ry_line_when_warning_budget_is_exhausted?=
In-Reply-To: <20260829145321.18423-3-atomlin@atomlin.com>
Message-ID: <41DC3C37-B2D8-4B74-BA05-87FCDFC20CBD@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 29 August 2026 15:53:21 BST, Aaron Tomlin <atomlin@atomlin.com> wrote:
>Once the warning budget is exhausted, hung_task_info() normally stops
>printing per-task details. When panic is triggered, full details are
>still printed so diagnostics remain available before panic.
>
>To retain visibility without restoring per-task output after budget
>exhaustion, emit a single aggregate summary line at the end of each
>watchdog scan that detects hung tasks with an exhausted budget. This
>keeps non-panic per-task reports budgeted during system-wide hangs.
>
>Suggested-by: Petr Mladek <pmladek@suse.com>
>Suggested-by: Lance Yang <lance.yang@linux.dev>
>Reviewed-by: Petr Mladek <pmladek@suse.com>
>Reviewed-by: Lance Yang <lance.yang@linux.dev>

Ok, Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
>---
> kernel/hung_task.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/hung_task.c b/kernel/hung_task.c
>index a5043188456d..49d47ae475ab 100644
>--- a/kernel/hung_task.c
>+++ b/kernel/hung_task.c
>@@ -277,7 +277,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
> 		debug_show_blocker(t, timeout);
> 
> 		if (!hung_task_warnings_budget)
>-			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
>+			pr_info("hung_task: further per-task details suppressed until warning budget is reset or panic is triggered (see sysctl kernel.hung_task_warnings)\n");

Cool.

> 	}
> 
> 	touch_nmi_watchdog();
>@@ -363,6 +363,10 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
> 		return;
> 	}
> 
>+	if (!hung_task_warnings_budget && !hung_task_call_panic)
>+		pr_info("hung_task: %lu hung tasks detected, warning budget exhausted\n",
>+			this_round_count);
>+

Nice!

> 	if (need_warning || hung_task_call_panic) {
> 		si_mask |= SYS_INFO_LOCKS;
> 
>


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
