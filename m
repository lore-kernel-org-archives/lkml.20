Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792771547;
	b=4QtoUyC69kjRh1AHgNcsUvVXfi6RBnpgeIe59CfqhS+05muTP7+b/Xy56ETDsytudKdY
	 UClrA8vxWNmkXHDP9aBT8pPTAMUhHi+2MGDlUJKmIu1q7p14y+3idPyEvjuYCqJiF8yNi
	 3+DNQfZqblBjE2ymtexE+C7OwHYSPNkg4OCXgvK+WRYCqFc9kp9OVgWYgNfJmWRO3WuJx
	 Afj0HdVE8EkCn6hUqHdxlhPLB13oqE9uY32VbnEAskSOw9IjlYLNFH1g28l9dLMMIgdQA
	 3J5bZ/Jx8B9g/fGdM/y8fwjA0+hQ64XyFO6t0I+m4L3rTfMz/07DhV/jAnliyBtcO6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BGTxRD5D7n/UMnlYai6UFr6wWSckBQB5pNIfzliMwQY=;
	b=JMzteCkJdizL2C5kUtQFwfH7uWlN5eA5e26jhhJEbNHVSs5BHquenSdwAoPfJniKE+D9
	 3vW+Ohuy/B7uu4LDpUZfCugICIMqbPsxB5lpUvdCCaUcSy3QtjBshRpI31+Jb6sVDtzgl
	 FT/AgheVBHVfRaeVqHwNrEjW/1xV0P3z2rE2fBiPzHZ+JJNJIP65FpA5XAhAq8ReVjMre
	 MNJah10GZxxhOrVLaMzoBLTsWQLgfOB+Khe1HzEPe0MT/X4t+PPESK5oE+rRstKb0mq8C
	 Th6SEz8W3Aflzaf/Sxx1ngykhtODdZ+SwHQ0DTA/NI2big4d2YkhNkngu1uG0d9ObBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l6Xu4jBq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7D606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC7D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l6Xu4jBq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso754906f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792771545; cv=none;
        d=google.com; s=arc-20260327;
        b=DMsFWByV3Rs107/CfftWWs3Nx3hs/LjyFX/32pf0fhYpfTcof4PZTlFf1PvMb+yzgV
         bEc49PnHiAsn3xQW89BkUXOlQir/DhUW9QOoHy/BJ2y4Hnw3Y7ooWbzpafdJqDVVrXSH
         tdWDhHV9yxdze1xZnNKMDch9ssuO/H9EdGCW+FTqdW5kIbHS4gdpjrhcQM7kPlAwRxpa
         RkfYfwgVPZtYS+643CGI+QRud037IYCYCYw+CXWmgkoWp/Q+4/7xeJ1TF596HQrp4Lug
         XW8hcriwTk7bN3Hbh6Ms/GcXSiKQICld6MTqutVusJ4QcotOe96zGCvNJtWZT7Garppy
         RmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BGTxRD5D7n/UMnlYai6UFr6wWSckBQB5pNIfzliMwQY=;
        fh=OD+5PM6L2IfXRSxIGtbEnNE8y/udGtczdOCmPaaEktg=;
        b=OxgfQGQgwL55gOtdEFr11X83Ie9EY6KVGe/RzI6FOclPOq7TAHMPCg2peFM7yoB8F6
         j+3Y+AG3+om0sXtWobD5HLg93w/w6XKI/aqAiyRi8EcdIA54gxn/xbl5n9yskOeYjfRB
         m4QOQ35ve+aX1MRJ/o/E1spdXHJTT/VMrvEj7SpgepMGRloqh7KEs6DyoDbfGROT18EU
         UY3QOlRZ9ETfFQrzOA/kWTSKdKALZSCM8NoUGf0AFNwV8SX8k3ZRd58sgS3EMG9kE2SV
         VLLaNmwHkN4quX+rMiqpXlXyVah1z54Vy6+YnlU+w9ieTx51q5cpYTXkpU4bby68WFtu
         xNbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771545; x=1793376345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGTxRD5D7n/UMnlYai6UFr6wWSckBQB5pNIfzliMwQY=;
        b=l6Xu4jBqx2id+/+flu5HBbXz8ifYFQx7pNkgCTI3TFJ4Gjiaeqa+T7tTMtH5/rdB5y
         UykzGHrPE2uCvG7HliGNAZEdkgOa6oGZDuSEG8GfkukOHiMgna1WmPXaltSPTE+JoXLY
         W6/vpNtxwoMw3Ee9nuLnZr4jyIm4rqm43IQgqJVxgChJAFn+/r+QD4KRcCPvSLQT0LeG
         PiiUtwWtHBpkfSCCAnHUvWKFt1KmqpSEDySNvJQ0eQSygpRnUAxGf/FTa4jEnwIplSia
         dkGkn/5ebqNoscVGOE5EioZc9Ngk69JqaNOuc2/AtFJhbrFN8//c2YGs/xJnN4VNkWUG
         pVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771545; x=1793376345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGTxRD5D7n/UMnlYai6UFr6wWSckBQB5pNIfzliMwQY=;
        b=u+CFJ8VLCwu6X4SznBtFnycSZFrOwWoD+3xpXqxcT4w0Fdv7zfrirnCPD/W48CyqcN
         hycKtUL50H9JD2phq9KVuo73YfEEIzZZjOe38o+zwTRhN0qElIBkCSQieBW2BlwCbYG4
         trbdbiXwrj0yakf0wxJHrCml4U+pfblFAM5iy0pTaXQrLHgHbTtaB3tT+chBBYrpwvpc
         srCslZMEHlb+e+YDvc5YJYuzGaNuWrQ7TuZ+Z+nh8UmXQwHv1AAj+uv0kkEkgRLVHywt
         AuNp4oSAMls2IW9Cb1i+7s/c7diLo7RbBGw7NF3AciPQ3ksbiQBcRuFDvqF6C65BhWX1
         mgXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0mUsYaLgAg65CjWYvA1HxF/6PdMoYItrQ8ZsBv8RU0ey1g6+6v2v+XXjoyZFDhPjjOYZR9NFPq73i5s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHQ7JIyOTFYsWDLlwefCoAjx8L9mJ5mEfgiXMN0VS+VVDZYpbg
	ZK6D48XlQvNCbFrwVgLsRWh+SdSauR1pXGdNfjQ6fMK5TXburG/zbhaYtunIyeJkrV8AdimBRbU
	uNiM7s0h5ksUymhvMNzxtgcGb9uZKdcI=
X-Gm-Gg: AYBFou3TNGl5fO/Yd5sMPSRsOrPxtvFQbFJIInvwzjrmBDePAWmLI+o1KB9m663hYyo
	jBYwNABa5xTVNd2XaDNQlysqL62ItjJc5n+lD1kDzOZFHv80+0f5W3EGfreepDADCvTkjCoF7El
	BoIcTq6QRuBDjPNFNls509fmZYKcI2DT2Sif26MCXfCV43AYgr9LMnwEe+xVSpmsSQbPpfliK9E
	qEfm47iiav+uJyYQYrUHtkLHqyvhzujcgC6E9h1n5xNugxyk3qZRJWaHXKT0hPZtWTAyWUvHi2G
	bCMGlSW++TgZIjAOe8kpMmK6Xvqlpr5DWALGFR78aShX0BqMDQIZUjhiw2PZEsnOP1d41iyZc4A
	Fqc/LgoXT4YcmXJqSfN419NnRYsfyPWjYGD5Tsiu4NgOaTd50zO9UIRlmY0ZE0vm/557Cx3wYLL
	nXWyr3OINnfoqP2SuLYYPDX21yF2kxaH2tSQiLmDk3FYi2znC4xP3+Wwk+YiplOsNHToYgvXtb7
	w==
X-Received: by 2002:a05:6000:299c:10b0:48e:d88:55f4 with SMTP id
 ffacd0b85a97d-48e3854f102mr3546739f8f.2.1792771544959; Fri, 23 Oct 2026
 09:05:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <20261022145615.2184343-2-alex@ghiti.fr>
In-Reply-To: <20261022145615.2184343-2-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 09:05:33 -0700
X-Gm-Features: AclHuK8Er7cNvGHw3gthKFs78WWdDSGvrANMdGbGbK7ZYvQMhJEnhGeR8z5NV5g
Message-ID: <CAKEwX=NWVVXXU76H3V0DWsH=VDbPmGUHZXeaN1_vkz8kwJCxbw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] mm/swap: allocate contiguous swap slots for a
 reclaim batch
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:57=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Reclaim allocates swap slots one folio at a time and only then batches
> the writes, merging folios whose slots happen to be contiguous. Order-0
> allocations scan the nonfull clusters before taking a free cluster, so
> once frees have left holes in otherwise full clusters, a batch of LRU-
> adjacent folios is scattered over those holes and written with many
> small requests. Since swap slots are freed on exclusive write faults,
> this happens with any workload that rewrites swapped out memory.
>
> Before swapping out a batch, record how many pages of each small order
> need a slot, and make those allocations follow contiguous free slots,
> SWAP_CLUSTER_MAX at a time: in a nonfull cluster if one has them,
> otherwise in a free cluster. When neither has them, the rest of the
> batch fills the holes as before. Nothing is reserved.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks for looking into this! There are still workloads that benefit
more from disk swapping than compression swapping... We should make
the swap subsystem work for them.

I haven't read the code too closely, as it's an RFC meant to show the
general idea. So I'll just make some comments and ask some questions
about the idea:

>  static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
>                                          struct swap_cluster_info *ci,
>                                          struct folio *folio,
> @@ -1042,6 +1079,59 @@ static unsigned int alloc_swap_scan_list(struct sw=
ap_info_struct *si,
>         return found;
>  }
>
> +/* Larger folios already make large enough write requests on their own *=
/
> +#define SWAP_BATCH_MAX_ORDER   (ilog2(SWAP_CLUSTER_MAX) - 1)

Ah so we don't invoke this heuristics for folio larger than certain
orders? Makes sense.

> +
> +static inline unsigned int swap_batch_contig(unsigned int left)
> +{
> +       return min_t(unsigned int, left, SWAP_CLUSTER_MAX);
> +}
> +
> +/*
> + * Like alloc_swap_scan_list(), but only allocate at the start of @nr_co=
ntig
> + * free slots. Order 0 clusters without them move to the frag list until=
 a
> + * slot is freed, larger orders stay nonfull as the folio may still fit.
> + */
> +static unsigned int alloc_swap_scan_list_contig(struct swap_info_struct =
*si,
> +                                               struct list_head *list,
> +                                               struct folio *folio,
> +                                               unsigned int nr_contig)
> +{
> +       unsigned int found =3D SWAP_ENTRY_INVALID, order =3D folio_order(=
folio);
> +       struct swap_cluster_info *ci;
> +       unsigned long start, offset;
> +       LIST_HEAD(skipped);
> +
> +       while ((ci =3D isolate_lock_cluster(si, list))) {
> +               start =3D cluster_offset(si, ci);
> +               offset =3D SWAP_ENTRY_INVALID;
> +               if (SWAPFILE_CLUSTER - ci->count >=3D nr_contig)
> +                       offset =3D cluster_find_free_contig(ci, start,
> +                                                         start + SWAPFIL=
E_CLUSTER,
> +                                                         1 << order, nr_=
contig);
> +               if (offset =3D=3D SWAP_ENTRY_INVALID) {
> +                       if (order)
> +                               move_cluster(si, ci, &skipped,
> +                                            CLUSTER_FLAG_NONFULL);
> +                       else
> +                               relocate_cluster(si, ci);
> +                       swap_cluster_unlock(ci);
> +                       continue;
> +               }
> +               found =3D alloc_swap_scan_cluster(si, ci, folio, offset);
> +               if (found)
> +                       break;
> +       }
> +
> +       if (!list_empty(&skipped)) {
> +               spin_lock(&si->lock);
> +               list_splice_tail(&skipped, list);
> +               spin_unlock(&si->lock);
> +       }
> +
> +       return found;
> +}
> +
>  static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool=
 force)
>  {
>         long to_scan =3D 1;
> @@ -1109,6 +1199,7 @@ static unsigned long cluster_alloc_swap_entry(struc=
t swap_info_struct *si,
>         struct swap_cluster_info *ci;
>         unsigned int order =3D likely(folio) ? folio_order(folio) : 0;
>         unsigned int offset =3D SWAP_ENTRY_INVALID, found =3D SWAP_ENTRY_=
INVALID;
> +       unsigned int left;
>
>         /*
>          * Swapfile is not block device so unable
> @@ -1129,7 +1220,14 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>                 if (cluster_is_usable(ci, order)) {
>                         if (cluster_is_empty(ci))
>                                 offset =3D cluster_offset(si, ci);
> -                       found =3D alloc_swap_scan_cluster(si, ci, folio, =
offset);
> +                       /* The batch's contiguous slots are used up */
> +                       if (likely(folio) &&
> +                           this_cpu_read(percpu_swap_cluster.batch_left[=
order]) &&
> +                           !cluster_slots_free(ci, offset, 1 << order))
> +                               swap_cluster_unlock(ci);
> +                       else
> +                               found =3D alloc_swap_scan_cluster(si, ci,=
 folio,
> +                                                               offset);
>                 } else {
>                         swap_cluster_unlock(ci);
>                 }
> @@ -1148,6 +1246,21 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>                         goto done;
>         }
>
> +       /* Keep a reclaim batch on contiguous free slots, not in small ho=
les */
> +       left =3D likely(folio) ?
> +              this_cpu_read(percpu_swap_cluster.batch_left[order]) : 0;
> +       if (left && order < PMD_ORDER) {
> +               found =3D alloc_swap_scan_list_contig(si, &si->nonfull_cl=
usters[order],
> +                                                   folio, swap_batch_con=
tig(left));
> +               if (found)
> +                       goto done;
> +               found =3D alloc_swap_scan_list(si, &si->free_clusters, fo=
lio, false);
> +               if (found)
> +                       goto done;
> +               /* No contiguous slots left, allocate the rest of the bat=
ch as usual */
> +               this_cpu_write(percpu_swap_cluster.batch_left[order], 0);
> +       }
> +
>         if (order < PMD_ORDER) {
>                 found =3D alloc_swap_scan_list(si, &si->nonfull_clusters[=
order], folio, true);

So we prefer non-full clusters with contiguous slots, over free
clusters, over other nonfull clusters.

I think this part makes sense to me FWIW. We do skip fast path and go
for slow paths more often, so do make sure we're not paying with too
much lock contention, especially as the swapfile fils or get more
fragmented (which this patch series does nudge us towards). But FWIW,
we pretty much go back to the old behavior the moment we fail to find
contiguity for the first time in the batch, so I think we'll be
fine...?

>                 if (found)
> @@ -1390,7 +1503,15 @@ static bool swap_alloc_fast(struct folio *folio)
>         if (cluster_is_usable(ci, order)) {
>                 if (cluster_is_empty(ci))
>                         offset =3D cluster_offset(si, ci);
> -               alloc_swap_scan_cluster(si, ci, folio, offset);
> +               /* The batch's contiguous slots are used up */
> +               if (this_cpu_read(percpu_swap_cluster.batch_left[order]) =
&&
> +                   !cluster_slots_free(ci, offset, 1 << order)) {
> +                       swap_cluster_unlock(ci);
> +                       this_cpu_write(percpu_swap_cluster.offset[order],
> +                                      SWAP_ENTRY_INVALID);
> +               } else {
> +                       alloc_swap_scan_cluster(si, ci, folio, offset);
> +               }
>         } else {
>                 swap_cluster_unlock(ci);
>         }
> @@ -1729,6 +1850,86 @@ static int swap_dup_entries_cluster(struct swap_in=
fo_struct *si,
>         return err;
>  }
>
> +static void swap_alloc_prepare(unsigned int order, unsigned int nr)
> +{
> +       unsigned int nr_contig =3D swap_batch_contig(nr);
> +       struct swap_cluster_info *ci;
> +       struct swap_info_struct *si;
> +       unsigned long offset;
> +       bool keep =3D false;
> +
> +       local_lock(&percpu_swap_cluster.lock);
> +       if (nr <=3D (1 << order)) {
> +               this_cpu_write(percpu_swap_cluster.batch_left[order], 0);
> +               goto out;
> +       }
> +       this_cpu_write(percpu_swap_cluster.batch_left[order], nr);
> +
> +       /* Keep the cursor if enough free slots follow it */
> +       si =3D this_cpu_read(percpu_swap_cluster.si[order]);
> +       offset =3D this_cpu_read(percpu_swap_cluster.offset[order]);
> +       if (si && offset && get_swap_device_info(si)) {
> +               ci =3D swap_cluster_lock(si, offset);
> +               if (cluster_is_usable(ci, order)) {
> +                       if (cluster_is_empty(ci))
> +                               offset =3D cluster_offset(si, ci);
> +                       keep =3D offset % SWAPFILE_CLUSTER + nr_contig <=
=3D
> +                              SWAPFILE_CLUSTER &&
> +                              cluster_find_free_contig(ci, offset,
> +                                                       offset + nr_conti=
g,
> +                                                       1 << order,
> +                                                       nr_contig) =3D=3D=
 offset;
> +               }
> +               swap_cluster_unlock(ci);
> +               put_swap_device(si);
> +       }
> +       if (!keep)
> +               this_cpu_write(percpu_swap_cluster.offset[order],
> +                              SWAP_ENTRY_INVALID);
> +out:
> +       local_unlock(&percpu_swap_cluster.lock);
> +}
> +
> +/**
> + * folio_alloc_swap_prepare - prepare swap allocation for a reclaim batc=
h
> + * @folios: list of folios reclaim is about to swap out
> + *
> + * Record how many pages of each small order the batch will swap out, so
> + * that their slots are allocated contiguously. Nothing is reserved.
> + */
> +void folio_alloc_swap_prepare(struct list_head *folios)
> +{
> +       unsigned int max_order =3D min(SWAP_BATCH_MAX_ORDER, SWAP_NR_ORDE=
RS - 1);
> +       unsigned int nr[SWAP_BATCH_MAX_ORDER + 1] =3D {};
> +       struct folio *folio;
> +       unsigned int order;
> +
> +       if (!total_swap_pages)
> +               return;
> +
> +       list_for_each_entry(folio, folios, lru) {
> +               if (!folio_test_swapbacked(folio) || folio_test_swapcache=
(folio))
> +                       continue;
> +               order =3D folio_order(folio);
> +               if (order <=3D max_order)
> +                       nr[order] +=3D 1 << order;
> +       }
> +
> +       for (order =3D 0; order <=3D max_order; order++)
> +               swap_alloc_prepare(order, nr[order]);
> +}
> +
> +/**
> + * folio_alloc_swap_split - account for a large folio split by reclaim
> + * @nr_pages: number of order-0 folios the split produced
> + */
> +void folio_alloc_swap_split(unsigned int nr_pages)
> +{
> +       local_lock(&percpu_swap_cluster.lock);
> +       this_cpu_add(percpu_swap_cluster.batch_left[0], nr_pages);
> +       local_unlock(&percpu_swap_cluster.lock);
> +}
> +
>  /**
>   * folio_alloc_swap - allocate swap space for a folio
>   * @folio: folio we want to move to swap
> @@ -1771,6 +1972,12 @@ int folio_alloc_swap(struct folio *folio)
>         local_lock(&percpu_swap_cluster.lock);
>         if (!swap_alloc_fast(folio))
>                 swap_alloc_slow(folio);
> +       if (folio_test_swapcache(folio)) {
> +               unsigned int left =3D this_cpu_read(percpu_swap_cluster.b=
atch_left[order]);
> +
> +               this_cpu_write(percpu_swap_cluster.batch_left[order],
> +                              left > size ? left - size : 0);
> +       }
>         local_unlock(&percpu_swap_cluster.lock);
>
>         if (!order && unlikely(!folio_test_swapcache(folio))) {
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index ea2d4c8d1890..86245036872c 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1175,6 +1175,8 @@ static unsigned int shrink_folio_list(struct list_h=
ead *folio_list,
>         memset(stat, 0, sizeof(*stat));
>         cond_resched();
>         do_demote_pass =3D can_demote(pgdat->node_id, sc, memcg);
> +       if (sc->gfp_mask & __GFP_IO)
> +               folio_alloc_swap_prepare(folio_list);
>

Some general questions:

1. How many pages in folio_list typically do get reclaimed? There can
be quite a few with references, which we rotate/promote, when we scan,
right? Would constantly overshooting the estimate create problem down
the line?

(This is one of the few places where indirection (vswap) would have
helped - we can collect a batch of pages after unmapping, then pass
them to the phys swap allocator (after checking zswappability, etc.).
Maybe we can solve it better after it's landed, and accept an
imperfect solution for now?)

2. Should we skip this heuristics for cgroups that enables zswap (and
maybe zram)? Contiguity matters less there... unless it help at
writeback time? Hard to say without experimentation - maybe you can do
the same check you did for your zswap writeback batching patch series?
