Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313455;
	b=JkYghN+9RnsnTVHtSKDrB7o82BVyvfoHl8bjX+3owLc5wEdLmTIYieWsQzVGrWZTfO+3
	 2J/4VtKzT8KTNjefEsX1rBkW5hJWzQKI7NMN33Lbtf10vukG3tTH2ogYMa8z1wlUX/4Ah
	 tN/y8Z3eKZe1TYOwWukugo4QhRAyt6gAgzWUO/+xRtPGmDbE/ULLMrzLmi8Q48LTABqvM
	 ZiinB2kexCy3ENnZ9Ok8Mp6kgqzhhk2DacEUX5XeawcptrX/KOfuqgBt1nwaCT6Zeo9rY
	 s+YaFo8If5VoLeHttDpDJ45VTUmHlXMLjJcEMX4sml6iPLIG4Q9D4BF9Uu/nUQvGAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QsPG26s54J59UedVlJRCxJXndkzu8TR98XKtjA3+1AU=;
	b=FTn8+OadVo9UvtzyxTb54+DQ/KFgxM8xQJwXJixy0FORQCgLueVwQemGLocA5XtpIHEo
	 8Iy4OqZ2TQOWqtF5eWS2nGME0nFQZvQ+zqUpzgbMtsuZxgsxk3K+m6O07qDpBW+PK9awP
	 JHNvBWKtc8ix2FrYeMcX5gVBkCDHBidolUEhxWot2huOv1kaWNCidFWnT2CNGoe1vCTGt
	 jakqVckstoaNO/Rs0GmrB0ZKUr49QpfiiqTXdo8Sxy0lz1pgZLewf3wC0rq4MjLuAqizD
	 ftD8i9WLohQB0PID9//Bulf+2OlBy4Ffgsk9VlESeAhS9FpOHQTWu2hOdXPG8SdKrZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Dj8dQusc;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2931B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2931B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Dj8dQusc
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b9e758c50so1457806d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793313453; x=1793918253; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QsPG26s54J59UedVlJRCxJXndkzu8TR98XKtjA3+1AU=;
        b=Dj8dQuscI3pp1qYG8b6KcXsqNxRwgQE+IOWiM0vtUQjEIGh8IwfaD3RVp2Sq+NkZSs
         qHMoSLCbstd/15wF5Qxa2sDK2cDninOwTqsTFByb6LIZeWLpAf55M+HCw+VO3z1ZiSFz
         Z6Y4/NbXOjcmI5YX9a9L3/cxo+EMOJApGFo2tjQ4Jll0Em88E0c83dh9v9h6SXqNx/On
         2wHea5ofylJY3o3NA05JXNgsRQace0begultrDe7a7ROFS6WKgW3x6gh7nqOxJ4i7bJv
         /LExpfmEtFE9vVmiUbQF1EWeWQYpAQErRDpp4Wwd5p72d7ZyNPjiJeWH54OxSiUGzSXi
         GcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313453; x=1793918253;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsPG26s54J59UedVlJRCxJXndkzu8TR98XKtjA3+1AU=;
        b=xqVs1wYr9bEN/JzZD37Zs1u3Pf43StphK2vD60imP/dXznL40pQvX55CzCiXK3DY8e
         KKjwN02fNNXoSi1DFQRblDcmBZT5M+92+izqfcj/vNatIoYswGSov7a1PA2ftTG1uZqv
         e0TTl+q39l374ZBVLGC8TTL+AldDPAi/jinyWBE2ZXZ7ibGtBMOtJl6kpSJ9ZlCEhBGY
         Dj83XH+hiNJPUeU/9JXKPOtrACWbsP9ux7sp3i6V5pJXWxEvUldzs7HU1ZuLxkl+lMeQ
         YCYyT2PGezl1JYZgGiQkDiyYB1SV4pqTsrtMvRfWq7jls1zqYu3nrcAjEIeXW1//ipH2
         19Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzETV5IknvD+D+0ef8smt7I5Cik9ObeoDt0+hyoeEC7ubY7lPEKK2gsejGm3V3egLKsN8TVhsLQXsptd2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdd1dWT8DtYM2JkUrX/fDFNl4p+lBfR0ND1Udgt5MxZ/No8O6k
	y5Js9IYGRQwN4fIreo5hYfCvP3sM9Pwkf9RtkWmxkef4Thqec/0+y7A4hq2cOTmHfoU=
X-Gm-Gg: AYBFou3GHG5tYl4zmIeVG9zLLIweL9k1/dVBIYYWkbQ882lzASZ+lezAtZh6L22LUvd
	lc+mF60JhkbvqTK2l4yO66RVIz3aAQ9DZEsbpTZaIIgSjZWqD8fCXGdDxmEPxv7PUkNcH/khRqM
	J/b8XfclGZV4bo0LrGPralYx0hyMj7SkYU0ua8I4F41+WmiaLnpHrViKpGikEQFjiP4MdAjJ5yl
	E9nEPYPCEBK8vpqIV9TSX7BEQxYT0k39gNHI86yiecujbW/LeX4Kbhwc4za5Xu/ZS+gxLougi9c
	RDtuYbcb028f7bwIDg9H5YpAP8nY8q9PF0/uD1ePn214opA39AHxnwPYowIwMkSYx0jTA9EtTVa
	e2YCWVau4mBWE8zx9/izxwMz1e00OPZ2TuGZ6Gw5ooFJsUHg2ohrleBFwm+7Aq5hR7M2XpHM3pu
	nJhgOwUJGiwUJhSnwJ/MCEnk1rabag4u9UYcwbdzB8bsKG8CSq1us8zI9dYz4QDdi2tw0XdP5c5
	/px6AdAdEWhvsg4AVqe0IgRYMv/s2Nixy/p94yP1XsFXgIq/CTuMCLJclYkEqJnGE0zN60lNWmF
	9QBWQjXdsF6oD7sYpysfAgJfySUZty9EBZiYx2uvXSfWjY12Wtn+6dYPZVDztq0+oXTNOxYuTFt
	dl0C/vgw82NOAvhzhtLNNog==
X-Received: by 2002:a05:6214:401e:b0:917:c073:1b98 with SMTP id 6a1803df08f44-91c90686fc8mr65881526d6.15.1793313453118;
        Thu, 29 Oct 2026 15:37:33 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca6855ea1sm646896d6.8.2026.10.29.15.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:37:32 -0700 (PDT)
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
Subject: Re: [PATCH v2 13/47] mm/huge_memory: fix truncate racing with PMD
 zapping
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20261029-fixes_core-v2-13-a64ce7f83abb@kernel.org>
References: <20261029-fixes_core-v2-0-a64ce7f83abb@kernel.org>
 <20261029-fixes_core-v2-13-a64ce7f83abb@kernel.org>
Date: Thu, 29 Oct 2026 18:37:31 -0400
Message-Id: <179331345102.2127828.8211829708894165734.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 21:33 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> zap_huge_pmd_folio() removes the rmap before calling folio_mark_dirty().
> If this was the last mapping, truncation can skip unmapping the folio
> and proceed without waiting for the PMD lock, racing with dirtying.
> 
> ifs_set_range_dirty() can oops if MADV_DONTNEED races with
> ftruncate() on XFS, when we get the folio set dirty after it was found
> to not be mapped anymore.
> 
> Move folio_mark_dirty() and folio_mark_accessed() before rmap removal,
> matching the PTE zap path. This keeps the folio mapped while updating
> its state, so truncation must wait for the page table lock.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: fe6cf984939d ("mm/huge_memory: transfer the pmd dirty bit to the folio on zap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify comment and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

didn't have time to run tests, but this looks trivially correct.

Might be some backport ordering issues between this and commit 14.
Hard to say, didn't look into the history too deeply.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

