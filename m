Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859215;
	b=AZvKsMXUlTHGaGDU4y6cMIPN1bf4jabknLnxRrTe/xo2NQaDPSPNyv9hQw+fM+lBx/Z+
	 FssAOyulbrlWPNs0oOX4U8LtIXnR+CQz5bNOGxB5DrD78mQChgAdQtQZn4wqk5YPw+oY4
	 2LZRtfdMsGx/Ll7gteIhlccQKwX56HB66Q6BqLqEGvksfTZXZ0dp7QlD2XkvCtsBcve/L
	 UeHaMMKFvZ0bEh6LM9ISpz4mn9zard695Q9GdOeoWVsZ9kmkPwSkHncUE3ppUBSXRrFAS
	 qqjUtAFZUro+Ip1ZvQTjcgu7bFpNAmM8hNlcHdloxdg+p1eP2OVoBYKY4Tj0LCl2Pig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fgYoS8Jg+X3AS3gIOJEgllVRt0eGZvLJAbdMyeSaVoE=;
	b=kE/hMhUDiV6A2DNFGYIp1JRtUZ++RYkTpgwr8AmhlWqtRzuxx8oAv/Q7+DKOEUdhipGs
	 jgNGusZqTdG4Xwfjei/SKU3Iv/ZwNk73MnFoSleGI/m0ee+H1ThPuWUw1UN+Gf51CLLEt
	 Y7x1BJcoXKu2qUizt9uydChm0oEnMSbG3UKsWiJn96m8+gANvqbb4zsCMUTxYK+7irkSX
	 S7KDHLhdCjLn+298Vi4/fF3Y+W0HLq4LEMU/Vn3WsK3yBa+ZFCZGSiPOmG6gXWBzgDoBJ
	 5uQGWhOi86vt7pl4Sqy9tVobT8+bBo2EuR4monTBjnvdTgOgV6AImcFAdNBMMDVZKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GLEa6lZ3;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A134606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A134606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GLEa6lZ3
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso15495105e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794859212; x=1795464012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgYoS8Jg+X3AS3gIOJEgllVRt0eGZvLJAbdMyeSaVoE=;
        b=GLEa6lZ3l5jEVkJ1iIrvEfG2TgdUgonBjU8VFEoOyLYYiH1PA567+I3hxHvZ3rwGI6
         YoPb5PqhoCNdavSKQ0uzSLFFzC4RfKdXlPB/WLvj1Psbm9tzRaTFJTClEjMpF00RFfAv
         PsWx0Zp8QNjsZWOAtd6F14NGe5Jqo/vbHxOCPUz0JoM/ATPV0XusWXmAPvors+BRbiAS
         3mRGIovOSqoRnNWf5fNbHJhARZ1WsW/d817SY85s3px8OnE1RgIFazCXWFdjZLMPdlbD
         uABeRypIKFPVrlOCvAx1amb/SiZ3Ex5pNTmKzFoY/q3Mv3bmR3FYwSSJug77owftYMO4
         71Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859212; x=1795464012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgYoS8Jg+X3AS3gIOJEgllVRt0eGZvLJAbdMyeSaVoE=;
        b=vx0y7DXcWlsznBtU7bg6BhwWzArLX3yKIQL3xETzl1cCd4BsHkkhatplJmWlYgw6Op
         3JL7Qek6jIuO8ejS2oUdRfAuxKR8WgyEPulQVq1XecAyjql4Ggf5cHqcd8tdeBOdNH0N
         QtoKxDHqe6EPYz74O0o9ZAIfdNekQcuO9EqYSjvo3mzx+qySlHV6QlI56FtGJMVNhbm/
         1uvLmUxJ15Kerzp7ztn05jVqAJwvJXAOciBQSSUU8/1KM2YFm98iaoEmCf0kWevioGPd
         +nNE60/IRCFCrF3mssVwavdwFbvVq0lQKkKT6HUWWczWQSCh9ayXQbWQtxi6wKF3lkOX
         FS4w==
X-Forwarded-Encrypted: i=1; AL+hErFqGzwdPvLhcJdtyF4GPxlH4pqnDCqBK40VoZqyatyLTfzAZQHr7UruxWqu/kr6lIbh+HQdOd0ekHEfn9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z92zU98UP0gFAbeh+OKBu7CxSPXlndUX14JdTEp6wZD0wpp8Cmf
	zdnMUxjTw2F7JgadutV0skGbG+pJF2tWmgXVfH1Azx+9JaOp9BgTu8e+R136W4IWa9k=
X-Gm-Gg: AYBFou31mJ4JXkjxld2Of4mKdGctWcFGBdbOE2zrIxYelxyqVF3K2Ld1bJM1DRab72p
	pku+a+n7ZsVT+jvG/8BBdpN96AyEJhHzJ13JcH/u4jcURcSq+XE9BsswZM5PVKDZhxndvDlLSbw
	Ld4HfXQUE4riMhdSHc8PyVADFRY51q7nMnoaAARH7skyPUpJTqlMgYgD98+E2/Xs4O7HZOOjTrp
	B4env6o72pQhaym+GsU/Ll3DdcZgPsso7p6QjsY0MfxQJynwt9f+7GPPOuN8P9vnBKIUManCYl4
	azbaLzDWsnFQlqgMaCD+c5+L1+f8JzyTleEpwuUNthUE/WaU4fCZGKreIFYuaEkLDGiAXHdpEyW
	gUnes0er19//EXJNV0IwG7cfAGQDMV9IPs+6yJDr88JJ/8wClV15G8f6nfcSyNF2yMVBDBaVyqR
	4SyIGq0y3uiZJGB6NfZLBAyplC/TROGCgtBw9nrMi0gHDCg0Ml3V02p6EHDN8H2ql4wNKdyA8Ep
	APTmzgcbiQRtULPtUxTRqOPAjMDBYHs8Kvyyw66MmhgKImWbpvlzlORO86pydwS4a/YXli4c1ZT
	7zWVeoI43yA2wxR1i5NSgh/LWiJY+mc=
X-Received: by 2002:a05:600c:8709:b0:4bb:73ad:c1f0 with SMTP id 5b1f17b1804b1-4bb73ade318mr72004685e9.23.1794859211890;
        Mon, 16 Nov 2026 12:00:11 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm14032225e9.1.2026.11.16.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:00:11 -0800 (PST)
Date: Mon, 16 Nov 2026 21:00:07 +0100
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
Message-ID: <avtgx3WkeDvn7zoK@pathway.suse.cz>
References: <20261103024453.922373-1-atomlin@atomlin.com>
 <20261103024453.922373-5-atomlin@atomlin.com>
 <avs4igB_mEc9U-Yw@pathway.suse.cz>
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
In-Reply-To: <avs4igB_mEc9U-Yw@pathway.suse.cz>

On Mon 2026-11-16 18:08:31, Petr Mladek wrote:
> On Mon 2026-11-02 21:44:52, Aaron Tomlin wrote:
> >     2.  Ring buffer tail pinning
> > 
> >         Provide printk_mark_panic_start(), printk_clear_panic_start(),
> >         printk_freeze_tail(bool), and printk_is_tail_full(). Recording
> >         the next reserved sequence number at the start of a crash (or
> >         clamping to prb_first_valid_seq(prb) if the crash output itself
> >         already wrapped the buffer) allows data_make_reusable() and
> >         desc_push_tail() to continue recycling older pre-crash records
> >         while refusing to advance the tail past the pinned crash
> >         sequence number. Once the watermark is reached, prb_reserve(),
> >         prb_reserve_in_last(), and ftrace_dump_one() finalize the last
> >         record and stop reserving descriptors or consuming trace entries
> >         so the primary crash context and remaining trace buffer remain
> >         intact.
> > 
> > --- a/kernel/printk/printk_ringbuffer.c
> > +++ b/kernel/printk/printk_ringbuffer.c
> > @@ -377,6 +377,90 @@ static struct prb_data_block *to_block(struct prb_data_ring *data_ring,
> >  	return (void *)&data_ring->data[DATA_INDEX(data_ring, begin_lpos)];
> >  }
> >  
> > +static atomic64_t printk_panic_seq = ATOMIC64_INIT(U64_MAX);
> > +static bool printk_tail_frozen;
> > +static bool printk_tail_full;
> > +
> > +/**
> > + * printk_mark_panic_start - record the ring buffer sequence at crash start
> > + *
> > + * Pin the next reserved sequence number at the beginning of a top-level Oops,
> > + * fatal warning, or panic so subsequent tail freezing can recycle older
> > + * pre-crash records without overwriting the primary crash output.
> >
> > + * Context: Any context.
> > + * Return: true if this call newly pinned the crash start sequence from
> > + *         U64_MAX, false if a crash start sequence was already active.
> > + */
> > +bool printk_mark_panic_start(void)
> > +{
> > +	s64 panic_seq = atomic64_read(&printk_panic_seq);
> > +	u64 first_seq, next_seq;
> > +	bool pinned;
> > +
> > +	do {
> > +		first_seq = prb_first_valid_seq(prb);
> > +		if ((u64)panic_seq == U64_MAX) {
> > +			next_seq = prb_next_reserve_seq(prb);
> > +			pinned = true;
> > +		} else if ((u64)panic_seq < first_seq) {
> > +			next_seq = first_seq;
> > +			pinned = false;
> 
> What scenario does this handle, please?
> Why do we need to move the "pin" when there are concurrent callers?
> What happens when the original caller clears the pin and
> the other racy caller continues with panic()?
> 
> > +		} else {
> > +			return false;
> > +		}
> 
> 
> 
> 
> > +	} while (!atomic64_try_cmpxchg(&printk_panic_seq, &panic_seq, next_seq));
> 
> Are the atomic64 operations safe in NMI? I would expect that they use
> some locking.

To make it clear. I think that it is not safe on 32-bit system.
This is why we used 32-bit lpos values internally in the ring buffer.
Also we use struct latched_seq for "clear_seq" in the printk code.

> I am afraid that we might need another approach.
> 
> IMHO, it would be much easier when the caller knows whether it will
> panic() or not. And the panicing caller would just freeze buffer so
> that the next_seq will always stay there.

I know that your proposed design make the new API easier for use.
You just remember next_seq at the beginning of a potential panic()
message. And you freeze the buffer when you realized that it really
ended in panic(), ...

But the proposed changes in the printk_ringbuffer code look complicated.
They are not easy to review, definitely.

I feel that there must be an easier solution. For example,
desc_push_tail() reads the state of the tail_id descriptor
including the @seq number. It should be enough to compare it
with the pinned sequence number and return failure when
it is greater or equal.

One more variable might be set when the pinned sequence is reached.
And prb_reserve() might then always fail at the very beginning
when we could not make any more space reusable.

I am not sure why you touched so many other locations. I guess that
you wanted to allow saving short strings when they would fit
into the remaining free space. But I think that it is not worth
the complexity. This feature should be used with a big log buffer
so using few more bytes is negligible. And it might even be misleading
when we store some random short string later.

Best Regards,
Petr
