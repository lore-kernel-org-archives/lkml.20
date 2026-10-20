Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792512073;
	b=Tglzz0SG1LkmygRV4Za9zC1+norxZQYbpSWhVmaUQM4yNhPzs8tmH9VcEksuSZ8Fk+O0
	 RMCtguCMCnhehSGuhl2PfY7d09cdTfeUesfXw0RiY0UhMGNjxze6pESFWRsT1fHtSuomx
	 icJSNwQWog45w+tDrj0YrRGtvl7ZjZp4JI4kHd20qm1VXIMLur9+3gJzhqB+LhqXxbr2G
	 BPm5R4HNuliU7A5rNQIMwrblj76z/cS+xkyaYX0nze1TWj0tS6LtWsidoKFlB64ojbNoL
	 PeTfgjMbvwQkc6KdptqrZdo1sZ+1219wdu9oGAcOfcXl7i6THRxbi5Sz6XrcWBMB3vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HeZwgriUF7LL7AlcLgHE2qOU1a0jMQO559qSB3XGdoQ=;
	b=VdrDSdvkcQPZ1ioUe/vFrzo0ngZlS4P9/Ohi+zxW9pLDNDhFhiqbHcoBhvaL6s1nMHCr
	 P84ES5cU1PzUkf8dckfO7gLcoQY/ZRl3CHcABIjz0FctwGJzOgEh71ICulXeZTrwZHz2z
	 wbVvTDZKx3N3Pgf/NsbQ2KdHn392mXnk3ALVG4G9YlfTOX2WuHuKcoxRwplfqUWZCBCOi
	 9+qqsLdNy6CBvInTHwvYz0hP8Nugibpyi7z25wNuAKYKLdRCIoP2hqZ3kv7VIl20PbNL3
	 Yi312/gqjpyK5WGAMzgNJWtu/NAR93AbWdAlderbKjv7Fydl+y7VyRyRA/SomE9W/WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lVVovpG3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B363606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B363606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lVVovpG3
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20ce3c118aso167219466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792512071; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYmxae0FrOsp26f5DSUtLynrXOYA4+Tb86j7k/H+RlxcAst6A+CPr//8j40WNOYk2f
         AHhYDbH3UwDMzFriVelEbv4yBM63YJS5IvEvw35/Q3f4dXCCes49ueduV5tqr4ShWMAh
         BccMxxbwoqyBbPZDyX32h2RpqvP0QMaG5NvcI6ABIwTV97e5Rdl/mhiUOqRTq8LhjMWH
         9eo5iWCUqaBMxbmTQnh/eVcLoxy2Oeu6BFCH0QbXYBMUOsyogQjkHHXwz3oq0AuLpgt0
         Me7W5xXjV2bLM1kmadscGEeyOp+62Zcj62rPiYyzww1r+sAEZvh9jNm7G36obxr9q51K
         xz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeZwgriUF7LL7AlcLgHE2qOU1a0jMQO559qSB3XGdoQ=;
        fh=FplDIqRjViTQdPvnTZ9ccgyqXFn5qfMMyb6Yh9271XU=;
        b=pNdUjyHghcbty9wS6Feh9jbzSuXEGgLtIoTG2KCJunGwzFF9DHAv3UxR1jPyPNE+DI
         mOVyQIOpSNFj8GQXcW/wm7ErsNaIfGDQegH28QSaWY3qmx8ZV+fnorBE3bQtCWZ8aUF6
         2u1dndFLQI8PKv4ECKbhhduFhPhkqtM8lKeb+nSzPdbO5jxBMX5GfQR57OezHuVFNp2j
         i1ko59HHboJHsKexXW39EPFE9tHJBeYV9+OZCc1PQ8vw4x+FFuc0iyh7iISl6Z4RdQvC
         z7e5ijdU0AufcCFs6yWFfQF5CKePxX2KR/GleFZbrKIJa5H0zOdbTQHJz7Y0ksh5RCL5
         S+oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512071; x=1793116871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HeZwgriUF7LL7AlcLgHE2qOU1a0jMQO559qSB3XGdoQ=;
        b=lVVovpG3HeYt/fra8iL2wBDeN5IGOjWYh/vJZHG5dwqDckweEtYPYWU0jw5swdyC9q
         J7DA0GykuS3E7C2JJTTW0HAx6VnOnNqy21VFRxmBuyHn3EqdVCiyS87Hu7fCWmlinu1k
         sRKWC60tofwLDRynQTu9l/7br9nn9+wLa0l0+6bT9g2PU0+l2k9IWAojzeIB/SuTN7w2
         yn3zDMViz8ghs7fYtc8dp7ZNgdglowicTgQhRCHLULRpVOtyyXDZXJZCt0iYYeyUFkdL
         orWjOHOhXEbHIM31SnWwOgrzVa01KTxW6azgvnmw46FiLj6Iimwkjdi0OQ6WX1CJ4PcN
         MHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512071; x=1793116871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HeZwgriUF7LL7AlcLgHE2qOU1a0jMQO559qSB3XGdoQ=;
        b=1N/TLj+IJ+mVlwQdsg4ir6QRy3cM6shKvPWcWtcHMBTCCf5PDauxQF05ZwYjHWu+NM
         ukh8Lk3LK/iIXo47CXwZ740EOn5JjfptJ133de6Brjq0LX/hP6r38Jcw8TdEXkU6YJIb
         Eh9RqWtWdoy2bBakik5kImFy7wlLdp2yNCR693Tuo9HlyBiyNiirTG1xuSEnoowKpw40
         XQgVm5lOosQQB1aJKumvPbu57Z4FXBEEtImR8BpjEbsym+KMzWzfvFIBmr+MnM4psuQ7
         Q4G/jx7PVIlM1QQl+s6BV1VTuUxwXWbo9Bc0SAbTodtSsO+s/PgcYmgZ0TroXCDZzPXr
         XA3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRSHlmlxRYAWcZBPeFqLZHZNXymmf/+H2mZroWcMyp62o9unR7C8Jv3hsiwuJMVXSEO5RTLc17tIGgGVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4DNuNHIIicWx4Q0dDOKmPwBdvbXDckUhQfRTlGUeW8+4NMiEW
	vFVbzMiahgZnU65s7i8XrC5Yr4OvUdr+CmDW5m0NrWv013k4yw9vLWHKSOFXHC7QjKxchrHmNMf
	tGjzGCsr7WgT0axdK6F8VaMKWSyGg1g8=
X-Gm-Gg: AYBFou0LbgCx7+gPyVXQU6YNhMWQ0BNTcDnUmsGvwGNDWHeS0tTjyUN0Hq1RLqm5Jjg
	/xGka4iPujP1HjBjnqw1VdEEpcormm6Jqflsob+ZL+auYmjPSB61S60u27KEuglCWZu5IIvOjkt
	iBEw2vqzc+CB/rwlEx5uX3D3nzXu2Uj4W862PgZa7/39JTfHAgvP2DxLwcPC1wdJcMh96WFKTxT
	A2Ch7fHWzDegr1gFCQBay1CSsoYJpUbvsXkerc3QnCT+8O7zdsXseJCZQ2TpT6B/lG0CwmND1X0
	ab/1hs3fjMHDMilYw+HCyUDAn3Yll9KAab63rXjygcp1tzEXrmtUTPZn8dUTxjZ+74q2L4tDPC1
	3ismvopAjjp54YdlDnxudcJDH8MlJS+i+2qiqUmREugvPSbXNdpwY/Y0MRalOIyBbKcd6zg==
X-Received: by 2002:a17:906:1007:20b0:c42:6632:a369 with SMTP id
 a640c23a62f3a-c46044f0844mr152320366b.21.1792512070606; Tue, 20 Oct 2026
 09:01:10 -0700 (PDT)
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
 <CAMgjq7BonFtsvHMRYXXToqWBHTzNa52EU9B4ZqD-k-DJ2inQDg@mail.gmail.com>
 <CAGsJ_4yAYMiRoJRLLt9B_+qdMhOFmizDy-PSbQ3jkMxV0zJqPA@mail.gmail.com> <8aa3e14d-6573-4359-919d-a8e9d372032f@linux.dev>
In-Reply-To: <8aa3e14d-6573-4359-919d-a8e9d372032f@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 Oct 2026 00:00:33 +0800
X-Gm-Features: AclHuK9jZ-Plmsy-neTFF6d0Ihg-UjZ1hIhDVLA86eSGaSBJ72aBhXEAavtHBBc
Message-ID: <CAMgjq7DcmsyZUcaLSQeJYWgJ67N=PSSFEo-UpOM=HrHREnZfeg@mail.gmail.com>
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in lru_gen_folio_seq()
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Barry Song <baohua@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:27=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
> On 10/20/2026 4:29 PM, Barry Song wrote:
> > On Tue, Oct 20, 2026 at 4:20=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> >>
> >> On Tue, Oct 20, 2026 at 10:36=E2=80=AFAM Ridong Chen <ridong.chen@linu=
x.dev> wrote:
> >>>
> >>> From: Ridong Chen <chenridong@xiaomi.com>
> >>>
> >>> lru_gen_folio_seq() computes how many generations below max_seq a
> >>> folio should be added to, but stores it in a variable named "gen".
> >>> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
> >>> seq % MAX_NR_GENS, so reusing the name for a relative offset is
> >>> confusing.
> >>>
> >>> The comment table above the code also no longer matches it. It only
> >>> covers the PG_active and the final branch, leaving out the reclaiming
> >>> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
> >>> although lru_gen_folio_seq() never looks at it.
> >>>
> >>> Rename the local variable to "age", redraw the table so that each
> >>> branch maps to the age and seq it produces, and note that the result
> >>> is clamped to min_seq[type].
> >>>
> >>> No functional change.
> >>>
> >>> Assisted-by: LLM
> >>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> >>> ---
> >>>   include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++----------=
---
> >>>   1 file changed, 32 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> >>> index ab69b9930893..a933d8c14558 100644
> >>> --- a/include/linux/mm_inline.h
> >>> +++ b/include/linux/mm_inline.h
> >>> @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(c=
onst struct lruvec *lruvec,
> >>>                                                const struct folio *fo=
lio,
> >>>                                                bool reclaiming)
> >>>   {
> >>> -       int gen;
> >>> +       int age;
> >>>          int type =3D folio_is_file_lru(folio);
> >>>          const struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> >>>
> >>>          /*
> >>> -        * +-----------------------------------+---------------------=
--------------+
> >>> -        * | Accessed through page tables and  | Accessed through fil=
e descriptors |
> >>> -        * | promoted by folio_update_gen()    | and protected by fol=
io_inc_gen()  |
> >>> -        * +-----------------------------------+---------------------=
--------------+
> >>> -        * | PG_active (set while isolated)    |                     =
              |
> >>> -        * +-----------------+-----------------+-----------------+---=
--------------+
> >>> -        * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  L=
RU_REFS_FLAGS |
> >>> -        * +-----------------------------------+---------------------=
--------------+
> >>> -        * |<---------- MIN_NR_GENS ---------->|                     =
              |
> >>> -        * |<---------------------------- MAX_NR_GENS ---------------=
------------->|
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * age        |        1        |        2        |        3 =
       |        4        |
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * seq        |     max_seq     |    max_seq-1    |    max_se=
q-2    |    max_seq-3    |
> >>
> >> I think this comment update is not beneficial, we might have more than
> >> 4 gens in the furture, so hardcoding a number is not a good idea.
> >>
> >>> +        *            +-----------------------------------+----------=
-------------------------+
> >>> +        *            |<---------- MIN_NR_GENS ---------->|          =
                         |
> >>> +        *            |<---------------------------- MAX_NR_GENS ----=
------------------------>|
> >>> +        *            +-----------------------------------+----------=
-------------------------+
> >>> +        *            | Accessed through page tables and  | Accessed =
through file descriptors |
> >>> +        *            | promoted by folio_update_gen()    | and prote=
cted by folio_inc_gen()  |
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * PG_active  |  PG_workingset  | !PG_workingset  |          =
       |                 |
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * reclaiming |                 |                 |          =
       |     always      |
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * can't      |                 |  anon && not in |          =
       |                 |
> >>> +        * evict yet  |                 |  swapcache, or  |          =
       |                 |
> >>> +        *            |                 |  PG_reclaim &&  |          =
       |                 |
> >>> +        *            |                 | dirty/writeback |          =
       |                 |
> >>
> >> I think it's better not to describe too many details in the comment as
> >> it actually easier to just look at the code.
> >>
>
> Fair points.
>
> What confused me about the current table is that it is not clear
> which dimension it is drawn along. The columns are generations, but
> the rows mix access paths (page tables vs. file descriptors) with
> the flags that protect each of them, and some of those, like
> LRU_REFS_FLAGS, are not inputs to lru_gen_folio_seq() at all. So
> when reading it next to the code, it is hard to tell which branch
> puts a folio where.
>
> How about keeping the existing table for the design overview, and
> just adding a short note above it on what "age" means, without
> hardcoding the number of generations, e.g.:
>
>          /*
>           * The folio is added to seq =3D max_seq + 1 - age, so age 1 is
>           * the youngest generation. Ages up to MIN_NR_GENS are active,
>           * and the result is clamped to min_seq[type].
>           */
>
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        * else       |                 |                 |  PG_worki=
ngset  | !PG_workingset  |
> >>> +        *            |                 |                 |       or =
       |       &&        |
> >>> +        *            |                 |                 |  PG_refer=
enced  | !PG_referenced  |
> >>> +        *            +-----------------+-----------------+----------=
-------+-----------------+
> >>> +        *
> >>> +        * The resulting seq is clamped to min_seq[type].
> >>>           */
> >>>          if (folio_test_active(folio))
> >>> -               gen =3D MIN_NR_GENS - folio_test_workingset(folio);
> >>> +               age =3D MIN_NR_GENS - folio_test_workingset(folio);
> >>
> >> That's a very nice rename, the `gen` variable is so confusing to me
> >> for a long time, I thought about renaming it to `gap`, `age` looks
> >> much better. Thanks!
> >
> > Agreed with the rename part. Maybe this doesn't conflict much
> > with MGLRU-FG either. It could be cherry-picked before
> > MGLRU-FG or included as part of the MGLRU-FG series.
> > I'd vote for the latter.
>
> Sounds good to me. Kairui, would you like to pick up the rename, and
> the comment change above if you agree, as part of MGLRU-FG?

Good idea, will do!
