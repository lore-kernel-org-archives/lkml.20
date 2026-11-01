Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793566546;
	b=UFWDkq14z0CWf8+eTdrME4GvuaUV/PAe/YPNT+hpB1tczBPNKxL00amzWvVjsHJkihpQ
	 H4D7TzgX7ZpQzbD6t3Z7eU4kBLd5P9VYvg5QXSgCK0p2mnYV7vmhT0hPyElFxj7XVV9GO
	 BYOTFUuw9n/axbi3JkR8iszQjaDmS4rMP6gyfUqtSA1LUpxeySHIvgIDlOr1L8v39uVD5
	 PqyfFd+Prvz1FaqeJ/JSjs2Ve+ZyfIB0KjY/IN+5uTe0BgI5tlCCktc2KVCnlB4FX3RTZ
	 y2l3E9YpOe48muOSpki1r9NXBsK0APTDPRJMgNZc/HmdU6iUx6RTDGkRHXkGEbXByTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566546;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pjloYTGpg1MlBH/CI8BHpeCnn4wPxbKq+lkUhPgvOaU=;
	b=Ax0TSLILkUj6Fw0F+kT+U659rhPfX5ACAkYhKISisjzt3UQM0XazwgVUi4IXPnrbH5KD
	 Ahgi4Xqq8a73faBpJAftri1/10gzJtkv1eSdoBqQ69eppDto0YmKWfzzEaQ2bPJDMQxx8
	 dDFgfoY8wAdQ7U+dCbuZoeMCye4kIbPTyESsT2vLXXCopBHUcOdvc0BI2zAziRmD8Nc6v
	 f8R7ZMVurXhpzps/sy1Qodo5AZnlIbit24ekH3qj39MBfjZtEIFPTbzTqg8RtdCST49MI
	 W02hyPZQBcAhZD12O1+LiIJdIlnYXUPJlCA0y+0/ZhGaPkosIFW/ddVojIalfM4d36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkrMnstY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FD606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkrMnstY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9B01F000C1;
	Sun,  1 Nov 2026 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793566545;
	bh=pjloYTGpg1MlBH/CI8BHpeCnn4wPxbKq+lkUhPgvOaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lkrMnstYZlmnyyCbaxUaGSrraRUFABVDrZ6A+ixK5oTmB/LBZubJGxgl8IssnAIdr
	 fhOUTR+JQbqzpvZEvGl5F1UbH+wkq5xP5y8jUgN0dXlIrPh3iCX6ahO/JRZ98fxWU4
	 UBji/j9x6368vmm8YQwE4wk4XBOFK0VYswCRSs4p12mQwCCAOv6QabX4K9xfl38es+
	 09qtxhTMmQ02/NrOKp1NqIx/u/W7Sm9M6C+FpkoTAKz6PIHusiWSQy7gB/vE0DOOk2
	 /apfFwiw56OZIoSEAZUalxh/09SpG/WvjSEVuPIgoiDayAG/QrMFYmXEVj4zEI52vP
	 Jmcjk2+Dker5w==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Byungchul Park <byungchul@sk.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Dave Chinner <david@fromorbit.com>,
	David Rientjes <rientjes@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Gregory Price <gourry@gourry.net>,
	Hao Li <hao.li@linux.dev>,
	Harry Yoo <harry@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Jann Horn <jannh@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Nick Piggin <npiggin@gmail.com>,
	Nico Pache <nico.pache@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Rakie Kim <rakie.kim@sk.com>,
	Rik van Riel <riel@surriel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Date: Sun,  1 Nov 2026 12:55:35 -0800
Message-ID: <20261101205536.97942-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101123025.4d8133d5321820f2202c8f1a@linux-foundation.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 1 Nov 2026 12:30:25 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sun, 1 Nov 2026 14:33:57 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
> > On 10/30/26 22:34, David Hildenbrand (Arm) wrote:
> > > Hi,
> > > 
> > > several MM updates:
> > > 
> > 
> > @Andrew, should I pick these or do you want to route them through your tree?
> 
> I'll grab for now, thanks.  As a hotfix.
> 
> Because I'm whacking away at MAINTAINERS at present.  First step is to
> consistently name the components, below.
> 
> This is a two-patch series.  The first renames components so everything
> starts with "^MEMORY MANAGEMENT", leaving MAIINTAINERS incorrectly
> sorted.  The second patch only moves things around, to restore the
> alphasorting.
> 
> So people only need look at the first patch.  Please review that.

Both patches look good to me.  For both,

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
