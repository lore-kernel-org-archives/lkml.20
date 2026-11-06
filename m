Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971092;
	b=u2yStGy/rGU7ZtgDHiRSVlJ3elpZUzO8pfmEoYw0QVvR7vDf7SoY1P8rknRBWukyY8Xp
	 SohO81WIB4lLiN3BquU/uHQ7KDxMoB6P9CSACEgUfSj7M1750InW1a8/KMy/nI7ksPJ3d
	 ly+iY5B2yJD/zefjmnm9Z3RaJTGCSGtaYqhvEYaF06K9TXTXoLBJXLWR1DxhU7Hzml0RU
	 LAD+0681VvZ80SURGptlUtmxAYhjV2L+z95sOFjZQfN72EzQhkorLxVGDMF/T+1ejzI2z
	 tXMU40kldwGMAlSOKMdDlniVKqzZ3MdJ3xZiQhVxOSRbnoRTBQ6cOO7Vx88WBlSbDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/oCBIQX9QmZ+F4LHbpq5rJKGHjQ9IObJZdmhy+V9C+k=;
	b=sssbQ9z27zaq702Xx5kRffZSgWjBs8WjlFH8OlPvANbQzXTqtOjucbQ4e/KbLUw5eV0z
	 cUZaAN+zBlstVT+rTRLMOHRd1PPTsYiuWX68Ii5bHRacKH3Qn5YRNteZDc+ZCD9cvW/fp
	 1MpJTGZpwynAiQc3TwE2WIAruB64QSP0X9/nIg6E3CG8syba7eXoAHIJT5qZgp4G/ty6X
	 g3RZwWy4f2bB2OjcfpRiMQpCBVpU1SJPZAMtNUb2x4AdnFO49fcljjChfHePUvtPdHr0V
	 BHZqne1TU+YZ3sp/bKTg7VroXBKBVppSTGOjHUqWHejFKr5iIoaMD9YmWoEkSOyWUfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U8kL7mtY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E48606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E48606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U8kL7mtY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso276146f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793971090; x=1794575890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oCBIQX9QmZ+F4LHbpq5rJKGHjQ9IObJZdmhy+V9C+k=;
        b=U8kL7mtYsGFMOjKUZgtBwyoh1JF/Tb2yPtolG5toc+G49lylj7npqRsC8Auchz/QQH
         JExS5jC0XfGX8Hmtgc4FZHQdJzz+Ir+bybel1wJ+2IjVY1wcSvdFvdzb8JxVXrNVcwSD
         22Q2SbG231OyJuB2Y2pDJVQYOz/5aIm1dl5uSCToMwb6znxeXMfNbMiJdT2VobrTKGyI
         8I9BixWnGaw8WtKSFh6VY17tDiXHf1sBwm6S43bZdn4dTKQVT2ikTfGEcJ86//gz/4fb
         93YKAI4RUfF3DcTtySsaabUa5V+/8p2F4nNpKABPSsL8bmPLMp47Kao8MxXTe1h80+DF
         gmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971090; x=1794575890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oCBIQX9QmZ+F4LHbpq5rJKGHjQ9IObJZdmhy+V9C+k=;
        b=UDqwWahGi36hHsoIcMos5TuCYULp16n9kJ7nosCD4NlWbp3eBgDwgfZJPQk+9qh9E4
         HGguDD0g/wQeYHy5lTN5MTjkg+Q8PUkF6vcZGQmMwnJyth/GW2hRC6Bgu/vGBMxH+d4o
         z8XVqSMCpPtbNzb6W/WoN2kRcVNlRu9yONiQFkPh6B9DrcEvS4QfqnvwRKXBoPChqeS8
         34J44uFvKfQcBk4hnUt/QjF1l40rhFzcsU3+XHHgIa3eiq5W3fIqtt1BTmuoLC/NycQ4
         qhkZHrGlujBvZBzGIgwuPa6K/Mu/Sa5Wu/JuT68H6KPZjbzPlTGW8JJg39FKuHqzxedh
         +7DA==
X-Forwarded-Encrypted: i=1; AL+hErGCpKxc9yZ0JOw1E9bfviAQRkyOjTy8nTVJRMr9eWggN7IpRPyRVogxNVsqglGAbmMwBAvh94IuGqtWKig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zWmh0MVdGKcLlmtYD9YM7sSwhyrARd1WiBNIj5Ll8oVP/7jEZ
	cekIK371ZqzTRZY+hcMPrd0EoV0YDxmQrIAFYrW2VdwkqHFETAiSlVkf3kuhgIoQyJQ=
X-Gm-Gg: AYBFou1LKH7Hs0G3GkiN5QTezC8Zk8V6Vyoxu0WuRGt+EqnIVkbmr6peQ8F4xp2I/B4
	mDfhghAI0oI8L01bXdYUZCHR/lszl7KnHuvA7Z6BTTCUCruiBut+JrZPimZPMkmcTuRfLSwNaev
	pTRCIQQnkJ6docx3tYXi1Omy36DDcHa9QktPeZsoCc0vuD106sUn6mQu1ao3xj9PtaKlnPImzxR
	10jE+UZ6ECHe5LlHHru6rWYrqYqYiLw+j1wGgK8zYwy+Oa+8o7QjgBx+CBm4352ZBxXj5rZSw+y
	zaqJBRJXcoP11MHuCvoOFdUAXPzhrk0zLEMf4DazjbU4GIJEP4UtkMbnFAC6MVuiX0vz/fUGYEy
	TGp1C4s19ULsPZz2GHNew78n3WHfzlX19+K/yIvIvsVQAstn1LYdG9IClnQCCZWVqxX5rend7ZU
	gR8ddORafhQesB+fnW6Uj4zq+d2yVrfVDy5jHjr/QW5R/f696oM5zrXzp4+WSiIMerVztnHLRf+
	7wnYEs+YpntwsBJiyaT3cQ6oaehAczCrvrZf3DgWU/JH5SiDgqCOjnSSL1YKzbpjGzpJUyaFMRG
	0GOoxSL4Mq8ld9ni
X-Received: by 2002:a05:6000:455c:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-49276b63816mr2962779f8f.19.1793971090427;
        Fri, 06 Nov 2026 05:18:10 -0800 (PST)
Received: from localhost ([2a09:bac6:37a8:26d2::3de:5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809ddbbsm3781141f8f.53.2026.11.06.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:10 -0800 (PST)
Date: Fri, 6 Nov 2026 13:18:09 +0000
From: Matt Fleming <mfleming@cloudflare.com>
To: Marco Elver <elver@google.com>
Cc: Caleb Kan <calebkan1106@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Caleb Kan <ckan@cloudflare.com>, kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 00/11] stackdepot: reduce memory use for
 persistent stack records with a trie
Message-ID: <au24u-HWyVtBZME3@matt-Precision-5490>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <ateDvB145CN_R7CA@elver.google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateDvB145CN_R7CA@elver.google.com>

(Sorry for the delay)

On Tue, Oct 20, 2026 at 03:07:40PM +0000, 'Marco Elver' via kernel-team wrote:
> On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> > Hi,
> > 
> > This series reduces the memory used by persistent stack depot records by
> > sharing common frame prefixes in a path-compressed trie.
> > 
> > Cloudflare runs KASAN on pre-production servers so allocation and free
> > stack traces are available when diagnosing memory-safety bugs. On some of
> > these servers, stack depot exhausted its pool budget even after we raised
> > stack_depot_max_pools from 8,192 to 32,768. Once the depot is full, a new
> > persistent trace returns no handle and a later KASAN report can lose the
> > history needed to explain the bug.
> > 
> > With 4 KiB pages, 32,768 order-2 pools allow 512 MiB of stack storage.
> > Doubling the limit again would allow 1 GiB, but it would not change the
> > linear growth: the hash backend shares identical complete traces, while
> > two traces that differ by one frame are still stored independently.
> > 
> > The trie is opt-in and disabled by default.
> 
> Have you measured how much of the memory reduction comes simply from
> storing 32-bit compressed frames (patch 9) directly inside the existing
> hash-backed struct stack_record? That alone cuts frame storage by
> ~40-45% across *all* callers (including page_owner and KASAN aux stacks)
> with O(1) lookups and none of the trie/bitmap/RCU complexity.

Yeah 40-45% is the right ballpark. In our measurements, using 32-bit
frames gets us around 41.8% reduction in stack depot pool usage.

> If prefix sharing is still needed on top of that, deduplicating
> fixed-size (e.g. 4- or 8-frame) immutable segments from caller to
> callee in the existing hash table (chained via parent_handle) would
> avoid mutable child arrays, RCU retirement, and the bitmap allocator
> entirely.

That's an interesting idea. I'll take a look at that so we can compare
numbers.

In the meantime, should I send a series that just does the 32-bit
compressed frames?

Thanks,
Matt
