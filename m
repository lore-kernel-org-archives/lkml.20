Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C79472F9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467663; cv=none; b=tIKbYMRxnfvZxRd4kiioy2FKhLrQaxTMCr+R//qp06NWQSV/gNAXHeKtXwdhRdmo77nDzB/bMu9F5bYag3E+bQKpozj68OGOFPhCJI8Tf16a/xvkuqSARP2hKKCjVNtOkGG9e8x/n0qV9Q5hv6VvproCmYNbypAG4T7Cvym9lWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467663; c=relaxed/simple;
	bh=rQ9ykEiVzccIKYlTgtQ0NJiCeyYilAfD/J3UJMBPADo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mpIY38Qi1LKjbSCvFtslB/TwS3x0iazViFVBOG2PU5XeyknH++gD6a2igTge9iXfLeY9V0uGLyBdTIRhztXe6mRvkbqrGmW9tpFrIpiELeNd8V2qfzVjLZv6NVos1T+SIc5GBgyjL2cGAAgHEHLoYafQBEZHcrDmUb/KqiEKqSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHXkwYtO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHXkwYtO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so26330065e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467660; x=1790072460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JpWf/51zRf1hN559QYIV4FyXsUZULp13ULs8b+al10=;
        b=YHXkwYtO+0cOUNV3w+sKeFg1RIGLOMiKOWk3w7b2BvaIRPwJuzBjNkJzEVTaNCfFFn
         Wa4pKSTxNqnNsXlfPCd71NqSEx9M1nQyJW2EeRbi/20RYEBmIXL3ZypnmSXHts5PsVjC
         bT2foHeEYs58dJobpLq/UjlWdHHV63A88BeBz5AE3mYws7AlVTkIVE8JTGV5MMAjEO8d
         E+LMyxyYiwupMQjfQoGQYYU9D3HWS695WUKZzlfkIc5J00kbeLk/Il7GxXblaDDwpBN7
         awxDC6wNKs9AHcRpcQtENMpEdBHQIiy8D11E1Cd15oAFYOla+A+wLPgLHeqnGuVX7lKD
         g6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467660; x=1790072460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JpWf/51zRf1hN559QYIV4FyXsUZULp13ULs8b+al10=;
        b=Lie/OLRZHw2FuRo/q+oSDwBEzS9hi6JBzCk83qSgAzmz6tSNK8QDMhb5rFvf0k/PR2
         a5wYC+A5UYswanQpCA0xbeIOBAICYWVaGJzDX2k44yls9NAf5n0DBbpM5W3A2iHKqbWg
         /MG4J77P66fEvsEqs27E/4G+2eiVulWJv8KZU7ZQJdtQ3Vw7BVs3sPjBFY0KBhNmEt0A
         qFnteWgR0ekICgUXNLkzGdVxtZSp8g4w7o+b+4WNBTLLCh5DlFQeaPXqT2MRRTV3E+Up
         wlKhtAWO7HfHduvFqjexU3+m7uj7t5ljpVPVSGIG+QAI2IiCea6JT8iFPhFGac9CyF+8
         rCVA==
X-Forwarded-Encrypted: i=1; AKwUvBx/04vDH7FLiOs9Xa8Rwl52/UtJ0thPDUJRqrT1VVZE5o7rmEeM0dYZ6600ycQgKeVTMA0lHN5bHkOuIYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kbTM74LAeaIYurqgDaj4JSvnAXKEISHImZd/ZEn3r3ASx+8QDk
	10do0vFBYanZyALz4bBA93LvsDDSrEMhuZFTrVSZpzTtr1BDX3K8A6y2
X-Gm-Gg: AYBFou3Sl+brMFJYQxjcMTXZLim5bBZE5K7eAa8BqLUXWQskfaLTzyLS7dqeH7cWHq7
	EHwXz78uTCR1EeUU/xZnsAuKWq5/Ny0yERz1kiPpwwA9GHVKdX3MmtXTPm2ljPQV0q0CWij3ap6
	VQtMhkObPAFmFSzOisZC4PtZgetWUrXdGR16dYcQmP0Pt1vm20ixBSNwKNFUeF2/O7agwpXyg5S
	xwZ5CegZjtXOriKM50VxlwFdT86toQzNEgc7Cq2aRZou2fhveeyE1xenj6L7NwX9NAQPzdEfFsL
	T/ugYWUvkyuBEOA6E24Pbjs9z/lW4rcM8mf8yk7tpvMtDYUcSIsyQUnuE/1iM2BqQsUXznx/+6I
	p00QFjUyzjXX8OydvtDWDifNSkZM92vyDI2NTKMsZdwmUsGBPnvknAZmTc8fb3SfTrozBvuJHZC
	G+kaQBLDdvVVt+f6DGF0aTlnJDHiqT1YYuiHZQm+k3C+EpxBJsl4CSVADxTqbbYW/G53EfeOZzs
	x3BRBv1D6bTel2DiDvVlkiPCOoFpmjWZf/a
X-Received: by 2002:a05:600c:630c:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49e7a662f3bmr70114175e9.6.1789467659704;
        Tue, 15 Sep 2026 03:20:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm54270165e9.1.2026.09.15.03.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:20:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:20:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915112058.309b5317@pumpkin>
In-Reply-To: <20260915085013.GA4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<20260915085013.GA4121339@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:50:13 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> > There is no need for separate prev_cpu and locked members of
> > struct optimistic_spin_node.
> > Using a single field simplifies the code slightly.
> > It also removes any possibility of the two values being out of sync.
> > 
> > When cancelling a lock request explicitly set prev_cpu to zero.
> > Nothing actually looks at the field, but it means that it will be zero
> > after a subsequent 'fast path' osq_lock() call making things consistent.
> > The cache line is likely to be dirty (or be dirtied) so there shouldn't
> > be a performance hit.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---  
> 
> 
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -170,10 +170,11 @@ bool osq_lock(struct optimistic_spin_que
>  	 * is per-cpu data the memory can always be read.
>  	 */
>  
> -	for (;; prev = READ_ONCE(node->prev)) {
> -		if (!prev)
> -			/* Lock acquired */
> +	for (;;) {
> +		if (!prev) {
> +			smp_acquire__after_ctrl_dep();

Do you think the equivalent might fix the existing code?
I think it is only going to matter if there isn't another read barrier
before the osq_unlock() - which is unlikely except for the test program.

>  			return true;
> +		}
>  
>  		prev_ptr = decode_cpu(prev);
>  
> @@ -185,8 +186,8 @@ bool osq_lock(struct optimistic_spin_que
>  		 * 'prev' must have unlinked (or be in the process of unlinking)
>  		 * itself from the list.
>  		 */
> -
>  		cpu_relax();
> +		prev = READ_ONCE(node->prev);

A matter of taste, I prefer it at the top.

David

>  	}
>  
>  	/*

