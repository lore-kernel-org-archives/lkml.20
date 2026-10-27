Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125921;
	b=VrtMCIULWhdgK8Ugocv91T/50N/av2wN7tfJO83BM3lFbxhH4yi/KcYbDAhnpecbsU5v
	 Q4Onzy7GzyqzqIiGpLWKCLM/VBW90M++jtr0O2LhJpCGqYx/M94zdZ1jHfOszqkrCkrRZ
	 rIhaM41lPOF3HDzJLtY9siWkZefBRdYwOijshWoS60aHzn2i9sziAA3cLr9ZCu1Gzu0BT
	 3gcQTsJ6/tXwMLfcl2TrnOvQW7RH+W85JuCs+aB63tKcFYanHgW4CQ1yBpn2SSNCxx41G
	 Rw7N01E6/P7LLiQ6Mki0d1t+lOFB8inUyUdWuc7QBBYpRqNBcAb1uN6vTdACA/XGvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=LVq6pbjr7FsFX3prA+jfg0dfmRTCJpqiA9RsFP438sw=;
	b=DIEoFknQ8eU+B0aLesMbOXIMvEu/lmBMFgdhQO18NlDoMcZLI+nUWEGLP8/G8XxkG7sh
	 CXlkDvfpiFm0GANXwFa1i4F7nzPQT028gDqJ9uQqAyDcYDysUzw3WpCySC1WGDt+bMiQm
	 0+d39iMzcOwobsfLE4dzi1mrYXaflQdjjzjn9z25hikdW/0XVHKapCLc2P2dHQODlMeNR
	 MbMdI7TC+2tRSwIHwwm7gAQoy2+LIMJe1R3hGpgTiEDXX0Fub94baaAKtJArKEgJ2ZbAM
	 2MXt+A6DpYYHhrpMU7gItkQhJjX1kf14Dzv9ZSA1UjVW9lyOAiiF3bwyJ1Q/pXWIhWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lypTbGDv;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF48606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=lypTbGDv
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-77bf892b496so42453137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793125919; x=1793730719; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LVq6pbjr7FsFX3prA+jfg0dfmRTCJpqiA9RsFP438sw=;
        b=lypTbGDv9HXoXDplC1h9HTmdWs3Ne+a1E1GEgcrBl/cUspHpD0qUZdu30mLxxu1Dod
         hbR++bOoVCAAsyA1Vj5k3obbQ2ShURlDQTHWf08loKzCV+gEjUVeHln4IVGLt6JsECXX
         lScDcvmNCNJl1HE1VPiOnEjoCtc+/0J57Ie1guszv1R+DG2dJdO1gcaC/I2W/RKrwV6a
         Gfq38J8lMRYiiHpST3lfY30EP+Fim99usn/e1OVDkFkb9Ak7/YnvEbbdr67pIufNLOVy
         /I2o6l+S469PWtxGxJM8UbYQ5fCj919Wh2d29Jefpp9jBh3bcFJb1hUcIWCOqf/Yxn2Z
         VNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125919; x=1793730719;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVq6pbjr7FsFX3prA+jfg0dfmRTCJpqiA9RsFP438sw=;
        b=HChvxqF/oBB4oZ+0AjwWEYGvioSTJPKdUFGKds+SuGcxBBRxFBuKJjhv88FEi+iSpf
         gTo5FPyDv9qS/ydtW5KFV0nHOp3yu6uKuMqFj8/23RMwGkswKnFIDe/011X/+14f2XzZ
         oMK0eASRQfZZjLj19/s30T9prpVGziUASmAYX6NPEx+WR7DRqETq8NwdBpop+3DITu9o
         lnGRBhMv9kb6s3zKhOFsJOxzITyRl4gi9UXFfywlx0F/79Ol2bbUZxdYndAMJMclmCmH
         tQ9gNPSyuUM6HHv/q+cEFwCrPuv9c1d9ClpyagQHBtdlPD2LWsi8BqVczhOtbcdfbTkp
         G8aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXOWDNbqyWuw65Z1dK6GE6cMR5zLjyUbLFasTzK999aaHrt3TNrSJUi7hWkRYXVs0YqrVjp3JG4SUiVQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/OHqyy6JJosqQjuqgpFHB0xvwbmyhjGbw4rfmAA128HxPD6cs
	LUZOUinOkN8l5cCoV4r+AjVj0OKcEHhki35sEw/o9Yqib1yekQ3GAfcyemL1W97z/Hc=
X-Gm-Gg: AYBFou2orVxp2Hd7Rf9F45DstlnPY0FppCikq+C2IETRCJ3qA5TK2LC7hceytuz554+
	sgK3n/MzNacRKvnSCO7ZDZJYskS2nSU00PFWkqYqrBozCgPBas1liZC8z3IOk6xaJW0gVTyOrWq
	vv9QOmSGwRImPRZ1/FiA/lQ4BGAatG2fyDYNkd0uwupIHLXFYtKh86Osd+uGreVFm7Fy1dUtIxz
	0VLNg7Nt0vmWtSrC4JL2Ldm+kLEKEUwFddM6lewu5w2HFLHZMR4WenA2ShMJ0438NhHBjlT7KY9
	nvP9S8LBP0jlsBO4jbE9EHnqJnirHr9ZQKyJM733NmercKqSTiPKLcDBvSY9ftdvfWNhMArTcCe
	7hXtieHAFo2oryDbR1siphNLPmMwVaWLQuuMSTPQLbz/nZI3ho8QAzBnjJUrjCSkeLB4ES/WUdI
	UyJdRSwDNhDLW6O5Zed7ZpirCNcr+yodT/uU2Y+xFVzjDeAKKru3/RIVCre0VHVevRp/ZX+ZI3u
	tzTcY2CqK/pns6QfpsVMh61pwQzwUbAvNpDoxqWON8QkAW7hH7PFv5hpzY2fTx/BoSKtKzPBYvC
	8emvA/D+q6aWWJ6X+2jZENO6n4o=
X-Received: by 2002:a05:6102:1481:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7d03a509f02mr71066137.8.1793125919047;
        Tue, 27 Oct 2026 11:31:59 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6bff7sm109225116d6.5.2026.10.27.11.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:31:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/9] mm/page_alloc: don't undo a racing
 start_isolate_page_range()
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-pgalloc-ai-hotfixes-v1-1-9c7d1aca801e@kernel.org>
References: <20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org>
 <20261027-pgalloc-ai-hotfixes-v1-1-9c7d1aca801e@kernel.org>
Date: Tue, 27 Oct 2026 14:31:57 -0400
Message-Id: <179312591750.3837667.585125681248029246.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 16:46 +0100, Vlastimil Babka (SUSE) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> start_isolate_page_range() fails with -EBUSY if one of the pageblocks is
> already isolated, i.e. if somebody else is working on it. It restores
> the pageblocks which it has isolated itself before it returns, as its
> kernel-doc says:
> 
>   We then clean up by restoring the migration type on pageblocks we may
>   have modified and return -EBUSY to caller. This prevents two threads
>   from simultaneously working on overlapping ranges.
> 
> alloc_contig_frozen_range() nevertheless calls undo_isolate_page_range()
> for the whole range in this case, which clears every isolated pageblock
> it finds. The only ones left at this point belong to the other user of
> the range:
> 
>   CPU0 offline_pages()                CPU1 alloc_contig_frozen_range()
>   start_isolate_page_range(A)
>     pageblock X: isolated
>   migrate ...
>                                       start_isolate_page_range(B)
>                                         X is isolated: -EBUSY
>                                         (own pageblocks restored)
>                                       undo_isolate_page_range(B)
>                                         X: not isolated any more
>   test_pages_isolated(A): -EBUSY
>   (again and again)
> 
> offline_pages() repeats the migration and test_pages_isolated() until the
> latter succeeds, which is now impossible and the task spins until it gets
> a signal, while the free pages of X are handed out by the allocator again.
> 
> If X is released after the last test_pages_isolated(),
> __offline_isolated_pages() takes pages which are accounted as free off
> the free lists as MIGRATE_ISOLATE. Thus NR_FREE_PAGES stays too high, or
> hits BUG_ON(!PageBuddy(page)) if one of them has been allocated.
> 
> For another alloc_contig_frozen_range() or cma_alloc() the result is a
> spurious -EBUSY.
> 
> Return the error, like the function did until it was reworked.
> 
> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
> Cc: <stable@vger.kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Given i separately found this exact patch and tested it

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

