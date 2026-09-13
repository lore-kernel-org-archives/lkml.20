Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB83B1B3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789274264; cv=none; b=KXxfLpuvDx7w93qz1A67LXOZ04fC9ZXqZ6QEcx5vnlqx3ZLwN/Zf11OplRWe3FBOXh31A0J4rnzMv1RcT24+ikzVpjm1dcTNPliuXcZxnxMjqiro/VXwlgny4pN2s/mzE0O8Es4cVCi4+WXnBcN/h1uA2W6PFVD4VhHjecgkEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789274264; c=relaxed/simple;
	bh=N5DU3jE9Ha+pEFiVOQIIbHbM4Utlx8c95dxYDvh8YaM=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=O+j25rz6vo2AQMa/b9hNbrqbHCtlqzIlfiIWc8OWXI4WnLFMN9tPURYKtmjNqAYT5XqVevFALqTBQZexXcX3v4KlyuQj5WvlOTTMLvgfmewFSTqAMNStdu953Ifo7T2T+bHV5uQiX5STzGHVK5j89BoSwgYf6WKMDOxY/wklpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjFrG0NNpz8Xrnt;
	Sun, 13 Sep 2026 12:37:34 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68D4bQe7054530;
	Sun, 13 Sep 2026 12:37:26 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 13 Sep 2026 12:37:26 +0800 (CST)
X-Zmail-TransId: 2afb6aa62886b18-d40f3
X-Mailer: Zmail v1.0
Message-ID: <20260913123726763Xj9aQ4CLYQy2_J5ovIJCG@zte.com.cn>
In-Reply-To: <20260912082407.75875-1-xialonglong2025@163.com>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,20260912082407.75875-1-xialonglong2025@163.com
Date: Sun, 13 Sep 2026 12:37:26 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong2025@163.com>
Cc: <akpm@linux-foundation.org>, <baohua@kernel.org>,
        <baolin.wang@linux.alibaba.com>, <borntraeger@linux.ibm.com>,
        <chengming.zhou@linux.dev>, <david@kernel.org>, <dev.jain@arm.com>,
        <gourry@gourry.net>, <harry@kernel.org>, <lance.yang@linux.dev>,
        <liam@infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <nico.pache@linux.dev>, <peterz@infradead.org>,
        <rppt@kernel.org>, <surenb@google.com>, <usama.arif@linux.dev>,
        <vbabka@kernel.org>, <ziy@nvidia.com>, <ljs@kernel.org>,
        <xialonglong@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRkMgMC8zXSBtbS9rc206IHNjYW4gd2l0aCBwZXItVk1BIGxvY2tz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68D4bQe7054530
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 13 Sep 2026 12:37:34 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA6288E.000/4hjFrG0NNpz8Xrnt

> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> This work was developed independently before I saw the above series.
> After comparing the two implementations, I found that the approaches
> overlap, so I am posting this draft version as an alternative 
> implementation and would be happy to combine the useful parts.
> 
>   The main differences are:
> 
>   - use per-VMA locking in the ksmd VMA scanner;
>   - revalidate the mmap-lock sequence before skipping the fallback walk;
>   - avoid repeating a completed VMA traversal when no candidate page is
>     found.
> 
> Benchmark (QEMU q35, TCG multi-thread, 4 vCPUs, 8 GiB, x86_64 guest on
> Ubuntu 24.04, 7.3-rc2 base, CONFIG_KSM=y + CONFIG_PER_VMA_LOCK=y;
> victim: 32 MiB anon, 2048 unique pages x4 duplicates,
> pages_to_scan=100000, sleep_millisecs=0, 3 runs each; churners: 4
> threads mmap/munmaping 256 MiB in the same mm. Microbenchmark as
> posted in [3]; relative numbers only, TCG is not native hardware):
> 
>                        0 churners      4 churners (mean)   
>   7.3-rc2              1.21-1.41 s     90.9 s             
>   + patch 2/3          1.41 s          48.7 s   (-46%)   
>   + patch 2/3 + 3/3    1.21-1.41 s     30.1 s   (-67%)  
> 
> 
>  1. mm/pagewalk: allow folio_walk_start() under a vma read lock
> 
>  2. mm/ksm: use the VMA lock when looking up mergeable pages
> 
>  3. mm/ksm: scan VMAs with per-VMA locks
> 

it seems your patches may not be rebased on the latest mm-unstable or linux-next. 
It might also be worth double-checking any AI-generated code before sending it out.

I also noticed that the content of patches 1 and 2 is already included in my patch series.
Perhaps it would be better to focus on my series for those and I'd appreciate your help
reviewing them. For patch 3, feel free to start a separate email thread if that works better.

Thanks
