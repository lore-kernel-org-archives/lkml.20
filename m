Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618475;
	b=ej/czZ25vhA8cGPzE12b5ziZkywU0mSjjLMNNJSuYuknOre1KFlfxpUEsjlif4YBJEi+
	 OXh6fNkiDHWBl1lJDELyNbv4Zupc0jk6c20ykQrtAcFbJvTMlB1z2LxX9sAO+wTJ/W17Z
	 Xqr1R2Co5Bvfzl5n0XCAu+UU4k0/Dpp5WBdH8kWRrd3H6TCbZCjGgQHbpCgDDDRJeEBDO
	 XTu43r0m01b2TZiGtavzCTg1RvrCy/ajQ/vaWJHQxQ3ifTD55SWlOdT5xmdCmqn7iOmL2
	 tljTOlpQpNSf5+uV0WMudzJiwk5W+GXUF+9oZ6BkbrV1px2dPbHbACG2ItTYiv2BgFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618475;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5XdYGCj3UpBi0eF4iOsSacA/lFpYw0ENrrwVG8qRYI8=;
	b=SArVVxVORjeh5F2iqUxGFtXl+17ifRGy54fFQb83L03IiUsoBig9e5NJu+HmF+woVYfX
	 9freWYzHoFpYtVlK0V5/2vB/KwXeaOtvZgIZoMt4sN8c7VuuBMBlohghjmaFNlw9eFr1I
	 0Xd6NOqHuDI9DfeDd5i1kmGbCEJvp+DIGXVWTOHIB1YXlxQ+8OFQbSGh7IlYundnUX7Fr
	 o/TY2NHY0bXlI544Mqco4YheW5VhXS3UODf1VvJSyJgT4RW9AqgJ42JtKkCJ8egELlFRf
	 Mbd5WSEcCsuLQ5DiQWiT9bMTtBxPhPGumxbG75HNHpTddSKif4DLBgi17ptr/yo1prg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH7EORvq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825C606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH7EORvq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C311F00A17;
	Mon,  2 Nov 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618474;
	bh=5XdYGCj3UpBi0eF4iOsSacA/lFpYw0ENrrwVG8qRYI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UH7EORvqI2yKBl0tVn0dePSsG/1YiHU5g+s0x3uhN8QRhT+CSHq9nOXfW6YBLop0+
	 cDThCLLuLkDUBGLua14aMdqbHNMwC644o/Uk5dK/0dZucKf+snOt4GG5xAHoaCX3uE
	 I/PYLnnwD84radtQKjxZEqf72bv1IZrJ838rRU38CsxFsmfIg5uKKjTamxV+zSkfWk
	 9a7qVOxHd2Ivsc/FNcg1DNK7zsVjoAnjNBt6SI4UCYNUbhk/ZkFF/yfEl/Gd72F7+W
	 vZ5zJZnN1hs2wEeAa7bAIiCBWTh+TblVAdBvnXpBqY3y3KYoY2DHU37fAwTh7Vqwyt
	 LjuhFqh2xHuZQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 91890198003A;
	Mon,  2 Nov 2026 06:21:00 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 02 Nov 2026 06:21:10 -0500
X-ME-Sender: <xms:HHLoal0crmk0arFV6SunM3X_4EGXRFfULYuHVpBz5HyNlRdEBJ-bEQ>
    <xme:HHLoak61HHREnly0wGrcd3mMK9kM2f7bo2cqjvGbSL-JLCB4ASgdasYNcxTEVdelT
    L44y2DqjCXE-bTSPsn-rauDkLFiZjEumD5rtcvbJmn7D8fMoZPwT3-_>
X-ME-Received: <xmr:HHLoauJZq94syw5zA0XN3RjFKcF8IQlUW_lDmW08vYLNTG65tD8KffrtgTU>
X-ME-Proxy-Cause: dmFkZTFijutip9/taopBo2TwiHA5kBefO699Gw0yc43SkJHEMAFyRmQaAz/9amNCKfnBon
    FiV+vO8qDhPO+hZToov87zeh2bR5WPig+D56YNcCUO8RqPVFefpVCkGskNfa9YsAPo6IIm
    UfYvW+QzIhvcSawhjzbZJHyzdBQtbFs0T9zK/mVZSuwJB+N4RadaPwU6YzppvV1hK9zRx/
    olRwL35gSOJL/eWMf/O3uLGQn8Kx4iWFPzn384mtyyBDF7/ymfxQ06v0703h31wE8ctsAK
    /uZoMKq+b6GczAU6Kl065HEvmerXSbMo4Z05ELEV+bKOKu8CiHSwgQswkaTW2kkwn1vsWG
    POviuYNCO5DWbBdR8OIXnrGaX5Ix2h/zrpqiKrGK8kgou+qDAnGsnlUDyf1DMP7A5xEciL
    kIgD0Ytc1puTLUa/n6RA8IH4Y7Bw6GAy1qUDhoz1/l2iJWwmhyEtw93DzLm9BJ78e2g1/d
    SzM6JFFe/YZ/uu0/p1s23C+T/zQu14td/EAJ9n8Ctp17M6Cl3LI9eXRV++irLzwS4/ho5h
    Zb0bGXYGDJ+k5cIf3yMkF3FVl+Ra6f/Bk45/xvlpDB32vKr7rPgbBsCV0jX6jkrLpEWoD5
    8tVk0Y5kuO6jUbpkgy8ex2LGNnp9MuUEBjqGMbIXspX/jHeVjKhq8G17gOow
X-ME-Proxy: <xmx:HHLoaj0-K2A6mWRmcjNoZ0DqiU5RT_hBtX-IXkd9p_cGHfZ1dKvV9w>
    <xmx:HHLoanaa16MjhNTCvpcqKEXbXO11_jFRpe11Vi7Fh8wI0x5B6-DIxA>
    <xmx:HHLoarpptNb3uaXKOv5-gp7oc5AGju1JGJN6oyyQUMbF1QnS05YxYg>
    <xmx:HHLoanhbLex4XVT1_bQq-aL7mORvunco3U1WRCiVDVTKg2EvCKAJTA>
    <xmx:HHLoaqvnGxzhMM3LDFm86Qwaq8lmwZNUfLdugAVcqG8E_IvjgYxwSS3e>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 06:20:58 -0500 (EST)
Date: Mon, 2 Nov 2026 11:20:57 +0000
From: Kiryl Shutsemau <kas@kernel.org>
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
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Message-ID: <auhx--fF1TpX-ZYz@thinkstation>
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
> Start routing shmem through mm/core.git, adding me as a maintainer
> primarily to pick patches.
> 
> Then, target the following components for the mm/core.git tree that I
> (co)maintain:
> 
>      - MEMORY MANAGEMENT - BALLOON
>      - MEMORY MANAGEMENT - CORE
>      - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>      - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>      - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>      - MEMORY MANAGEMENT - MIGRATION
>      - MEMORY MANAGEMENT - NUMA PLACEMENT
>      - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>      - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
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

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Congrats, Zi!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
