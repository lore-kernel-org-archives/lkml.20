Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A19031960B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689787; cv=none; b=gIBMd+OsUumWWsdl8djOWQbV1fcwmPYhG+YBgT5SgytpXtt+WvUrhaKsKkPZTxlvrZmTcrm2adFwNcG87ucei03fjlyrfV9gHV65jLLHwx1UYTaUXqcsyY9gQAw5GvoHuo36FEziz0zPNqpuFw3+KfwwaF2qEAGqffOchxDaLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689787; c=relaxed/simple;
	bh=DSx8wyjJ2QOqaYJeHeVitsXt6StYVQcmczlAWA1NmQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4plG//u58+SN/BOQKoQZQxzbh80pe2QlYZcI0lIItnHRbzq+RcHW9ji/CfqXQyGwqpJ6C7FKV93ugo2T2O5ctk+KqZk6MnszBW///QjYRN3Mtf0mn0HRifvKh22puYuCO4BdqHtgLpoKMKegjRg6L8BnxeU4CMY0mC+ZVLo9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw7nCM04; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw7nCM04"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so35185345e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689784; x=1789294584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ojcatem/E1McFU2tn3fpwcM30WG5bWRqceZT/nBgCPQ=;
        b=jw7nCM04vUlfyLZcmWVrcx3B1+3ihoRKhjS/rTEesM8u7cmggjj1+cimiLG24yxZ6w
         qwtKXyHX64jE8MKYg6T+wSyw5pTtxRgGjDF1/8cT8O2S1YJhv4MOIqvSdpVYtuUBGic6
         ex71GxWuQ67a5oGJJ/MhKJRspo9R2CxVJkUwgxUTmxTlPp9n/F/ve63NnxDzul3nBx5B
         OJEfKeIvH0VAnaP2kUuN+VSoqd+v7aLyT3LDuu1LK7H4C9kYn2Y9upr2grAFzlGBHh/p
         0/uaciRiE/s1du1AW8qt7k7kqNBZrL51pk0ZEwZ99eoTQf9ofT03jHq4xCVpxdwVFZRw
         efCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689784; x=1789294584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ojcatem/E1McFU2tn3fpwcM30WG5bWRqceZT/nBgCPQ=;
        b=h5fG4U2nAghzgQLs/XazKrDptP4xnw8F+bEgv5rCgobr9I/ZrtOAvMRvY/L02dDtGN
         sFSN63NLLHZA2gqG351iAbq51QChFz70Hky33VJqXbpc6s8B4vZ5QC9yIIvB9nkQx9UM
         PrJcQFn+sxca2Bs/NbusvdGXKowFMe7vvTFAfpASY/RKAp0rxcNh/Ig931ciMN275xl1
         UaFurrnphbUspUVeUyUkuQBi/VtoAUNMpu7zu4Wi4MDARkWkX5pHFiwc3hajmD34Em4a
         DuEROOSjG/iD4dbuBNBypZnCTdjyrR56PEyfHY5//+UWnltWI6vAucQ1LyytHtBwlRrd
         UREw==
X-Forwarded-Encrypted: i=1; AKwUvByjV4vYIcw4yq6UHhBmUTjIHEWhJd8FOR6Q8oyNrrnevLjFdu+TCjRudp4pCM30CT2s8b3M/cUa/347KLM=@vger.kernel.org
X-Gm-Message-State: AFuF++nU9ROdqc8imva1QhLbnFqJiycEF2veCKEvfuu1lFXVEf+JuDOu
	aWzQlLbQnpc/6PZik69fX4xn09tpiYM630XaYoyBelOH+nphneXEmZRc
X-Gm-Gg: AYBFou1JHf5urX3jpwKxfS50MdSdH3FuvbMdAFgYWFIh+cfwM+PKiRazIXi/2JtrE4t
	YVntaUTHe69/xJSx4jDDPgGOI/xJ8+4kkaJ93tkZiUDKYAwawkJ8bgdkEU40DS3G1Pjgp1fLvrj
	FEkTN4nTo//Q2wqaIWaN+MrV0sLzWxPq2qdW8SWGa/NcNV7/q2TC1eCHD7ODOdAuJpAdU6Eva5h
	K3cwMozORqzslv8qHWLCsRVWtWdk4JYl5alrAih0jVhiRMs+Tg59IStmI+yQR/ylwAX0ZTVYhSq
	ug1X9IrBmHX1YDnZjAb034+cPeKMugKZt4NCeGTv+e2r5oSIQJ4ZeQ0NWiFRNhUNqAm8tkFF3gu
	0I/wpXZrH7K9AFVj3VSt6t0hIT6f8N0uIltoIdESA1K7Q4g0k822z0WXegm4CilBNyMjirOOFbY
	Fkwjq6Mh+A/mP5hTp04SsgzH95OhqRF6DLxHed5DHYl4Js6VDkLIlamVSy+PvZHignFOnJlGC0T
	TLozOWpBfwNhDgwwKHM6qJKXA==
X-Received: by 2002:a05:600c:3b11:b0:49c:f7c4:dc54 with SMTP id 5b1f17b1804b1-49cf82512b9mr288796435e9.14.1788689784162;
        Sun, 06 Sep 2026 03:16:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03703f13sm57044775e9.0.2026.09.06.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:16:23 -0700 (PDT)
Date: Sun, 6 Sep 2026 11:16:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Muchun
 Song <muchun.song@linux.dev>, Kairui Song <kasong@tencent.com>, Qi Zheng
 <qi.zheng@linux.dev>, Barry Song <baohua@kernel.org>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Chris Down <chris@chrisdown.name>, Tejun Heo
 <tj@kernel.org>, Yu Zhao <yuzhao@google.com>, "open list:CONTROL GROUP -
 MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, "open
 list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)"
 <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, Ridong Chen
 <chenridong@xiaomi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/page_counter: avoid integer overflow in
 effective_protection()
Message-ID: <20260906111618.644362b3@pumpkin>
In-Reply-To: <f65d4985-5e21-4e29-b5f4-dcff0fa479ab@linux.dev>
References: <20260903031952.1120321-1-ridong.chen@linux.dev>
	<20260903031952.1120321-2-ridong.chen@linux.dev>
	<20260904093743.23cde26b@pumpkin>
	<f65d4985-5e21-4e29-b5f4-dcff0fa479ab@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Sep 2026 09:11:24 +0800
Ridong Chen <ridong.chen@linux.dev> wrote:

> On 9/4/2026 4:37 PM, David Laight wrote:
> > On Thu,  3 Sep 2026 11:19:51 +0800
> > Ridong Chen <ridong.chen@linux.dev> wrote:
> >   
> >> From: Ridong Chen <chenridong@xiaomi.com>
> >>
> >> effective_protection() scales a parent's protection by a ratio of page
> >> counts, e.g. for recursive protection:
> >>
> >> 	(parent_effective - siblings_protected) * (usage - protected)
> >> 		/ (parent_usage - siblings_protected)
> >>
> >> The multiply is done at unsigned long width before dividing. On systems
> >> with >= 16TB RAM the product can exceed 2^64 and wrap, giving a bogus
> >> protection value and silently breaking memory.min/low enforcement.
> >>
> >> Use mul_u64_u64_div_u64() to multiply in a 128-bit intermediate. Because
> >> usage and parent_usage are not read atomically (a child is charged
> >> before its parent), usage - protected can briefly exceed the divisor,
> >> making the quotient overflow 64 bits and trap (#DE on x86). Cap it so
> >> the ratio stays <= 1.
> >>
> >> Reported by the sashiko review tool [1].
> >>
> >> [1] https://sashiko.dev/#/patchset/20260826133054.88529-1-ridong.chen@linux.dev?part=1
> >>
> >> Fixes: bc50bcc6e00b ("mm: memcontrol: clean up and document effective low/min calculations")
> >> Fixes: 8a931f801340 ("mm: memcontrol: recursive memory.low protection")
> >> Cc: stable@vger.kernel.org
> >> Assisted-by: Claude:claude-opus-4-8
> >> Reviewed-by: Barry Song <baohua@kernel.org>
> >> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> >> ---
> >>   mm/page_counter.c | 19 +++++++++++++------
> >>   1 file changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/mm/page_counter.c b/mm/page_counter.c
> >> index 661e0f2a5127..e8bd512069c5 100644
> >> --- a/mm/page_counter.c
> >> +++ b/mm/page_counter.c
> >> @@ -8,6 +8,7 @@
> >>   #include <linux/page_counter.h>
> >>   #include <linux/atomic.h>
> >>   #include <linux/kernel.h>
> >> +#include <linux/math64.h>
> >>   #include <linux/string.h>
> >>   #include <linux/sched.h>
> >>   #include <linux/bug.h>
> >> @@ -356,7 +357,8 @@ static unsigned long effective_protection(unsigned long usage,
> >>   	 * otherwise get a smaller chunk than what they claimed.
> >>   	 */
> >>   	if (siblings_protected > parent_effective)
> >> -		return protected * parent_effective / siblings_protected;
> >> +		return mul_u64_u64_div_u64(protected, parent_effective,
> >> +					   siblings_protected);  
> > 
> > On 32bit it is only necessary to use a 64bit intermediary.
> > mul_u64_u64_div_u64() will drop back to the (probably faster) 64 by 64
> > divide (and then maybe to a 64 by 32 one).
> > But there is a lot of extra code before that happens.
> >   
> 
> Hi David,
> 
> Thank you for your review.
> 
> Do you want me to split this for 32-bit, or is keeping the single
> mul_u64_u64_div_u64() call for readability fine with you?

Maybe I'll look at wrapping mul_u64_add_u64_div_u64() with something that
checks statically_true(((a) | (b) | (c) | (d)) < 1ull << 32).

Probably neater than the conditional here.

> 
> >>   
> >>   	/*
> >>   	 * Ok, utilized protection of all children is within what the
> >> @@ -397,13 +399,18 @@ static unsigned long effective_protection(unsigned long usage,
> >>   	if (parent_effective > siblings_protected &&
> >>   	    parent_usage > siblings_protected &&
> >>   	    usage > protected) {
> >> -		unsigned long unclaimed;
> >> +		unsigned long unclaimed = parent_effective - siblings_protected;
> >> +		unsigned long unprotected = usage - protected;
> >> +		unsigned long parent_unprotected = parent_usage - siblings_protected;
> >>   
> >> -		unclaimed = parent_effective - siblings_protected;
> >> -		unclaimed *= usage - protected;
> >> -		unclaimed /= parent_usage - siblings_protected;
> >> +		/*
> >> +		 * The usages aren't read atomically, so a child can transiently
> >> +		 * appear to use more than its parent, making the ratio exceed 1
> >> +		 * and the quotient overflow 64 bits (#DE on x86).  Cap it.
> >> +		 */
> >> +		unprotected = min(unprotected, parent_unprotected);
> >>   
> >> -		ep += unclaimed;
> >> +		ep += mul_u64_u64_div_u64(unclaimed, unprotected, parent_unprotected);  
> > 
> > If the ratio is forced to 1 there is no point doing the scaling.
> > So maybe:
> > 		if (likely(parent_unprotected > unprotected))
> > 			unclaimed = mul_u64_u64_div_u64(unclaimed, unprotected,
> > 							parent_unprotected);
> > 		ep += unclaimed;
> > OTOH if the min() generates a cmov rather than a conditional branch
> > then you don't get a statically mispredicted branch in the normal case
> > (which is very likely with the empty 'else' branch).
> >   
> 
> I'd rather keep it as-is and avoid the extra branch. Does that work for you?

I nearly came to that conclusion while writing the comment!
Actually the same might go for the other three tests - generating a 0 or 1
from a conditional move ought to be better than the possibly mispredicted
very unlikely branch.
(I am right in thinking that they should never fail?)

I also suspect the #UD is the least of the problems.
You don't want the scaling to produce a bigger number at all.

David

> 
> >   
> >>   	}
> >>   
> >>   	return ep;  
> >   
> 

