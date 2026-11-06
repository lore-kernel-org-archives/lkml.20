Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957372;
	b=Ev2COZxKdF3eLxcooGaJIKbcAZC3oLSUjN9QQHOWBnQTdg2XbYMZx0eSw1+ZLmQY/Mtf
	 vL2zhwMNpJ5JzEA6dgMlXA+AAu9wMW3b2DMq+MinoxiOPpiSrqq8lmqp1STz2/0mJsrcb
	 lMCCcRL06bHybNRjRrWnTGF2oiiBANwN7qA2kL0f4/SgYr1Ol7nnY9IqBMRkEIHFi4fQO
	 jog+cFF5TSFcAGMtQ0X9rpRuE2TsiQrLqamRWUPzv38p6TLws+hExmuVVaKNR+UMAUxCN
	 gnW8PemVqahe5We9E0JsbMVefPzfYdssi6bMTBhmoCtQqx2xljhOMhVEHeeq2r1hnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957372;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WneRI8zEINthMc9GHmH6/zD7m3iR83/KjXE9iSNfWjg=;
	b=1QQRFubqU4986cpiuf0RzvsS+4pM5beexlV0lpBvLRhA5p60yr6CjNXa9EAubHKHx+Tb
	 22C+YArSfPHZT1BNQM0Rb0M44pgkMaqFYG4COuKsT+M5D6lRzzWK/3+SSlImkWXY6q+dl
	 HNbDWdu6oc5lk2iJ2OoiowYXuIhvNT5//16fzSxkN0zuMgQrGY1sQng1KUXlWHzQs4d6o
	 cGPwB5nfMXfS4mBGgYnHbY6rilU0f0wJ79Zx3jN+BR3w97tketjCQEoxo8n5FX4mkXIom
	 JEPxeYDXISSUlv6i+okgcWZ6VWWa+k2XLcyzqTPFvxG2dfMO+K/oKPBS9180QVD67mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG9BxYMs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE019606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG9BxYMs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860691F00904
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957371;
	bh=WneRI8zEINthMc9GHmH6/zD7m3iR83/KjXE9iSNfWjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VG9BxYMs/WkgcUa5xAMa0aimQAVFO9n94zvHJYAgPP0epXkE+GOOnJ1msivl/bciT
	 DUZEmeF1iutR2OZOcyFL3vTsN9QSHEyhoQVf06DYHVz0C1JoV72waTlB8LstOkBNpl
	 oHM0zmTMJsu9M0+4s8j6Z+D14jUy4kharCNQ/N5z1PTEmZJ96EMzyC3hsXkTC1jOL4
	 PgRVW8WwvINXHon1a6DRI+b4Uh0G7wSdxReZHUspA77FB8EiAnVJdvFydyv88Fn6EL
	 70skqzOxMLoLvm5qnVU5iJGn4zC0jJ0Y8pPl8IU1G+ZKaVBJikgaILeT23gjwFgaUP
	 FqtqZE86hsv+g==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f22a8515eso36948885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwQwtq0Pnlqbpzk7QXIHAOr4lrTrNkTM48n7BY2h2k2w5/kv7mN4mjRAHQFwPgtUe1e43mW9IDKoPlYTwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OEcoNXdCqWpxET0m143URqj0oNuGG9jYSBaSDEoTDwoSI0Yto
	6BsrJ6uCgw43z8xks+BmruJI/ZGb/3WtjIM0JiN/0gx4L+jeUlRIrAkvlL2Cxt4SsgveYEMMz3o
	wL0GJR8b/FExNY+NEPM2ALzQRNA7rdy4=
X-Received: by 2002:a05:620a:4143:b0:93e:c12c:f11e with SMTP id
 af79cd13be357-945f35fc301mr264775585a.74.1793957370683; Fri, 06 Nov 2026
 01:29:30 -0800 (PST)
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
From: Barry Song <baohua@kernel.org>
Date: Fri, 6 Nov 2026 17:29:19 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wzDCqBsbQyAUiY=+iHNzDw0+qRvuKLQ_FWpc9CunSmvA@mail.gmail.com>
X-Gm-Features: AclHuK_055utCAu_emgM4jBlSxIibsKx9PY20xKuJpfTBMPvN5423Jhekgjf2qY
Message-ID: <CAGsJ_4wzDCqBsbQyAUiY=+iHNzDw0+qRvuKLQ_FWpc9CunSmvA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:38=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
>
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
>
> 2. Follow up with option B as a pure cleanup, no Fixes tag. The
>     lazyfree site then becomes the off-list __lru_gen_clear_refs()
>     call that Kairui wants for later work.

Makes sense to me. I also personally hope this can be merged
into mainline soon so that we can backport it to the Android
common kernel. Having lazyfree folios with hotness information
sitting on the file LRU really makes little sense.

I recall I once did the below to ensure that lazyfree folios get
higher reclaim priority:

https://lore.kernel.org/linux-mm/20240914063746.46290-1-21cnbao@gmail.com/

And it significantly improves Android performance, according
to Gaoxu from Honor:

https://lore.kernel.org/linux-mm/7dcd3446cd8c4da69242e5d6680c1429@honor.com=
/

I didn't pursue that approach further, but at least yours
should address part of the problem.

Best,
Barry
