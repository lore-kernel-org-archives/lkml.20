Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216810;
	b=vusRVfdWXA/XDfqkxQXBu8ySxS7JKsidX87hdzckg/ylgIcrwZ/Sx/X+e6kzgmG4c3/G
	 4PfPR1MJ2TJ9JBS3BBAwLhLpAzEvnyBGmnphbPi4zEoaSls7htIfxvma/aFar7FrE6i58
	 Ac3zc5W2QQ/pDYBVSAwjMxfHQtPUetTrnuJxVerCb0tEc9B3KYaSOJRbX0RYKAZVVntlW
	 FBwSyOdRklOQkpLvWMl88ZCZZieZyXfIv6XDFLdSvxE74BQxsYGzoppS1lQbBJonsyNRA
	 cZFeJkDMxkL5IkNEwigw09AhoWpv8ilDZH5HLz0t9VXl2IJ+ManKqRTm0zJwa2n6PTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HqOJkLXd0wmKotueuMhbylT2sufy9bI1CVmczzNeuOY=;
	b=223r1+vfsUw9/XRAkbKkCOJzqvfd9gyJR9Q3rEkPKIcv1zXm+y2U7tQ/Xp94wZKP26iL
	 SCd1t4E7sIXeIOxpVR0g9bhX2++2Nq7CuVu5hf2dONosNWmpA2nbBIGA+OktaekGRVm7d
	 yAnyJWBqw0fJ9CiIATHBdrh8+3S5Rn0R9RcFHRlO3XV+fgTqmhcmG52/0Sx1ibowKNZXF
	 bdxmHxMpmzShc7JIzysIU5VDPjMO1JHGIZGJk6tLaxKP7KJ+FKidPCCqk8lseE4dBxoGK
	 isMbKuMbRttrdoUtLY7w2Ygldty0qhxU8xVBHgbWioMPRnJnmg9zB4fGQ8WemmRLOGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8CKQD7A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77342606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77342606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8CKQD7A
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d21051042so91416166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:33:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216808; cv=none;
        d=google.com; s=arc-20260327;
        b=qKwywPBChZdxUM2YgdU/WFpdA6/4GKhSLv8BTZT1DPCayOAvwm35CC3J2MgI/gWNtL
         rOFJdPU8gxJLtdlKOdaDl57vkXcHKo46Xrg4/IdZErIYn8YXUMUkItJ7Dm8PqEnXooFQ
         NLXDUv/sYRwRf3gIqewKONhOE+Pi+mpwchhEFTzji5wCD8bCXRFKXzW9BY4BSr3oXS0n
         9i//wGPbsVZsVVTLvbePNN4P9cH2ccXLJEL7YstI+Apk3lTptichBY7QbfhJyXcrzCbc
         A2trKmcGFhiAggH8fKHTQ2vZHUml6s0MFZZy8HDaEWhnBk1H1KGzpihhjM/Znfs4EmGS
         7KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HqOJkLXd0wmKotueuMhbylT2sufy9bI1CVmczzNeuOY=;
        fh=A65l4sR6KYr5tqYgUvEJaOw0sH3mGkz0TgCXiMN7/R8=;
        b=RNer5RUeQyYrypf4XtGzzaZak2qjX6a0qu6zq0mS9a/j4+y6cVSiHwU4i6dzZO2jaI
         j4LP+NUu4RUVatRq40ro8Wpofi2CMDMNE3YO10OaN0wBqMD0lpjSgIzNTgpTM+GgVRLe
         ecmwVqs/a+G3hBBnftv97KAa+WOln8zbK7l95b+1qoXTNLtplB1d9BIUL3gQWcJ6fGIv
         HWjbzhnhd3WeAEZYYVFkPknp8kbkwS7pkGsO7TxWXTuEBT0YCsehueF+bqHRqKibMuqO
         nWkDGA3OD1Q6l+D+TPDGO8EhhlQ2vLMyi6bl/9o299lkiSI8dQZ+2ZcJDWd00LiFS8ia
         uaug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216808; x=1794821608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqOJkLXd0wmKotueuMhbylT2sufy9bI1CVmczzNeuOY=;
        b=d8CKQD7AmQFWq5xRHoblvM0Fzjp3LOVqxc+agEXKrQSoN61liVReEPTibMKp1EL8d6
         zSyiiakmeOcEaU0nQubLDJUM4kKZIGH5Yh81r6OHAYVOOapqmhbS18SActLCQKmh34+C
         oqGKNsb/8QFmGzn6Pvco4VxXSzO97kgeVA7APX2iPK4/e6gOwkclotimHqB3I7OaMQtt
         QFdcCPoLLyt5OIYX3b6al3IVsveoaHpkR0ZEDlcY8as0x9CeimBecKwjw1EuTPZhF78c
         s/N0jPH/Xh4tSoegsQ6ydmvEmFelKC4bA4tZdrvSD0BwBOoBdVn2bnseYB89zsdtWB3V
         TgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216808; x=1794821608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqOJkLXd0wmKotueuMhbylT2sufy9bI1CVmczzNeuOY=;
        b=wsz3P6Axmo0zhsUU3JuEq59I4HNEE4PEl8V0pQJpQfwnKJIOud7LjL1MaOIj6MyDoy
         btBXsOxATU1DtZmm6ULFSrkhtHp3Z5Rzs61AG8eU4qFbWmJvoJLIvUiGCda/3H/Z20Rq
         yF4kw8k963Gh4vOiL3FEWx35gzbzsf7mSgqItNOChnpVZPkV3lCj7PsgapgnmJya/P1E
         Tliq/JbW92atynkhfiRo+I5gk/SKmpZyn59mS7kB+r7Xh36lUs7TpMHnx78k8SMweaKc
         xWd9PJCDtkoTiSHI4XVEDdZ+eB+UWRraXjsOLnBftdJXMq0YhkXBmGjtDqX/24v/xjJc
         LX3A==
X-Forwarded-Encrypted: i=1; AL+hErHIMj2pydxsRG9AmEwNZwHSFeK97ljhDMhN/17W4nl7r+R5d9GjnxSEVuoafmwksqje72OdZBDSUldGb74=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TLn03YRALD9RIVDXoCauJdVFQ1/oc+iknVn6zmklW1HlnoyGD
	5JKAzgY9jw9R8KgcCIX9ohS1fykgtgk3GAj57qURzrSFrJMJc4awGCvtJGpiE++HVd5SFX8zF2k
	NR1GFPuYaKp/riwz304mQIKu/BSNoQM0=
X-Gm-Gg: AYBFou2vvTPsZ5hsSfQvG5mWF92mCqor5i0MnzuJEthkO9iyUGebZWkM0vLqGelzhj6
	pi5UfITNehWw/7jzO6vUJF8GmocsQlHxrOth68m3ejSJPTrI4RZjSPaZJu7XFyDMSCvwGw+InNf
	uFBgJcE7BZXYGAicLJtU8z1BTbWxp4F7Jj5lwyiP5VCRgZP4PWvl0G93mU6Bx7Nj2sgu224oLCd
	jUfZXk8w9Hk1vzuIhiFvvHnA2gS5+U8ucp7I+/IJke4Cyp/wi00EJgbEtjAwzVbj0562ONOlkEx
	FWY5B8vN0GOSEulaJvOfq4c00AvoIF2oE06DmtIXB4ltgrvvM938k+UUZai4OVmp5vxfrxhOtVV
	WrwMC8sLeFpEj7CKMw+LoXgjOshfXRlCttUBqU1Cbrd5oMTYvZYRMTalmjt2M7322Trrq
X-Received: by 2002:a17:907:2d94:b0:c40:3a99:3f96 with SMTP id
 a640c23a62f3a-c4d6d35c245mr238537266b.10.1794216807560; Mon, 09 Nov 2026
 01:33:27 -0800 (PST)
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
 <20261016-mglru-fg-v4-7-2106750c0bfa@tencent.com> <CAGsJ_4wSDOgCC9AmLS-z670W-nkF3DXB_cNvNFnptX5F95fGMA@mail.gmail.com>
In-Reply-To: <CAGsJ_4wSDOgCC9AmLS-z670W-nkF3DXB_cNvNFnptX5F95fGMA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Nov 2026 17:32:51 +0800
X-Gm-Features: AclHuK-CEIJ-OmAap_Q_FmrC7aIH9q-wRCoxV2MMC7FO6jMxD0d_umEF-d1s_Ho
Message-ID: <CAMgjq7Dw6QtM_VgTuReNs5duPeAZbRukVFZkGuDgbQOXLm7Mjg@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] mm/mglru, gup: mark folios referenced via a fast helper
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

On Mon, Nov 9, 2026 at 5:04=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
>
> On Fri, Oct 16, 2026 at 2:15=E2=80=AFAM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
> > LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
> > classical LRU as before. No counter update, promotion, and guarteens
> > no other complex operations in following commits.
> >
> > Convert the gup fast-path sites. No behavior change for classical LRU.
> >
> > Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  include/linux/mm_inline.h | 25 +++++++++++++++++++++++++
> >  mm/gup.c                  |  6 +++---
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index 65415eeac802..effa13c63632 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -454,6 +454,31 @@ static inline bool lru_gen_del_folio(struct lruvec=
 *lruvec, struct folio *folio,
> >  }
> >  #endif /* CONFIG_LRU_GEN */
> >
> > +/**
> > + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> > + * @folio: the folio
> > + *
> > + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> > + * untouched. For the classical LRU, a plain PG_referenced set.
> > + */
> > +static __always_inline void folio_inc_lru_refs_fast(struct folio *foli=
o)
> > +{
> > +       unsigned long new_flags, old_flags;
> > +
> > +       if (!lru_gen_enabled()) {
> > +               folio_set_referenced(folio);
> > +               return;
> > +       }
> > +
> > +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > +       do {
> > +               if (lru_get_refs_flags(old_flags))
> > +                       break;
> > +               new_flags =3D old_flags;
> > +               lru_set_refs_flags(&new_flags, LRU_REFS_REFERENCED);
> > +       } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_fl=
ags));
> > +}
>
> What is the actual purpose of this patch? Is it to skip
> cmpxchg() when the folio already has non-zero refs for
> better performance?

Right, as the name suggests, it's a faster helper, sacrificing some
recency accuracy (limited to LRU_REFS_REFERENCED, so it never touch
any counter). But the low bar for this helper is still equal to
mainline so I think it's fine at this point. I can add more commit
message or comment on this.
