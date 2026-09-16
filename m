Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C574E4EBAD9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572514; cv=none; b=FMVDJmxbXYxHs6J+SRSCQriNmtpgIdahrC8ZXLzN4n3ICYCZCDa1Szb2cfgmjGygNXLOGspJqMssDP+1TXPsvvj6OwgVH5R3QNzdV4jPnJidS9EoZUMBSShoUYsWPfOyqh/42LJxKWoHj2MKbboED91LvS3wrzWyNIMopJf8IAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572514; c=relaxed/simple;
	bh=EmbfM+kvV/7PmqLs9xGO/Q7rJwIrk1dABTJaHRwKnZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2ATGQu9afPHQfUlYf8vyDaqbNls9S9aFUf9K/172dor8ae+glzOJYC9llZK/rIz79df+5tNCw7t37VQPimT/EjNcb7++WNsbC010jlZfbhkua2pfYGaiy4J9eyPvaDyFwhbNm/B1gjBZAuXnkwRNKYRILhNIoJRHkIGAa8xugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R2lFQhhr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R2lFQhhr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso9920875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789572507; x=1790177307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vldMBpyM+Nor6vxeiM5TtHG4tjvbrFlRKYSg3EnLeAs=;
        b=R2lFQhhrDFIl7+SKWMVUI9V9RzouuSuUfhM+9vlLHDnIK2MOKokyBRtQfcpb5iIfTL
         SG0iY/6460tWWbuWYlH1ctxcoZauU3K4dCmWnU9rMNRyaytb/oN8hckdWhRbKO7SZtyA
         eoDnDtu969O19XSshF7K3V2DsCtnUoilKoUjIBfpikOjV9+7mfoq5pYiGJR4GjAWHeQp
         xgh65iZC30FyUUziSkzo/MPDQ8hhGlPUt1RQLbxDDCtj6sbtM4z0CAdik4gsSF3+2gTo
         vEyQ9jlZVAdlEI3YJQyOyQpvWtZjWdu34UCuyeK8hSq3kN+MsqvDiAGrwI55JKzZaR+5
         8x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572507; x=1790177307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vldMBpyM+Nor6vxeiM5TtHG4tjvbrFlRKYSg3EnLeAs=;
        b=q82EYrS5DQW6eqRMuDjzGaH++ZcSa+cXOQCTySe638idix3CT/ZYRzjArN5/tlmdNP
         B+PJuVoBxmHO/5mDFLTfbEK6wkt3Z5lGi3G3AFhqcrGiH1Y5c/D83nfwY/dN2tPKBkk2
         rIeMYo9TpEE65DulPSeGgJzQoOalhcF2K+ov5+S6fzA/7wSNdcmOka4mWJwxOQ/a+8cn
         PtF0Eo391C4JaNFYaRME+gkNdolHHzNLqAiNxc+H6kKWc6pRj0kccYVChoXGzW19Dk1r
         sUpSl7YfrYR27WLvtp70bkFkwyAWVj5kTfc1maW3jXSZsgXilV/vFB8mdCZvg+Q1ySyg
         xUJw==
X-Forwarded-Encrypted: i=1; AKwUvBzVSXWQUl5+gMllTQNmVVPWCYVVWbe48ydkE2pgFi5yaZavyq5TllWefqx4/CDpcChUcV2DeQb4tWAKM8M=@vger.kernel.org
X-Gm-Message-State: AFuF++l1oUEakXXMJ2Hz2XWSpIf1+Vsn5mlIYiRjsbgVy2g8mIXTn+7O
	iYXwiV7Fm2LRRMbKdOJJvapERmaBA2F89NIbbVMtIJmY4W+0nJza4kIWS+zsmyZ0VDI=
X-Gm-Gg: AYBFou1VodGbcE/S+EG1dKTT0poFz1Rjta+giv9hmZTxZNQVuEfLpHN6OZfQZHqufqD
	Ze/kDkqDzDT54YF4Y18AuFo/Gk3RJabCLhykYPdhIwwG63g+Ful4MtYeST7V6gyGXRvWkK8GNLo
	L6Qve0MONVXyPcZyop+EiHH9MWj1wqE5pSdKHeRKYYI/rMNR9AEy8V3GaxHbapDEbZbBd2wAcTz
	oo5KLONkA1x7KTpcrkrD7bqD6cKQsafOJc43XAf9RpG0VpKXg82axhIQXgIv6wBe1jp7vZtBxJ7
	UbxoYNQ9JvQ/bYIKoDf1Pft/Q6SgSDHGatCD1fbA7vOcg9kZoR5wDRIaHEzR+9vZJqFI9+xWLTo
	K3L5vW4voIGFmrIIUmRryAiQ+CNpaXW1plTqUgfEh2sOLYPEtVnegQG9BBn5nKUio6jd2FMiQCm
	eiaNTvesMvJQvbREnbo9YTF5qssz5+Gz/mFy5x7u+4JQg/n7FcrZtZbn4TogGd4klOKwjM2vDWF
	ktBvTFsWIqt+MM=
X-Received: by 2002:a05:600c:1909:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49eb733983bmr32836735e9.32.1789572507021;
        Wed, 16 Sep 2026 08:28:27 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd197879sm214065e9.3.2026.09.16.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:26 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:28:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Cc: Bradley Morgan <brads@mainlining.org>, john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH v2] stop_machine: Defer legacy console flushes while a
 CPU runs a stopper callback
Message-ID: <aqq1mAAgJxXAiyc4@pathway.suse.cz>
References: <87984398-AD80-4AC8-B5FD-21219BA85FD5@mainlining.org>
 <bbbbd180-5ee5-4e85-b333-dd5d0a89478b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbbbd180-5ee5-4e85-b333-dd5d0a89478b@oss.qualcomm.com>

On Fri 2026-09-11 16:32:40, Aditya Chillara wrote:
> On 9/10/2026 9:46 PM, Bradley Morgan wrote:
> > On 10 September 2026 04:53:55 BST, Aditya Chillara
> > <aditya.chillara@oss.qualcomm.com> wrote:
> >> The cpu stopper thread runs above every other scheduling class, so while a
> >> stopper callback executes, nothing else on that CPU is scheduled. If such
> >> a
> >> callback emits a normal-priority printk(), the legacy console path can
> >> synchronously flush the pending console backlog. On systems with a slow
> >> UART and a large backlog, this holds the CPU long enough to starve RT
> >> kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the

Which watchdog, please?
Please, include the entire watchdog report into the commit message.

Also please mention the real life scenario (with SELinux logging)
in the commit message if there is a real life scenario, see below.

> >> CPU from advancing the state machine while the other CPUs wait.

[...]

> >> stop_machine() (used here for kprobe text patching) stops every CPU by
> >> running multi_cpu_stop() on each of them, through the per-CPU
> >> "migration/%u" threads. These threads run at a higher priority than the
> >> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
> >> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
> >> enabled.
> >>
> >> Heavy SELinux denial logging had built up a large backlog on the
> >> console.

Did this happen in production, please?

> >> Reproduced and verified with an out-of-tree test module that triggers
> >> stop_machine() with a queued console backlog and a printk() inside the
> >> rendezvous, paired with a kprobe-based script that flags any console
> >> flush happening while a CPU is inside a stopper callback.

I ask because the reproducer is artificial and the solution is just
a band aid. printk_deferred_enter() and printk_deferred() is
a whack-a-mole solution.

They were created to avoid deadlocks on the run queue lock. It might
happen when printk() is called in the scheduler code and the legacy
console_unlock() tries to wakeup a waiting process.

In addition, printk_deferred_enter() is used on few locations when
many debug messages are printed in an interrupt context.

AFAIK, this would be the first case when printk() deferred is used
to avoid softlockup in a code when the many messages are printed
from another context. And I am not sure if we want to go this way.

The legacy consoles might trigger a softlockup when printk() is called
with IRQs disabled and it has to flush many pending messages.

I do not see anything special about multi_cpu_stop() except that
all CPUs are bloked in this case. OK, blocking all CPUs is
much worse than blocking one CPU. And it might be reason
to accept this patch.

But you might be able to create an artificial reproducer which might
trigger softlockup by any printk() called with IRQs disabled. And
we do not want to convert all printk() calls to printk_deferred(),
definitely. We need to define a boundary.

Note that the preferred solution is to:

1. Convert console drivers to NBCON API which would defer most
   printk() calls out of box. There are only few selected
   emergency situations when printk() tries to flush even
   nbcon consoles immediately. But even the emergency flush
   is bound against parallel writers.

2. Reduce loglevel so that only the most critical messages
   are flushed when slow consoles are used.

Note that there is pending also a patchset which would allow to
set per-console loglevel.

Best Regards,
Petr
