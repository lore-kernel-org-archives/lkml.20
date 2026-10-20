Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508868;
	b=r3o4DXbplT73poCJEsOku9rv1VFlqoOa5kTkdIl8eG+neidbW3v2JE1MMldyaE/G3qPV
	 ySaOseemMtbBoig2JmFmnYQygR38BOTbGz4vXZxKRT6qKgwTas3jNz30rsobR5YGSvepG
	 bAlZhONvLoerSD+b5AV44tXzSksT8g4Bu7h+J5sinOKp+qsdgqOhcaVXUsFk7we5qSwnl
	 Lr6nIC4PKqBrK1QQIU4p9+oc9z32MnGjSIVffcGYzC1h5kYlJHE/jMSJFpBhxj18BGJFH
	 GC/lOp2U0KZ/9uY6EVl5yE3a2yqdp7RbJdZfj51wkfLQP+FHf3v3uwZkMNkY0tZaRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=TNdGNCXkUfPvd4c5ZdXNPNix8cXInUecIS67qAo+lDI=;
	b=tVC1zcMrJE7FE2R5DfEjQA5fgkeVyBwXnPUoVRDI5/gSYI6AqgtpzkjiU9/yAEcZ+0NX
	 u+T5Qh9qIOZG95hO65xyIof2VZxJtCVT0MyrrpjCuepNSWVlhm3+34jta3HTzJ2W2KLID
	 603j2ziCYbhkD/GleD58xQ+N7Af0XNTJLaOJ+LAiWMEiZFz/1jUCiluR+pHE4w53lfr1N
	 Y7NNJPDaGLi9fbc6FnvwV0V4mcfOA8yWS15bVKNIeQfslxnYV9p0ofkXssMiYCCeiSvdM
	 m5g0rYbo9yAuxWcAcTWRmeWdeWXZRCwWa6v1R9I7wWPfgYkkS7k5fR7wHU4tOaDz7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gMQ4P8rk;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9660A260F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B9660A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gMQ4P8rk
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so21737345e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792508866; x=1793113666; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TNdGNCXkUfPvd4c5ZdXNPNix8cXInUecIS67qAo+lDI=;
        b=gMQ4P8rkO7OQB1rMRihkEbcAQhJE/F2VBS9lM5xSrg6maRb0x6Uo8D9+/LLmaqFssg
         C42GLWKulib90Q//He3aQMCSW4cYquyHIFUtbyapQD28AEh1JJe1zHGNfanUYKvfAIA/
         tB5etmpZvc5NZheaq+ojWno6ROAlB6vyMUREeWAJY+7lIP7WbEHFwteE7j0lUh1MmiBK
         iwrfJgWBEX9o4wS2woHfkiQhBJn2aZ3++DXP7g+bupyNXiYXkB8LTkQQjte2Z7otDqWB
         j9CUOVl3V90s/3QHZgsC6rwplZw06IeNSX7076rAEEfyPHijBFXWzQygs6orPBSYmAcI
         cU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508866; x=1793113666;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNdGNCXkUfPvd4c5ZdXNPNix8cXInUecIS67qAo+lDI=;
        b=L2rKFDevb0w0M39okK9YimYlnNSl6F7ovQRVCCssUc/m+P1vKDMItVxHzyHr8cbNEx
         WAruz6TaE4xGgrFgE5Rg7I3TgCcK8XVPEiEdi57M6Fcg36NhN7EnSxYcTPOk0qt7L1Fx
         rGa59F2KXKbYhWPBG96g+OOLW2eqUqs8kCHGBnnSOYTT+Y4dAtd9dcwWA2MMjG+e75Wm
         /qdxEHNuGW7R2Lf6E753AX+PS+i0fQ3Kh0aXCOSAS6E/ObQ4myiPhyKjxsljCsTPWDsy
         q18AM1r1HdpCvkD2dYpaC9me+XbiG+p9BhW2c5LfnWys9cwX2WZHCoL6SDIvximaZmRF
         VV0A==
X-Forwarded-Encrypted: i=1; AKwUvBzHXJxjiZxepuY7EGHfWFmFlCIV10u6wShOCIUtJ4bYfysdQzNAD9/tCR5XC6WAS2D3S40JA1aHKstYM0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6wisxW8kPKPN7gH3HVBvXJiYMKw1vW3Z5xqSnxtB7A0mE8sd0
	xLp7aTmZuOoXibvA/NBs/nNlfh9ZfNJXRQDNLo+pBPjpuGOvwF7M5kSQmt5+rAA+EQ==
X-Gm-Gg: AYBFou1wApVtFMb5RtaIoSy6SMTxRqoW6AznIp3ZFj4+A9UhIVU0DuUeJFupc2WzTDI
	TQaYMA2WZNQlsIDJuslFyzNqqG72p4kB8K8b0M+A50oJQNK0OqCt5xjd2DOQn/Ro8trNDfebsfX
	K2agFGDJ48MIHG3kP06fI8Ej33iB73K582aP88xmFuVAb2KkkgNV6Us2BjGxi5PhUaRjeh+sA4r
	271T5kncFQ3LAr5P0IqI2QHs1eUseevB36dVjoISsIVxj1NyIBiV7NoBGYxm0ZrAgl5vsQtFGNw
	LDNrzAatqGGYzbmuVCt8k3P1SUFg0VbhLRHQoGgq1wvht9s9PXVcylYprxgaNLECvl3UBjVZo/C
	vtnWBs0nzqwiUKKGqNsnHhK2J0TpVzda27YPkUrW9FhXQqxWDruzEQiZwRpDzhZnmQUPiTpER0H
	2dejmoc8XqGDzkdhFdV8VjsvR3tl5zvus62zadoYdQwUhrwoetHZli8Mrst1GQLn9EVSVm3AQoB
	l0ZB3Zy6ephP5aV2kEoASJmdkqgh14XO30jbtQx8oEmiL7fsUCvmeU=
X-Received: by 2002:a05:600c:3488:b0:4a1:dbb7:bb44 with SMTP id 5b1f17b1804b1-4a1dbb7bc9emr176208875e9.5.1792508865680;
        Tue, 20 Oct 2026 08:07:45 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm73417245e9.3.2026.10.20.08.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:07:44 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:07:40 +0000
From: Marco Elver <elver@google.com>
To: Caleb Kan <calebkan1106@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Vlastimil Babka <vbabka@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>,
	kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 00/11] stackdepot: reduce memory use for
 persistent stack records with a trie
Message-ID: <ateDvB145CN_R7CA@elver.google.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
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
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> Hi,
> 
> This series reduces the memory used by persistent stack depot records by
> sharing common frame prefixes in a path-compressed trie.
> 
> Cloudflare runs KASAN on pre-production servers so allocation and free
> stack traces are available when diagnosing memory-safety bugs. On some of
> these servers, stack depot exhausted its pool budget even after we raised
> stack_depot_max_pools from 8,192 to 32,768. Once the depot is full, a new
> persistent trace returns no handle and a later KASAN report can lose the
> history needed to explain the bug.
> 
> With 4 KiB pages, 32,768 order-2 pools allow 512 MiB of stack storage.
> Doubling the limit again would allow 1 GiB, but it would not change the
> linear growth: the hash backend shares identical complete traces, while
> two traces that differ by one frame are still stored independently.
> 
> The trie is opt-in and disabled by default.

Have you measured how much of the memory reduction comes simply from
storing 32-bit compressed frames (patch 9) directly inside the existing
hash-backed struct stack_record? That alone cuts frame storage by
~40-45% across *all* callers (including page_owner and KASAN aux stacks)
with O(1) lookups and none of the trie/bitmap/RCU complexity. If prefix
sharing is still needed on top of that, deduplicating fixed-size (e.g.
4- or 8-frame) immutable segments from caller to callee in the existing
hash table (chained via parent_handle) would avoid mutable child arrays,
RCU retirement, and the bitmap allocator entirely.
