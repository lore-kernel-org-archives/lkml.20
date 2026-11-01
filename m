Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553256;
	b=URm3x2UulgjI/HNvOf6603laUW5gwRy5yAO1yJ48vBAGTlfzJHpT7yT1BqSlrnGETUm7
	 QZwociQ6ARDiu2FLy4qI+PT0TXp+dMIY5wPD0fn4/GkDWVjM1jynTPhjzSlgqlU3wTe/b
	 o9ys1bp5vChuSdVKPPHyYtYnUaAFUESyfercxa3dP5YclrtiReoQk4/MalTrdyzScKfHy
	 MOxaXAn6/aTvklqLMwt8XVtyNOddscMVPkxjcrntftzD+/JRiIZOEW4rinA6j2v+lBeu8
	 G1ujVS8SgdS2trZSgHGVGfgf3vgeMZ2AuwYDoRtnv7KfQHuZ4Rx12HyrH70g1vp5FwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R6gUavSXN8o98nfRqPmDU4mBwMW9oSNT3lHuUTmjbYo=;
	b=vH0tuKdFwQb1bXKXN4voxyBNxj0p2f3LfZzi2uwXi7sYQz/+V/z+7isEHGlAmi49Ef40
	 SEJ/h2mg0BconVZ7kMv2vsx3+9VA6ZtloXA4ZtV1wrH868RdEsbHtlNd2jM3CBr1OQ+2P
	 szJpeteuTYwcMFrO4FJAIjNI7HEpu1mZVMjQr0uj/IWiaAZ4C5WMDuLN9UEqmGkwJR9ap
	 gzI8fWjjjb7+JwBlCDWaoKwNoiwcGl1Q1RKpi+rQgydMZMt6QIgFdpaBNS+DYY0mfmELf
	 wVQXIl5gX+3OEJrp++E4b6kAWmQktbPhxDqRcKZq8FIB5dpqQGzwyp18X5EddCRbcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NW0/ZItu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F3606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NW0/ZItu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7622E1F000C1;
	Sun,  1 Nov 2026 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793553255;
	bh=R6gUavSXN8o98nfRqPmDU4mBwMW9oSNT3lHuUTmjbYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NW0/ZItu8ulb85kahpqmxU5Cdhwkdm5fODVcRqYy5093olCiYLGwX7cw1FLgl/Wr8
	 be6fSFpfOzilrkt3Mgrvv3f30APu+WmoLRhr6w5YThqBESoP5fQrAnIRvDI+unlBU2
	 XGY/8ngxF/IMenuje6LAqPjw894hwe+xyz7HmvasyKt/fGFx5myHpXwVbtlwHGIAdV
	 bB06uoPXtIzgtCDJYVFA8LfpKvY5/jU7OOmM4yRQIQRaHCfhUvHo0WMuxWN1NR58rh
	 81Kl3CuXfHLi8oQYLM0CMiFJlqua3DYgG4QBD9lfGheBq5gAgkTK7Ku1qzRr72QTQK
	 Ed8/XYIg/OB4w==
Date: Sun, 1 Nov 2026 17:14:12 +0000
From: Harry Yoo <harry@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Dave Chinner <david@fromorbit.com>, David Rientjes <rientjes@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Hao Li <hao.li@linux.dev>, Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, Nick Piggin <npiggin@gmail.com>, 
	Nico Pache <nico.pache@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
	Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Will Deacon <will@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/7] MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
Message-ID: <audzTEdSflX9iZMg@minisforum>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-2-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-2-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:26PM +0100, David Hildenbrand (Arm) wrote:
> I am not really the best shmem/tmpfs/memfd expert around, but it should
> be good enough to judge when something is ready to be picked up, to then
> pick it up. I'll have to heavily rely on Hugh and Baolin on judgment
> for the more involved and more controversial bits.
> 
> Rename "TMPFS (SHMEM FILESYSTEM)" to "MEMORY MANAGEMENT - SHARED MEMORY
> (SHMEM/TMPFS/MEMFD)" and move it accordingly. Add myself as a MAINTAINER
> so people know whom to CC.
> 
> Add mm/core.git as the target git tree. Once shmem becomes a high volume
> component we can dedicate it a separate tree and have dedicated people
> pick it up.
> 
> While at it, add some more shmem/tmpfs/memfd related files+directories
> we missed so far.
> 
> There is also "kernel/pid_sysctl.h", which includes some of the pid
> namespaced sysctl vm.memfd_noexec. But that's really more of a proc/
> namespace thingy, so it's not a good fit here.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
