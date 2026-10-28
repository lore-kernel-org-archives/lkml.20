Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218257;
	b=H/ABkrV/qvhpgd8nZgUvxMnxGyZ/gU//b2ghZpdvSTelj/Q/B4vY0TbNcQDUO20GFgXv
	 ML54ZtVVTtmHaAdbBJhbQtFr6x8JMNC8JFHbvYqrVyu8nOIae21whey4GDFak47mCBnpC
	 yb1n4RcdJCYvxBzx/QvXD1tFb++yjqPm5b4LWUXxir9KJUdxLpSxFZbuYGNp9z7WUIAEI
	 4BOt53NwaaULqvOuP7iTL+JKkBUzvDU8kOgV3m8XSU1W2nmanMJpTVMmNYpY0f3P9/Cc0
	 gJ9Tm8uMvbDWEzAwMmWoZdFOBulPe7OeBN47Ezyyv6cNtdXgFTE3mephAM+DjfMU3ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M/+CeRbT0qyE1g9JY9xgqgOlku9IIi6fz6AQMBy+up4=;
	b=YM93kupvZ571KEqCLe3ex9LFCQKjCjXHSv7Fz7cdEZCjjXXs6YObO1OEnPhE9vSRqZss
	 CJeR6EU2OCCb9Z4YhpeK+77K1W+5y1o6QTzu4PLIwRhx0HL2l/tAkzSk+BDICLtphH3xw
	 mS5iCT8ve018ymG8Aiiq9Uz2T+gANjq986A++fCvkHYN4uK+K/wx7vX18u++Ck4sk92He
	 73E5WyBeg/kpcukM3uvN8DKChMtwQhslzQd4xHzjf+MFNqELBLn0XHNkhuhyL2V62edR3
	 u+QcB7sR4A049QSpHcLcSl8rkpk5CL8eVHbm4hW/gcm/1/iXWBZeNxiGFrZHtR5wdkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iUtWN+5u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iUtWN+5u
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018493d57so18155e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218256; cv=none;
        d=google.com; s=arc-20260327;
        b=QWHUgqz5puMvCE9+yvb2j+xQk+0tg0eZZUwywwS0n9ks4iKpJK7Iig0gPfsKAztMu5
         rEtehLfJIVJsT0oxCXIFUB1j9OMPLSp5V5mkVKZmD2jXcsR5aY4lPiR9mnIjkKtKyNmH
         cPLKV94cgdju+eDfJxh5vcukm43SUPhhtbjuQ8xjTv7JEuG6jN1jAzNU4Ku+4y3FQuGK
         nGfSq2qo6ERcbm309T9ZJ3czc7M69zeHvtYrgjdtPN/TkQKYlX9kxuEazUIz9v1SZvYi
         Byvo0Z0R3vvgyQU8HIqlARz8Bj94XcAMwmnhAkLx7HorlzKDsXHuvKJN7pkjf+0BLHnj
         P5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M/+CeRbT0qyE1g9JY9xgqgOlku9IIi6fz6AQMBy+up4=;
        fh=gEthbBRmlz54YqcLEk42kFi/jUAFsH5UmAIAWslI3xw=;
        b=R8j+xbhDbdBkMaRogmKn+Q9QgIHTSYb5u2KUSOk+wCsCT+hLTBWZQzczndRuZMtFtG
         EAxrJ7R04vlcmZMAE4NRDBRxc/FvmPfCXEUoROXHKXxpBtjCpjWvfLUHhTpKdFNMLK9P
         cMz66jYAWEJB81FWP34KKxVKIRLjvXMuYKSlEN/hfSETULD1ROQqjHLkwE6zrVg4BFC5
         l9ucWWt3jAMIsR+whSdJ8GhC+8jr/8/j2ChIhk86QeGrbJnn1nQxrYcWmYJSuw7+yRgM
         Y3Hlk3AzU+Ja8iVAzUxudDh8Qriog2bZks8fA/tcnlQhObslg1ZxArUecpl5klUoqgU5
         kR0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793218256; x=1793823056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/+CeRbT0qyE1g9JY9xgqgOlku9IIi6fz6AQMBy+up4=;
        b=iUtWN+5unboIwqYEr9cdb4sDKfIVfgStIrNneH5+7RcbV2nFzcbR/5qmaI0luhQkmu
         vVPz9r9cggfumX+IeX+1jTISpsBL+cikK4l9reQ98luAVFwIh5gms4P/mLc8wkVK0/fZ
         z7tPhUttiQsErI6FTBzeaOCD2DIztf346+6v5SkwdestX2hJQAwdarxlZy2wjNApZCjn
         wODGeucQ8K9a6oxSAyIElCwvCBrsM4h1pKlZn29+UXG6qxx529SgQ+k9qLNWIh7ThR88
         Ng/T1UdgIgqJaHPGArcSO18wrs5nZDA6dH2OKSz/91mlmwQcE8vv6oJwetzcypEjEm5o
         Ekxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218256; x=1793823056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/+CeRbT0qyE1g9JY9xgqgOlku9IIi6fz6AQMBy+up4=;
        b=ZJY/wfTR2oRElrnDAXGObVslCu0APL80P+AnNhTFtFbr30Yut1hQYfy2vv52kWL2P2
         57y3hAb1naYi8DdJsLoIoCctMYk97wZ1JJU8JWeX5JZn6dxsngYsbB2K0xeCSaqLH+2f
         qXSlKz+/wC6NIYchRsaOKlsuC9f6cPjr2BLGKzp2elEwr3tIAofZswm7gM4ETRT9deVC
         /GUMYbOhQU4CeL+c9mKLGDa7nousMqK/53nVugaVZzbSsiaQi6KmmN3ci2/P/eY7VCCC
         6bS3nPnYAdspUVme5cQymQ+ANS7zRRFDj0FyPSWqu7hfJCLpN1w0d10x7z2Pf70ncSUi
         D6FQ==
X-Forwarded-Encrypted: i=1; AKwUvByoCiDJdRUopaKaYpkimKKrOhhj2IXVaAimEQY45JALaAcGXAcJe6p/uv+uCBHC41adW8U4rNEvH0aWZlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD3lW26wJI9Xthvq++SE+S+76ldDp531YOR9Lw5Hjf7CIauoTI
	SQDgLCP8g2RGcSYKtSdlP3+ZU3NnIrJiaZwrp3CNuA4vjOfcebX9FYSwbf8zF+DRv2Y5NB/sY1Z
	El7dCgDdkYrUNUinotkgpm/WnD07Qdmqvx0rPXP3i
X-Gm-Gg: AYBFou3dkuTD67pJmTxHqA3C7GM0dvQeujJxd1JD/7103zQ71RsHnkYuzj8vpzU3EPA
	eBUqGHlUICQIwfhFETQyd/TVxKzrvVJpVwvG3mOl+VTZi1UaSNby1c1leJ2p4nB9tU+prB5L6sb
	pvW14GZjsL8p2WNDstjxcMDqhsAfoxoITegyX2MCwOzUGH1JYVlp/TVgdS5FTnFLI+3lb/YsPxR
	y+hvnzjjHBZCninxSO72ZQ1Y+vVDcNTWNuEwERrfABGn6vn8hC0YQp2mm9lnG0sS1ubNyv7ylHv
	z9DquWKyDyCisVMw+kFtj+OQ9rocupkuz4ApUGYBixJMjfGPxk4TRJ/9bXuntgqJuft+dl/w0kn
	2LhN5Vip3dQlgdIkRWqSXRYFE+0taPeC3BOEyhaRsvZFnjLde4zlpsoJsrs+e3QKhWZrDaH9kiV
	ClrLm6pQjcjJr7bPxVkz7iDms=
X-Received: by 2002:a05:600c:6048:b0:4a1:e7fc:fed3 with SMTP id
 5b1f17b1804b1-4aa97e58aefmr149895e9.13.1793218255229; Wed, 28 Oct 2026
 13:10:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-2-tjmercier@google.com> <auFerm6kHxeuPFpR@parvat>
In-Reply-To: <auFerm6kHxeuPFpR@parvat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 28 Oct 2026 13:10:43 -0700
X-Gm-Features: AclHuK_GdOj6cBCMgskUWEzvtIHw2HGovxaKUq0R2OOOuhOoVrm0zxPtUkNd7mU
Message-ID: <CABdmKX1PT4oOKdRMGsWDHZRFmRB3VR9zxgnp8W5QXqhTErFOzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/vmscan: remove redundant !mem_cgroup_online() checks
To: Balbir Singh <balbirs@nvidia.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:32=E2=80=AFPM Balbir Singh <balbirs@nvidia.com> w=
rote:
>
> On Tue, Oct 27, 2026 at 06:06:05PM -0700, T.J. Mercier wrote:
> > Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> > dying memory cgroup for LRU folios") and commit 0e0ac326c511 ("memcg:
> > move LRU size accounting on reparenting instead of copying it"),
> > mem_cgroup_css_offline() reparents all LRU folios to the parent memcg
> > and zeroes the child's lrugen->nr_pages and lru_zone_size before the
> > memcg is offlined. Nothing can repopulate the offlined memcg's lruvec
> > afterwards. A folio that is off the LRU during reparenting looks up its
> > lruvec through its objcg, which now points to the parent so it is put
> > back on the parent's LRU.
> >
> > As a result, lruvec_lru_size() and lruvec_evictable_size() are always 0
> > when !mem_cgroup_online(memcg) is true, making the offlined memcg speci=
al
> > cases in get_scan_count(), lruvec_is_sizable(), and shrink_one() dead
> > code. Remove them.
> >
> > With the get_nr_to_scan() special case removed, an offlined memcg that
> > still has stale effective protection now has
> > apply_proportional_protection() applied like get_scan_count() does, so
> > the MGLRU and traditional LRU behavior is now the same.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  include/linux/mmzone.h |  8 ++++----
> >  mm/vmscan.c            | 28 +++++-----------------------
> >  2 files changed, 9 insertions(+), 27 deletions(-)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 3b96d6c7123b..7f078ff0dd76 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -638,10 +638,10 @@ struct lru_gen_mm_walk {
> >   * The events that trigger the above operations are:
> >   * 1. The first attempt to reclaim a memcg below low, which triggers
> >   *    MEMCG_LRU_TAIL;
> > - * 2. The first attempt to reclaim a memcg offlined or below reclaimab=
le size
> > - *    threshold, which triggers MEMCG_LRU_TAIL;
> > - * 3. The second attempt to reclaim a memcg offlined or below reclaima=
ble size
> > - *    threshold, which triggers MEMCG_LRU_YOUNG;
> > + * 2. The first attempt to reclaim a memcg below reclaimable size thre=
shold,
> > + *    which triggers MEMCG_LRU_TAIL;
> > + * 3. The second attempt to reclaim a memcg below reclaimable size thr=
eshold,
> > + *    which triggers MEMCG_LRU_YOUNG;
> >   * 4. Attempting to reclaim a memcg below min, which triggers MEMCG_LR=
U_YOUNG;
> >   * 5. Finishing the aging on the eviction path, which triggers MEMCG_L=
RU_YOUNG;
> >   * 6. Offlining a memcg, which triggers MEMCG_LRU_OLD.
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 9959ca158ce8..636152d8c94d 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -2754,13 +2754,6 @@ static void get_scan_count(struct lruvec *lruvec=
, struct scan_control *sc,
> >               scan =3D apply_proportional_protection(memcg, sc, lruvec_=
size);
> >               scan >>=3D sc->priority;
> >
> > -             /*
> > -              * If the cgroup's already been deleted, make sure to
> > -              * scrape out the remaining cache.
> > -              */
> > -             if (!scan && !mem_cgroup_online(memcg))
> > -                     scan =3D min(lruvec_size, SWAP_CLUSTER_MAX);
> > -
> >               switch (scan_balance) {
> >               case SCAN_EQUAL:
> >                       /* Scan lists relative to size */
> > @@ -2769,14 +2762,8 @@ static void get_scan_count(struct lruvec *lruvec=
, struct scan_control *sc,
> >                       /*
> >                        * Scan types proportional to swappiness and
> >                        * their relative recent reclaim efficiency.
> > -                      * Make sure we don't miss the last page on
> > -                      * the offlined memory cgroups because of a
> > -                      * round-off error.
> >                        */
> > -                     scan =3D mem_cgroup_online(memcg) ?
> > -                            div64_u64(scan * fraction[file], denominat=
or) :
> > -                            DIV64_U64_ROUND_UP(scan * fraction[file],
> > -                                               denominator);
> > +                     scan =3D div64_u64(scan * fraction[file], denomin=
ator);
> >                       break;
> >               case SCAN_FILE:
> >               case SCAN_ANON:
> > @@ -4355,12 +4342,11 @@ static bool lruvec_is_sizable(struct lruvec *lr=
uvec, struct scan_control *sc)
> >  {
> >       unsigned long total;
> >       int swappiness =3D get_swappiness(lruvec, sc);
> > -     struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> >
> >       total =3D lruvec_evictable_size(lruvec, swappiness);
> >
> >       /* whether the size is big enough to be helpful */
> > -     return mem_cgroup_online(memcg) ? (total >> sc->priority) : total=
;
> > +     return total >> sc->priority;
> >  }
> >
> >  static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_c=
ontrol *sc,
> > @@ -5199,10 +5185,6 @@ static long get_nr_to_scan(struct lruvec *lruvec=
, struct scan_control *sc,
> >
> >       evictable =3D lruvec_evictable_size(lruvec, swappiness);
> >
> > -     /* try to scrape all its memory if this memcg was deleted */
> > -     if (!mem_cgroup_online(memcg))
> > -             return evictable;
> > -
> >       nr_to_scan =3D apply_proportional_protection(memcg, sc, evictable=
);
> >       nr_to_scan >>=3D sc->priority;
> >
> > @@ -5325,13 +5307,13 @@ static int shrink_one(struct lruvec *lruvec, st=
ruct scan_control *sc)
> >
> >       flush_reclaim_state(sc);
> >
> > -     if (need_rotate && mem_cgroup_online(memcg))
> > +     if (need_rotate)
> >               return MEMCG_LRU_YOUNG;
> >
> > -     if (!need_rotate && lruvec_is_sizable(lruvec, sc))
> > +     if (lruvec_is_sizable(lruvec, sc))
> >               return 0;
> >
> > -     /* one retry if offlined or too small */
> > +     /* one retry if too small */
> >       return READ_ONCE(lruvec->lrugen.seg) !=3D MEMCG_LRU_TAIL ?
> >              MEMCG_LRU_TAIL : MEMCG_LRU_YOUNG;
> >  }
> > --
>
> In some of the places do you want to consider adding a VM_WARN_ON_ONCE
> for memcg_online not being true?
>
> Acked-by: Balbir Singh <balbirs@nvidia.com>

Thanks, does this look ok to you? We could also put it on the read
side in lruvec_lru_size(), but that backtrace will just show the
reclaim stack rather than whoever is trying to mutate the size of an
offline memcg.

@@ -49,6 +49,7 @@ static __always_inline void __update_lru_size(struct
lruvec *lruvec,

        lockdep_assert_held(&lruvec->lru_lock);
        WARN_ON_ONCE(nr_pages !=3D (int)nr_pages);
+       VM_WARN_ON_ONCE(!mem_cgroup_online(lruvec_memcg(lruvec)));

        mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
        __mod_zone_page_state(&pgdat->node_zones[zid],
