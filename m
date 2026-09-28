Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34C349CD1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569583; cv=none; b=cpRbCBdessWQDZiKnlUcmG+pz8WMouNDfloSKLe2IIz0zFKttwHWJlwpiQWTABcCUUGFiUvhK/Fyse9ecSR/Wzr60q+8jsuKcYdu1HX43y0e3AplSvkdjOfU4E+SqjdsO4kYLuPubY4o8+2RYsRCfn5jsLUMr8EbJ93v5bMWqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569583; c=relaxed/simple;
	bh=Glpk8JbMYBC+fNyg6t+G4JCTtagtnxJN0ZLKBOnTQTs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rEi54bzJxb1Kv/VmmkXvgOaw2rCIB9Bf4abfknyZ2ws3Qe7KIqHK+rG7GuCqfUQfPiVwnsH4gvUDz1tBGdNuseV5ENHHCgmJUAy0hKYrSP5k2le0FARqKwpk9C5CcZyck7jVOsrFtDp4v3DKvt4a1dFoSoKgBgzJf479fZxPF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S8uNetnj; arc=none smtp.client-ip=95.215.58.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S8uNetnj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Glpk8JbMYBC+fNyg6t+G4JCTtagtnxJN0ZLKBOnTQTs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790569578; v=1; x=1791174378;
 b=S8uNetnjaT95Te3/CadF+V8u9Xec9I4jrluUa+Lx4fCtP0XIsZ0PcTQVycE5n9LQNZfJI8KL
 KeUa75lfmzj1/lrB/hPDZ9saQITMgLzpb+lgh7lazP1DkkO0W+iMoNj0CkkNWmDUCSMw9agzt4z
 w7v7g6CU4xq9hO4mNAa4UyWw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 061b4c85c7534b56;
	Mon, 28 Sep 2026 04:26:18 +0000
X-Mizu-Trace-ID: 061b4c85c7534b56
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 00/12] mm: Switch device DAX to section-based vmemmap
 optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260927125452.0c1ec382905482841a4faef7@linux-foundation.org>
Date: Mon, 28 Sep 2026 12:25:58 +0800
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
Message-Id: <0E16642B-8180-4047-B846-40E3CC52E7D8@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260926225105.a56f29d76b2f496c8dc2dac0@linux-foundation.org>
 <FB00943F-8DB1-4BEE-BF37-701785DE2DDE@linux.dev>
 <20260927125452.0c1ec382905482841a4faef7@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 28, 2026, at 03:54, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Sun, 27 Sep 2026 18:51:15 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>=20
>>=20
>>> On Sep 27, 2026, at 13:51, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>>>=20
>>> On Sun, 27 Sep 2026 10:54:29 +0800 Muchun Song =
<songmuchun@bytedance.com> wrote:
>>>=20
>>>> After the HugeTLB conversion, optimized vmemmap state is described =
by
>>>> the memory section and the sparse-vmemmap population path can =
allocate or
>>>> reuse shared tail vmemmap pages based on that metadata. Device DAX =
still
>>>> uses the older DAX-specific population model, including a separate =
tail
>>>> vmemmap page reservation and architecture-specific logic to locate =
or
>>>> populate reusable tail pages.
>>>>=20
>>>> This series makes device DAX use the same section-based model. =
Device DAX
>>>> records the compound page order from pgmap->vmemmap_shift in =
section
>>>> metadata before vmemmap population, uses the common per-zone shared =
tail
>>>> vmemmap page, and drops the extra reserved tail page. The powerpc =
radix
>>>> path is updated to use the same shared tail-page helper, so the =
generic
>>>> and powerpc DAX paths follow the same reservation model.
>>>=20
>>> Thanks, I've updated mm-unstable to this version.
>>=20
>> Thanks.
>>=20
>>>=20
>>> Sashiko asked a thing:
>>> =
https://sashiko.dev/#/patchset/20260927025441.741633-1-songmuchun@bytedanc=
e.com
>>=20
>> Sashiko said page->refcount can overflow by incrementing it over 2.14 =
billion
>> times when mapping more than **524 TB** of DEV-DAX memory on a single =
NUMA
>> node, where the pages share the same node, order, and zone.
>>=20
>> I am not aware of any practical hardware configuration approaching =
this
>> topology today.
>>=20
>> Handling that theoretical limit would add non-trivial lifetime or
>> architecture-specific teardown complexity. Without a concrete =
hardware
>> requirement, I prefer not to over-engineer the current series. We can =
revisit
>> it when such a system or use case becomes realistic.
>=20
> OK.  Presumably it would be cheap to add a check for this craziness =
and
> return ENOSOMETHING?


Sounds right =E2=80=94 I'll send a follow-up fixup patch shortly.

Muchun,
Thanks.

