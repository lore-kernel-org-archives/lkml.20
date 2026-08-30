Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0B340282
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111002; cv=none; b=hQ3F2t3vMrF6AzqViIwE14+6cysUXlAXv/Qh7MNRspCdbDZGE8FanhuFhhcpjIXfONSrW1rohqM7RAPOEAobC/p/MtFLG+ypzn2ItnJiG/cXcRsDIiXFSn1gkEFNz8touIVexK4j8J24K9uYQJs7W3eYU9Q1+xSURJRFvm5dB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111002; c=relaxed/simple;
	bh=qdZQchCJg+WNDpQcGIL/RJh8XFw3pwBrkIgWpCk6sAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XgbAibCkRMIGd17YRad71mo1aEny+tB8eZ2J22HO1Jd5nyGcwzhVaVzyn3lnUtOFjkPQGxX9qV37kaJmLSNpqAWKAOwzAbORvAlLKHFhV+WiHegPfVrpTXkIHFSsyBhUXzlVaD1VIv8VU0uvPbQpZEeWkp733fv14E+1qaofysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kje9QClR; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kje9QClR"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-856114a8247so31655987b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788110999; x=1788715799; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9bIKH9EdEupiOsvi/7uUfU5zw2gR56vprnADjG67WE=;
        b=Kje9QClR0aS1Ae6lnX7ILood3SGlvEIkkMiVroiYOW9H1tr8rkX9r1buJ4UlLCbR0F
         AOjsc9Ed27EPnbnf8FXPUzvDw1d0rtL05j+KLcqH1CTumkhmNrDOzxP2jUh8CzCuiZK2
         9Bpka/MI6uiwCwGtVexQFHYjW01wcicS9GqLE+Be8gwoJwwninpNKeZ+FMxWbAwX+zPq
         gnVw4xaF07uIK54mfbv+g1FpNYxyx2WPxmbalYigRPfOu53kfYznt5IqyvvlmqbK3Gbs
         vv9QkayC0mMVdtfqo8EnB2wcCRYtfxhRBD7DNoNtwDcA+j9efdsDDsET/njGRC2XDcm4
         o8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788110999; x=1788715799;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9bIKH9EdEupiOsvi/7uUfU5zw2gR56vprnADjG67WE=;
        b=itVIxwOYMJ/1k3Ul4bE7KRRvz+L5OtYYluKnR73M6LGL2PqwOtuvyk58+kkryx7ULr
         7GElUmlRatGx+BSeMknw5KRTH+hgWoSh4WF26iToOlZa3WFDXNhYzmO9XodVLwb85mQj
         q98alm/7J7Ih3J0W/coDILwPKoOOHobF8Pr9wX1L2UFSTClGGbPqE3b5kEB4oN4GxAZM
         RwiPrRn558D7JuruB1ilf9HUAyoFSeHcLluLSFIbBXGnELqOSlT21pExSJtHIVhwXRNx
         wwHNeGQ5QefThbMsSBCu3nog2RdMzsHtiRxhyNkINZB4IZB0hsAZYuwwOKeVl8G64QFj
         FzGw==
X-Forwarded-Encrypted: i=1; AKwUvBwWB3Dc4eGstb0pdsHvURLus7wj7T5InsJ43rU08OKUn/nfJ84hekvZKERwC1M7+yCsjnwQYZ48glha3ZE=@vger.kernel.org
X-Gm-Message-State: AFuF++nPh5kwk+OM/gHKSHprNki9aJKxlbKjfeb/gNc0gvxIKZ46jKDO
	sIV9gf1xq8BRwgJjDusQVb01JQmNrwP3/BK8nbOL3qIObbLLiKX4E6OTSF5em4gPDA==
X-Gm-Gg: AYBFou0FMjwjUT6hkSQGK17r7/OOGWCicSoqEoEEFzNpQdpHe5bOHSIUqXQbQ6SVsYs
	UIygCfZTOiX1cL4KUdGiD09XhL6wJWC5a3uUDaUJzMR3UqB2AYgcvoSN9CPxFBOal4KQgWwknxr
	EHs0obcjJ5m9DIbDEOhe6k5qNS+WQZMKrLrv7LjNl0HhlIseMWogkIhUMIxLHc+p7caseioV1Zv
	VgZdjA+MgACBoieMZcW1HNHWJ+GQAmObmwWXP5A/Rx+xqxKv7bStdzAHl4JwjWjZLhmsmxoucR1
	HSgRSGZP3i4MFmLRMkoQhRG+rJ3+8l9uOZkB+aHA3cA5+K5xf4KOTuAtsjaXvZZ+pUtvwg/2ERx
	p2uCdOGnc8Su6PjfETk/KgEsI2T9nyUq7Fq2Y4CMs2AHCF3q1iN+27leMQF4V3khgeTZq2uyx1h
	9fmARd3WtLmBQZRWipfXrTF6Ucmdw7qrQ8hAJSJAGrW/JCumPcM9ull+0Ib/gWZ1aFSuQ8UsG7N
	HjW3ykOUXwAUQJJCw9WhPaIUQ9SGklAcJTG5syBex0=
X-Received: by 2002:a05:690c:c384:b0:85b:7fb9:22fa with SMTP id 00721157ae682-85d69e01880mr75661847b3.10.1788110999083;
        Sun, 30 Aug 2026 10:29:59 -0700 (PDT)
Received: from [192.168.1.137] (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-863fa116fdesm8698117b3.31.2026.08.30.10.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:29:57 -0700 (PDT)
Date: Sun, 30 Aug 2026 10:29:46 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
cc: Hugh Dickins <hughd@google.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
In-Reply-To: <apO7GDwIgyhdn3t7@linux.dev>
Message-ID: <4793259a-00da-ea31-8cbd-a6cb5bf48692@google.com>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com> <apNjw0HRyr1Oj7q4@linux.dev> <apOAF5CPFWUUH9du@linux.dev> <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com> <apO7GDwIgyhdn3t7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Aug 2026, Shakeel Butt wrote:
> On Sat, Aug 29, 2026 at 08:26:02PM -0700, Hugh Dickins wrote:
...
> > 
> > Thanks for looking into this, Shakeel, but I don't think complicating
> > __munlock_folio() is at all the right fix. This is peculiar to the use
> > by mlock_drain_remote(), isn't it? Which is not taking the usual local_lock
> > because the CPU is going offline. I would say, just take the local_lock in
> > mlock_drain_remote(), but (I haven't read the history) for all I know,
> > there may be PREEMPT_RT reasons why that would be completely wrong.
> > 
> > Hugh
> 
> Thanks Hugh, I will explore the local_lock approach.

Please do. But we may need input from Sebastian. So far as I can see,
page_alloc_cpu_dead()'s neighbouring use of lru_add_drain_cpu(cpu)
would suffer from the exact same issue, there are __counts there too.
Maybe syzbot has not discovered that yet, or maybe I'm confused.

(But you'll understand that I don't particularly welcome a reorg of
the local_locking around the lru_add_drains at the moment; and there's
at least one among them which takes advantage of the fbatch local_lock
to lock something else too.)

Oh for the good old days when we were allowed to say preempt_disable()!

> BTW I simplified the
> fix to the following. is this still making things more complicated?

That is less distracting than your first one, but it's still not the
right fix: the right fix is to have the function called under the
proper conditions in all cases.

> 
> diff --git a/mm/mlock.c b/mm/mlock.c
> index efa6716e4dfb..fa30ffed76ab 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -141,11 +141,16 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
>  
>  munlock:
>  	if (folio_test_clear_mlocked(folio)) {
> -		__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> +		/*
> +		 * This runs both with and without the lruvec lock held, and
> +		 * mlock_drain_remote() reaches it fully preemptible, so use
> +		 * the accessors that serialize themselves.

I'm very far from being a good advisor on PREEMPT_RT,
but I think that comment about lruvec lock would be wrong there.

Hugh

> +		 */
> +		zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
>  		if (isolated || !folio_test_unevictable(folio))
> -			__count_vm_events(UNEVICTABLE_PGMUNLOCKED, nr_pages);
> +			count_vm_events(UNEVICTABLE_PGMUNLOCKED, nr_pages);
>  		else
> -			__count_vm_events(UNEVICTABLE_PGSTRANDED, nr_pages);
> +			count_vm_events(UNEVICTABLE_PGSTRANDED, nr_pages);
>  	}
>  
>  	/* folio_evictable() has to be checked *after* clearing Mlocked */
> -- 
