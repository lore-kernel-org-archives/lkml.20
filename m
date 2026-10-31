Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432981;
	b=au8p9nrz0mGOYdtM+n7WAwv96kdxqGCDsdZ3gDJETzynx6H8F411+acqJVHzt8qr3n0L
	 kNxY6OPpafbdVfrt0E8nmI963TXG3ynTt4IadTgNsLEQyLyF3CvbaC5isG3z/7NTOfgg3
	 SHd3ZTmWZp4c2kUwW7yc8s6nzCKRsXfmuLbuqKQX9PzKTtJWmmcQ2SNxkF+3VFjGJ7Oml
	 6qzl+YQvOpXGvIBUePHJUpqhLYkJfIZUp75dhw75xvNmZyusCCSDretl11PGPFTi/MULD
	 5BJAEyMNLlhHbsbSyfkXfuOtYcPQVBttTosKkSR6T0zE9JTYNqOcdPFezZuKt/VM5ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432981;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/yrnXSjuGtKvXirNf19gKPohNcjZeXRzs8MVdnL1uJo=;
	b=5os7RsxyP/ao9Jd0bBa4xBFZ+dVdpQj87gOqdNC5MU0X1J5hcM3MPoFdqL/6rvJC7uuI
	 Nlf76ChSmyVEBYEX+EnN27zK+ziG+ST2NP1v3gwVViA/0RkfoQn5Ci7uopDzHbTFCWE51
	 gNQdON2rZXlLJnv7Gz+9kqfP9eSBG0ilAXmG4AJc9tfSemwGed46ceHDh+IsW08ApkGle
	 uGwAKOA/jYrIkJRRrqlzk/pOfVtnxkrRZCXdOCyUMrIixAu1xkjThGMnioIDbvzBbkFKL
	 sxfW78sN414bl6TsdThQGxQ5/2q3bPdJrO9UY2bX81c3DlIm66CpWlNCgcYo6qQTSBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k2DV4TNM;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B7606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k2DV4TNM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2hMyZCs1UGewOfOEo2oSastc/qJPy14To9PU6CeHTdk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793432978; v=1; x=1794037778;
 b=k2DV4TNMPKdue/DBAOU7cA9uLmURd3BY5v6y0UkKo/1LnjZyF5jKWpC5kyg5sInIFdiW/AEu
 CnbFpM0zZMgWnea8Q76MIVqWbrstSK5H/CD46HilBSKHlzQXIXNrAmMI6bvBfc7zSlP78gdkNIr
 Bzrrc2qmAnyIelevzXHnJn4E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1faece7cfffda491;
	Sat, 31 Oct 2026 07:49:37 +0000
X-Mizu-Trace-ID: 1faece7cfffda491
X-Migadu-Flow: FLOW_OUT
Message-ID: <33ce5d90-cc8b-4d21-9838-17db23407e84@linux.dev>
Date: Sat, 31 Oct 2026 15:49:12 +0800
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
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
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
 Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>,
 Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>,
 Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Rakie Kim <rakie.kim@sk.com>, Rik van Riel <riel@surriel.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>,
 Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/31/26 5:34 AM, David Hildenbrand (Arm) wrote:
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
> Start routing shmem through mm/core.git, adding me as a maintainer
> primarily to pick patches.
> 
> Then, target the following components for the mm/core.git tree that I
> (co)maintain:
> 
>       - MEMORY MANAGEMENT - BALLOON
>       - MEMORY MANAGEMENT - CORE
>       - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>       - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>       - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>       - MEMORY MANAGEMENT - MIGRATION
>       - MEMORY MANAGEMENT - NUMA PLACEMENT
>       - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>       - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> 
> More details in the last patch.
> 
> In the upcoming cycles we'll then route more of the other MM components
> through different trees.
> 
> Let's see how this goes, in particular with the continuous stream of
> fixes. But getting these in in a controlled way has highest priority
> right now wither way.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> David Hildenbrand (Arm) (7):
>        MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY MAP
>        MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
>        MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
>        MAINTAINERS: sort entries in MM sections
>        MAINTAINERS: add missing files to MM component sections
>        MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
>        MAINTAINERS: route more MM changes through mm/core.git
> 
>   MAINTAINERS | 165 ++++++++++++++++++++++++++++++++++++++----------------------
>   1 file changed, 105 insertions(+), 60 deletions(-)

For this series:

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
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

