Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241691;
	b=wTe0Q+cr5abkho8JHxKN11SZpJAZ+IYV04LGgKPQFcn6r91D1WC+zbvGhmxkoEQfrjE3
	 zb1rrqMpozcyp/ZMh/2/FRW0jflhh8g6H6kosFPrMxjPr4fhPy2Z5rkKvybXBaIBJOFHM
	 X+jUV+08LQpzh/lEw9/dISw6f4vfo4Juo1SbAYht3ocp38tM5noX+drIOPkvb/kuui+ur
	 az86t5pCwoSQhu4CF4g+gVdNddz+SEB+LWY3JmqBuVNVe1M5MdOWm3GtRfiH1f1dDO8w0
	 cSBZclDLBZLibq0KG46dU+iw3hLMKG2oyyFRPXMRyHWtYAJnRYhQfZyuZpu8rpE+TiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=66BRn2Aye/0ckjUoOnRMmf1MQbc/vWAfUdGb1bh4c6g=;
	b=hseBOdsNeRa1wJy2ItzKx/b77zIuGg2Mx7iyjzB3K1smGjXkSmNYqNtY3tKntW0idLr9
	 JputCV4s4YZqGdSzKRXWMS7o1tMbVJwGtDF1ABfi/Q62gpeNuUVr4vHWpt40VDrR8zYcc
	 fhXfk3hK+O3Z8Jkt6yPSafzbJBaOciI6P39Y/OO6ANaTRnMKp4mk/r347lVEY8xxbFvfE
	 UJVz6XwplgEpCRS0sATO/IDMtqyAWCOZtj/uvkXjs9WamatWZdKoG75e/yR+ZL0Fgl4j8
	 oetDOTYGmcf2egow0qXN22mA+d7evO1p5inBnEpUX8rk+E5vpiom/u5wp6882jtH4Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c5bgooxP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1750606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1750606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c5bgooxP
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so1221966a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794241689; cv=none;
        d=google.com; s=arc-20260327;
        b=Z17AlPiChdQWLzPlyxZXCqPlGoLPuQaEZboGhan+JwTjTRljkz3JLAwDcepZdwhkuS
         3ys5S0jY5Xx0HxO+GGx09F7HYOf0wWyVtt18DoF5vmfc0kSzkmiqb/jZCeb8wQXq9EVs
         CMhB4+fuWfLIBQxcN61HsGZLOwNyUEiMkHH9A4Z7f8xf9cKMHk++DP7S4kv+cJFCojJ4
         yXi2H1fORIBHUo9HguC0Q4fZaqm4gWzG1dUGTV1Gd+qsHBZTiY6xbmtWzqCsB2A+DLUS
         xwjKatP68qIJy0KIte2XNiUNriXlRrVldJC/2qy3edat+KvuqU9UcP7ZP00LYxSkWjAI
         AKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=66BRn2Aye/0ckjUoOnRMmf1MQbc/vWAfUdGb1bh4c6g=;
        fh=pa/RDQR8b3yfZbMOkANrMblD8+B3gXgSaQTrquQtNoE=;
        b=ca0tWGD9S7ReOdfb8zYRwkWMRKflOcQ9ER762oy+VFZK2Hmk0Hmc7cQ+fPdB7T5YpS
         obDWEYo1qzICf7ro5u6aWoCU2go9vKEh/bUE8GDOLc0Dc0gjaM/4nP23PYRl9Emp3xFl
         SB8RM/WD7NtR/Pw99OcJoqRGRpSd/RMcXypld+1kkcMZA8fISZ5GAfTT3Iz9Ra0G72nI
         kyF8JmlUwbCxY4CgXY1Uz8wzQn5voNbLU97YwcWP209UGAAqFk3hJ8yLAQsvJNwjoPd4
         jdpcmUIi2YNPmvbxvuXOCo/uZJjApo/6EOSz8kR93pcJxfQoaeMdhE3sircLVXsdzYWR
         Jixg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794241689; x=1794846489; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66BRn2Aye/0ckjUoOnRMmf1MQbc/vWAfUdGb1bh4c6g=;
        b=c5bgooxP+zL2y2viM40h+sJqVumJmHq5Kg9TLeYFT15jIeoR5HX9An2PQpeJKDtNtu
         ImcSH4yDqkTx/VqSBiRl4ZR4Bz7eaK2a8I9+/9hmOrkT5MGDWABDpf/7jAsbSRwn/lD5
         EJT08F5PC6HyzBtjMHpCK272l+tS9YlTBNd0D4H5qgFeYbQp+cjjUK3UiDYniQ2Y8T+K
         nL4d/pT+C7at0GsIJiH/xselnVabgFr1OF9ziBH59MZykD0HqPALvmIFYLUIYWQlGNFc
         naJn6D6jhLBc6pannUzY6hMpU8hVDhuQXVWTjKG/+LN/cwjs64OwFL5ohVarFFjymlZs
         MSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241689; x=1794846489;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=66BRn2Aye/0ckjUoOnRMmf1MQbc/vWAfUdGb1bh4c6g=;
        b=gxpFQL335VVl8xbdMtArJcbh0uYlB47Kc8TQamdYABjQ3YUAhpihzrntOmBGsx8vQX
         rhlZtlvEy8xav86jKfbbKrngYCcNenwFDdt5+2GmnndS4/2jwvwunB+xEkPgmIjuQH/C
         3BAsxWZrimdw9HErlIiiDJ1zReamFIyeBzGOIPJ5JYpFOTZNaWMSAn82q2sHKPLgU+iX
         Zu73sIdW1X611A72NJfilDamshXPpyvyGT2lfN2mnmdEf2ZXC4ztA2jxXVn7TAF5i5Pt
         z66Ks8mLjdBE79wZaf/o9U1ZoxC5uX7sLVoAjbHgyowQKKmlL9UT2OBVjYihUuAeWp0M
         lZ3g==
X-Forwarded-Encrypted: i=1; AL+hErGjSYTwoBCL972G6VnnUgv9Xc5yLZ8xalAX26qw56Usm7AVYnuodVxtOk58m8NC2KtZdZ0uZVKmRCIwqrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uS2OoZJ5f2qTlNicsz/qS7QtqVFwItq3WrBr7vamjnq7kIu75
	73pGE7DtlKuCgfv+qvzVnsW4+Bzi/hTuB4U4svvm6riLfTNTXx3EGHarSt1P947tLW7RPyVUV4T
	kfjdz72Mmg429Ffd5MezEBWhZyS5IB9psf6G3MlyAKA==
X-Gm-Gg: AYBFou16RtB4RCeZo26aF0dv6h2e52D/bTKCIIlxaQgK2KK4UO9AekuWNyh2Ij7R6T+
	oaZEcrgMGwuT21a1gOx+oio4J5kPZDxklYg4kpgLSpGwBlGRa9I74/CPK3mefqXb2OnDPf9jPK0
	wiTPdE8qgFFXfeJmztAPI5f5JJgf36XFqhOX7Iu4zp3V+BxHpm2AIFnEUdjU1arOAue70ZBFEkj
	mj0gvpIEFPaf8QC6bzO8egfh8c5bMtLldEaCUXlHLAdRtZo6+ff/z4zS0/cDRsz6ZJK5AG161/M
	8kO+OZyr3wXQob1QtZ10NvCzU6OEf6s7A3VMA1x7gDhx5Ea2eHaxXdIMYesv4KwMawcG7hobZ/3
	uH9NwOfc8algUs+Mhday8Muz1hZN+ccI1JuBPPw97mHb6fXB8eUVX7qFWlB/IThzKpN8beg==
X-Received: by 2002:a05:6402:22cc:b0:6b1:cd52:5798 with SMTP id
 4fb4d7f45d1cf-6b756b07148mr54356a12.42.1794241689236; Mon, 09 Nov 2026
 08:28:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-3-vincent.guittot@linaro.org> <au38gSTzmvPKmqWT@scheduler.schedules>
 <CAKfTPtDXo8_3tfXt=UH+BKyO1rJCWjRAVXjO5nFVHO1NBd8LyA@mail.gmail.com> <20261109154536.GK1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261109154536.GK1779021@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 17:27:57 +0100
X-Gm-Features: AclHuK-qEpP_7M7KqnfdpIA6Mgua6z_axLvPnkGDjCe32vaSEKTrZIO3tqlNgoU
Message-ID: <CAKfTPtAL9T0bGZdhkodC49DtNUFKJgEn9f5wLNBe_rGxzJEN0w@mail.gmail.com>
Subject: Re: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU
 has been idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 16:45, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Nov 09, 2026 at 04:27:14PM +0100, Vincent Guittot wrote:
> > On Fri, 6 Nov 2026 at 17:22, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > >
> > > On Fri, Nov 06, 2026 at 04:19:29PM +0100, Vincent Guittot wrote:
> > > > @@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> > > >
> > > >       dequeue_hierarchy(p, flags);
> > > >
> > > > +     if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
> > > > +             cfs_rq->idle_seq++;
> > >
> > > This needs WRITE_ONCE, no?  3/20 uses READ_ONCE().
> >
> > I hesistated to make it WRITE_ONCE but i concluded that it was not
> > strictly necessary because the READ_ONCE is only used to compare the
> > value but not use it for any computation or sync so if the compiler
> > wants to do any kind of optimization what we really care is : is it
> > equal or not ? so any intermediate value that we would read would be
> > ok
>
> Right, so without WRITE_ONCE() the compiler is allowed to write the word
> in random order byte writes. When comparing only cares about equality,
> any intermediate messed up state is not equal. And since we were
> incrementing, we're not supposed to be equal to any previous snapshot.
>
> Therefore all is well.
>
> That said; we should either document the above reasoning, or just do
> WRITE_ONCE() and get all the sanitizers off our back, because I'm
> certain that KCSAN is going to complain about this.

I agree that it needs at least a comment. I can use WRITE_ONCE but I
remember seeing somethign about its cost. But does it worth having
sanitizers complaining ... I will run some tests and use WRITE_ONCE if
I don't see difference
