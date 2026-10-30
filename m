Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793404095;
	b=HvxNRqE1qlph2nrtzUqlrVtnxlr8v7uzgCD5tXc3Vncjw45S+Sx5mXaSks67sBnYxOiP
	 IOIp5tAGiHkUrSPAjVW0GoK1eT2BzTuMobuX9UcNZod8STWsANwtvHSJt1vPDxfVjRR4a
	 zBtrxMYIhGmrZs6kME6sWpoj920TxvnwmCedkfYwxk9B3wH2IGoIcziWDEUQv1GigesXW
	 uU8cdOHVxsVUOTTu+o5zLAhuO16NhnG7RDU99yJToo7pAxtPyeg8nQcy29giiz8DStow9
	 tHibvB2X7lmAXaMBUdiWaYGOcS5AsQhtlZABHwTtXB2xSwzwa42fnq7qUrKLXZWiGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793404095;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uQmPF2jG9yjZyMk4TrcEAAEQoxSKIkZQK8ZYddN89K0=;
	b=XmPfaAzJc/Tdth1urf/g1xTgm+SJo6CXOZJzG2qIpvytakPIJQD16g0kv4yH0YRS+doO
	 VSAOO68B4gJsBbqLPOkzpkKiMHvJN86k7qcVP2SYwuIXwqdNZno2wZ48MBZj+4s7cFkqT
	 AG+vSt4hEgob6HVYMyE+xELTCfIZhUP4BlEDoTwmm6X0u+cqEhvNxd8gGOBtn9entPw1p
	 0+6+c7nlubJ7mqr5GpqL1CUyNhRWkrvC+k5myfv/7BmgI1ENz8lC244uNWo9ZYxXTrPdP
	 sQxGZl7cgH2IXhDOifMS8EDeU3uPhwSSHF3w4BDrDECFLj17+MYsO2gCOQWX7A46YYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MT2/EA0e";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C664606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MT2/EA0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F9F1F00A02;
	Fri, 30 Oct 2026 23:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793404094;
	bh=uQmPF2jG9yjZyMk4TrcEAAEQoxSKIkZQK8ZYddN89K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MT2/EA0ezaYproGDll3KiLAyVEWSPZoKHiRXDywJ4aHQIzyhxwRWbhglWb3e7dKsz
	 AEnmNyNX8Rcma59EV7eOcdo43hJV3UWyyp1EEpZA8V53cZzC8ibmhrWsCHhd3ntURg
	 c5P/CKQqJKTkQLSHunG90TVVjWY3k050fH/bObXqsHH1hydv3QVr/OgYQi355iFOiF
	 JtArXodjjPIzQ3o0JyTSceeGaK8Vpf4oWVTDg9aqSczBRMGkGDD9LAfK/1mBWdRTX0
	 vIoNdT2am2JTHVTTgrC8yNDOYEoiKRQXV4BL7VJTm0trkxBMccLX/hXZvuwU8ol1v3
	 PE2FPFd1CIhgg==
From: SJ Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Byungchul Park <byungchul@sk.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Dave Chinner <david@fromorbit.com>,
	David Rientjes <rientjes@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Gregory Price <gourry@gourry.net>,
	Hao Li <hao.li@linux.dev>,
	Harry Yoo <harry@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Jann Horn <jannh@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Nick Piggin <npiggin@gmail.com>,
	Nico Pache <nico.pache@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Rakie Kim <rakie.kim@sk.com>,
	Rik van Riel <riel@surriel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Date: Fri, 30 Oct 2026 16:48:05 -0700
Message-ID: <20261030234805.86833-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 22:34:24 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Hi,
> 
> several MM updates:
> 
> Make Zi Yan a THP maintainer (thanks for all your hard work over
> the years and thanks for taking on this responsibility), and perform some
> MM MAINTAINERS cleanups.

Congrats and thank you for stepping up, Zi!

> 
> Then, start the next step of the transition from Andrew's MM tree to
> separate component trees that all get integrated into the mm-next
> integration tree.
> 
> Start routing shmem through mm/core.git, adding me as a maintainer
> primarily to pick patches.
> 
> Then, target the following components for the mm/core.git tree that I
> (co)maintain:
> 
>      - MEMORY MANAGEMENT - BALLOON
>      - MEMORY MANAGEMENT - CORE
>      - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>      - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>      - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>      - MEMORY MANAGEMENT - MIGRATION
>      - MEMORY MANAGEMENT - NUMA PLACEMENT
>      - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>      - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> 
> More details in the last patch.
> 
> In the upcoming cycles we'll then route more of the other MM components
> through different trees.
> 
> Let's see how this goes, in particular with the continuous stream of
> fixes. But getting these in in a controlled way has highest priority
> right now wither way.

All makes sense to me.  Thank you for this great work, David.

> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

For the entire series,

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
