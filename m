Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844349;
	b=IrUC/Vpf2OEeIyospG46adQ4vAsdV1611fVDI2WnHBtT4DZwAKR36qg9PMtRHyAIpzIw
	 GLm8Tg21qFBlDsRI7rAXRTLVFaiZmW4CXV7ps79Ss7UyFoIHZLe66olOovR9bitSw5PFq
	 xj5yoQt1d6ogVQ3dmW3h8JWQsVojkYsJWDCknkFpgoVDDsHUzywz7FUBkTbi4q7uYrLz1
	 LnDX+JH2KZejVSadsrke8H8Q2OcG2JvaAiEdtdwuBReQO8BSl9HbkAkluc5etyEBfTkEk
	 t4XIIMOHvm2ywWKtMYd5FlskOgKhMF5+mUivIGAV3DOtGtJFEUheOmvrobNGjUZDDSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844349;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=WPIgPkplQXYcdgIP2HZXNUASrSQ30h2/EQrrK2TSh2g=;
	b=ND1cdTkpqm3uwq/glFgLFs6SsoapjFhaMVNsuZtUKAT84gjm9qdIQ8gcLndh+nbOqdQK
	 2hk2ISWPo+LrtTQcGYcsq2nnm3jGRjpdHtCpWxxt8bYGZ9OZuuwxZPgihjlryomKENaqP
	 Qhx+kihiwLQ+a/C18E5eVaUVkcXpETtrWc2KfedhYQ1leNNYK0jgddjSK2AZHBKMXji/3
	 55Dh0ZH73A2gHxLhAruNs4tFluq22N4Img03i3BfExaaXbEKPYz35CV3IMMK6NNHoq39s
	 le0UsAP+NmEqR8PWtskkBsH8GFdXXelDotG8fSlfYbcZ271k3HfGYwoRrCLy4FM2A9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xxGaSkpO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bqJxEwMP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB3606A323;
	Mon, 16 Nov 2026 15:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xxGaSkpO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bqJxEwMP
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794844347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPIgPkplQXYcdgIP2HZXNUASrSQ30h2/EQrrK2TSh2g=;
	b=xxGaSkpOIXcLNPTFf6AkudcAhEr78jeua8vlh/m7m1mxCzy5+2QevqqUFGNwx2hkLUG8D7
	TEM5gRnnLL7STjx78ypyEgHSv1/ax2kOR1fCtMZO1dMQbgjAuAYkavj6Sy7Rhb1ouJYLe2
	tW3NR94LXsr3jmRZRUWXsWTLaDKOO5vOr/u+52EODWHl0q0ZGxxrHDPESeh7B3DDRc6Se0
	t8b5M4Ki8QbLlikW8ZmnA/oI7qUHDxc9ujiks0qXnuX+buv9kX0RKnRJn7oAK5zd2Sf3Cl
	UMPAoLtJMYY0zjt11Oea0ORMysOzGTKfGOMDZXLcgtKW0domVcJ++vWDfaC0dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794844347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPIgPkplQXYcdgIP2HZXNUASrSQ30h2/EQrrK2TSh2g=;
	b=bqJxEwMPxKYdmx2Eo+k88h/knBfiFt4y1s/FS+gZ/VQINVWcad+mfRbyLysUGRy5CiPr1A
	l3QNcb1iXzwkpIBw==
To: Breno Leitao <leitao@debian.org>, pmladek@suse.com, kuba@kernel.org,
 gustavold@gmail.com
Cc: linux-kernel@vger.kernel.org, printk@lists.linux.dev,
 netdev@vger.kernel.org
Subject: Re: [RFC] netconsole: plan for a safe atomic write
In-Reply-To: <avcI9gVR7brRHQSQ@gmail.com>
References: <avcI9gVR7brRHQSQ@gmail.com>
Date: Mon, 16 Nov 2026 16:58:26 +0106
Message-ID: <87h5hgyds5.fsf@jogness.linutronix.de>
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

Hi Breno,

On 2026-11-13, Breno Leitao <leitao@debian.org> wrote:
> netconsole is CON_NBCON_ATOMIC_UNSAFE, so write_atomic() only runs at
> the very end of panic. There is a desired to have called safe atomic
> printing[1].
>
> This is the plan I would like to agree on before posting patches:
>
> 1. Now that we have one console per target, use one lock per
>    console/target.
>    - printk holds the target's device_lock around write_thread(),
>      write_atomic() runs under the console ownership, and stopping
>      a target takes both. target_list_lock and the cleanup list go away:
>      the list changes under dynamic_netconsole_mutex and RTNL, and is
>      walked under either.

This synchronizes the console against itself and the user interface
(netconsole configuration). IIUC it does not provide any synchronization
against non-netconsole usage of the port.

> 2. A per-target field to track atomic writes.
>    - In that mode, skbs come only from a pool popped without a lock and
>      refilled through irq_work.

IIUC the risk here is that the garbage collector is deferred and there
may not be skbs available. In that case, what do you expect to happen?
The printk record is dropped? Or the console disables itself from printk
flushing until some (hopefully) later time when skbs are ready and it
can enable itself, thus resuming the flush?

> 3. A try-once netpoll transmit, as Jakub outlined [2]:
>    - One HARD_TX_TRYLOCK, then busy, with no polling, freeing or
>      wakeups, which can deadlock under rq->lock[3].
>    - It refuses when this CPU owns the queue (netif_tx_owned()), is in
>      the device's NAPI poll (netpoll_owner_active()), or is in NMI on
>      PREEMPT_RT.

Same question. What happens when the trylock fails or it refuses?

As I have mentioned before [4], UART atomic printing uses the console
ownership to synchronize against _all_ port activity. What if the
_xmit_lock had console ownership underneath it (only for txq's shared
with a netconsole)? Then it would be enough to acquire console
ownership.

See, for example, include/linux/serial_core.h:uart_port_trylock().

> This does not make ndo_start_xmit() safe, so the flag stays until
> drivers can opt in to atomic transmit.

IIUC it makes it safe, but not reliable. It is more reliable than
kthreads, which can still be considered a win.

> It is still unclear to me whether write_atomic() should depend on the
> context (regular NMI/panic): 
>  * For regular NMI use the try lock as best effort

HARD_TX_TRYLOCK() is not NMI-safe.

>  * Ignore the locks only in the final panic flush. (unclear if this is
>    an option)

As a final unsafe flush before an infinite loop, this is always an
option.

John

> [1] https://lore.kernel.org/all/874ie4y5mw.fsf@jogness.linutronix.de/
> [2] https://lore.kernel.org/all/20260617132127.645534d1@kernel.org/
> [3] https://lore.kernel.org/all/20260610183621.3915271-1-vlad.wing@gmail.com/

[4] https://lore.kernel.org/all/87tsr1m6y5.fsf@jogness.linutronix.de/
