Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B293382F25;
	Fri,  4 Sep 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518308; cv=none; b=mOoMgwVr3xsCHa6iFbQn5vX1fBW1vkkVCHav7qgw8aNnceVr0nbxS1UJo9nX7+ot7QPna1v2Io7Ih+Woj8wP/zcB3KIc03zJjkvzw8X/5mgsQeJat0H2iqNifDAdXb75y/pFmB4ONEj/l1QcqOmJefPahXeEA8BC+nLLubeuJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518308; c=relaxed/simple;
	bh=/zjzEx45RZv3sWn8DBQ/bwQH1shhgggfllyXygJm5x8=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=iNBpGLi7Ai6ZFyqbxxn8AXnuVM4Jg7MmuwlZbHOtyWWBkkFI/qzAuozbxNhiMvMdzZrGc52v56MlOUcfRd1OopHLqlISNoLol3m8IOOZL9+LRNo5Pf2ZtYaf2mUDHe24qT/aQFZen+5TQA6g2qGzgeGl4zZI//C3EMpYuKtRBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WK54NXrP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZrshocL6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WK54NXrP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZrshocL6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518297; bh=vn6pw5IQTM2Y8K6VjCjUwGQ
	t81XGpIuJAoJLoxZsCl0=; b=WK54NXrP2/MCwbtVFSdUjerAd3fhNM9ZEMks/IcLVs6duFoPzb
	yDGmERc+7pUOOrJFE+EMsEOizR9+qjgULUDrveahSwFxUAuNLEOwItIOW+iEEXtkUKu/kt0TtYs
	E7BqdwGKYPvO3g47JObv5DH+judVjpploRA1g0K0HNNgDQW1R1FqDvrSpeCNv1IFrm2OI9DSnjd
	kzX7sIMwgs///ti1SKFInzPcs11pAl0Qbx/jZ0WyF7Kr4xegrtgH7TW5Xiph7tZZ0Qoawi8+HQ5
	g3Sw+9Jw44O0qb5iD3ECb535oX2SjylFfTPQj7fndEYLjFvRiZ+Ctl4v/W2Vu2Y5tDw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518298; bh=vn6pw5IQTM2Y8K6VjCjUwGQ
	t81XGpIuJAoJLoxZsCl0=; b=ZrshocL6ulrFV0bTdtgVTJomsVRamZ0Jvxk/O+QOwBOeBE10BU
	zQg88Rhi9wkJUV0klNr1z3iPSFm2r7SUFFCg==;
Date: Fri, 04 Sep 2026 11:38:18 +0100
From: Bradley Morgan <brads@mainlining.org>
To: tip-bot2@linutronix.de
CC: bigeasy@linutronix.de, enlin.mu@linux.dev, enlin.mu@unisoc.com,
 linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
 maz@kernel.org, tglx@kernel.org, tglx@linutronix.de, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Btip=3A_irq/core=5D_softirq=3A_Remove_redundan?=
 =?US-ASCII?Q?t_h-=3Eaction_from_preempt=5Fcount_mismatch_error?=
In-Reply-To: <178850449605.3717435.10744522318261630112.tip-bot2@tip-bot2>
Message-ID: <BE63C676-1525-4E62-BD37-CF867671371D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 September 2026 07:48:16 BST, tip-bot2 for Enlin Mu
<tip-bot2@linutronix.de> wrote:
>The following commit has been merged into the irq/core branch of tip:
>
>Commit-ID:     67f399a9ac7f3001cafc0cb1b645e3e5760779d2
>Gitweb:        https://git.kernel.org/tip/67f399a9ac7f3001cafc0cb1b645e3e5760779d2
>Author:        Enlin Mu <enlin.mu@linux.dev>
>AuthorDate:    Tue, 25 Aug 2026 09:15:09 +08:00
>Committer:     Thomas Gleixner <tglx@kernel.org>
>CommitterDate: Fri, 04 Sep 2026 08:45:56 +02:00
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
>Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>
>Signed-off-by: Enlin Mu <enlin.mu@linux.dev>
>Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi, What's wrong with my tag? I'm sure I provided it! On my old email, see

https://lore.kernel.org/all/A86DF76C-F103-4BD1-A5FF-B4701B7A9FEF@grrlz.net/

New tag:

Reviewed-by: Bradley Morgan <brads@mainlining.org>

if there's anything wrong with my tag, please feel free to tell me and
I'llcomment on it

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
