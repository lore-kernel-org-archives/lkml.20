Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278278;
	b=K+kLruQB3WWsuOCBFwYhre2eWhuWSf0OYxzEK3Aa0SYZs91g+Arj4a/qVUvZfZZTtfi5
	 mVsmJ9XK9tjDZRVXy3Hb8H41jIXxbX6gUJHMBebeNozh790qve7gPeLHhXg+Ld4hdxRXD
	 78aXf6kof+LZpf/MPKu/FM8fUriYMebgKIEn7eF9iSlrPK6qT9tqy78vJ9qDzO+czt25T
	 G8ZWc2edeP0YRwIjw+fFCZqUbpiWwDWdIaTfpnggFsPSMYrs975VfDAfq7W16DksBI1ky
	 yvB7bAniDqLkK8IiBMnq8Hi3Fhoz3zInHZbg3t4RjXw24Z7+NN79H0yQCTyGLlNeUmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278278;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=m2GMT6ns6lAtiKIgdp0F30rxirKti0faahCUUE6aPx8=;
	b=HNnjZz7Vze4YplYBdm41gByJHa3J4TBJnF1uhrgdrBbJ2x7HQL9YR6PLz4hFu9hRT+9D
	 x+CsK/uIBOl66rmPOWRXWT1aFMpkR72tDhPSS72wgi0euscei8WZW+1UfiJBvVc9Uv8L7
	 bt2HZd4oKgbLCK4GXV4l3XpltgQ9vlE2uqTTQU3V6Orx3DlTaT9mVMXGHyCkj61vt94FG
	 e4llSYrbq8me93Z7grctK51x/Ja/C0Wgwd8UcRuV6Rmfk7olbvhyDe3T17g4dHg9Tsstt
	 9/MWHtVzc2UgCaxSs2go83RH5IuYROucAtCDf9nkF0toPad+ayKHAv4F6F+d182wI9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LilnUsXZ;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LilnUsXZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m2GMT6ns6lAtiKIgdp0F30rxirKti0faahCUUE6aPx8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794278275; v=1; x=1794883075;
 b=LilnUsXZL3Xf+4uZNFlFCA0NFyx8ZyRAnZXWoAtldaMp4QFaWoUl5+dNQKznCc1uaUxXEbOy
 DoPMElMbcUpeV36QGoIvECA+jTes9arJeDH+46q2PLG00PUdXHx6Rv+rJ0Y5gN8WESqvIToMweN
 ZTe5sScKIC7sYSO3ifPdMVyQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c121729f7cdd5ffe;
	Tue, 10 Nov 2026 02:37:55 +0000
X-Mizu-Trace-ID: c121729f7cdd5ffe
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 3/4] mm/hugetlb: fix NR_HUGETLB accounting for unused
 surplus folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261106100521.30099-4-kaitao.cheng@linux.dev>
Date: Tue, 10 Nov 2026 10:37:39 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Mani Tofigh <mt4022@columbia.edu>,
 Zi Yan <ziy@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Chris Down <chris@chrisdown.name>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B03E14E-9E1D-48DF-9159-D64A12BA57BF@linux.dev>
References: <20261106100521.30099-1-kaitao.cheng@linux.dev>
 <20261106100521.30099-4-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 6, 2026, at 18:05, Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>=20
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> free_huge_folio() unconditionally decrements NR_HUGETLB, but freshly
> allocated surplus folios can be freed before the counter has been
> incremented.
>=20
> This happens when alloc_surplus_hugetlb_folio() rejects a fresh folio
> after its second surplus limit check. It also happens when
> gather_surplus_pages() frees folios because a reservation cannot be
> satisfied, or because concurrent pool changes leave excess folios
> after the reservation succeeds.
>=20
> These paths leave unmatched decrements, causing HugeTLB usage to be
> underreported and potentially underflowing the counter.
>=20
> Increment NR_HUGETLB before calling free_huge_folio() in both paths
> to balance its unconditional decrement.
>=20
> Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
> Closes: =
https://sashiko.dev/#/bug/linux-860a3b8f-0b07-4cd5-a122-aa2288463bee
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

