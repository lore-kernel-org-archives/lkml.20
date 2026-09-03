Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211494AE12E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444381; cv=none; b=V1P7mY73xhb+/ktQXui1OIhUFLxYmYewvL3FV9BXHuiIW+xOEO37vROUYtUTG1RJet66VEZbaPxH+svnp4z2BltZmQTQYt2kR479vVTb6RI8wzf78gK1T57Mr41zXEaehtTawK0NLd9UcC6NC9dex8ZCmzpkCgp5wtD2AvO3v4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444381; c=relaxed/simple;
	bh=wd8NoMhaS+dG3/aVXJkECCuK1QJVgKv2k75i6W52E+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nY6Y1l9U50ZRK9txqN8A6QbKB87yzQx46Sp0P3CQSjlvNeMux+NzBp63nAeGdM/Pwqs9cAr5XHWjXcwT6AQ3mAJbfHsSx9FtYxWfXk/fG33ynbrQaIM6ZNlKkdZkLm5Skdc6KF+yQfioK47Bvyly8CD7V4K3pZXGTEOpOy0DiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ea9Ee6Sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ea9Ee6Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBBE1F00AC4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444375;
	bh=KWSSDYXbxafLtJPXW3Njj6zXDgKYuFr+JGnh2XXB+W0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ea9Ee6SapoZLH6Zs7KC2ZuW0jgAiFh3EBaz/GnCvmEvWX25JJHnb3zoEauFUpsQkF
	 TptAbQ1TkGcu1ZhZuQklfJe+hdga4AiaZbP/cD2s9C7ZspKuAb7oqm2pg2Y8Lrketf
	 Dd0IPZhB8D/UwLAtaKSCloab06EJzFXIVz1ANnOHEn+yrMCsYxr1kuZcJaykr3fns4
	 E29BTNB1+F6AZ89V4p0XS5H7Mi5oO1dzfrs3orGcVzvtRdcdKykKlNJyXIk7Z3Ziv5
	 DASa+9HRispx66kxLd3WgAf1L3uenuzBBo/IN+mkQp7TO83X7StYqfj7skPuSYdpwf
	 iNqcn/Gs5qL/w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso709209a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySGZrrLa01kVatncxTkxFQZbVN8TYfjyVQbehto9g6YFwwx3dFbU8PiVLagu/dtKGiZLOeX7AyX1AWXPA=@vger.kernel.org
X-Gm-Message-State: AFuF++l800eFC0YKV382jC5+Ibau3M8hXzXosXqhH0a3CJPHCOR2ajeK
	TnxWJXhVPTOGIaHYspM2zDVdJ3f3UN4hwwYEy0KRUjFifhUsqHGZCB8C2hCQudPHLheBoH5enPx
	ev9dnJf43F/7XXNN7NfxZSwVOTcezuhM=
X-Received: by 2002:a17:907:3e91:b0:c25:192:99ee with SMTP id
 a640c23a62f3a-c25d5509226mr871430666b.19.1788444374630; Thu, 03 Sep 2026
 07:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zNJ3mSRf5YyRQYYW-eM2eiFvQMXW4Rh0cT=31jsKZpuSQ@mail.gmail.com>
 <20260903072625.62694-2-itazur@amazon.com>
In-Reply-To: <20260903072625.62694-2-itazur@amazon.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 3 Sep 2026 07:06:02 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
X-Gm-Features: AcwNN1WucjHD1N3a6o32XyIZFyKC9j2svL8NXQIbhxUtIFR94fN3vSg-L59gUkA
Message-ID: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/26] mm: introduce AS_NO_DIRECT_MAP
To: Takahiro Itazuri <itazur@amazon.com>
Cc: Sean Christopherson <seanjc@google.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	rientjes@google.com, Roy Patrick <patrick.roy@linux.dev>, 
	Andy Lutomirski <luto@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Thomas Gleixner <tglx@kernel.org>, Patrick Bellasi <derkling@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>, 
	Ackerley Tng <ackerleytng@google.com>, Takahiro Itazuri <zulinx86@gmail.com>, cc-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:27=E2=80=AFAM Takahiro Itazuri <itazur@amazon.com=
> wrote:
>
> Some of you on the KVM side already know this, but for those on the MM
> side who may not, I am taking over the guest_memfd direct-map removal
> series.  I have finally caught up with this thread, and I sincerely
> apologize for joining so late; other commitments kept me from catching
> up sooner.

Hi Takahiro!

>
> On Fri, 7 Aug 2026 15:48:24 -0700, Yosry Ahmed <yosry@kernel.org> wrote:
> > > I'm not ok punting on that, i.e. whatever we come up with needs to la=
nd alongside
> > > AS_NO_DIRECT_MAP, or at least before guest_memfd tries to use AS_NO_D=
IRECT_MAP.
> >
> > Yup, I meant the latter.
> >
> > > The only way KVM can use AS_NO_DIRECT_MAP without GUP is with a massi=
ve list of
> > > caveats and addendums on things the VMM and guest can't do.  I'm not =
ok merging
> > > guest_memfd support for AS_NO_DIRECT_MAP with such a list.
> >
> > This series is not adding the support in guest_memfd, just adding the
> > generic AS_NO_DIRECT_MAP and using it for secretmem. Followup work is
> > needed to plumb it for guest_memfd anyway, and I am proposing that we
> > also punt the GUP story to that (when we have an actual user).
>
> My reading of the discussion is that the generic AS_NO_DIRECT_MAP support
> can land with GUP rejecting such mappings, provided that a generic GUP-li=
ke
> access mechanism is in place before guest_memfd starts using
> AS_NO_DIRECT_MAP.

That's my understanding as well.

> As far as I know, Brendan is no longer at Google.  I do not know whether
> he plans to continue the ALLOC_UNMAPPED / mermap work, or whether someone
> else at Google has taken it over.

I am currently working on a new version of the ALLOC_UNMAPPED series,
I am hoping to send something out soon.

> If that work is not already underway,
> I would like to respin the AS_NO_DIRECT_MAP introduction and secretmem
> adoption as a standalone MM series, separate from ALLOC_UNMAPPED and
> mermap.  The AS_NO_DIRECT_MAP changes originated in the guest_memfd
> direct-map removal series, and splitting the MM and KVM parts was already
> requested during review.
>
> The proposed MM series would include:
>
>   - the folio direct-map helpers;
>   - the AS_NO_DIRECT_MAP flag and filemap lifecycle;
>   - the current GUP and build-ID rejections, while keeping the mlock
>     check specific to secretmem; and
>   - the secretmem conversion.
>
> I would leave ALLOC_UNMAPPED, freetypes, mermap, the allocator fast path,
> and the KVM / guest_memfd integration out of that series.  This would not
> change the requirement discussed by Sean and Yosry above: the GUP-like
> access problem would still need to be resolved before enabling
> AS_NO_DIRECT_MAP for guest_memfd.
>
> Please let me know if this work is already being continued; if not, does
> the standalone MM series described above sound reasonable?

Perhaps wait until I send the new version, then we can discuss if we
want to split it based on how the feedback looks like. Does this work
for you?
