Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462481;
	b=Q0IRTaiRadQBpZ7LsMpaSpi5+andM4yLt3t25S6YCXCm/SbyLgEhIKzDoyI6d2Wi9KF0
	 6XQXaog7P2cKgNyEGu8L9T4khEynlDYSwOsQvNS3bIdnF/8geOJhLV06bOGnTrNeg4EIG
	 1VxxS2I10I0IOXiStCJmJrttYtqUt2MonokEOUKcO42O1gxg0uYYrEHuFZD4SvLMi8qbw
	 MTuk4lEIHWXwFjZCGMws7+U+iO3YMxK88UB6KTR0Wa+ps5yXrhTNXdV1hnX9TxvatL/rA
	 Vkz2JFTOUrTp+Broo1OVKg3WlXHVtIUGLITz9Mu/uLE5BzoXzsXfz6xAmXz6tUyCJPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
	b=EdwqSeFWuoYPi+Zg1rGcuQBSe189xz/RVhmJN4J4tauTEctaPRhTnKH1yF4sZwcvI0G9
	 djLz2UofHrqInW+Ou81hj7Y23wNWOeRSRgP/9+IZL+koxtIXJF3hGZS0LvCJrUsTeEfq6
	 QHolz7h0keiGkH8YagfdvwA1uU1Qlx71ua/UZ5s/0j2SuD0mE8EQKmMTDSe5ekYvJRt7N
	 MYUKorclRUFs1jHrxKMkARqTkhUy1mC12bCVcWS8Lsv4xlT9r+LOxlv+OSZcC80knZkG2
	 SFCZR2AYpb6pSsOevwQ2RYkfs386d70jjBuE13wLYSjSNyZqLlE62OdEJFDUUJI7bDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8702606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8702606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1348756f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462479; x=1793067279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=oBihJ65CMLYBqYHD9hPzlwUnnU21Djjlk+0ywA8lRRGdNyRHqBkmkB2lVi7j7VuJ1l
         MPwAaFfom20siTmykpM4ACL2ty3lpQ6vyWJJmpPI8ZNX5UWUMWNCT76IcffFNMOUGFTk
         ORdK+O3A4W904mNRG0BhTfAQ3NjS8YqXkkKvnV12Bxd9kRss/cY1Tv6b9jyxrJCeHjml
         1UVPVfEtj0r/j8yx2gjVcG3pxob+11ZYhiUZjgUj33HkXufAXfebmxat2Oeiaf2Mav0z
         Vvwv6t7UGKyBpY9zHG+AYKsyBiV69wdVVX/+3Y2olVz6L5eDY0ngAgoqozcmxhtarnNO
         JaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462479; x=1793067279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=MthaLxibTrNo4xA58iQrzdWNpXVw5O92bcNRBiFRnLUDCR64Q3GtEigUNKk7n4HH4h
         tBWWO2obxp5mkYuXgopKqwKu5PwZuPID5mvwXqkc+yl8O52Or0pqkWN2Qafn34hbbu5f
         3nUBwM3izW+2VFfpo49fJQtiEAC9qNN2nnsLVdrdJ1ttkmodV/R7gATq7R7YpOiuGpGQ
         O3xx8jA6fMoFxZcRVeicrrDsDjkVQI4xtLiG2dzkMv5ymm+FpzKcfDPO7XmMn9UUyp8T
         b1jWoaHtPR3+leQIfwooRh+ECIlPB3qnwm9CxLBwzobm8TQUCIV4Cess8IYKWmqpJPFt
         E80Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2BXBgqRzzqq8hmcaWZbV8vuGeRBAEITI00XMdMzxCWFzfM2DWaZv3yHRylNYunAimSB87IHKY043JwXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxisutKd0ga331o7Qug6EUTyrvEsXAW9a5n+6SltFrbuzd84ke
	Jiwv36XZT7TC6bCIBLIrpq+faqek3dAwIvTYdKSamV7W2eEt45Dw7QiA
X-Gm-Gg: AYBFou2axOCTUrmgowey75P4TBwJ62awwfg8oaSI321ip0GPMeCVvbFMKvUEW+Q3E44
	OIkKpg+Gpx2qaoSBtWCcr9c26ECPNwYn0V+W/UT2ZNwlr73UG7+S+4se1W1Xdhl+OF3JrlwFBYy
	6shz2SvOPVGOkqmc8yUQhaT4y2L/IyrAry6s6V1BOkxFIRQ81eGDnSRV0EQLQCfIN3u5Z1Q4sKK
	s8oogn31P0wOU1llZXzQXOvJrg5e5vFVNeZ3DZDJ9tMFadp3iphTqkR0bpYrKbspR+aaBIx++Dn
	++waWkkHEbKgVamv41grrcPDLkY3Y8jSMjfkga8fcXI3UTsp2za/XfI2syZ988+SE/b3lTUD3k0
	M9BnZsQIYKxEJ6p+9ZMyy7+evkU4f9xQEjGR2ARBw093w6k3BqmKU7Jrq5HGzJJ9kLwPYB/bGqr
	Es1koBU+yEpytzjUhVpa+Ln2oChu9FBTqqJtJa0XSYDNCjWfsT/kegMJIWuHycuA3jKZTrq8lOl
	zpD7d2IhOmzjv1A+e+5tuHNTAe2pbgVk0jH7cIzeIPVX3lev5QuUnV+5+If8RDwf+t2SlSeLcko
	ij4wWW+Q0aTJg20UyHBqPoimIRd2qaSyN5koSnAummWL6ObF54I6s1skCrnYL0ysMf4t+l3d32c
	t9dmML092UA==
X-Received: by 2002:a05:6000:491d:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e07bc2f43mr19882172f8f.34.1792462478968;
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm2879816f8f.33.2026.10.19.19.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:14:36 +0200
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
Message-ID: <atbOS2rs94fB2red@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
 <asZ8jmWNoGk5tYce@thinkpad>
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
In-Reply-To: <asZ8jmWNoGk5tYce@thinkpad>

On Wed, Oct 07, 2026 at 07:15:29PM +0100, Harry Yoo wrote:
> On Mon, Oct 05, 2026 at 09:06:22AM +0200, Karl Mehltretter wrote:
> > On PREEMPT_RT, a BPF task-storage program attached to sched_waking
> > can deadlock when kmalloc_nolock() obtains an rtmutex-backed allocator
> > spinlock while try_to_wake_up() holds p->pi_lock. Releasing the allocator
> > lock can enter priority-inheritance or wakeup code and re-enter scheduler
> > locking.
> > 
> > The first RFC [1] rejected every non-preemptible caller. That prevents the
> > deadlock, but it also rejects BPF arena allocation and faults under the
> > arena's ordinary raw lock.
> > 
> > This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
> > trylocks. Atomic acquisition succeeds only from the completely free state.
> 
> Please don't skip discussion stage and jump into submitting a very
> intrusive change across locking and mm, assisted by LLM? :/
> 
> I don't think attempts to tackle this problem will make progress without
> discussing and getting buy-in from (PREEMPT_RT) locking folks.
> 

Sebastian, Peter, Thomas, did you have a chance to look at the locking
direction here?

Thanks,
Karl
