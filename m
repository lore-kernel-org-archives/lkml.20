Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06A48DB58
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174677; cv=pass; b=YHz+jdE6Q3mjLrQLYTwRHtn1tpIX+p7IFn5vC76ji9bSynwKaD0TCEOfHeKokRJbLOQyz6oRbD3bSNbhO0UeloBC/81uciFJol78lyG1dQ9IRthtThu6N6XhRfw3/KnXW/eoVuXjd9x1fbQoUG/g8BeRqVbVyfExTWPIP91S6HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174677; c=relaxed/simple;
	bh=5S5fpsqlnOYMchdv/hvhWnJSjjDfPsBxyFB+nmKszXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+5wHjEb27zRAHBQbRNcKyMiadkfKWWEOqL1wZl9OpNn1X/ZRfYy5KZP7WADxhVH4EWZL8BnyBrvRznzNKYu0J84NPXd2fvSu+eOLG+JeZoVfeFaOC2xObEovsOkBYwLYooBM2O0iONZUTVJanJfXvznNAXD8Lf8h+v5pbyn/gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn+7ts0w; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn+7ts0w"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so209876a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792174674; cv=none;
        d=google.com; s=arc-20260327;
        b=TL27uMHsIKGp2J7FaT0nMj0BZ3GccU9GQMgUg5dFraHjVDI8dqNPwPskPGkFw+4fJV
         WMHBSYi18D4oOdPNY7lF3r7OZQ93sinfa8LEDh5HCQtTZvq24+EZYhNlQX4m9rAAfIa2
         medsYcMKTX9Mfcjrq6O8Uk12+7jtz6RDfrEwIGqVAhX8XTotyohH7ZAUIQsZIN/GDNlM
         Hrq9jjzJtpwBuAHOHRrp7eG+qtOx/OH1d/RK+qgXeEOeOxxwJw9PRjbWm3Y+oItncy1F
         M/pJ1vmwJ0ipB3STHw8nDUqYh3ew1hxSYSinGfrwm3U+yC0X5R3wccDht/6MVE5/1KEW
         /n1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOrsml+QKf7TFFWgAyGx/jH9V3mGobRODjiglkN265E=;
        fh=56cbCwhtxfnluPdk03upZJ8g4RH8aYs7e2JOCNW3AQc=;
        b=hBRJAncHbXrfM8FlFi7/zmCh5AuGnWPcBDb1Q1/5xFsE67Cr6n2glkpmTad0VpiYjp
         EXL87zsaaM76wH5bpcmBc6KjZ7rEO5Te8Zb5kpRMGcj6PzmvpWkOIWtEbsUDs9l1EwU3
         zUWWxHbPFOj8AWCp7tN4hsIzolVXKhOCbNbnpAm/jjZ//Ob5y7N4/rqoFH1TlzROuVOg
         AiF+iu7VA97yVF1SmTfUTcI+oaaNNBI9V7/bsM065xDKyZs3Ppd37fJ77AHNDrJMivhD
         x5WK1e6/R6TebHVooASi7tzYcJVz/g8mCO4a3sd1Hf+PgErU/SXGAYNl+lWeFB4x9M7n
         xbxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792174674; x=1792779474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOrsml+QKf7TFFWgAyGx/jH9V3mGobRODjiglkN265E=;
        b=Pn+7ts0w59te9Nc/UosY5AgpMqnmNZid4KDWaQ3qLnIjrBQpHw5Zo7+7b/Hqbs1v7K
         KYOR4Cxqjze9hYQfTPbU+L81tkd19z4vL3n2J7jFLMzoN4LmzBLghL7MI4b1axMhM+m1
         ppWbSrf/5VwneXHLHbWgT1YejfvdNE/FsEewPul7+UW5Gml6/DqSzyMde8E2XIi4qh7a
         BNZjd4QjiGDq4sNFjjRvJSaYxOT+cF+mx+nnWPyuq34gBKoLwOxrz563l3oSXU4Ng+6R
         sy0CrphPD84SPSNzS9B3Ha5jQv6VMpg4Mz//ZoB/oHE2egKMSkcg9FxjGZfpZpCcn+Fp
         2gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174674; x=1792779474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOrsml+QKf7TFFWgAyGx/jH9V3mGobRODjiglkN265E=;
        b=xNmFNOLyt3lkRkuvDicwHn+e/GtZ6DbMKvOz8ffcB2O8oFVH3DskzwdXfstPTHw0hG
         W7GNss3IWn27Bok6T3vvAV2J7NWMtiurS20R3uzzKkQ93XvEAXnnOmCIC+kc2F5kT5Db
         2LFNYvKxWgJPjAqKci5/vJghpEuYn0uq92k63uMyjFDjiVz3QsQ1C7BoZFprki/7R2Cy
         FkXTThlUvjcgh1NJDVFo6BR0rvZS08IrxhYjQRPmA/aYn4TRxH4R7W1jRlBkD1cJMZiY
         Yz/Y99OO9KGCfH0BkbY6bb4mKh5VbNQDLmm4bBRQUxB4BJ3DvICrDd8ULK8zT4oc8shR
         LkbA==
X-Forwarded-Encrypted: i=1; AKwUvBz9ugkyZcPGnjQ3MjKAdKYCXrd0LMJolheREVFhhJ1eILSWcSTyHloiKPjZOoCZeDMkAhyK//m/Egswpi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJesoOah6kaD1fGGVF87rUK4s3O4pVrcyXpX2cWRg+d8Tm9w1gl
	j6oEWLYGUnczJ1h7CkceC63bsws5pQLtvu9iW3JCIjc1Cbm4r8vX4GEgkHcWT0uUCsYt5QXjhyl
	VhPKd+YXSxETnmi6xlJ3H0G5sLh0mtdM=
X-Gm-Gg: AYBFou09wVudUEZEc9Bf7ndWxf/90WiH5tm+OYNt+NJcRqXo+dlTHXiwXfwLSPcnmGb
	lHjbzIj9KbpA6ipCTy3rfauQ0qbziGyKxmCG9AeOm1+kfeuDuFBS6fGrDTe5o2C+MKg8pW8Gv8f
	uUAPDna68sNP7HSSHoBvvrEyGzwRtuB6qYVGi/Yj5Nt70StLGyM1idHSLUVuOw0Ocjn4PKCcmsx
	SG5jULpGjAIFOiZl0yCx+/gsIOKbPlemf8b5rxgc95ykOfw5UFJOZht+hmnJu5sasvhJRnyHRF9
	r7wDg4CEEDZovqww3BzZ5jTw3bOPFePW1cot8GC1AZmWtoO8krhP7w0oKB6mzlJzceMl/GO8RP7
	HxCEITle/LXnWts0XDmrTAXI=
X-Received: by 2002:a17:907:6b86:b0:c41:944d:d2d2 with SMTP id
 a640c23a62f3a-c419f316ab5mr46769066b.30.1792174674034; Fri, 16 Oct 2026
 11:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261014090821.227366-1-jiayuan.chen@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 17 Oct 2026 02:17:17 +0800
X-Gm-Features: AclHuK-RW0wt5_KGT1K1een9-4BwXdt5AoxrfQKz3zIk5YkesZatKqP4zT5kViw
Message-ID: <CAMgjq7CT4srpTcAkStOV6zN8X2v4mPN7cRzA9B_eevFB4azvtg@mail.gmail.com>
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

On Wed, Oct 14, 2026 at 5:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> On our production hosts we saw swap cache only pages keep growing for day=
s:
> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> swap slots were held by folios that no process mapped any more, charged
> to cgroups whose workloads had long exited. The only way to get them
> back was swapoff, and with other services actively swapping on the
> same host that is not an option.
>
> Such a slot has swap count 0 and an unmapped folio pinned in the swap
> cache, left there after a process exited or did MADV_DONTNEED. No page
> table holds its swap entry any more, so nothing comes back for the
> slot; LRU reclaim drops it eventually, and the allocator only reclaims
> such slots once swap is half full. The growth stopped exactly there:
> at 50% of the device, where vm_swap_full() becomes true.
>
> The race is readahead against a zap in a neighbouring thread. Readahead
> works on virtual addresses, so a fault at the end of thread A's range
> pulls in the entries at the start of thread B's range:
>
>   thread A                               thread B
>   do_swap_page()
>     swap_vma_readahead()
>       swap_cache_read_folio(B's entry)
>         folio locked, added to cache
>         swap_read_folio()                MADV_DONTNEED
>           zswap_load() / bio in flight     zap_nonpresent_ptes()
>           .                                  swap_put_entries_cluster()
>           .                                    swap count 1 -> 0
>           .                                    __try_to_reclaim_swap()
>           .                                      folio_trylock() fails
>           .                                      gives up
>           folio_unlock()
>       folio_put()
>   -> slot: swap count 0, folio in swap cache, not mapped, never freed
>
> The lock is one reason it gives up. The other is writeback: with a block
> device as backing store, B's own PAGEOUT leaves the folio in the swap
> cache under writeback, and when the DONTNEED comes __try_to_reclaim_swap(=
)
> gets the lock but folio_swapcache_freeable() refuses. The write
> completes, nobody frees the slot. The present-PTE side has the same two
> outcomes through free_swap_cache().
>
> Options considered:
>
> 1. Fix it on the readahead side: after the read, check the swap count
>    and free the slot. Covers the lock, not writeback, and the
>    asynchronous read path unlocks in the bio completion where the slot
>    cannot be freed. Two places to patch, neither clean.
> 2. swapoff/swapon clears it, as does memory.reclaim on the right cgroup.
>    That is a workaround, not a fix.
> 3. Have the side that gives up come back later. This patch.
>
> The zap runs under the PTL and the fault path takes the folio lock
> before the PTL, so waiting there is out; a worker has to do it. On a
> lost trylock or a writeback refusal under TTRS_UNMAPPED,
> __try_to_reclaim_swap() schedules si->sweep_work. The worker walks the
> in-use clusters and, for every slot with swap count 0 whose folio is
> unmapped, calls __try_to_reclaim_swap() with TTRS_WAIT, which takes the
> folio lock and waits for writeback instead of giving up.
> free_swap_cache() now calls __try_to_reclaim_swap() as well, so both
> paths give up, and wake the worker, in the same place.
>
> For now the worker scans every in-use cluster of the device; marking
> the clusters that need it can reduce that later.
>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  include/linux/swap.h |   1 +
>  mm/swap.h            |   1 +
>  mm/swap_state.c      |   9 ++--
>  mm/swapfile.c        | 101 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 104 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 4f686709d71f..5777f10e9aa4 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -267,6 +267,7 @@ struct swap_info_struct {
>                                          */
>         struct work_struct discard_work; /* discard worker */
>         struct work_struct reclaim_work; /* reclaim worker */
> +       struct work_struct sweep_work;  /* frees swap cache only slots a =
zap gave up on */
>         struct list_head discard_clusters; /* discard clusters list */
>         struct plist_node avail_list;   /* entry in swap_avail_head */
>         const struct swap_ops *ops;
> diff --git a/mm/swap.h b/mm/swap.h
> index d5bf21f517dc..f62f36c0ce5c 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -309,6 +309,7 @@ static inline bool folio_matches_swap_entry(const str=
uct folio *folio,
>   * - See the comment of get_swap_device() for more complex usage.
>   */
>  bool swap_cache_has_folio(swp_entry_t entry);
> +void swap_reclaim_entry(swp_entry_t entry);
>  struct folio *swap_cache_get_folio(swp_entry_t entry);
>  void *swap_cache_get_shadow(swp_entry_t entry);
>  void swap_cache_del_folio(struct folio *folio);
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index ebef568cd62e..99708f149b25 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -598,16 +598,13 @@ void swap_writeback_dropbehind_folio(struct folio *=
folio)
>   *
>   * Its ok to check the swapcache flag without the folio lock
>   * here because we are going to recheck again inside
> - * folio_free_swap() _with_ the lock.
> + * __try_to_reclaim_swap() _with_ the lock.
>   *                                     - Marcelo
>   */
>  void free_swap_cache(struct folio *folio)
>  {
> -       if (folio_test_swapcache(folio) && !folio_mapped(folio) &&
> -           folio_trylock(folio)) {
> -               folio_free_swap(folio);
> -               folio_unlock(folio);
> -       }
> +       if (folio_test_swapcache(folio) && !folio_mapped(folio))
> +               swap_reclaim_entry(folio->swap);

One problem here, if folio is not locked, you might read garbage from
folio->swap.

>  }
>
>  /*
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c3288910b3e3..ee29085152fe 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -172,6 +172,8 @@ static long swap_usage_in_pages(struct swap_info_stru=
ct *si)
>  #define TTRS_UNMAPPED          0x2
>  /* Reclaim the swap entry if swap is getting full */
>  #define TTRS_FULL              0x4
> +/* May sleep: wait for the folio lock and for writeback instead of givin=
g up */
> +#define TTRS_WAIT              0x8
>
>  static bool swap_only_has_cache(struct swap_cluster_info *ci,
>                                 unsigned long offset, int nr_pages)
> @@ -217,9 +219,19 @@ static int __try_to_reclaim_swap(struct swap_info_st=
ruct *si,
>          * avoiding deadlock. This is a special case and you should
>          * use folio_free_swap() with explicit folio_lock() in usual
>          * operations.
> +        *
> +        * The zap path (TTRS_UNMAPPED) is the one caller for which givin=
g
> +        * up means the slot is never looked at again: it stays allocated
> +        * with count 0 and an unmapped folio pinned in the swap cache. L=
et
> +        * the sweep worker, which can wait, come back for it.
>          */
> -       if (!folio_trylock(folio))
> +       if (flags & TTRS_WAIT) {
> +               folio_lock(folio);
> +       } else if (!folio_trylock(folio)) {
> +               if (flags & TTRS_UNMAPPED)
> +                       schedule_work(&si->sweep_work);
>                 goto out;
> +       }
>
>         /*
>          * Offset could point to the middle of a large folio, or folio
> @@ -232,11 +244,20 @@ static int __try_to_reclaim_swap(struct swap_info_s=
truct *si,
>         }
>         offset =3D swp_offset(folio->swap);
>
> +       if (flags & TTRS_WAIT)
> +               folio_wait_writeback(folio);

You may merge this into the TTRS_WAIT check above?

> +
>         need_reclaim =3D ((flags & TTRS_ANYWAY) ||
>                         ((flags & TTRS_UNMAPPED) && !folio_mapped(folio))=
 ||
>                         ((flags & TTRS_FULL) && mem_cgroup_swap_full(foli=
o)));
> -       if (!need_reclaim || !folio_swapcache_freeable(folio))
> +       if (!need_reclaim)
> +               goto out_unlock;
> +       if (!folio_swapcache_freeable(folio)) {
> +               /* Same for a folio the zap caught under writeback. */
> +               if ((flags & TTRS_UNMAPPED) && folio_test_writeback(folio=
))
> +                       schedule_work(&si->sweep_work);
>                 goto out_unlock;
> +       }
>
>         /*
>          * It's safe to delete the folio from swap cache only if the foli=
o
> @@ -1099,6 +1120,80 @@ static void swap_reclaim_work(struct work_struct *=
work)
>         swap_reclaim_full_clusters(si, true);
>  }
>
> +/*
> + * Free the slots a zap could not take back: swap cache only, count 0, f=
olio
> + * not mapped. The zap runs under the PTL, so when the folio was locked =
(a
> + * readahead or an asynchronous swap-in still reading into it) or under
> + * writeback, __try_to_reclaim_swap() had to give up and scheduled us. S=
uch
> + * a slot is reachable by nobody but LRU reclaim: no page table holds it=
s
> + * entry, and the allocator skips it until swap is half full. Here we ca=
n
> + * wait for the lock and the writeback.
> + */
> +static void swap_sweep_work(struct work_struct *work)
> +{
> +       struct swap_info_struct *si;
> +       struct swap_cluster_info *ci;
> +       unsigned long offset, end, swp_tb;
> +       unsigned long nr_clusters;
> +       int nr_reclaim;
> +
> +       si =3D container_of(work, struct swap_info_struct, sweep_work);
> +       nr_clusters =3D DIV_ROUND_UP(si->max, SWAPFILE_CLUSTER);
> +
> +       for (unsigned long i =3D 0; i < nr_clusters; i++) {
> +               ci =3D si->cluster_info + i;
> +               offset =3D i * SWAPFILE_CLUSTER;
> +               end =3D min(si->max, offset + SWAPFILE_CLUSTER);

IIUC scanning the whole device for one pending folio reclaim doesnt' look g=
ood..
