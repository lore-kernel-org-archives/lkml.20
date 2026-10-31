Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425440;
	b=r6aX6mMpAIkPGKyIy+StHTZ2ZGSYiQVULWGg2BPb03AewMAdbe+MyG4bK+wy+2MdD6we
	 GAxCZ4al4UNnaDV4iClkfuo6qqqdkOx59LYGUUcdeaNZWppseCzhufpZKAwv0/vyckeah
	 Mt5eqx3mFqhFdhrYO6fpy/fkNeMHpfLaKj3p1gL9S8aqMo6BRa5M4PlniEsu+0FSbAwhH
	 X7DFcQsocqJYIxWJTtzvviGlaaMHeO/kkbODEAQvtyMhMvvi8QLspfrdkVEeVoGbzL6Cr
	 A++iO1lMXZnHyhz8kO5gl4qSKInQts/lYRZ9HHw6I24tAEtBJc15oiwN1ny/4moVrRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425440;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bsdEHEUIdzvaQtRrVTZS/CJ+UHx0YM95KADOoQBI7W0=;
	b=dTBWHN+fwAiQFMejnhTEPnNV7APHOR3TNKBTZ37Na/rrQPxy+uLQxPhVFHZ7FA7XRA0e
	 kMZSkOyxaf2DcCbu26vfVf1Rw+g0UAIF6sLLnZkjzvEK2smQx5iZmMefbfhznzpHYDozN
	 Oy4ae7fshrRpJZReET46eb4tKjIMJ03nZPlHKo/Vi7xN7s61eF6V3zLe4PKxCXIqX0l/6
	 h72mxyi5F5NuFr/PCnU9/71zU8mVkGPXUyUrS15btU2IDfKIXxCrqDNzIeOSlvcbLCPJy
	 zsckLYJgkspbXmBDxT/HrzFxtOl1Pr+am6l4ek/B+X3ZZRRFIk6wEj2FeyVl07Qb/VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=drTxhs0A;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785D8606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 785D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=drTxhs0A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EBF41596;
	Fri, 30 Oct 2026 22:43:55 -0700 (PDT)
Received: from [10.163.156.83] (unknown [10.163.156.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 361883F59E;
	Fri, 30 Oct 2026 22:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793425438; bh=KtacfKJeh6jI8AxfG3p3xz2pRnGpmEm0kIOWdqIWDvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=drTxhs0AqTGZ7XVX19T7iR5Wpu1UV25u4Ad+13uRGp8CeQcTHc9Y8PgG5JdarN6PG
	 ZnbRLSrZqvGCCXDNHjdA3mge//bTwwewRjTl5GRticQZAQtkrPWWJBvPaP03j2H3A6
	 hz1fGA/OFAF6GhrflAwkV7TSa0oqutweHyyrEP9U=
Message-ID: <9b5e22b0-3876-42d3-b58f-053120307a8a@arm.com>
Date: Sat, 31 Oct 2026 11:13:34 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Byungchul Park <byungchul@sk.com>, Chengming Zhou
 <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Gregory Price <gourry@gourry.net>, Hao Li <hao.li@linux.dev>,
 Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>,
 Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>,
 Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31/10/26 3:04 am, David Hildenbrand (Arm) wrote:
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

Great!

Acked-by: Dev Jain <dev.jain@arm.com>


>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0baeb37b0dcdc..02b5b542f81ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17817,7 +17817,7 @@ F:	mm/swapfile.c
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> -R:	Zi Yan <ziy@nvidia.com>
> +M:	Zi Yan <ziy@nvidia.com>
>  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
>  R:	Liam R. Howlett <liam@infradead.org>
>  R:	Nico Pache <nico.pache@linux.dev>
> 

