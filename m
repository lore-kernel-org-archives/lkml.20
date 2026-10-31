Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435430;
	b=jbpda1xostBfv856t/n3CWt7CPqBMWa32pijW/0BN3SCAB2vTn+9l8BuZu2ZLruLoFlr
	 d0eA06O6+MRDxbwKmcnT8Un+2bV9uzqqndlemo12ffcdbZ7c87p/rVu1821zBeK24muiA
	 R0q9LmX9ptr0y8mucws8vA8W7n6d21Zc1GXyn5HDpFQHr8XhT4CuDTyScR9LY0MNocRxO
	 T004io0KoRaKHfQarAUgDFujX/87Vo31qR6shy40U9cb2qW64uGdFWQke2yakwJIFVJPW
	 1mjoBsd7zNVhqDV5l3Czf9Puj11OtNmintK3vSWoELPKviihk603wg1Ll/3z3OmMuAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=spOkjFwUciiGe8KT5cGcnRY9XKTmmpVqexi2Bqbn5rE=;
	b=nUXVrZJMiIkykCxjMb3LeQ8wTJhIBBLlnQ58CTsB4ZNNLsPzTWXYiiOt3F4PaZ/rIlcZ
	 XNG4Scf/rr7Iej5YfUyWRD9tqRUATut1/U4yQXCgn8xpKIf3UVSKqht4oQ+grNvScEXmK
	 iKApzR8qGSbkvRfAx7X2yEK/XQjZLFboZF6ofIR5ADbW0u2F8vp2Dm7BLJ9iUOzaZB1dY
	 Dna+S93FIlUiQzLjPwy05xUmF9F4lMeG0aL2lQh4b5YtYWZDFZ7/4kEsLI+Jzzj1sRhTN
	 AQGN9YJfpGe/BUOsWCfnghTmxTa9QAxrP3TiCV6vzxEjBGenKl7I6DdoxjunsZqukPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClYhZINu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClYhZINu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696971F000C1;
	Sat, 31 Oct 2026 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793435430;
	bh=spOkjFwUciiGe8KT5cGcnRY9XKTmmpVqexi2Bqbn5rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ClYhZINuPfuJiCYUEiyjdoHCU1/pBjA7GVM9j2SeiGDzci4dMAGdJ0eCc40y3FS9t
	 ry3lCiIUMkYLn/4zL4h0VeFCKcjed7KvgGvNx658bJjBX1SkHzjew5tEYISor60cYs
	 I/8uYB9Fr/6D0BYURX7zpb2fyO/QgJ/sAK3/VNHt1YU/0bEdTiGcO27fM5Rj+GbtUt
	 JNilErJdupO4B518oLxkbdx9j9zvaZo8Bo3h8JtuZs+vHjCJOJgBmb9k6JTfIS1hZ7
	 wuw3f7GiXkAB83BJgZjkL+W3IbsXxFIpvCPJbtrwSk4MvbM3G0yLrgQ93hv6TaO7Br
	 oKyJmcrLqdxGg==
Date: Sat, 31 Oct 2026 10:30:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Byungchul Park <byungchul@sk.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Dave Chinner <david@fromorbit.com>,
	David Rientjes <rientjes@google.com>,
	Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Gregory Price <gourry@gourry.net>, Hao Li <hao.li@linux.dev>,
	Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>,
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Nhat Pham <nphamcs@gmail.com>, Nick Piggin <npiggin@gmail.com>,
	Nico Pache <nico.pache@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>,
	Rik van Riel <riel@surriel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Message-ID: <auWnELXh960kTdfs@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:24PM +0100, David Hildenbrand (Arm) wrote:
> Hi,
> 
> several MM updates:
> 
> Make Zi Yan a THP maintainer (thanks for all your hard work over
> the years and thanks for taking on this responsibility), and perform some
> MM MAINTAINERS cleanups.
> 
> Then, start the next step of the transition from Andrew's MM tree to
> separate component trees that all get integrated into the mm-next
> integration tree.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> David Hildenbrand (Arm) (7):
>       MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY MAP
>       MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
>       MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
>       MAINTAINERS: sort entries in MM sections
>       MAINTAINERS: add missing files to MM component sections
>       MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
>       MAINTAINERS: route more MM changes through mm/core.git
> 
>  MAINTAINERS | 165 ++++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 105 insertions(+), 60 deletions(-)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> 
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> 
> change-id: 20261029-maintainers-e2699bff7521
> 
> --
> 
> Cheers,
> 
> David
> 

-- 
Sincerely yours,
Mike.
