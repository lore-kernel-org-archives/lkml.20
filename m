Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036150;
	b=yPmIU+BDhZLAfdQWRW6I2pDtrD5IB2CUCUzPltFacDr8VvTBMbjBaG4Hh7/jSl+yDajq
	 cPohyaaSdPtSWQcS2FsLWYNjSLl7pYLUQFolHecQWsMtZEvLFvCeb5NBx+UAoPJWx8jVF
	 Q7tdjbhk5/m7mI11FpKSmOnEFQaGYPym0rqGUKeSykC3g55somuoLAdHhAlEyYwSFyxrV
	 +3nR+Z00thL8kFvddI6g/5YPwuq/qFHFbUToKvQMAdRelurVfhN9xS2+XanxAb+o13wjr
	 mcEHVw1asQU1syKWqkoX9NqxXVgIXmC/kFGPoVSXMe3nz+UxIQvJ45mAjc82N7klkiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036150;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=p57Tmn7TFfUdAr/vqk6pOopFQQ8MDZrPz0wvkpVt3BE=;
	b=i3Vzk2xStTm9ePW+S3M5r2VX+EnCB+H4eFemtsYttSc9dqItf8ZYwBcuman0Pv1y91oY
	 cP0bp0aDyX7UoiMNWIlW+qh5m2YCdWyLqhkRSmtW7CI0e7C2ibGQoc1azL+d8rvraYvtO
	 w470ZwVMKB7n2iMdo4d1n4oN2kHqw7PqCTeT+fnyYAWcpofhPe9ZiiNumAhgWcR68vfgR
	 Xu6r4Te4rsN5G0yoNg1kZ+YgAQY0J2eGVOmM0+wGa9CJQsZPFBgdxjHYiQ14BUheZaRaN
	 5vP31mLHNj39LRTPc+R1sQjb/vFPazUZ2alIifeyxkG2JbTZNe/bJ/tb54zvdUGAhIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=QFNfM0y8;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81563606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81563606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=QFNfM0y8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p57Tmn7TFfUdAr/vqk6pOopFQQ8MDZrPz0wvkpVt3BE=; b=QFNfM0y84n8HNmyTQBiC/PmI1a
	S9aK0qFwTYUrJzLuIURYWYZoM9OZHdram0kZ9RIATbTiQq+NO+wxfzmVhwcwlLXUB74lCyEfxK3fg
	Z/teZZKQNTooIbZ3IyAZERvssM7L0OA9NzY7SrNhTVrekPvnhTCvxSN+XRr6Sevo7MqoNXAnIivv7
	F/fUDEG/WmMTN9nxa4AcmbKMKWItPsCt8loGE8z3fl9X7WpudfYp0z7Bx7eYTJBIXT+Jvwwx9J1V9
	HC37tZ6HAXi+4nYonTcw5eLDYd04a29oDYPz58e7km6rqFF7Dk794Uja/InO+UOUDZLY064M9JziD
	7rWSFt7w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLObe-000qPO-1i;
	Mon, 26 Oct 2026 17:35:34 +0000
Date: Mon, 26 Oct 2026 10:35:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] mm: kmemleak: scan modified objects as soon as they are
 grayed
Message-ID: <at9-71-c98SYDgLY@gmail.com>
References: <20261016-kmemleak-gray-drain-v1-1-3270256fdc8e@debian.org>
 <atY9xT4MfPL7R8fo@arm.com>
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
In-Reply-To: <atY9xT4MfPL7R8fo@arm.com>
X-Debian-User: leitao

Hello Catalin,

On Mon, Oct 19, 2026 at 04:56:53PM +0100, Catalin Marinas wrote:
> > @@ -1981,8 +1985,13 @@ static int __kmemleak_scan(bool full)
> >  	 */
> >  	rcu_read_lock();
> >  	list_for_each_entry_rcu(object, &object_list, object_list) {
> > -		if (need_resched())
> > -			kmemleak_cond_resched(object);
> > +		/*
> > +		 * Scan newly grayed objects now, not after the walk: one may
> > +		 * hold the only reference to another and be freed by then,
> > +		 * like a maple tree node that keeps being replaced.
> > +		 */
> > +		if (need_resched() || !list_empty(&gray_list))
> > +			kmemleak_cond_resched(object, true);
> 
> I think that's a good way to reduce the false positives for such maple
> tree scenario.

I've created a reproducer [1] for these common false positives I've been
seeing, and this fix removes the false positives.

Link: https://github.com/leitao/linux/commit/1291579c487303c5ffbea2cf532649d26329c8a9 [1]

> Do you have any numbers on how much this extends the scan
> time by?

It doens't seem to extend much, from my quick test, and I am more than
happy to test more:

    workload                     base     patch
    idle                         526ms    527ms
    tmpfs file storm + 1M VMAs   10.78s   11.04s
    mmap/munmap churn + 1M VMAs  4.61s    4.67s
    guard page reproducer        13.46s   13.69s
    100k unrelated objects       672ms    738ms


> If it's too expensive, we could rate-limit it, say every jiffy.

Yea, we can rate-limit it. Do you want to see it now as part of v2 ?

> > @@ -2082,7 +2091,7 @@ static void kmemleak_scan(void)
> >  		bool dedup_print;
> >  
> >  		if (need_resched())
> > -			kmemleak_cond_resched(object);
> > +			kmemleak_cond_resched(object, false);
> 
> Nitpick: instead of passing 'false' in a few places, rename
> kmemleak_cond_resched() to kmemleak_resched_drain() (well, some better
> name) call get kmemleak_cond_resched() to call that with 'false'. We
> could also move need_resched() in such function, being a small wrapper
> the compiler should inline it.

Very good idea, let me respin this patch with your suggestion!

Thanks for the review,
--breno
