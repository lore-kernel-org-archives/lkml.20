Received: from mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD7B305057
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958164; cv=none; b=TVtBzqDkJb78zVztP9Z+ZP45ib07sV+dYMP72k6kwKO5osqoXenlm9Sr0VqsYrgSlTJp9R9q31F++PxDwyRtxf0hFGIyj7wH3ZSu5xhT4kkvxN62Ksbu40yTvT+c98Uk3LmG6y7DL5xh0ktclvCK/spmk2SNKTzLcpEfGTjl2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958164; c=relaxed/simple;
	bh=dGY2NR/veKXrwGFTi9kg06zDcIsbympO6hwDTaiEiaE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Pyh2cyqTJ8+Fr+macKRsenOqeJo87brhI75z8YMdxFchk5h8ZTida3dZEbfi+1CpK7YaVQdj/mOKDoRzDAC/10H9a6gc6wQblzA/SPnD7h4yyr2eT/rl+uKZS98m+Kry05JlzbzNalxVI9lLff6V4ulqE1P91aykO8Uzi3+WYKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aOkZ9Z/z; arc=none smtp.client-ip=95.215.58.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aOkZ9Z/z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dGY2NR/veKXrwGFTi9kg06zDcIsbympO6hwDTaiEiaE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788958160; v=1; x=1789562960;
 b=aOkZ9Z/zGmBqs7CdSYi5drnM+J5UqK0Ra3AufNX/c8+yJZoMoPmiWDQNfQjJrn/MruH9lnMe
 pRnvQadvv89PNRdnKDErmd/bUCQomm/Wd3Se4xf44lUzqMNcxX9fpvHSzDN9beS2L58mlOKmwex
 yDSBYP9IWkx+ZqHB+SDN7uMI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d526acdc7f8e315a;
	Wed, 09 Sep 2026 12:49:19 +0000
X-Mizu-Trace-ID: d526acdc7f8e315a
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v5 04/17] mm/sparse-vmemmap: initialize shared tail
 vmemmap pages on allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <f57dd255-9468-4280-8a7d-c262147e4645@kernel.org>
Date: Wed, 9 Sep 2026 20:49:02 +0800
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
Message-Id: <C544ED19-39C8-46BC-B716-259D0C732AB4@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-5-songmuchun@bytedance.com>
 <f57dd255-9468-4280-8a7d-c262147e4645@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 17:39, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 8/25/26 10:45, Muchun Song wrote:
>> The shared tail vmemmap page allocated in vmemmap_get_tail() used to =
be
>> left uninitialized, because memmap_init_range() would later overwrite
>> it.  That forced users such as HugeTLB to defer the initialization to
>> their own setup paths.
>>=20
>> Now that memmap_init_range() skips shared tail vmemmap pages, =
initialize
>> them immediately in vmemmap_get_tail() with init_compound_tail()
>> instead.
>>=20
>> This moves the initialization to the point where the shared tail page =
is
>=20
> You are not really moving the initialization? I see a new =
initialization being
> added but none getting removed.
>=20
> Wouldn't hugetlb_bootmem_struct_page_init() have to be updated as well =
(as the
> comment you are changing indicates) or what am I missing?

Strictly speaking, this patch adds initialization rather than removing =
it.

I used "moves" from a logical perspective: the initialization =
responsibility
now shifts to the allocation point (vmemmap_get_tail()), making the =
HugeTLB
side redundant. But since this is a preparatory patch (the section order =
field
isn't set yet, so the skip logic introduced in patch 3 doesn't take =
effect =E2=80=94
meaning the tail page would still be overwritten in =
memmap_init_range()), the
old code cannot be removed yet. It is cleaned up in the follow-up once =
the
switch is complete.

Thanks,
Muchun

>=20
> --
> Cheers,
>=20
> David

