Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793895705;
	b=12cVI/9BRjL6euI9SFY6SesOUPElaY8zmg05kAhjWeRxwfFpgzXFiOXXvliARWijFNZD
	 Dfw6QhMuZyL3LKzPERQU2yJoKNpKNMu25d7gm2eMXbedzaQ8vK43efGxUobAKA0mAHkm7
	 4jH5hysdwkEXG99aOJwnPaBmavan+v9yJ9NaEyRJAgulVOicFqMh8Dqm3G6Dp+siqtFIV
	 +x419SiYQF3/1EWJwTCDdb5tiFHlELAQUt91pP/eN6JF7ze+/oKrc8RSTEHDBgDQb4CZ/
	 u0uQQP23kAnMDmoqd/Uf3a3cXRmJn/mruJ1H+lMjQMz0NTDw5mZ2kIODgogzJoYyyWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+l2yB5DkbsS7QVhiiB3+7ozIRrqflYetK+MStZ3pTPc=;
	b=qdx1oe6gc1mtTh1blyD4jR5U/q1A29ghtOqbXPdv8KiVGhQ5U+8UY8hz6pk3WMyEmTrj
	 hA5TSevtDn+4vV1SaahHZSBsr6QbpOZ/UvnlbITg0GSXbtc1oE+KqZT3kyX2zZ7OhAzUe
	 Geu5UCcKqZZea64qUWUB92aMyCB80NV4k8XwObIi/i0x9SY43fw7HFV1jSDyzblGna6/3
	 y6LhBGfN1zgoD4NIhoIGLvuXxg4HEcSM70CFbHwZV1zuP9ZoH9u6it4YXFe46j+tm9eqP
	 Gj1v3KZ0SDVSxtQUd4SzlzKiFVyA5642/3cYlxbdNnChI5UubEzI7CO7Um8wwFyu7GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="royoG/Xt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15498606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15498606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=royoG/Xt
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1372743b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793895704; cv=none;
        d=google.com; s=arc-20260327;
        b=sCZ4Pr9v5mS+Gab9ZfbEW7p3Ar6rF7CqiYTR/DNuyNpzz8JWw4zmFmF+rfNfhNteLh
         3wTTevlDTebgy6M2+0ZmtFJlDamLCePTd7pYU8YO8wwEN/7WB2tWKKICPo/g5RCT05zm
         W/KzMAryqj3M6zn7N9YW2Hydkkmj42Dmz+tDUHjRc1J5ZlgJ86byFbIoZF6z8GEOpfi/
         rhsb5nlrzICmttvox64g5ISqn8w+5j9SrG7UgngfqUEPVMvIvGJLeBmyJx80W+AEqyCK
         BCjMHE+SghymOcyM2ZN0RfMWrqMPeQJp2qnGRJ4VhR1gDeRenFbVuMV7REKgcUvRdYgn
         RlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+l2yB5DkbsS7QVhiiB3+7ozIRrqflYetK+MStZ3pTPc=;
        fh=VlpHdqNdO3o+sloQHBLWooH5KRD9jpwqc657vnP0e1E=;
        b=C6v0djet3NXUqr/dpsYxCrs6lSb6NWZmumWIcS9Lvr88D7fCuq4lBjTTmsvFR7E+FT
         rkbSe7fL1RMZGKmE5tao7zxUX8ECLTvt7uLqeHvsotUAx6tHJR5MtsDwKkMMaJTgpZzi
         GiDz0yU6m7EvEo5pIIBhgaVRe0Uw4orRbT0PEwWnrWj+Vf0fE8XqAjAdX8+018/ECcz0
         MhENMzbRb6Po0eAHkDgqKLchZ2KdRBlsEKl/4isIKZeQfRNpUZ4QEEvjvbRz0OkCyabD
         dJva1iNggz/fLDjsvxpwXlphZs5cznbbWflxHs/iAWe+VjYOn+/yE4QzEF3NPTw6+wrT
         NuRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895704; x=1794500504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+l2yB5DkbsS7QVhiiB3+7ozIRrqflYetK+MStZ3pTPc=;
        b=royoG/XtoA2Q+uOiAiPO6Ti8WErDzjLNVvE0Eb8CKLe2XTdv6vLxehZGUaNcjugxFk
         2qpM2YJNkUC3/8R3xu1+5z9p1GNLQ9art+qrQYtRQvJuPGvavzbt+LhQk/J2htTtW0Sc
         i1AvWZK1m8WzFPG2Y0kcGVcDX/h/jVd22KIYBNY/Yu+3In/otpNq1orpB3a5dl52ZR2h
         0Aq1tAQX7huyTiaP2aMqyOoe7f1YwguckGjNA20au44NaUzq+qzJLjXnnot26Doh1Eti
         kubHwV4KD5y2sWoOn15x4xt1hO0y0+92Oi3RD3+Ew6Kajko9f4ffPXOsNrmXiPCY6IqD
         K/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895704; x=1794500504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+l2yB5DkbsS7QVhiiB3+7ozIRrqflYetK+MStZ3pTPc=;
        b=nu0wHCxmz74fQJveeLBz/FmB8WYueNzmQsXHxsDMtD4iAzLrMjAWgB8UoC0EMG2Pzq
         +p0osArGA7mbnVrqkq6FrP+RrCmacEqJtRp0v9JG7TEcavX0OcgetGYX0p+qju+/vz7N
         P62n1f/5ffcU8wyMedeKjciCKs0t6Ec4XnsFxuEYuuZHvZ97x5aVEP3b/Od+WzOsWt8o
         3XWwyY27uTrXHDqJY4AF2SKbJySikREu+I5NpoAPKlxrSq9HMefbxInseBtu+7Iw9+nD
         QevXmQXn6R5vz1n7nSsSyWsIcW5Ais+nB7bUe5KgSb+xBRUSkzmvGkZiKugCnxZPEm1g
         xvLw==
X-Forwarded-Encrypted: i=1; AKwUvBzWbX9JnwKdWEDVU7V6E9DNLHugMp30bkyJ3YqYnAha6HIE4CZ1fwUkhepwq4H6Knt0Lj9IBNpxVc2Wpe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ukH4o+ybo3ZHIfXJC1rTBU1l/bIuZCyS6NUinQQMXXBmv8Fsk
	JqLHUQgkZCrO9NIgyygYiR5/UvoD65iJW3KgwhR3LUtOt+Pk+4cisQxld0qO8fO7SXnVjkpb3xx
	Dwzu1cDN7c8K4dATkQIpHmKkZQbheyoU=
X-Gm-Gg: AYBFou1ES4bvsj/Ek6FeGmWmVyy8l9FBzs0bQJ1XbRRxaHuVDyagnP292t7FMBpjdIv
	O+/ZFR2GiNE3RaV9gk15OeIBeoF4Ed55C7sCHLO7TH678dKeKtcttzGLCdNwXeiKa0MDc6qd8kO
	Fnh4zyy4vRTRgGa1nt+bB8ki6oK13e/tkh7iBo+4E+bX3KvkW/uYSN3ioxUnPpqqLowJdDmTRji
	40PYEeJmhphveeqg1rlCYyQF9QL17KpOJZLsSFwERdCExOMD53cfvlAC3FHpZBetU+qV+1ylpap
	eEZHOf35E7H21MsqeFsJ8IJgYmdw8Zb/ubzPPukexc2IJRJIX9zdi8r64uk+YYZEgPDHBSy81Dt
	OAiEfh1YW4tK2BDcGA4NblqDg5IMkPp3t2Rdl6pVpMBjBPctG14apVDrX8l018jNRn4ZIEsfmPr
	8B8ot+KtQz0LIRpA==
X-Received: by 2002:a05:6a00:3d54:b0:890:a777:1026 with SMTP id
 d2e1a72fcca58-8a9b7531333mr16900465b3a.0.1793895704307; Thu, 05 Nov 2026
 08:21:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105132220.2233677-1-ridong.chen@linux.dev> <20261105132220.2233677-3-ridong.chen@linux.dev>
In-Reply-To: <20261105132220.2233677-3-ridong.chen@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 6 Nov 2026 00:21:05 +0800
X-Gm-Features: AclHuK8-zrfIHeBiy8wtYRyJ57iwoiwUVM3nQia2xJy5VJ0CWDXaiLLQDvY0sQg
Message-ID: <CAMgjq7DtU+tSOgQWgTaV0obLwkkUwQqgvtTXjG2qf8L+iPXbiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] mm/mglru: skip the flags cmpxchg when nothing changes
To: Ridong Chen <ridong.chen@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:11=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> folio_update_gen() and folio_set_lru_refs() always end with a
> try_cmpxchg() on folio->flags, even when the new value equals the old
> one. The locked instruction still takes the struct page cacheline in
> exclusive state.
>
> That is common in practice: a folio mapped by many processes is visited
> once per mm during a page table walk, and after the first visit it is
> already in the youngest generation with refs cleared and PG_workingset
> set. isolate_folio() and the eviction paths also call
> folio_set_lru_refs(folio, 0) on folios whose refs are already zero.
>
> Break out of the loop when the flags would not change. The result is
> the same as a successful no-op cmpxchg. The only difference is that the
> full barrier implied by the locked instruction is gone on that path.
> No caller relies on it: the eviction and isolation callers run under
> the LRU lock, and the others (page table walks, folio_mark_accessed(),
> lru_gen_clear_refs()) only care about the resulting flags value, which
> is already in place. Note that lru_gen_inc_refs() already returns
> without any atomic when refs is at LRU_REFS_MAX and the folio is in
> the workingset.
>
> Tested on an i7-13700HX with turbo disabled and the performance
> governor. N processes map the same 2GiB tmpfs file (huge=3Dnever) and
> read every page, then one aging pass is triggered on their memcg
> through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
> Time per aging pass in ms, median of 5 runs of 10 passes each, averaged
> over 2 boots of each kernel:
>
>   processes    base   patched
>           1    32.9      31.7   -3.5%
>           8   195.1     160.2  -17.9%
>          32   755.8     592.2  -21.7%
>          64  1597.2    1260.6  -21.1%
>
> With one process, every visit changes the generation, so there is
> nothing to skip. Before the patch, perf annotate attributes 53-58% of
> the walk_update_folio() samples to the lock cmpxchg in the inlined
> folio_update_gen() in this test.
>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  include/linux/mm_inline.h | 2 ++
>  mm/vmscan.c               | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index b3d85fe91385..4ba9079f4dc8 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -244,6 +244,8 @@ static inline void folio_set_lru_refs(struct folio *f=
olio, unsigned int refs)
>         do {
>                 new_flags =3D old_flags;
>                 lru_set_refs_flags(&new_flags, refs);
> +               if (new_flags =3D=3D old_flags)
> +                       break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>  }
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 50c352e9ffef..3fa76715382d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3398,6 +3398,8 @@ static int folio_update_gen(struct folio *folio, in=
t new_gen, int *type,
>                 lru_set_gen_flags(&new_flags, new_gen);
>                 lru_set_refs_flags(&new_flags, 0);
>                 new_flags |=3D BIT(PG_workingset);
> +               if (new_flags =3D=3D old_flags)
> +                       break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));

Hi Ridong,

I had the same idea in V4 of MGLRU-FG which is posted a few weeks ago,
with the same code:
https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-4-2106750c0bfa@tencen=
t.com/

+ if (new_flags =3D=3D old_flags)
+ break;

I didn't have time to benchmark that one function but the e2e test
showed very trivial improvement, it's a good improvement though. Feel
free to add:

Reviewed-by: Kairui Song <kasong@tencent.com>

BTW there are a lot of concurrent activity is happening for MGLRU at
the moment so conflicts occur very frequently...
