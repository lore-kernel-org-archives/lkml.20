Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794047910;
	b=gOzCuK+DK7SSdIGDT+I+r+OBNf551CwS43wJZFzUBPZTKZ3je2w5REYAOIXA7u9l3e30
	 1CdMX3RkpKtXsOY/QXuASvuxA0crJAl7klAeSc0xSA4EnN5e1MbwU0ZwzSTnCnI+t6qof
	 LFOJ2fZm5i6pu29gRiOrsWENWT8cM+E4mm+1rhepHxkINyMBtYRi0eep+Z3CVAwmUNJsC
	 22RO2+IMlPbwvoDxvA4WM3ky7bFuTFIRiw6BcY+272NI4AAlw3QwNyFmjrJ8f8vhkAXJC
	 hk9PJvrhl1pR5tojlvbUC6l9VFhSNQTt+IzHwjQJwGcKYLWLAV9gka55miw02Ra+sIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJBC4ok9H49MwJnS/u10ilI8HXDWAq7hcG4/f6Td/m8=;
	b=RvQH6fugil/jm+P/sIyBJk2IF8p2RLeZTiYLDZSgXqRFkbvUCFVt2PfjYmGN0xeZbIBG
	 vp5LYAQX8v+yArYsD4fRuwYfkR3a4ukVmIOQ/BTZZFTbGIhzOkfH5106cf+Sv4yWyNPz4
	 Tsl0YwFSHgse7ek+wVnHUTaiKmyn3kAD81uH4Ma+MXf9TmDtoIKxSqXsOttfqdVZiziE3
	 utnWczNa7JkOAsWGCXdLG8GTQNTD4Qb0sE9CmHOWzyKHCGMbHNGSCfwnvNTNsb0hlYW8h
	 LArajPeWcOyDY8mBs0ZtxbnrP4aMGipIpsMRVS3emfFb3k8LLXro3aRv6svGlanhP9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meb6cqmZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B9C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meb6cqmZ
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d58c50743so20821266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794047909; cv=none;
        d=google.com; s=arc-20260327;
        b=gzC4M3uFjxPUtz5rpHy3+ukbU3LmfMtwFzbUOlZCuSREfIHHPNpnpH+4fkINK93FLw
         n/YxwWFzLHbluUsHYTvMde+/TqxdxE5dx89T5qqQxLdFG8vpu5T9WHbTN1NXn/J8LX7Y
         YB/u0QDUhLJohjTRPfOprH2cZdbftl3aSbMD1ounXiRZ1KcICtsJvxD3gTzhPPFUkVtH
         vltZGg3sTnGzlgXDazj58SYENpdQRs4BxnM7biXQFMNxM6u1kO1AEgNVjlzXKxjKDyBc
         5uS1ASF8QIcT51wlA8r0ywWuu2gLX8oXGX3gfleUoE48tCspoTy6sh0/surUHsZBC5IJ
         aZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJBC4ok9H49MwJnS/u10ilI8HXDWAq7hcG4/f6Td/m8=;
        fh=jMMcW1XlN792bndza+H6Fu2YGB3gwXipLROF2bG4Umw=;
        b=bOIL+iEFTIk7VFEV90TiOCNVe/kGxR3cWH2j/2G7i1c0H6TTBEO44WtRMNONk4hFZb
         EPoRwha/cWFn6C9owMR3c2JEmsxjoRkReQvUz7VYDDLu10qQVk7BHpvcviXme65vRIUz
         9YXqJksI5BcZIjzcrWHWBZukoTeU7ThfE79chcXk5HtmL+UCcNKiuinSNqJjBFlnayGu
         IQ3Vkstt6YFYC2jJw6ReVqx8j7eGJ4xNguK7SxB3LMygk4jSVSsjZ23rrtqKFtbsXVhR
         oxo7jhjXh222IRREnZgdXZADXm0uRFZy4HkFkF65Nqi9Bgqp/2745k9jGxBa2JeMj5gT
         5/1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047909; x=1794652709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJBC4ok9H49MwJnS/u10ilI8HXDWAq7hcG4/f6Td/m8=;
        b=meb6cqmZiaesiYajT2w8WcWyGb1naD7KZJQrwhsWCTQb3sfUWn+BGVpnuK33mnXR3i
         t34fJwDb5HMw51HzMrTZUJxr1/S+bOND6pvfTq4K2tt74dxqQ6bNELYwWL80L/2rlaJq
         gEsVbljpFTOmp836iFIne4Uhsbpeewnx2PCohb7YRntXLqBxlPHNsZdZU9uqsibQPYW1
         hp9iLiA5I3WrGEk0sXZ+aalui4iW4zTVV+qP3sQhpA4+Xi9QcEFrTtOd2MA5g5IFDxNM
         gadvPrKEGOlRFaycKIBi4Z3dZIVnrM+DezDQKtV8WZvWIG913zIOeAoVFr09fEI2XIl2
         Rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047909; x=1794652709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJBC4ok9H49MwJnS/u10ilI8HXDWAq7hcG4/f6Td/m8=;
        b=GDIxBITCkzzGzf/esjHuEQc/UfINpgO1CnTYavnDAuFDZpv7uXlrN1c1wNRXc0AbMF
         bOFFEKxwv3wNzYsmON0kLgFhghPYXjkhpkAOutFhRdb86cwGfLj+OTOBAw/o22TKVwPP
         ZzSDzVp5FtFf9LdE5011nBvwdxqUdzdLwgnXNppGfklRk9Il/V7n+//Fkhel0iaXJH6H
         eaDQKdsWDa1q3mp7k3c84Emk7q+bCA2RUAWYSNXFzdfdPJX2g8I+lTxBSP4gvCfzCIbU
         qyyE3fb0mZy47ShgJoBchEjARB9PlLHAK3yaNqEBO864YwkzacKUjaB0Z8wRmnZnmYXj
         Oa8w==
X-Forwarded-Encrypted: i=1; AKwUvBywNc5nwUdecCx/IvZgEDX5plfqrcRvEW/30SoLWF25UCea2+KXUHWxI2WJVpIZ+Hv5bImOBZuoPZHxj34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JI3oMKKO4gMYIjBPVmB2szrZqIUNUjgZ7rm5x6qaFLMLSt273
	oN3SgRddRyflzGUv/3/kPe88BY0ejOfzBbewiL5m+YM9EM3K5raDKSw/KB7txebGAQ1jTFeagnS
	UlApTtJYESrmW7wBY1A8Fj0y35veHBbs=
X-Gm-Gg: AYBFou1XCMdALkwsTDeVXGva4rCHhhl+cBHLzNx0v0YOBse8qRkHte6j4aPzzxTs6em
	wHwHsaQpgwXxSmovp7xjXcDuxQcSTPpnh3xOHIjOKkAJ2rPlFSrM5gKn971vUpCA6cJ1ZvT14ks
	VwFsf9BevKE83ZE2qnRsx7JkQPQ7B8PNnp0J34y5gNDMoL5aKy5D+XXyXkICfu6EG/QF8hlQM5f
	82QZTpVfrOdSJBHEUZV53UW0FSraXoQ7oJzVg5/jVOqMA0m5VdTeHkagWLlq/b5DJ2N4BPd9oE3
	lLSgfri9UJtBYP3FFgENFzxk4aKHu8QV246bZ3EAMyS1b5w8EVyewLnz0DcRmBFSNm14nt8Yqeh
	ezNy/KUJ3z+GXdya39Db8arI9A/l35iBKdeRiH1M+sKlMgC7SxRX2o17V7wA/GBkUsMYw
X-Received: by 2002:a17:907:c491:b0:c40:aa04:18d0 with SMTP id
 a640c23a62f3a-c4d34b8cef5mr420685066b.17.1794047908553; Sat, 07 Nov 2026
 02:38:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026084035.535989-1-hui.zhu@linux.dev> <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
 <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
 <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com>
 <CAMgjq7A6jJQ_Ncp0BCqjQJ8pJXrjr1PoOu0rdj0NJOivKp6e+A@mail.gmail.com>
 <CAGsJ_4zO5S5XFc6dd70wKEs_mzqu_QW2bGOPyhKo4w2cjZrWUQ@mail.gmail.com> <8e5956d5-ae03-40c0-b5a0-bd550f4c14b3@linux.dev>
In-Reply-To: <8e5956d5-ae03-40c0-b5a0-bd550f4c14b3@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 7 Nov 2026 18:37:51 +0800
X-Gm-Features: AclHuK9fmKDpAUrLOEJxid5m6a5W2E_OzsxHmICY5QYFvtDrW8vifxe4XbQxg70
Message-ID: <CAMgjq7BNe+EcyAGY_hz5DQg6oRs6x_rAM6MVoAM0LNEP4Jt8qg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Barry Song <baohua@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:38=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
> 2026/11/6 05:13, Barry Song:
> > On Sat, Oct 31, 2026 at 3:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > [...]
> >>>>>>   mm/folio.c | 6 ++----
> >>>>>>   1 file changed, 2 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/mm/folio.c b/mm/folio.c
> >>>>>> index 35e242b48870..ea3adb6a89d7 100644
> >>>>>> --- a/mm/folio.c
> >>>>>> +++ b/mm/folio.c
> >>>>>> @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruv=
ec, struct folio *folio)
> >>>>>>              folio_test_swapcache(folio) || folio_test_unevictable=
(folio))
> >>>>>>                  return;
> >>>>>>
> >>>>>> +       lru_gen_clear_refs(folio);
> >>>>>>          lruvec_del_folio(lruvec, folio);
> >>>>>>          folio_clear_active(folio);
> >>>>>> -       if (lru_gen_enabled())
> >>>>>> -               lru_gen_clear_refs(folio);
> >>>>>> -       else
> >>>>>> -               folio_clear_referenced(folio);
> >>>>>> +       folio_clear_referenced(folio);
> >>>>> Why can't we just call folio_set_lru_refs(.., 0), and should we cle=
ar
> >>>>> PG_workingset? Keeping it helps PSI on refualt / redirty tracking (=
not
> >>>>> sure if meaningful but CLRU does this), clearing it makes eviction
> >>>>> better, but the eviction issue is MGLRU-only, CLRU keeps it.
> >>>> I recall that in v1 [1], Hui mentioned:
> >>>>
> >>>> "Use folio_clear_referenced() rather than
> >>>> folio_set_lru_refs(), which is not defined without
> >>>> CONFIG_LRU_GEN."
> >>>>
> >>> Or prehaps we can have a folio_clear_lru_refs() do in a unified way
> >>> for For both CLRU / MGLRU? (Just like folio_migrate_lru_refs).
> >> And it will be better if we can keep this operation off-list just like
> >> right now :), some later works could benefit from it.
> > lru_gen_clear_refs() is currently multifunctional. It clears
> > refs/workingset, but also returns true to skip
> > folio_batch_add_and_move() in both deactivate_file_folio()
> > and folio_deactivate().
> >
> > This actually looks a bit weird. However, following the current
> > logic, I've drafted a version that we can use as a starting point
> > for discussion:
> >
> > diff --git a/mm/folio.c b/mm/folio.c
> > index dc2c796a4ea7..bc17cd3b6b6c 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -444,12 +444,12 @@ static bool lru_gen_clear_refs(struct folio *foli=
o)
> >          int type =3D folio_is_file_lru(folio);
> >          unsigned long seq;
> >
> > -       if (gen < 0)
> > -               return true;
> > -
> >          folio_set_lru_refs(folio, 0);
> >          folio_clear_workingset(folio);
> >
> > +       if (gen < 0)
> > +               return true;
> > +
> >          rcu_read_lock();
> >          seq =3D READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
> >          rcu_read_unlock();
> > @@ -465,6 +465,8 @@ static void lru_gen_inc_refs(struct folio *folio)
> >
> >   static bool lru_gen_clear_refs(struct folio *folio)
> >   {
> > +       folio_clear_referenced(folio);
> > +       folio_clear_workingset(folio);
> >          return false;
> >   }
> >
> > The another option is:
> >
> > diff --git a/mm/folio.c b/mm/folio.c
> > index dc2c796a4ea7..8d1fd788188c 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -438,6 +438,12 @@ static void lru_gen_inc_refs(struct folio *folio)
> >          } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_f=
lags));
> >   }
> >
> > +static inline void __lru_gen_clear_refs(struct folio *folio)
> > +{
> > +       folio_set_lru_refs(folio, 0);
> > +       folio_clear_workingset(folio);
> > +}
> > +
> >   static bool lru_gen_clear_refs(struct folio *folio)
> >   {
> >          int gen =3D folio_lru_gen(folio);
> > @@ -447,8 +453,7 @@ static bool lru_gen_clear_refs(struct folio *folio)
> >          if (gen < 0)
> >                  return true;
> >
> > -       folio_set_lru_refs(folio, 0);
> > -       folio_clear_workingset(folio);
> > +       __lru_gen_clear_refs(folio);
> >
> >          rcu_read_lock();
> >          seq =3D READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
> > @@ -463,9 +468,10 @@ static void lru_gen_inc_refs(struct folio *folio)
> >   {
> >   }
> >
> > -static bool lru_gen_clear_refs(struct folio *folio)
> > +static inline void __lru_gen_clear_refs(struct folio *folio)
> >   {
> > -       return false;
> > +       folio_clear_referenced(folio);
> > +       folio_clear_workingset(folio);
> >   }
> >
> >   #endif /* CONFIG_LRU_GEN */
> > @@ -659,10 +665,7 @@ static void lru_lazyfree(struct lruvec *lruvec,
> > struct folio *folio)
> >
> >          lruvec_del_folio(lruvec, folio);
> >          folio_clear_active(folio);
> > -       if (lru_gen_enabled())
> > -               lru_gen_clear_refs(folio);
> > -       else
> > -               folio_clear_referenced(folio);
> > +       __lru_gen_clear_refs(folio);
> >          /*
> >           * Lazyfree folios are clean anonymous folios.  They have
> >           * the swapbacked flag cleared, to distinguish them from norma=
l
>
>
> Hi Barry, Kairui,
>
> >
> > I would personally prefer the latter. What do you think, Hui and Kairui=
?
>
> I prefer option B too: it keeps the flag clearing independent of the
> list state and leaves the two deactivate callers untouched.
>
> But I'd suggest splitting this in two:
>
> 1. Take v2 as the fix now. If that is acceptable, I will respin it
>     with Cc: stable added.

OK, that makes sense, agree that we can patch that regression first as
a clear backport indeed. Thanks!
