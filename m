Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA92438029
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344221; cv=none; b=K68F07OX/z7TjTikYpBy/CxnszXLmpT1F6RiVhWI86ajrxO3UVD5hPRyqJP4tU7TaM7iZTeJ/i2WCwPzNlHLwdIlfDVOvnzHihu/lLD0BFHAURRjFg/BCmeC4k099IzQZZeWAYhoQPXzKs/U9wO9psxWCodoTOZAX32pyUrVZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344221; c=relaxed/simple;
	bh=bOFmxMxZ2G90TQ5a51Gad1RBA6G3ru642cr75z4F2CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG3d5Nsqzfzx25af2IvKpX3eAFzdF5mVwDWBffv/sSMDrXk8wewDpSde8/fO8WyzBqlD29TVgSG3HEgFzMEnxyAhsJYORZXfI81OOND1c5DKp5lHZnmytwDyQCBigTDpHHG8HkAM6jS2i1BNx7S0524NoytvmSalJJDzqLnErsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CU3ytxJI; arc=none smtp.client-ip=91.218.175.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CU3ytxJI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bOFmxMxZ2G90TQ5a51Gad1RBA6G3ru642cr75z4F2CA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788344216; v=1; x=1788949016;
 b=CU3ytxJIrI9sGj1xrKkl99nNiN7qo/kkz6CvoDr5t3F5yNOPwM4InwhL8p2nbzlo4LzxNfol
 WvQJJrjqDDkMNj8v8aNEVawSvCMFySRC0EbNioS8zjoHm5doxq8sn1CVcUvyjVlAYcLm8kJSgf5
 dLTkMjKLyB/N+oIDSlIf8acw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id aa574cb511f2c5a6;
	Wed, 02 Sep 2026 10:16:56 +0000
X-Mizu-Trace-ID: aa574cb511f2c5a6
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 18:16:42 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, stevensd@chromium.org,
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in
 isolate_folios()
Message-ID: <apf3ivSCu9kQfM9F@fedora>
References: <20260829074204.45304-1-baohua@kernel.org>
 <20260829074204.45304-3-baohua@kernel.org>
 <apfZQE1X6zGAsBb_@fedora>
 <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4z=A3EGajzL8F5H+0fwyzh3qqMNACEzo20J83m+T8bbZw@mail.gmail.com>

On 09/02/26 at 05:20pm, Barry Song wrote:
> On Wed, Sep 2, 2026 at 4:07 PM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > Hi Barry,
> >
> > On 08/29/26 at 03:42pm, Barry Song (Xiaomi) wrote:
> > > The existing mainline code retries the same type once in a rather
> > > subtle way. `for_each_evictable_type()` may provide one more iteration,
> > > allowing the same type to be retried if we scanned some folios but
> > > failed to isolate any due to protections, promotions, or races. This
> > > patch makes the retry behavior explicit.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  mm/vmscan.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 35a233623368..718f59ffc688 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4852,6 +4852,7 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> > >       bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
> > >       int type = get_type_to_scan(lruvec, swappiness);
> > >       int total_scanned = 0, scanned, tier;
> > > +     bool tried = false;
> > >
> > >  retry:
> > >       tier = get_tier_idx(lruvec, type);
> > > @@ -4871,9 +4872,18 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> > >        */
> > >       if (!scanned && type_fallback_allowed) {
> > >               type = !type;
> > > +             tried = true;
> > >               type_fallback_allowed = false;
> > >               goto retry;
> > >       }
> > > +     /*
> > > +      * We scanned some folios but failed to isolate any due to promotions,
> > > +      * protections, or races. Retry once to avoid a larger loop.
> > > +      */
> > > +     if (scanned && !tried) {
> > > +             tried = true;
> > > +             goto retry;
> >
> > Seems patch 1 and 2 makes not minor difference than mainline kernel on
> > behaviour.
> >
> > 1, if swappiness is 0 because no swap, it will run two times if
> > (scanned != 0). This is not corner case, but usually seen on some
> > systems w/o swap device. The 2nd no gain run could decrease efficiency.
> >
> > static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
> > {
> >         ...
> >
> >         if (!sc->may_swap)
> >                 return 0;
> >         ...
> > }
> 
> Yep. For swappiness 0 and 201, this patch slightly changes the
> behavior, as I mentioned in the cover letter:
> "
>  There is a slight functional change for 0 and 201: with the existing
>  code, there is no chance to retry for these values because
>  `for_each_evictable_type()` only iterates once. After this patch, 0 and
>  201 have behavior that is more consistent with the 1-200 range.
> "
> I did this intentionally, as it makes the behavior more consistent with
> the 1-200 range, where we retry the same type once to avoid having a
> larger outer loop.
> 
> >
> > 2, for swappiness (0, 200), the behavious is minor changed.
> 
> I guess you actually mean swappiness (1, 200)?
> 
> >
> > Mark one scan_folios() result as one of:
> >       iso     *isolated > 0
> >       empty   scanned == 0 && !*isolated
> >       busy    scanned > 0  && !*isolated
> >
> > mainline:  T(busy) -> T(empty)         -> return   (2 scans, no fallback)
> > v2:        T(busy) -> T(empty) -> !T(...)        (a 3rd scan_folios())
> >
> > Maybe we can go like below:
> 
> Yes, you're right. For swappiness (1, 200), I didn't realize there was
> this slight change.
> 
> >
> > static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> >                           struct scan_control *sc, int swappiness,
> >                           struct list_head *list, int *isolated,
> >                           int *isolate_type, int *isolate_scanned)
> >         ...
> >
> >       for (attempt = 0; attempt < 2; attempt++) {
> >               int scanned = scan_folios(nr_to_scan, lruvec, sc, type,
> >                                         get_tier_idx(lruvec, type), list, isolated);
> >
> >               total_scanned += scanned;
> >               if (*isolated) {
> >                       *isolate_type = type;
> >                       *isolate_scanned = scanned;
> >                       return total_scanned;
> >               }
> >               if (attempt)                /* already retried / fell back once */
> >                       break;
> 
> This `if (attempt) break` makes the loop look rather strange,
> especially for a loop with a maximum of 2 iterations, where we break
> when `attempt` reaches 1 :-)
> 
> What about just changing one line?

Hi Barry,

Agreed on the one-line change for the (1, 200) case - I traced it and it
now matches mainline exactly (no extra third scan). I personally prefer
the for (attempt = 0... ) style because I feel that makes logic clearer,
while everybody truly has different code taste, LOL, just a weak opinion. 

For 0/201: my concern is that on no-swap systems (swappiness 0 is
file-only), the same-type retry when the first scan is busy may be a
no-gain run if the file generation is dominated by protected/ineligible
folios - the retry re-scans the same sort results. But if you see a case
where the retry does isolate folios on the second pass for single-type
reclaim, keeping it for consistency is defensible. Do you have such a
case, or should we drop the retry for 0/201?

> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index bf2786c7247d..ba7adf36e69f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4939,7 +4939,7 @@ static int isolate_folios(unsigned long
> nr_to_scan, struct lruvec *lruvec,
>          * We are running out of the current reclaim type. Fall back to
>          * the other type if allowed.
>          */
> -       if (!scanned && type_fallback_allowed) {
> +       if (!scanned && !tried && type_fallback_allowed) {
>                 type = !type;
>                 tried = true;
>                 type_fallback_allowed = false;
> 
> >               if (scanned)
> >                       continue;           /* retry the same type once */
> >               if (single_type)
> >                       break;              /* no fallback for 0 / anon-only */
> >               type = !type;               /* empty: fall back to the other type */
> >       }
> >
> >       return total_scanned;
> > }
> >
> > This preserves mainline for 1..200 exactly, keeps the intended 0/201
> 
> I guess you mean removing the same-type retry for swappiness 0/201,
> rather than keeping it?

You are right, it was a slip of the tongue.

