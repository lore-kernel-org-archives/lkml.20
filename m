Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515175;
	b=4vNFhvV7Xkd5IlJsu2tqV7Tn52xEBopL7uxArJG4uE3Ig+vn7HM2CuIaDoaAd4BAC4nE
	 2Xhay3yW0eWn5UhUsdwg/39xLH00kQX6nrvdPNHFdjUZH2tajEiB8EFZ+KBmdXHW53xL2
	 l6Jw/iWkiEuyPt6okjGrMTmWYYdasnnHvhK/9Krn4saF8BZQzZBbIJzZtgKb4kUVGoTkU
	 Vg31+4A6ExnxZT2zZO7/MgShHnle+cFXdVZ40FZHZedvCpu1Piw9PTbWd3snISvqQb7Ho
	 oAwWCfyT71Okc0gytVBM6f+gwsXAjEhQnmIlJidUleaR45WF/XuzRxJJsh+s0UDRypA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515175;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UNuwgZxs8v17OaRi5wYNgk0NBjjWdX2IWjeKGNZGg80=;
	b=PZ3hmy/Nd9JWfQhZomdOnuyY/Q6EenhxMrHjgvrniR/VQmISRAtvySz2tKmthlCtCGd/
	 CS5iuVSGJ91+rI8x+ipnb/KbM/07C8j9MwB+9zvs0V+DCO8ypAoVNh63LdIRaL51yBh1Z
	 xi43bi3rgofMfHt4KomAl1cUi3zGeKR0EYktLBJkunPlQvIsaCmZM3Y3388IqlPfRY9P4
	 qdvZ2GA32KIF+eHcUDR1jgszDJYb/75mX4S9PXLrdfMGOxTVyFp1KjATH/rAPVioPiSZM
	 +M7Hs2p58ZUBjv+FJOUtPMIlGSZvm8TwvIR3jSo2bDHEPdVSjFP+uIpWOj91sVNPg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MLrCcQeJ;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50136606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50136606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MLrCcQeJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jv2Mo7I2fjHgwZIVG8WGkD+xa/rkd22ydPpwY3VwsqI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793515172; v=1; x=1794119972;
 b=MLrCcQeJ4CA7vY8IVFsWbVTfQ005iuULp+doAldRXuEchelse5tEe0nUQ0YbG3urXNaLFWtb
 /zfF8jjphfS/DQgOsXmpWNcocxGA+5FDghvkrMV+Sbqejxtx5krpFrL7QOSWQxzNNdE+8yMJC/r
 B8rzaTt8upXygCpuzzvxW4yQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9cc37b665f33f48;
	Sun, 01 Nov 2026 06:39:32 +0000
X-Mizu-Trace-ID: d9cc37b665f33f48
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac015015-c661-43ea-bc05-2a37e5420b72@linux.dev>
Date: Sun, 1 Nov 2026 14:39:22 +0800
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
Subject: Re: [PATCH 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-3-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-3-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Vmemmap page allocation is currently tied to restoring a virtual range
> and assumes an empty destination list.  These constraints prevent it from
> being reused when pages are requested independently of a vmemmap range or
> appended to an existing list.
> 
> Generalize the allocator and give it an all-or-nothing list contract so
> the restore and optimization paths can share the same allocation policy.
> This also allows HVO head-page allocation to fail gracefully under memory
> pressure without triggering the OOM killer.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 40 ++++++++++++++++++----------------------
>   1 file changed, 18 insertions(+), 22 deletions(-)

LGTM. so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


