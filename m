Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E732E612E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830612; cv=none; b=ijRkds+GV9WKptKIHmnpPlp1Z7K8vvJm5CqynNdsJIqwEaNMXGmwPtzHSuGI1hoCU52zsIfWAfwNUNoI5Q/Yk/xqkmkVh8CHXrffYgQVJL5soxw94/vibfpbioY0uCO1/FKB4HppkQH7sSRcpvRem8DcNcEUwp13rjNvQJju50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830612; c=relaxed/simple;
	bh=PrE+qhGw1xvjxxjuNJw7GeDdZI4DSou+8/0RAf55MFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=of5kR1tiT/WUvVcSfcUC0JVuTlr9mHBx9oebPw1Bdcu1mOhFsWxDqc9JRfNe5Koy1KouUt7h1vdRlIV2MdbUU9HsshLns2Tos5ILE9ggp/XZWuRVQWa6mFaaekbsodf7sdsopfgaAlXyUuEmXLPoafF/sEtFJKG8qQVVhIZv/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDeavnG5; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDeavnG5"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46ac530ba95so2754396fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830607; x=1789435407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os1bxGgQvoOLa9ryjCYK+ThrfW/L4s5kmkzao71FISs=;
        b=PDeavnG5z/CSBNAC0pSbz0Nrzkkyfl1pDbIDwelpORKR0FCrB/ueQ5hCaCwfvehlvP
         sSbvCSQTMzv9w8tTGrfkpx0WUOl1OjCAWh6424mKZ0l7kTnlXlXHWbT4Ey2JpbVD7MjA
         sc20lFPs+7oZf8qvIBN7RaWHrxq0MUZIbvN8LfsARg7DiVcfdhR8VSFWHgjQO9PIfKw5
         9gVxx72FOtbsnBGU090wishA7skNtg0yUewosOTjhb04pLVJgVdF8wQH7HMF7w6/3/Zz
         jj/e8A/QUIN1D50DheM2m4txb4OO8mqf7lnkAn1VcE/ISQgOgLnymARXl18AmDUrcAFA
         Px3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830607; x=1789435407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=os1bxGgQvoOLa9ryjCYK+ThrfW/L4s5kmkzao71FISs=;
        b=CGLPbSqF4U7qLLXdW+f0RuWYwKKjn8Oh6c3ppxRCGYP45frtrcWGQ/niw7nQOxLB8j
         jE7cofrtuKmu55jacziJXHxbMZ4Rjw+CQogN/PQIv4uiRA1c8rSTh5nSnnxKSLMIZvCp
         lFv7VwI+YVn+TM/IFhYe92vq06sGbe1kSKFcwLmfMejIBBY8uBP/NuVKoNrX7ZbsB5q0
         HpB1kcpW1BwNeK+DnPkSkZoVY+NW29YD+agk8mQOdz+sCSyRGKO1oYcKgUOoCxWXM/Md
         9lak6jLT1RJIxsxzRI78z4NZEWcFYQ1wJTNQP5qaVoL8Fd2fAWT/oB3cmsqtGoUzrZ8m
         A9iQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0GZagYSw6nBbdQjn6T9bBJKarsf3L0A9ve3z3NU+fTI8Ck/blQ30Cu9emiM9Tc3zlSi9lOZM23aYLyd4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSUpjTLNdjLsTVBwZbv/48wp03dzRj5lkgNEpf78POt0l4RJmg
	n4uf5h/eljweyTBgUGIIU5TDTG/Y0b/aKCqNZBFTvgPfDTrcUThyknnm
X-Gm-Gg: AYBFou3TNcF1fqHFdjrbcpx9HsJSPCtFnwid5LzSJKvSU7SmDxyTZnieVaT1IK0fUMG
	puU2v99Qefq70sSBDHneowqxb8vq9+0xLgJC2I4q6S1ihjMXeOg8GU+uuif2d8anb81Hfdt9Jb7
	iFwZEefhCnBMeiBV2tQKHo0FhqBXBrfQzPNlYATyGczZYp9H7zHMMwUoaWSHaxRyN6hLWWaHPkG
	oPKx8zxgo7xYEWUsbxe/oOR5rOeCSjs6sHpT3v5WyCgqH9oNg4txvY8Hn661pj9nGjI5uRmbyuc
	+s4SExYhhKziApegCMUZXmhfs0HGZNN18czGIfN70HgqSTHWexc94Jz4xfGH8SjbFfbqlP3zITb
	Kb2DKaJdBluWNEfeym2psghu2zTjfLKtm0OCnNTpdP9SRdTacWrsiNdmRQIN78PMGUg6Cb6V2fL
	r1n1E6knDS81qtKzeypl9BGJrULNb/KnZKSBwxOsYSIQnF9S93Y5qJjwaL5UNhTo0yxhvDPpHVZ
	cW3IgKxMEtqShlif6Q=
X-Received: by 2002:a05:6871:c301:b0:457:494b:1548 with SMTP id 586e51a60fabf-475516ed3a3mr34561336fac.5.1788830607148;
        Mon, 07 Sep 2026 18:23:27 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:54::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475543f5ac5sm12322726fac.8.2026.09.07.18.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:23:26 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	dev@lankhorst.se,
	mripard@kernel.org,
	nat@pixelcluster.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	osalvador@suse.de,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 4/7] mm/page_counter: use stock in page_counter_try_charge
Date: Mon,  7 Sep 2026 18:23:24 -0700
Message-ID: <20260908012325.1770706-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap86vDv143VHvrzh@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sep 2026 16:21:33 -0700 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Mon, Aug 31, 2026 at 09:37:48AM -0700, Joshua Hahn wrote:
> > Transparently make page_counter_try_charge attempt to service the charge
> > from its stock. We preserve the same semantics as the existing stock
> > management in try_charge_memcg:
> > 
> > 1. Limit-check against the stock. If there is enough, then skip the
> >    hierarchy walk and charge to the stock.
> > 2. Greedily attempt to fulfill the charge request and refill the stock
> >    simultaneously to the hierarchy.
> > 3. If this fails, retry the stock and charge without trying to refill
> >    the stock, i.e. with the number of pages requested.
> > 4. If the greedy attempt succeeds, return excess pages to the stock.
> > 
> > page_counter_refill_stock() falls back to a hierarchical uncharge when
> > there is no stock, in NMI contexts, on lock contention, or for a refill
> > larger than the batch.
> > 
> > The greedy charge is also skipped in NMI where both stock helpers bail
> > out since the batch charge would be undone again.
> > 
> > No functional change intended, since no page_counter enables stock yet
> > and counter->batch is left at 0.
> > 
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  include/linux/page_counter.h |   2 +
> >  mm/page_counter.c            | 135 +++++++++++++++++++++++++++++++----
> >  2 files changed, 125 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
> > index c1fe331f34e7e..428ca8e7b2da5 100644
> > --- a/include/linux/page_counter.h
> > +++ b/include/linux/page_counter.h
> > @@ -82,6 +82,8 @@ static inline unsigned long page_counter_read(struct page_counter *counter)
> >  
> >  void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
> >  void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
> > +unsigned long page_counter_refill_stock(struct page_counter *counter,
> > +					unsigned long overage);
> >  bool page_counter_try_charge(struct page_counter *counter,
> >  			     unsigned long nr_pages, struct page_counter **fail,
> >  			     unsigned long *nr_charged);
> > diff --git a/mm/page_counter.c b/mm/page_counter.c
> > index 3f61eba695518..a76949abf04e7 100644
> > --- a/mm/page_counter.c
> > +++ b/mm/page_counter.c
> > @@ -113,25 +113,126 @@ void page_counter_charge(struct page_counter *counter, unsigned long nr_pages)
> >  	}
> >  }
> >  
> > +static bool page_counter_consume_stock(struct page_counter *counter,
> > +				       unsigned long nr_pages)
> > +{
> > +	struct page_counter_stock __percpu *stock = READ_ONCE(counter->stock);
> > +	struct page_counter_stock *pcp_stock;
> > +	unsigned long flags;
> > +	bool charged = false;
> > +
> > +	if (!stock || nr_pages > counter->batch)
> > +		return false;
> > +
> > +	/* raw_spin_trylock isn't enough to protect against nested NMI in UP */
> 
> I don't understand what this comment is trying to say. The nested NMI is
> confusing.

Hi Shakeel, thanks for your review on the series!

Yes, I'm sorry about that. There were a few layers of protection that
I wanted to make against nested NMI, ordering, publishing for stock, 
etc. I think I didn't make it clear what was happening, so I'll
address that in the next version.

> > +	if (in_nmi())
> > +		return false;
> 
> You are completely disabling stocks for memcg charges in nmi context. Why? I
> assume that is what the comment above trying to explain but it is failing.
> 
> IIUC you want to use spin_lock instead of local_trylock because you want to
> support draining from remote cpus and spin_lock on UP are simply disable irq and
> does not protect from NMI. Maybe you need spin_trylock similar to local_trylock.
> Not saying you to implement that but please explain stuff clearly.

Yes, that's exactly what it is. I think there was a lot of thinking
on my end on things to look out for that in the end it just kind of
became a jumbled mess, I'll definitely do a re-spin of what's happening
in the next version.

> > +
> > +	/* It's OK to migrate here, since stock is fungible within a counter. */
> > +	pcp_stock = raw_cpu_ptr(stock);
> 
> migrate between cpus? Why? What are you gaining by allowing that?

All I was trying to say here is that we don't need to drain an exact
CPU, all we need to do is to try and get any CPU. So if we migrate
and get a different CPU's ptr than we initially started with, it's no
big deal (that's what I tried to explain with saying that stock is
fungible). But I agree it's a little lacking in explanation here,
I'll rework it in the next version.

> > +	if (!raw_spin_trylock_irqsave(&pcp_stock->lock, flags))
> 
> Why do you need to disable irqs?
> 
> Anyways, you are changing the fast path of the charge drastically. Previously
> there was no atomic ops and not irq toggling but this patch is adding atomic op
> and irq toggle (not sure about why irq toggle is needed) on the fast path.
> 
> I understand that remote draining is the only reason you need to use spin locks
> here otherwise you will need to allocate work_struct in page_counter_stock. You
> are making these design decisions very silently and implicitly.

I agree, sorry for that : -(

> How about we decouple the decision of remote drain / spin lock from moving stock
> inside page counter? First move the stock to page counter without any spin lock
> or remote drain and later in the series you convert to spin lock plus remote
> draining with performance numbers.

That sounds like a good plan to me. I'll do exactly that and send a
new version.

Thank you for your time Shakeel, I hope you have a great rest of your
day! : -)
Joshua
