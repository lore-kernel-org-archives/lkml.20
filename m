Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244128;
	b=JgqWVn7mLoedFYycOWIfXDlCYVq4fIqfCk1JWNBWb0W2whqilB7ZSxxkhe1uGjRZ2a79
	 x3QY/8e+AAh5R2NRdya67trYklTBpJwogYR0VyZ5o4Vs6po/XBUl9My92yJT2AYeuhP7z
	 nmvXfGpUTUUiOSCI4LssBF0bzQWEet+ECRNJ7Yxrc7mSsJmQ05h/ZHFV2UmAqRsHktZV9
	 QyEaCMBpKXr9BArZQLQu4HIkVhA7CGDPGoP0mzjtdEQneAGDJkK4F2A7IGIoX2cXpigIg
	 /w/Tteie7145inP93DPeDcXst/7pu182GQCcec3zbsDlvoNHiejNbMhqyjnPBBMA1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244128;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=HNguEgLKPRt0ONBwMq+rfgApg7KOxogrMEorbHbFjtw=;
	b=k438xPm7t7jlwirPDqs9ni03NiwYY3O6ry3i7xt9O/MTUwqLOIBMIAXI26tl7f6XmNdI
	 k3zELuZVc8CRT5JpsEFSPh5DUoPg4nsyu1s3wkiNbQ6kAt7CAIS12BwAjG+KQxYlj3BY3
	 Mnb7KmDjMNqVXfym+xIZNjrJloUJSgAjDLlSzAYJCrLY8VBrJedVgmyAeIu6CPUdtujGC
	 n6EBvTYYtQulZqjLGVJvotMXGQdHUw161I+AysglPQ449p9q7EotPt2HtqcL6g2SnV47D
	 BuwQHafCvUgZ67lyornPT2cv+SOfMMtnfn1Y471aC1/mP1q6y65+mDkY1nsgqqk00mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XETfCPhB;
	arc=none smtp.remote-ip=95.215.58.62
Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B65A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B65A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XETfCPhB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HNguEgLKPRt0ONBwMq+rfgApg7KOxogrMEorbHbFjtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793244124; v=1; x=1793848924;
 b=XETfCPhBW8ek8/36n08lOqZQDykW9l4t9+o+5T9ihnlqE0ZQ4Rrja6oLZ09/8IU9ee04qmx+
 tmlrgwbGqh8FuZdVHUXvPsX4BOe4pGMOJIfaBtBu+MHAkZj867cX7r/q/VplfKjyK8lvDXoRWlt
 BMYoSoW/G/dY/GpLPwlztW8Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1231c8beec06274d;
	Thu, 29 Oct 2026 03:22:03 +0000
X-Mizu-Trace-ID: 1231c8beec06274d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 3/3] mm/hugetlb: fix NR_HUGETLB accounting for unused
 surplus folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <auIORHr432BlmbrD@localhost.localdomain>
Date: Thu, 29 Oct 2026 11:21:47 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Frank van der Linden <fvdl@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Chris Down <chris@chrisdown.name>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <87146009-8E2A-467B-AAFF-8F79E9D5E32F@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-4-kaitao.cheng@linux.dev>
 <auIORHr432BlmbrD@localhost.localdomain>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>,
 Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 28, 2026, at 23:01, Oscar Salvador (SUSE) =
<osalvador@kernel.org> wrote:
>=20
> On Wed, Oct 28, 2026 at 07:33:19PM +0800, Kaitao Cheng wrote:
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>=20
>> free_huge_folio() unconditionally decrements NR_HUGETLB, but freshly
>> allocated surplus folios can be freed before the counter has been
>> incremented.
>>=20
>> This happens when alloc_surplus_hugetlb_folio() rejects a fresh folio
>> after its second surplus limit check. It also happens when
>> gather_surplus_pages() frees folios because a reservation cannot be
>> satisfied, or because concurrent pool changes leave excess folios
>> after the reservation succeeds.
>>=20
>> These paths leave unmatched decrements, causing HugeTLB usage to be
>> underreported and potentially underflowing the counter.
>>=20
>> Increment NR_HUGETLB before calling free_huge_folio() in both paths
>> to balance its unconditional decrement.
>>=20
>> Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
>> Closes: =
https://sashiko.dev/#/bug/linux-860a3b8f-0b07-4cd5-a122-aa2288463bee
>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> I feel like the whole hugetlb accounting is a bit of a nightmare.

Can't agree more.

> I wish we could teach free_huge_folio to ignore accounting-wise these =
pages
> but not sure if that would be any prettier/easier.

My thinking is that we should not use lruvec_stat_mod_folio(). Instead, =
we
should use mod_node_page_state() and mod_memcg_lruvec_state()
independently. In that case, when a new hugetlb page is allocated, we =
could
account for it directly via mod_node_page_state(). The reason is that
lruvec_stat_mod_folio() also accounts per-memcg NR_HUGETLB; only by
splitting the two can we minimize the problems introduced by accounting. =
For
callers that need to consider memcg, mod_memcg_lruvec_state() can be =
used.

I expect that after some cleanup, there will be only one place that =
needs to
handle per-node NR_HUGETLB.

Thoughts?

Thanks,
Muchun


> I will have another look later on.
>=20
>=20
>=20
> --=20
> Oscar Salvador
> SUSE Labs

