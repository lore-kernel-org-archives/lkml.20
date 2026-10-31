Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435939;
	b=jDtatxtaujwKXd3ixlL1W4gg0w7qc6kKLYnJcR8aNJVR1rzceqSHWRE/QXB9UHzbjoQZ
	 Bv5yf7VYtVXhipu9HeQ6g4wVgJ8PwjptkyNHVU9sUkEtPZ1e243Kg0kapziPUdzkbN9Gu
	 GvUI+FuqCynvtyUmJJPnpotjg3MbpFXtX9ZbiJ8xI2n8z4mPUjyHmiPC8oltbea0A5C2C
	 jPka8nFmMSchQycGsAn4JIgR8uShp3POkTekLfKHf72Y+qlcmMsVRZiZcxgrbCnXi1DDZ
	 bY7e6vxnKBHUVjcwz+c6nU34xuXCwUu8mffgUIv1ytL+/u8C5vhGgFbMzH1lcZlr3tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435939;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3G0mQTQHftTI3Jmfn04UefoKAIl/mRArjq16cqT2p2I=;
	b=34SvozYkwcyHbybP6RUEV/RX3sVPI/JZCliRqCcbV+CGo2Uss/hHrRR45tpQtuK4fyXg
	 SVyC0NE/FnMVR9uED2JIFL92XeiL0/BKND7rWIjSeYJbd/zvivt0lLWlrhYuMAqUa45rO
	 iWYdG8z+l+bTR6Qc+wBcouKobSZw5hSxlJMLLnTDV1CH+8XG8hUioyFf2TXZOWJEiKADX
	 5rE8PPcsGrn16m5vJ0kXtFVbJlEmeWgsB3MP9zxZN8wwiaReLHH79GyOtQzpmczeY6NC1
	 pSx+kSDpnBPERmjNxlVolKnVMe/GS/YV8NAdBqEmaIFq+QDafHWlxjzCvMFm5A6owTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJpl6GbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJpl6GbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D09D1F0093A;
	Sat, 31 Oct 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793435938;
	bh=3G0mQTQHftTI3Jmfn04UefoKAIl/mRArjq16cqT2p2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJpl6GbSGq3CpHcVHA4UwfFGRXni0xeWUxJDdTKtzdZ2YeBqeARjjA62BuHvu6eye
	 gDZeNruTADmCbTekJNxOVhpsAqV2sUFYfcqQZW55dkch7rEFv7vQWqhPTHLXC9Yota
	 FLO2mQWzrFK/MkgXrvC9GUgqS/X+QnT/akNaTlqCzsAVMPGlX1xb4uzA8eVc+YyaH8
	 S6lHBOIPxS/iDnCGs0yleut4iR/9tAQ7D7Dy8TyIqgOd590BAGdclQuYOcnQ6ahIHw
	 9WxsJLjQI69Si3fddHA/CRriFfVDeSkXEQjNq/892h/Ka32wQHxw68TZzhZq7MuzJI
	 vLEywa2JNpglw==
Date: Sat, 31 Oct 2026 08:38:43 +0000
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
Subject: Re: [PATCH 1/7] MAINTAINERS: mention for-next branch in MEMORY
 MANAGEMENT - MEMORY MAP
Message-ID: <auWpDuqqLwWyEulD@gremlin>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-1-97278f8a5f54@kernel.org>
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
In-Reply-To: <20261030-maintainers-v1-1-97278f8a5f54@kernel.org>

On Fri, Oct 30, 2026 at 10:34:25PM +0100, David Hildenbrand (Arm) wrote:
> "memmap" will be used as a prefix for branches, but not as a branch
> itself. "for-next" is the integration for all these things against which
> people should ideally send patches.
>
> Not mentioning a branch makes them assume "master", which is wrong.
>
> So just mention the right thing, which is "for-next"
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a162e9bcab10..dbb5582ec1c74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17566,7 +17566,7 @@ M:	Mike Rapoport <rppt@kernel.org>
>  M:	David Hildenbrand <david@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git memmap
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
>  F:	Documentation/mm/memory-model.rst
>  F:	arch/*/include/asm/sparsemem.h
>  F:	include/asm-generic/memory_model.h
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
