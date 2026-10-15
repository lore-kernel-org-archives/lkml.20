Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCD3481FAA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096657; cv=none; b=ZbOkaAIUEHBjpKcKeZG/QvtW6WKwje+C2RmbEA16BvTgJ3RHqDrjE3EGVmMaGAMSXFNmZib9DoWZqhoEUladx67g6WQ9EUicKFg0bmabOaU6QOb9m+q8AzKYg4UVybeS0x3DRhNCNICM/wOIV6xK7rkwpyEvPq8u+fnTXFxGHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096657; c=relaxed/simple;
	bh=ytYkL7vi1hdrRuiJeUmxqkYrTkZSJYwbnd+J9//WYPs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y63ZOAO4eI+b/e1Fq0NMBgCDwCK41uFNOLGesvkCjxSGALJoyTh2m/GPWGyDFJglBbhPmkkfi9w3B3gfjFH+ZMojb2lnwd5LhF1aVf35AeEsGivAI8ydYf38vCXaAJhtXy8GhBwtdQqCCeah+KuRM+D6BrLb/SlMsc27abVqZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3/YJJcLq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n1y4ahGr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3/YJJcLq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n1y4ahGr"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792096651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6aA/A3Cn1MXQnpV+Fe2LyTxatapeYJtkT5ci4DLf8A=;
	b=3/YJJcLq7ZZzf+DxQi2LybGAIiKfi+DGVR6o0+owHEcPbJ2OigVnmk9LEHeE6f14SwNce0
	eHTfz411cL1tI8lMyyAQP7sUTcGYhE3//cTD7esDyAM+INcSdNUiJwGS3L1z+NfpjDtPRN
	BlJh/kZFWwe7GLyqLmyYuPb0LgBDGnRs3bJKTQ2pBPn1Tktl+aQEZkUGAinu5hijdokrZN
	D9KhKWIUasLlC/v0aatm3W8q8FbWoSEuhyZrI01Dmi3Va1wNgVKI3rIvxKBjq5ss+VpN+3
	Ot2OtMYIBunHUhSNkgLhocT+WD1qPPAJTVMCNlYb3J02493TgwAZ1Cz83v99zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792096651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6aA/A3Cn1MXQnpV+Fe2LyTxatapeYJtkT5ci4DLf8A=;
	b=n1y4ahGrNsEfo91mVqVHcM+z5dH8XZeraUCzqkCOkrrAJp2Eq98mwzxNChdGXZRnLW5b+x
	mADZFd2M4oRgIrBg==
To: Peter Zijlstra <peterz@infradead.org>, Jiakai Xu
 <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
In-Reply-To: <20260918104349.GL776954@noisy.programming.kicks-ass.net>
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
Date: Thu, 15 Oct 2026 22:37:30 +0200
Message-ID: <877bjiem45.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 18 2026 at 12:43, Peter Zijlstra wrote:
>> This also prevents an exhausted allocation from feeding MM_CID_UNSET
>> into the transition bit handling, which would later hand MM_CID_UNSET
>> as bit number to clear_bit().
>
> This all sounds horribly wrong. It fails to explain why the transition
> isn't happening, nor does it explain how it doesn't utterly
> violate/break user space.

Correct. Going back to user space without a CID is broken.

Looking at the stall splat the scenario is:

CPU1 runs a jump label update and is stuck in csd_lock_wait(), which is
invoked from on_each_cpu_cond_mask(), smp_text_poke_sync_each_cpu().
That does not make progress because CPU0 is looping in mm_get_cid() with
interrupts disabled.

CPU0 runs an execve() and loops in mm_get_cid(), which is invoked from
sched_mm_cid_fork(), sched_mm_cid_after_execve().

RIP: 0010:mm_get_cid 		linux-7.1.13/kernel/sched/sched.h:3880 [inline]
RIP: 0010:sched_mm_cid_fork     linux-7.1.13/kernel/sched/core.c:10970

So yes, that's 7.1.13, which is EOL, but it has all the mmcid fixes and
the same issue should reproduce on 7.3-rc7...

Jiakai, can you please provide the reproducer for this issue and
validate that it still persists on the lastest upstream kernel (7.3-rc7)?

The stall makes no sense because mm_get_cid() is invoked from:

  10967                 /* First user ? */
  10968                 if (!mm->mm_cid.users) {
  10969                         sched_mm_cid_add_user(t, mm);
  10970                         t->mm_cid.cid = mm_get_cid(mm);

which means this is the first CID user on the MM. So how can the bitmap
be exhausted?

I have a suspicion but it does not add up (yet).

This is a two CPU VM. Assume that the process which invokes execve() has
more than two threads. That means the MMCID of the process is in per CPU
mode. sched_mm_cid_exit() ignores a mode change when the last user goes
away and with two CPUs the threshold to switch back is when the user
count goes below _ONE_. So there is probably stale state there, but the
last outgoing task should have reclaimed the per CPU CID and dropped it,
but the other CPU still has it assigned to it. So that first allocation
should succeed...

I'll try to write a trivial test program tomorrow which creates enough
threads and does an execve().

Thanks,

        tglx
