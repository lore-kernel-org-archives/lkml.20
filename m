Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519133;
	b=GP/n14xHTljfffRAEgYVU3kqUc6jnSEXcVvyqRgp91JY75qNHQ+hvKf/LT2hVl4Cc9kX
	 DqlwlMyU5g+y68KpRUhSS++7SHXUoF2N6F7B5lZh4ex+DUeFzUXKVtDV4asjq6CG1DuVx
	 lQOiBukD+8zmtpK6PSuNMq4Yx8A0GKJ4/KuSyqoudhvHr9O2SIaDjx9Aadz5y0WnuaPTV
	 EVzYvESF3OSuyPgrEWVMwTRzFFNgJ459SKlMfOkdcVr2EVJpHCBAX6m857Y5qwBrpVEcM
	 YDrf3OzJ7Rac3dMkljJody7pKoPO07hrb0/n5PKvVJG8c4s2ufD7/zggHGWscQjaVBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dc+Bo7udqDy3OvFW1e4k6Vi+Psamqa3s48HVUQ/rqV4=;
	b=EoOK8dJan9K8qTkUAhHnYQIiu210QkMTHwgZXfQZuVRYWMWt4IK2fUIU0V4K7W2JGTie
	 JJQPT+/VrKPKsRVP4lziK9TSOvGz0jxov96MlEC1lbHaiyddn2gYzVKWP95ymTuE2DOx0
	 pPs75ODmtAV5aD1uKyhp07KFj2OUQOd9EiTlDh2PjKwY6IfbVhsTegeNodRIDIst4hUzd
	 G9xPZ4+1EZ+sLJvd/zwwVau/b+guLq66VjezHRKAUx9SnHSTdbEqc32cA276efVOoXpte
	 dTZ4oePzkpTopFoW5alKv2dINe8PU/pusT2RYwh0FjKdUTdR2Xys/Yp9pWq6b3ApkNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oixlCHmd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC23A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC23A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oixlCHmd
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2055573c8cso448889066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519131; cv=none;
        d=google.com; s=arc-20260327;
        b=E86NmajWZJNOrmVE4a+xaIjcCgaYMwNuv26i52/m/dFN7EXODIEuXY/i5aUKfyWJOV
         Z5htisXuch2cqZ+IO5POgdgzivF24R+PJh4omRx+VGedY2rLSwvjvWlYgWWwFmiSCOmZ
         KcPlIzQ87PvRD8oKHwU9PzUlBz9SXBMs/ic8rzyJPfYOHxscUqGuqFJbKN+GUPFfAoGz
         oHFw3H83sEIWWceTW7Y8DkFwzByWbWBvGC14+Rex96UtdYOTKAsobUVHonx+U29oPItA
         5vZ0mGGhC3uhglb6KCUViSRaG3LeiLxbymqdSNDukWyK6MDx+Mopkd4f5fHsYzUhbCuq
         tUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dc+Bo7udqDy3OvFW1e4k6Vi+Psamqa3s48HVUQ/rqV4=;
        fh=BXwHrIsZPWeW0B3ohL3tS77ylC9kmt/bhFh38LfGhFc=;
        b=dqdhQ3WlGeDZXTTGHEMo6M7OjvrljZuFa1uWn8SHC1q9z/q1cHqn26Uey3WCNgD8NR
         ggDTUmQz+2Sz59vhO+dJeABvZ1MGhAK6PaJ89tyEOe2ztTI2OFYuCYXNZcqu42N87DIa
         RChSxNNncQeQfFrkRygvnNLw9wruLE6vI5ouNf1iCMvNESVT88d507oQGdsSp0V++2Rg
         EQlfMdvCSed+A+f9WerjISDiLKeIGNXGaYJld4tWs3JQ27UjYAxKDrRTtb0PSeH1EyBG
         YpRYCPVN5vlY7CFFv9YPvv0SquDlzwF+NDqdZZSplIqATqzjIo4Md5odEgiMiOcYPKRq
         mkVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519131; x=1793123931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dc+Bo7udqDy3OvFW1e4k6Vi+Psamqa3s48HVUQ/rqV4=;
        b=oixlCHmd8EQKzoAZwp79t3hqtWf3bHlAiEeGnfif0E/BL/nUhlvqZbYEE8eBirxNf7
         7HeBQmzZLK2ZoSJtUjr2TNW9oQNCgURyt7XHBGpJARBp3Gm1yElWMfsp8Psw6Rdx4MYz
         7GQ9PAw+65nnRxtie4faMqQ4Vtmq21L31nhvNU9WzxSh9WGSMY/OXy7g4fDxkDAjSufO
         ETCzkbFkENrv3eSnYfMLFyTFSPGsq5vIeNBnOSmjm+96rIV3mEaJPBFAeFPl6jKsSLPE
         QU0p9dzNxI6zu/zwMB0b3/7rixVLnOfJ2vDDazmRL1z4rTgdrdEIUO9c+0wnSJ87Ekov
         XbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519131; x=1793123931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc+Bo7udqDy3OvFW1e4k6Vi+Psamqa3s48HVUQ/rqV4=;
        b=r4X1XDfnRMICDAjXTwdjqqYEVvLrHG7U2BycItmhgCUfG6ikALkHaaqGsPPKjjANMC
         u7wqQxKeI6nH+PVyQcVjyu9ZeRN5+59yawrVhmEK8VXlj93LOSedekirEpWyYj/NseLh
         2xW93h7GS1X+wcfF+sko/OeWqrZeZ47GSne4PaTcfVS+yUdRw6S9uVUMB7gl9N4DujK/
         A7ZQeNSSMKOALNoh29GRqlfbtH9m2TyG6E6O4pjKYFyUvg8lYGjWHwmyxhXT40cblg+g
         SeAJeanjJisRf6bN6Gzi8j8UM1ltjbxwLXnyjAy8iAaURqhrb5D5YYYyPITv2fuTLxDn
         GhVw==
X-Forwarded-Encrypted: i=1; AKwUvBxVNjAldWuL3tqCah2/jSfNHk7sRAX5lFlaqorfb1HbsJg3T2oZ0THQ9Y0Hg2pcDGA/TnHnSkfDpkKlWmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeW1MN5SAIjoyoj+LvKnxTMFQ1ApMvvzNJjVHVjMai5IUN8iJO
	d9bHnM9kBSjFXwRqHKgelfBo1lDGPMoobLw1Bbok7jfvNuUrXShsItZzS7BoWiamw7t0GU5D4Rl
	9i0RNPcenp+U9D4+fWWAG1cJuVn19eHo=
X-Gm-Gg: AYBFou2UD2ZZdWvqPtJhSiJTvgkEoY5mFMVH+PZDWRSbhVi+650/bfFOmJQ61o9ZWbZ
	yTaYDHWLHrtZ11McYXkq8CmCyOYjvOxqUixL5bCOJt5fIEzUHQSycHl5kvGW2c9MOZGVaVX/K2A
	QKXyUIDR+fAPP1bEOKj1CS9IBlAwyQr5aYRDmWNnFECUDfrNnhi3CLijZ9VBjDBBRdd4xT7o9Q0
	YyMAVByIq2j0TPRupt+HYVIWE2e8kkvcfELZlxGn5DfZX+4W4Hq8DnS51aTEVLTm7dRw0OtV/0Q
	tPnPdZFoFpPPWxN1qCqtRNu59y/VoD/B/CaSJ6VLdebzdE1xikIlOa/he2WI0/dIVlyQ+s5Ghf/
	58AZhIq84aOGp
X-Received: by 2002:a17:907:930e:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c419df3d9e2mr827528166b.14.1792519130900; Tue, 20 Oct 2026
 10:58:50 -0700 (PDT)
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
 <CAKEwX=MRvzzd0Fn=UX+LcRo+K9wuqCWSB42NNn7rvZkZukRRrg@mail.gmail.com> <CAKEwX=OwzpxUfdANEXoCeZPBqch+91C4gKwhrcikm6Gj_LBPKw@mail.gmail.com>
In-Reply-To: <CAKEwX=OwzpxUfdANEXoCeZPBqch+91C4gKwhrcikm6Gj_LBPKw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 Oct 2026 01:58:11 +0800
X-Gm-Features: AclHuK9UBnCJDKT6vP1WD_aznvQkjk4cpSf1QdPurJznE3HDglLfCYeOaCQoUZk
Message-ID: <CAMgjq7AsUWGw5K5Xk1qz67atXmXB7vYDww-+u9t8Mz7rNAH-6Q@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Nhat Pham <nphamcs@gmail.com>
Cc: Youngjun Park <youngjun.park@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:23=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Tue, Oct 20, 2026 at 6:12=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Mon, Oct 19, 2026 at 11:58=E2=80=AFPM Youngjun Park <youngjun.park@l=
ge.com> wrote:
> > >
> > > On Mon, Oct 19, 2026 at 09:06:15AM -0700, Nhat Pham wrote:
> > > > swap_cluster_populate() can publish a cluster's table with the clus=
ter
> > > > lock dropped. A cached allocator can use and empty it before the
> > > > populating allocator reacquires the lock. The resumed scan can then
> > > > dereference a NULL table.
> > > >
> > > > For example, CPU1 can retain a cached cluster offset on an SSD with
> > > > per-page discard disabled:
> > > >
> > > >     CPU0                          CPU1
> > > >     ----                          ----
> > > >     swap_cluster_populate()
> > > >       swap_cluster_alloc_table() fails
> > > >       spin_unlock(&ci->lock)
> > > >       local_unlock(&percpu_swap_cluster.lock)
> > > >       swap_cluster_alloc_table()
> > > >         rcu_assign_pointer(ci->table, table)
> > > >                                   swap_alloc_fast()
> > > >                                   local_unlock(&percpu_swap_cluster=
.lock)
> > > >                                   mem_cgroup_try_charge_swap() fail=
s
> > > >                                   swap_cache_del_folio()
> > > >                                     __swap_cluster_free_entries()
> > > >                                       free_cluster()
> > > >                                         __free_cluster()
> > > >                                           swap_cluster_free_table()
> > > >                                             rcu_assign_pointer(...,=
 NULL)
> > > >       local_lock(&percpu_swap_cluster.lock)
> > > >       spin_lock(&ci->lock)
> > > >       return ci
> > > >     alloc_swap_scan_cluster()
> > > >       cluster_scan_range()
> > > >         __swap_table_get()
> > >
> > > Hello Nhat.
> > >
> > > Good catch!
> > >
> > > > Reject an unusable cluster under its lock before scanning it. Reloc=
ate
> > > > it only while its table is present.
> > > >
> > > > Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation help=
ers")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > > > ---
> > > >  mm/swapfile.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > > > index c3288910b3e3..988b7316e0a1 100644
> > > > --- a/mm/swapfile.c
> > > > +++ b/mm/swapfile.c
> > > > @@ -981,7 +981,11 @@ static unsigned int alloc_swap_scan_cluster(st=
ruct swap_info_struct *si,
> > > >       bool need_reclaim, ret, usable;
> > > >
> > > >       lockdep_assert_held(&ci->lock);
> > > > -     VM_WARN_ON(!cluster_is_usable(ci, order));
> > > > +     if (!cluster_is_usable(ci, order)) {
> > > > +             if (cluster_table_is_alloced(ci))
> > > > +                     relocate_cluster(si, ci);
> > > > +             goto out_unlock;
> > > > +     }
> > >
> > > If this patch is applied as bloew, does it prevent the issue describe=
d here?
> > >
> > > https://lore.kernel.org/linux-mm/20260720071342.50742-2-shikemeng@hua=
weicloud.com/
> > > (This patch publishes cluster table after lock acquired.)
> > >
> > > This patch is chagned the way I suggested during review... :(
> >
> > Ah I missed that patch series and your review! What happened to it?
> > Did we just never land it?
> >
> > Looks like we are still doing neither Keming's approach (table
> > copying) nor your approach (publishing at the end of
> > swap_cluster_alloc_table()).
>
> Ah nope, I saw that Kemeng implemented your approach:
>
> https://lore.kernel.org/linux-mm/20260907091356.53026-2-shikemeng@huaweic=
loud.com/
>
> My bad! But yeah I think we still need this small fix (or Kemeng's
> original proposal?), unless I missed something...?

Right I remember that, I acked part of that and was waiting the update
on that sashiko comment, as the first patch isn't perfect, while
Kemeng's mail at "shikemeng@huaweicloud.com" is now bouncing back...
I'm not sure if Kemeng still plans to update that.
