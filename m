Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B481A681B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816822; cv=none; b=suQQEryMNBZ8aHzDSb906437LLChwjpML2y4eZ5/c5c/jvH+MKXMUwRKvd9PzxSy8kuI1aegWvchXm4yQFDxdU0D9iyiwKejMTbu5RV+tv/NzU1YwP5a4jtH/BspdUjtoq0E5veODeLtRTXINH/QZea7SWNVt1yW23Sqvxdmo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816822; c=relaxed/simple;
	bh=U9NNV9TQzVYO4DdsqZt1E6CrBOsMOvqRgWqKW3d54aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmuQPLNajSfT1eAroW99cPa0uzdHoMbhuqEGZz5aa9MsL9rjdsnHQRDBpgIPMVgebTc9/+vO7u5Tpzl4mBgDjOGKgqRUZa+jqkf6oTpKSfFAJ6w3AU+b1qgH8/MTLkZadTIuW2U5kaSzc3kU45n+akU3mEtZkPTn0GKTbhoBBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOVRiolU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOVRiolU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1541F00A3F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788816821;
	bh=glAq2A+LGqvZtGRjj6Vu76wV2nQ2vOLPDIiLnUABgOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lOVRiolUuJdBzdns21YNoLq99TXgsNsteg1DQ5906S5QpffjdDRQocBGaW+h7tWqH
	 IxCKdHubpL1oWVBW+C/a/JqhLHWGkMs/IUmx6GfhacRf1Q8mffLkeSGxtIp2oGFbid
	 hk1A4/1zdoUWVltg+bEURpJWWI35evHxTMltztyVVB4fuiFPUodfTVLQNn6/RzDG4E
	 dCKtEJEogMo2GRnip7ZBUKOeymrOctOFaGHYoR5t9jGQVbxJgBeBCB+Lkr3E2csErH
	 wf8kE3+qBr+ZpVTS0xfU+fQ7UeuFIBwN1bZos7RuU9UA9wlJwJv3OaPqUudWm851fU
	 +PyAleap8Hhig==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd4631090so51591056d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0VTU+Ui9MbIr0mfcC9wYB53nOKG3TLC5f4YA1pGrNRk8FOetH2De/4fmA7qDX7Lm4Yy/SIOSjArq7nQs=@vger.kernel.org
X-Gm-Message-State: AFuF++ljq8EB3yQUj2YHjEdRdq18ncITfC2ryoobaWG5mPzkJ3GpkQfl
	FboGavkhO49aQq8JTeLD9U1pD+ovHLwky20FVXc9LDwOPb+QfQ2pOwKa/UACiCN+9fBcsGV8dl3
	C0l18MLVkfbK5uP5m1ntRZ75JaCK8BZQ=
X-Received: by 2002:a05:6214:1c0c:b0:8ef:1c10:65fa with SMTP id
 6a1803df08f44-9103458aa2amr276801976d6.8.1788816820552; Mon, 07 Sep 2026
 14:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-6-dev.jain@arm.com>
 <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com> <12efdc7f-ff82-412b-b79d-bff211d34218@arm.com>
In-Reply-To: <12efdc7f-ff82-412b-b79d-bff211d34218@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 05:33:27 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y7V40CnTTh=84=Ek6T3tPTyLXsUtgO81O1zyZpmQcbug@mail.gmail.com>
X-Gm-Features: AcwNN1W7wBndyQG2UgjXdfAU5SOq--TgDgMkAQm3YP67ZZN3rfn6CHCdxQXyE8c
Message-ID: <CAGsJ_4y7V40CnTTh=84=Ek6T3tPTyLXsUtgO81O1zyZpmQcbug@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 1:38=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 05/09/26 4:12 pm, Barry Song wrote:
> > On Tue, Sep 1, 2026 at 1:44=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrot=
e:
> >>
> >> In preparation for adding a helper to set softleaf ptes in one go,
> >> generalize the swap entry helpers shifting the swap offset by delta,
> >> for softleaves.
> >>
> >> Note that the soft-dirty bit, exclusive bit and uffd bit preservation
> >> will still work for non-swap softleaves, since a softleaf entry is
> >> constructed out of a type and offset, and those bits are ahead of
> >> the soft-dirty, exclusive and uffd bits.
> >>
> >> For example, for a migration entry, pte_swp_exclusive() will return
> >> false, as the exclusivity is encoded in the type itself
> >> (SOFTLEAF_MIGRATION_READ_EXCLUSIVE).
> >
> > I don't quite understand why you mention this. Is anyone calling
> > `pte_swp_exclusive()` on a migration entry? Shouldn't it only be called
> > when `softleaf_is_swap()` is true?
>
> You are right. I just wanted to emphasize the second paragraph - that the
> pte_move_swp_offset will also work for softleaf entries. But I think
> the third para confuses more, I'll drop it.

I would rather interpret this as meaning that
`pte_move_softleaf_offset` will also work for swap softleafs,
since `pte_move_softleaf_offset` will call some pure-swap
functions=EF=BC=9F

Would it be possible to use `if (softleaf_is_swap())` for
these cases to make the intent clearer? or we can
keep both pte_move_softleaf_offset and pte_move_swap_offset?

As `pte_move_softleaf_offset()` is getting a bit weird now,
a generic softleaf function has a lot of swap-specific code in it:

static inline pte_t pte_move_softleaf_offset(pte_t pte, long delta)
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

Am I missing something here?

>
> >
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
>
> Thanks.
>
>
> >
> >> ---
> >>  mm/internal.h | 29 +++++++++++++++--------------
> >>  mm/memory.c   |  4 ++--
> >>  2 files changed, 17 insertions(+), 16 deletions(-)
> >>
> > [...]
> >>
> >>  /**
> >> @@ -523,7 +524,7 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
> >>   */
> >>  static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t=
 pte)
> >>  {
> >
> > We might find a user for this in the future, in which case we might
> > want to rename `swap_pte_batch()` to `swap_softleaf_batch()`?
>
> That is what is being done here:
> https://lore.kernel.org/all/20260813-migrate-rmap-batch-v2-1-3c5424c555c7=
@amd.com/
>
> I don't have a strong opinion, I can also generalize this right now.

I don't know how you and Shivank are collaborating,
since you're both changing the same thing at the same time :-)

Hopefully, we can get one of yours into mm-new first,
and the other one can find a way to resolve the conflicts.

>
>
> >
> >> -       pte_t expected_pte =3D pte_next_swp_offset(pte);
> >> +       pte_t expected_pte =3D pte_next_softleaf_offset(pte);
> >

Best Regards
Barry
