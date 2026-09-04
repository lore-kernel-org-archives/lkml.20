Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B4472536
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525765; cv=pass; b=aFhZnmbABGAvONFfgrZcCNPxg1Co43xmkbVHW8OxP/xEfAQDQwsv+AObYu9/gn6V3lLCNL+oEoAvIruRIdsv4lgMGbZkF+sRzmwpyaXOTMNFUZ3SCd3x6mfuyBw858DqGCxTq8aBuIzxOcqNia36fhTH30e4lbRHx81lD6AYGhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525765; c=relaxed/simple;
	bh=1kkDQ0G6mKgPXFkkduWcPQQOdIc4BX6gj/dRjK4F228=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzRc1lDKgbTB1wsVpvFFOuHoB0vnD6HxjlwRU9EmvpU9xMysqlCLU+n5F6K7pr/z1pf4pf2qS+/VZ+fTEJVJnch/m9MM46d3TB8/Y9rAeu2cACh4NKh6JDWybZJKngu93NEL+0l46x2uGDzntAYxYaP9nRSBaXCTdV1StSQt6Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD4BTesr; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD4BTesr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso150631966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525762; cv=none;
        d=google.com; s=arc-20260327;
        b=CK6Tcd7riRAR3i8vbv4o1bsJJhVU6bFmWS99ryZtixgTPv8pdyfzfDp32fsVIfb3Tn
         0lUOp6yrd9PDbSYHkubRfjoIoo5hxvNXz+ISn+1ykh5Wfdr7I+WxxfKhSqCxhMq2X86z
         YF6NN+1yNY2GeMxVodm9BC/9ZoJWVszvR9ItYTNJpSTmId+iiQ9AWJyWedGEoxedq975
         U9G1klPu+4kW/Vdl41XNIUII1mc+sl1N+s1+/J+gBnmHSp6Yk+DS12hz7v8LPK7u0MWF
         3EbP79pKXcFeqB+sHBpLt6wepHAjAEPnnlLjH2cFEcxGxEETSxvVtDQNCR/ctzl/sN/T
         ZuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9NvEAvFmRQ4KOLpVzS9bkFTsS1KS/yh22uq2NVZ+PR8=;
        fh=prw8v+RNjo94B7XVziZZaC29YbLW8wp/iofZ+iAcR/I=;
        b=NKLX4xuCKVhgaZPg/8wUAGu5NS2aJbVIB7it0rUXNs9YzJvP4mHFc2Z+jaaVfl4xHl
         cQhGXrXf+cEpYTDeBkcP6hbWk/nEtEONCiZy6p9rYLIEC7BIoPHeXfibdx0ySBBSJN0v
         SXnY9gPUeeiYEGVdHuok1eYJQXqkNNCAUGnMz557G8szOu7YHEc8gHw/Nhil5pOxra5/
         Eipyn+oezmxfCJ1BHWnvcjHPsfBMhFcZvJD9rcTOqH0/NEo4hedJ4r1tcpGJetK/UrKy
         SFxjDjWOW3hGVq0HJB/uMlSpavH3QWFsi66DRFh0V+k6mfELYXYEU+jN5mt5YpzAfsv/
         zHyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525762; x=1789130562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NvEAvFmRQ4KOLpVzS9bkFTsS1KS/yh22uq2NVZ+PR8=;
        b=LD4BTesrk+5EX7yPGfnHxI1dGboCsHNd95DDgCtyMAN74ED/D1dVHacPIchYdwL6rz
         Lg+zkgUXwr+a3IXWKCk4WfSe5SIvM27SLYhQ7WSMudIyNKCk3ylzvab+HhXIE0juFIJB
         k5FzJ0iXMofDvV3/4e5HUff8aD7Gy10VKsiZo+FxMeB6gI6YrJf3HMjdCKxJ1Qhssf64
         MWcNE5kBM1t7SUnPH71+kGssizir7Ta9BQKVLA02FTNFh+CKadOi91OmtR6J+m6VKlHK
         VrgfGJ65FK7js9XEsBw05FewXc4Y7+uPY/luq4t6XdW6BrzXc/QddXYSQgXIZLjDSnCN
         x3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525762; x=1789130562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NvEAvFmRQ4KOLpVzS9bkFTsS1KS/yh22uq2NVZ+PR8=;
        b=konYnqFK1xRLUoAX+QLH1j4W+20NSKQUtLBxFcDHyT1rdO5AqBSCfatu9WmqG6YsgW
         6H6Iv65axq9mZycSEv1mXfjWFlImHYDYs3HLgfg0I9qSo2zHn3DnHTnWtNMcVaINM/he
         SL1RQE5XrPxMjHL5ha6ypDxidIILp5jsBfZfCeXz674GG6cDghx7FhNq0bBmbuKjLdiY
         G2zEhEHRe5oadb8Pi7lImVVo31LvNKfk1GcslZdgOzPbFhhgzbHBsIWTJoas3L8D9KrQ
         ueILVKFrYfACABnxKUTU0kn8PfFxBX+nVGTWkkJYqbOR1aNihnEQwsad2eXf3Rbrmber
         ntpg==
X-Forwarded-Encrypted: i=1; AKwUvBy/i/p3+vVFc32j1myH/sd3pFAq1oGYlm3jtSLUsAlxl4qgdfw+d2emSE/S3eCkSpEGcJ8pJBXAtjHBcYE=@vger.kernel.org
X-Gm-Message-State: AFuF++mgl4O7hoP8cpPgK7VV3pttpW/M70lWZuF1RuSs93spGOuk7+m3
	W0kUKvzyFq4pQX57hywv/zF1NgThzcSSlbuBT3MQoW3A6MFKgxT6u1fgB0a8jg0VM96oPKeaLpP
	vAo5dbkR8s95IX+br8SdY9FLclRUJwsZnhkcwAa4=
X-Gm-Gg: AYBFou16xM/dXq0SLqP4f5q4AmU1pdLDVLhTiZXW2gfYTW2k+yljBXDWBkycy0XdIvf
	k215++pXRD1DPX2yXMmewGIPjBbDbvQz90XqXrVoCrYiA5sB8HdrfsK9F04UVZrp6TaQamRlv0H
	XZsSeJvJdl6mq+qEb/G9bwGZDejzIIYvdj93G0asWV6bT7s+sAVoY0V5AA47j7kJrdLYS+Mkqbz
	NNFzZ2Ttlaz//EpLzBD/B8HNXoiOkKAkmuQ1rqiPBy0SSSuVfRHHg2VOnk3puzPeoOYO8iQsM3B
	d0Jxq7YX5n5i0Sxo5zYMV0dZ+QLYsFrmNmUb1ei0/o91uAR4y/oC9XqvC64WaNXmOq4FCbwQgSL
	IBQ==
X-Received: by 2002:a17:907:3c8f:b0:c25:4b9c:5ed1 with SMTP id
 a640c23a62f3a-c260c9ab80emr257426666b.12.1788525761715; Fri, 04 Sep 2026
 05:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-memcg-swapcache-stats-fix-v3-1-795f5d455f7b@tencent.com>
In-Reply-To: <20260902-memcg-swapcache-stats-fix-v3-1-795f5d455f7b@tencent.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 4 Sep 2026 20:42:05 +0800
X-Gm-Features: AcwNN1VHGK44NPRvYuy__k5IFafFsHEdaZnGRcRo-ytY5YzYC93mhmnvSLdmfxw
Message-ID: <CAMgjq7BNk004x_zQM3k4QuCLmqMx0BVvd4HLxHq5+XvZ0fTk2Q@mail.gmail.com>
Subject: Re: [PATCH v3] mm/memcg: clear folio memcg after changing per memcg stats
To: bingfangguo@tencent.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Bingfang Guo <bfguo@icloud.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:07=E2=80=AFAM Bingfang Guo via B4 Relay
<devnull+bingfangguo.tencent.com@kernel.org> wrote:
>
> From: Bingfang Guo <bingfangguo@tencent.com>
>
> I notice extremely high swapcached count in the per memcg level
> memory.stat when running tests with cgroupv1 setup by swapping pages in
> and out.  It seems that the counter never gets decreased so the value is
> rather useless and confusing to users reading it. So I think fixing it
> so that the value can reflect the actual swapcache usage correctly could
> be helpful.

Thanks! Good catch, I missed the V1 case.

> __memcg1_swapout() transfers the memsw charge of a folio to its swap
> entry and clears folio->memcg_data as part of that.  In the vmscan
> swapout path it runs before __swap_cache_del_folio(), which then
> decrements the swapcache stats through lruvec_stat_mod_folio().  Since
> folio->memcg_data has already been cleared, folio_memcg() returns NULL
> and the NR_SWAPCACHE decrement only updates the node-level counter
> instead of the memcg's lruvec, leaking the per-memcg swapcache count.
>
> Move the __memcg1_swapout() call into __swap_cache_del_folio(), after
> the NR_FILE_PAGES and NR_SWAPCACHE updates but before
> __swap_cache_do_del_folio() removes the folio from the swap cache.  This
> keeps the stats attributed to the folio's memcg while still recording
> the swap cgroup with a valid folio->swap.  Add a swapout parameter so
> the plain swap_cache_del_folio() path is left unchanged.
>
> Fixes: b197d41462c20 ("mm/memcg, swap: store cgroup id in cluster table d=
irectly")

Is this the right Fixes? I think the problem could be introduced by
2732acda82c9?

> Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
> ---
> The problem is reproducible using the following script and program:
>
> ```
> #!/bin/bash
> set -e
>
> CG=3D/sys/fs/cgroup/memory/swapcache-leak-test
> SIZE=3D$((256 * 1024 * 1024))   # 256 MiB of anon memory
>
> [ "$(id -u)" -eq 0 ] || { echo "must run as root"; exit 1; }
> grep -q . /proc/swaps <<<"$(tail -n +2 /proc/swaps)" || { echo "no swap a=
ctive; run: swapon <dev>"; exit 1; }
>
> cleanup() { rmdir "$CG" 2>/dev/null || true; }
> trap cleanup EXIT
>
> cc -O2 swapout.c -o swapout
>
> mkdir -p "$CG"
> echo "+memory" > /sys/fs/cgroup/cgroup.subtree_control 2>/dev/null || tru=
e
>
> echo "=3D=3D before reclaim =3D=3D"
> grep -E '^(swapcached|anon) ' "$CG/memory.stat"
>
> # Put ourselves in the cgroup, allocate & touch anon memory, then wait to=
 be reclaimed.
> (
>         echo $BASHPID > "$CG/cgroup.procs"
>         # Allocate and dirty SIZE bytes of anonymous memory.
>         ./swapout
> ) &
> WORKER=3D$!
> sleep 2
>
> echo "=3D=3D after reclaim (swap cache should drain to ~0) =3D=3D"
> grep -E '^(swapcached|anon) ' "$CG/memory.stat"
>
> SWAPCACHED=3D$(awk '/^swapcached /{print $2}' "$CG/memory.stat")
> echo
> if [ "$SWAPCACHED" -gt $((1024 * 1024)) ]; then
>         echo "LEAK DETECTED: swapcached =3D $SWAPCACHED bytes (expected ~=
0)  [BUGGY kernel]"
>         RC=3D1
> else
>         echo "OK: swapcached =3D $SWAPCACHED bytes  [FIXED kernel]"
>         RC=3D0
> fi
>
> kill "$WORKER" 2>/dev/null || true
> wait "$WORKER" 2>/dev/null || true
> exit $RC
> ```
>
> swapout.c:
> ```
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <sys/mman.h>
>
> int main(int argc, char **argv)
> {
>         size_t mib =3D (argc > 1) ? strtoul(argv[1], NULL, 10) : 256;
>         size_t size =3D mib * 1024UL * 1024UL;
>         long page =3D sysconf(_SC_PAGESIZE);
>         char *buf;
>         size_t i;
>
>         buf =3D mmap(NULL, size, PROT_READ | PROT_WRITE,
>                    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (buf =3D=3D MAP_FAILED) {
>                 perror("mmap");
>                 return 1;
>         }
>
>         /* Fault in and dirty every page so it becomes reclaimable anon. =
*/
>         for (i =3D 0; i < size; i +=3D page)
>                 buf[i] =3D 1;
>
>         printf("allocated and dirtied %zu MiB, paging out...\n", mib);
>
>         /* Force the whole range out to swap. */
>         if (madvise(buf, size, MADV_PAGEOUT)) {
>                 perror("madvise(MADV_PAGEOUT)");
>                 return 1;
>         }
>
>         /* Give reclaim a moment, then stay alive so the cgroup can be in=
spected. */
>         printf("paged out; sleeping so memory.stat can be read. pid=3D%d\=
n", getpid());
>         sleep(30);
>
>         munmap(buf, size);
>         return 0;
> }
> ```
>
> Test result:
>
> before:
> ```
> =3D=3D before reclaim =3D=3D
> swapcached 0
> allocated and dirtied 256 MiB, paging out...
> paged out; sleeping so memory.stat can be read. pid=3D4778
> =3D=3D after reclaim (swap cache should drain to ~0) =3D=3D
> swapcached 268435456
>
> LEAK DETECTED: swapcached =3D 268435456 bytes (expected ~0)  [BUGGY kerne=
l]
> ```
>
> after the patch:
> ```
> =3D=3D before reclaim =3D=3D
> swapcached 0
> allocated and dirtied 256 MiB, paging out...
> paged out; sleeping so memory.stat can be read. pid=3D2601
> =3D=3D after reclaim (swap cache should drain to ~0) =3D=3D
> swapcached 0
>
> OK: swapcached =3D 0 bytes  [FIXED kernel]
> ```

Nice, the reproducer is under "---" so won't be included in the commit
message but anyone can find it on lore.

> ---
> Changes in v3:
> - Add doc for the new parameter.
> - Link to v2: https://lore.kernel.org/r/20260901-memcg-swapcache-stats-fi=
x-v2-1-9caad330459b@tencent.com
>
> Changes in v2:
> - Update the commit message to describe the problem in the beginnning.
> - Change function declaration for !CONFIG_SWAP as well.
> - Link to v1: https://lore.kernel.org/r/20260831-memcg-swapcache-stats-fi=
x-v1-1-1c0819ebdb86@tencent.com
> ---
>  mm/swap.h       |  6 ++++--
>  mm/swap_state.c | 11 ++++++++---
>  mm/vmscan.c     |  3 +--
>  3 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/mm/swap.h b/mm/swap.h
> index 0b5d507739bcb..b3b54c28929a1 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -319,7 +319,8 @@ struct folio *swap_cache_alloc_folio(swp_entry_t targ=
et_entry, gfp_t gfp_mask,
>  void __swap_cache_add_folio(struct swap_cluster_info *ci,
>                             struct folio *folio, swp_entry_t entry);
>  void __swap_cache_del_folio(struct swap_cluster_info *ci,
> -                           struct folio *folio, swp_entry_t entry, void =
*shadow);
> +                           struct folio *folio, swp_entry_t entry, void =
*shadow,
> +                           bool swapout);
>  void __swap_cache_replace_folio(struct swap_cluster_info *ci,
>                                 struct folio *old, struct folio *new);
>
> @@ -452,7 +453,8 @@ static inline void swap_cache_del_folio(struct folio =
*folio)
>  }
>
>  static inline void __swap_cache_del_folio(struct swap_cluster_info *ci,
> -               struct folio *folio, swp_entry_t entry, void *shadow)
> +               struct folio *folio, swp_entry_t entry, void *shadow,
> +               bool swapout)
>  {
>  }
>
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 305877e1f4d7b..99985208b529b 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -306,6 +306,7 @@ static void __swap_cache_do_del_folio(struct swap_clu=
ster_info *ci,
>   * @folio: The folio.
>   * @entry: The first swap entry that the folio corresponds to.
>   * @shadow: shadow value to be filled in the swap cache.
> + * @swapout: whether this operation swaps out the folio.
>   *
>   * Removes a folio from the swap cache and fills a shadow in place.
>   * This won't put the folio's refcount. The caller has to do that.
> @@ -314,13 +315,17 @@ static void __swap_cache_do_del_folio(struct swap_c=
luster_info *ci,
>   * using the index of @entry, and lock the cluster that holds the entrie=
s.
>   */

Perhaps the Context: part of kdoc could briefly mention that for
"swapout =3D true" case, the folio should be a reclaiming one?
