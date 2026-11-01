Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517275;
	b=dbPnZwxwzYR0RGOUG6KVlaBtb9hQ7YerZffjefdjmx670GSbCc8Y9DdCMu+x0G3aHM/2
	 M0+65rq1HhEtdA/PXMLfIZjFtt3BYYDaRBHpl80LEBnM4eQAOKxZUVKTmgJyY/6exrE++
	 wcIp8gZZWj7lXaO8VkTfWDMqX3R4/L1Vy4/am+PAjmi4kjfBFoYl+wofCcQzjzvtUg2us
	 VdasaMGPKqY3jXZvcbaq0JlGFrfQRNPmSIO5MlPutc/zNJEPL35FDvtP2Wc13kaIVCqG4
	 EBmMX8MwiAD734CK8r6EIp0U+6FKrQamw1sAM0gQRTw3HR+MVxwAI10qbuGzk6GsFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517275;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hMKZpg15BN7ibax6GuM/EqpnZ+65bEpp5yD8qzjlvfQ=;
	b=33kQnbNkaHjHtG8TLfR7VN+XGs3Q/VcxPtbemdLilv5G5t5sbNtbpAteL5AiiZ5kdokZ
	 gBODQJzgSDAgNV7InkxQNIAPwRP0ij0m9lJPKIxHMQnJHZCKaXmAhTd1qGlgM4C+GIzuz
	 ZtHuKiHZZ+Sc6mHW0iLJViQorNsFLiF3fUt6ZNOef0nSW8wapjz3vTGqe+hVCWLUQPehf
	 HhFbHDhGiHYXKjlYT8UDC2Qn3K44RggY+yP+DEGC2T04loveg39CU7DY24ijuN65jMyq2
	 Yo5lwH8hAl/FPRNaY1sS+t023nmku88W2n1EioL10HfVTy6WZ5e6ju00OKtY+8uxw5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="pKp+qtJ/";
	arc=none smtp.remote-ip=91.218.175.17
Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35173606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35173606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pKp+qtJ/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f+gZnwn4jlugsItkgzJzya2zQVZHOUrl/EtEyxGLANI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793517272; v=1; x=1794122072;
 b=pKp+qtJ/xVn4uGzq4OPTyxXWgbIH6IJ5x4NWorZ29EN+NPsRGO7X8Kr49VEYb6EJZHl89CjL
 jtpuxYMMrEz30tkqMRCUzTR6YmmsJBXeodhtKNUyByfyw82UABHWY1Oz+GLFdGYyfL5NMveF1CW
 BnYCuOOwwmxD+5ZzFDuVOWJA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f110c669da18e7dc;
	Sun, 01 Nov 2026 07:14:31 +0000
X-Mizu-Trace-ID: f110c669da18e7dc
X-Migadu-Flow: FLOW_OUT
Message-ID: <2aebd191-5c20-4865-8f2b-8db326ef6ddc@linux.dev>
Date: Sun, 1 Nov 2026 15:14:26 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] mm: hugetlb_vmemmap: make vmemmap restoration
 folio-oriented
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-9-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-9-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Like optimization, vmemmap restoration operates on one folio at a time,
> but the current interface exposes a raw address range and requires the
> HugeTLB caller to prepare part of the operation.  This splits the common
> mechanism across layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap restoration and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
> eligibility and state in the caller and gives both directions of HVO
> consistent folio-level interfaces.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 37 +++++++++++++------------------------
>   1 file changed, 13 insertions(+), 24 deletions(-)

Nice cleanup.

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

