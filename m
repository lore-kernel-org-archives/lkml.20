Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE2375AA8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603426; cv=none; b=WaFgTMvar6Potavr54WqOdzCPqq3V6DDkUvZkTKp4Liu69wrJWB9lkVRmN1TlQNdM3MZFpnmn0F7ynMk9eG8SqUHTvDjCnnFB+jgGMos/EP1zK6iEb6fQBiGitYEHsg/MQUJ1nTVvSrFbx8RGDeT6GHg1F0uxGcgVrf27LPRUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603426; c=relaxed/simple;
	bh=kwGEFPYPtNOaPfcKsHGyvboh3/0JIjAHnUCjf3u1ZsI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ELz2sXkkL8cG9xlrznu4wW9WfVaaD6uRD1b2RBxJjFg9Zp00+VFoJFxcUfFWfrSENYIe2f3943ZoT3bq6rcJ+fSKfaKk7OXOLZw74cHTaGZ/yN6bEuacE+bxCVF/K5YVDjnd9AbYk1rdga316DHNlz24s41APrEXxpjflicUnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vyye3Oeb; arc=none smtp.client-ip=95.215.58.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vyye3Oeb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kwGEFPYPtNOaPfcKsHGyvboh3/0JIjAHnUCjf3u1ZsI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790603419; v=1; x=1791208219;
 b=Vyye3OebcY+xj2trKEReAE1SMObxnH934kgvJ3fOy1Rw/EgoQWB6GCFxv3cajfRyBcrxDxzY
 2LAW6o1O1ef+sLeZE7Aa8/5RZfOI8Wh/y4k0kQ+McLtqbe8MwWemFlFTnUcpXhE93OIyrOSJz3G
 yuU3XuIgD9pfGdDKrSmmFaoU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e0d00ebac706a868;
	Mon, 28 Sep 2026 13:50:14 +0000
X-Mizu-Trace-ID: e0d00ebac706a868
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v2 0/6] mm: Unify device DAX and HugeTLB vmemmap
 population paths
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org>
Date: Mon, 28 Sep 2026 21:49:55 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
 <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 28, 2026, at 20:44, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/24/26 09:52, Muchun Song wrote:
>> This series is split out from the earlier, larger series "mm: =
Generalize
>> HVO for HugeTLB and device DAX" [1]. While the parent series =
generalizes
>> vmemmap optimization across HugeTLB and device DAX, this subset =
addresses
>> a single, self-contained step: unifying their vmemmap population =
paths.
>>=20
>> After the preceding Device DAX conversion, both HugeTLB and Device =
DAX
>> describe optimized vmemmap mappings through memory-section metadata =
and
>> use per-zone shared tail vmemmap pages. The generic code, however, =
still
>> carries a Device DAX-specific population flag and compound-page =
population
>> path, along with arguments and helpers needed only by that path.
>>=20
>> This series first removes VMEMMAP_POPULATE_DAX and moves selection =
and
>> reference handling for the shared tail page into the common vmemmap
>> population path. It then removes the generic Device DAX-specific
>> compound-page population path and routes section vmemmap population
>> through vmemmap_populate(). The powerpc radix path continues to use =
its
>> architecture-specific compound-page population implementation for
>> optimizable sections.
>>=20
>> The remaining patches remove the unused ptpfn argument, open-code
>> vmemmap_populate_address() now that no caller needs its returned PTE, =
and
>> add a warning for inconsistent zone initialization of shared tail =
vmemmap
>> pages.
>>=20
>> This is the fourth smaller step toward the broader HVO =
generalization.
>> After this series, HugeTLB and Device DAX use the same population =
model
>> instead of parallel generic paths, while powerpc keeps its
>> architecture-specific implementation.
>>=20
>> [1] =
https://lore.kernel.org/all/20260513130542.35604-1-songmuchun@bytedance.co=
m/
>=20
> How does this series relate to
>=20
> =
https://lore.kernel.org/r/20260927025441.741633-1-songmuchun@bytedance.com=


This series is based on the v4 version [1] of the series you pointed =
out. When
I was sending the current series, the v4 version of that series had =
already
been in mm-new for some time, so I sent the v2 version of the current =
series.

However, a couple of days ago the kernel test bot reported an issue, and =
this
issue cannot be easily fixed with a simple fixup. So I updated that =
series to
a v5 version.

Therefore, the current series needs to be rebased on top of the v5 =
version of
the series you pointed out, and then sent as a new v3 version before it =
can be
properly applied or reviewed.

If you're planning to review this series, I'd suggest waiting for my =
rebased
version.

[1] =
https://lore.kernel.org/all/20260916064341.1825793-1-songmuchun@bytedance.=
com/

Thanks,
Muchun

>=20
> ?
>=20
> --=20
> Cheers,
>=20
> David

