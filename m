Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072434;
	b=f5D0O1CqkgwnNZHRYnwenug6XtiDxxvNnAriDscDE/Angaq5ewncuDjLw+fswrmvyQo8
	 dkxKIYI4DbfqwdGyZ/gL+c+rPZXB5wzXRTxWRr6QbaHMucEtL9VkHx3g/LxVeLGd0A5bC
	 VyCXs1tnCAE5o6zS5ExxfFKl2mC3jjDknT74Vx+kW2/csWBeQ3VTd+c8Q4VR/Dcj+Xs2U
	 d2Lk5WRvCsdi8hfQlk6/tjrzNawR2JSX5FD0TXwVWJ4IjZdXJrtuSOBO88k3bS3x4rBtF
	 pa/EukS0IwC2LD1iwVO2sLoXZgV82zboA8Hc5xwo4SPMPzuy7NzLCiCG0vwx2AaGWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=cRzqF3pZC9T9+mgqazzI3wB0gyIKv4okDYmmTH+ci9I=;
	b=ufYc699Pl2EFiF/aQZsh6Rj4YwoM36liQ/nZPtl5Z608vzC+oTKSdIQGBBnWCao3lFbc
	 jLdq03w8BvGvDBKHPqr3MsDbuGdTEuVdItHPuUPKoK1lz9zL2xP45g06wofEKVXNdPnqS
	 dMHFSTzlfpvT+kcoHc9amh9goGjbS7xPZAHXOFwu5ky8RlSpFbWKQ2yH078HgQqssAeKj
	 /5DBgAQ54xOVplNSmn59EzKpPvOM/GI4YPSz/+hU0VzCLps4FLF2S7d5t3EaejdFmlrjS
	 2N6Zs6bBGArCeSpjxaKk8FP11Z7mqO6Io9hzH2WJNH1k836fvfxeJ0iX8rQzi8uJOUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=klpxKBx6;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D1606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=klpxKBx6
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c46822eefb6so480736766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793072432; x=1793677232; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cRzqF3pZC9T9+mgqazzI3wB0gyIKv4okDYmmTH+ci9I=;
        b=klpxKBx6XIdguBPv1gdEeaxX3Q5nBOE0QyQKgI+nQtmFi2e6yyGoD1z99atiOq/X0L
         29MGF1ep4EQ1gv/+055Qkplcqf1YtKuIcCv5aGSKHjEYK3jS7yM9nfCIB9wNkxkiBkUw
         3XYbbVntwybyBZUIqAVzhr/u8Gfrjw4XN/c1wAbiBcjL3VyyvbdMABrMl8JljkCI4HBP
         HDeVnIkL+LtyK7DjLzJaTMJ1PXNZWLEFJCqh4gUIf6KP43zgwJECwGuEgMjpM78oIwbB
         yrbDn8qUsI/PxLnPvbStsGGa4HcTlJR/M8tesdaSKCW5YkmlnkFTtYdIc+MJU/KUH2YX
         ocTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072432; x=1793677232;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRzqF3pZC9T9+mgqazzI3wB0gyIKv4okDYmmTH+ci9I=;
        b=IwIl2EO50yLndGrOi3LA6Z1H/6mBVajfqVNNxxjDN5pO/IdtpuRg5739nry615d24n
         FVFhjc7EGopEBR5goET0sukfxtWRg5fvPu9WDQFMTC2adOwrvVkpO+40h9q0I+hjvL4r
         W8rEQ6qSHJMJ+pAKzJhoLyf0ETrfX+hlwWHPcewREjhFhLG6knaMPszDuwhkox0CpKRu
         Wit7IUGHIDxuUkTqo1unTnewCWcRl/aVgQmUKyubQZskVMQnnY5TJHqmCtDrfJFjWOjr
         C29DB9P0xVXhHu/zBHt4I4xvBU+FyceTYCMhmmRLh2vkzWXIE8iZYf0l2/w6wXp+Y3ho
         fDWg==
X-Forwarded-Encrypted: i=1; AKwUvByWA7I16rhZMbs9+aIBI0NIBLx0J520g0T8f+b01ppIyQmURF/tA1CHC5wkMMNmqVs7KLUmyl56n5oVFbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIc6npFMn1lTr1Fok6r4hFpMgL/dDoSsoCunIitoC4EevGzp1H
	xNP6BotpR/tMGbkZ6Idffwe7lO/1oebRi0JgVIeePmoklDQXpiuVCwGIJAGoeXg/djg=
X-Gm-Gg: AYBFou34KtRb3umGs4YhMG4ZR3uvdPac9oKJjUKfAidiOkzeUWeDWpxsQC3G+BfyFLL
	7A1p+bCJ8bCs9qhw0kFiHQFNeV/BPSKQE4ocF4rB1MgZ5CpG7dMmb+97LakqYrcPq+8rXOB6wG/
	smt04BR3RQIl8e6/UNhoRgZTBUB/a3oMpSKmEKRROM8XWj1y3hAMqaMP30oRuIX+Dr4ZV21ykZT
	6BdyVySsdKaWVhvcVXk6dw2fP6rOE1uyRp+lML9mq7LzElUoBFd1cOe6RxfjqQjwCJX7obSFk9G
	scjeeXXSLsYvQqgsyeDAfrMbsTkJB4lwHms4N81VuyyOB0ock36uOC/JJhba3NhJbe+vRV7V4nM
	kJ5UXNf6J3cDTWdLOgb1pa3bWYqP69YxPeoOnK8DmNBxS/uzOQNZAjtsgggYGaLeGHhAXHngWl0
	Jidyp+m2A909qWOW8OwG//PSEguGnIOK4PgGYdNYN3MkxrK0l/bjJ1pOVv7zLnpQ6ShwJtBoloz
	5E3GCt+IA0y6VCXjMi38c35iYHGWWiJaRVbAdNyUAvS+A==
X-Received: by 2002:a17:907:971e:b0:c46:723d:600 with SMTP id a640c23a62f3a-c46bde9f783mr916491966b.41.1793072431944;
        Mon, 26 Oct 2026 20:40:31 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm379153566b.19.2026.10.26.20.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:40:29 -0700 (PDT)
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
Subject: Re: [PATCH 26/46] mm/mmu_gather: fix flushing ranges with 4 GiB or
 larger
From: Gregory Price <gourry@gourry.net>
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
 linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-26-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-26-6f74bec9a5bb@kernel.org>
Date: Mon, 26 Oct 2026 20:40:28 -0700
Message-Id: <179307242835.1171062.11616590599815003560.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> __tlb_adjust_range() takes the size of the range which has to be flushed
> as an unsigned int. Its callers, tlb_flush_{pte,pmd,pud,p4d}_range(), get
> and pass an unsigned long. Consequently, a range that is 4 GiB or larger
> gets truncated, possibly to 0.
> 
> On arm64 with hugetlb, a 64k kernel can flush 16 GiB hugetlb PMDs, and a
> 16k kernel can flush 64 GiB PUDs through tlb_unshare_pmd_ptdesc(). So
> at least these two scenarios are affected.
> 
> Fix it by flushing the proper range instead of the truncated one.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: b528e4b6405b ("mm/hugetlb: add tlb_remove_hugetlb_entry for handling hugetlb pages")
> Fixes: 8ce720d5bd91 ("mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> [ david: use two-tab indent, simplify description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price <gourry@gourry.net>
