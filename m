Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF915218AA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905830; cv=none; b=hIjO6iyRHjh5yly6iZC5TrB65u8ItvqEbwPk9zhZKa/M6EIxe8kgBFsBQEF7IXcv9t3O5sEqLq/FX6Ast0radJstyFU6bIqB5b5z8kfaYwI3HngXi71MbnCX7NAJhUn1GzTAWaKgW37bHZftpCpH5B1e8UaQfXaNHkbaPd9W1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905830; c=relaxed/simple;
	bh=QYvG7iTN6X/wcWZUdqZr19eVWyZZhBJ5WBory4f4au8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKaZMZK79LkEicO79qSoaevQHX0u2hxQgj3w7Wws96lP3AWKjsmX8Co+3qweBrjsZwxzj93ZunHcTKuj0blkzO77W3U/Qy6LrJB2N9iZZiG9gZdw0nPl1YGgXColkJ8Qw6I/QS2S/o8iVg/WKCtgCBoVKbVjgaB0Cyz659Zj+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2vfh155; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2vfh155"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA861F008A4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905828;
	bh=QYvG7iTN6X/wcWZUdqZr19eVWyZZhBJ5WBory4f4au8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e2vfh155/VPsHaWZgcZhQogA6+0Ijpf92000/ox/Lbw56lN7A4SVNn/789Geb12Ur
	 H0facF2OKtc5Q0ncRS0hdjV15KANCuPbQCLcBI5Wq/pH2lhvbflXcVZIhZMxjXJK37
	 MDEI3V67nDeThfG2sFh6v1S7JZidQuEREhoCFMBozusmOCEpUMtcR6TJpDIr0Rt7ac
	 Cr/Tqe0gdCAt6L0zWiFVA/DkfRb6caekRbfSHEAfAPa/fzBw9fXm0a6q56s+CHuQWN
	 34JBaBP3KAuObrD02sgyzg7XpBXkshrvd2FZ5gLxGOsqsctzDPDbheUlJFQz9sqeIs
	 ZzY8EBvv21nlg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e5d08214dso6179666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVxQndWiqWbuCnmsC7dyMX6ajfJycXQ74O5/h5TlcDlSF2Jp0mWe3aCSrSIFIUQOj8D+3rM/Qls3SybrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFiRvwpAS9qzWqckECP/IJRWGs1r+9ORLA0WHH4I3HDIN3y4i0
	eU91z0MBMt4Ce7EzA8zEWF060OpjTELKTZ2AZGORxUjEgPIxBl39wL+eKmz/FEk5VOYWFLbj0qm
	G2hYN18l9VlgYWFGt+GiU5eZkFDrVoqA=
X-Received: by 2002:a17:907:7246:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c31a9d56575mr1180906166b.26.1791905827546; Tue, 13 Oct 2026
 08:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
 <20261013152553.39287-2-itazur@amazon.com>
In-Reply-To: <20261013152553.39287-2-itazur@amazon.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 13 Oct 2026 08:36:54 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPOkuRGv0X=nBbAzTUjUyaB7zAJLUigetSXEVPxWpyGxw@mail.gmail.com>
X-Gm-Features: AclHuK-W6f4ZhQh9ueCOMp1_eyaIikFGHa4dIFgdih2WgfTC8_TU_5ph5Rmf9m0
Message-ID: <CAO9r8zPOkuRGv0X=nBbAzTUjUyaB7zAJLUigetSXEVPxWpyGxw@mail.gmail.com>
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
	Ackerley Tng <ackerleytng@google.com>, Takahiro Itazuri <zulinx86@gmail.com>, cc-open-source@amazon.com, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Gregory Price <gourry@gourry.net>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:26=E2=80=AFAM Takahiro Itazuri <itazur@amazon.com=
> wrote:
>
> On Thu, 3 Sep 2026 07:06:02 -0700, Yosry Ahmed <yosry@kernel.org> wrote:
> > > If that work is not already underway,
> > > I would like to respin the AS_NO_DIRECT_MAP introduction and secretme=
m
> > > adoption as a standalone MM series, separate from ALLOC_UNMAPPED and
> > > mermap.
> [...]
> > Perhaps wait until I send the new version, then we can discuss if we
> > want to split it based on how the feedback looks like. Does this work
> > for you?
>
> Following up on this with an update. Yosry let me know off-list that
> ALLOC_UNMAPPED is on hold for now (quoted with permission):
>
> > I wanted to give you an update. I was working on v4 of the
> > ALLOC_UNMAPPED series while our team was simultaneously working on
> > integrating that design without internal ASI implementation.
> > Unfortunately, there were multiple complications with that
> > integration, and we will be holding off on sending new versions of the
> > ALLOC_UNMAPPED series until we have higher confidence that this
> > approach will meet ASI's requirements (ideally in a production
> > experiment).
>
> Since the integration with Google's internal ASI implementation needs
> more time, Yosry also agreed that I pick up the AS_NO_DIRECT_MAP work
> for guest_memfd, separate from ALLOC_UNMAPPED. Here is how I plan to
> proceed. Feedback is very welcome, especially from Sean on section 2
> below.

Thanks for the update, Takahrio!

> 3. ALLOC_UNMAPPED and the mermap
>
> AS_NO_DIRECT_MAP itself works without them, by zapping the direct map
> of each folio. However, guest_memfd will eventually need a temporary
> kernel mapping to populate guest memory via write() [2], because
> folios are already unmapped once they are added to the page cache.
> The cost of TLB flushes and direct map fragmentation also matters for
> performance, so I'd like to keep discussing these with folks
> upstream, building on the direct map fragmentation discussion that
> Kevin led at LPC [3].

FWIW, I think the mermap can still be used without ALLOC_UNMAPPED, and
I did have a newer version of the x86 patches repurposing the LDT area
for the mermap, and simplifying the mermap implementation a bit. I can
share them privately if you want to take a look.
