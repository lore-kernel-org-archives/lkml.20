Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473237;
	b=HbXZ7d92z7uWB36xtoa10zaNbPGka8hnunV96sHbQG83NrABCkmyftlwjKx8nLIY0wfV
	 F6Odr6HdCujP1VWDgqw87bW36Lie9sT4mSj0joO+KBuHIJwsVudSwWS0BR3SB5icU0Wiu
	 wk5JUYarhNxsiGjzf1vgb2xvbZ6pEqu7jAKsoCbaSwkMMSlyGrJam0kQM/ARRdfSJ4+Kf
	 jJ99O8X46QEOU8isi3pbMlLdh8trC6+8OyBjTCF9+Q2urVjjYhD8YWTmkuWUK9rJjY5gl
	 kI3VGX2ccWKSZWxrI1je4NkS1NnE56O90PxkBgBWCT4b2j+h6RMGoUhSrp879ojuuOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kVtvjLNQqVhAbmabkyBPJW5OAK7r3mnKjNng1ZW6k8Q=;
	b=NwEUjIbYVULjc4i18Y3htJXfrYI3FbhTNEir45lt8sS8zOEL1mXCvGULzn8HsJp/b/m8
	 QQ01ExAMcNWJ/Wk1VV8Eg6bsASe3sUwL6+00Kh025RVy+8WMZKxkRhO89zIny9ar4J8uR
	 iXPQ0a1ZrSyTOKw/Qe6UJ0L7niUFLEAhZkyQnG7OPrcFDa3KnQKOX6JIeh176LJUB3o03
	 Eh1iIimpgquhqphioYZ4Tkg7SYhbDrV9/Zci9HZZimY/zoVKDwfI9qlmU9lSWJcEk+ZnJ
	 VNMASsQ25LqxR5Q7qDp2rKINVpfPmMhlcN18K6q1Vru6M1/OAM/nevw3zEPpZSMKMlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEPmkKFY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A81606A8AA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A81606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEPmkKFY
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506094fd93so352821066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473236; cv=none;
        d=google.com; s=arc-20260327;
        b=nMQ1LfboWrEsGadoT5p5OycoGRdot2+17OxtrMte+Ae6BxdtbzgkWlC+kN71Fhgr1C
         AGlbmY+qUa8b4zLpZivy+HbH5Hd7OQJxJXw1DWIpk+PQ+4KpSqDnKAIzIwGwFEYFVAS5
         9O6XRety3w1/owDgYdQiFuODvCNZ2Eoe2HGyEqc6ZZywJILrIPbzzWM6mbZkAKwkjWma
         ckwpmoE7DQjPb4r4zAmoFgtTJOjfjFznEK2T3dkRA1m7bxghOVme59ifsbVEqQNfEwfU
         4YY9U+c8v0BJ6L44pHN0eA4q9NHkryYUYGApTkmz9YO+TyZorHRgKy6Yk20aXFQg37Ib
         JfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVtvjLNQqVhAbmabkyBPJW5OAK7r3mnKjNng1ZW6k8Q=;
        fh=ZLjHTKso+G24c+0PRyHMIsZt3mLtTnvJ2fd8ioNhUfE=;
        b=RV7RdSb/semxo1X+YEVnOPF9V4XhnDZnEg+IU30wdqxsipzSrnMpXruPVO5QCjjRW8
         ARRJ7XNj4BS2GouO4Q34R52i5m20IiFRNAKxVDvc2YUA/NP7ilZ74wFixFeApt0jPd3l
         sSiacHcx9TzASBoDzJlorFW9Pfvp3mxXnXgWAXQ7r55gS/90AEe1rBL+e+x6Q3YIuc1d
         ndMWJumUQjJSWHFxbkmx3YyEdLv2oPIYkqlxvZ6qzRfpDMljP2DKsk7KSVP2Ie/aQ5E8
         PuecUMb+p6FbjF83VVUO9MUE8FFI4FefpPPtAdDObYo5045sPM4/oQAA7NHVG3ZAVf2R
         wFRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473236; x=1795078036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVtvjLNQqVhAbmabkyBPJW5OAK7r3mnKjNng1ZW6k8Q=;
        b=uEPmkKFYDZGqzMS6Im7HzsxoKOpcibpnU6u57KBes5t1zyN4CQRWwWRk+TtlWl7TQB
         eIHvWPY7yr6ymLq9sW8C5lxy1y3X0M0WVRdii0eUXDB4RqIg0BzDrPmePaphs/fMr/rQ
         XE57Rxot0Q4QzIaThJqIJeJdyJE1VRT7tckrH2UTrsrdwLRQYlsMXS7OuamXZNqD254a
         BC/Mmz2TCWvM7RJs75YAq2ecQIAJHfXUCKGJO9Z7DgQfwEsm7dpn1xBk7YeZimMf6Bhp
         ge/iT/R9ZbLyBKFziIBaA5hoSEdEtO4zLHTuxKh63EO6SN8IjU6peV0DEJ60pKCDK0RK
         xdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473236; x=1795078036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVtvjLNQqVhAbmabkyBPJW5OAK7r3mnKjNng1ZW6k8Q=;
        b=U0PhPALf1yWT0eFOHd4EI75o17jOp8tpBRUzpyfYM/Y4/EedZE5E+14VlNZVpQx6HT
         /stgltFC0Hs+9PLTh1RVKD+qzdjq2qSzzL1XG7AWn4cyKhjDaSkhHwYLaCS85fvC4m+R
         mtbXdYH7DgkZfJtj+47kw1QvPr7j9qd2zE5lKEWOxW0nNq0aBG70MVjN/yUtpM8TJXjh
         1mKVJJzSExPJOwg63dt07tmHbE0UDasNeiHOhKpiyom29xACL2BgFa5vmYg/9u0KUNd8
         97lTPXuKF93oGqGzRdR8N16wNeo5kyhbJQQVLNH9pyZVQk8IksNwq133rol//iGyux//
         JJRg==
X-Forwarded-Encrypted: i=1; AL+hErF2mkD+37Abn0ZM+LbfSDyONo7mMgdVuoEnmk07x1Hx6DzOD/Du3uIOWwum85dm47x+tvQ2hUM22+j5JGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z81sq+ZYso91HBBIVEooMlpSXTfzALmpKCcuAt3QM477Pyhn/nq
	b9ZAEf3On5eNG14pBEOFq3WtFXq3xN/V3q/jFS1uTBOZoefFYg7dBs8OONcEXqrcIf8hAxCedbv
	TjU1UhPOF9e16vvqzDoDpKK2GqRIXWRQ=
X-Gm-Gg: AYBFou3OZfBhRdx2fwg0J2e/IzEm2t9c+tIzSpIwHVPveoXvKGT//9gjkjQmy33Kxzb
	jVjuF3wtbcpBilh0SzZptYfSryPxQ/CGEpwX3SqyJ+5agFPMxD4DGza0Da8GhOLgVp13vatIbLl
	TkSfSxtLhRJURtPbpAZwxXWU8K9/OZ+mfx3K899+yZZb+5h6UmtBeAoDAOXBQCXYvKrUvsD16n/
	TyQAb9uIv3DOCPi2LJ66LU/QTzeAXKHzousqz5LK3khjt1eWKBW3dAjcki8i57QMo6ZZlUlNfzb
	+0XfjtjRUigszTcUj6J6Ye2A5FPVAecGbqC4Zar9cGcznhEcW8NXFdKQCv4hr/SlilK7pV6orQ5
	7gYv4Q2oDIBKxSRuERkpPJFtQ3MvKaDtZPUL0FTT1mzHRsn0ewV6a8Xoh+XCq39j3zMpe+g==
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c50668b84bemr390386166b.4.1794473235463; Thu, 12 Nov 2026
 00:47:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
 <avV52J2rD19cjM2J@KASONG-MC4> <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 16:46:38 +0800
X-Gm-Features: AclHuK_EcloF2JvrHuKv7xoNWQwKzuk5RGeSJlKLhscR6ySvKSoZqdKqRDkMuSU
Message-ID: <CAMgjq7Disoabm_4yyp60=AdaEH1RWfUpawc8vckV2e6c7g2RmA@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest generation
To: Barry Song <baohua@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:42=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Thu, Nov 12, 2026 at 4:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> [...]
> > >  mm/folio.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/mm/folio.c b/mm/folio.c
> > > index ea3adb6a89d7..c412d9b398e4 100644
> > > --- a/mm/folio.c
> > > +++ b/mm/folio.c
> > > @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec=
, struct folio *folio)
> > >       lruvec_del_folio(lruvec, folio);
> > >       folio_clear_active(folio);
> > >       folio_clear_referenced(folio);
> > > -     lruvec_add_folio(lruvec, folio);
> > > +     /*
> > > +      * For MGLRU, lruvec_add_folio() places anon folios that are no=
t in
> > > +      * the swap cache into the second youngest generation, which is=
 an
> > > +      * active one. Add the folio to the oldest generation instead, =
like
> > > +      * lru_deactivate_file() does for clean folios.
> > > +      */
> > > +     if (lru_gen_enabled())
> > > +             lruvec_add_folio_tail(lruvec, folio);
> > > +     else
> > > +             lruvec_add_folio(lruvec, folio);
> >
> > Hi Ridong,
> >
> > One question here, why MGLRU/CLRU have to use two different ways to
> > add the folio back?  Will this cause over aggressive reclaim of the
> > folio?
>
> I guess that is because on mglru, that is lacing a way to add the folio t=
o
> the head of the oldest generation for anon folios while CLRU can do
> that :-)

Right, but lruvec_add_folio_tail also added the folio to the very tail
of the inactive / oldest list, could it be a gain or problem if we do
that too for CLRU?
