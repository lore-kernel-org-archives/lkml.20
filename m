Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793566034;
	b=ZeRBXCIl+JW4G8vB1XEfak3dq4gOaDGH1PePFgkwT2nmWWfVjGuAcuK+UwoQLbvgFe6g
	 upvWMhoRoPdT2pGvwu4Yo+f38F28q25vYVKCzfzOng1LHRs4qWhyUC4N1KptSCtOT+FuY
	 YtOHCC09y4AnJccdfmjTuRp0J/fMJmkrma2g+x85nXVRK774RRC5wypwUlh5b8SsWXrMj
	 t2ZoE21qbXAlKCX5D+j21pCixffDLCQzUG3YtAAo76sOZ34yjo+tC14JruPc5y02SJj9L
	 PqgSVnVC5MEdxEnzjK8CGnxfSxW3cVZiolTYizKUQ+4pWJkfDAf/9gdnZPi8kwB+lqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566034;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=u8s1oV2mp7KQi58uDDM1sqtCguGeqDCosYDKttk0a9E=;
	b=m2kqS7S0tgsbPjyGFlivjgJQ8m9GLbO19ZlhB+RL6OWmrJjRCYO8IAL/GpXW4Sq+a0ff
	 fHR8FDFokKW2hB7CxyGgnb36HYP/Pa9UNsrWJZizCWsYJimzlC9RefTZIz7OnW0ToR6c3
	 8MUlvotB8N4bULlQmekbVXchH6ls/o9c+OejSuWLw9vDEjqVUAlLMlsCJlGrcL+zlb9E+
	 yKOhfypbdQiNL57rI3JPyTpoZyw7MF6ZV1nM4b8BvuG8GyOJit/BPiwp9CTsF2N/hJwJF
	 BeRECMk+3GudxO6vOhn2zzt5V3PQJvszRrJJNdepldEKAkWfxoHpwZrAeptM0dVYngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJXoEUSO;
	arc=none smtp.remote-ip=91.218.175.188
Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE430606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE430606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJXoEUSO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qovG99sxmf29ePlCaMr3QlSqBKy0IioT2VfVp35BzR0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793566028; v=1; x=1794170828;
 b=DJXoEUSOnfT/jJp/HgDXGrGHZj8YmIyliUKGliu/ydashmUvAiKGxU0s0ktV3C/C4TkngEEA
 NmjOwWj6B5KlKMVxBcp2pfbmzKlhsNw7f1FHfLBmKJEycb/a/7qrdxPJGr5gXs1vIWOvEc3i3/g
 gmTQhBHGnDa2UIX9d0jD/CU8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 08bfa2a181e29235;
	Sun, 01 Nov 2026 20:47:07 +0000
X-Mizu-Trace-ID: 08bfa2a181e29235
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 20:47:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Shakeel Butt" <shakeel.butt@linux.dev>
Message-ID: <689163a4fbb7a7079d8a68db9888f06566f0728e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 "Barry Song" <baohua@kernel.org>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Byungchul Park" <byungchul@sk.com>,
 "Chengming Zhou" <chengming.zhou@linux.dev>, "Chris Li"
 <chrisl@kernel.org>, "Christoph Lameter" <cl@gentwo.org>, "Dave Chinner"
 <david@fromorbit.com>, "David Rientjes" <rientjes@google.com>, "Dennis
 Zhou" <dennis@kernel.org>, "Dev Jain" <dev.jain@arm.com>, "Gregory Price"
 <gourry@gourry.net>, "Hao Li" <hao.li@linux.dev>, "Harry Yoo"
 <harry@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jann Horn"
 <jannh@google.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joshua Hahn" <joshua.hahnjy@gmail.com>,
 "Kairui Song" <kasong@tencent.com>, "Kemeng Shi"
 <shikemeng@huaweicloud.com>, "Kiryl Shutsemau" <kas@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Brost"
 <matthew.brost@intel.com>, "Miaohe Lin" <linmiaohe@huawei.com>, "Michal
 Hocko" <mhocko@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Muchun
 Song" <muchun.song@linux.dev>, "Naoya Horiguchi"
 <nao.horiguchi@gmail.com>, "Nhat Pham" <nphamcs@gmail.com>, "Nick Piggin"
 <npiggin@gmail.com>, "Nico Pache" <nico.pache@linux.dev>, "Oscar
 Salvador" <osalvador@suse.de>, "Pedro Falcato" <pfalcato@suse.de>, "Peter
 Xu" <peterx@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, "Qi
 Zheng" <qi.zheng@linux.dev>, "Rakie Kim" <rakie.kim@sk.com>, "Rik van
 Riel" <riel@surriel.com>, "Roman Gushchin" <roman.gushchin@linux.dev>,
 "Ryan Roberts" <ryan.roberts@arm.com>, "Suren Baghdasaryan"
 <surenb@google.com>, "Tejun Heo" <tj@kernel.org>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Will Deacon" <will@kernel.org>, "Xu Xin"
 <xu.xin@linux.dev>, "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Youngjun Park" <youngjun.park@lge.com>, "Zi Yan" <ziy@nvidia.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, "David Hildenbrand
 (Arm)" <david@kernel.org>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>

October 30, 2026 at 2:34 PM, "David Hildenbrand (Arm)" <david@kernel.org =
mailto:david@kernel.org?to=3D%22David%20Hildenbrand%20(Arm)%22%20%3Cdavid=
%40kernel.org%3E > wrote:


>=20
>=20Hi,
>=20
>=20several MM updates:
>=20
>=20Make Zi Yan a THP maintainer (thanks for all your hard work over
> the years and thanks for taking on this responsibility), and perform so=
me
> MM MAINTAINERS cleanups.
>=20
>=20Then, start the next step of the transition from Andrew's MM tree to
> separate component trees that all get integrated into the mm-next
> integration tree.
>=20
>=20Start routing shmem through mm/core.git, adding me as a maintainer
> primarily to pick patches.
>=20
>=20Then, target the following components for the mm/core.git tree that I
> (co)maintain:
>=20
>=20 - MEMORY MANAGEMENT - BALLOON
>  - MEMORY MANAGEMENT - CORE
>  - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>  - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>  - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>  - MEMORY MANAGEMENT - MIGRATION
>  - MEMORY MANAGEMENT - NUMA PLACEMENT
>  - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>  - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>=20
>=20More details in the last patch.
>=20
>=20In the upcoming cycles we'll then route more of the other MM componen=
ts
> through different trees.
>=20
>=20Let's see how this goes, in particular with the continuous stream of
> fixes. But getting these in in a controlled way has highest priority
> right now wither way.
>=20
>=20Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> David Hildenbrand (Arm) (7):
>  MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY MAP
>  MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
>  MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
>  MAINTAINERS: sort entries in MM sections
>  MAINTAINERS: add missing files to MM component sections
>  MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
>  MAINTAINERS: route more MM changes through mm/core.git

For the whole series:

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
