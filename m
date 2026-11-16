Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848914;
	b=qyI1p0OWWsf6Il1fWMrcHKTh82Z60fHAP+TZYd8KwNGsGyXoGLKIhnBzki7sVX8E8gZb
	 daeiRJFe8HIewsluWSuNDNT6hVbh1Sao95MQRRwqrsujNG13zzkDaI2IlKtlu7bo9qdMe
	 ZNVj7LdBdt9wTsZ0v9iQm84z75SBwZNYE5O7tt4og0U3CxCY4Pq14iBY3DfKAf0QsKD2v
	 pUIlK36aqUzRKHhnq52tnbPuEhyXnURnLk89ZRgvz6WEKjifAg8JYIOgKmAHnWv3SeyPX
	 YIGT5KV4SL+C7cmi/Qdpe51aTRzs10oykIrSYJpk8Bn9yPoIoZ/96TFZGpy5ZplIxzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z/lO0d4awc7COFA/57IeDRMAZfL8lXDL1xwEp8NDS/0=;
	b=Ac8lLpe08DEV5Fem2D7iZpHxoujm/ZTgzKXNY2t50stzTKt8fG514dC4kkcBD00zQ0Lw
	 OQb6fkJjpbBLFMs8BLlbDm05gHcnzDyE551s62Kvk/+4+n7FWs5+gpzdriebkVRbYK+W1
	 VEbH8QNKVxgMB8zblPsB7GSAx71Ik5o0EFX4AEq0lFcCQdq0heUZmH0ZJUW3TZlwIIwrW
	 xFiTj5uOgIkYahg701iXn2UJLRO8r5URvxQX3iFw53cAHsL7DdPc2FSyN1cqi2fb6jrzB
	 51AqWxs6XZ3Sfty61h3k1bTXLtcABtDB4NnCDeJ8SstYbYWR28lto4WT5q2eXzlZlig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ey7AZ+Zk;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C4606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702C4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ey7AZ+Zk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so30700685e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794848912; x=1795453712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/lO0d4awc7COFA/57IeDRMAZfL8lXDL1xwEp8NDS/0=;
        b=Ey7AZ+ZkFFq27QRb5ss7YWBng2ZMQ3j1wzKQijz0gEmSQtB5G7cV7W2CSe+1bKAKpb
         2/9rgiYbBd8iuZwF44uPq48BXRiVp1VYYgae7s7u5X5NKz7rwMEOvjx1MJ6JXJs1w4KA
         hzo+SXFB4IG1b+2HSmx0Sfh/xZD+tjg4km32oyf0hDm/3iYQe0LqKPwl90xvHcoZSP0K
         4KYZJPSExtGJGXVZJIHkrb71LTJdMxOsGCUFEgCxnYZOfWVmKIKg21R7klmwcGHh94B+
         AyEQNk+zQx+T9ionWibHQ3ItgEI5ocKZCioaWcY9QtToa8W8ngo0rBAA+fnWiSg8MmuD
         2Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848912; x=1795453712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/lO0d4awc7COFA/57IeDRMAZfL8lXDL1xwEp8NDS/0=;
        b=o9G6LlesYoQSg8rIB5QBBWEBzHfkLViVVoQY045RRO/87kjVPnbiDNBPkfd8EYtE8v
         Cfm60W1HnviLi9VvzOsDK094SPKElw6VB2w3AZ6dAYYMpdIIj3HyQoOxsagMqpf5gTbH
         E8dvpb9wrn3hLr9h1Iu/WcPcC3tY2m2C3aBe7Qu9JRplLD/tvWU9mjqNdDRh4PKJZ4WQ
         kqid5pDy2iwbiTStyjrCNvgM29314mKl/Iku7faioHdLhJCRHuaK4D2pvBn0jIe6KNVD
         D/K97TDewtisB9xODef61rfrP1IRaOkHimA/C9I5P1PNKtA3DVs0xgDyYhUGAxKvX/Nv
         3nbQ==
X-Forwarded-Encrypted: i=1; AL+hErFb92HLTHw9Z2yUeCSLfAb4XxZkxamhix0m218WebTPsIlmT8RuhaN0sNI1PotWWDasanAO0meQBsB5JJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WpUbuQO64AOgedgBhi09t+WGOpAqeuYNrE0nVBAuMjHiW2UZq
	KtpyyedvZwzwdID7xUYZj6rpDOWQMVVW1XrkY5AUvkBhk+SN5oi9+zldAgJ5r4ekkRE=
X-Gm-Gg: AYBFou1aOrKARi9ORBMgsoZkNw0TUO5QGrpNfxyukdn4plJ2m8zGoSSvsmjzWWVhS9f
	0hmDTqnIhB2TSeC9BiBjwGZO5UUpaOemRaFkxy+uEHhrORzQAYxel77R9ekkCI82lNskPDWONig
	zwtMrE9rUW/kYlRe+k96tzpA+WJLVEMJjiEQxpfwtdwx81KR/gR6k2A1zK3758BcQs9cYZegJN7
	xgiT+QK87MCZln1eluwOlXKJMf104UUcjUGmrauTAnnoYn8CGhV4NtpgWGjsQGRza7AuKcQiK68
	26b13aEpp60IaV/iBSUKlKTjoyHRGD3S5rNeLp7K4Av7g+Bn4T6L4yxGm4dUAI4t/h/EZWr8A+r
	+ibhDZnqHCjEcOTUo7dDAI/RcYdNICY6pgu+bADubTNwhGl93hAqVgLxY4z46HE2Fi50IorbCSL
	f0ydEs6lhTfdziPXvm6i/rpsyBC/eIPzVBIxOnkCmraXD1TBN0Us9UUedkn37H0Lmq72Ng1RVCA
	2K24tjuQ80Z8JdnisEBbScx5KFhZWzr8tKU4xgBEEy39luCILmZ/DMoyFtkGjJPtVVZjb4x8/2T
	UptKN78sF3O3yXj9asoaVcBKZesyfDw=
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr97325545e9.6.1794848911805;
        Mon, 16 Nov 2026 09:08:31 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm22964108f8f.18.2026.11.16.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:31 -0800 (PST)
Date: Mon, 16 Nov 2026 18:08:26 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, kees@kernel.org, anna-maria@linutronix.de,
	frederic@kernel.org, tglx@kernel.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, brendan.jackman@linux.dev,
	hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/5] printk, tracing: Support console flush
 suppression and tail pinning
Message-ID: <avs4igB_mEc9U-Yw@pathway.suse.cz>
References: <20261103024453.922373-1-atomlin@atomlin.com>
 <20261103024453.922373-5-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103024453.922373-5-atomlin@atomlin.com>

On Mon 2026-11-02 21:44:52, Aaron Tomlin wrote:
> When collecting high-volume diagnostic output into the printk ring
> buffer during a kernel crash prior to kexec, synchronous console
> emission can stall the panicking CPU for tens of seconds on slow serial
> or IPMI Serial-over-LAN links, risking external hardware watchdog
> resets. At the same time, uninhibited ring buffer rotation can wrap and
> overwrite the initial Oops, faulting registers, and primary call trace.
> 
> Introduce two scoped mechanisms for in-memory crash telemetry
> collection:
> 
>     1.  Console flush suppression

Nit: We already use the word "suppress" for filtering less important
     messages on the console, see suppress_message_printing().

     I would prefer to use another name to avoid confusion.
     We basically want to "block" or "pause" consoles here.

> 
>         Provide printk_suppress_console_flush(bool) to clear the console
>         flush mask in printk_get_console_flush_type(), guard legacy
>         record emission and kthread wakeups, and suppress
>         wake_up_klogd() in vprintk_emit(). Records written via
>         vprintk_store() are stored in the in-memory ring buffer while
>         bypassing synchronous hardware console emission and kthread
>         wakeups.

We already have similar infrastructure for suspend, see
console_suspend_all().

We should not use a completely different aproach to achieve
the same. It would just complicate the code and design.

I suggest to add CON_PAUSED flag and handle it similar
way as CON_SUSPENDED flag. It should be enough to:

   + update console_is_usable().
   + add console_pause_all_in_panic()

, where the console_pause_all_in_panic() would do similar
things as console_suspend_all() with the following differences:

  + no flush
  + take console_srcu_read_lock() instead of console_list_lock()
  + no synchronize_srcu()

And I think that it will be only a one-way operation. We do not
need a resume part.


>     2.  Ring buffer tail pinning
> 
>         Provide printk_mark_panic_start(), printk_clear_panic_start(),
>         printk_freeze_tail(bool), and printk_is_tail_full(). Recording
>         the next reserved sequence number at the start of a crash (or
>         clamping to prb_first_valid_seq(prb) if the crash output itself
>         already wrapped the buffer) allows data_make_reusable() and
>         desc_push_tail() to continue recycling older pre-crash records
>         while refusing to advance the tail past the pinned crash
>         sequence number. Once the watermark is reached, prb_reserve(),
>         prb_reserve_in_last(), and ftrace_dump_one() finalize the last
>         record and stop reserving descriptors or consuming trace entries
>         so the primary crash context and remaining trace buffer remain
>         intact.
> 
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c
> @@ -377,6 +377,90 @@ static struct prb_data_block *to_block(struct prb_data_ring *data_ring,
>  	return (void *)&data_ring->data[DATA_INDEX(data_ring, begin_lpos)];
>  }
>  
> +static atomic64_t printk_panic_seq = ATOMIC64_INIT(U64_MAX);
> +static bool printk_tail_frozen;
> +static bool printk_tail_full;
> +
> +/**
> + * printk_mark_panic_start - record the ring buffer sequence at crash start
> + *
> + * Pin the next reserved sequence number at the beginning of a top-level Oops,
> + * fatal warning, or panic so subsequent tail freezing can recycle older
> + * pre-crash records without overwriting the primary crash output.
>
> + * Context: Any context.
> + * Return: true if this call newly pinned the crash start sequence from
> + *         U64_MAX, false if a crash start sequence was already active.
> + */
> +bool printk_mark_panic_start(void)
> +{
> +	s64 panic_seq = atomic64_read(&printk_panic_seq);
> +	u64 first_seq, next_seq;
> +	bool pinned;
> +
> +	do {
> +		first_seq = prb_first_valid_seq(prb);
> +		if ((u64)panic_seq == U64_MAX) {
> +			next_seq = prb_next_reserve_seq(prb);
> +			pinned = true;
> +		} else if ((u64)panic_seq < first_seq) {
> +			next_seq = first_seq;
> +			pinned = false;

What scenario does this handle, please?
Why do we need to move the "pin" when there are concurrent callers?
What happens when the original caller clears the pin and
the other racy caller continues with panic()?

> +		} else {
> +			return false;
> +		}




> +	} while (!atomic64_try_cmpxchg(&printk_panic_seq, &panic_seq, next_seq));

Are the atomic64 operations safe in NMI? I would expect that they use
some locking.

I am afraid that we might need another approach.

IMHO, it would be much easier when the caller knows whether it will
panic() or not. And the panicing caller would just freeze buffer so
that the next_seq will always stay there.

Finally, please split the console pausing and ring buffer freezing
into separate patches.

Best Regards,
Petr
