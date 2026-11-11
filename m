Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411997;
	b=DOJqik+cfPnUebVLcAJMvw3pZqeDOQO6Ue5bu3b5jugRul9Qegla1vApRjmiR6+7aoYc
	 zCEMLuti17l3AGTjbfVk1ssUBQSCe92h6sucrpsdTgEPRnYURQyIEFUlkM39xlnGOHXC6
	 cUHcxb/lDD9ZVRCnHDbSyFuvXC14cEO7uFq078ezhk/JeB+b9+yQzT3Uvq+85VdaB2rXQ
	 Eo2YzS06NPGpfDgN2GPJ2Ozg2fq98u/lFZ/cUM7TKeLLTaOgrB8B4vul9CnHFgDQpMjZs
	 NGKj6NWd5y7LMcGLKvx5kS1Eimp1jFcWFODYoeLDahCyfKpHavR9pFpGraXAKU0T4KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i7mcrqf7XWOgEb4YXjGMz5tqNzLFKqEiO04XvkJXxpY=;
	b=FOMvbHAfjVc05tJ8XSzADB0oq8xVWBtmBvgjwXPObcxLCpDRemq06RvKS0eEyc/pCtPW
	 qKnIPM/Gb9bHaXvdyU9F4PGL7D/Wwt/GZsy+NiRRupL4cwXdrXnEaIccLEjrNvDKjFq2q
	 xo/sEuNYxT+KBWi2tUlB5s1liHiKadFSbtIsrN1rL3RoshzZGYxvtUfiLoQHtpjUG/xde
	 VmH+5l4xvBPvZonUw/H22zbgvv/2MBvR9qjugZzDtzN9Rn9YvDYrw3mdqPgyGKffP3xH5
	 OerNAPWLmGccMFkHbIhmJGw4S27Egakd6CgwZFwsrNl5LXopERiu+JJmnvkTB+poYCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSfFbW6V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15405606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15405606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSfFbW6V
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5232046a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411995; cv=none;
        d=google.com; s=arc-20260327;
        b=dAVPEaNNvdc2qzRx9RVhUwQ5w1cOH3mIQQEkb1mK3diouAR2vbMojeog3aH1/KVvJ7
         XhPB/Q4whf9EPq9Oknt1WQET0os9ShmJht4U5kQv7WZnIO6V0cyQyOJ0iRx2YifHUGeh
         PfPynSiLaFD71chCOzPP3GpEQEQKFFnvcfOn72bR2XoDldtz14urtZ9Vy794W56a6WDe
         I5r7wgWa7hIAZC/UML2dd+PDjk3JvTEueZzdfHTOuUfnJRHmagLevhGDb5XAbf3bHQHV
         X0hhelj4TxyAWIP1qDiY7xkOip+EwGyGr7JzVfrMRU0a0tMvlcFVee7BEo6jBKMuB/49
         BBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7mcrqf7XWOgEb4YXjGMz5tqNzLFKqEiO04XvkJXxpY=;
        fh=ErIDn0LOLjRRDqTM06LFaR56MvzjHCr6NG2UdUEWZhs=;
        b=ZObkvjDyl+MG8h34Wxyuzk8EA+73S/tY7kMPrJacv56UET4xUIYdUtBow2cjV/HRAW
         ewH9ERJdxuBpYV47Msx/4S4Eh1U51JslRPfLz6vNoZBxoxFEejBweyuSPJd35adXbxUz
         lRXySicixdLvcae8Hm8PwwfKN+RQMv3AMLIVXcK3iyBJazBqcOq+YJPd8kSIQ9iXziqu
         2zABZYsYX+Np9740/kyKM3RaNbkNHaiF6kQRqRsC9TiQc7o1d4JOlDnBclBh416Ebv8N
         QhMIJOnM0M16br8fUTXo0tadp2lx/JjE0JonF7NkDlNR5l4LyIYbDcVMGXinJfaXzzsd
         rlhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411995; x=1795016795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i7mcrqf7XWOgEb4YXjGMz5tqNzLFKqEiO04XvkJXxpY=;
        b=jSfFbW6VC67CVNhVajgcU8srNdDouOy29cnmzd3h4TFxMNAiC2lZ+RaoMVTQXtT72C
         MGGPtxMFw8gm1SHJXzM61XHun4iSDqiut6z5LEMDWu1hsAjG7n20ymhFMcOJAuh4oVrE
         xSHkuJJ4SSBFWafIAp5osZrvnwYL81VnfoCVjZRU8mvvfhBClNHvj4/JBbNI7en7aLIU
         IY6nlwhcqaKmBlFygbGumBiV/HVYp2zHhFhVXucqSNW2Kp5KTd9B+479kapbJs0P/Yhj
         cbOvG1Jy/eIjQ/fvAGrtWVsexYeIgN7Q5nWz2dpkwat/zeJLjAo3arrK/iFNzimCV7Yl
         40GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411995; x=1795016795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7mcrqf7XWOgEb4YXjGMz5tqNzLFKqEiO04XvkJXxpY=;
        b=tFFTd9+qFFf04QHReAKWN4e0njamSsmZzRusp3pGqo+9uOQ4Rk1UZlD4dnE+H2XZeM
         sI+/711qjsJ3Sy/BUpvkedkL4aC6OFjZTNnfPuX7X9MUkwlx91qwIxZxVGAXpWvAJK92
         n4gMCYGpzC5MtDpA0FxOWGzeEy5utwGe9O7+R8Y7Nbm3aFKsJJczoj0SdXKGw7PEX/d4
         xObnneBQE4PxcmrKQnlHYR3MiP8ZrR/V408X14xQqE8T7lqOdRXWdTm2ZY1ajGiJct82
         MntZrXrJW3gOMgrSzYrTUudSjlHreiur0aqw+n1uAxP58IoXIzxri6RyxFQGwOys7Kz0
         TdXQ==
X-Forwarded-Encrypted: i=1; AL+hErEiIALtuiUS/sED6h79ZyyrSw+CpGnF+S0gJjEEq5VobUfhdNberhI13CMQhhcfJYQXNPOdyGMsmSptm7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xumGvHJwwUO9UqPmVmdaWPpraZh1cMCGXbTDizv2g4DtwaqHJ
	ue7qPY4Qk/vbgJlEeViCfKqcFGyeE3Vgt3eLeCTQkgm+n3qR9XO7f92Bvq9/QxFPF8J82H7vNn6
	jCfzvsX3vP8bSuO26++fgT+//DLsds7U=
X-Gm-Gg: AYBFou1+hauppykj3Hdk2tvDMULszZmkVj/fCCSRLH9Br/++n/zbQCo3ICLgP/qVDit
	qOcooaXpQ4Xcc7rtwonFi8G9l3jD6rZr6eK5Mlm5HBeGeG80x2GNF8FbtlLeaGt9laRxBPE5qtv
	f0tRKA7LbfQ8mmoaZLbHMKfyH3ad8lh6N2puh345PxBJt86REyyCN6de16S8GbU3i2bmVdSGRfe
	nwKRqb6jLImYl/C/o94qei0F7OJRkgoEJMZKGMJGedUPRCVV11RO93aqUjY+NBI9lTB2EvxApaK
	mB/2dPoHZtoB0nt0TU5drl4oOm5zeFKGMmU4tzx00cen6rBUwaZadXaeSUTyr6yel5J6Q5wwTaC
	YDSqOl8olI0Wq0yy9N5C1f4bjcbMmgqvSudPCXYgxLuaw8r+63TXFsMs6taCIIm2yF7snfg==
X-Received: by 2002:a05:6402:1f49:b0:6b5:9714:dea8 with SMTP id
 4fb4d7f45d1cf-6b77782dfaamr2361925a12.45.1794411995161; Wed, 11 Nov 2026
 07:46:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109021611.22247-1-hui.zhu@linux.dev>
In-Reply-To: <20261109021611.22247-1-hui.zhu@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 11 Nov 2026 23:45:58 +0800
X-Gm-Features: AclHuK8H6vMQ9aNXuQur-lybZMeytisFbQmvaLjndZEn1wQmQOwgFWQhFSvLZ9c
Message-ID: <CAMgjq7BwQg8b+v18c7efqspDRFFEnuF7K=eVdi1r+MWjG2pkWA@mail.gmail.com>
Subject: Re: [PATCH v3] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Yu Zhao <yuzhao@google.com>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:16=E2=80=AFAM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
> lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen()
> returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check without
> clearing the refs or PG_workingset.
>
> A MADV_FREE folio therefore keeps the state it had before madvise(2),
> even though madvise_free_pte_range() has already cleared the accessed and
> dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
> younger, and PG_workingset puts it in the last tier, so sort_folio()
> promotes and protects it instead of evicting it and charges it to
> lrugen->protected[], which read_ctrl_pos() uses to balance anon against
> file reclaim.  __folio_inc_gen() clears the refs but not PG_workingset,
> so this repeats every time the folio reaches the oldest generation.  If
> the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
> lru_gen_eviction() packs the stale state into the shadow entry, so a
> later refault is promoted to the youngest generation.
>
> Call lru_gen_clear_refs() while the folio is still on the generation
> list, as deactivate_file_folio() and folio_deactivate() already do.  Its
> return value only says whether the folio is in the oldest generation,
> which lru_lazyfree() does not need because it re-adds the folio below.
> Keep folio_clear_referenced() unconditional: the classic LRU needs it,
> and it also covers the folios that lru_gen_clear_refs() skips.
>
> Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> Cc: stable@vger.kernel.org
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
> Changelog:
> v3:
> Add Cc: stable@vger.kernel.org and pick up Barry's Reviewed-by.
> No code change compared to v2.
> Per the thread discussion, the __lru_gen_clear_refs() refactor will be
> sent as a separate cleanup after this fix lands.
> v2:
> Call lru_gen_clear_refs() before lruvec_del_folio() instead of
> open-coding the flag clears; drop the lru_gen_enabled() branch and
> the comment (Barry Song).
>
>  mm/folio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/mm/folio.c b/mm/folio.c
> index 35e242b48870b..ea3adb6a89d75 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, str=
uct folio *folio)
>             folio_test_swapcache(folio) || folio_test_unevictable(folio))
>                 return;
>
> +       lru_gen_clear_refs(folio);
>         lruvec_del_folio(lruvec, folio);
>         folio_clear_active(folio);
> -       if (lru_gen_enabled())
> -               lru_gen_clear_refs(folio);
> -       else
> -               folio_clear_referenced(folio);
> +       folio_clear_referenced(folio);
>         /*
>          * Lazyfree folios are clean anonymous folios.  They have
>          * the swapbacked flag cleared, to distinguish them from normal
> --
> 2.43.0

Reviewed-by: Kairui Song <kasong@tencent.com>
