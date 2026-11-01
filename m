Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516652;
	b=0G/1CJUD0UbG4BH6XnAfFRCtJPjewAuSvbXAGar3nQy8I8U9HT/km6oDjCXFt+UzFg30
	 JDmcLgO+jztNpZz8gs/DX+gLbv8nSn6GiH+acX1Q4fnt2h5HunwPLq+onvhe/Q41feTVP
	 O8wehpTbugUgsLa0SK5xeo6OLZucUz5+bOxVc2wweD4hE3t0vz1eZWOHF888VxwnmUXQE
	 47v6QJZaDoft6WtK3Qpj3OBr1hR0mHpW9LN5YE4pS2x993X8Z1p3+Swml4IS1vghcGHDI
	 qlxSRNF2dfUXraz6e092oGbwP8son/4huAvnBdL3VAMKZs8CNTAnpNAo6WTrwmNsTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516652;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sNC2zQ/oVHxxAa7JWMlgFWqLxoPcit1MP3ft2dPEekI=;
	b=md5N87dio/hhPlBt+b4/wQLqmsBriPGpGTsL4AVThypnXiBYXWQdMUscNzqb9Ux3NZ+p
	 k6XuhwMkX/YewE07bTKfrlGB4Y9sjSQLQ1zxiV4I/e5PppfjBZNlfNfioK8SMzrpG4Rw7
	 IS7nRqGYekwg6UobvEV6NmugJz1YBUw550RA5u5ZwgnAkbad6g1c7rS4/NuI2L4W1qqHA
	 tPv+qvMhfEnbELvHYo6BTYNqI7lCauyam9xcHjJjg8N85JK9gHzP7hokqtlrEM7usm1Q2
	 IPzM07vsf801doWZ+QmkJokXKxsg7Kteg/oTtBujtNHXM4iULdaScjMaRpNmv21ySWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=osIEEKkH;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B41606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=osIEEKkH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=COQy3X6OlJB84W0Wb3ldvsmBsVnNHZN5R6w8mFLCMuI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793516648; v=1; x=1794121448;
 b=osIEEKkH9IPLc/fzuG9Uy/eeE1EbU3zysUlFAAUCor4tDfwOfanINVWvl9cUK6YlFuvV9qCi
 dyiuIjKnHxX4YnmjorTktkyMojzE1mVwzbY20sLJiTLNYfH8N9Uy6Q8opDPSqE8VSwqkL2jxmuS
 7Cy2aWYHarIv5W0ZNJRMQpAw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf75f6d8aa413e18;
	Sun, 01 Nov 2026 07:04:08 +0000
X-Mizu-Trace-ID: cf75f6d8aa413e18
X-Migadu-Flow: FLOW_OUT
Message-ID: <cef6856d-74e6-4b05-8a37-2f777354334d@linux.dev>
Date: Sun, 1 Nov 2026 15:03:58 +0800
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
Subject: Re: [PATCH 08/12] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list()
 next to its free helper
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Keep alloc_vmemmap_page_list() together with
> free_vmemmap_page_list(). This also allows the folio-oriented
> optimization helper introduced in a subsequent change to reuse the
> allocator without a forward declaration.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 42 +++++++++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


