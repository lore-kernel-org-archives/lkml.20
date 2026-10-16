Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291E42AD8B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175044; cv=pass; b=TufMgs5lVAIx5QXcNO0bvFmjr99bI+WPwFUHh4ElaZk8KcA2yBr+XXHLQArbjEOqOXzsmEeArozu9Ura0pKFG+JHOV4ssD+UtZvkM3qO/NA57v2LWWJUtc6d8VPtUBnlzipssMBF7hkT81swvV1JALHc9jIouJkxrEhgcZxWoro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175044; c=relaxed/simple;
	bh=xhckEcuEdZCX9jiTQKxAcLhm+YARqIXTYW4338LVJNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fc3xt6qCGCezjm6qE4Ow9L0JTfifaD96wFFPFVAHPwMg45CnBUEzwypM9exja1yiBBcDyz1ReCjm31V9iVUsgbde811n5lfj5X+gPZNd9eJgACack7YIMAbyQ5IdpJyev6WlzGUxCH4jfy0vdYPfOj7UYkDaNHwvT8EZPLPXCUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJw9QaaV; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJw9QaaV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e9aff12fso24281866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792175040; cv=none;
        d=google.com; s=arc-20260327;
        b=VvH5ciHTVBTSxk7m5QpM8PxNALrhicZf62hwSPVH22mVbJSfzkT34x1KvBDgy+8YcF
         OVxDmiUkdbbNwVDTDz7vZ3G3UU1qn9Skk9S2RoKqgZC19SNxKrRrF5tKrHXKaK3tlTas
         npf6vKsUQI3ateP9cRr8ZJx9/MGHscv4MZy4ZfEocL5asr7NodYAxhObCkcw3Qzo5/GI
         ePspXMyQLa5/ELJmn3JxPzTFIFv2GVr3Kawg9WvMvNcLlZ/FKgUkcOml5+/eYqMw2itp
         WzjjHFP120MKUju8Q4wJ6xtAYQw19Fb7ubiLyp9xAL//ExNpijuITu8wngmHV8CJwBz2
         sxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w75Itn64ZChdQT8oH7KrgM0cKGKRcQXZsqbEawl0SYY=;
        fh=8tfG/N7kxFwSiA+7xCgmW6nC5t0XOKCQGbhQkrVO8Wk=;
        b=WcUWY/JyZHCDNwtyHLvug3PN35XVUpnD053wNbPp7TYqUoS57Fb+Sbg1D5f5iqwxsF
         JDwurhVe210vVqqS9sQB9NwK4CfJahBYO8MScKxr3u1oocK+Np1zUbOatXPRIwf5J6H8
         yagOEJA+AfqiXJM3048sapF0sel5RfV3i/sPRoqek6XEUKHwau/GkXgwVuxNZL2IV8wG
         b6JVfACVy2azeg5p1USUa+As8wRdkyC2K7gGRDAaPsny47kvV9bS0JbUPAEWSd+YfU+8
         oDJTvygh4AMaeoq7b0ePy4FfdHgzSOhpkq5VUc40ybg4l0CrQ/3hGbOe6kPjgapnbJY0
         cyVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175040; x=1792779840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w75Itn64ZChdQT8oH7KrgM0cKGKRcQXZsqbEawl0SYY=;
        b=cJw9QaaVVvhQljqIpcDqvt4K4VIaLO86O0yBg6q4SkEv5r5bgSo9FbiEEZN86UfT98
         R0yr6jt04leSxO/eHhrL5htSDm3o6W24POlsJqoq6IZruzvMq4fpysBXbPgl12zJwvQ6
         eai9YUALIxZqHX7BDpDSdsSyntTdmcDl4KVDSluCph7iATMJKKNz60QUYHm/4bRaJ+Ev
         UFraEx9FhIa6duo1203gbsyCAWAvFuBPeQM1SwCAv0Hl2OqW+1EGCq2MgEE5clqIV06T
         q4Bdj1pvAPNIVrG9ynMuPl09l8KSlJhJspU/8HyDTBGhiqeFmMW8ZpKkOSoTu7lDPyIw
         uxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175040; x=1792779840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w75Itn64ZChdQT8oH7KrgM0cKGKRcQXZsqbEawl0SYY=;
        b=17BL7OwWuUKjQ7JENkCJP4I4cffbDadBrTRUCXJ6ljniixcWcxnX9M1y0atycetysg
         XAH+zRMSlVcnJJz9Yk3IJr8FdKJH35nacKwsq2qFUy9I9jrOwSdmd0daipeVemahrA6a
         uRBqTTcLhGnt65XFd1SsbAo0IzhFkBdz8njljOA/sjdWtFJwCh/Qm1g3fEVA5xBB83St
         kS/z1Saqawac6gHfgb5s/y2vT5/51PKi+X7saiqiAGxKz51nvdRrvIzZZDTQTBsTn7O4
         w5ZuiW1GKl6qHMvsiuag6qZODt1yXQ7axXfA4qNc6mLhmqYts4J2G/YByIcTunVFH2AQ
         DHyA==
X-Forwarded-Encrypted: i=1; AKwUvByX5n8EP3Pc1LEL93gKGMFtiVaW8EAWo5ed3bJgWH8AiQr3pZ0chatAIrFJSnf7Q92t7NwGtBAgggXl/Es=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjQPdWT8xVU9ZdamLSlpGxDQH1dDBjxdva1gs/qvji0ohyWf3r
	dp2VKJ5rUX4n5dEZAswrp+G/dM++3DKn6ow8KYLQXqTH64hf/5tIYPam9g+T9Uq4BToX/ugsntt
	xBTTafuyzwhzgql8m0waFLkmjyPivQ78=
X-Gm-Gg: AYBFou2aZRFYzBhIGkr0t46trQCT6v2YGka7bXqoKS7z0ZZEAQLGCR8xgQaq1pkeQnb
	aPIOuxpjKBdk53pv1elhc34fxzlni5vvACRdCSeJiky5ZXoKVl9gdsWpIFWVC8fJdDG4GKi3IjM
	+LQSQ52U7FjM8781Q3XjpTl81hTrsaw+YCeKIik1D41yPKlp76NMHMJSNhma7LoVmKJoJQHOo/A
	XuDL+5CFxRnADUIQ24eZ89ey84DC9idKwz/mzMUPHvAYZ3kaZuit2X0FC5DGWsW0h+oSS4UT0C0
	fOkrDoTNuj3TE/BuST5LriLvtBSge+qUJxBDJ+d6hLLD/gLnjCTkxKd3+zjky6zEZhzIluL+2id
	Kf9GK4DU+VoNi
X-Received: by 2002:a17:907:d093:b0:c3e:f39b:2296 with SMTP id
 a640c23a62f3a-c419ef28605mr49454866b.31.1792175040404; Fri, 16 Oct 2026
 11:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com> <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev>
In-Reply-To: <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 17 Oct 2026 02:23:23 +0800
X-Gm-Features: AclHuK-zxjRkwCzmw2XhMz0WZw6yQmarZum4XoIWybkkjlf9dokqBMg1hg7DPBI
Message-ID: <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:42=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 10/16/26 11:05 AM, Kairui Song wrote:
> > On Wed, Oct 14, 2026 at 5:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linu=
x.dev> wrote:
> >> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> >>
> >> On our production hosts we saw swap cache only pages keep growing for =
days:
> >> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> >> swap slots were held by folios that no process mapped any more, charge=
d
> >> to cgroups whose workloads had long exited. The only way to get them
> >> back was swapoff, and with other services actively swapping on the
> >> same host that is not an option.
> > Hi, thanks for the report.
> >
> >> Such a slot has swap count 0 and an unmapped folio pinned in the swap
> >> cache, left there after a process exited or did MADV_DONTNEED. No page
> >> table holds its swap entry any more, so nothing comes back for the
> >> slot; LRU reclaim drops it eventually, and the allocator only reclaims
> >> such slots once swap is half full. The growth stopped exactly there:
> >> at 50% of the device, where vm_swap_full() becomes true.
> > Hmm, I think this indicates a much cleaner fix is available.
> > vm_swap_full is inherited from the old allocator, we can instead just
> > let the allocator reclaim the slot if the slot have a count of 0 and
> > ignore vm_swap_full at that point.
> >
> > Will this work? (Just a minimal implementation for reference, will be
> > even better if we can avoid the overhead).
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index c3288910b3e3..94670fe82f31 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -212,6 +212,9 @@ static int __try_to_reclaim_swap(struct
> > swap_info_struct *si,
> >          nr_pages =3D folio_nr_pages(folio);
> >          ret =3D -nr_pages;
> >
> > +       if (folio_mapped(folio) && !vm_swap_full())
> > +               goto out;
> > +
> >          /*
> >           * We hold a folio lock here. We have to use trylock for
> >           * avoiding deadlock. This is a special case and you should
> > @@ -903,8 +906,6 @@ static bool cluster_scan_range(struct swap_info_str=
uct *si,
> >                  if (swp_tb_is_null(swp_tb))
> >                          continue;
> >                  if (swp_tb_is_folio(swp_tb) && !__swp_tb_get_count(swp=
_tb)) {
> > -                       if (!vm_swap_full())
> > -                               return false;
> >                          *need_reclaim =3D true;
> >                          continue;
> >                  }
> >
> Hi Kairui,
>
> I tried it on our box (224 CPUs, 931 GiB swap partition). It doesn't
> help there: after 100 rounds of the reproducer the leftover is 291 GB
> with it and 309 GB without, and both stop growing at the same place,
> 488 GB, half of the device:
>
> # cat /proc/swaps
> Filename                Type        Size        Used Priority
> /dev/nvme1n1p1                          partition    976561148
> 489006260    -1
>
> # cat /proc/meminfo | grep Swap
> SwapCached:     489006260 kB
> SwapTotal:      976561148 kB
> SwapFree:       487554888 kB
>
> cluster_alloc_swap_entry() picks clusters from nonfull_clusters first,
> then free_clusters; it looks at frag_clusters only when both are empty,
> and at full_clusters only when vm_swap_full(). A cluster gets onto
> nonfull_clusters in partial_free_cluster(), that is when
> __swap_cluster_free_entries() frees a slot in it; after
> alloc_swap_scan_cluster() has used it, relocate_cluster() moves it to
> frag or full.
>
> A leftover slot has count 0 and a folio, so __swap_cluster_free_entries()
> never runs for it. Once the live slots of a cluster are gone, nothing
> calls partial_free_cluster() on it again, it stays on frag or full, and
> cluster_alloc_swap_entry() doesn't pick it until the device is half
> full. That is what the swap table looked like after the run:
>
> list      clusters   leftover slots
> FULL        106415       54484480   (all 512 slots leftover)
> FRAG         44822       18471614
> NONFULL          1              0
>
> Making cluster_alloc_swap_entry() revisit those clusters means changing
> the list policy.
>
>
>
> > Or, from the LRU's side, put swap readahead folios at the tail. I'm
> > actually trying to do that and it's not very easily doable at the
> > moment but will soon be easy to do.
>
>
> That helps the RAM side under pressure but doesn't give the slots
> back.
>
>
> >> Options considered:
> >>
> >> 1. Fix it on the readahead side: after the read, check the swap count
> >>     and free the slot. Covers the lock, not writeback, and the
> >>     asynchronous read path unlocks in the bio completion where the slo=
t
> >>     cannot be freed. Two places to patch, neither clean.
> > In fact, readahead checks the count before starts the read. It should
> > prevent some of the problems but seems not enough.
>
>
> Right, the count is still 1 at that point. The zap drops it to 0 while
> the read is in flight, after the folio is already in the swap cache.
>
>
> > And another idea, what if we just add dropbehind flag or rotate the
> > folio, if folio_try_lock failed in __try_to_reclaim_swap?
>
>
> dropbehind would work for readahead and writeback if the read
> completion honoured it too; today only folio_end_writeback() does, for
> zswap writeback folios, and swap_writeback_dropbehind_folio() expects
> the folio off the LRU. It still misses other lock holders (migration,
> split, ...). Rotating only helps under memory pressure.

Right.. But I think it will be much better to avoid such folios from
hunging in the swap cache in the first place instead of having a
worker to reclaim them. I'm not strongly against adding a reclaimer if
other approaches are too difficult at this point though.
