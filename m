Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B12D7398
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506299; cv=none; b=aVcRh+3KG2/Q1k/uGScszek0GbolOdOdpj4LpGjAbAOGVQy/QP4BIcSWn+uwVyipE4YEfUeAyTUa6yGFuetUV3qKrwoS6ftUrZa1OkmXxBWT9fKm01azVT/7/uChHnN/XIG9Z8IzS4llvCWqWdrHB/Ebx4RSt0vOTqmnw3IVUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506299; c=relaxed/simple;
	bh=1vTYwK/wvoIR3O8GrBIjGhV9ooIB1stkGBEkt4hT5EY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C5mIkl82Psa3H5StVqbHqfPlM0jDJKdmuDwPxvdK8Ltm0oxKCXwsuE0/YXKRLYJLWKDbDQChe4ik8tcSBE4uV3vnOgYKQ3qZYJRsI+nMNYcTzfui05Sxlh2usyA38IS2+eVZJOMdBgV4FGpSAmbAblSMjGeAYCCDTqVmFZ/zbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i5d601uz; arc=none smtp.client-ip=95.215.58.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i5d601uz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1vTYwK/wvoIR3O8GrBIjGhV9ooIB1stkGBEkt4hT5EY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790506295; v=1; x=1791111095;
 b=i5d601uzeXfntEWeu5aEZKekL2SJaQ+BqNrPwfWm7tERCOIu/rBhChI/QbkHtvdYlkFIrfrW
 esa1G2NaW1Mxh0RtDEviIR0poJXlo+jyAix//Tf/xX4QVTSambMDqvTV5RBjxSljyAedn5RXPYe
 DkGy3aYx+H/ntzgLbcEE73yQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5500dc4e2682cac7;
	Sun, 27 Sep 2026 10:51:35 +0000
X-Mizu-Trace-ID: 5500dc4e2682cac7
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 00/12] mm: Switch device DAX to section-based vmemmap
 optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260926225105.a56f29d76b2f496c8dc2dac0@linux-foundation.org>
Date: Sun, 27 Sep 2026 18:51:15 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lance Yang <lance.yang@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB00943F-8DB1-4BEE-BF37-701785DE2DDE@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260926225105.a56f29d76b2f496c8dc2dac0@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 27, 2026, at 13:51, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Sun, 27 Sep 2026 10:54:29 +0800 Muchun Song =
<songmuchun@bytedance.com> wrote:
>=20
>> After the HugeTLB conversion, optimized vmemmap state is described by
>> the memory section and the sparse-vmemmap population path can =
allocate or
>> reuse shared tail vmemmap pages based on that metadata. Device DAX =
still
>> uses the older DAX-specific population model, including a separate =
tail
>> vmemmap page reservation and architecture-specific logic to locate or
>> populate reusable tail pages.
>>=20
>> This series makes device DAX use the same section-based model. Device =
DAX
>> records the compound page order from pgmap->vmemmap_shift in section
>> metadata before vmemmap population, uses the common per-zone shared =
tail
>> vmemmap page, and drops the extra reserved tail page. The powerpc =
radix
>> path is updated to use the same shared tail-page helper, so the =
generic
>> and powerpc DAX paths follow the same reservation model.
>=20
> Thanks, I've updated mm-unstable to this version.

Thanks.

>=20
> Sashiko asked a thing:
> =
https://sashiko.dev/#/patchset/20260927025441.741633-1-songmuchun@bytedanc=
e.com

Sashiko said page->refcount can overflow by incrementing it over 2.14 =
billion
times when mapping more than **524 TB** of DEV-DAX memory on a single =
NUMA
node, where the pages share the same node, order, and zone.

I am not aware of any practical hardware configuration approaching this
topology today.

Handling that theoretical limit would add non-trivial lifetime or
architecture-specific teardown complexity. Without a concrete hardware
requirement, I prefer not to over-engineer the current series. We can =
revisit
it when such a system or use case becomes realistic.

Thanks.

