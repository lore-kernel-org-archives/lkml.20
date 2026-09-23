Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50253F6B8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180491; cv=pass; b=GZYm2NG78GCbeMDMF+WYZ/om6j4wXqULsk6tr3DJ1nmXwsg4ZtWm0lj+ot1rjcPoUHpFjzyLNKQ+Q3Csm+SOmpoXRn+6MdKCL9ORNlIEIjAzsfBx9hmgvgHAJEnBeP7oejYnRBGo1+3e9TxKCRYoPIgwBGWVBeATJu0/PLrGtzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180491; c=relaxed/simple;
	bh=+gZQqC9B+BUDyYE+tMiw8bRYJDZM+j4YKIzRl4ESdRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTJhqavObeOUZMcUG9dFuf7/HkADtkZ4zG5zf4wSF3OYJYXL3VXDrizBXcBcw9gg/hIl6KthJfOuIdb1QHJ8P/kx/myyouTrCG9m2ucellyibyRcoHovPwT3VsmFljCZkcIs27OQPp5U3JeL/KbE5/w6JewsTESrrOaa0o7bxMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+q5sfQf; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+q5sfQf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso8059395e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180486; cv=none;
        d=google.com; s=arc-20260327;
        b=DC1W+7+XnJSKNwhmxnE4FYuqJrHJ0OUkuizdm7PCvdyLiuot3WPXd+qa/crHNU7Oto
         mLs/74aMe7uYQKSHYGrdKF4PMd5W95MVcPRDvYW7q/tsIlTlY0htLGeLas0RRLBgWqei
         YtNS1ygZmEGne9UWVbV+gGxu+qHfYTWkzpvd/qISKmMOEO4F7O4bgylCNQab/yHZtehW
         cSBlvwnmHaZP6KOg7HIeQhKD/HYr6A0w06+fHmiohTC+G+JfR4TWth4+NT/N+wSzM3cm
         X8nBHAoDr+k3S7UwUBZxQzjrSxd0DtoDqOHPszRGKLQMVGf0xC/mwRETMjA2IRyJpns/
         4/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gZQqC9B+BUDyYE+tMiw8bRYJDZM+j4YKIzRl4ESdRg=;
        fh=/4Eve9H+hrKB11M6PferdlEWQ6nv1iTfeXPT53IB/OA=;
        b=bOzCo73XkRKmF/7zcazTYmBCJf6GZS3Yr9q9UboiNmlGVryF7CXlgwsKqSxg0x04H2
         fmcpZWPtw7IwkSqAz4EbPy4PkKgF6c4HezaoiGxX7AyK5nvT9J02MMKHygCFotTRKSJO
         QtxEtFIuFMKz/alebCCSbH2bwji5QwirTKtYjFl0grbGqNbR/X+USRL5I/svt0Z2/Gcl
         t+TG7emsCBsVbHPVNgsYSS96TMFQrJDbZWdHD0xL7MaMvxrakTbKoreP2FnrDy5RyroM
         rzw7X3fLbp3i/RtXEdVW/nLm70wcJYvouKM0QgRvsEFAyNfEmJUUSWqlvRvQQzXML5/U
         GwJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180486; x=1790785286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gZQqC9B+BUDyYE+tMiw8bRYJDZM+j4YKIzRl4ESdRg=;
        b=k+q5sfQf8V5En/Uab0NVCFdRms2+DRyVGp3AHmOysAD5rXZzzZUQ/Ge6XHQhBeyrIF
         0YIH0u9qbl+TasLWyeq52Tp8wQiIV/ks3h/cJO3SIHM8/MWSI4M8f0jic6ng/prsCD9Q
         mvqR/6MFSwmbYhWA54LRNZoqT4RTJGvZ7AIp5JeA/TgyL2sJO5MWbKu3PPwd9xCb/PCZ
         58opr55JLg3c3CZ7g5+xn2wvruKUQlM5a+Sq25gcWW8Robw2UIAFWWRCmQmBAF0MyuVO
         gy2Q2ZKJGlmBAZwVN6yuXVxT5O3GJAkoWxt0kNECXhuVnj+yAe9kgW38Ji8IlwPLSL7n
         nBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180486; x=1790785286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gZQqC9B+BUDyYE+tMiw8bRYJDZM+j4YKIzRl4ESdRg=;
        b=xa2ePZ+IPtIWXjnivmSR9GaL27jWsot4UroYgX4L0xS5BEwZUqIPL21GwvUyAZ6Kyz
         nos/KuT+8UXNR4Mns3oDVHFvPYns3kvGCmDbh0UKKZhpdnOPU90VeEhuGdfyEJCrb2ZP
         Dtxjw7OjG8ceolRapYPVf/k2RJPYmy99f3SZ5m7TUWLN3I6tu8tVSkQe34nzyl0JTnCS
         Vo8VuZOMm36mPn3hlHh7zbBohFu6YEgWA7C+QpUjraqKlRAni8/BjnY1/6hfNhBihveR
         8WFb6GAD1qwyhHC4JujlsCPrDR1ITQ2X9kkHuEITp6ichR84jC+EmrxeaBP/XxWU2v1t
         tgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWV9vP5psmJ2uxV8nNT6o+fEXO+yh78/KpPyeLJHjD01zaBlmLn/RgWmIg43ose64u9HJleRu4pXjXvFw=@vger.kernel.org
X-Gm-Message-State: AFuF++mhZf16959nu2u4/my130jJSoT2IlmGoot1L3QPabBUmvvpfEVk
	c9C3QIAo5RysHZJug4FgQ0L7pUgEStZTDOAfzTPkf9bJtlzeTsjIVexv17nEoOX86D4+rfaVw4z
	vL6s65Kb2CouSg9twqgXjuP4pAHUDmkQ=
X-Gm-Gg: AYBFou3G1gaZq2LHD6Mqbp4An2bE6+uYKc51zha/dqQ32GH7sdxIU7Ek7j8w8VOiZKt
	/stoR7JpQ6C4h2tEoJuiOvMCJ+vkq0z43M6s4MtzqdeJOHxSxGKoGuj6IaaIyZ2VCQh8dUAzYpY
	VCu6MoCDTNbECpmba3qQLyFhJqBq6sX6XbPqU78Eyiv52NSBFSJg1xyhcu4faf+w5Za0zMp3B2U
	gGoTXYYn107V4H5iwPUSlrKoSXPA8yhz5GbB4F/QnBWym1xMISep5vkJDpC4UkotPpgmre0+7AS
	e192bi1NAXkErkh1pLNGL7BlWAK3p/Wlw5RnJin2DkNzmdWITND1etbduk7O4ZJLhEPXdNWsacQ
	rEhHJVE4vBW7h
X-Received: by 2002:a05:600c:1385:b0:49f:d6b2:4dfa with SMTP id
 5b1f17b1804b1-49fdee0b74fmr42450225e9.4.1790180486307; Wed, 23 Sep 2026
 09:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152449.629486-1-alex@ghiti.fr> <70cae945-3a4a-40db-96ac-5ce66a3fa186@kernel.org>
 <CAGsJ_4y8-wD0yMV8GCtCz5MfNrOKqUaTd+UgH=8MoP_nuvPnGg@mail.gmail.com>
 <108487b7-0529-4282-b5f4-355804b4c0cf@kernel.org> <CAGsJ_4zGmGh70QtRBpnhueev3qt_bgB4ZiE9fkW-hgNjAVhv+w@mail.gmail.com>
 <2e695c8a-4212-42b5-bb51-fbe1aa162e1d@kernel.org> <CAGsJ_4z2nakqBCKd_uAn4bfub99r3NJt2spOUx-K0M7bHW3_-w@mail.gmail.com>
 <4c7c6ea0-84a7-45f6-989c-d1502b90694c@kernel.org> <CAMgjq7DeYsJxG_VCf2KnViV5nd10m-PPYzXRD1fi8QcGWwD0qw@mail.gmail.com>
 <d9a77381-cf88-4726-9223-c16a5c6608c2@kernel.org> <CAMgjq7CLGyLHi7Lb8WF_m9bWUHpMRp_uDrqYNRQsH2GkuVQ=Ng@mail.gmail.com>
In-Reply-To: <CAMgjq7CLGyLHi7Lb8WF_m9bWUHpMRp_uDrqYNRQsH2GkuVQ=Ng@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 24 Sep 2026 00:21:09 +0800
X-Gm-Features: AclHuK_BdL6NqIQOym4w0mnD34hD2lehVVu384RLkcQrbTLuEv6NeiVb7h4sMvc
Message-ID: <CAN_Opa_PrLP7mpF7gRjQUKfoCJGP7KvZMB-23bPUG269QASHpg@mail.gmail.com>
Subject: Re: [PATCH] mm: madvise: drop MADV_PAGEOUT folios at swap writeback completion
To: Kairui Song <ryncsn@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Barry Song <baohua@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	akpm@linux-foundation.org, willy@infradead.org, jack@suse.cz, 
	liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, jannh@google.com, 
	chrisl@kernel.org, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, hannes@cmpxchg.org, mhocko@kernel.org, yosry@kernel.org, 
	chengming.zhou@linux.dev, tz2294@columbia.edu, hch@lst.de, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:15=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Wed, Sep 23, 2026 at 11:47=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/23/26 11:35, Kairui Song wrote:
> > > On Wed, Sep 23, 2026 at 10:46=E2=80=AFAM David Hildenbrand (Arm)
> > > <david@kernel.org> wrote:
> > >>
> > >> On 9/22/26 22:55, Barry Song wrote:
> > >>> On Tue, Sep 22, 2026 at 7:26=E2=80=AFPM David Hildenbrand (Arm)
> > >>> <david@kernel.org> wrote:
> > >>>
> > >>> I guess that's because the LRU is not always accurate. There are ca=
ses
> > >>> where our prediction of future access patterns may be wrong, result=
ing
> > >>> in refaults?
> > >
> > > Hi All,
> > >
> > >>
> > >> Right. But these would happen in both the SYNC and the ASYNC case. W=
hich seems
> > >> to indicate that making the SYNC case behave like the ASYNC case (ke=
ep in
> > >> swapcache before evicting) could actually improve performance?
> > >>
> > >> Or is the SYNC case in general so fast that it is not a problem and =
the
> > >> swapcache is just not a good use?
> > >
> > > I think the problem is not LRU being inaccurate, but ASYNC case could
> > > overshoot the anon reclaim very easily. File folios can be simply
> > > dropped, and increase nr_reclaimed, but anon writeback (swap) can't b=
e
> > > done durig the reclaim iteration so nr_reclaimed never increase durin=
g
> > > the scan iteration. So the scan tries hard to scan and reclaim more
> > > anon folios, more than it really needed.
> > >
> > > I think the real fix is some kind of different watermark, throttling,
> > > or a different counter to limit the scan of async swap. I mentioned
> > > this at LSFMM this year but I guess I presented too much at the same
> > > time so few people remembered it :D.
> >
> > :D
> >
> > >
> > >>
> > >>>
> > >>> Even on Android, which uses zram with very fast synchronous swap-ou=
t,
> > >>> I can still hit the swapcache from time to time. So perhaps with a
> > >>> slower device, such as an HDD, keeping the swapcache around for lon=
ger
> > >>> could allow applications to hit it more often?
> > >>
> > >> Why is that specific for HDD? It's the exact same app behavior indep=
endent of
> > >> the underlying swap technology.
> > >
> > > If you have a shared folio, you must use swap cache, and even for
> > > single used folios swap cache is the way to do synchronization,
> > > regardless of the device.
> > >
> > >>>
> > >>> I don't know. Maybe Alexandre can share more details about this
> > >>> benchmark. I'm also a little surprised by the 15% regression in
> > >>> Sysbench OLTP. My initial feeling was the same as yours: we should
> > >>> release the memory immediately after writeback completes, for both
> > >>> synchronous and asynchronous I/O.
> > >>
> > >> Right. And see if we can identify why we are swapping out the wrong =
things :)
> > >
> > > I think we are not? It's about over-reclaim. In the worst case we
> > > might put every anon folio under writeback, while no folio is
> > > reclaimed, if the device is super slow.
> > Ah, that hints at the real problem then? How confident are we that that=
's what's
> > happening?
>
> Given the fact that ZRAM/ZSWAP doesn't suffer from this, I think this
> is the cause: the main difference is that ZRAM/ZSWAP frees the folios
> after pageout() so nr_reclaimed is increased (reclaim loop just keeps
> comparing nr_reclaimed to nr_to_reclaim), other swap devices keep the
> folios under writeback, and continue reclaiming unless they hit enough
> clean folios to drop.
>
> I can't say I'm 100% sure, and it's hard to verify but I think we need
> to try fixing this instead. It's not hard to construct a case where
> all anon folios are put under writeback due to very slight pressure,
> e.g. a dm-delay (e.g. 500ms?), 1G anon in one memcg, very slight
> memorey pressure could easily put nearly all anon folios under
> writeback.

Alex, One question about the `nr_reclaimed` accounting.

`PAGE_DROPBEHIND` increments `nr_reclaimed` when the write is
submitted, while the folio may still be under writeback and is only
actually removed from the swap cache when writeback completes.

Kairui pointed out that async swap can over-reclaim because
`nr_reclaimed` does not increase while anon folios remain under
writeback. Does the early accounting for `PAGE_DROPBEHIND` address
that over-reclaim mechanism for this `MADV_PAGEOUT` path?

It might also be useful to check this with a delayed swap device, such
as the `dm-delay` case Kairui mentioned.

Thanks,
Kunwu
