Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBB4A4407
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540281; cv=none; b=hiM1V3ZYW24H0yv5q7rNhFyq5pOns9riX3F/YYpnSXZpbOR9rK9Cg0kDOZZgFLhLQqjR5Ka+LixgFVXPzyhzyebmEQ8Xh8IEvWD9X0W36Y4E7MQNSqiuurU2eg2K/HCfhk9idBD1VvPgSpVPnJXEL2QyI9Usjjfg0KO3Qea4c2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540281; c=relaxed/simple;
	bh=5yLkz2OZBQ4ipEjXEN7/lCEXtkQpCiwl45030Q1M6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K21634kKaJZyZiQOoGd25UMC6Xq+7XIrsNnp87y0YfmfGi/W+3/Lr1kMgHWIkVYMnxJeBBTEEiyMVvBwGWlZiGks15f5OqJmuSw6HmLlFcvCiRPaEkLi0j/7+pxkHkRQQcNA+oij9MRO+/bGG/XIjyECs31IbWv6kCIiuem1ZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv0bXuY/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv0bXuY/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso64271245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540276; x=1792145076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCfrYFQWaB6ljrpcA5mB+GvPCr6ztXX1INv06kJj6BA=;
        b=Mv0bXuY/dbslJrVlIeMtcxPdMhLIu3/yZLmI50/So5GHoEeQlXlcQKfT0SUHwVk5Kx
         R+6aWsPXaKh/7fFnAtl0/YG7zxU8j2j3kckVubW399a9rtWIpvskoUxAs+X9xngQygCx
         a87s25iG26dO4mAjyHuF+kQ5cJQzgxTIO5J10VcL44URFMev9rQ5ejJNZmdKtmIVQS79
         ueEOTvGWtd0OeaYefX23YBmg4pzUxHliPw8wAeyYfjXk9OmTmGyJvy41qBBG1HPkACTt
         q1rc+IgaRF5GB88OVPs2YFDDbyW2l/GfwVAgW5E6rPwMieA0a+R+g2K8thOHn0su1y/G
         YWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540276; x=1792145076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCfrYFQWaB6ljrpcA5mB+GvPCr6ztXX1INv06kJj6BA=;
        b=hZ3MacE3wYutjCVNWhwFolSubxfZFmQv+uYlk5W300YPRZ1mm+dtrIEAUzYWkg7oD4
         6NawNcYM6avHzUkA1465oFjYqpHfu5wRwveQLvNcgWlnjOr2CxYqM7XFukCE9oI5jbJd
         GIt6kR2yMAhOTVJFSRaGrqIqUf1RoX7ZWou07Zmdi6B9csw03ZmYCgRbhg/3QMyXF8zA
         ycVY9oOqaa/1m/PlBWBM8z2TwUsSud4JAjIlVVHZ3W+IYAozreKN6uQsb960a87bUQvC
         wcE8+qj6GY/t4E0YBkEvpWVvJZDufJUDbf/9+94JE/2AkOKv82MEY5uv+Qkg97ht8TTm
         3KkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG3hEx9tKqPfUYI1HHrHXlSmjtIMEXswMhUX6+FGoZiHAi61mWrZ4VRGM8DTtehLnxTpqiPABehow1CLo=@vger.kernel.org
X-Gm-Message-State: AFuF++nZgpc4GXBctCA73UBUuhc59h5LqqkBr7xM2qVElXnWmCo96l9z
	2v0Hv1TyE20/v96EboVaEQHJtulxPfImjwgcRH1Prr2VhFebOYQ7dEqv
X-Gm-Gg: AYBFou2p1yk6hVgmu8dk9SPe7EBOc6SC2YvaFQfTFcJhEFD1jEIrcoB4GQnKUJGfVdD
	LvImydZWyGK50xUmgM66F2heH58VC+Zt2ci0wlli14dMr5om8aJoZ1qOhsVBMOlQXJnwuE4hKJo
	VOSkBLTmpgR5cmlt3YJUxbzxUN+fJgKxlCf5h4p2xZOTFaQ+hdysYSzxUmE9pPmJqR8ABU60iwj
	RS+hTiwfwOMtFCJOPns6NHKvexwoxdyWtB3knmaTSmG0OJH64bNXn9dphveFMI3EeUjkN493a08
	FJTcjhO8EiCIZ+9ymsuaH/Sh4fR9PCKFQM0pO/6SlUlKZfxsQrPAgvZzpdGTtfoaw5r4pAZlOlZ
	OP1BydFP1akTV2+JPuDRJcWb0tP8lpE+UXXor5sI59UENIB0PTRNyDQslQ3VpoKEoJn1k0QzwWN
	OOEuDfaFhcIB7CDKTo96YHdldyfaygdrXBqy2Xo7+bYuwywmYSTW6iZIrFmU8WFsvn0cQpO3xc6
	UNrJqNnlICYmWZf1oR7+e3pSD9X+6WJjsDkN6xcCjo96465wiOQYTR0Ou0M00V/cR4YbG/5LoCj
	3WqHw95nZiHEZK1g9pEzbSlrsPnxA2VKk/qGjpbnBvOOjrLAPVGg5eQAUB1mMPj/IxwbZKop8w2
	0XtMR65b2+lsAvUU=
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr24842945e9.4.1791540276044;
        Fri, 09 Oct 2026 03:04:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm53382635e9.10.2026.10.09.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:04:35 -0700 (PDT)
Date: Fri, 9 Oct 2026 12:04:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Stevens <stevensd@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on
 RT
Message-ID: <asi6Kj3TcCd6HAM5@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
 <asZ8jmWNoGk5tYce@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZ8jmWNoGk5tYce@thinkpad>

On Wed, Oct 07, 2026 at 07:15:29PM +0100, Harry Yoo wrote:
> > This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
> > trylocks. Atomic acquisition succeeds only from the completely free state.
> 
> Please don't skip discussion stage and jump into submitting a very
> intrusive change across locking and mm, assisted by LLM? :/
> 
> I don't think attempts to tackle this problem will make progress without
> discussing and getting buy-in from (PREEMPT_RT) locking folks.
> 

Sorry, I should have followed up on the additional v1 replies before
posting this v2.

On the alternatives in [1], Alexei [2] preferred detecting
scheduler-lock contexts and returning NULL. He confirmed that NULL
returns are allowed, rejected restoring the local-storage allocator, and
raised the RT unlock/wakeup objection.

I initially tried that detection, tracking pi_lock, rtmutex wait_lock
and rq locks. With RT, lockdep and slab_debug enabled, task-storage
allocation under an independently held hrtimer base lock reported this
cycle:

  hrtimer_bases.lock -> rtmutex wait_lock -> pi_lock -> rq->__lock
    -> hrtimer_bases.lock

I don't know whether my changes introduced or exposed the dependency.
The timer lock was not covered by that guard. This was a lockdep warning
and the workload completed.

I then tried atomic ownership in v2 to avoid that unlock path, at
the cost of IRQ-disabled spinning without PI boosting of the owner.

One possible interpretation of "raw_local_trylock_t" would be preserving
the non-RT local_trylock semantics on RT for short per-CPU cache
operations, with allocation failing when it needs an rtmutex-backed
fallback.

Would that be worth exploring? Sebastian suggested
consolidating the existing local-lock variants first. What should that
cover?

For arena user faults, backing-page allocation failure returns
VM_FAULT_SIGSEGV on the RFC base. next-20261007 preallocates outside the
raw lock. Failed fallback allocation returns VM_FAULT_SIGBUS. If
restricting that fallback increases fault failures, is that acceptable?

Thanks,
Karl

[1] https://lore.kernel.org/r/arIY0wMQjCCsqidI@gmail.com
[2] https://lore.kernel.org/r/DLO3RV3IQUOV.21BNLF4QS9T4W@gmail.com
