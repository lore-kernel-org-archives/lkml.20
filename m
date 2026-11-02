Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603485;
	b=2suwRNHXIQyn7r41k68FC0NFuWoDrujxBcj317XUEtZDL9+xb3+JGdk6Ea/oJKflbkWN
	 i48j6XlcTXpRHaZolm8Z5sGC7O6ZVr9kLTx/0Fq1dX959ynaMhEBjQ9IzySTd2zqn66aV
	 gtmS99Xz/hFUWiV1g7hh1g/9KCmn+1PFZ+tSEqxFvhbzaVQ+UF+KYu6kRvOCob3rL5NtS
	 IhiheDuJ46CELFMsCRnGU0RP6EPujC9LAEnC9hK8deRm3Hjf0qsOSxJNGEF99ln6DowdU
	 KZ3Qq8lSdjio0jBKb1kl/39ksdU/bpa/sj7k2HKO7IGwia0hQL4e8MC5k58gDmb22YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603485;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CtRFjMNFkycltbDQSBe6mjghdVPgzyjFuuR6JFPrfYE=;
	b=ZlfzjxLOlAFGDKvJO+66JYq7Yl7ms8Sb0KRiH2anCnXaCVtlEYiKISLHshL1vplqPOWl
	 mhT8c2tv00MVUFaJJ7D03CKa9ar47LwepGSN20omJ0BsU6aBiEk3IDRKXGT7ozMwpMA83
	 mWbtNU0S3yRTh1I9CUBKzN5S4Curo7Spa3h0AcwdArLQ2Q2OypWcVOKFDYGsq/cRz2N+k
	 P4oHlsnBxBk8AdDc2JaU4TOPHorZ59UTLUwW1SR9T+lJP3w8DsX4hkX8skAjw1nUdAL0p
	 s22w6bSrWtg+aq/gRfonuAzabu68Bo1y+XXsP7p2bixHuP6Fq7WAB3IzlCt+58RWDpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QeS4Sr8R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=QeS4Sr8R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291B51F000C1;
	Mon,  2 Nov 2026 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793603484;
	bh=CtRFjMNFkycltbDQSBe6mjghdVPgzyjFuuR6JFPrfYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QeS4Sr8R57MXnLyGnjzHxTFPdNuY//IlNr1Qcr2xjFpC1lEzVcNYrMPiPMqheHwWZ
	 N6UV+g0eeNcdMCIUSBur7x/BtlK+vs/Z3gipyVnctAL9EKvwP4rd4H1xJs5a3cJLFp
	 FsZZkWgN/pvg0plCTwoLMJL6NnzA7s5xsYReeM9w=
Date: Sun, 1 Nov 2026 23:11:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Brendan
 Jackman <brendan.jackman@linux.dev>, Byungchul Park <byungchul@sk.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>, Dev
 Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, Hao Li
 <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, Hugh Dickins
 <hughd@google.com>, Jann Horn <jannh@google.com>, Johannes Weiner
 <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Kiryl Shutsemau <kas@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Miaohe
 Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, Nick Piggin
 <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>, Oscar Salvador
 <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>, Peter Xu
 <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, Rik van Riel
 <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, Ryan Roberts
 <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, Suren
 Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, Uladzislau
 Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>, Vlastimil
 Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, Xu Xin
 <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, Youngjun
 Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Message-Id: <20261101231121.1c2be902d925dc2e67388000@linux-foundation.org>
In-Reply-To: <1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
	<1c46e678-1da8-473d-960e-5aa22d4d7e73@kernel.org>
	<20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
	<1b4d0299-4232-43eb-9229-7d2a2a7ce2fc@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 07:47:46 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> > -ZSWAP COMPRESSED SWAP CACHING
> > +MEMORY MANAGEMENT - ZSWAP COMPRESSED SWAP CACHING
> >  M:	Johannes Weiner <hannes@cmpxchg.org>
> >  M:	Yosry Ahmed <yosry@kernel.org>
> >  M:	Nhat Pham <nphamcs@gmail.com>
> > _
> > 
> 
> What's up with things like KASAN, KFENCE, KMEMLEAK, KMSAN?
> 
> I don't have a good question for that.

I've made the executive decision to bring all of those under "MEMORY
MANAGEMENT - ".

Less obviously, did the same with XARRAY and MAPLE_TREE, on the grounds
they were originally written for and used by MM, MM remains the most
significant user and the maintainers of those things are members of the
MM team.  All subject to review and alteration, of course!

Damn series is 12 patches long, has been iterated about 25 times and
I'm kinda afraid to send it out!

The result is presumably not perfect, but much better than before.  Now
all MM components are contiguous, all mm/ files are accounted for and
all obviously-mm include/linux files are accounted for.

Quite a lot of mm/ files are still under CORE and MISC, which is a copout. 
Ideally I'd like to eventually get all of them under one or more
components.

I added one more component: "USER ACCESS", bringing the total to 49.  I
expect a new CMA will need to be added.

There are quite a lot of files under include/linux which are shared
between MM and other subsystems.  Many of these should gain a
co-listing under the relevant MM component(s).  Haven't addressed this
yet.


 MAINTAINERS |  215 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 148 insertions(+), 67 deletions(-)


I spose I'll do a few more passes at it and send it out later.
