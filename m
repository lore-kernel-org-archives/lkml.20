Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45803BFE3B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198383; cv=none; b=iSsgI5vyEc9BHDiPYb3aeCEWkl9aUrMcwPoS1SHWNVd/Qgzk6GDf+3MebhWQ8PwowKsgg78XRG9KCQuuWwbjNdqOGJrLV74mL+IebzBv3JYUwztyl8zWFBBGsU6TaAf1DcIy6R2EAjORRzxoptSt/iHTvvjVh4z0ISAATFXcbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198383; c=relaxed/simple;
	bh=DC/siQjdpVjjUxFYgWe5Iu2gmALNA2b7IeWGvb8NhIk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DTw/J7Wqamw7ZsRteURmX2I+la7TZqqfcuwqbpPHIm31X1mv2GXFY/Eo3QJYmNPrLJlF1p30fRyMQGR1y6IszWIHs7IIGX6frAoO3MAqYoSiDObbZfKHQQBizX8vhWlBgKliWiVTNWw7tq/xGI8kl6gLxeeG0m5HqYlKUoG0gDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Dj3qaJ8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Dj3qaJ8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FB1F000FF;
	Wed, 23 Sep 2026 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790198377;
	bh=ph4sZt22ESkzgUHNQP4jcUPEFYrI06GxwSPvp+2Uv18=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Dj3qaJ8vVz3tbYuKzWpNoKIDnMaryNKKSoxyHIsS+W+h6TIcoEjSKJRD3V8y/Eqmn
	 XhYpVjFwx40Qe9lJPvahTeuWdHm1VYb/4OMV3V5P56yKoK+vCq0OakJjRxkmE+/bNm
	 CqBNsU46UizbrfNkUde86RE2+JrUxrlUX0foREb0=
Date: Wed, 23 Sep 2026 14:19:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mika =?ISO-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, David
 Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Leon
 Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>, Matthew Brost
 <matthew.brost@intel.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 00/12] [PATCH v14 00/12] migrate on fault for device
 pages
Message-Id: <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
In-Reply-To: <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
	<20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
	<5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2026 08:29:34 +0300 Mika Penttil=E4 <mpenttil@redhat.com> wr=
ote:

>=20
> >> migration). It is also tricky to code correctly. One page table walk
> >> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
> >>
> >> We should be able to walk the page table once, faulting
> >> pages in as required and replacing them with migration entries if
> >> requested.
> > Sounds sensible.
> >
> >> Tested in X86-64 VM with HMM test device, passing the selftests.
> >> For performance, the migrate throughput tests from the selftests
> >> show similar numbers (within error margin) as unmodified kernel.
> > But no performance benefits are demonstrated?
>=20
> There are no performance regressions for current tests.
> Real benefits come if want to do migrate on fault.
> For migrate on fault today missing pages are collected as not-present and
> the caller has to fault them and re-run migrate_vma_setup(); folding=20
> HMM_PFN_REQ_FAULT into the collecting walk removes that extra
> fault+retry round-trip, dropping two page table walks. Page table walks
> are not cheap. Not to mention simplified implementation for driver.
> Also, the vma looked up as part of the walk is readily available for
> migration, eliminating the need for explicit vma lookup - one more
> performance benefit. Net effect two saved page table walks and
> one vma lookup.

It certainly sounds that this series will result in performance
improvements, but have those improvements been quantified?

> This series also addresses the vanished/reborn page table while
> collecting problem which can crash current implementation.

Oh.  I didn't get that message from the v14 changelogs, and crashes in
the current implementation are not what we want.  In fact, addressing
those is more important than speeding things up.

Under what circumstances to these crashes occur?  Can/should we we fix
those in a minimal -stable backportable fashion before moving on to speedup=
s?
