Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553412;
	b=xDPPzeljeQMy6xJ0IGqqe1Dv5Y/jPHDjg4KDHiyL4PRjrnKn262Pwjhqbbve2ufE6cJV
	 pMxOde0/ZVjWPLu1gWNHC7k75PR41QqyagbZgcpEeN3CIGkwVrbK5phdolJLDBxBfOOUC
	 3iY+EwygqTMQvrjxCpEwkSo7jt/2BS9uWEXsPBqLx3tq4CWe0GaSCDwFp1F8DDcMq65ZK
	 BvZLvyowcTuBut14XLxO/SbydSdZEK4zdK1Xf+fq7mdAcs8Ocwa+1T70ExURymhZkKIsF
	 yB+LpZUlSV44X01C8L46o+zJs0dyQtIyIJfTA37rJsPdZxqbVDIkhs15xkFxaLm/BUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553412;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vVLUu+AsEEXAqlGZC8nIuBCvaj1H9qW+4CIlawaJEH8=;
	b=JtnhwFoPWxMNWcZHjtkMMb/nLDFZYrFpdZae9QUz7tja9xCQdoxmA9DU45tdR9d45EoB
	 5BqECb1sQPH/HFqwAS5Ky4F7rYUus983ygMlWGwZxysG7uIx+cmClovaw5+S2drIukQ8a
	 T6HJ4OYPFFi5SvcmAmia41TbGrCvxmm5RQ+ea/4lVUZifhuqXZn8j55jCyy6B3XFbi8ac
	 MNR3I1e4Qt3im2gdkkreqGjNuwTKBhr36yy6+r0NhHOaOkVhDF8tqWoL+mvIt6D60JXx4
	 SMxEIOmcTq9LJrmVDeBBsFOR63fqxbNzY2w9E+iNnGfRn+WY81LQ56IZS4POLnFYW/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUN5wvJE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25017606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUN5wvJE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545C11F00919;
	Sun,  1 Nov 2026 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793553411;
	bh=vVLUu+AsEEXAqlGZC8nIuBCvaj1H9qW+4CIlawaJEH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TUN5wvJEfv3Uz/r/6lqpD32bfSF8HT/GsqWZCrer49i4z+4sdUInijR/xYHF0wBnp
	 NMYM9bhPf6BBTW7aFnnhS1EEF2zexd2WUbR6RsdsPrik0NZZqVXiI1GYDHsE/AveTh
	 7JCL31xQTXVQ73fPTKKK4ufh84Md2cfuj7/Lxu5CWKAq0wfhm9IFh6ZqC5Yqq/HRcE
	 f/AANsuAEe+a0KNoDXqmDrcovUyPLmxhEy+r1+Fr/XuMbypthEOgIMjDjxzmimhKjH
	 F/RucF6UYFjM8ramQNBsf9jGUpqY8xqN0WCqO4MLmfAC0CcUjj2Oz9eMhGBH0rc2Xe
	 jp/7MF1WT+WFQ==
Date: Sun, 1 Nov 2026 17:16:49 +0000
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
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
Message-ID: <audznB0maKC82yxC@minisforum>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:27PM +0100, David Hildenbrand (Arm) wrote:
> Zi has been contributing to THP consistently and reliably over many
> years and is considered one of our most valuable THP experts. As THP is
> an especially active area lately, having a single dedicated THP maintainer
> is not sustainable.
> 
> Fortunately, Zi volunteered to take on more responsibility by stepping
> up as a THP co-maintainer. So let's do exactly that.
> 
> His placement in the MAINTAINERS entry is very convenient to perform
> this change :)
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Makes perfect sense.
Congrats and thank you for your contribution, Zi!

Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
