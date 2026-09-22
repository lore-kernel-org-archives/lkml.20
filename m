Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C23F0AB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065115; cv=none; b=fdwYEZHUihNlSEtNqCXracR/niewmu+LeJ43LXCLQgE8kEIPTLc2oygr7iAq8Ek37VMMV1uZR3L9mLlvclbeGzJuLky4y1BXtubpA0CzDc05xDyP63kRZi4who8HZgl9VWGXy7tye5O9T6j+u88/QIH4pphETe7swsAXKPNF1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065115; c=relaxed/simple;
	bh=ktrAUhwI64L505wDOUN7xl4hGLDxMuKT/wuyW3WOSV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6JQ0jKavCv1kSgaqTjgRor21sujbz1FDKmPLs4fgoFO2mHPMqTrZNl6v58+e1t4Iib1ugEcFx70nGA/BZczTYr4SYyVxWevfaA3ZYh8PLC5nitnh5YJMncfvys4+AtsVSu8/4lTM5cmOOQM2VijMhqQ9BIv69KI28bl96dwnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=olw5uo/x; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="olw5uo/x"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ktrAUhwI64L505wDOUN7xl4hGLDxMuKT/wuyW3WOSV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790065111; v=1; x=1790669911;
 b=olw5uo/xTuL790U0/Ix6xE0wzHpk+VQfuSsgTd/1mtedkVS1AVWgJL5mCLlsiXq6kjiYXe62
 0V3wS+Derk4bcykMysUPCq64KNLTu1vxWwkK2P2CPxOD4iM9hXvDg/4oJyXAJpbtCGPzXEqg+JG
 Kop9OnLTFuNWkgpVdJqppNuw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9f6078236310b3ef;
	Tue, 22 Sep 2026 08:18:31 +0000
X-Mizu-Trace-ID: 9f6078236310b3ef
X-Migadu-Flow: FLOW_OUT
Message-ID: <b7932a94-32cb-4717-bcb3-d1982fc4f270@linux.dev>
Date: Tue, 22 Sep 2026 16:18:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mm/sparse-vmemmap: open-code
 vmemmap_populate_address()
To: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260913083734.86802-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/13/26 4:37 PM, Muchun Song wrote:
> vmemmap_populate_address() no longer has any callers that need the
> returned PTE.  Its only remaining user, vmemmap_populate_range(), only
> checks whether population succeeded.
> 
> Open-code vmemmap_populate_address() directly in
> vmemmap_populate_basepages(), remove the now-redundant range helper,
> and return -ENOMEM directly on failure.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 54 ++++++++++++++-------------------------------
>   1 file changed, 17 insertions(+), 37 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

