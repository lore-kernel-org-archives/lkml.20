Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501987;
	b=3iQgcXEgZTjsyOrsmZyiHwOQWx1waPTMM0jF0hkYXy6JPgibHoKt5XXEBSQTaKjPNmU9
	 QrEu3aConEVSyKBAM+EfjehCpd7BYiK2HvaHyvkUNJVvKNa685FZ+tNpCyiAPCn73wWME
	 TDtyOgSD2j8ipIadv9yQbmPjvWno9m/w6VF9kLl8mp+4k0EZcPSiMdjLhcAc67iFq1S+d
	 64yF7mPgeYBXzHcue+yEvbvZXUgWXjnEDzerUFI8FGn6HI6PYLgnJGCIptKplwCJcYsb4
	 DnNOVLuz3YzqM0FqMxcbbj6lyMSN+qi0xkJFNCOUaz6ecqms2IFfU7pW+IckLqXcMCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zm0NOGDk+3cS5Mg2C1v6yh0sZgFnVUEDDk4kvHgijW4=;
	b=oeV2wbx2GMhdZTzm9QiPBC9C3zm7s0728OTqttsIUMtFZ6w9UYR/KAUGgGe26jP08VC7
	 THR8OJX/UwLPqdxo1L+uO/fBIEsrTP1ehXUPpu5CITErSvf7T/Jl4+deyGICHCehBPq1y
	 6amkHbieM8Sf7INnKXyEKuh94n4wCrjk8eK8Q+zyszt2KXvTQpWyqidrBHFD6Gpsg6sg7
	 5tUaM71UZMYhKx5NUjdWB8iKle/X5TpUMqhfejoytBWwvDZ34QuZeWNDfA38GXfFLImKd
	 bCRjOsFvsUAj0OG2zUrxmXNf29Zx3TGom7cDctKif9cym5TqIt1oK/dBUITw0qHEd2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0bDWaKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B707D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0bDWaKX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso18418915e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501985; cv=none;
        d=google.com; s=arc-20260327;
        b=jF+lEw0kuhoo5np47iSktHni4YtPt25FaHXSpEqdKX21OPgPlEEO7Znl40LJCMFM+v
         4Qdl2869zD3agW6KcvnxwmuluXA0F2nHGwcmLVFjH3l9k9VPydoRpQF7QrdkSQ9dnEY1
         uqIS3Oroc1Imn1ScJ/KWUXr3oCmuP5TXzSJPU3NW+nvkHQpdAWziqvPw6yWCLoAH1MMF
         vVULmZBaABaeUtqg5jXoCKBd18w2cPUj+4/XQkHnRSfTc7fwMxkxeU1ThFRWfLtOScpA
         nWlb7npuCW1mykTR2gAZ+c/Y24yKIReAHrzoWL1eteCpVksoJxQlRIZBy12uEhZrH89K
         m/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zm0NOGDk+3cS5Mg2C1v6yh0sZgFnVUEDDk4kvHgijW4=;
        fh=oypzpqmU7lWBRjjTw32OxRyZMxXoWmZLrY5LmBdonug=;
        b=OPO+NNK4fJEnDJPcUlrC1p+aJk5kJQWDldk/XBysGQXuM8UvDiDlBQt6YOk5u69rD/
         P6Asl7l/Vz2mPK5m0G8BrHlfy8q4+Jn5aegY9WZzx617IHbGU+sJF+AZFxvqTtzASXy4
         4jLtYmGajvWTg6YWHI1uARabxTfPVKPZzBV/J4zfoIsUf0n2y+WA0DLGKh4CfllYJYDh
         erc9GVkvbQg+KkIy6dgBOfmX5+yWuQxOe+92VCUO1MRUjIqQstEB7DpGov2C/Y//dD4b
         d36Q6q3I3sQB7bdKNhbB5FcvFq3qdeaFVO4WkHaNUmLpNV10sm2ws6dWHOWNKFzgD4wE
         /H3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501985; x=1793106785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zm0NOGDk+3cS5Mg2C1v6yh0sZgFnVUEDDk4kvHgijW4=;
        b=e0bDWaKXJM9dccxuU72bmtMeBLCiqXf/S4VLaVDa+BdcueDfL4I/e5b+0YIH89CqeW
         Nyq1Qk3zel3lTehD25QUQJ/Ekg+Qd0t0TMkoLmqzNzVCtqRfogv+tKRA/mE7+cYfN8Hm
         4E7yYPY2QG4mFvrPN7o9kuapBbATXjPL5NQkJKFaLP6zVFfx2wtnLydRcH2TrICG4C3k
         CWrOXvrr+2ftCt+R6EiKCxhwDumK4etgvT+8TkK+Lgyuc9EHsiIkcbmqiBZLV0XvbQvq
         MMH0erCeZs+zzrq73EjtB6r1+4zdrIqG4LP9PLsONDg/4nSvI3e5MoUXJND7euKCr65u
         xxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501985; x=1793106785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm0NOGDk+3cS5Mg2C1v6yh0sZgFnVUEDDk4kvHgijW4=;
        b=1afwgZ2rHto+CWDl7as+WxXhvdptYv4akZfy1Mf6Rqy9Wdeo8KjXNQ2f4uh2c+c1Pw
         ScL9++VVMR/qr7dAK8IeDptxr1BfGHLITVj63+qZnqphlLVznZ4fUwKivOFPNmkp26Yi
         v+ceAsAlTKviIP/g2WFYAqyIhwrOGQatd/UDBPJsSlk2MAJHmIUEN5Mw/3EEMI7rDNsh
         dnqq2Ya4ovyQiveTLPlaLlsTq/qSV173XyRal6FO6ixZERaWwVOVlAR27WefR2f+hwQ2
         bhlb5fh03iblQoG6FuiEMuX6alUl4hP7Nhn2cKbKihSO9KHKoCxNnd5F48Sn4rY9Fzfd
         4LdA==
X-Forwarded-Encrypted: i=1; AKwUvBxxGjFeNzigx4Q0X4IEojuu8nQa2p2DqwAgjMOMI0qU6UfsNCvaBIIl+eSjagID9Rf/foY+AATv9UGktM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpsQb8IkFOmipUviUYuBCmkJ9/MN1VxIW5WBF2uX+n6oz94bas
	16vC0+9vV2IzVgS67oQ9/gLAQpGC8LwDuvVKnY4ExFoQYxzhHeROBK1JU0BXwQZnPHo8YGJkQ4P
	9KOwDRkqtZ8QE0RBYkTGrML9q0KCLhss=
X-Gm-Gg: AYBFou1zJg2aHdGtfsevlXi68MNTut5iihcBJMo4VgrFca9GB3LMqT7lhsU9iRGx9br
	WSL+8klWK65ZjrnAT+gWFbPuy+R4YwSTsOieiUVsbZlxaR7PjSM95tSVRekww3zdNQjjnIYvreW
	388h7mtAlpaca2SggXpCZTQEh4XO860UeTdf8aqixcOAfVdUmGi43Oq2E05ZxK/K+DpSfSksZ/S
	V6GvahyIa7/cetkBacqJRPOCFQ4FW5StiuwNYb6PXK/Jsln5jneab0sUa88JfpJLy2aTUTvVrx9
	hD9Al9xmAow+yEoqf1sBd7YoMnzuI2I7tMzsScT1PDebPooka+0NclC7Iq2wnllejKdPYCEkO/P
	Yc3H7KVqqRZMD+msTSRxq/zVauIvs9gvqG7OTVQg4nqAuJyi8dxEEFO6ug1jJGKGIn/Q8tduxke
	7aerqlzg==
X-Received: by 2002:a05:600c:8219:b0:4a0:108:3b48 with SMTP id
 5b1f17b1804b1-4a1d760746amr244503685e9.7.1792501984828; Tue, 20 Oct 2026
 06:13:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com> <atcRLYvKavedT6Hs@yjaykim-PowerEdge-T330>
In-Reply-To: <atcRLYvKavedT6Hs@yjaykim-PowerEdge-T330>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 20 Oct 2026 06:12:53 -0700
X-Gm-Features: AclHuK-KWlwJ6jupfQN2upeYH99aX1_31TwAq1vK8qUCAkH6OCtgeWVRSWcg6oQ
Message-ID: <CAKEwX=MRvzzd0Fn=UX+LcRo+K9wuqCWSB42NNn7rvZkZukRRrg@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Youngjun Park <youngjun.park@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:58=E2=80=AFPM Youngjun Park <youngjun.park@lge.c=
om> wrote:
>
> On Mon, Oct 19, 2026 at 09:06:15AM -0700, Nhat Pham wrote:
> > swap_cluster_populate() can publish a cluster's table with the cluster
> > lock dropped. A cached allocator can use and empty it before the
> > populating allocator reacquires the lock. The resumed scan can then
> > dereference a NULL table.
> >
> > For example, CPU1 can retain a cached cluster offset on an SSD with
> > per-page discard disabled:
> >
> >     CPU0                          CPU1
> >     ----                          ----
> >     swap_cluster_populate()
> >       swap_cluster_alloc_table() fails
> >       spin_unlock(&ci->lock)
> >       local_unlock(&percpu_swap_cluster.lock)
> >       swap_cluster_alloc_table()
> >         rcu_assign_pointer(ci->table, table)
> >                                   swap_alloc_fast()
> >                                   local_unlock(&percpu_swap_cluster.loc=
k)
> >                                   mem_cgroup_try_charge_swap() fails
> >                                   swap_cache_del_folio()
> >                                     __swap_cluster_free_entries()
> >                                       free_cluster()
> >                                         __free_cluster()
> >                                           swap_cluster_free_table()
> >                                             rcu_assign_pointer(..., NUL=
L)
> >       local_lock(&percpu_swap_cluster.lock)
> >       spin_lock(&ci->lock)
> >       return ci
> >     alloc_swap_scan_cluster()
> >       cluster_scan_range()
> >         __swap_table_get()
>
> Hello Nhat.
>
> Good catch!
>
> > Reject an unusable cluster under its lock before scanning it. Relocate
> > it only while its table is present.
> >
> > Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helpers"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  mm/swapfile.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index c3288910b3e3..988b7316e0a1 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -981,7 +981,11 @@ static unsigned int alloc_swap_scan_cluster(struct=
 swap_info_struct *si,
> >       bool need_reclaim, ret, usable;
> >
> >       lockdep_assert_held(&ci->lock);
> > -     VM_WARN_ON(!cluster_is_usable(ci, order));
> > +     if (!cluster_is_usable(ci, order)) {
> > +             if (cluster_table_is_alloced(ci))
> > +                     relocate_cluster(si, ci);
> > +             goto out_unlock;
> > +     }
>
> If this patch is applied as bloew, does it prevent the issue described he=
re?
>
> https://lore.kernel.org/linux-mm/20260720071342.50742-2-shikemeng@huaweic=
loud.com/
> (This patch publishes cluster table after lock acquired.)
>
> This patch is chagned the way I suggested during review... :(

Ah I missed that patch series and your review! What happened to it?
Did we just never land it?

Looks like we are still doing neither Keming's approach (table
copying) nor your approach (publishing at the end of
swap_cluster_alloc_table()).

>
> As you pointed out, another context can free the table
> without alloc context knwoing this situation.
> I missed this situation.

Yeah I feel like it's still not safe with your approach...
swap_cluster_alloc_table() does not hold nor acquire cluster's lock.
Between its publishing of the table and the subsequent lock
acquisition in its caller (swap_cluster_populate()), someone can still
come in and free the table.

It's tricky. We do not have an explicit contract for the metadata's
lifetime, so it's a bit of reading the tea leaves for me...

I think this is the last gap, and it's rare enough, so this simple
check should suffice to cover the edgiest of the edge cases :) But who
knows :) If bugs re-surfaced again, I think we can spend a bit more
time ironcladding the lifetime of clusters/tables:

1. Allocate outside of lock context, but make swap_cluster_populate()
lock the cluster, check cluster's status, and only then publish the
table (and return with the cluster locked). Basically Keming's
approach.

2. Carefully enforce metadata's lifetime. Perhaps we can add a refcnt?
In addition to occupied slots holding cluster's refcnt, we can allow
for temporary holders. As long as we can acquire a refcnt, we know for
sure the metadata is not freed under us. This is my approach for the
old vswap patch series, but it's tricky, especially with caching in
the picture.

>
> IMHO, Publishing the table only after reacquiring the cluster lock, as Ke=
meng
> suggested, and rejecting an unusable cluster under the lock as in this
> patch both look correct to me!
>
> Reviewed-by: Youngjun Park <youngjun.park@lge.com>

Thanks for the review, Youngjun!

>
