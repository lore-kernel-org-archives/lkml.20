Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997978;
	b=qhs6L0ozXp3mYh9tvwuGWnh6jMQqG0lWTbe3ghPBjH/LiprBAOH0ernJIZuSSRY3MsAY
	 QX1LnryiasmuhjnKia52w6Ld7MyTiua6erN39lFYcx4rjwsGJRmg8R1e0N3owG7mWgpE0
	 b34Ha0kk/+oRdOARQiHXfdyrqlbPdQzWo6wE0dTsN2U73531PmLIbzP2DCAgToWONYy9W
	 rn2Xc4INUEg8sBbF/FbRaFYa9qFCExvaPIgvpzHd+Zrq1tJQOnKZF6uARvovpZH74sCfw
	 hT1kEkWqknRNnQ7X5z0kHLEtMzCxHMD+20Rfy256NnDQIYexAYmP0CAfgi70BupDSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZEes90VLavY8K6YFysNzmt6SItRkZVxy3F/LlAcJTS4=;
	b=yEgET/m6Ug0+dJ5BsDgUdAyUwKdJ8sO4kySEYSQzXPtMoPIZO1VMO3xBIPWHbY9/QOnq
	 NHOS218JWAePEOF6K6J/tn7R0hVT5r7+6sozMf/BzCI51zqsYOCVu/4kAN22BvjRxK6hl
	 9gzW5SxmuvGCpC9XBqYHU+BQSi+MHq4be6wTpV0eQiRopUQYUzLcEn01OptiBnmw3eP1b
	 zvQNrXzHFee0AkCxtci7ygpp1NO/H+YIGvQWEgp1qYgbknMheXha0A+7ScMkdFrt2EVLj
	 ZK5O4LT5Ok8iJn78bSO28g4Psd793gkI7XUa0GGHiu0CpLKycHcqjdi9TGoz5k0MFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ia03zhgk;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BAB606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BAB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ia03zhgk
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e4c00d71aso110109485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793997977; x=1794602777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEes90VLavY8K6YFysNzmt6SItRkZVxy3F/LlAcJTS4=;
        b=ia03zhgkg8F62JJYs7M675TbPFObrCOv0u4oHOTJtFvqnTcmUDcbBVFNeSxJ9PD1Vd
         X3++rXu7ynGxcD6HJjYul9kMp2mTDpSN23R4UUoU0ZwdqEDcmhgNvxGOesSBXgouN8oh
         WDELPOC7iRZZXkBkQkIwq6qlSeuTE1ejJR5M5F/LnPE30IX4g/Ud6Zh3xUNRGf4pAPVX
         dMOu9Z+AvpbbS4FXZzZIAHlPF/xPfKu2d/QsjpRhkxiFFOUWUxlXnYq3llP5eRSIsIwj
         Judl3kx/z9/513cMlbrx7zq3FMlrSz13MdWcwld46RFB6UfDXOczNFtCUB4PVH9CamY8
         GLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997977; x=1794602777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEes90VLavY8K6YFysNzmt6SItRkZVxy3F/LlAcJTS4=;
        b=BpkpFAjbxjew9tmshopAAAXH5yNYbX8VDCMFETHQJ4FdcPEzcrvGu8R9lhdc/kJ5dT
         KOPGp9BsfEqeYil6wxKyAfxjyi2N9WT60rOK0qy65Rt7+mLH/QKA4jYjRe0LyymDIMmW
         9TzNErNNknnxlArFTfYkY3f1szNROUe2zMNekcN1ocUMR01WGPs0OdPVZBhAnb9PmqNA
         SYrjyOecn1TUUT72aaGbIu/S1ITz4v0DwipA4mggGM9gIWkg1JVJqul+dUdsUTZ4E86g
         NRg77aio15zuoc6uDAF2feL1eR5CMYxdUvmWSEBJ0DAuxz8tf+7GtlyMSUdhQG+KXv5m
         ljPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5T7XdJ/AdRiQspYxDmYwN44lNuNW85I3SccaSqXJz3VVS4PZecp9HrPikEDhxw/y2SLFhZoC+tQ7L5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HIumuFb4BgHwWeBk2Y3+aXTXW+SmFzI1BFLH+eekpjmUPlsqP
	tSYNTRx8j8idJHqMmh+94fq2F7iyQe3d1MMIiW33eEDJ5MIkQ9ebXkwNbz1/SLnuCWQ=
X-Gm-Gg: AYBFou0959N59eKI2ZUYkr1iw1ctLILvXgaoaBr8rjt6NBIvgUso66CkVrKkzNQeEWQ
	HhDiuX1K1kpclYD7KujJSEKB8suDK5igld9z2MFPMxV4fzY0foK7VeXBWNHNFI75QEfqo4ox9nI
	Oigu3WtSSRlD7Bz9Ma+YscT/cUuId/VI9pRJp+vO9KfoBJgY7Bu9drzO1AJx3AfIEj3LWeE+Crg
	AxzGxO6LRk8Feo/OBpU8ltVTHAzucbMZjWN70TMRuzFKp+QYyDZOsbgpd57ibseKiyU9GFig/8y
	88KMwxuvEbD0hkTSCs/dzuurymOQXyAeeZvqFW88J/A2xsK81g8lDKFD9Ra9UBGyuvEl51NFfM+
	gplCaCfZbna/7VmqZMkStwrJp2tFEMRfeOsHcGp5cqBw/xUOxw8GgWFlDHxZRKG5myTS2anOlp1
	TwxnN7E/UA0wr5C2WsTn7xNkwS3OCivotPlrM+wvE5ZYmFprDlgAT7JzzylzX+igB3ANJk4Kg+V
	vMpd2iSFmRSBKRV/5tW6Qo1WJZlPqHYH1alt2GfEELGhoNu8gIEkixg6LRzNNMmTF265oPIJ4hF
	wQnRcRE6e8lyn9nvGyieuarLbAVu0Y6vDMg4cva29hpzAuL/7cSDHekZyQlNz91B/1vodm43/KV
	Be1XWnyGtug==
X-Received: by 2002:a05:620a:4507:b0:939:a003:7127 with SMTP id af79cd13be357-945f35a6235mr574216085a.52.1793997977262;
        Fri, 06 Nov 2026 12:46:17 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ac8d02sm28364526d6.42.2026.11.06.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:46:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPQpE-00000007fOt-0vRe;
	Fri, 06 Nov 2026 16:46:16 -0400
Date: Fri, 6 Nov 2026 16:46:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, iommu@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/5] iommufd: fix cleanup when adding memfd folio pins
 fails
Message-ID: <20261106204616.GL663069@ziepe.ca>
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-4-70b9c655da3e@kernel.org>
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
In-Reply-To: <20261105-refcount_overflow_stable-v1-4-70b9c655da3e@kernel.org>

On Thu, Nov 05, 2026 at 02:10:13PM +0100, David Hildenbrand (Arm) wrote:
> folio_add_pins() can fail after memfd_pin_folios() succeeded pinning a
> folio. Upcoming folio refcount limit checks will make this easier to
> trigger.
> 
> Let's fix three problems in the error handling:
> 
> 1. pfn_reader_release_pins() uses the allocated array size instead of the
>    number of folios returned by memfd_pin_folios(). With large folios,
>    cleanup can unpin uninitialized entries. Remember the number of returned
>    folios and use that during cleanup.
> 
> 2. pin_memfd_pages() returns on failure without releasing the pins acquired
>    by the current call. Release the per-page pins for folios already
>    expanded into the page array, and the single pins for the remaining
>    folios.
> 
> 3. pfn_reader_next() returns on failure before updating batch_end_index,
>    even if the batch already contains successfully expanded folios. Update
>    it before propagating the error so cleanup releases those pins as well.
> 
> Fixes: 92687c793644 ("iommufd: pfn_reader for file mappings")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  drivers/iommu/iommufd/pages.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
