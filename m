Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA382EC083
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576816; cv=none; b=D/KUv5xKQFveE7D1vGuXT9NElID9H1YuGPhQiIgb08RvjNgDELMy87TUY8yKuSwMTo/JJhFbHiqHQmXgW/tIYlrn3b9/9J65HBJ7yzpMdr6T/rsJU3sjLUh9QsvToiGcO2b5p5BjeUAXABwtPqj9orbwMDLedGfXuXjEvO4uGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576816; c=relaxed/simple;
	bh=c2e7JWptlPyFgFbfKdSHDffFP06ijENTeL8y49l/Pc8=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=F1TMvru6GSXBUO3XUfTlh/kMOoJJno9YcNHyBeRQw0Ckg9sjAiUYfxWRTcKwZLl7DK7FBuFfvpTfIwFM39D7ZzaRKJJV94uXius1+nCYXoI2/LGRCPDFe1eLARkbbIa59z1JtbQpiIkrYtr7bwijsgqix0xcjdYFbCD88pi+sVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=f21o9XtW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2c/09ULG; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="f21o9XtW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2c/09ULG"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789576806; bh=0XAAKtPMKM1R5EhwY3gbwpW
	a+3p4GtZHocoSh14uIK4=; b=f21o9XtWHAOEKcjyZRptJU5B8eHtRvi/t/OJP/yKlN+6Gtfyyc
	LvDHitiQvGyxOBYrpZeC2adZMWvrj1YI02f43JYlEjQSllYHavvKPKM/dUtefAn1whV03RTXxzw
	1irggAO/2jVWnXlLfnsR4EAh4kuHGfT56Hu9bOgaX55saz+J9l6Y+POiATl9iO68v0BfUAYQfhB
	PFnz+rKAr/JgNmGfyhq5bxOqdn3c7ndKHLBgJ2nQDza/EqLxrtyYtmqFTm5UYFfTmUKJO5I+GDV
	/1RJGehObeyDWNUMSAEaHCL16z2vuZMCmtBMGaUANt3p8VYhn6h0bMkNUdkEoGlibuw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789576806; bh=0XAAKtPMKM1R5EhwY3gbwpW
	a+3p4GtZHocoSh14uIK4=; b=2c/09ULGWM5gdNYMjXo4fUlOdBvq4/6oFxdwKD7pMaNuBW/tu0
	qvrByS9W8Fm0llqcP2t+In/5tKDWy6GM+/Aw==;
Date: Wed, 16 Sep 2026 17:40:07 +0100
From: Bradley Morgan <brads@mainlining.org>
To: quchaosheng000406@163.com
CC: linux-kernel@vger.kernel.org,
 syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_kthread=3A_Report_cpumask?=
 =?US-ASCII?Q?_allocation_failure_without_warning?=
In-Reply-To: <20260916015948.113062-1-quchaosheng000406@163.com>
Message-ID: <B6BD0B30-6E75-49ED-A13D-33FED28AD032@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 September 2026 02:59:48 BST, Quchaosheng <quchaosheng000406@163.com>
wrote:
>kthread_affine_node() warns when zalloc_cpumask_var() fails:
>
>  if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>          WARN_ON_ONCE(1);
>          return;
>  }
>
>The allocation uses GFP_KERNEL, so it can fail under memory pressure or
>fault injection.  A failed allocation is a recoverable condition and not a
>kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
>NAPI thread:
>
>  WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
>  CPU: 0 PID: 5207 Comm: napi/wg2-0
>  Call Trace:
>   alloc_cpumask_var_node+0xfc/0x138
>   zalloc_cpumask_var
>   kthread_affine_node+0x148/0x2e8
>   kthread+0x29c/0x3d4
>   ret_from_fork+0x10/0x20
>
>The failure is not silent though: the early return also skips
>list_add_tail() of kthread::affinity_node, so the thread never joins
>kthread_affinity_list and kthreads_online_cpu() will not fix up its
>affinity on a later CPU hotplug.  Keep the failure visible with
>pr_warn_once() instead of dropping the message.

I swear there was a patch for this I  kinda NAKed.

>
>Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
>Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
>---
> kernel/kthread.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/kthread.c b/kernel/kthread.c
>index a3f95c904..b59fa7c7e 100644
>--- a/kernel/kthread.c
>+++ b/kernel/kthread.c
>@@ -356,7 +356,14 @@ static void kthread_affine_node(void)
> 		return;
> 
> 	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
>-		WARN_ON_ONCE(1);
>+		/*
>+		 * The thread stays out of kthread_affinity_list, so a later
>+		 * CPU hotplug will not fix up its affinity. Report it, but do
>+		 * not warn: the allocation can fail under memory pressure or
>+		 * fault injection, and that is not a kernel bug.
>+		 */

For the comment length, I have to ask did you use AI to develop this?

>+		pr_warn_once("kthread: %s: no cpumask, node affinity not set\n",
>+			     current->comm);

Ummmmmm. I mean, okay then? But what effect does this make? (Except from
the message).

Under memory pressure I presume

1: your memory needs replacing, you get what you get
2: you did this on purpose, you deserve whatever you get.

And under fault injection is just a test.

I really think this code is sane as is, 

NAK.

> 		return;
> 	}
> 
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
