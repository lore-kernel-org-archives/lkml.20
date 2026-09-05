Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716DD327C13;
	Sat,  5 Sep 2026 21:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644734; cv=none; b=WaARm1TC7AsE9RAfeTxcm/nDAVrEMSB6UekGHvaDRjEt6St1WxbgIlnX1eIZYXcB1HJcwIE4eY8kPqbtZjMVeUUPllSr4ANqomV5OYeyWHVMgV4pXO8UumBotufGFKu0TTYQj0bS9Jd81Fbuk9gGdoHUGElqxgzdI+oNvCSFIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644734; c=relaxed/simple;
	bh=1aI6U4/YCo8gxthr79ae0MEf7WUZ1n3sVxXSmOdPpTw=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=ixStPrVRb830WIBNU4Q9ebc8iyxSqw1jrwj985LXnBOHtfoiN+pTgSXlFv+z1V9CMorK2A4vbiTRTld9FJOsnbVGt1CLn1Cc4t1AyyW7ccFvYm93IBKSN1jFzbxc/HwStpD4ot/qnuxPuocRUQRlDt/dEhvPbFx+dApo/UWun9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=exPCgtk+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XIL6hl36; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="exPCgtk+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XIL6hl36"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788644728; bh=TsVXBytsg1eyOIynbtw270O
	ukiUUr3VSzfWUwr62CRE=; b=exPCgtk+XbgK/EscDWCvh4XZQPuPSLpVCY0Re2RGYQ0UQDFWQj
	2VqtbUzP7veHVc9ZUQj0dmU25LcEvO37zl0cN9IrBETvCSEVwIJpG4nCu0oIe4fnUwZRneiKtYK
	tnetYxLy5p4pNdcLDuh8gLCSNIquRQEansgqkgReGGd/nGg1z00aASX3OMuJPyTPCwa+3MdgG0Z
	ffOnsptlx5oXlnmjf3wcu1bP0pJH7oIuP2YS9/etw+JARdqmt9KXsgaxLaG+uNOomL5+ZZoYG6y
	XyQlPEpmXysdIqhQ2lMglJIqsrAZn2PdW3RZfIvRXKwrmDiGXIxEYlLPyeQWKu0DzOA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788644728; bh=TsVXBytsg1eyOIynbtw270O
	ukiUUr3VSzfWUwr62CRE=; b=XIL6hl36yKKDyZnudOc2iU0mpWo7wCFh2yRASwDGL8gkTn58w7
	/a+ioQwXSgqwkrwDQveJ0apfiHIuPBKZcADw==;
Date: Sat, 05 Sep 2026 22:45:26 +0100
From: Bradley Morgan <brads@mainlining.org>
To: tip-bot2@linutronix.de
CC: bigeasy@linutronix.de, enlin.mu@linux.dev, include@grrlz.net,
 linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
 maz@kernel.org, tglx@kernel.org, tglx@linutronix.de, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Btip=3A_irq/core=5D_softirq=3A_Remove_redundan?=
 =?US-ASCII?Q?t_h-=3Eaction_from_preempt=5Fcount_mismatch_error?=
In-Reply-To: <178863480086.623050.12464885106905159266.tip-bot2@tip-bot2>
Message-ID: <D4B03925-39BF-4191-A3F9-FFE8125E0FA4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 September 2026 20:00:00 BST, tip-bot2 for Enlin Mu
<tip-bot2@linutronix.de> wrote:
>The following commit has been merged into the irq/core branch of tip:
>
>Commit-ID:     a0e1fdb96578ea562a03c487f70673d228824d0a
>Gitweb:        https://git.kernel.org/tip/a0e1fdb96578ea562a03c487f70673d228824d0a
>Author:        Enlin Mu <enlin.mu@linux.dev>
>AuthorDate:    Tue, 25 Aug 2026 09:15:09 +08:00
>Committer:     Thomas Gleixner <tglx@kernel.org>
>CommitterDate: Sat, 05 Sep 2026 20:52:12 +02:00
>
>softirq: Remove redundant h->action from preempt_count mismatch error
>
>When a preempt_count mismatch is detected in handle_softirqs(), the
>error message currently prints the softirq action handler (h->action).
>
>However, as Thomas Gleixner pointed out, the action handler for a given
>softirq vector is always a known, fixed function (e.g., run_timer_softirq
>for TIMER_SOFTIRQ). Printing it provides zero diagnostic value. The real
>issue typically lies in the functions invoked *within* that handler, not
>the handler entry point itself.
>
>Therefore, as suggested by Sebastian Andrzej Siewior, remove h->action
>from the print statement entirely to clean up the error message.
>
>Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>Signed-off-by: Enlin Mu <enlin.mu@linux.dev>
>Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>Reviewed-by: Bradley Morgan <include@grrlz.net>

Sorry:

Reviewed-by: Bradley Morgan <brads@mainlining.org>


Oof. :(


>Link: https://patch.msgid.link/20260825011509.8505-1-enlin.mu@linux.dev
>---
> kernel/softirq.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/softirq.c b/kernel/softirq.c
>index 7980a4a..800d81c 100644
>--- a/kernel/softirq.c
>+++ b/kernel/softirq.c
>@@ -645,8 +645,8 @@ restart:
> 		h->action();
> 		trace_softirq_exit(vec_nr);
> 		if (unlikely(prev_count != preempt_count())) {
>-			pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
>-			       vec_nr, softirq_to_name[vec_nr], h->action,
>+			pr_err("huh, entered softirq %u %s with preempt_count %08x, exited with %08x?\n",
>+			       vec_nr, softirq_to_name[vec_nr],
> 			       prev_count, preempt_count());
> 			preempt_count_set(prev_count);
> 		}
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
