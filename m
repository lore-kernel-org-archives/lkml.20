Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618255;
	b=hLSwOAwQZFAl/DcvvcMqGGLaL0b5nIU6H6a3tsEeTeQvoMmrDWA0NWM1nKPGTrF0w97Y
	 wlciDt3SsGTUxgYU7ZxUCGSpZnQSoLj55nTWZHCeGpd46+b8dxCXYTvihrK8rSFDTqbG0
	 KaMILoJUtTkZyKMaP0I7XRuTXzVgGV3HlOfIqqxHsWVb1ieT2rWD5+MEiY79yEvux51hz
	 9FHh4jXNNQT9WjyvXJ3m43JPdrC2zydx5U9gCs9yvFthUBeG+2ApetBE8XUYRh5XU7VU6
	 6KcQXPybA73QMljHpqPwW6e67RQQuNGJ7UYSQNUkpjn4DyIecXwyTf6M07Dy6j2tHVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618255;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=98mtjjP6T0N40qxadFzZsPcAOe5fNReHRi+qcwE7x8c=;
	b=PJfGCUfXoCMcmokgeUsTBIpE5pi+c4Rhft3LbvOnDw07C/+ozusDrQiqGH1OAJjige4s
	 wc8kigt11HGXn2PnrAC5fnwbw+To9x9EdnL1zmdZUSP9ULFEsJPJzQTHLmWxM7Nn7WYJ8
	 CUPEML3uOp5DFLrx/LMZoGTlIjjPhZY6GlA8ZwNgZAGT0Go1IcUNDABo9B/RfxViufu3H
	 R77jLiy/E8RHsyWceT0I+0IhOQdpbMZ5xwIcjZwj7M9uSDxdBoQsH81mVBIbB1JgDMB1A
	 nHXA1qxvswCWtwu1tLsTy2OWK4bicydqa+V+ooTAhhWZeO97Da4udK+G8ThaXVa0B1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AsHi/Qx2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0259606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsHi/Qx2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E662C1F00A16;
	Mon,  2 Nov 2026 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618255;
	bh=98mtjjP6T0N40qxadFzZsPcAOe5fNReHRi+qcwE7x8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AsHi/Qx2ZHevaNXslSNOm9EKf6X6V0ftbOX6HR1O1Ut/SitDhhtgdB8pDo7eMfdJz
	 c0BmBifEZ2p/QEhYFssHfPNUV/72ECarvL4ZRdk/m89K1jCnQaJbGhAP+3UuG0cINT
	 cXlOZGAzQtYwUKZq21WO1FI/kSBipacfwos7VC6HgnrIodCUHBUgySobjkbZMTf/AP
	 cN6ZRzqzAicSVmLmwBej0HbWhD/P93bxzhCXEqMoCYmhPnEezmQ4GmHfXQXfHxBrgo
	 XDW3qe8Zn4QHNLOh+MCwobqRV/OHvLsuF1LU6ubBC/I2fECjV5FtsKe29vzyiGCIek
	 Z506YYD3O2RxA==
Date: Mon, 2 Nov 2026 11:17:21 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alistair Popple <apopple@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
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
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Message-ID: <auhw4mBAqzKU_-DE@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <1c46e678-1da8-473d-960e-5aa22d4d7e73@kernel.org>
 <20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
 <1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>
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
In-Reply-To: <1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>

On Mon, Nov 02, 2026 at 07:47:46AM +0100, David Hildenbrand (Arm) wrote:
> On 11/1/26 21:30, Andrew Morton wrote:
> > After that I need to have it whack away at selftests, shudder.
>
> I am not convinced yet that we want that for all tests, which is why I left it
> out. There is too much churn that's not really relevant for a component
> maintainer POV.
>
> I was rather thinking that maybe we'd want a MM selftest component (likely for
> the later MISC maintainer) that picks up the usual selftest churn. Component
> maintainers really only have to be CCed on functional things.

Hmm, but some of these tests are establishing important invariants. I wouldn't
want somebody fundamentally changing what the guard region tests do for
instance.

On the one hand the churn (especially now) is annoying, on the other hand I can
just ignore mail I don't care about.

So I vote for tests staying with components.

--
Cheers, Lorenzo
