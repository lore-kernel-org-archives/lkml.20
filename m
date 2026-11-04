Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793807676;
	b=tumGWBjNBEFomT0A/IwVPquTUlB4fJFJRPiFznl7KRKP2pSg6MMMB/D0O693nXqItcwu
	 r/9mF2ophdtx+/1BPtNrXw4PYZb0EgwKMP814UQvFFv3L3KumrM2wqrP9yRAY7u31xK1k
	 l1u+HSmPxafHO4dMafOfOiRyKpsTre8I4TkThB1+8zV8emP1pBY2zQ7jagy9mH6VaAOJm
	 g/GIpA1tQ9B7UJuRgWg0ZuSfBBm28KbNN30U1KvaFStAlVBnfvanOpsQfSE6JMHRSi99W
	 6o/R+qTirABxezHGQPxM+5KoaE6Ba9ailY79KMVTxb8x+FHWk1RbOUs8ssiS0Mr3thw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cx92qKyEpq2897WTtMf3H81T6MoxWunfdKstttFLagg=;
	b=QbYOdMPbH/ezM3KOFXtXTU144Y+usKcbJX6Q4eX7XLu04/QA8Jx3fmgGd8Oj3ehMYBcI
	 OcJf2gRMP2Ewnz9OnIdsmll2DlK1byfj9pOqQqgjE1AxQRRPNU6D8nH3SUh17bkNVmBiP
	 ebqQY2xiv27t66GslUGZAu+1agcmFrv40GkJ2sQHhotj4aTjIBOcVrfsvY2m3nL2WihVI
	 YwuancAn3sV7nQ9m26qXp528+mhb6nc5hj2CrRMv3lN0xavwhoSgTjhAtwfanj2hwiI89
	 P/86K24sGA8wng7fzfh3efm4BAbUeSQ6Cgefy7JSTAcaZOxFi+CRg23NdD9F6HMpnmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USdVtnHL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB628606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB628606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USdVtnHL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36d6765756fso625567eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793807675; cv=none;
        d=google.com; s=arc-20260327;
        b=riXzkH/eYKntg1WYFqL5WucA2wg3AffFgYgvaS2lT9INvCRxdLzYN7CRbM78DDsSCv
         O5/N/KaGzwJrjoxKGTHPvWURLADwN3YraEZzX5OHTD9OmJdpjiMmvqP7SNvZdBb9hCwz
         0SuatiPzfS7dAvXnXjXDks9/Xaw4h0AA7c3fvPh1nmISvGbQi4Gh6pYhJ33tJVKe+h2f
         pxBe1zNyWh58O2WHjdhlVafkDg9GO8OVSAkxrmJ3KUjnLs5psdFQ+s/xUjEDMoVc0Yq/
         5xssol9g1F3k/m/Va/d89q5EBruGISIe6Vv/RfUufkx/MeuNIUw8fq3Wck1jjjYuf00a
         zHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cx92qKyEpq2897WTtMf3H81T6MoxWunfdKstttFLagg=;
        fh=Y0207PJEBYR1iSQXUePbvWCTKOOOjKW4qNtrmYI1gAo=;
        b=lN7HOKIxJ3GxWZN505tuqdm9x2IRl3Dwq5ogCBSBCCcr+zB9pQLl0O0Ped7/8B2b0F
         Pp4Gk/HW8/8+fPks9AWiLt3hYjul21XzX9wslX2BrVwJlLcWChHN4PakmbZWCJFV/nuh
         KQIAeOoGRQJilPGgFrmLr/Xc6z3DBXT4zLzg8oXFzuJ++Gll5gh9rbJw98QDA/t3lHXx
         k3cXUHkv1gM7+jdSPTw6EcKnEiITp+6skyvMHKmm8pifLaZfLELNHXxA8jC3ZJEHDtqa
         30fovO92RtNja13gV+mlR9+ygN4IfonwzbZJU50sVZMxek58ftVTjXW3sS7F34tkU1AJ
         HfXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807675; x=1794412475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cx92qKyEpq2897WTtMf3H81T6MoxWunfdKstttFLagg=;
        b=USdVtnHLVmkBYxIrE8NpjKJyz95ScF+tc+ms8CbYIkNx4gFyK+RCpWfNwi7GXS7edW
         0Zy7WO7Eva4S/WXchVf48n60c60CbPyX9mrcp8h0nvvrAi8e0e4U9EgRTkTSAgjUnL+9
         vUApgFpOBvTFJcstMkHwy2nDsTqDNsZA/xjI7tRq1mVGreL3ehalgf3t4XHIhn3ggWnq
         bmkKaSuR0zqznEzFr2+8gsbtyKis/Ztm1QkMcXX0va08n6CM4m2j28MTNRZeN8dg2wcI
         mBl5BxPgwRZDh7p9FlzwlExOenruZQ8wCC810OwoztPi9KiPhBJB8y8ggjCDvKXXfgps
         AKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807675; x=1794412475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cx92qKyEpq2897WTtMf3H81T6MoxWunfdKstttFLagg=;
        b=LT7rJjSI4PbT7OyVKWS65W1l0Zrge2uYCW7yeralH5awmYbYMg8OZYHRoxqB1WKzrP
         PB08G2O9DUwjV8qfNZagjoQFIVc+WcGaSazg9h3ZlWUnI/Lb/mSctZGFGD1VMq1kiwoF
         qV6/DZmlMoae6Tfo19eb+Lsup2dHc3eAv959ZGzF0kSTZ5SFjeD86Wz3ODaxbfpUo+w1
         wf+6ePTsOa/rIuTSrJ+eb37uLWxwPe5N3YLMDi8Q3a58XiFfIehSbSLTOoZ+zngjlsu9
         3O25cioM65QPDoOqR07+gCmEdNITANQbp8IuKt0pgphcVYts5Raer2Ryzp9yGrs3PZOT
         QevQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcKl3YandM8ekjlsF9A9mPhYzXT8LBhJlj7ZYrNIoD5sg0sEsxCnzllaFTWj2LcM8GqFdIX+5riMkHd9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HPWHHusaJvU9HNaGF1LksXEp85gD9rgoUd2BJ2lO0G7k97i8U
	1hw8HLEYOtg1b+Z4TEpijGITDP/0dbZVuQ/qSfrk0hZiaXh3/+e1UqhpUQWEHPuKQak1E5ohh1v
	/v14TIndSzfr31UwJntnVWHNccbY7Bag=
X-Gm-Gg: AYBFou1WOTo3IrUIZrowkeZVBdxtYv23bL1gQM30qs0Q9PqIV2Olhgcgx6VNuhgEspp
	caC3qL6/Kk8MvtfAL8+yk8f0bbcgk2MeURQJtGe4NgRbe0ZnuraiHLQUI6+LAgI9WRMj4WwhFfk
	sEQ/1JEA70J5gvIDKxoeuHPSCZKdHpM80CJEQ41/cLHt3xO3Np5yMtE3XYlrPFWmsl7sCQfPZP3
	Mmp84J30oVfayZMluNZ91HtCI4AChfAGlnSkWyWy2OSHH7BiM6oYWxdN74vpEODfT8TbrQ3t7UV
	D5+UZaYcrEIBJXlLeENLR/zaChaZPkuVRnXRD4ghqeQFePNwHsynMmzLKgilhZhX7BoKdZ9klo9
	4QmH0goAKulRDBUymj4NOH5Yn8eqEvc+TUfmd0jOqZj1B9UDJ+Um5HYJiFoLFB2fCxAGikRGfyO
	6KfH0qNAuV
X-Received: by 2002:a05:693c:20d3:10b0:369:fa21:ba0b with SMTP id
 5a478bee46e88-36a42451227mr25116892eec.33.1793807674600; Wed, 04 Nov 2026
 07:54:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104044313.2099309-1-husong@kylinos.cn>
In-Reply-To: <20261104044313.2099309-1-husong@kylinos.cn>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Wed, 4 Nov 2026 10:54:22 -0500
X-Gm-Features: AclHuK_e8FSFcrk3wkKeDxPbipTjNjHbgM_b9VTLRhZtBrOSof821inm6Zn9PkE
Message-ID: <CAN+CAwNJP+CP2kRsgcYKA=3cgy-o9k5PoUnR9vUy4suJu+4ciA@mail.gmail.com>
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
To: Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, willy@infradead.org, 
	shivankg@amd.com, ridong.chen@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:43=E2=80=AFPM Song Hu <husong@kylinos.cn> wrote:
>
> NR_FILE_PAGES lives on both the node and the memcg plane for page
> cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
> it to the folio's node and memcg, while __swap_cache_add_folio() and
> __swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
> the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
> carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
> memcg file accounting when swapped out, and anon folios never had any.
>
> The cross-zone arm of __folio_migrate_mapping() moves NR_FILE_PAGES on
> both planes unconditionally.  For swapcache folios the memcg plane is
> empty, so migrating one misaccounts it: the destination accrues
> nr_pages that were never accounted there while the source counter
> underflows.  The wrong counts persist until the memcg is destroyed,
> but the aggregate in memory.stat stays correct, so the drift is easy
> to miss.  NUMA balancing, migratepages, compaction and memory hotplug
> can all migrate such folios.

Hi Song, thanks for the patch!

I think this description was a little bit hard to read @_@ so the core
problem is that swapcache folios are accounted differently in per-node
and per-memcg, right? And that swapcache is not accounted towards
memcg's NR_FILE_PAGES, so we need to split up the mod_lruvec_state
into the node and memcg accounting separately. This makes sense to me.

> Reproducer, on a 2-node QEMU guest with cgroup v2:
>
>   1. create a cgroup with memory.max =3D 50M and swap enabled;
>   2. memset 128M of anonymous memory in it, so reclaim swaps most of
>      it out;
>   3. fork to raise the swap entry refcount, then fault the memory
>      back in, so the resident folios are swapcache ones;
>   4. migrate_pages(pid, node0 -> node1).
>
> "file" row of memory.numa_stat (bytes) after step 4:
>
>                     without this patch      with this patch
>                       N0          N1          N0          N1
>                      0 (*)  51691520         0           0
>
>   (*) the source counter has gone negative; negative values read as 0.

Thanks for adding the reproducer. This helps a lot for reviewing!

> Keep moving the node plane via mod_node_page_state() and skip only
> the empty memcg plane, mirroring the swapcache exclusion the NR_SHMEM
> handling in the same block already applies.  It accompanies

So you note here that the block already has a kind of swapcache
exclusion. To me I think the code block we are working with here is a
little bit complicated with all the cases we have to look into (and
three separate folio_test_swapcache() calls...). At a future time I
think we should explicitly lay out all the cases (swapcache /
non-swapcache shmem / normal file) to make it a bit easier to follow
where everything gets accounted for.

I say this because it took me a second to realize that the #ifdef
CONFIG_SWAP should only apply to the NR_SWAPCACHE modification and not
other swapcache conditionals since it protects the enum and nothing
else.

Anyways, none of that should block this clearly user-visible bug.
Thanks! I hope you have a great day,
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> commit 4eef27af2932 ("mm/migrate: move NR_FILE_THPS on cross-node migrati=
on")
> and commit c5eef2e03618 ("mm/migrate: move NR_KERNEL_FILE_PAGES on cross-=
node migration").
>
> Fixes: 0d1c20722ab3 ("mm: memcontrol: switch to native NR_FILE_PAGES and =
NR_SHMEM counters")
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  mm/migrate.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 28a8d7734735..bc60f6587d1b 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -690,8 +690,20 @@ static int __folio_migrate_mapping(struct address_sp=
ace *mapping,
>                 old_lruvec =3D mem_cgroup_lruvec(memcg, oldzone->zone_pgd=
at);
>                 new_lruvec =3D mem_cgroup_lruvec(memcg, newzone->zone_pgd=
at);
>
> -               mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> -               mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> +               /*
> +                * Swapcache folios carry NR_FILE_PAGES on the node plane
> +                * only (their memcg footprint is NR_SWAPCACHE, see
> +                * swap_state.c), so move only the node plane for them.
> +                */
> +               if (folio_test_swapcache(folio)) {
> +                       mod_node_page_state(oldzone->zone_pgdat, NR_FILE_=
PAGES,
> +                                           -nr);
> +                       mod_node_page_state(newzone->zone_pgdat, NR_FILE_=
PAGES,
> +                                           nr);
> +               } else {
> +                       mod_lruvec_state(old_lruvec, NR_FILE_PAGES, -nr);
> +                       mod_lruvec_state(new_lruvec, NR_FILE_PAGES, nr);
> +               }
>                 if (folio_test_swapbacked(folio) && !folio_test_swapcache=
(folio)) {
>                         mod_lruvec_state(old_lruvec, NR_SHMEM, -nr);
>                         mod_lruvec_state(new_lruvec, NR_SHMEM, nr);
> --
> 2.53.0
>
