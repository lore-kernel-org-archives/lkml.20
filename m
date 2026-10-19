Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306B3F99E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417076; cv=none; b=vCAiwniKQpPMNvJoLCg83MUPxfgg+30QCa5Cz+4oGmyEl4Qhv3q3IxOeHpuUPYv6AGOwLlyX5aOxPSOK0X3Pt9SRxYG00V1CCRSOKA4MWPVbGfuwPFYZdOjoPJ7zqUMwMZHNzdtwp8b7lb30mdEuKpjjLcrXZA4Wj3RC+UEtDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417076; c=relaxed/simple;
	bh=65IJJFbhths20avgZNJD2q94gK8PBA8MJtV9YGwO3DA=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=tswbzjifNTXT2g1b1KngLMpXwN2mQ7grldQqA5VzjhI4/jeUZ+JovRVUgzAg4LFANl8JrPfxY7ayf4NXua25V19ON7OGecc/0KzwVHlUnWP3LSL5TjmDL4im5l2WUDiwAP13/qp2GiKa0w1CUNN52QbAYSNb8nhq6zc664/Z2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IwouMnhI; arc=none smtp.client-ip=95.215.58.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IwouMnhI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=65IJJFbhths20avgZNJD2q94gK8PBA8MJtV9YGwO3DA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792417071; v=1; x=1793021871;
 b=IwouMnhIvsMfHWhsHXue94krguhPeVLrmzGYjJyBT2cWHCjJeZbj/E5oGSdcME3NYL4RzWwg
 eEHBExmPatj0OQT2KeVdPtYzc0zOU1FM7Z7qane7XElA8QJtbKqzWB0zHCSjt4qWGEIQsH9AHtS
 vlC0EZSvazGVr/sXKA9OJc28=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 78fcc01bb5219cf8;
	Mon, 19 Oct 2026 13:37:51 +0000
X-Mizu-Trace-ID: 78fcc01bb5219cf8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] MAINTAINERS: add an entry for MEMORY MANAGEMENT - MEMORY MAP
Date: Mon, 19 Oct 2026 21:37:32 +0800
Message-Id: <E0A71C12-C69D-46D5-8F9E-3DEF4097424D@linux.dev>
References: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>
In-Reply-To: <20261019-memmap-maint-v1-1-80850871d0cc@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: iPad Mail (24A446)



> On Oct 19, 2026, at 19:34, Mike Rapoport (Microsoft) <rppt@kernel.org> wro=
te:
>=20
> =EF=BB=BFSplit out files related to SPARSE and SPARSE_VMEMMAP management f=
rom
> MEMORY MANAGEMENT - CORE into a dedicated entry.
>=20
> Also include architecture specific sparsemem.h headers, pfn_to_page() and
> page_to_pfn() conversions and Documentation/mm/memory-model.rst.
>=20
> Muchun, who did a lot of work cleaning up SPARSE_VMEMMAP and extending
> vmemmap optimization, volunteered to help with the maintenance.

Thanks for your trust. Happy to help maintain this.

>=20
> David and I will continue to look after that part of the mm subsystem.
>=20
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

> ---
> MAINTAINERS | 18 +++++++++++++++---
> 1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..b468ecdf8c65 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17161,9 +17161,6 @@ F:    mm/mmzone.c
> F:    mm/pagewalk.c
> F:    mm/pgtable-generic.c
> F:    mm/ptdump.c
> -F:    mm/sparse-vmemmap.c
> -F:    mm/sparse.c
> -F:    mm/sparse.h
> F:    mm/util.c
> F:    mm/vmpressure.c
> F:    mm/vmstat.c
> @@ -17210,6 +17207,21 @@ F:    include/trace/events/ksm.h
> F:    mm/ksm.c
> F:    mm/mm_slot.h
>=20
> +MEMORY MANAGEMENT - MEMORY MAP
> +M:    Muchun Song <muchun.song@linux.dev>
> +M:    Mike Rapoport <rppt@kernel.org>
> +M:    David Hildenbrand <david@kernel.org>
> +L:    linux-mm@kvack.org
> +S:    Maintained
> +T:    git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git memma=
p
> +F:    Documentation/mm/memory-model.rst
> +F:    arch/*/include/asm/sparsemem.h
> +F:    include/asm-generic/memory_model.h
> +F:    mm/sparse-vmemmap.c
> +F:    mm/sparse.c
> +F:    mm/sparse.h
> +K:    (?i:vmemmap)
> +
> MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
> M:    Andrew Morton <akpm@linux-foundation.org>
> R:    Kairui Song <kasong@tencent.com>
>=20
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261019-memmap-maint-72fec54e6752
>=20
> --
> Sincerely yours,
> Mike.
>=20
