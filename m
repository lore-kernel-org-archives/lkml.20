Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849625;
	b=SyqJ9WtsPOoPk/mNFRiM8CQTAiDmFBFKY1ZNwnXgXLJIpyEAirPdXZ8tNLN6aNfQ/18K
	 2fbsT5r0Gomt3AHYOrDCnUynUSz8YqummCFFlPZdKgXHViZ7j9YI6P6xL2p7B7DKEfW4x
	 fhY6DFaliiYrPLsrpDm2dhWq5fcpJgZ8lfHHwbODksiJpJTBDUbhWo8xmhcb8aAaQwx6U
	 LnOow8lp4MVU5ad/4lksJYE8v/g9bL0iOJf3HILV4RAbpe7ZpP9bBBSMW0rmkbywvXdxR
	 6GNUZCARsMVu4wBsUu4TGorMpX3O/tBT0GWmqFTXHyXK246yNRASJGyK69DZsyMXdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849625;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Uhn3Xh440rrzv0xOTkiny4cGS6bsXvzVeqcYJ4nwTDs=;
	b=h3ODBnrmiEfzKALd0fdn1BCWMy7dHL2rFAtSm7J7RTqiHhQKG9LiDExVHmDzMhK2RvqN
	 1MHYvreU0E1wSOpVvuV3pixcae6YltcPqPtECs+XwUSxo07cbdRkgx5md9+hJ5aFwCjdm
	 +CBQaHjVNOgLwZhJEWSMMIk8O8i41tHq3Z0Vj48HkvWs9/Et/Qx/jEZsj/vLboSXvwIAZ
	 ZF6y2jMA1WrUHf7r9fMO4UaEa4bIoqmTrU98z0fhKaqaVLFv6X7oJqwPRtZVB9BgOJOmw
	 XTBsY5XJEEQfxSjHJZlpiMW4F+qsPHJbfKarTHd03Ubh4A32mCOSlfSoKGmqtxvf2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aX5WK4VM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IwT+AooZ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53300606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53300606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aX5WK4VM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IwT+AooZ
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794849622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uhn3Xh440rrzv0xOTkiny4cGS6bsXvzVeqcYJ4nwTDs=;
	b=aX5WK4VMEnjF9i1VKVQSHFX2GLhbxsGh0rUUEpq16akWX/oza8TC2x4U2Wc5M2cea5s+pr
	FG7n6wly3PaZ/Mq8S4XaUkpXwJXmNwINcQe529CM2y8TtfwdUsQI7umWEMC/Y6npD4Rv5b
	NKWunLOmi55uB+seqegTvmwiHNVscAexBW+ovmpj5P+GxXl0MDs14cFZ1Vso7OS8RUyUxE
	CMJFtuouBK/6+19icelMId62QdTq41y3v+LEABahmYc2lUj3TT9bSVBO5W49uxQurGRjp+
	JzpHZoiHSeL3p9a67NtjbjE0DjZmidChXhXxBYZxCcPAa1JbWT3+OPcJ41ujFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794849622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uhn3Xh440rrzv0xOTkiny4cGS6bsXvzVeqcYJ4nwTDs=;
	b=IwT+AooZ8H8ysTr1pAwAVYo/Aex9uA3/+R34PP1Hz0Mquv2Mb6PM8k4ReFej4Va7RWRgfC
	3kUcg2AomgSL65DA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Andrew Morton
 <akpm@linux-foundation.org>, Mukesh Kumar Chaurasiya
 <mchauras@linux.ibm.com>, Feng Tang <feng.tang@linux.alibaba.com>, Rio
 <rioo.tsukatsukii@gmail.com>, Bradley Morgan <brads@mainlining.org>, Pnina
 Feder <pnina.feder@mobileye.com>, Gal Pressman <gal@nvidia.com>, Petr
 Pavlu <petr.pavlu@suse.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 Oleg Nesterov <oleg@redhat.com>, "Cen Zhang (Microsoft)"
 <blbllhy@gmail.com>, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH printk v2 1/6] printk: Introduce and specify flush reasons
In-Reply-To: <avcnSjj2P9UfsBn7@pathway.suse.cz>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-2-john.ogness@linutronix.de>
 <avcnSjj2P9UfsBn7@pathway.suse.cz>
Date: Mon, 16 Nov 2026 18:26:21 +0106
Message-ID: <87cxs4y9pm.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-13, Petr Mladek <pmladek@suse.com> wrote:
> This entire patchset adds a lot of complexity just to enable all
> 4 new policy flags for netconsole in the last patch.
>
> There already have few dimensions which affect console flushing:
>
>    + console_loglevel
>    + nbcon_prio

"Dimensions" is the correct word. These are orthogonal:

  + console_loglevel: which messages to print
  + nbcon_prio: which context is allowed access to hardware
  + pr_flush_reason: reason for atomic flushing
  + unsafe_flush_flags: policy when unsafe flushing is acceptable

I do not see a single property above where a value in one implies a
value in another.

> This patchset adds 8 new terms in pr_flush_reason and
> nbcon_unsafe_flush_flags just to explicitly set all
> flush_flags in netconsole.
>
> Let's start with pr_flush_reason. I am not sure if it is worth it:
>
>   + PR_FLUSH_RUNTIME is the default
>
>   + PR_FLUSH_RESTART can be detected by system_state > SYSTEM_RUNNING

This does not cover the panic-restart case.

>   + PR_FLUSH_HANG has only one caller currently distinguished by
> 	the global panic_nbcon_allow_unsafe_takeover

In my series there is another user:

arch/loongarch/kernel/reset.c:machine_halt()

>   +  PR_FLUSH_KDB can be detected by kdb_trap_printk and
>      kdb_printf_cpu, see vprintk() implementation.

Ack. PR_FLUSH_RUNTIME could cover this case.

> IMHO, it makes things worse because nbcon_atomic_flush_pending() has
> to use PR_FLUSH_RUNTIME in vprintk_emit(). But I think that we
> would like to flush it the same way as an explicit flush called
> in the given context.

You write it backwards. vprintk_emit() uses
nbcon_atomic_flush_pending(). Calling printk() (a single record) is
quite different than calling printk_trigger_flush() (flushing a
backlog).

Let us discuss this after I respond to your comments on patch 2/6. There
you include many details and suggestions that require closer inspection.

John
