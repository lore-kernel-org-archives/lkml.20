Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553088;
	b=bnVjGYafC4pV+GYp+HTGQ5lLGad1IHnZ/zNyH/iFbbAUa8HE1qGVDCIZpIudla6dDkpz
	 w8NmMjZk+8FHtAvbaTigWHG4X6dUYHKL217edhswc7s/mITwH3CtuRPHVXPCqf29TMn14
	 m0HmhK0Ftz601aIZNWewDipRc8pH2hfb9ZSryx1VQXjkO6h5Q8p0xC7dBXUVWOsn0a48R
	 3TADK+/OzwH7jUt/n2LDpHUeNKaPIYV4L4zF9TbQgq2NU0r+iM6x2acplrjDh/GDtvOAu
	 57ELvtsT8aMDq0lAWPSR4WB7bqgn18xwxjwYZk7qYAhSwh7dAClkcNABbn4+nj52YLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553088;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OAh3bSv7u3LMOUIxSn2imLDtJLVr1ST8Nu4wB45AsEY=;
	b=aOHSj0K1wmfRDo9AYJxKONso+8pPp3WWJpFSt4L0/FUbIrUnEzcqpeKohwARRfTx11O3
	 TyzYp58OYdZ0fI4IFE/Ae00z49RooDPMbpbJ+AS8E9yzvV38pmmcB2pvlV52sNDoo29fs
	 y5lxwaqV/UtZn5u3aCeRvI92aVVavFszEJ6L3MCqqa+MV/9FvqbjRU0rY3QbyCP09XgbH
	 U/GGwWeUqbUQZ9+Bk4ZiV/ZL+S0gTtnMAJsNsXIGznI4Ffx1LDWo/U5kjoOsnuj6lqXFM
	 TQT3C88omZUe9pWVP/p3DdtusG6wMqka5MV6KtY0Epwkflx5+99YKJ1dM7NQ4TRezTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8K7STZD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB50606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8K7STZD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D681F000C1;
	Sun,  1 Nov 2026 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793553088;
	bh=OAh3bSv7u3LMOUIxSn2imLDtJLVr1ST8Nu4wB45AsEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8K7STZDnDa6mE0nR6n9AkERHliVp3c33Rev6eagR57gXJzu8hsiiy99MzzPNjCka
	 KhVl5q9nLlLcOq5eLBtvMpWVpMBgVNwrhw4J+PYjxnvi4eX4IqxbuCf3i7Dv9qVuZt
	 Yc6pbWe6DDMvUrImKxCcW5KqZvWPg0ydFHEvq7McLGsbMJ2dE4JYtzQoP9cLV+/AFM
	 9Ji2j0IMq+fhBKX15/mASDdqANUXhrNxgMoIPZP4ldBZSCSSapXuVxmANPf6C8N7OD
	 jgxvF8PlFUMLdbioT+PlrganVE0wyWDd+82hWmBe42oUwuOeeI2eFwZlrl7XNbC/yG
	 EHdBO4MFILNhw==
Date: Sun, 1 Nov 2026 17:11:26 +0000
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
Subject: Re: [PATCH 1/7] MAINTAINERS: mention for-next branch in MEMORY
 MANAGEMENT - MEMORY MAP
Message-ID: <audyrBPhYRZvkJVl@minisforum>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-1-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-1-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:25PM +0100, David Hildenbrand (Arm) wrote:
> "memmap" will be used as a prefix for branches, but not as a branch
> itself. "for-next" is the integration for all these things against which
> people should ideally send patches.
> 
> Not mentioning a branch makes them assume "master", which is wrong.
> 
> So just mention the right thing, which is "for-next"
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Acked-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
