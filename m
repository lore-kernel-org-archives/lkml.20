Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792995031;
	b=P/d63b7f7441KVYr1uRYq1f773ljE3e/o9XF4aIkn41kdHvftBdBzn/3WMIeKe69WQFF
	 ZZSFl1Bl9MZAfdM9BbiBzpjhDvZ5duceqdejLClM9Foissz9luGUqJYZix8Eq7ApbgsGd
	 VWE3/gS0mH8qxWsFBF8Kpti8nkgboL0pnHbGCSurnkzXlTYh82haoISYrrvhf+Exchj9f
	 iPjnvyDbcCPXLqlp6ueAA5n9v0WP82qPYiX4uFVdqJmi2/46fmyaYdfRx18/r5iWh39uF
	 g7Zbq+Sm9tcG1HQRHW+Z6jvEjmjacmzZvL3k+gMaviGgLA0z0XrBZ+oSBuREonSpBnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w6zdNpT49yF2zRejshj3qPDRTy4Hn3G0HLLG7FYdjro=;
	b=Z+huA430svC0r1znAxoZZa0+FS2DifHHUggkSMEBLMQm8eckYKozFWWaz8bXsV1piAJW
	 +EyRSF05RQA9YKov1p3L48sVWl0FxhiOmUI1L8qVsr3WnQkN1IV9cyzkob/2ivdwYfB5a
	 MPkRMO30Nle5I/Z6D8/EHYeR5Xo4MegbVWn3HO1lUs7r5u2aX4NkrkXj5xRtV/gWpWMAh
	 mOJJQyNKqFt1FakV1+thyTiFU5FN2Ufx0c4T4SxhcJ2CZ/+MtU/eHhw/mydbzaSPTIZ6H
	 F/ytilINK75FG7gxQVWwv1oh3VC0Ci4cWemRGDbe6clleUpyW3RVw3pxKWLXgz3MI3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GBprDVpW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB5E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GBprDVpW
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so15522705e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792995029; cv=none;
        d=google.com; s=arc-20260327;
        b=fzVOUakBZmVdsqL/q5xwynnY8kbYxINb2KacTtEGd4SgJ3csMZ6hKOWXM99FqZgf8M
         n1YIMPkcJU0VpAMpQSDognIV8itHOfM9OXi4y1XGrFNWARoOH5us02iz7x7NerRaif7p
         +Xc8nlSFFXHrSsS/uj6ZQTFTDhWS+S/CM5yL3PGmbunmSGfZAmPRhPi/yLEUifSwf9Zq
         UT9VN1mcMIUzu/s+G5tEyo3p5C5YbxoE85+fE4mjhHjt2c8EgD8w11H8eNpSCQtkYBE0
         zijx4L7sG1tDvFXR5Zilw5N2bPXaThkNGf/1ol91oqZ0ZfcfWpQ4dZSvmeT8LFUvciir
         UL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6zdNpT49yF2zRejshj3qPDRTy4Hn3G0HLLG7FYdjro=;
        fh=AinT0PWDxQOhb0Gdlstur5moi2k2t78Y940i1yP0mhw=;
        b=hQsCXs1klvJzrQBVuJ4x23DiXOAbtop5E0T5Xui2o5kuysKzaitvHXR7OdEKTuVIcf
         fAEPIau3DluFq0fqavaFrVTQovrXMkJe07T/M2M6ZcNjJr61YB4qoPMP0y4oINkP2rGa
         TGN65+kQ9BsasB5VkS4cKeRsqZJ2LVrxALxGteXCh4ly/8vSvM6cBmtFqPjf1KTq1kmq
         +u8E4UrJb/bLWK61eV/oVgYE057+JMyQ10MdjQQUaLH9tgwTefzB/fqriURjm/jV7bK3
         Ag+XdBmu5Yc+nP+sZyRuGUZEBKXKzwFYfswaRuAcwlK25k4+xCrCxjAcbXdVkv3DQfUI
         DlWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792995029; x=1793599829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6zdNpT49yF2zRejshj3qPDRTy4Hn3G0HLLG7FYdjro=;
        b=GBprDVpWrFHhKDW+sGqzl2fYt1tIXVWH/JIRh3NYuBcBZOfEcaskq540pIj+NlxDx8
         4e3TGss2ca5bBbPBZlgxyFkxERqxPPYwJDCqwQD6bRLJDU81uG/woCR8ascf5rFbw9h1
         kqn+NMNVqLTOfJbARGSIKQld76IjhDiB9kB1PfTS7nwM+xaJ38JumU5yyOTMLaCXE9y5
         bRG3N24rI6vPf/IQlaPxPGNsKVkeArsjubvhprRNtzJXuB/YLqoSFCUMo6JaZFfSH0mg
         Dkkwj/p2j5HsGDs1RsaBrA+NmcM32XJz7lEpYJSxPQ/9Zly2EQtZhW+3bUk0KLk47Jcu
         Fzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995029; x=1793599829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6zdNpT49yF2zRejshj3qPDRTy4Hn3G0HLLG7FYdjro=;
        b=Uh6Sq7SLvwpJ2ZpzgvzoxQ7Dm/7n0HmKRKFO6UDs25dGT4adJvkkLlA6z3MXEIUn61
         0Da+jK+wGvsMtzXqqkqGekMjLA6RGPzFKb8S+whL2PfUv2T5JOEdIoNri1qhNJFnOH/S
         qxuol9qStJ+mgvhUCEisGYc7PSSn1MXmNf8JzqqLhAAcA6ZCK0kz5X33NW8r+mbztacq
         iHPbTN4S9S0WiaS33FEftkb++5cZSmRIY0z0b/SCkY7vX7urXPQwwDXdnxGbXgmMyzrh
         LS8t8SoAoA3rQaHfN1yE6fT1MXeS1v1S0bXpK1hgkZgPxBBenAzhygq5T4iDTBAULAt2
         iTMg==
X-Forwarded-Encrypted: i=1; AKwUvBwzr1lpVnUJ34O2a7zFP3A6LiziFGw1IaWDjjOpfO1nppFv+NMCj8PF7Mu8Pib7jJ7Njs9++kzL87lM+go=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjpGGLF0BKNitrDQzf1ExCw+6m8SqADlT1zFTOZgckTWhvZPXz
	HXqwqmEUvKruKR9o3ydkTBqop/oYFRFI/1XI9870xyhSLLxGSyhk/p89hj7yZ93Nt+HY52cjc/Z
	Ur8T1Rr/ohzoxDtqfdMePso10a0vOsG4=
X-Gm-Gg: AYBFou37jHPx9lDG8sRTEsoNgO0qfji8xvz/1CctLlWpMi7AAT3yJssZqKS5HHspNj7
	KHrzUMrT4GSloXEIyQj+oyi0VL31Qr7ef6TlXPu3MuUEy0FZNPmPq1N6CDJ67LY75C3tmZ6PRSg
	9i8C0JVVEyCBIEc+HM86Us6ImeFIImo3tPQG/y3+lhddgOTVckNWrRto1aEibvbXZqdo+BELoQc
	Ote2dbjG71zh3Sq0Fp7ehTFgLS+L55PhzFLjhKkRAjFwYVpndEuxeiVF+F7/6cPXFOzfGeFymZn
	j7O33c9tSoihUi3TRn6L94Ruk3PX5hoAlPkOaht5d/NptfZL4iS9Ciii09xVnr2ZSxjwWb4LW4V
	Zr9XlRIZG47YGGVO+RGJ0z+Rx9VgltifJ5BzW2AiBkoGwNImaRXgsv6LvLrZ9BpFgGZE1uXWM8/
	1ckcoG6mO59Vw8uiXE
X-Received: by 2002:a05:600c:3d8d:b0:4a2:150f:1601 with SMTP id
 5b1f17b1804b1-4a35ac94951mr105384385e9.12.1792995028808; Sun, 25 Oct 2026
 23:10:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-9-hebaoquan@kylinos.cn>
 <CAN_Opa_JCCd-+o5y9JXbzypPtYjTGvyvnOy7KmSUKHYtVab85w@mail.gmail.com> <asyK6t1POEW5c533@fedora>
In-Reply-To: <asyK6t1POEW5c533@fedora>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 14:10:11 +0800
X-Gm-Features: AclHuK_dhqZYPgJVHUk3C61SxiAZTVv1AhZrMH5pk39-ACZEDnWgeleXWCWtyZ4
Message-ID: <CAN_Opa-RLVCxDm4bEMjobTGB-XSRx3d5ZqJ5=1uSBv+OTbEiig@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] mm, swap: defer xswap shrink to workqueue to
 avoid lock recursion
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com, 
	baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:23=E2=80=AFPM Baoquan He <baoquan.he@linux.dev> w=
rote:
>
> On 10/08/26 at 05:10pm, KunWu Chan wrote:
> > On Sat, Oct 3, 2026 at 8:32=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn=
> wrote:
> ...snip...
> > >  /*
> > >   * Try to shrink the cluster_info tail: unmap contiguous free cluste=
rs
> > >   * at the end of the mapped range.
> > > @@ -4164,14 +4187,20 @@ static int xswap_mapped_end(pte_t *pte, unsig=
ned long addr, void *data)
> > >  static void xswap_try_shrink(struct swap_info_struct *si)
> > >  {
> > >         struct swap_cluster_info *ci;
> > > -       unsigned long nr_mapped, last, keep, idx;
> > > +       unsigned long nr_mapped, nr_tail, keep, nr_unmap, start_idx, =
i;
> > >
> > >         if (!(si->flags & SWP_XSWAP))
> > >                 return;
> > >
> > > +       mutex_lock(&si->xswap_lock);
> > > +
> > > +       /* A swapoff raced us and is about to walk this mapping. */
> > > +       if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
> > > +               goto out_unlock;
> > > +
> > >         nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
> > > -       if (nr_mapped <=3D 1) /* keep cluster 0 */
> > > -               return;
> > > +       if (nr_mapped <=3D 1)     /* keep cluster 0 */
> > > +               goto out_unlock;
> > >
> > >         /*
> > >          * Reclaim on our own, but only once the mapped range is at m=
ost
> > > @@ -4181,40 +4210,73 @@ static void xswap_try_shrink(struct swap_info=
_struct *si)
> > >          */
> > >         if (swap_usage_in_pages(si) * 100 >
> > >             nr_mapped * SWAPFILE_CLUSTER * XSWAP_SHRINK_WHEN)
> > > -               return;
> > > +               goto out_unlock;
> > >
> > > -       /* Find the last non-free cluster from the tail */
> > > -       last =3D nr_mapped;
> > > -       while (last > 1) {
> > > -               idx =3D last - 1;
> > > -               ci =3D &si->cluster_info[idx];
> > > -               if (ci->count || ci->flags !=3D CLUSTER_FLAG_FREE)
> > > +       /*
> > > +        * Count the free clusters at the tail of the mapped range.  =
Scanned,
> > > +        * not tracked: the count must be exact to size the unmap, an=
d an
> > > +        * incremental count falls behind on out-of-order frees.
> > > +        */
> > > +       nr_tail =3D 0;
> > > +       while (nr_mapped - nr_tail > 1) {
> > > +               ci =3D &si->cluster_info[nr_mapped - nr_tail - 1];
> > > +               if (READ_ONCE(ci->count) ||
> > > +                   READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
> > >                         break;
> > > -               last =3D idx;
> > > +               nr_tail++;
> > >         }
> > > -
> > > -       if (last =3D=3D nr_mapped)
> > > -               return; /* nothing to shrink */
> > > -
> > > -       /* Below `last` has to stay mapped: the free ones in between =
are
> > > -        * not part of the tail, and unmapping them orphans what is a=
bove.
> > > -        */
> > > -       if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> > > -               return;
> > > +       if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> > > +               goto out_unlock;
> > >
> > >         /*
> > >          * Stop at SHRINK_UNTIL rather than at the end of the tail, o=
r the
> > > -        * range comes out full enough for the grow to be woken.
> > > +        * range comes out full enough for the grow to be woken.  Bel=
ow the
> > > +        * tail everything stays mapped, and one chunk of tail with i=
t.
> > >          */
> > >         keep =3D DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
> > >                             XSWAP_SHRINK_UNTIL * SWAPFILE_CLUSTER);
> > > -       if (keep < last + XSWAP_SHRINK_SLACK)
> > > -               keep =3D last + XSWAP_SHRINK_SLACK;
> > > +       if (keep < nr_mapped - nr_tail + XSWAP_SHRINK_SLACK)
> > > +               keep =3D nr_mapped - nr_tail + XSWAP_SHRINK_SLACK;
> > >
> > >         if (nr_mapped < keep + XSWAP_SHRINK_MIN)
> > > -               return;
> > > +               goto out_unlock;
> > > +
> > > +       nr_unmap =3D rounddown(nr_mapped - keep, XSWAP_GROW_CLUSTERS)=
;
> > > +       if (!nr_unmap)
> > > +               goto out_unlock;
> > > +       start_idx =3D nr_mapped - nr_unmap;
> > > +
> > > +       /*
> > > +        * Only shrink a run that reaches the mapped end; otherwise
> > > +        * truncating nr_clusters_mapped would orphan the active tail=
.
> > > +        */
> > > +       spin_lock(&si->lock);
> > > +       for (i =3D start_idx; i < nr_mapped; i++) {
> > > +               ci =3D &si->cluster_info[i];
> > > +               if (READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
> > > +                       break;
> > > +               if (!spin_trylock(&ci->lock)) {
> > > +                       spin_unlock(&si->lock);
> > > +                       goto out_unlock;
> > > +               }
> > > +               spin_unlock(&ci->lock);
> > > +       }
> > > +       if (i !=3D nr_mapped) {
> > > +               spin_unlock(&si->lock);
> > > +               goto out_unlock;
> > > +       }
> > > +
> > > +       for (i =3D start_idx; i < nr_mapped; i++) {
> > > +               ci =3D &si->cluster_info[i];
> > > +               list_del_init(&ci->list);
> > > +               WRITE_ONCE(ci->flags, CLUSTER_FLAG_NONE);
> > > +       }
> > > +       spin_unlock(&si->lock);
> > >
> > > -       xswap_unmap_clusters(si, keep, nr_mapped - keep);
> > > +       xswap_unmap_clusters_locked(si, start_idx, nr_unmap);
> > > +
> > > +out_unlock:
> > > +       mutex_unlock(&si->xswap_lock);
> > >  }
> > >  #endif /* CONFIG_XSWAP */
> > >
> > > @@ -4278,6 +4340,7 @@ static int setup_swap_clusters_info(struct swap=
_info_struct *si,
> > >                         }
> > >                 }
> > >
> > > +               INIT_WORK(&si->xswap_shrink_work, xswap_shrink_work_f=
n);
> > >                 return 0;
> > >
> > >  err_unmap:
> > > --
> > > 2.54.0
> > >
> >
> > Hi Baoquan,
> >
> > While following the shrink path across these patches, I wanted to
> > clarify the lifetime guarantee for the `cluster_info` backing pages.
> >
> > P07 flushes the per-CPU swap cluster cache and calls
> > `synchronize_rcu()` before unmapping the tail. P09 clears
> > `SWP_WRITEOK` and cancels the shrink work before proceeding with
> > `wait_for_allocation()` and `try_to_unuse()`.
> >
> > Could you clarify how the shrink path ensures that, before the tail
> > is unmapped, no allocation-side reader can still access the tail or
> > republish a stale per-CPU cache entry that points into it, and no
> > swapoff-side walker can still access the unmapped range?
>
> Hi Kunwu,
>
> Thanks a lot for your careful review, and for following the shrink path
> across patches. Assume P07 in your saying means patch 07, and P09 means
> patch 09. For the questions,
>
>
> 1. Allocation-side readers of the tail
>
> xswap_try_shrink() removes the clusters to unmap from their lists while
> holding si->lock, and only proceeds if spin_trylock(&ci->lock) succeeds f=
or
> each of them. After that no allocator can get these clusters from a list.
>
> The flag check alone is not enough. move_cluster() writes ci->flags after=
 it
> drops si->lock, so spin_trylock() is what actually blocks an allocator th=
at
> just took the cluster.
>
> Then, before the pages are unmapped, xswap_unmap_clusters_locked() does
> flush_percpu_swap_cluster() and synchronize_rcu(). That drains the four
> readers that use cluster_info[] under rcu_read_lock():
> alloc_swap_scan_cluster(), swap_reclaim_full_clusters(), swap_alloc_fast(=
),
> and swap_alloc_hibernation_slot().
>
> 2. Republishing a stale per-CPU cache entry
>
> The per-CPU cache is written in only one place: the end of
> alloc_swap_scan_cluster(), and the value is an offset inside the cluster =
that
> just got the allocation. That cluster cannot be one the shrink unmaps,
> because the shrink only unmaps CLUSTER_FLAG_FREE clusters and a cluster t=
hat
> just took an allocation is not free. So a racing cache write can only poi=
nt
> to a cluster that stays mapped. The flush plus synchronize_rcu() handles =
the
> entries written before it.
>
> 3. Swapoff-side walkers
>
> The swapoff walkers are not RCU readers. swapoff first stops the shrink:
> cancel_work_sync(&p->xswap_shrink_work), then waits on p->xswap_lock (whi=
ch
> grow and shrink also hold). SWP_WRITEOK is cleared, so xswap_try_shrink()=
 bails
> out too. Then wait_for_allocation() drains any in-flight allocation, and
> try_to_unuse() runs. Only after percpu_ref_kill(), synchronize_rcu(), and
> flush_work() of the discard and reclaim works, flush_percpu_swap_cluster(=
)
> run and the mapping get freed.
>
> Not sure if I answer your questions clearly.
>

Hi Baoquan,

Thanks for the detailed explanation. This clarifies my questions
about the cluster_info lifetime and the synchronization between
shrink and swapoff.

I=E2=80=99ll check these paths again against v5.

Thanks,
Kunwu

> Thanks,
> Baoquan
