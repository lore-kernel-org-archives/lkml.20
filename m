Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60E3AE1A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668551; cv=none; b=T8ifemBnm8WItvzlJ7/BPbJa2J1l3zzR2199i6a4yhVdhnRBbvkjvYZ0SRMLP1lI5Cj838Y97umTAQoJjypBrDO9kp3k/cUmPbgw0hfcroozfCMHbuStFMcKpKFZNevXK8H9S4BzK9iGdPoDAnIhpSRu83P9qNBkOqpHgK0qJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668551; c=relaxed/simple;
	bh=nj3wtQVl7vcnhMbNppV9t0dGEHcungOiAb7gmBQ9b+o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sfYssLuz3ksqh/IaYH/td1MMAym2DPdevezp8we2CMbfqny22st+jEU+uZKZkxVmUtKMr8qlPjoQPmg5ElqbG9opoEhx5XjzMIKgrXn218vG7ESfswH6xayEe9fA+1ey7mEEWJyfuozsFAvl77j4ORoTDs3KemYRCJJZrnza0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NDrUg/Ro; arc=none smtp.client-ip=95.215.58.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NDrUg/Ro"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nj3wtQVl7vcnhMbNppV9t0dGEHcungOiAb7gmBQ9b+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790668547; v=1; x=1791273347;
 b=NDrUg/RoF1bPvVighGofc9LgFh5CsV8P86ekZ3WhxBT7oEPsv2EaiQEbUnovbXjLyRji/zXp
 zu1s05qQAaWgnEjHbV11T2RK/fszFU/20H8cgPwE/HMRnaKxGC/qzDC7+I+Z6jOgfFoZRyMwaa0
 RyucxV3hUsLBqVNRW5VdkRs0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 06442dbddb022582;
	Tue, 29 Sep 2026 07:55:38 +0000
X-Mizu-Trace-ID: 06442dbddb022582
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 01/12] mm/sparse-vmemmap: factor out shared vmemmap
 tail page allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <5c73e3b9-4eca-4b84-ba3d-85bb7d6f77dc@kernel.org>
Date: Tue, 29 Sep 2026 15:55:21 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-Id: <6BA39A32-5851-42B2-8822-F427D08577D8@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-2-songmuchun@bytedance.com>
 <5c73e3b9-4eca-4b84-ba3d-85bb7d6f77dc@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:16, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> HugeTLB and sparse-vmemmap each have their own helper to allocate the
>> shared vmemmap tail page used by vmemmap optimization.
>>=20
>> Factor that logic into a common vmemmap_shared_tail_page() helper. It
>> allocates the page through vmemmap_alloc_block(), initializes the =
tail
>> struct pages, and uses cmpxchg() to install the per-zone shared page.
>>=20
>> This removes duplicate allocation logic while handling both early =
boot
>> and runtime allocation through the same helper.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> ---
>> v5:
>> - Move this patch before CONFIG_VMEMMAP_OPTIMIZATION is introduced
>>=20
>> v4:
>> - Update the commit message for the renamed VMEMMAP_OPTIMIZATION =
config
>> - Collect Acked-by from Mike Rapoport
>>=20
>> v2:
>> - Collect Acked-by from Qi Zheng
>> ---
>=20
> [...]
>=20
>>=20
>> #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> -static __meminit struct page *vmemmap_get_tail(unsigned int order, =
struct zone *zone)
>> +struct page __ref *vmemmap_shared_tail_page(unsigned int order, =
struct zone *zone)
>> {
>> - 	struct page *p, *tail;
>> - 	unsigned int idx;
>> - 	int node =3D zone_to_nid(zone);
>> + 	void *addr;
>> + 	struct page *page;
>> + 	const unsigned int idx =3D order - =
VMEMMAP_OPTIMIZATION_MIN_ORDER;
>=20
> Nit: constants read much nicer all the way at the top.

I can update to this next version.

>=20
>=20
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

>=20
> --=20
> Cheers,
>=20
> David


