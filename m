Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796A3BB110
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975498; cv=none; b=QHl6d0Brh8OeWapHHOLuxPPqTsRZxVLc99hw24/gTxAwd5Kmkbrn1n6P1pg5nE2nKOTTpFV56sV0OspkNLDcesDgMwBvtoZUKMX9erJYCtnMr89d741ocFndiYB/3CoJe7QukqkYj53hAwMtuoqy7KKf1BdvDd23To2z7u2pk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975498; c=relaxed/simple;
	bh=Q2h6+eU+5UZjnvGnYVU6mhubmYWept3jKn5v+HruplI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzMpSevEVQjPUbz7D7qgHYNb59iOmACs1W3JBp+F1ixeyb/4BrnxZFCgd3xLpa9PCnND7VExKaJ/HNQ5bEv39qTtQ7ayPuuEEdmiaS6Uu+eGuWeei9B52kMmJ0iW1dxrydaSCqv9U7YwRDNsx3rRjtoWZrZIXVRLnkuGbesQFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hHPpvsdQ; arc=none smtp.client-ip=95.215.58.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hHPpvsdQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q2h6+eU+5UZjnvGnYVU6mhubmYWept3jKn5v+HruplI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975494; v=1; x=1790580294;
 b=hHPpvsdQocNJjRA1KZ29kuc0sLubTq5vL4gNpUx4YgMo0qS9tRjKWLTbOrz60iQhfhdrVKAf
 8rsO9+Sr7ZeSTaQ0G2hqhn12P/tqQsfdJexVGEzppWWBeuSX4xGzMKqU0/ZTvfrB3HFwPC/t8t9
 bgUUJLjN0TDjFna1Yp/R9Fzs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4c701f708d715319;
	Mon, 21 Sep 2026 07:24:54 +0000
X-Mizu-Trace-ID: 4c701f708d715319
X-Migadu-Flow: FLOW_OUT
Message-ID: <c7871a6d-bc51-43c1-a4a7-ed68a8e5aa23@linux.dev>
Date: Mon, 21 Sep 2026 15:24:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/17] f2fs: stop using PG_private
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Nico Pache <nico.pache@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Barry Song <baohua@kernel.org>, Ying Huang <ying.huang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Gregory Price <gourry@gourry.net>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Alistair Popple <apopple@nvidia.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 Kairui Song <kasong@tencent.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Dev Jain <dev.jain@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 David Hildenbrand <david@kernel.org>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-6-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-6-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:28, Zi Yan wrote:
> f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
> page->private != NULL is equivalent to checking PG_private. Change
> PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
> page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
> but it can cause confusion when PG_private is removed and
> page->private != NULL is used instead. Change it to initialize
> page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
> semantics.
> 
> It prepares for a future commit that removes PG_private.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> To: Jaegeuk Kim <jaegeuk@kernel.org>
> To: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: Chao Yu <chao@kernel.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

LGTM. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
