Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8372D6E64
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094481; cv=none; b=Vm4Nui+YD6c4lstJ75XsaABLcUkVhDs3vUZrXV98eh2RWuTLNVsB9LRF1qx2QyDCSgM7Lo0snixfGQkqQTGa3ASp6ta8w5pco8YACBWZoisEVJ7aKEsrYj03bLr7JSwDUZeRHHgRGGFs38TuNv0RIZuQ2nbBaJdX2YeNLcAPF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094481; c=relaxed/simple;
	bh=UJk0u1UcOnDOPy91sspUcF/wAve5eSeuHy+a5gHNvbk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kGF7o8bGv2wN+7x2xUv6sLf9EVCxx750MnnGgx9BoB+wBxWDaGhrPo5kLrNb7cIb9b/ERUaCPjc3a1hLnwdj1vz+vdSzCbrxZ68Dt/6idzoxnzp7E1x5iUN12SSAdYl8nRW93+ZL+N4nlYPJFc9sT7tGFXTeBZnwlu1fprZQau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=adZNZmRQ; arc=none smtp.client-ip=91.218.175.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="adZNZmRQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UJk0u1UcOnDOPy91sspUcF/wAve5eSeuHy+a5gHNvbk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789094476; v=1; x=1789699276;
 b=adZNZmRQ3cxUe8zHt2km+HnfktRjUs9S0+G8u47/ocIANugHL+DJ7u7Jdz1aaL5R50TRd9oC
 P17oQ9bq+ZcI/qjPGsWT6wvaOVxvYxrjEUQsb3FTYChvZOY/Q0uzmq4x0QsHfKoGveN2CXRn8Qq
 zCLR9V0k5IT9/ytqZf7jAKvk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d64be4f82663bc04;
	Fri, 11 Sep 2026 02:41:16 +0000
X-Mizu-Trace-ID: d64be4f82663bc04
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm/hugetlb: account for allowed nodes when gathering
 surplus pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260910152026.5bcf5c5d7f1ecdcb0147ceaf@linux-foundation.org>
Date: Fri, 11 Sep 2026 10:41:01 +0800
Cc: osalvador@suse.de,
 linux-mm@kvack.org,
 david@kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <35D58CFB-BC97-4245-A387-DB3077E395C3@linux.dev>
References: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
 <8A0F6014-4E2C-4F07-9732-2DF32418B986@linux.dev>
 <20260910152026.5bcf5c5d7f1ecdcb0147ceaf@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Huaisheng Ye <yehuaisheng@open-hieco.net>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 11, 2026, at 06:20, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 10 Sep 2026 16:48:56 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>> This fixes hugetlb mappings when, for example, a task runs with
>>> MPOL_BIND on Node 1 while the existing free huge pages are on Node =
0.
>>>=20
>>> Similar issue also could be found in ltp if the free pages of global =
pool
>>> reside outside the nodes allowed by the application.
>>> # cd ltp/testcases/kernel/mem/hugetlb/hugemmap/
>>> # numactl --cpunodebind=3D0 --membind=3D1 ./hugemmap10
>>>=20
>>> Signed-off-by: Huaisheng Ye <yehuaisheng@open-hieco.net>
>>=20
>> Acked-by: Muchun Song <muchun.song@linux.dev>
>=20
> Should we backport this?
>=20
> If so, a Fixes: target would be helpful.

I believe the fix should be e4e574b767ba ("hugetlb: Try to grow hugetlb
pool for MAP_SHARED mappings"). This commit was introduced back in 2007.
Regarding the impact of this issue, I consulted an AI:

Severity: Medium
Impact: valid HugeTLB mappings can be rejected with ENOMEM
Scope: NUMA + cpuset/MPOL_BIND + nr_overcommit_hugepages
Risk: availability/configuration failure, no data corruption


The fact that it has only been triggered after such a long time also
precisely shows how uncommon its configuration is. I expect that
backporting may encounter some conflicts. In the absence of clear user
feedback, I personally suggest not doing a backport.

Of course, as the author of this patch, you could also provide more
information, for example, whether it was discovered as a real issue
in a production environment, so as to decide whether to proceed with
a backport.

Thanks.=
