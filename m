Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079738;
	b=jcPt/6QVxMwfXwpmoko2LjtBWc9B3mO2Ly6S7Hn/m/CTEFe1taopmBOBndmihq5kTh0O
	 BeqVzp8XzH9tSGPJegw0/soNA3YFRroBCIvwCWv9AFUQKQKErlNyWrVLKIsDnjRwPCMLq
	 1t6zIVu3Krq6cCOMsQFnq1D6AGtk+jnlegjzivb8if/Ff5FQ5EnRWaIIqr5sSsZixK84g
	 HeQp2yetixuisi5+CIX7hXninFSpFB5KUboa+GFqMX7D4zz920VGNkw3ESMT3RnsQ+zkb
	 qucOQl4BWXW43pJ/X40svZYrGpb9sWjC24xlRrxCPtaSBlA4MYSD+3Q32Ng5vXArXRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079738;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ceuxJi15N0XDXQDo6374s+XT+vL0yYabgxchhlTK8RQ=;
	b=aNG8xVYjEpyvv5Y4xcomMXznU2pwpJs+jqXuFBUUtVinR1IuunVYgMK+U28jhSyZ5d/9
	 p/JKzl7TF3+81nveUoQPkCNhfxRuL51ooJNthQxTJPY+1AxbROSqwqpdeH7TDKfk0KzeC
	 9ersYWh1NVfLRopDGJ5rH0jyBru6w1n+x4GpLC3ENakHU2KpvXty1gf5OBCi7pAHrvnd2
	 fbw36EL5sqI08/F20VzTKRqGBv85O6lpdYWPkcBbO35V5T/sogGKJT55PPodt2DotmKHI
	 E229/fsNsc+u8BzJhFXfh3g9tCcxGiHeaZ7KTLcQ37c2pHX5ymFUAT+bLOr5UQem46g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxsPxi8K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C7606A33A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxsPxi8K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955CD1F008A4;
	Sat,  7 Nov 2026 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079737;
	bh=ceuxJi15N0XDXQDo6374s+XT+vL0yYabgxchhlTK8RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxsPxi8Kg3gfycnlzmlUVJk4U8J7azeOChy+NqS3Z/+kajfq+annfVCxjhXZsfTzt
	 PghA6AWpHmJ4RvXug567VNYLv0foNHITz43pDR2aQwVxMg190gRtHeAqq/HfX98kHO
	 6rHF2p0H18U5H6rFSJQl/Fdpt4kC9TFb1KLKzXcdE7LS0/pdcKl39wwdlHwdXPPW43
	 NRdQ3fJoHUA7J0GJCmESRjk2IQ9j3L+lg2aW4RO2IVBHUUoPaZki9qgkO2c4ua+5+0
	 m26gd3Sp7ob2iGWwZ0b8bhM4DR6RxqOHWGO8VXoo2xsadeLN1o6zOyAFgXmHVhubm0
	 YEkq+ZOwa0P8A==
Date: Sat, 7 Nov 2026 19:28:52 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] locking/rwsem: don't let a read lock steal from a queued
 writer
Message-ID: <au92oUJyEnth8b9E@gremlin>
References: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>
 <98a82cda-e363-449e-9b2b-8432f8fdcc3a@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98a82cda-e363-449e-9b2b-8432f8fdcc3a@redhat.com>

On Thu, Nov 05, 2026 at 11:55:37PM -0500, Waiman Long wrote:
>
> On 11/5/26 3:24 PM, Lorenzo Stoakes (ARM) wrote:
> > Since commit 1a728dff855a ("locking/rwsem: Enable reader optimistic lock
> > stealing"), a racing read lock can steal an rwsem from under a queued
> > writer whose handoff timeout hasn't expired yet.
> >
> > This is most problematic when an rwsem read lock is released then
> > reacquired in order to relieve lock contention, as instead it will simply
> > have the lock handed right back to it ahead of the intended beneficiary.
> >
> > Naturally, this behaviour rather defeats the object of doing this kind of
> > thing, so this is less than ideal.
>
> If there is only one reader doing this release and then acquire operation,
> it will leave its task_struct value in the owner field. So we can check if
> the owner field  to determine if we should skip the lock stealing operation.

That seems like it's overfitted the problem though? And would cede to read locks
also, no?

The intent is to prevent starvation of write locks, which seems like a
worthwhile goal not only in the case of dropping an rwsem to relieve contention.

>
> Something like
>
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index b9c180ac1eee..1f0fffd75c18 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -1019,15 +1019,17 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem,
> long count, unsigned int stat
>         long adjustment = -RWSEM_READER_BIAS;
>         long rcnt = (count >> RWSEM_READER_SHIFT);
>         struct rwsem_waiter waiter, *first;
> +       long owner = atomic_long_read(&sem->owner);
>         DEFINE_WAKE_Q(wake_q);
>
>         /*
>          * To prevent a constant stream of readers from starving a sleeping
>          * writer, don't attempt optimistic lock stealing if the lock is
> -        * very likely owned by readers.
> +        * very likely owned by readers or when the current task is the
> +        * previous owning reader.
>          */
> -       if ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
> -           (rcnt > 1) && !(count & RWSEM_WRITER_LOCKED))
> +       if ((owner & RWSEM_READER_OWNED) && ((rcnt > 1) ||
> +           (current == (struct task_struct *)(owner &
> ~RWSEM_OWNER_FLAGS_MASK))))

Actually the RWSEM_WRITER_LOCKED here is redundant given the block below, I
did think about removing it...

And could probably avoid that open-coded expression with
rwsem_owner_flags() I think?

Anyway, it seems this code would be redundant with CONFIG_DEBUG_RWSEMS or
CONFIG_DETECT_HUNG_TASK_BLOCKER, both of which implement code for
rwsem_clear_reader_owned() which is called when a read lock is dropped.

That would mean any kernel with those set would not get the required
behaviour, which is unexpected behaviour, so I think this is out anyway.

>                 goto queue;
>
>         /*
>
> ------------------------------------------------------------------------------------------------------------------------
>
> Will this help?

I think in general the original patch is more useful in that it expressly
prefers a first-in-the-queue writer to an incoming reader.

>
> Cheers,
> Longman
>

--
Cheers, Lorenzo
