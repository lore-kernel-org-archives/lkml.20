Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794211731;
	b=q0BevwlsTayANWNzZjYs57IhuiTTL0hHoKQh1awGW6g8tDp+QIt7DPyzWDTx6Xivai9h
	 VjwAJXpWFhfIuTEdyJx5nTJ3qFXj0wO3s8q34IetGtNwjACpHyf4JqGfl6Qu/bASzW4pP
	 HK6SCtN/Jx0DZjlU3A/CF/onSuHesEytB2OyntO0D6SK94kPcoqM7/7oreGNF8QviNLk5
	 s0mYBkXJHPZzOpmNyWKdiehwfesV+qQJz58ex0+Y4BiV1OjW+WQaIrr34uQCWKIoz2L6u
	 0lx4h9J5QwQ0PxsjroGNW8O8FQfcCXR/2bdODD/2WTe3duuYObhQEUZmDaMw5OMNWYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LiMJF1XvwF+Qc5jdWubo4n2qJDpryfHhpNFCa3GO55Y=;
	b=RsHixcQwmZWPLqEu0TsIGzgCEI2NTdo36SXqhNqBCBl9kzcqZ787ptBx/poz1f8+eeXR
	 KjWZN3Cs/08Vzj6WGIwZ8D6LgJ98Wqfxt7+CoJPHpYDtj/6h6GLu26uAivCQFhoQQTnan
	 kCtseNTbWVID7tmL1ghZM9zIUJGwjuoHt6DIjPEWp9+9+1Ecpgm9JPek8VcZRm0DV7SJ7
	 cTl2ucND0i9oSUZV0sUXWqQs638h8XdjWTZ3RpbLZj598Z9bvCfyBifO5Z1EsBW2XXpqD
	 f4gK+CZP9VzC24qFXrblLabtJTmCdx7dB8YILZ7JD90c/+B7dCADx37drvAMRvKqUWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPLD8fxg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35472606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35472606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPLD8fxg
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so83024866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794211729; cv=none;
        d=google.com; s=arc-20260327;
        b=BEDI0sruba/bNdUA6PxIX45Hr9WhC5rgs0fWhUPcZg2joOrgrhK83tkOfWTO2LQCPH
         pOS4wLLdI29X872sR4fYcyp3EgV/CvmQMAAPKzYD3E4Qn2bLwIWD0jz0IL+fjkPrJU8Q
         qPMDwXatR0CuI3/ySaR6sem4FkFROjLDhdc3AaDaYpyNhREvj1zgFKl3TAvih8euFsd6
         gRc2TeOrqo6rBlO1RMzKCmhpzViGt9zS0tmlIzNtO+emBtJGBCeDsEl7FwFKX61xhyDe
         2HttwxHJTArrf4stZyJ3+SwawPs479zb0NLIa7RannB77+agOnC6teu6DtTRpJY5mwe5
         R9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LiMJF1XvwF+Qc5jdWubo4n2qJDpryfHhpNFCa3GO55Y=;
        fh=XEU036g7y6lxkPG0yrEniVDpGro1KuP8F2Nz5jEUNWE=;
        b=T3IQuD/mfvWwvjYl5JUoxzUtHRQy+FHTL86FVlS9+oam2Ag0/+pFOCof8vL7zNlmpy
         z0MJ8UMpmXny3lCfIaVP3I8cZ8P93SBrgk3EKNh1Q5UF6n1hgV45iz5C3CfHdViJ6gOZ
         zqSDiz6p98LujEsPWcp28zbfhHmpbbDalHoNV/+5A4sm8yDdkxikFLVLeQqbIWW4DEYz
         TQDcisSgP9dpXXROLYEhj4EIkiliLyJ4eIXRuT58k3s1XE6QnAsPudlAkeMCpLxvJkXX
         J4u8ahBkF1MVglKdjXIs2d6UZli256nxoRTsrWSHqjeNbGoH1ax8btvXbQVlBPVkW7Ml
         eevQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211729; x=1794816529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LiMJF1XvwF+Qc5jdWubo4n2qJDpryfHhpNFCa3GO55Y=;
        b=cPLD8fxguKoynFlGz2OK6UmitpF7qDa34GHBjjK5CPLpCbqNyVHoPCCjxY4SX/Fu2i
         LY7icyhd+dhM035lPEX+xThVpk2/9s3VyfEkV4SvaCjy8Ro13ykNoRwFcQGz3rjmmHgT
         jt2NOS38q9UxK2Ag/afOaCNM61f9lgHh4DfuDXn5bB48CrR/mN4iNsEBV+0SN2lRriyo
         n6/A95FIil1AIcAc8WfZIv7WWXCd7WTwtJmoaI4mknRPHaDnT+GOTgsH1/nC/fXBiQ9B
         qGoCBii5YE+SCEIonRxTaL0oW8EQ1TsG0zF/DqzdLYN0c1iR6CZgiato2MxRAkN2bvp6
         6GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211729; x=1794816529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiMJF1XvwF+Qc5jdWubo4n2qJDpryfHhpNFCa3GO55Y=;
        b=SmR8BX/RCE/DpYZeRzHPSor+Hmhu7UGte/uBfwUEgxSQTl46XPyIEUqcXLsgWDlaSD
         Ptx6Gth7kRFnGtI0LeRaX9Qf+M1NCDYE6Xp2M5Xj3RoHAYdZcKXkU6OQYCEBSER3ldCf
         g0DydnNUp0IDyHXW/KJl6vFtImxM7pVcv2VQyEm0OvbdJn+CJDQRQHcQFety5eiehc1P
         LEe9m08S9ugyTPCK7IsZPSrvNf316wOUmKW4fSckFr6BFjGIAEVDJcPns9ByD4fOLmvO
         1/7gsRtfmI8hbbrvXJqK3oW9bwiG2ntgp6MDsRbH9btfPs8xb8pg3V3X7nSJd4TriRuG
         /ybQ==
X-Forwarded-Encrypted: i=1; AL+hErENIRbY/UqJ1CnIM5J7Cr+AoRb9WiVdZbKisZNY0hc9FelTZRd0r9TDWMq/+Qn14TrJYPKP+G7VTW2X8ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fdg54D2vmTaDkYTES8IJAenUZZSlN+MfVogrWWmE/gnc3T/Z0
	A6Cw/OkoRwfk/obCTgZ/N8qfDqsqk8YpIrG+8Pgp/eP+s8+9apeBEmlGUtLDvONYmZ+qZEUue9k
	lhHQvjddIGFFqoeUC9CBEkxZ9sULCDZE=
X-Gm-Gg: AYBFou2HdlS8ugI47PqMhCj5F0QQetEU7hK8U15eMqEjO6OW1Lmn4H2Fzedu6tr+wbN
	14UqK5kHSvpUwIKaEvMBRZh4d9xrWjmSB5KgfH7xP1+ndSx9GJ/p+9rO6hKkKiZbgFUg4uSqf4G
	Z6hZME13DUt3RSKY64HH2Z0KPV6AuOwz7CehpGAi+xCktmto2w1aO1Egb7PKAuf0qEvZAdo6tU/
	6DbSo8FV/saY8ZFWYQaS/QKJh6Ac4/BGLOTJgHMzaU3Hb951cpWNTQCmcntfu9C2GxuRovDoMkm
	PJcD02XScRsoJJlYtv5E5qn/Xpxyer/XzcVMwCcNvn0KPa0nufD4KV67tUdNGczpwpy38FjV7nc
	uPx6NkTTd0CzkUXiZi/z2QPq3yAdRSm16QiwxBVOXDySlH1DJQKLI8HAn2WKlPO/Ajzni
X-Received: by 2002:a17:906:d54d:b0:c42:4750:8d33 with SMTP id
 a640c23a62f3a-c4d6d79c9e9mr220208366b.28.1794211729178; Mon, 09 Nov 2026
 00:08:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-mglru-fg-v4-0-2106750c0bfa@tencent.com>
 <20261016-mglru-fg-v4-15-2106750c0bfa@tencent.com> <CAGsJ_4wTFHJxzuiRDBcuevdULMcD+se6SuPbzWKA8wsUAG80_w@mail.gmail.com>
In-Reply-To: <CAGsJ_4wTFHJxzuiRDBcuevdULMcD+se6SuPbzWKA8wsUAG80_w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Nov 2026 16:08:12 +0800
X-Gm-Features: AclHuK-rg_Epjx8c_oIR5RKRDfprNqzR2T_gknTk1R87bd-Y63IPVOAg_lUq4r0
Message-ID: <CAMgjq7Atry0zRc_-xbrL_VubxTBQOT8R2_aumghXQaO9uTANHg@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] mm/mglru: make folio_inc_lru_refs lruvec lockless
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:48=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
>
> On Fri, Oct 16, 2026 at 2:16=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > The lruvec spinlock in folio_inc_lru_refs was only taken to keep
> > concurrent aging from corrupting the size counters.  This is no
> > longer needed: the per-generation counters are atomic, and the
> > active/inactive ABI counters are updated per folio and linearized by
> > the CAS on the folio flags, so concurrent aging can no longer corrupt
> > them.  The same argument already allowed folio_reset_lru_refs() to
> > drop the lock.
> >
> > Use folio_lruvec_live_get()/folio_lruvec_live_put() to hold the RCU
> > read lock around the lruvec lookup, and drop the spinlock entirely.
> >
>
> Yes, this is cool. We have two paths calling
> folio_inc_lru_refs() or folio_inc_lru_refs_walk().
>
> 1. folio_mark_accessed() from syscall access
> 2. walk_update_folio() from page table walker or look_around
>
> For the latter, we can't actually cross multiple
> lruvecs/memcgs, because of get_pfn_folio() as shown
> below:
>
> static struct folio *get_pfn_folio(unsigned long pfn, struct mem_cgroup *=
memcg,
>                                    struct pglist_data *pgdat)
> {
>         ...
>         rcu_read_lock();
>         if (folio_memcg(folio) !=3D memcg)
>                 folio =3D NULL;
>         rcu_read_unlock();
>         ...
> }
>
> Consider a common library file used by 100 memcgs, with
> its folio residing in the root memcg.
>
> When walking the 99 non-root memcgs, even if the folio
> has been accessed, we won't get a chance to call
> folio_inc_lru_refs_walk() for it. As a result, this folio
> may eventually reach the eviction rmap path. With a high
> mapcount, folio_referenced() could become quite
> expensive.
>
> That's what I was trying to point out here as well:
>
> https://lore.kernel.org/linux-mm/20261102213915.57805-1-baohua@kernel.org=
/#t

Hi Barry,

Thanks for the review, I saw that too, very interesting approach! And
I believe it will helpful.

> For the former, you can get the lruvec with:
>
> lruvec =3D lruvec_live_lock_irq(folio_lruvec(folio));
>
> I'm wondering whether we could eventually unify them
> so that both support cross-memcg inc_refs.

Definately, actually for that link you posted, combined with the code
snip above, after FG, I think we can further simplify that, no need to
check mem_cgroup_is_descendant, we just do:

- folio_inc_lru_refs_walk: if the folio belongs to the lruvec being
walked, the batch stays in walk->lruvec
- folio_inc_lru_refs: if the folio is a remote one, per-folio, no batch

non-descendant folio sharing across memcg are actually quite common
e.g., libc and shared mapped memory, this could be more helpful? And
it seems fast for the walker.

folio_inc_lru_refs_walk follow the same rule as folio_inc_lru_refs
(with MAPPED flag), just faster, skipping RCU and the speculative
check afterwards as the walker owns the seq it is advancing, and
caller handles the batch update of counter. While folio_inc_lru_refs
only requires the caller to hold an reference to the folio it heavily
relies on RCU / CAS conventions, not easy to batch things there, but
it's still accetablily fast already (e.g. the fio read test showed
almost no performance penalty).

And I think the main reason MGLRU can't operate cross memcg was, lack
of a protocol to stablilze the memcg's gen and holding a lock is too
costly, now folio_inc_lru_refs handles that, and FG
 lives on top of that. So we can try that out right after the FG series.
