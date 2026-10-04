Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1393146982B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138502; cv=none; b=qnwJ4AngN3UjAWDiVjseYjnqxtjBvy4fGM5w4mIAvjrANXzU9MuTs58fRmhiyiV0tbplUEs1gUotWtsKlU9tG2pAbVX4VmCoLYEdOl5AC56YFByXNZ8P7yJud424AAV6b64URj+LGfXpTU1UMHCEQ/7mDX6p61GCUaqHxTzVNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138502; c=relaxed/simple;
	bh=njlnlTJt5iZP2bejSiagGot6SlbcZs9OZ/9npG5tKBY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ntewBj1GpKhITyiXg0MBcgyrc9Cu/rOSR4FCl6VBOzi6vwcYy+KOxiElPHECjxTZajPw0q7CRTsuKJo0O4qvocnm6CLgT/iZcaoX7SOAS2QeZQLXL5mTCNdNl3nSaFuffgZQXUc11PxAhIw08NKI8qbS5JXJXw51IjXb0sTGeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tUfGGiKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tUfGGiKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419B41F000FF;
	Sun,  4 Oct 2026 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791138500;
	bh=VgphmWZfOjVoNxv7lzGrjtwhkibh+UKXVNqBsUZH1Hk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tUfGGiKSUDcXjnP+9p4+VAHvkDJ0dv60B17WEOkxCh1ZJ7yghmGLGhrCFAe4AwtRc
	 ZJBlVLoNh7nevpRjTazbUBsXYBvQ/esxwI02R/sfZ75LMW6MXjjs6hKINjqG3mrvnT
	 DKq6TXvjh0e2hVpUfWelLmtgcOkElSc4bAou+agQ=
Date: Sun, 4 Oct 2026 11:28:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com,
 linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 brads@mainlining.org, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com,
 steve@abita.co, mproche@gmail.com, nick.lange@gmail.com
Subject: Re: [PATCH v11 0/2] hung_task: Improve warning budget handling and
 task reporting
Message-Id: <20261004112819.6dc90ddd0fb33ef8f2e58531@linux-foundation.org>
In-Reply-To: <20261004163610.413506-1-atomlin@atomlin.com>
References: <20261004163610.413506-1-atomlin@atomlin.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  4 Oct 2026 12:36:08 -0400 Aaron Tomlin <atomlin@atomlin.com> wrote:

> The hung_task watchdog detects tasks stuck in TASK_UNINTERRUPTIBLE (D)
> state for longer than CONFIG_DEFAULT_HUNG_TASK_TIMEOUT seconds. To prevent
> log spam during system spikes, sysctl_hung_task_warnings enforces a budget
> on the number of logged warnings.
> 
> However, the current implementation has two major limitations:
> 
> ...
> 
> This patch series resolves both limitations by decoupling the configured
> warning limit from the active runtime budget, automatically resetting the
> budget upon system recovery or sysctl updates, and emitting a single
> aggregate summary line when hung tasks are detected under an exhausted
> warning budget.

Thanks, I've updated mm.git's mm-nonmm-unstable branch to this version.

> 
> Changes since v10:
> 
>  - Guarded the suppression notice in hung_task_info() with
>    !hung_task_call_panic so suppression messages are not emitted for tasks
>    dumped while panicking, and simplified the log message to state details
>    are suppressed until the budget is reset
> 
>  - Added Reviewed-by: tag from Bradley Morgan <brads@mainlining.org>
> 

Here's how v11 altered mm.git:


 kernel/hung_task.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/kernel/hung_task.c~b
+++ a/kernel/hung_task.c
@@ -276,8 +276,8 @@ static void hung_task_info(struct task_s
 		sched_show_task(t);
 		debug_show_blocker(t, timeout);
 
-		if (!hung_task_warnings_budget)
-			pr_info("hung_task: further per-task details suppressed until warning budget is reset or panic is triggered (see sysctl kernel.hung_task_warnings)\n");
+		if (!hung_task_warnings_budget && !hung_task_call_panic)
+			pr_info("hung_task: further per-task details suppressed until warning budget is reset (see sysctl kernel.hung_task_warnings)\n");
 	}
 
 	touch_nmi_watchdog();
_

