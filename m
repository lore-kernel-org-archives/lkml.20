Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325739;
	b=XX5uApuAM2gwR6fuuxdcu3GSLiDKkNp4Vcnst0lUH3ukFy9zqZAUDAJ/68xpRE24AoYa
	 EsQ4VR1P9MTYY/pgAluv/dj1p+y0BcI205OcrCIKenQjkVY3OBEbF8lsMHrM4wcDo0CXz
	 lLAaWosUnAgnWm6mByTc3vwIOukWqZ0FMWQwgpHYIJOECLjokh+tRmITVIgXeYsONSYwy
	 AGCb1VqftnSQNw6vjWY7MiR4ARYhFmM+0yilOzEGkqkLYYj/dMtQtVzGR9XmntniEbYrE
	 oDy3cJPPwhm4KqXAG53iDrFOzVmLdbs/FImncBWoXJ1tY3TH7tcWnQksIuoICyODFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325739;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I2goAa7rOJG9DFPTs3OAS354gRoMeX0w/v8rucPDrlI=;
	b=p5YYmYgirQIbux92Xs74MWnLKz5fyZIgZun+OWcwyeKtEdUG81qqPgenlkt1EW6toh+n
	 74GcU7th4wg7XSsJjIatWW3Z4e0H3ibfOu5LGu2+aPzMOnCumLXslrSeebW2+UXTbWeU+
	 vyDDdwAtkMYQaU/meIGMjOmFmJawgenoP883Wwxl35mSOcLMkAgdc57PQjmLjn/uCRAvQ
	 00KE/8KPpy9EBrmYLaw802Ev401RuOgml5yYRUL/xZ4fifdiA4cLJm3YwDftwRIJolROh
	 zM6k6aPStIAb3taNDajLG6J0psR641i2HXmwwJCEVC6ya0BRb/++QAgzPSdc5tv18gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q9EpBH5V;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFBB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q9EpBH5V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2iq7XbvFNbuK31FsnFvQrU97laf+/qBVznGg0D8pQ80=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793325736; v=1; x=1793930536;
 b=q9EpBH5VBPZJt0TZllqPryjm2JMjhAUSGuya+bK2nrFbfYnsxKUIcM9NF/tGd5TFbqsZHGIg
 EthPMMOk5zDSrBi+MjTM+Wi/1YbfVqTbB485djr52OmMHUF4AmqmMwHTTSXzTY1GAXb4EY5FicU
 8dyf4rNsFZ682r5XSdsGtIwE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fee4872bd9a223aa;
	Fri, 30 Oct 2026 02:02:15 +0000
X-Mizu-Trace-ID: fee4872bd9a223aa
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 19:02:13 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Boris Burkov <boris@bur.io>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Shivank Garg <shivankg@amd.com>, 
	Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Message-ID: <auP6jNHELlVhqmBY@linux.dev>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
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
In-Reply-To: <20261027043214.2248986-1-ridong.chen@linux.dev>

On Tue, Oct 27, 2026 at 12:32:14PM +0800, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
> AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
> counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
> filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
> being removed.
> 
> __folio_migrate_mapping() does not move it when such a folio is
> migrated to another node, so the source node keeps the count forever
> and the destination node underflows once the folio is freed.  btree
> folios are migratable through btree_migrate_folio(), so demotion,
> DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
> all hit this.
> 
> Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
> all CPUs, node1 is a CPU-less slower node described via HMAT) and
> /sys/kernel/mm/numa/demotion_enabled set:
> 
>   1. mount a btrfs and create 20000 empty files, so that btree folios
>      are cached on node0;
>   2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
>      them to node1;
>   3. umount and drop caches.
> 
> nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
> each step:
> 
>                   without this patch     with this patch
>                    node0     node1       node0     node1
>   1. cached         1868         0        1868         0
>   2. demoted        1868         0          36      1832
>   3. dropped        1832         0 (*)       0         0
> 
>   (*) the counter has underflowed to -1832; negative values read as 0.
> 
> The global value in /proc/vmstat is 0 after step 3 in both cases.
> 
> Move it together with the other node-keyed page cache counters.  It is
> a node-only counter, so use the node accessor, matching how it is
> accounted elsewhere.  Interrupts are disabled here, as for the zone
> counters below.
> 
> This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
> for the same function.
> 
> Fixes: e3a9ac4e866e ("mm: add vmstat for kernel_file pages")
> Suggested-by: Shivank Garg <shivankg@amd.com>
> Assisted-by: LLM
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>

Thanks for fixing this.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
