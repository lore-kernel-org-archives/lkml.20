Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438677;
	b=H/p/ADtqm+4yaIbIq9AflqAkppgYw3sUh//wTvzQUC0Kl2fmfOySQud7a8zYpsKwpjQx
	 8J34mYmNEzxr+BS9Z/hpZrzdpYW5khK5gAr6MP8aJJMeNY5swctlk5cPXMB3ijOXSTl7S
	 QdxdYMxN+8b3YBzjbulp6YKTvR1NkTFdy4f8jErIDzerxMpnffZ2DDpCdXWgGb0jX+Ce5
	 5FYuCfvgt3KaM4jAQZH6Zf+myp/T4eihSURQoTSSWdbugTKxRkzxMMLdMnTXW0S8E32nu
	 7i91Ife7UzBrmeMG1HPn0DXNFb+lYoA2n0MAo8NUmwGnUeew/F9qRwSQkrsnsT1uwaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438677;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HXh+2aOwYc2JDfIEb59G/0Ycvxx7AFATCF/zpWSEjmM=;
	b=woIJrmpbIAHpbHDolgYEMWUdJdYf11dvoHfrOEpp1Leo1KBizS1pTs2bNvZPRTD5/pjI
	 uxOZGERYNr/vzInH3oCrmKrGVrktghsvH6CDwZtf0bh/aBDFYRUdoZolb9Qur7sbU8MNG
	 a71ouKsNIuDRwD7MN8PDAHqWMNeqIHGorbFtChPY49AJDhiV1v1EGrKP2Sqr7pPDcly9m
	 aGUCfUZrs0RSRmSEC4kqyC7slMSq73eq2MRnfbV1FAMmofWFTHl/lejGJiNadc5tJHoEZ
	 rtVKblGu5cvJ3T26MNV6o0pq9C0XOXtnPcRATuIqZgk5henVRkOJswnyWtRqSwJDJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PclglMTo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PclglMTo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345351F000C1;
	Sat, 31 Oct 2026 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793438676;
	bh=HXh+2aOwYc2JDfIEb59G/0Ycvxx7AFATCF/zpWSEjmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PclglMToHToR9eZkkA/90N6AKsCeo83YnlJHtyM3h9ySsATyu5fBIfxFQemCgohFc
	 EeVOrF2gjuldWOCS5zxeuCOWIXVm3YdhHLTZ40C+RugswYEAG8KRIDaCswpU6wUgh2
	 LVgA9lL0AYVol54ToYBJPLKHil4muxZzJ+Oe0dYOQPETB6kq0+U5l5+7VLrps9CIef
	 +dFUFvSCx2X5+9W7ba9i3ihugrLfvgBD99WX09rqUsGsOtxwFpo4soMOb7glC8KG7g
	 iwDtp9My5FOo3Z3zZqqjJfdO/ukdz+Q5H3A88s5OGfvIZaA4kho+3tdUBwfgAsIFhn
	 TvKM6aKiiCGBQ==
Date: Sat, 31 Oct 2026 09:24:21 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Dave Chinner <david@fromorbit.com>, David Rientjes <rientjes@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Matthew Brost <matthew.brost@intel.com>, 
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
Subject: Re: [PATCH 6/7] MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
Message-ID: <auWzvA7LoZg7dR8d@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-6-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-6-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:30PM +0100, David Hildenbrand (Arm) wrote:
> Prefix "MEMORY HOT(UN)PLUG" with "MEMORY MANAGEMENT" and put it into the
> right spot in the MM component section list.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98948d159173b..0adc674304987 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17423,22 +17423,6 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
>  F:	drivers/devfreq/tegra30-devfreq.c
>
> -MEMORY HOT(UN)PLUG
> -M:	David Hildenbrand <david@kernel.org>
> -M:	Oscar Salvador <osalvador@suse.de>
> -L:	linux-mm@kvack.org
> -L:	linux-cxl@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/ABI/testing/sysfs-devices-memory
> -F:	Documentation/admin-guide/mm/memory-hotplug.rst
> -F:	Documentation/core-api/memory-hotplug.rst
> -F:	drivers/base/memory.c
> -F:	include/linux/memory_hotplug.h
> -F:	include/linux/memremap.h
> -F:	mm/memory_hotplug.c
> -F:	mm/memremap.c
> -F:	tools/testing/selftests/memory-hotplug/
> -
>  MEMORY MANAGEMENT
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  L:	linux-mm@kvack.org
> @@ -17576,6 +17560,22 @@ F:	include/trace/events/ksm.h
>  F:	mm/ksm.c
>  F:	mm/mm_slot.h
>
> +MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
> +M:	David Hildenbrand <david@kernel.org>
> +M:	Oscar Salvador <osalvador@suse.de>
> +L:	linux-mm@kvack.org
> +L:	linux-cxl@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-devices-memory
> +F:	Documentation/admin-guide/mm/memory-hotplug.rst
> +F:	Documentation/core-api/memory-hotplug.rst
> +F:	drivers/base/memory.c
> +F:	include/linux/memory_hotplug.h
> +F:	include/linux/memremap.h
> +F:	mm/memory_hotplug.c
> +F:	mm/memremap.c
> +F:	tools/testing/selftests/memory-hotplug/
> +
>  MEMORY MANAGEMENT - MEMORY MAP
>  M:	Muchun Song <muchun.song@linux.dev>
>  M:	Mike Rapoport <rppt@kernel.org>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
