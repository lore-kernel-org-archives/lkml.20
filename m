Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793431648;
	b=A3yXNQy0OLDbGvadx2XES0sXwZp/bCn6biEu1hCpVPtAyRj3fDghXU4d8p1BP5gDyscr
	 go48Mg+q2imRCBnbrHbl0mOQOGj0nENQ6Pb9NEq8UD1G4kRKiX7pmGpzbaoNpQExn7wbh
	 duGplnVzjEYlYhf8RIzdD1WjyjwLbCNDTRpVLqiqheVmD4Ycg3q2CPVRN6JID9M9JAi9H
	 r0a4HwwnjUQx+cG8XlKnQFInVzQcd+conrybMt2Bc9VJzSYSQbarcE9CEi9DCjglvDVw/
	 bHa8D3WPJ6TxzEEiMk1kXJ79RG8lyOvc7+j4p66SNB7q2syhwsX6UVMV4fyE1+8BtLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P3XWvG238gH7dkSgQ74A3SG60T6iclJBQql1w995p9U=;
	b=4/8Gis2wk3zK0ch/kJMUK4EVNqJHZHe9O6F6Hr7SnbjhJenNiaRMgv8Blmo6+jrGKtT5
	 CnO3x5QX+oVmeq716WpsCANh1EG9zpiTOcwf5oryq1z0HdHMdu0wVvWKDaA/Az/oy+03e
	 AmkTYLAJEzIekzzoLPFqNAbwHOI21RB3abf6IAZiy5vTRWMLNj0bU6uug4y0Ii+FLILf8
	 vcQfeJPfvOzcWnlOa+pZJMelE0DX4F7CkJQc0ffEmz8CGAGOSdxqqJXHSv3v661p9vF8b
	 vwhvJpjy094FgDt7mukRUXAmA768zXr5l1Y1QU86wSywiln7ZJpHV3CkMIJUqWu6PMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ1RSYKl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74307606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74307606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ1RSYKl
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4697404c2bso180800666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793431647; cv=none;
        d=google.com; s=arc-20260327;
        b=PWkqlIvlpYWVb2if9Q92D+aRDi5wTbLZNHg5z2mesJRnM74/WYWe0JtNzTqH7dZW5d
         M79SdL4DSrTFIqGSVTbI7p+Upk1HapaaUlBZE2gRbMlgtSvFxUEUoSq7l5tIptSSswk5
         GcJJXriMvWR6ytWh6MTEMK6gARQAvImzk3UdJyudHhfn74FTsb9iHwd/23/xvKr3IGgz
         OyszCwuf3tnWfuuakX9DzbDdQNme3JQI9AK/xQGwEp7q3WF5pBrIm5AtCRYlAZw+gdWO
         U66OynI1Ph32Hw91wDW6CKUh8PaWSB32CIMv3B7eRY4+lrlMiDcgrDfPTh4uHL+RJfg+
         19zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P3XWvG238gH7dkSgQ74A3SG60T6iclJBQql1w995p9U=;
        fh=JgSuI7vHvwny0f7equXPrbvXRFqVS2/mwZM8NwtJG/g=;
        b=clhxY5/M/lxSXVIHzYaWUX8KWQBc9zcLoVkjBFxRqKXc/f8jvULisUaDKzdSZUzqS4
         7D4qeJtYK4ofSOSFwYdqxiSt31ln4eEJ8/0pb59rKKETiDrWKLIKqEb9BnCSdSKN1ses
         SlpsOJ4Wjan94IdzGIZDwfN8srnrbBHBoMInfmgpB6tXm1ssOhnQP0v9OeCIzSsvbXTi
         Xq3WzA5bA5QkbARhtahDqvUxXJDeribC7f7Q8aGYXKCQZamrJ1TacXgmN1zmcGUlgDza
         O7CmeEvkXlNcHE0uNK4HTKPtntBEhB/O5Grm7UatVYKIej4d6i2kSbLNAZ/cUy+Yn1Rh
         TOiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431647; x=1794036447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3XWvG238gH7dkSgQ74A3SG60T6iclJBQql1w995p9U=;
        b=SJ1RSYKlKYCLqTBDJUhlkVXESu/hAuQO1COvjm8giQjp4m08p0w0tusKKev1sNJQGJ
         fcuTQ626o89jBQWlRHPWsPOw3iYpBzhgLy90uHQlWpgIMtcCI/lB7ORMR4/eUBF9trzb
         uhWTLXiFhP8jfiZ3wF0kzk9EoMrbVXjKKjo7VXjkHu6C0iqNiGhAgMFSyZT7f6zgjeD5
         61v3lbtkh8BUII74z838G95uqbJn17WGr7/hNHMMgKC5oAq2DoIrtOM2ngv+X3s5GPY8
         YyqjjKfTur20R6OZ1q587QwyweyG0KS119ly1U7qg2ysb8GcZYx5BiOOuNRWBmTnb4Rm
         nezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431647; x=1794036447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3XWvG238gH7dkSgQ74A3SG60T6iclJBQql1w995p9U=;
        b=DVXoKm+qqF+LBqVt1wahnW1bsEaCIYLLs67xDPavnESBBEWWdiqG/wR6VGC1ZONs5t
         xUwz8+zH6XrmEtz7LqXnrP1dOh/xAkpDsRAfTGohDETgD35COyGCyOAp2c/7oTU24sUw
         efLo6hua8JBub4dIUxo8WAL6R0E7oH5xKcjBL/tXSqSCvZtAb36S8XRfgRGpzWam9qNl
         Kiqr2xsNHfOIp93k/fTmhXwHHgKIIbwatdWjlFBVcQQdjIKubJx+aZCP5RknsY/RpU+M
         zlNpZh+vboKD3zCCA/REgzVhPWPVhSRWhR/r4cndBN58TVJDe7u2Fh4hJUK/fDTp9oKz
         gr8A==
X-Forwarded-Encrypted: i=1; AKwUvBzww+sAsIfOsTRDN0eTkSbAIc6c1/U5eDBO7Fe1mjd+yLTFXQXa/G6uv3xR/ZbTsuEjoLH44Xc4myoCNoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3/RaZgCCzBzETcyAzaebitSCNjSPvUP+OHLBkKaWyxHOsHDVF
	sxtY8I+VvM/wpEw0q2eOIgHkj9R/31fT5y11nw+WP89VvWY48nblf6ol4gTamqYhquHUYicaeXO
	dRfrIINxxM4Gt9crJHz9J0IKXPRMDcrrMUZ59vT0=
X-Gm-Gg: AYBFou2SwW2q7byrDeV0xFnrWjMgwdcSYSaPPeo1e2fCWAc5iuJyQnWr5574ax48QNH
	UrLTaYf9ncDJfSxABEZ1OAaoLK8B67n/GvYeMARnXC9jaW12zeYiMKdjjk/8jhGgVdwwfpoceuv
	VmWH8GAMvlnhxE/m4gZebKCSU/qQGfnhIH2JshYgjk8iDk3kpR30fFiAcAuIpumF01irfjV1Yg4
	OmzGAKWIsmoS0emGLZcKALawbl/HOO4XBXmjuT7qbPwXsOie8zvv3wmDLqeHWRgc+MF43eRbnp+
	Tf6iSh9cMcFU7tcy7n9ExP3k/Bi9L1Ar2hvzRJbS9YPbi9mzbFyI/4Jcy7QunUkL2xDxp2ilDBO
	ReG/xZxK9t5EZWPh4E1pYe3eJEoPDx8oS8E0xCSpoab2Ln1DuwEIv+fNLGWwQEgxlJKg0pQ==
X-Received: by 2002:a17:907:9446:b0:c49:a571:c4f9 with SMTP id
 a640c23a62f3a-c4ca7a4205emr379272166b.13.1793431646490; Sat, 31 Oct 2026
 00:27:26 -0700 (PDT)
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
 <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com> <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com>
In-Reply-To: <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 Oct 2026 15:26:50 +0800
X-Gm-Features: AclHuK9LzX3HeYvpy2ZEmMy_v4dhENNFHAe1DOS4WkMeFjZGEVQnRuR5VhkzfvY
Message-ID: <CAMgjq7A6jJQ_Ncp0BCqjQJ8pJXrjr1PoOu0rdj0NJOivKp6e+A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Barry Song <baohua@kernel.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 3:25=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Sat, Oct 31, 2026 at 10:42=E2=80=AFAM Barry Song <baohua@kernel.org> w=
rote:
> >
> > On Tue, Oct 27, 2026 at 7:40=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Mon, Oct 26, 2026 at 4:41=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> w=
rote:
> > > >
> > > > From: Hui Zhu <zhuhui@kylinos.cn>
> > > >
> > > > lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(),=
 but
> > > > lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_=
gen()
> > > > returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check wi=
thout
> > > > clearing the refs or PG_workingset.
> > > >
> > > > A MADV_FREE folio therefore keeps the state it had before madvise(2=
),
> > > > even though madvise_free_pte_range() has already cleared the access=
ed and
> > > > dirty bits of its PTEs.  lru_gen_folio_seq() places it one generati=
on
> > > > younger, and PG_workingset puts it in the last tier, so sort_folio(=
)
> > > > promotes and protects it instead of evicting it and charges it to
> > > > lrugen->protected[], which read_ctrl_pos() uses to balance anon aga=
inst
> > > > file reclaim.  __folio_inc_gen() clears the refs but not PG_working=
set,
> > > > so this repeats every time the folio reaches the oldest generation.=
  If
> > > > the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it an=
d
> > > > lru_gen_eviction() packs the stale state into the shadow entry, so =
a
> > > > later refault is promoted to the youngest generation.
> > > >
> > > > Call lru_gen_clear_refs() while the folio is still on the generatio=
n
> > > > list, as deactivate_file_folio() and folio_deactivate() already do.=
  Its
> > > > return value only says whether the folio is in the oldest generatio=
n,
> > > > which lru_lazyfree() does not need because it re-adds the folio bel=
ow.
> > > > Keep folio_clear_referenced() unconditional: the classic LRU needs =
it,
> > > > and it also covers the folios that lru_gen_clear_refs() skips.
> > > >
> > > > Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
> > > > Suggested-by: Barry Song <baohua@kernel.org>
> > > > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > > > ---
> > > > Changelog:
> > > > v2:
> > > > Call lru_gen_clear_refs() before lruvec_del_folio() instead of
> > > > open-coding the flag clears; drop the lru_gen_enabled() branch and
> > > > the comment (Barry Song).
> > > >
> > > >  mm/folio.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/mm/folio.c b/mm/folio.c
> > > > index 35e242b48870..ea3adb6a89d7 100644
> > > > --- a/mm/folio.c
> > > > +++ b/mm/folio.c
> > > > @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruve=
c, struct folio *folio)
> > > >             folio_test_swapcache(folio) || folio_test_unevictable(f=
olio))
> > > >                 return;
> > > >
> > > > +       lru_gen_clear_refs(folio);
> > > >         lruvec_del_folio(lruvec, folio);
> > > >         folio_clear_active(folio);
> > > > -       if (lru_gen_enabled())
> > > > -               lru_gen_clear_refs(folio);
> > > > -       else
> > > > -               folio_clear_referenced(folio);
> > > > +       folio_clear_referenced(folio);
> > >
> > > Why can't we just call folio_set_lru_refs(.., 0), and should we clear
> > > PG_workingset? Keeping it helps PSI on refualt / redirty tracking (no=
t
> > > sure if meaningful but CLRU does this), clearing it makes eviction
> > > better, but the eviction issue is MGLRU-only, CLRU keeps it.
> >
> > I recall that in v1 [1], Hui mentioned:
> >
> > "Use folio_clear_referenced() rather than
> > folio_set_lru_refs(), which is not defined without
> > CONFIG_LRU_GEN."
> >
>
> Or prehaps we can have a folio_clear_lru_refs() do in a unified way
> for For both CLRU / MGLRU? (Just like folio_migrate_lru_refs).

And it will be better if we can keep this operation off-list just like
right now :), some later works could benefit from it.
