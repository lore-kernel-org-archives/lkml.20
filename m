Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433808;
	b=0wrELnlTi8HvqGW3o5HI2A+XrR1R5bR6/5mcnsZRkCSH4NDhGn0Krro62i4bMW9ii/NW
	 5K5Dh2PK9ZanurNmrvzLfojPMZEORpW/vzha1hJi8FNx7ZA6ypLX1Glg6yqlfOghoIYn2
	 LYWa3iE7P+F/z9mGBf+MJ1myMFA3pTfd3ZboXw0sFm1x3lOEuMEjdnxzL9Y1Iqv46e2P7
	 bMJDWci7aFlJO2u7KnjT2/ac/y3BVjUrSpMAV5jgO4Y7S3x+R9tQy0pbJgaUE1K3tqZAr
	 dVKAuRK6u+IyrmMmhyIh5ldM2QhQGTiZEJx9Vs0klvpYAnZDh42PPB+Ts7J23wq8PsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433808;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gbmKrXUxMGpkX3MNHgLNV7gSiCM3yMUiLklT1taAK08=;
	b=fqWIqAIdzjw8xXI3Jy6RH3SCuIMdCkXG6J0rj83Jkmdrm6lNc1DLsLx0qFeoR5TjsNFJ
	 gNuaPEX2KFxC+RY5+wE7ASNS5QR+1K2TPIa2b825tH0elCZXFbaykT0YPXgkHfV8wFBqZ
	 mLk5OLNVk9L2fNuWNf0/xpmW6+6SvZ1qEEvGjOppQmQarlTGFGpL9nbVIHtRDuT4Fnezr
	 iPI34FdMYmwFa9npMYtyFNk1U6bUl/Yx0NSKEu3vOCy1XrqYNV77qm+JAoUDZjQtyjmAy
	 NIPi+md5xUGYQJ43/IcaVHm90qXD2ODdC2jPXmDPsJhNIITO9IG/ehZXxbROJWBpQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MtOdxnO+;
	arc=none smtp.remote-ip=95.215.58.157
Received: from mta1.migadu.com (out-157.mta1.migadu.com [95.215.58.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6535606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6535606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MtOdxnO+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2ExtZ8QuR1DZDKx/RuoMNZw4ql/mM6Uzh+5t41m9Wew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793433805; v=1; x=1794038605;
 b=MtOdxnO+rZ+rR2RiU9T8zCHm+uVQh+saqsPcKmIPqLDat6KVd8JIstJRDfm6EMvhBqjELZPD
 nQSqol8lBN+oD4kRHhB1ooMsbX52rMCuv+d8wFmwu0+n4Ai9zaq9V4CsnaNydPXSzDgqJ/3JaW2
 JmWGVxhLIrJaWKB90grTeLqE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91100bf70793d15d;
	Sat, 31 Oct 2026 08:03:24 +0000
X-Mizu-Trace-ID: 91100bf70793d15d
X-Migadu-Flow: FLOW_OUT
Message-ID: <158ad4d4-a57d-4c6b-a840-0f6b9d5bbf7f@linux.dev>
Date: Sat, 31 Oct 2026 16:03:17 +0800
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
Subject: Re: [PATCH 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific
 vmemmap optimization macros
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115306.813483-2-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115306.813483-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:52 PM, Muchun Song wrote:
> Vmemmap optimization is no longer HugeTLB-specific, so the remaining
> HugeTLB-local reserve macros are redundant.
> 
> Replace them with the generic definitions to remove duplication and keep
> the HugeTLB vmemmap code aligned with the common optimization macros.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   include/linux/vmemmap-optimization.h |  4 ++--
>   mm/hugetlb.c                         |  4 ++--
>   mm/hugetlb_vmemmap.c                 |  8 ++++----
>   mm/hugetlb_vmemmap.h                 | 10 ++--------
>   4 files changed, 10 insertions(+), 16 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi
