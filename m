Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679361;
	b=bgMvoF0Ur08A/dT1yPEYLo71QNt2rjwVBe0QdB9nvRgW2MdG2vMhLyq1+YYlPlasPpUv
	 Ergj5CLSgXKubLWaRjip+ukT5J6dLiKMgKqlktLgugKllz7Cr7+v2hXCpgMjBPI2lnzB4
	 f5xtwvY/IhFyySCLAw43i9YzdJUsRQrB3PlYI6qMGeuoUP/SFBGEPeEylSR7mhYVmksw2
	 4c7i/AfexYFgoJBATuWYVm42qJhh1mzlGioKrV/4jJCblxxAWKhpZ/fVVs2aGHe0b+Di/
	 z8TpVXpWtlrtOYoU4FfJ3tV9LvWRYGnsqgRXrLSFSyQZvVSKlmBCq2utHNbp13Ktb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AepUBMEk9tXpEQAUUGXuQHkD4I3CSkHf6Wpw+Q/6E+o=;
	b=z1TH/IsBT8WX0pij0s5By4HX93JxqksAbvs3+7lL0vqxxpWlsyupWg8C1755RODCMUjY
	 +Nmu8oHn9lN+MxFc62iRFjF6zJqQHDqyug5NJxTusItOlTa4Dw50miENXIY61YRHl+QzA
	 /cuHGACm3Kj4M5oJUH/tYyV9+yh93VkY7L1DRCTjl3kcSXLR9VGn9w4ZhHI4ZJT0g93eS
	 HZy4FtpJuFSNDhfOep/M+jCtIMASqwMM/Eo80aG0emFmrt6ddeu8XOlytAgqhPMw/Wos9
	 +E0+r/mWl/9By4LI3X5XwVXn4lvTukc4LxBTQlOKyIdSpicbxSW1oL93Mv+sSeu3ang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=V95bAJGN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF84606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=V95bAJGN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so23035595e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792679359; x=1793284159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AepUBMEk9tXpEQAUUGXuQHkD4I3CSkHf6Wpw+Q/6E+o=;
        b=V95bAJGNr/tfX+drDCQCZX4U7BDkZVq85lpx40pCMxooe4zm/itb53JhvYJsPmR5sI
         hCt2ZsTJIoJMNh5krr8802Qg4jn1UbMYdquCf8WmjQoWwSj8zLqJMgIm87x/YVYhg5AZ
         AHUGCh8NRd++lTPayE5H63JEBKfZcUwSqbH39qBbwWJb5A2w8SUH7PBwDs3d1s99cd6l
         wrdfJhzzZgraYywcOgEw/2HPGvXdv7bUU4vbGk/PnIa0aDSjby6kgEoW/sg+IPdvY2v6
         r9EOBsc842uGFcGOrPDyOglB7HeJRht2AumaGFyPo+0//gJuCEuS0fmQXwaanGMWSqS1
         sapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679359; x=1793284159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AepUBMEk9tXpEQAUUGXuQHkD4I3CSkHf6Wpw+Q/6E+o=;
        b=zobpC/HBG0rNTKadfaXh/3o0sbwk8dPOGzJyn3hxK5yLwJppmef04uJ8QSgSd5p1jH
         SWSAB732SQ9VADzUMMk6yH35D2BGQ06piuBETYH7XztHNbgEYl++ctdDDyVJQfe6gnpB
         ANW6re6Vdf4+++pbv06Y80fvMfMTo1eylcAywVlePu4yDS4J+uYpDA+hqoNv08epD4k6
         zbc69mkL+krfM/3wVVlriiZmEDUY0vbohfGvdw+tjkOGF1OlH9oQcl5LkQLlTYRKkryv
         rMi2UOCz9oM994ZRC7909Sis9C04RX+f7o/J6rpZDVaWIae4Q1E2H/hJ8dffYu6TNLZH
         TLjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTPK/uQqdbbMpyEigGuHbvqw6SMwlS3jJfdWAJbgNuVXkyuvAl0BfcbLsl8hPhqXGQkk0RB44a4vVpGoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYItXpeHstIv0+Xg/gv4KqS9BQNsXnE1SaSJOQGJfTwykrmBeW0Y
	32kzndQzZKGBoLwyQzHytq+YQj7TCf86QjJPao2r8qAEHtGKu5NzupwsMGdArHFsawY=
X-Gm-Gg: AYBFou0nb7ok/WZcKbc7ccEH1IPMDMYERS3TQqUR8lKY2BiDaNEZPbvKU+uoObYWZqN
	m12fTpcCoDyaFAr82m+EuLZF2yNljpW1oXtziWv80NpTvwASM/IkxI7sOn6sbKTQ42GBbBNhAhw
	ZKJH8INBokcnstYQwVzFYNVEnwV7WGnlK/wjMrrpLgV7Y7uzivjjlZZkSlnNi5ZRt9HVRneb0Zp
	aO0dK9e2SITZsgSLQ4d6E6eOIno2uoUb1ig/KMMdQaX7ktT5JjRH9yv0Ik2rYLJkFMVLct53e/K
	gO+PWIjHS4lC6mWsW4mZicQbMyhS7JkXOk0GAUxia3jLvCKkZ34Nc40hE10SqjKEq5S7s1q4bBF
	8RE73ifw68nIPFsY5/YAH4vS7XBvMgwLR6yOyuJtxggz0zvGOeg+gLHuMz7qVAIHy0gD01NSdBG
	P4nppWgzp8oKvoPoFg+l6iQEE2JXUyy8cC5N8MjVOYf+rq7BQ5Jr/RxMbMjmRRAyHZkPCiXXbaI
	pWS7FcW2tQrBNv/XvKxlFffzDKzxDK9V16crn4PUV4=
X-Received: by 2002:a05:600c:6096:b0:4a2:fe1:26db with SMTP id 5b1f17b1804b1-4a20fe1270amr3372125e9.27.1792679359312;
        Thu, 22 Oct 2026 07:29:19 -0700 (PDT)
Received: from localhost ([2a09:bac6:37a8:294b::41d:9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cd7cesm791675e9.0.2026.10.22.07.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:29:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:29:18 +0100
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
Message-ID: <atodIhryrdxsU5mB@matt-Precision-5490>
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
> with O(1) lookups and none of the trie/bitmap/RCU complexity. If prefix
> sharing is still needed on top of that, deduplicating fixed-size (e.g.
> 4- or 8-frame) immutable segments from caller to callee in the existing
> hash table (chained via parent_handle) would avoid mutable child arrays,
> RCU retirement, and the bitmap allocator entirely.

No, I don't think we've done that. But I will run the numbers and
report back.

Thanks,
Matt
