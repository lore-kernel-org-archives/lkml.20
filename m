Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435794;
	b=sWvCmblViG27cn71U2TyWo38Is7DoreBu1BZ6MQTwrZKFxtsbgBafIbcvkarGfr11EiS
	 /QycgQSYYVU2EjsXpZD+0qL8SzQRng5csv7J8Tn86sRlLytAFGUggz0lo9dXLuDz1wKUX
	 F3+pL6B4Laewm9S5bj7utv9nuJi7hTMpAuLV38yceKJvixO9mryLAFGPa2ry39sIuS+R6
	 5LiHRCzAHHhcQyA3myOtQOKbUVA9di0zo8aEXunVDHyWE02kWo5EbhMlRnvsJzZOBYbvc
	 +t7en9y2W9+T9f6SQcm0D3ZhMSOts4TRA40ZgqABg34PO7II7DeJ7aML8loFqjRttCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435794;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lbspxFRuG1ePr26isPz4p8MVA1RRVBu6YGTJfFDFJ5g=;
	b=Pz/1Z7xs2HT5q+M68thI8hlMHvbEtJp2b807sjkoxoVtZJTJEYKs7xtlcQj5+hQirCZf
	 1i76JvV3rg1VhcYOzEr4ytMkWy/cFz/k2iw/btHOSXtf0OvSpP9twTghpFoDp77U9JAUE
	 JAMRtItXAtHNa0VZ+uryC4/+Cx/Q1M9cMH8GScsPO3OeokQaL/IUxBNtzcQ+vCbYJP7A+
	 UwviHfWszBo3GOUcXcXuEd1w6nZmjUw9uu+lIkUrQFKC3y5MR1D9uwFNL2wzhwuuvlGGa
	 HS6HyC6c/0SQEGVAchyDXJFHgQJtJ5V4QMGSE4i1pSruKYmtWFyFUm5/l7BbNBbVsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9oz3JPD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5A2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9oz3JPD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540411F000C1;
	Sat, 31 Oct 2026 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793435793;
	bh=lbspxFRuG1ePr26isPz4p8MVA1RRVBu6YGTJfFDFJ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9oz3JPD7vvav88u5xwG7vZiDr3PnHUFI8fOXgW/Qd1UYCWIDNQvtcH5wnrMUl2nD
	 LgnwKJhtkTJxWu8MetMbGDOY5Wy8qJIMQGTWBTUBKLmhz82MjiDIW6kgydZsv/YG/9
	 TdkD1iMlnd4yW2qLxJzDaxj+UF9VRWE4rmUbZBX9EYi3r4TLX+Pe+yYs/90o4NSpBU
	 lz/SF1rDjLZA1FWqQjdpR9CT5O8yO71D9uNO53N2BrYXkBUomlv19t1Ufrq8uPcUSJ
	 Vh+9Nf0M9OI8tToK00G4syxyBAXlNe3QT8l3MMhOnXGekqpai2BlvkmNkpc6pvGPBG
	 MwMQnO5Fjn14A==
Date: Sat, 31 Oct 2026 08:36:18 +0000
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
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
Message-ID: <auWn9O8Ryx6-yCXY@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:27PM +0100, David Hildenbrand (Arm) wrote:
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

Amazing, congratulations Zi! :)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
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
> --
> 2.43.0
>

--
Cheers, Lorenzo
