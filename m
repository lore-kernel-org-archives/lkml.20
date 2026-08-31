Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EF3D9529
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172141; cv=none; b=pyLCth7LkbNbp5tPdC/xA6Q9FvAoaB+B6wUJNLZqfGqlv6mDGqmWjadg4dP3nvKKcJPtPjNK0R06ob03/Pq3skjGuJpaoFBGCEi20XJyfXQrfi4evmko3przJGusgEuG1l+tIvjDOuYOdAz+ubxX4eeHwzpuYT1Mo8nwJTesyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172141; c=relaxed/simple;
	bh=n0xYxuVcRnO36Xwvu9SCbeA2JFDbna0JbLMo4+2IaR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdHbbULKmwpR1jyKGGNtcS+VEtDOYGE9gZOio8/trCJAxOLWf6gOhcKgvuUinsqWHaY6uL7uQCDjbXDWTVb/nI/3y8kWabFF8QLWS3iTeGYoaWJbECmO2PK5emrnwouDkfzvB3fZbx5rtMbZEFvHeAw0yMAPCqjVliRiDI5235Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JYkRuxX8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Et4TbARV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JYkRuxX8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Et4TbARV"
Date: Mon, 31 Aug 2026 12:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788172137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXHuqEMVd5r9Kb5uP27u7BqXJjMjwilyDDUTebyzQX4=;
	b=JYkRuxX83aiixALIH7LLrCuWfxOud3Br3FSshGL4xI3IdQvN9XSlMmu9UxGk6/A+5+c3DY
	Jfjy372gb3H7iLhwTdYDIiMBaXVgA6tz3qpal8gd1kBPJv60QkaQAB63M7EFco488RsIOJ
	MqFH//swaz9C0f5YOfAD+ftkHb5S2K6VvnOMLNn8u73TWwCYKqODgm/J/eGAWBg96bbOvx
	lX3QdIYs+VDnTM5Nc4ZTahOywMtiGqmYNIGFMQH6WKeFCHNX7EOUlC3KU2HhXJlcFxbnrP
	e+WMcoP0ACKGDnt0Y0WjylGZK4jJ2tSIoxyrhassfnyNylw59XtGAAh612xgBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788172137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXHuqEMVd5r9Kb5uP27u7BqXJjMjwilyDDUTebyzQX4=;
	b=Et4TbARVJGmOcZqp3pkQLXcVtfr7mVUu6imjMFJX/FcsrC3o9JIydz2OmEjj6aIWUr1Lev
	ICbpUTmyuxiUdpCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Hugh Dickins <hughd@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	syzbot <syzbot+cd2073ee6d958a8d0fcd@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] WARNING in __mod_zone_page_state
Message-ID: <20260831102855.TOx0U8Vi@linutronix.de>
References: <6a931c5a.08e933ee.dbf97.0093.GAE@google.com>
 <apNjw0HRyr1Oj7q4@linux.dev>
 <apOAF5CPFWUUH9du@linux.dev>
 <a2288e73-5001-2104-1e7a-2b383e7edd61@google.com>
 <apO7GDwIgyhdn3t7@linux.dev>
 <4793259a-00da-ea31-8cbd-a6cb5bf48692@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4793259a-00da-ea31-8cbd-a6cb5bf48692@google.com>

On 2026-08-30 10:29:46 [-0700], Hugh Dickins wrote:
> Oh for the good old days when we were allowed to say preempt_disable()!

I'm sorry for taking this away from you.

> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -141,11 +141,16 @@ static struct lruvec *__munlock_folio(struct folio *folio, struct lruvec *lruvec
> >  
> >  munlock:
> >  	if (folio_test_clear_mlocked(folio)) {
> > -		__zone_stat_mod_folio(folio, NR_MLOCK, -nr_pages);
> > +		/*
> > +		 * This runs both with and without the lruvec lock held, and
> > +		 * mlock_drain_remote() reaches it fully preemptible, so use
> > +		 * the accessors that serialize themselves.
> 
> I'm very far from being a good advisor on PREEMPT_RT,
> but I think that comment about lruvec lock would be wrong there.

This change would eliminate the warning on !PREEMPT_RT and not cause any
further trouble for PREEMPT_RT.

Given that this it might mandate for

    WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_VM) &&
		!IS_ENABLED(CONFIG_PREEMPT_RT) &&
		!!irqs_disabled());

in __mod_zone_page_state() and other places where
preempt_disable_nested() was added. The counters do rely on disabled
interrupts not preemption.

> Hugh

Sebastian
