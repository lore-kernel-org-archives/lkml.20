Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741022;
	b=s2klSgz/DO5xkAliLjXXzrFfSDmwoGBPTU/wdHAIHstgMxVN5N3tgsaDr43VGiJF2POm
	 qjXCVRBhnPAss+qRRuilrCflgOCAiS7I0w9ukgQtDsoa/mjf5hy9UBS1HNtZ3VwjvFjIH
	 q4XAHYmoRzaiidIb1YdqpslgnKJ8ZzYpzOyxTG1q7ctTxNeYis1o4E5CgMHa4vbdTkaE7
	 SS8kHONas+RtIKpKJV3oIGQZPC6ekBiQELBkQt9LIQ+tpYEYxMhpo9+Mi8jaHbN45aFfF
	 cuqRVjy9ED/b/4xYE9EBcNwsh78PrVigE10Dx9Y9/bLtBTyOKiylJ/pCsvUrZ4Kvmvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741022;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=kCICkMhdloN2vOZs6TT3hOFLpHVo0v/saupjPBSOnA0=;
	b=st3aZsU+j36EQeI1qam8htTwzBjJKxJk3uv2UkrhsszxJWE0lbzyNVyMFsFRpN8UCBDe
	 0Et0oCNbIlVdM2vekbfGdtyZTE8OMEVgGIosSEYUi/mK+ms0jb05j3iKG0bEv+nzIVOK8
	 lmLxruchByf+pyI0FL6WXoxqlmwbs8gRWOcSwc7tvbuSNHk/wAzKMd56WGjRmyF3MzayF
	 M1aehU52WKZotMEbBRIe7NNjf65nRyCzwOzdjxSvl0LfE5T0QgXX3actl+bx+AdPXvxP6
	 RWTT5DbxuZPb8cC5tQCCtQcxhpkuCkE3Ma7nlrx1RkfTb5gH0zmdYho065qLcFK4Pwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=SjUybCf0;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E7606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=SjUybCf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792741021;
	bh=36DO8i2bkr8z2JQZQxXEchKKItiALErgWh8fLAo6Zz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SjUybCf07Vef3W8cLyBTd8TuCKWahdmE5eYY/hc9Qek4VWM8dVNwyT5VR4g537vKt
	 g67ZnAuTxU7bkPfJIwuGoMUbZORN2NsB0FJ4MLvbgwuBqNGjq0lotWhDEZp88qEJRF
	 AkV30enxYOXWdgNdqh26aJTDXdQEq33I8JwCTmPw=
Received: by gentwo.org (Postfix, from userid 1007)
	id 0974340263; Fri, 23 Oct 2026 00:37:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 0672C40261;
	Fri, 23 Oct 2026 00:37:01 -0700 (PDT)
Date: Fri, 23 Oct 2026 00:37:00 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Dev Jain <dev.jain@arm.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
In-Reply-To: <18c9c7bd-0d89-45dd-8425-64f10e83fbb1@arm.com>
Message-ID: <b003613a-42ff-b789-5154-9a3208ee246a@gentwo.org>
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org> <18c9c7bd-0d89-45dd-8425-64f10e83fbb1@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Dev,

On Fri, 23 Oct 2026, Dev Jain wrote:

>
>
> On 23/10/26 5:05 am, Shubhang Kaushik (Ampere) wrote:
>> vm_map_ram() converts its unsigned int page count to an unsigned long
>> byte size without checking for overflow.
>>
>> On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
>> the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
>> and vmap_pages_range(), so it can allocate and map only the wrapped
>> number of pages while returning success for the original larger request.
>
> I would expect the caller to take care of this?
>
> In vmap(), the check is count > totalram_pages(), is this check more
> appropriate to be used in vm_map_ram too?
>

Thanks for the review. I have addressed the conversion issue in v2
with check_mul_overflow(), as suggested by Andrew:

   https://lore.kernel.org/lkml/20261022-vmalloc-reject-overflow-v2-1-0db7a20c53f0@gentwo.org/

I do not think the totalram_pages() check in vmap() is an appropriate
replacement for the overflow check in vm_map_ram(). It is a separate
sanity check on the requested page count; it does not ensure that
count * PAGE_SIZE is representable in an unsigned long.

For example, on a 32-bit PAE kernel, totalram_pages() can exceed
ULONG_MAX >> PAGE_SHIFT, so a count can pass that check while its byte
size still overflows.

vm_map_ram() is also a separate API and performs this conversion itself,
so the check_mul_overflow() validation should remain.

Regards,
Shubhang Kaushik
