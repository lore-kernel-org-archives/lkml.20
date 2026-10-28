Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201041;
	b=laEDyUkqxz3bqTXlUs9fbzMzOzpCnHgC6tumQPr+ZTWZNF8U6/7V6Bx1qarovbGgGYa6
	 rkPXvexik61s+/i7ZEe26j/Rfhp+d/EiRRVKR/vUvODcKVf4XsUe4PZLyPBCe2d36+GZl
	 9vAKcNlTq0eLJMabVdC3ROJ8q2FZBxr32Z5Au5mGMbbkSSZMcTlwfcyZvVn0Era3INq11
	 jpGo8sPyvdrsEIpT0FJi5BQ8VaceFVc2+3DmypSUkzoD2Ma6FzdRIM2oZ6NPHOaIMpoO9
	 i/CSn51gjYBAULnjC1gAUfwWXbtcBHkdyyedHS/SxriwAvxvwxp8JcsDxOOb7zINQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
	b=iifkwbR5tW1jMtAz1o7igOobT8Uw5y1AfiplgZ3U/mGlM/SxM56wBNe3TlSLZahfK3uW
	 hx3+a4gWQPH9THUcTj6/JzFGzgPiUm2qGYLu7q71kBiV2phAo+AUmFcCl05tYa0TQ/vAu
	 0lRVqf4gmotmHwLg1xX5CRk4AIawcVfTQ12Qb90CIZqElnaG+JLq082sXd8uoQBBnvkvt
	 INj8oY5b4YoSxP14uWFQTU4uhasgmU/mzEB4FU2/kxjCG43hKF1gzVu/INKc35XKmtnFA
	 Td4m0PX6OtcNTpUUrVnAf93dzP41N0/5CjlW35xQwXelLfM/3EJDS6yvD5cIBBHPrCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QzsOFHTn;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B28606AB21
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B28606AB21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QzsOFHTn
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d68de53053so612837eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793201040; x=1793805840; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
        b=QzsOFHTn+8+YYCPTJGlmJAzYJSwbb+puZMPW8ZPyRBshyLngAY+e6dPhx864T41TeV
         VRoSqpZvHxzPFF3fa4fGRSkeTPwimQr4nEfmZvP+5fZNAO4/mcunv/VJZJ3ivpfeQnby
         lKmOSVPl/Oez5xPk8aefWZsD/XQxg3z33pUYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201040; x=1793805840;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
        b=kEpz3yMERdrQb5rqJ9f+wGnPCtsVyEutFs07UzMrNIixfioA7re5gpyg6kayMdWOsS
         Iq1VR2fn2vqf8pMytNria1fMvHPWIbp5QUnReuLF6pZjJU0WRUgoupFPOMDVGjeQkzgq
         Czmm2nKLLNkfaIcMUHCf36ImC8sulov3CLbDWoDOunopmIrelBsm3e5B0I7UO76kpvrT
         HODezCL4EFJC7cs8hsEoe4WB5LRfkqQKvgnTp7S2EwoESTRdbraanBIhBqohCDHZJQyO
         2BJJVkEc4ybcM7GsHKkN2658TDodwI7oeUBbIpTs41SNV0hfV7C3ooJa3xbPnpDFrdox
         oA1g==
X-Forwarded-Encrypted: i=1; AKwUvBwsREX3CJPC/3O+hbJTVrYLqX9zBNf5hFcBTnIhTjWtOcS/j+tTDzTk9jRoGDegzfEhHzasieuMa+D/iP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbZF6BgiDUWc/3Ff55IcyFLl8W0vqUiG2owOWqm9tA70bB6a05
	91o9+eLJAJJj1P2FxELIW2T2YHCpD3BkD7bowSxHl7IjN1Zn555QbwsatZF4PiuMS0s=
X-Gm-Gg: AYBFou3jNG7E5ZRVNLjpOmaf4ETgOLC6nrYDG/XHVZ9iSrngtmCW63E3JWVI6e1w4KW
	BL6MzbS34MB19Z9eOcsD7l8/rSQ9fVwuOvr9wMxuL4wjxzmAZhJUtBHNP7EskRmmoJhgARY74hp
	iQW2nnc/xT4ADRG9F6O8cnFsvlii5JUnAIIjJ3nHX0HiIUjcLuf0hb+UVFbV0VWyaD8R3SQphvj
	J9x9nLkkDLpO4DHGJkhRzENWpH4riZqlZM9sT3/zzE123kJXpQ5uX6gnJKGi03FxFat8m+TNBO3
	3ue0ednLvcjOJZr3lL9Nci6u2mN+BJUZjVuD70oQU7lKkE7qUv4Jun5ifoESSYK9N0bcd2kKQN1
	G/CYT5xz8tzRLzo80YVkDicZSrJFSz2ZteE1Am5grw6Cv9S6p1QpRyQoShGfQ4wk2lFLErwLeg3
	zeTBEUkxdkwkfOxzPOJeIKmmfHjp3vhfqq0VNjVTUl5ulEC+JjhSaANXhTHiGRv9B0q/s5SPJKp
	ysOcT0JGDdRbilNyl3CgFqKBdIivW+uHfnBugXHNXtrbzvCrrsuRzSVhV04KwRKZ+hEF+wj41lk
	KDzItTkC/ZBCJi353LR9D73fC3FNdtRetpz9WLLnF7Hm8sAFwwWZtTwBiMjWZA4pG+TUE+cJqmv
	1vAdQerh3pWajTDTbuCFLhO2uaGY+fc0R1exs5aVNap2d0VbOOmE9rj5mb9572sT/4dSGMAR3J3
	IwsfgK7l4hlpAHAtQF5hI=
X-Received: by 2002:a05:6820:8597:10b0:70b:8379:c170 with SMTP id 006d021491bc7-713ee85c744mr964651eaf.27.1793201040161;
        Wed, 28 Oct 2026 08:24:00 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142c736d4dsm1749066eaf.8.2026.10.28.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:23:59 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:23:55 +0800
From: Chris Down <chris@chrisdown.name>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/8] mm/slab: Support selecting slab hardening features
 at boot
Message-ID: <auITixAJMfLtfa7i@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
 <16121542-acd5-4727-b64c-f8d519145b63@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <16121542-acd5-4727-b64c-f8d519145b63@kernel.org>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Vlastimil,

Vlastimil Babka (SUSE) writes:
>These two should be only a small cpu overhead, which is why distros
>generally enable them [1]. Also the code basically only runs in slowpaths
>because percpu caching doesn't use freelists. It's possible the static key
>conversion doesn't help anything. You could try to measure the impact, I'd
>be surprised perhaps :)

Well I measured it, and you're right :-)

I built kernels from d15d7703166d ("mm/slub: initialize the free pointer of the 
bootstrap kmem_cache_node") toggling SLAB_FREELIST_HARDENED and 
SLAB_FREELIST_RANDOM, with SLAB_BUCKETS, KMALLOC_PARTITION_CACHES and 
SHUFFLE_PAGE_ALLOCATOR pinned off on an AMD Genoa.

With both on vs both off, sched messaging, perf bench syscall fork, a 
tinyconfig kernel build and netperf over lo all moved by less than 0.8%, which 
is within the noise here. So the slowpaths do pay, as you'd expect. Here's the 
change in ns/object vs both off, over 64, 256 and 1024 byte objects:

                       hard           rand          both
   batch alloc      +5.5..+7.8%    +7.6..+12.5%   +13..+15%
   bulk alloc       -2.0..+3.9%    +28..+32%      +33..+38%
   batch/bulk free  +0.5..+4.6%    -1.7..+0.6%    +0.8..+4.5%

These are from a small module which just does ktime_get_ns() on one pinned CPU.  
batch allocates 4096 objects with kmalloc() and then frees them 1000 times.  
bulk does the same with kmem_cache_alloc_bulk() and kmem_cache_free_bulk() on a 
private cache, so it keeps creating new slabs, which is where the random seq 
gets applied.

So for us the right answer is to likely just turn these two on rather than make 
them switchable, too.

>Maybe we should just make them default=y.

Agreed. In v2 I'll replace the boot parameters for these two with patches which 
make them default y, and keep slab_buckets= and kmalloc_partition=.

Thank you for spotting this!
