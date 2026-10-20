Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484443;
	b=mng0SF2M6h18IRnVzOsZGi7bWP5C6klOL9cgMCe4OuT2t3kdjyxTHzWUI2kZUF9MRAw4
	 gt8tOaRd10c/geQVsFp9SMimSXWbTW8dLd2QYa+dfRvekZHJpJrDkb1VzSLCydBMy2YPH
	 aymJLSgqh3xNlQghTOU65k+LK7ndZUwGVv26pG2g6sr+1J4j/C5cKkjIQ+GMCzHa/loRY
	 Fu6M1jhxcQWAr64TkGoeo0vjtUl9F+kMqkHCneiGQnEs308HhaQefOuWsx5h/1cnfzBZC
	 5c2kpIXVR3tIGY+TfUd+lV2fdNLa1EQOD2iqXQXmCjj7KHuSVz/WTzS1KTKMxkaR5/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xmkrrXg640IUqEvaS+iihJLIom5PHogRAE1OJcCwHUg=;
	b=LWCSXoPpECR1bRW/YLTU3L4l9Pk4N1Sv4uBgcJv5eWOmsXqvoens20G73HDc5p2xW00u
	 4+SRMJ/525Ljni99l7iMX3WRG/gUP0g1A6fHeYTKAHo7zSnfF81eqrjiPapv+VlIu9h7A
	 Grvlqz2LSPuUP1Onz69Uy/HTaMcJNpBaazFVjJywRzw8nI66RftV1pxZccLAAJ311rGbg
	 y9xwmvIOmaf7+9w/P/izhiMeXd4GMlNiZtIs/2fzxBKUzY6hrU2z9sc3J0q3EfXR/+ek7
	 Nh/AvuGNNTnJIGCSKrtqcYIrcgJIj6lfakJD/U8nXWrFaneyVS2A0r+lRyinxwlOpag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GeN0Ox0m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CA4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GeN0Ox0m
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c45551fa84eso179736666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792484441; cv=none;
        d=google.com; s=arc-20260327;
        b=MI9AYfLM2hdOcexofXhFatGXwaTyJkXfA3gtHXLr//ky/cQ2ghf0vmAaGjn79yNIm4
         5NaxVS4V8LaErct0wbbulwJA/cRra36FozlcdZRyXPhsYu/hlSG0oF0MC3CdKKu3bvyO
         ggO0pDtXEXQ4MtC0Of56MKF274B90dl7zwUG069JM4FhS6ad4pPBCU6H9FWQTZB8hxId
         vih0mQSrjRtt6XgAt1w+dvk0XGCeUwdUaL5ZjlyXdh587jT7Yroysnq4ZdycfsH9sWAD
         9BncJ7FQOgpLHloOaKwWFzkqY8rN2yuOrEkjHocVMIzyAO5j/HLGUvT74CX+sWBxgxVY
         360w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xmkrrXg640IUqEvaS+iihJLIom5PHogRAE1OJcCwHUg=;
        fh=vFmOHqYDAVTivViknNmycQShZMLUV7dbFJk0DCVMAOE=;
        b=JuhvYw0GD4PT3/PVMSCYi04hNV1m3SuPB29otlpapqX4/Pz3ftkp/DtbTKT2l3sLnt
         aDocu98Izo2Mwn/RqD7XKsnlJwX/GQTvCh97/V3h5ur3JvoqHpZvDGUR76RtjRRnVPTP
         H5G2MWEWzIptAgeVKr5tyAdSwjVlzT3vh/9P/AsfzYpMddNpFtJo6JM9STxIbT7HbpcE
         Z8Tb9A67hoQfPHj2twc5XhiAYoTpj9atgizl0KLyUIax6QLfSIsohcwuGmnAj71g0Ttb
         MsxS9I6oU8L0XvnhsJNxO5acBQliiCciBxRV1fQ9ciNIQVzQTamZqr3yTb8V4T3g5MG8
         EMYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792484441; x=1793089241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xmkrrXg640IUqEvaS+iihJLIom5PHogRAE1OJcCwHUg=;
        b=GeN0Ox0mqQ1e3zYP5UExhThy3mtc/MSkQeKwNY+P4D+Q93+tm/AvwXXB0DZdUJSOQ0
         6TkYruQD3kcLpTTR6v985nXkxcsYah2eht5HqYWd+1fJ2dY3bDM+dGFPAF7bQdANCw9+
         kQCxoEr0fZU1aGZKJKe7S7y2PJxIKSUsJGXqTP4ghH4VfiI5A+Ot6bXsgFNVf/lmbNTu
         SUZZpHF75Kh6j5i146By4E2vDuvszc66FMypW6w+sZvThkrTM5v2IlTsQZX9DZvEJZE2
         +py80OKLPpDOWGTd2WRpsO/2EMWkozEh7k1Xbew3gJnaD7YYPGQMUm+9vaO6P2ralVJZ
         O7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484441; x=1793089241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmkrrXg640IUqEvaS+iihJLIom5PHogRAE1OJcCwHUg=;
        b=dXpfa7TCKj8/6gqY0FBIqtPKBH7d1YkVeMzSZt+3p6q678zsSjUYNkiK9Qpf+BHP7/
         ZdTEu+4Kgzl+hrIm3n3vVjflKBRD9JNtRv1k7IntcJRxd/2L+1XbPbfLAnGzyy80XVBC
         WE5vkho+WMniBhUXQcObgcY0vlYOBemDsR8mxDtn7MJLOsDU9vqCfRGrWzgZGmnmXDsE
         lIznGEQo02wBwESEXN0Xy0JT0ckUjtijjn7l/RzcLC4tD7vFkL8JIdlbpZ7Km1wqAvmv
         gamLHzETXgy4MgsOdPIqpwTePMp3jwbLTfCup1ujRh0hWc/qsh0DfwXF31m+S+7i/gNe
         ybWA==
X-Forwarded-Encrypted: i=1; AKwUvBy1MB9hY2KARnxtxLAqTfJWkm6JKqGZGcs9J6a+wTYrxOnfSkLRwQFj90VzDd7gWL95xfG5/EYJV0VbZ3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCBiJw6Ai3gZ4/mc6QXSEZ71N32B+HUYRc9KAWlyCPsBg06CCV
	fHsr3MicmIOPX7asrc8SBHt7LgwNJhqLceMsmrpMtqB9IGf3azTS8Zk07MoUxOnS0c72TIGva9n
	FUU6LBV5SNAHtkeXx1vhxzg+IFBRunA0=
X-Gm-Gg: AYBFou0pMWkXsW4F/et+DaEPWMzxBuLJ8N3AHP8s5zGJ84bFGURk9dPE4OCBmC+vCP+
	mYG7ZEbzztmpHpc9f1ijs6KGxKMKoeYQ1sHj+dWzsu+CZfRrOAM3cGykxb96c/s+EzxKd/Stg9w
	81bmvFr4iLGAQCBnjz5kaQ7NKYhwy3qhZ9f7gusY5qPo1kHMztokxBvz1wIHsZdlCFCZNDdpDO6
	ORkE9IObsIksD3xxbRsJpMKzjMK0C5/der9As5CLrtEB+opeNHpebIxZZzPXVeh8OCistaKtm7y
	eyRGyuJxPYEQi415zs4axTp35fCXcYNvc+vA6OKwrd9xRNhiDY8SGIMRC3oK+ukRHAdZKz6HfkF
	F8tOM2L+s2b0V
X-Received: by 2002:a17:907:7213:b0:c40:6ed9:b962 with SMTP id
 a640c23a62f3a-c419ea3724emr784325766b.26.1792484441183; Tue, 20 Oct 2026
 01:20:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
In-Reply-To: <20261020023548.3242028-1-ridong.chen@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 20 Oct 2026 16:20:03 +0800
X-Gm-Features: AclHuK8PF7KNm1MBRehQHfGN3GBPbDx2fvGiZQGSVnV_ixSDlPJ3ZihWfgbQfdY
Message-ID: <CAMgjq7BonFtsvHMRYXXToqWBHTzNa52EU9B4ZqD-k-DJ2inQDg@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:36=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev=
> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> lru_gen_folio_seq() computes how many generations below max_seq a
> folio should be added to, but stores it in a variable named "gen".
> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> seq % MAX_NR_GENS, so reusing the name for a relative offset is
> confusing.
>
> The comment table above the code also no longer matches it. It only
> covers the PG_active and the final branch, leaving out the reclaiming
> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> although lru_gen_folio_seq() never looks at it.
>
> Rename the local variable to "age", redraw the table so that each
> branch maps to the age and seq it produces, and note that the result
> is clamped to min_seq[type].
>
> No functional change.
>
> Assisted-by: LLM
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index ab69b9930893..a933d8c14558 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(const=
 struct lruvec *lruvec,
>                                               const struct folio *folio,
>                                               bool reclaiming)
>  {
> -       int gen;
> +       int age;
>         int type =3D folio_is_file_lru(folio);
>         const struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
>         /*
> -        * +-----------------------------------+-------------------------=
----------+
> -        * | Accessed through page tables and  | Accessed through file de=
scriptors |
> -        * | promoted by folio_update_gen()    | and protected by folio_i=
nc_gen()  |
> -        * +-----------------------------------+-------------------------=
----------+
> -        * | PG_active (set while isolated)    |                         =
          |
> -        * +-----------------+-----------------+-----------------+-------=
----------+
> -        * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU_R=
EFS_FLAGS |
> -        * +-----------------------------------+-------------------------=
----------+
> -        * |<---------- MIN_NR_GENS ---------->|                         =
          |
> -        * |<---------------------------- MAX_NR_GENS -------------------=
--------->|
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * age        |        1        |        2        |        3     =
   |        4        |
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * seq        |     max_seq     |    max_seq-1    |    max_seq-2 =
   |    max_seq-3    |

I think this comment update is not beneficial, we might have more than
4 gens in the furture, so hardcoding a number is not a good idea.

> +        *            +-----------------------------------+--------------=
---------------------+
> +        *            |<---------- MIN_NR_GENS ---------->|              =
                     |
> +        *            |<---------------------------- MAX_NR_GENS --------=
-------------------->|
> +        *            +-----------------------------------+--------------=
---------------------+
> +        *            | Accessed through page tables and  | Accessed thro=
ugh file descriptors |
> +        *            | promoted by folio_update_gen()    | and protected=
 by folio_inc_gen()  |
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * PG_active  |  PG_workingset  | !PG_workingset  |              =
   |                 |
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * reclaiming |                 |                 |              =
   |     always      |
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * can't      |                 |  anon && not in |              =
   |                 |
> +        * evict yet  |                 |  swapcache, or  |              =
   |                 |
> +        *            |                 |  PG_reclaim &&  |              =
   |                 |
> +        *            |                 | dirty/writeback |              =
   |                 |

I think it's better not to describe too many details in the comment as
it actually easier to just look at the code.

> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        * else       |                 |                 |  PG_workingse=
t  | !PG_workingset  |
> +        *            |                 |                 |       or     =
   |       &&        |
> +        *            |                 |                 |  PG_reference=
d  | !PG_referenced  |
> +        *            +-----------------+-----------------+--------------=
---+-----------------+
> +        *
> +        * The resulting seq is clamped to min_seq[type].
>          */
>         if (folio_test_active(folio))
> -               gen =3D MIN_NR_GENS - folio_test_workingset(folio);
> +               age =3D MIN_NR_GENS - folio_test_workingset(folio);

That's a very nice rename, the `gen` variable is so confusing to me
for a long time, I thought about renaming it to `gap`, `age` looks
much better. Thanks!
