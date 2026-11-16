Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866459;
	b=HSfVysZPoMRo2YHTPeT/myrwaGun/FDx0x5VOry4gqAUVVmNx8RBZW262rlb8/ovmWCA
	 rFwBpIEDO1SsShxkWLMRXFFrL3dJayVJ83JbuUPhokJjUKdef38C2Z3Od55knPlbfNTSk
	 YJ0jdnjOwsBE33u9htir+LNpbjvk+AVL0igu+1e1bhGAgogKFciSG/ISfWw1oFYXKjWkM
	 DTpOXI7r0Y3weIl3j7WOjiWZqkEJzHx1eiYPgHYX3XPdcRcx3gCqd58LJlHLYhr4Rvw0q
	 0aUulkZW4Lg0SDPRyZE0YHtbhIvpTW0YGFLWSfthFDe3qrdNTFx4sCJXEjJSrn2Hp8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866459;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=oq7/QJvgsIGr3vI4LiXKymjwhbWAjvsBsJsLOljo0Qk=;
	b=MxuDTBgLtENd7VPGD66pgGIqimMYnntWDF7T739fJQ78PVcBKm+keYWimr1uNdBh8IxF
	 pE6C3gwgEOAkXrvUPbwY7KS8q2Xt4dHXzG/8pPM1WdU2UMhbJORyTTO1I4hg88BHz2pSK
	 HjnnVhG904t1fLZTX6HWUz97TOMjtg2SnNASkdZLboW8DUCDPbzFuDHE7BG/sT882AN8O
	 P5b/QG/hhiAc8yn7krECrzOjrLog1mvqDQw6hSHujPLRsapGXvfaZJExWJyr6MMCw3Vkq
	 EebHsS3hR4WiDmO6JF2GqQeVJAjkqZpnNMh3UFlpJQWfBPSK+7nYUlzINBG2kdwnzmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dph+lEn9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ntv5hXq+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA13606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dph+lEn9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ntv5hXq+
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794866456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oq7/QJvgsIGr3vI4LiXKymjwhbWAjvsBsJsLOljo0Qk=;
	b=dph+lEn98b4l983dVMrnV6uUQ6MyRGMhGkjDWA6llxSjvwEicw/hW8eISy3XxtlKnvaqM1
	cwZoFth4XPz20+FpJNgcBOZbjsXRnpQ+HNno+aAQ1bNnSfgrDDTt0QYPjCWUjpb3jgv6qA
	zao+0kctxY/LTxAfeUFzVYyCkARaPsEUblIt+k2Yp8pv88cxjahDdTPufiMi69DtHu216G
	MJLJxlhrK0z2jqYU78VTJ9VUjDc9Xa3hhCJg265+x4wwFo2c2xPZywtsy3NSAI/9UQ7oHf
	SiHp0qdv38GmVE6x9TvKtJPIjE5CuMxeMh4dpIJpxGkxdGS3Izi7nkAl8KNxxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794866456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oq7/QJvgsIGr3vI4LiXKymjwhbWAjvsBsJsLOljo0Qk=;
	b=ntv5hXq++k9se6cqF91UGrnVqvsbVNmLuu+7rx8ySKJCAPfKpk9drPL6RTK/l0lCyBZ5N9
	NYzJKsxS/hplJSDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, Breno Leitao
 <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v2 2/6] console: Introduce unsafe flush policy flags
In-Reply-To: <avc4GVqYdpL8r3Un@pathway.suse.cz>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-3-john.ogness@linutronix.de>
 <avc4GVqYdpL8r3Un@pathway.suse.cz>
Date: Mon, 16 Nov 2026 23:06:56 +0106
Message-ID: <878q2sxwpz.fsf@jogness.linutronix.de>
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

Hi Petr,

At the end I suggestion some simplification. But I want to address your
questions so that you understand my reasoning... even if we decide we
will simplify things.

On 2026-11-13, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/include/linux/console.h b/include/linux/console.h
>> index 06d01f1743512..beb1ee04535b7 100644
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -194,6 +194,29 @@ enum cons_flags {
>>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>>  };
>>  
>> +/**
>> + * enum nbcon_unsafe_flush_flags - Unsafe atomic flush policy flags
>> + * @NBCON_PANIC_FLUSH:		In panic, unsafe flush before kexec or reboot.
>> + * @NBCON_PANIC_PRINTK:		In panic, unsafe flush on each printk().
>
> Do we need to distinguish between flush in printk() and an explicit flush?

Please keep in mind that these are _per-console_ policies for _unsafe_
flushing.

> IMHO, there is no reason. We usually call the explicit flush because
> we want to trigger it. But printk(), called in the same context,
> should trigger/do it as well.

Let us use an example: A panic backtrace that is followed by a
restart. In my example I have a safe-atomic 8250 UART console and an
unsafe-atomic netconsole.

If we handle printk and flush the same, then what are the choices:

1. I can choose to enable unsafe-atomic netconsole printing and attempt
unsafe printing each line of the backtrace as printk() is called. This
risks hanging the system on the first line, and even via 8250 UART I
only get the first line.

2. I can choose not to enable unsafe-atomic netconsole printing and see
the full backtrace via 8250 UART but no backtrace via netconsole.

My motivation is to provide a third option:

3. I can choose to enable unsafe-atomic netconsole for backlog
flushes. Then I safely see 8250 UART output per line and right before
the restart, the netconsole unsafely prints the backlog.

>> + * @NBCON_NORMAL_NOTHREAD:	During normal operation, when printing
>> + *				kthreads are unreliable or have been shutdown,
>> + *				unsafe flush on each printk() or on explicit
>> + *				flushing.
>
> Do we need to distinguish between panic and non-panic paths when the
> kthreads do not work?
>
> IMHO, this is more about that the system is going down and the
> kthreads do not work.

There are multiple non-panic paths when kthreads will not work. Some of
them are because the kthreads are shutdown. Others are because it is an
immediate trigger and the kthreads have no chance to act. It was a
mistake for me to group both of these together because although one is
truly normal, the other is not. I will talk more about this below.

> Also what about emergency context when the system is about
> to continue?

I do not think it makes sense to offer this policy. We cannot be unsafe
and then expect the system to continue correctly.

>> + * @NBCON_KDB:			Unsafe flush kdb output.
>
> OK, let's assume that we want to set a policy where we allow
> the unsafe takeover in the following contexts:
>
>   NBCON_ALLOW_UNSAFE_NEVER
>   NBCON_ALLOW_UNSAFE_RESTART
>   NBCON_ALLOW_UNSAFE_EMERGENCY
>   NBCON_ALLOW_UNSAFE_KDB
>
> , where
>
>   + NEVER might actually allow it when explicitely enabled in
>     nbcon_panic_flush_unsafe(). The word "never" just has a simple
>     semantic in the context of the other values

We do not need a flag to mean "no flag".

>   + RESTART would allow the unsafe takeover in printk()/flush()
>     when the system is doing halt/reboot/crash_kexec...

Above I talked about printk vs flush. And IMHO it is important that
users can distinguish between panic and non-panic (even if non-panic is
a kind of emergency... for example sysrq-b).

>   + EMERGENCY would allow it even in NBCON_PRIO_EMERGENCY context.

This does not make sense if normal operation continues (for example from
a WARN()). But it makes sense in the reboot context (sysrq-b).

>   + KDB would allow it in KDB context

This was not actually requested so we could drop this policy for now.

> And I would get the context the following way:
>
> enum nbcon_allow_unsafe get_nbcon_allow_unsafe_request(void)
> {
> 	enum nbcon_prio prio;
>
> /*
> 	 * The kdb check is copied from vprintk() implementation.
> 	 * We should put it into a helper.
> 	 */
> #ifdef CONFIG_KGDB_KDB
>        /* Allow to pass printk() to kdb but avoid a recursion. */
> 	if (unlikely(kdb_trap_printk && kdb_printf_cpu < 0))
> 		return NBCON_ALLOW_UNSAFE_KDB;
> #endif
>
> 	prio = nbcon_get_default_prio();
>
> 	/* FIXME: What about SYSTEM_SUSPEND?
> 	if (prio == NBCON_PRIO_PANIC || system_state > SYSTEM_RUNNING)
> 		return NBCON_ALLOW_UNSAFE_RESTART;

I do not agree with putting panic and non-panic under the same policy.

> 	if (prio == NBCON_PRIO_EMERGENCY)
> 		return NBCON_ALLOW_UNSAFE_EMERGENCY;

Too dangerous if the kernel is not ending.

> 	return NBCON_ALLOW_UNSAFE_NEVER;
> }
>
> IMHO, this better fits the existing terminology and design.
> And it should be much easier to understand by developers
> and users.

...

>> + *
>> + * NBCON unsafe atomic flushing always occurs at the end of panic() before
>> + * the kernel enters an infinite loop. Users may choose to perform unsafe
>> + * flushing in additional scenarios where the current kernel is ending in
>> + * order to increase the chances of seeing console messages, even if it is
>> + * not safe to do so.
>> + */
>> +enum nbcon_unsafe_flush_flags {
>> +	NBCON_PANIC_FLUSH	= BIT(0),
>> +	NBCON_PANIC_PRINTK	= BIT(1),
>> +	NBCON_NORMAL_NOTHREAD	= BIT(2),
>> +	NBCON_KDB		= BIT(3),
>> +};
>> +
>>  /**
>>   * struct nbcon_state - console state for nbcon consoles
>>   * @atom:	Compound of the state fields for atomic operations
>> @@ -326,6 +349,7 @@ struct nbcon_write_context {
>>   * @data:		Driver private data
>>   * @node:		hlist node for the console list
>>   *
>> + * @unsafe_flush_flags:	Unsafe atomic flush policy. See enum nbcon_unsafe_flush_flags
>>   * @nbcon_state:	State for nbcon consoles
>>   * @nbcon_seq:		Sequence number of the next record for nbcon to print
>>   * @nbcon_device_ctxt:	Context available for non-printing operations
>> @@ -461,6 +485,8 @@ struct console {
>>  	 */
>>  	void (*device_unlock)(struct console *con, unsigned long flags);
>>  
>> +	unsigned int		unsafe_flush_flags;
>
> I would call it:
>
> 	unsigned int		allow_unsafe_policy;

OK.

>> +
>>  	atomic_t		__private nbcon_state;
>>  	atomic_long_t		__private nbcon_seq;
>>  	struct nbcon_context	__private nbcon_device_ctxt;
>
> And the net console would get initialized to:
>
> 	.allow_unsafe_policy = NBCON_ALLOW_UNSAFE_RESTART | NBCON_ALLOW_UNSAFE_KDB;
>
>
> And nbcon_allow_unsafe_takeover would get implemented as:
>
> static bool nbcon_allow_unsafe_takeover(struct console *con)
> {
> 	allow_unsafe_request = get_nbcon_allow_unsafe();
>
> 	if (con->allow_unsafe_policy & get_nbcon_allow_usafe_request())
> 		return true;
>
> 	return panic_nbcon_allow_unsafe_takeover;
> }
>
> What do you think, please?

I suggest only supporting explicit flushing with only two unsafe
policies for now:

- NBCON_PANIC_RESTART_FLUSH (panic-kexec, panic-reboot)
- NBCON_EMERGENCY_RESTART_FLUSH (non-panic emergency reboot)

Only these were originally requested. But I would like to keep the
others in mind because I think they are useful for certain scenarios:

- NBCON_PANIC_PRINTK (printk() calls during panic)
- NBCON_KDB (printk() and flush() during kdb)
- NBCON_NORMAL_NOTHREAD (printk() and flush() during normal kexec,
  reboot, shutdown)

However, I still think it is necessary to include context in order to
properly evaluate the policies. I do not see how this can be effectively
implemented without printk_trigger_flush() receiving a @reason argument
to provide context. CPU and system states are not enough.

You have given me some new ideas. I would like to post a v3, also to
address the mess I made of legacy mode (pointed out by Sashiko).

John
