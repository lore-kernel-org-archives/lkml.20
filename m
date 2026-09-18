Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D210F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775293; cv=none; b=aysEudAwWLgJos1qOl5Z2nQ80YbMw+HBoEFBtaxJWmsD00Z9bvV8fu8RJK6VqISNMLSfOdOQcwwz7fmmlTQKLEB/BBdCAer3jlGuwsCs8HZ38JTM++lRTHhuDYxsikU3eUgvwiIzYY5sJdVRGvedAZt7XOgnuxmqvoLI8R4fI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775293; c=relaxed/simple;
	bh=Nz2zbIFKT6HwXKpev+qm4lwffznJtUuxnKuoUkXJ/68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9vz9dRI/+HJVuu7ZwR+D2duKLL2uNzfBp5ZnEv3SmMTLYe+Umu0L8MANOebSrlO4MJctUWl3WwavCLlDmMxRbhhZ/+SUn2CzjMgr+s27PP7zyjce2tfKSttjXXY7EsXNPge8Rio4Nq68VmBpgCQ26fSCzpmPfg5pg37tV+p8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eODMcJmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eODMcJmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD131F008A3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789775292;
	bh=Nz2zbIFKT6HwXKpev+qm4lwffznJtUuxnKuoUkXJ/68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eODMcJmZcdrvuA5gqsshc+HMteEj1vEDENmckwu2MMV1F2YrR5ibGNtUZ6dx/TVvA
	 qJgk/SxBehn91SZDLpVX5d2A3fOc4WqwY6DG0oOwbLzOD2tjyzVvH/XCx299e8Vsyb
	 8YC+BJliec//cnvKqcZGzFfayspgd45GtEH40TZgjKSAM7W3UUHJRndQQdkiZEgxkV
	 17GtmyIx7k7uSSrGkWF48LBkDG3czB7AKcX9oTZBSBdvV+KqIKeKEmuFbzOjOTr/pv
	 Rjtshr/EA22RpdyRVwdRUpdoPtnxPBQGlJ8i7qr6JtCfA6Y16hOvSCorddF+bZxQk6
	 nyjdMyPOk18HA==
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2a8c29c4so139261385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:48:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRXC4skJF9RrHWR+bIRJvT296hktdlpiT9UlF5D9yreX7tA1+dcimvbv3Qe9MZeGPC1dnm0yTucmgpOrw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkkU+2FUTiSlwOtmzPDZ+v5uE/oNuJX6k1xunxm8IriCDCSLz9
	FvN/JY0F16Ukc6P6BUdMBX0B1hZ6a168slUbJ6qO22c78rO9/AvpbdtWbjDAZqnCIJ2jeCJYmPg
	8ixKAfMKzs0zCUFYTe26Pyxan/sdt1FY=
X-Received: by 2002:a05:620a:1726:b0:939:8ecf:6025 with SMTP id
 af79cd13be357-93bdc6c8013mr657417785a.20.1789775292023; Fri, 18 Sep 2026
 16:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1ba175c-ceb2-4e00-b233-d51dd8a2f4cb@kernel.org> <20260918182857.571-1-aa9736195201@gmail.com>
In-Reply-To: <20260918182857.571-1-aa9736195201@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 19 Sep 2026 07:48:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wTYLds56=iyra5FKmgnNACN9QKJH-XJ=q62G7fMvd9iA@mail.gmail.com>
X-Gm-Features: AcwNN1VT6LIguAvtBHIDarKZ10TRnBtsk1i4q3rbcjFBRG5cMHV51umUJdB4BeE
Message-ID: <CAGsJ_4wTYLds56=iyra5FKmgnNACN9QKJH-XJ=q62G7fMvd9iA@mail.gmail.com>
Subject: Re: [PATCH] mm/memory: reuse the whole exclusive large folio on a
 write fault
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 2:29=E2=80=AFAM Yuan-Hao Hsu <aa9736195201@gmail.co=
m> wrote:
>
> On Fri, 18 Sep 2026 14:14:11 +0200, David Hildenbrand (Arm) wrote:
>
> > There were previous discussions on this, in particular around how much
> > we should actually try operating around the target PTE.
>
> Yes, Barry's RFC from 2024 and your replies to it, where you were fine
> with contpte granularity and not convinced about anything bigger. That
> is why the description has the numbers for both: capped to 16 PTEs, the
> 1M and 2M cases take 5.4 ms instead of 3.9 ms, and the only pattern where

Hi Yuan-Hao,

I'm fine with your follow-up work, but I'd appreciate it if you could
mention the previous work and include the link in your changelog, along
with an explanation of how you address David's concerns.

> the cap wins is one store per 2M. If you would rather start with the
> contpte-sized version, that is a two-line change and I can send that
> version instead.

I think a major concern is that we may spend too much time scanning
PTEs to determine whether we can batch them. If we don't support
CONT-PTE, we may simply scan fewer PTEs; if we do support CONT-PTE, we
may end up scanning more PTEs. So we need to show that the scanning
cost is controlled and explain how it is bounded.

>
> > How did you use the LLM for coming up with this patch + description?
>
> I did the initial investigation and made the design decisions myself.
> Once I had a clear idea of the approach and the overall structure, I used
> an LLM to help with parts of the implementation and the test
> programs. I also used it to help with drafting the commit message.
>
> Before sending the patch, I went through it line by line and checked the
> test results and measurements to make sure they matched what the code was
> actually doing and that there were no obvious issues.

I also personally feel that both the changelog and the code are too
long to read. Could we somehow split the changes into smaller pieces
and describe how each of those concerns is addressed at a finer
granularity?

>
> Lorenzo, for your bot's question: the reuse decision in
> wp_can_reuse_anon_folio() is per folio. The patch applies it to the other
> PTEs of the folio within the same VMA and page table using the mprotect
> helpers (can_change_pte_writable() and modify_prot_*_ptes()), so
> soft-dirty, uffd-wp and NUMA hinting PTEs are handled the way mprotect()
> handles them, and the PTE that faulted is finished by wp_page_reuse() as
> before.
>
> The part I spent most of the time on was the measurements, including the
> cases where it does not help.
>

Best Regards
Barry
