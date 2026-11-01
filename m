Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553568;
	b=WztIYxwK7y6W9aZCQs2lS9u7guXBINWbJPXsWj8qo+xgp/f3+xU/Cy4OtVKSZs39lLVk
	 Nh6x+CpRWJ7gzINJYFQ7a+g8/ukNNZD3ZdA7D8VvcYUPXgHXSqUGeJmSS5oQv1G/bZdpm
	 EH/iYL0T8Dw2ZMbRETIH7CnccIPDD9pJFbrNT5NGi+yVQWL983/ca4l5RuIb/AFKpYjBH
	 MmHO4S5F93nYn09eMv4t3YN11QKRIcGJa8p6D3wdygLRYf2kneuU+dLDMtG+1u/TU4l0s
	 uox8ZmnIzzNg6rSCpP4BieZ5qiBz+5izH9WF1cFfkE8h+p/hobEnUtQYEump6lw2atg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553568;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9Q+wEfYCHzvlGOwhtX7l2Xbe7hsuW4JqJmvc2MxYRvQ=;
	b=RYBIWwvvxarTgcKpCssuAHzCv6CGnhOqFs5I95JXJyKuGZhXEO/3YxcO4WP/cFe9WRCt
	 VX7f6dyTSJAmsamC/lVzbzj9weiE5dQitEz+qPnGWfCWnYKWrq88uV+6c0+ujRpg5uD7r
	 txY1kHCcqbO8IUhpIEagTl1ouqw7Kd0eMb+blT/DSkl4MEkOk3xgJIWwG2bAuJZGdZ6DQ
	 JH2/JmPZGQLLs/jTnaZPC+CxoMno5YVeVtW0dzByUA2683sYnsxdUj6M1MPZc6HhEWGGT
	 7mq6SAaxkfeJQORTE8ho+FGRk2jIcyrd8M0jhR6dzGkf7wmsfsffqa2/Sj1fSUvi6Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2AzB7Vj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2AzB7Vj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03341F000C1;
	Sun,  1 Nov 2026 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793553567;
	bh=9Q+wEfYCHzvlGOwhtX7l2Xbe7hsuW4JqJmvc2MxYRvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2AzB7Vj/qJjcBXqerPM1MfhftdambYv+Bdptp+OG+AkoBpc1ouAYXNgC7EWKCxS5
	 sk4stL7ysgSeh1SwyeVChpt/U/ctbNwSwUFmrdhM2Y1ARsIStMLn990VxSiF8I2NE4
	 NdD1mv3YBYwSQon0k6RVi8qNgSh9dXFU+BkXlPW2hC80W5N9Hal+Tig2/HDXNe0TXz
	 Sh/QLKo8SjJP93Swy0Rzr1cgW3EGef0faSZbtH+pgsB0IqYEGLrbAM7PDBrUkgho9r
	 nK+GGP7IHdxRjKy5CXjm0TIHvnfgEkcDqsgBmadosvrjReZCIwvqudEfybAqWio0sd
	 lxZhPzPbvVw6A==
Date: Sun, 1 Nov 2026 17:19:25 +0000
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
Subject: Re: [PATCH 4/7] MAINTAINERS: sort entries in MM sections
Message-ID: <aud0jqcQLSJxtYJk@minisforum>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-4-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-4-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:28PM +0100, David Hildenbrand (Arm) wrote:
> We try to keep these entries sorted; let's sort the MM related ones.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
