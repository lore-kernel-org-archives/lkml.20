Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3B51D522
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802031; cv=none; b=Qw++pt6t8WyVFcoSFuDCns3lxOrbNdICm9vg3Y5wqzeOwXhawWCH8tQWYnwvsQLbyEwnHfmgV5giQfQ4Wx9yFgNFAtHDkZ1Un+81uatlVWxqjJUsuNbCPrRdWrR2WAYLHNWyp/GL5uhIzNUO/FYZbdoDLYeNjdSyzz+BDuYJH7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802031; c=relaxed/simple;
	bh=Bjbk6tLo48/0LT+fZnfmR3D2l0rzqKQ6Sb38eqjbHGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iF7u1puLxkW9iPNyMmFbDOZ0x+3Tz0TWLRtdq+PR+Dp2mKPlhrSoIGigiFOlCMEH883DX7k5nU+qpOKInfS2qxQ+FoIRxwqCtKePQ/dCRjogt7+RyKoKjpuPgfOxES3Uuv1c1Zi11Tia2yN+QETQ0e9skvDPV0TizCDIRcaF5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phh/Q6m7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phh/Q6m7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so45211935e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802028; x=1789406828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vXxGcOXr9SizrC9vQJdw2J9qhXXjC74TJ5qHomh8aU=;
        b=phh/Q6m7mwcCQqawqLQOuCkTmOQwJWOM2Wy/mOZKdaIcZbqQUh9ocAEI4zhTwdtCvo
         U5s6q7qAuy9Fd5QU/fBjN5tht30i2AOCAyXI+LoQKHGJbc3EzJ8vmu1KLA6yxdYhDpxW
         JpHc7aOhUJ/cQtLwswM13hd+cNXxeRVqU2n2Jh6DE+FVhQ+VDen7wPYXtcds2gEJgPIx
         aiUAY3KsKwp+iKe4L6KyB5PnKS8Lq9oOi9XuaHmYo5besG8qtn1Lx7dXgcGYGJbKIg2S
         +A7cUikbiRWR25DuZp4ZJHiYKLh+KQdSvQUJVl8K4L5TXf9vRV0OMJxfx0vvgCzQE2CU
         4JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802028; x=1789406828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vXxGcOXr9SizrC9vQJdw2J9qhXXjC74TJ5qHomh8aU=;
        b=A0tT6pHwcS67APdwNPbzuB00rZUt+KkRoDmeH3Ag8/UkW+9ZGWJOfpnzxRXPEHt3BF
         7PerGBYlOgLztoCHES0oRy90eW0d1bTjmM1wsGK/U/SCFcRu5ffN0WprySGPiOTt4PJX
         aXMnxjenOWWlZbVFr0E3y45hCayATyfFLbsgfXHTP7CDXSeXye90Z0do1rYyryXnI+dz
         NN9WSQXWVg3e9i3dIQom+xup+BF4vFh2AADAvQ/2QB5Zj/DpPUr5Br284FF2/h+H5OLz
         eX7nU1dEeKY28eT0HXadDNRNH1Xk4kfPMy+XNrg5vz65YkAElpt3Ui2er1yeGDvP7ABu
         HAnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJtsnjtD1jch5yLpn8Wqy1IIPzIxK4DQqkq9JtZl3zLNQL8vMsy7MVc7WQIDBD5MUbTPQpecMDT1mbO4E=@vger.kernel.org
X-Gm-Message-State: AFuF++msiO6zDFAgQvhLrH2w1tKhFX4tAs52Py2ztOZe89qmmy74vGXG
	Zsd5WP3umTXs5izOcSrZX4/nrT/3e28zlw6Swt2FPf6N5ISzlccDNPYH
X-Gm-Gg: AYBFou0IjQmZv7HK8kbxoFmp7/HIQIiHCnz9QV4pwpOSzdmDcm7/cWyX9PW+02SC3+W
	5NlWhYCFR3gd8HmXmc+N66ufpVfXznM91Cw4VucNFXUtFxOP9s1B7qJTDWiJXjsXObJytjRV2oG
	Ef80WFPNUyj4Yj2xw6JDz3lBO2X3DywX2/XIBGou9NL1xo++jMAHQbgLipUf6z65OoruSa8UWeM
	v9yr07a5F4UMGP1Qpb7rMTIpO6jU5ga47sKIhcbCV3Lhy6gzL1S74GiAKicScIX278wMuOkPurO
	kEIRelXqzQL5Rmk/k/Gmi7aJ7eWcPm+zV741Tb9vUFH8LrjQn/Vm1GswphlE87KPQ9h7etpATLQ
	Tj1WZOeTqJiaJ0XGU2N1ol2BLEsFWE7Mg2nMIoClwwYCvWfit2dW31Z8YG0uLBwYRVvDbGtTiue
	QEgdq+ElKKEOCgTJEuu84YboblnIBpL4z+58eoZtOocG9/rCWjmfbFeU2LYEDIuxo3RkEFHVKOB
	4zbvaMNg8e3HpNRwnaz/PZ8Yw==
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr271054425e9.3.1788802027744;
        Mon, 07 Sep 2026 10:27:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm444402135e9.14.2026.09.07.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:27:07 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:27:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, linux-kernel@vger.kernel.org, Yafang Shao
 <laoar.shao@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260907182705.54585f73@pumpkin>
In-Reply-To: <CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Sep 2026 09:08:28 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 7 Sept 2026 at 01:41, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > I've fixed some broken/missing memory barriers but left the initial xchg()
> > when acquiring the lock as a full barrier, I think it could be relaxed.  
> 
> Well, it should almost certainly be at least an
> atomic_cmpxchg_acquire(), since that's what osq_wait_next() uses for
> the contention case.

I'm not sure, but am no expert on acquire/release barriers.
The 'fast path' osq_lock() code only has one memory access so there
isn't anything to sequence it with.
The important one is the smp_wmb() a bit lower down that ensures the
list tail (or head) is written before the back link.
When that was missing things went badly wrong.
(I think the WRITE_ONCE() could be a store_release() instead.)

The ACQUIRE semantics were added to ensure the 'node->next = NULL'
assignment happened before the xchg().
That assignment goes away in patch 5.
But I'd want someone who really understands arm64 to comment.

> 
> It's a bit odd that the first initial xchg uses a different memory
> ordering than the later one. Maybe there's some reason for it.

I think the 'entry' ones want to be acquire and the 'exit' ones release.
osq_unlock() used release, but the equivalent code in osq_wait_next()
used acquire.
They can't both have been correct!

> 
> But even more importantly, that code right now  explicitly *states*
> that it needs a full barrier ("We need both ACQUIRE [..] and
> RELEASE"), so that *comment* would also have to be fixed with a why
> the ordering isn't as important as it states.

I left that comment alone - matching the xchg().
Even though there are now no fields to publish.

> And finally: none of that will ever be noticeable on x86, since there
> are no memory orderings on atomics there: lock is all-or-nothing.

Indeed.
I don't have a little arm test system, never mind a big one where this
would all show up.

> End result: I'd love to see actual performance numbers if they exist.
> And any memory ordering change would require explaining why it's ok
> and some other architecture to test it.

This could even be one of the strange places where making the code
slower actually speeds things up overall.
osq_lock() is only used for contended sleep locks, and then not even for
the first thread to be waiting.
If you get a lot of threads queued you really need to fix the locking!

> 
> Or am I missing something?

Probably the same thing as I am....

David

> 
>             Linus

