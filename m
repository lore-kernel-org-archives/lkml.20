Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C13515FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605383; cv=none; b=HVux3YO2zfS3mhPBcX5+hsGhxIbJgrhJCSfwdWkpzGwYMPlH1s+6dRLkZ8bY1voGAiRE8i99jGQq7md9coAXzhS6sRtgj15UOO/Fezd/MeWOsD+j1B5UYSq931zoTE3d0eg/73xCqNCexuvsvthIvBKgvhfp/hjMEJ3shub/i1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605383; c=relaxed/simple;
	bh=YkKAGS01h7B5iDGqF+2Ub9gtMNgmQ9YmrG/yc4k/rkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8IdGTBpS2ck57OHy5/xzhordapE2mYSmjztsPoJ7XO6w3afsarV8b4Cywx1JslfC2lPZ82T0sKWQPWX7Eq22EdNNn9tPiVCsCECIkAd6N0BiCZNZTsUhK8CbBOewfCDTiOrvOTX3Xm1IsLDz36giat7OAJIJTu4llNcfpBekP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxKP0rvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxKP0rvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEF51F00ADF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788605381;
	bh=RHAA100hBxoZ3L71lKyk+AmwOPI0P6UvpAuNgR702wU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GxKP0rvUTM1WVaoYWsYbGz9meyuaamSxHMeFLXYm78ZWYmU4OAavJs0kDNE2HR3X+
	 2/nCp8lZPKTgJ7oF64mYgppRgHVvRxi6mY6J9aum5YnBocruHheq2eHYdHg2+jcntw
	 kYHnJRxU1O8oFW9HZD8vh+30sr5Ns5iMbPzLcJ50c2k+vCG6NItKSPPacRaUqvGmRj
	 KQ6uWFyvqLekfQIbbcdJC3VZ/s2HlR6NHKL28hvK2gJoGW+FcAZHbKA+S4uqvGfjsA
	 teB1/pi3kfIfebNqTOHiq0WMZJ8memmBjczuLnxAarBjV33jXEihuQkvk+xvKar3yM
	 gfZFGv1aR7X5g==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cd96389efso25554286d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZuLfjzjbvp1lJ3RkH38kBuEFJ7VrB0KMZi/vpmwKSAy6GJWdmwqJzM2oJZn/kF8tAkKf7TzeNazf2V4w=@vger.kernel.org
X-Gm-Message-State: AFuF++mumnQsCfJJbScB8j/UQ/yYGdSFjSlmlkc3EwQl3q8PtXrxmr9d
	kJTcZAWHR2SjGCCqwHLceCnEb2HmhTezgPDQOIk3fjEyQVGgMOrjrCe5mPB4wlRlVMFYzPF67/Q
	zk25YW+IDxx6sAlp9jJmJTqPg6/Lp94M=
X-Received: by 2002:a05:620a:27c4:b0:92b:5408:b6be with SMTP id
 af79cd13be357-9398037370amr1199846885a.23.1788605380850; Sat, 05 Sep 2026
 03:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-6-dev.jain@arm.com>
 <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 5 Sep 2026 18:49:29 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xmeEQWoPsda2qfLh=E=tC5TgNZChTYENu4f+zPqibf-w@mail.gmail.com>
X-Gm-Features: AcwNN1VVa-rvJYwwVPRxR_MMRDJhw3RmKWC3O0AZSlLS_T3XLrO55yM2YEBtp44
Message-ID: <CAGsJ_4xmeEQWoPsda2qfLh=E=tC5TgNZChTYENu4f+zPqibf-w@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm/internal: rename swap offset helpers to
 softleaf offset
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 6:42=E2=80=AFPM Barry Song <baohua@kernel.org> wrote=
:
>
> On Tue, Sep 1, 2026 at 1:44=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
> >
> > In preparation for adding a helper to set softleaf ptes in one go,
> > generalize the swap entry helpers shifting the swap offset by delta,
> > for softleaves.
> >
> > Note that the soft-dirty bit, exclusive bit and uffd bit preservation
> > will still work for non-swap softleaves, since a softleaf entry is
> > constructed out of a type and offset, and those bits are ahead of
> > the soft-dirty, exclusive and uffd bits.
> >
> > For example, for a migration entry, pte_swp_exclusive() will return
> > false, as the exclusivity is encoded in the type itself
> > (SOFTLEAF_MIGRATION_READ_EXCLUSIVE).
>
> I don't quite understand why you mention this. Is anyone calling
> `pte_swp_exclusive()` on a migration entry? Shouldn't it only be called
> when `softleaf_is_swap()` is true?

Is it the rename from `pte_move_swp_offset()` to
`pte_move_softleaf_offset()` here that is causing this semantic confusion?

static inline pte_t pte_move_swp_offset(pte_t pte, long delta)
{
        const softleaf_t entry =3D softleaf_from_pte(pte);
        pte_t new =3D __swp_entry_to_pte(__swp_entry(swp_type(entry),
                                                   (swp_offset(entry)
+ delta)));

        if (pte_swp_soft_dirty(pte))
                new =3D pte_swp_mksoft_dirty(new);
        if (pte_swp_exclusive(pte))
                new =3D pte_swp_mkexclusive(new);
        if (pte_swp_uffd(pte))
                new =3D pte_swp_mkuffd(new);

        return new;
}

If so, I wonder if it would be better not to rely on the implicit
assumption that the softleaf type and offset fields are laid out before
the soft-dirty, exclusive, and uffd bits. Could we make this explicit
in the code?
