Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D2A3346BE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130449; cv=none; b=OeaSXdrQIstQGiChxpJQTTH4WESd5XNKhMjb3ZCXIYpu3X3SnbWGCbVODemL3YV3s8lnz5S8AYmBRrrVhNLQAnaDRE+3Iqz6mZIwLRc1YMrF845PRdNCSsXKpKGYUEjm88veXbwsVdHolYWq5pP6i6NFNf6LC3KCkVOuwIgu5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130449; c=relaxed/simple;
	bh=Ccj5oph/YAAq1zVVx1IQz7KWwejU10kRjyyyCcU0flw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SmHpxhSd+1H17/N1sYWs++V216dHbdUVT+6uBLoVxMw6YfkZ7yjftQyPaK67rH+Uq7ncjlwysUsGHWfHg9YLd8KgRGTu/iporgFBJzvZ0pnzjXJw45xsf37tTh0/1TUQqD1Ydq8+LqLnxt3Z1Juzr7YZEUR5ddWW/ohmz5x1Dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dqYl3tM1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dqYl3tM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D312D1F000FF;
	Wed, 23 Sep 2026 02:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790130447;
	bh=9n316uGecMdSl/OJIOHSGu5fcSAJzdq/4iqnK+s/yDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dqYl3tM1PxcISjSSdtgTTqJjrirf3epW9pDLwiuQdqVC4Zqsi/WBXp3y/B9nFxTMQ
	 vzUFv4T5o2ZTZy9ls1cEVG7Mokxmt21cH9zUM+7Gsow7VY3b9bkrjTcsNvugC3Ktnj
	 LsXDZADWi5gTTWcK36SOI4Mso2AcMelK6H+Op9u4=
Date: Tue, 22 Sep 2026 19:27:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: mpenttil@redhat.com
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
Message-Id: <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sep 2026 08:34:09 +0300 mpenttil@redhat.com wrote:

> From: Mika Penttil=E4 <mpenttil@redhat.com>
>=20
> Currently, the way device page faulting and migration works
> is not optimal, if you want to do both fault handling and
> migration at once.
>=20
> Being able to migrate not present pages (or pages mapped with incorrect
> permissions, eg. COW) to the GPU requires doing either of the
> following sequences:
>=20
> 1. hmm_range_fault() - fault in non-present pages with correct permission=
s, etc.
> 2. migrate_vma_*() - migrate the pages
>=20
> Or:
>=20
> 1. migrate_vma_*() - migrate present pages
> 2. If non-present pages detected by migrate_vma_*():
>    a) call hmm_range_fault() to fault pages in
>    b) call migrate_vma_*() again to migrate now present pages
>=20
> The problem with the first sequence is that you always have to do two
> page walks even when most of the time the pages are present or zero page
> mappings so the common case takes a performance hit.
>=20
> The second sequence is better for the common case, but far worse if
> pages aren't present because now you have to walk the page tables three
> times (once to find the page is not present, once so hmm_range_fault()
> can find a non-present page to fault in and once again to setup the
> migration). It is also tricky to code correctly. One page table walk
> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>=20
> We should be able to walk the page table once, faulting
> pages in as required and replacing them with migration entries if
> requested.

Sounds sensible.

> Tested in X86-64 VM with HMM test device, passing the selftests.
> For performance, the migrate throughput tests from the selftests
> show similar numbers (within error margin) as unmodified kernel.

But no performance benefits are demonstrated?


