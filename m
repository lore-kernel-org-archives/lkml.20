Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622842;
	b=ju18jJqnjHTCEnyB6JLdkp58YJu29QM0ba9V77wpJJDGtgKQ8zWwpg0hnsQg1/v9YPdw
	 Q9YcsG7AehDQlZThhtpsBHTyBth30OUVBJaMJ833GA3uFLfn2ZdGXO6OjXkERoR7amZ9l
	 VS6GA8y4uYaBSJ1AxycA3d+rX9GfDwR5nb02NzxqnZpcYJnx/voPo5PBuhLmcJ9Ga8ejG
	 ZYgg5j25scpBCbPYIkePTWuxoUYmWEKOmNsz1pcHjuzTrVftYcstc40IiXIFwk4KmASaf
	 tfufXhcC4lRED4a3FPPum9jQZBZ1+qgPN78/XZBT8HDwfjT46jAkP2dBS+QPB/gAo4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622842;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ERFb/4pZagHFCs7MRUpaYMoBff9MSs/0QNXJcVIpqaY=;
	b=RsXwkztNHLeLfQ4FFeHlRNNvO2ECvUZ8j21PZ6TOvkD7UDBQekdSEHJc96ojp3ZCeHke
	 e5Y79doHXQj9Mcpvgz2hf0TXHNLIj72y4/hscdKL1KZs1vzcbHGHC8g28Fq2upuD+9gk5
	 OpjiAlfxZjhVt92t3yDvwojnLZjri8wzCH3n0XBi+8I9fPRxvTWnNsTiVr2SRtXqqrjq9
	 2LdN3ert2+E4BazPb0MxorJwlz+4aFgtfEP5aCgr9dzWOwvh07DzPgf62EpjyBMBDauKo
	 qzqZqeoAam6Q0lILw/8Vki/vGORcmmwfzqk2MMCLe6aLQ1zzS2Aj7CYEVijZeegDCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdQKeJ5B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdQKeJ5B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB211F00A18;
	Mon,  2 Nov 2026 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622841;
	bh=ERFb/4pZagHFCs7MRUpaYMoBff9MSs/0QNXJcVIpqaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QdQKeJ5BsIoDlme6gNWtDqK6f3GwZCgeYN4gIySuQv+cPn7TsIVM5wO7gl+c9Tqo/
	 fU6buhP8+018nyBI7CmJjMfFZXWX5wKctuoNCDMhxxirKAgJWySavZW73xnQBMvws8
	 +RDF4uEuX5kTlz8k+zWcxK1UJQ3jgIi6nZlBz+GbEZ/DhdgTzsm53pZL3+lw0E8J3l
	 HgODW4TTM/U0rQzrzD066C2DqOVsIqEdYQAV1+/WnY25jOsjEP4Cru2iEtYb7CWZE7
	 0VumMjVk7tcHNAOTch/ScORa7POyfsl35S4dFeRrETxAttBeOGDCuIDIGE4Feig0iN
	 2UWCeQKC4VL0w==
Date: Mon, 2 Nov 2026 12:33:47 +0000
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
Message-ID: <auiDADcPkGKMf2Sf@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <1c46e678-1da8-473d-960e-5aa22d4d7e73@kernel.org>
 <20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
 <1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>
 <auhw4mBAqzKU_-DE@gremlin>
 <4adcc07a-2df9-4d5b-8b0f-6734e336182e@kernel.org>
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
In-Reply-To: <4adcc07a-2df9-4d5b-8b0f-6734e336182e@kernel.org>

On Mon, Nov 02, 2026 at 01:32:10PM +0100, David Hildenbrand (Arm) wrote:
> On 11/2/26 12:17, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Nov 02, 2026 at 07:47:46AM +0100, David Hildenbrand (Arm) wrote:
> >> On 11/1/26 21:30, Andrew Morton wrote:
> >>> After that I need to have it whack away at selftests, shudder.
> >>
> >> I am not convinced yet that we want that for all tests, which is why I left it
> >> out. There is too much churn that's not really relevant for a component
> >> maintainer POV.
> >>
> >> I was rather thinking that maybe we'd want a MM selftest component (likely for
> >> the later MISC maintainer) that picks up the usual selftest churn. Component
> >> maintainers really only have to be CCed on functional things.
> >
> > Hmm, but some of these tests are establishing important invariants. I wouldn't
> > want somebody fundamentally changing what the guard region tests do for
> > instance.
> >
> > On the one hand the churn (especially now) is annoying, on the other hand I can
> > just ignore mail I don't care about.
>
> Well, as a listed maintainer you'd be expected to pick up these things.
>
> So I'd much rather have a dedicated selftest maintainer that takes care of these
> things.
>
> OFC we can still add these tests cases to the relevant sections; we just have to
> figure out who will pick up most simple changes.

Yup, files can live in >1 sections at once, which should solve it from both
sides.

--
Cheers, Lorenzo
