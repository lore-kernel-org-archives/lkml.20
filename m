Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF447C0F8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959318; cv=none; b=HlqebGprLPFBQ0dBozKqSd+PKK3tHGtN0C0xNbc4452hh6piCaB2eLMTxrbWjM75GIXoye/LUPMQZ9ao7hQEaBxuVdcspEoiOV8C/np3Ss89IyU5jYVnyd/QjThBcrLQGxsidbOwB57f6Nw/TiudgpXCzt/P3aCt7mWQ58BHEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959318; c=relaxed/simple;
	bh=bbsRBPS39F1qCvHS8TXrx+bY+bmKnc5cP2dNW7zwNzE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bBhDCgwLEiMkkRmNaV3Pgx/1oSxW9HSGQvfqxeLdi575XIuElTuBOMwZjTVE7q9N3x/HTPJvaxGuhi47lzwtBbHC7nI+6p9Vfp4yCv4s6hOjbd1DAdIwqzIB8THv9NgladpzPv+elRNaRAho744YR6TwDUmOCRlvVdscKBbJGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E2QXc9Kd; arc=none smtp.client-ip=91.218.175.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E2QXc9Kd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bbsRBPS39F1qCvHS8TXrx+bY+bmKnc5cP2dNW7zwNzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788959313; v=1; x=1789564113;
 b=E2QXc9Kdfido1pjPy4dtaU+WZvszdY1lADRjeK+e67nSqWVjMWnFs2z8Tv0OUeYpzgok+C7W
 F3lRO991HIKiWDR4SAwT83eMpa+7n44z44IS2GtKilUGlBxZaamTKytWn3DJTPRyGNmY4gSfN2r
 RDiobjQ9O4twlBVLeTZSxPSM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 04d50cffb0466e00;
	Wed, 09 Sep 2026 13:08:33 +0000
X-Mizu-Trace-ID: 04d50cffb0466e00
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v5 10/17] mm/hugetlb: switch HugeTLB to section-based
 vmemmap optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <67dc7ac8-b39d-4354-8cbf-f2a1c3a369ee@kernel.org>
Date: Wed, 9 Sep 2026 21:08:16 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <82CAF33D-2482-4E8B-826D-8AF5E6FF8866@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-11-songmuchun@bytedance.com>
 <67dc7ac8-b39d-4354-8cbf-f2a1c3a369ee@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 17:58, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 8/25/26 10:46, Muchun Song wrote:
>> HugeTLB bootmem vmemmap optimization still carries its own early =
setup
>> path, including pre-populating optimized mappings before the generic
>> sparse-vmemmap code runs.
>>=20
>> Now that the section-based vmemmap optimization can derive HugeTLB
>> vmemmap deduplication from section metadata, HugeTLB only needs to =
mark
>> the bootmem huge page range with the appropriate order. The generic
>> sparse-vmemmap population path can then allocate and map the shared =
tail
>> vmemmap pages without any HugeTLB-specific early population code.
>>=20
>> Do that by setting the section order when a bootmem huge page is
>> allocated and dropping the dedicated pre-HVO helpers and related
>> special-casing.
>>=20
>> This removes duplicate early setup logic and switches HugeTLB to the
>> section-based vmemmap optimization path.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> ---
>> v3:
>> - Use the order-based helper for the bootmem vmemmap-optimized check
>>=20
>> v2:
>> - Collect Acked-by from Mike Rapoport
>> ---
>> include/linux/hugetlb.h |  1 -
>> include/linux/mm.h      |  3 --
>> mm/hugetlb.c            | 30 ++------------
>> mm/hugetlb_vmemmap.c    | 90 =
+++--------------------------------------
>> mm/hugetlb_vmemmap.h    | 14 +++----
>> mm/sparse-vmemmap.c     | 31 --------------
>> mm/sparse.h             | 27 +++++++++++++
>> 7 files changed, 42 insertions(+), 154 deletions(-)
>=20
> Nice cleanup.
>=20
>>=20
>> diff --git a/mm/sparse.h b/mm/sparse.h
>> index e4617f9c8876..049272aba84e 100644
>> --- a/mm/sparse.h
>> +++ b/mm/sparse.h
>> @@ -16,6 +16,24 @@ static inline unsigned int section_order(const =
struct mem_section *section)
>> return section->order;
>> }
>>=20
>> +static inline void section_set_order(struct mem_section *section, =
unsigned int order)
>> +{
>> + 	VM_WARN_ON(section_order(section) && order && =
section_order(section) !=3D order);
>> + 	section->order =3D order;
>=20
> As raised previously "section order" is entirely unclear. If this is a =
compound
> page order we should spell that out.

But I also have another question. Should I also rename the helper name,
like section_set_compound_order? or it is enough to just renaming
the field name?

Thanks.

>=20
>=20
> --=20
> Cheers,
>=20
> David


