Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036986;
	b=bu3AlxkabtI/L9gIPD6jRRRRp+jBxV/8+0BPmRJSFdc+t+Ae4RTrayHBsDb9pmuJm033
	 x1UB/hhMqMi0hSOYT9F+NrZNgMLvTDIsY+3OAlxJF2BNFDzmC6oTuEitPaKf/VrzLvcr/
	 GXzlgNxKHTFhnkR73pqBdenAgU/0XI9Nr6wNXcnOpxaG5tFAx9FMbQj7N53hzq+9rg6se
	 EUYEend17K8F0zhDFGpfx8Fetq6FGdIJKDxx3IrBCIU4p6tSX5nwrlj7KKnJdjWEL9Qe9
	 CZqJI2jhGzaxAq+krugZdc+T3Ge+gf/yc/6B10YvRCIRO4moQ6iN2IZqnEfxckCVDNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036986;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xxV5ov3c0hTKqd9UolE8DYnovGSmzcocUgKkmdnwh3k=;
	b=pMJOWMsiA4yZaa5Hdm71n0DhIuB+yGh+Wkd7FG2RNROqMkIn+wjfpQZld0rs0oCrRFRt
	 CNRI4Nzn8GMGrlNKmH++6QDD80kjYG0VzhAAV0O67h31Jkik4u4EusFoVA6I0XWkuRPvz
	 alI9tfuUwQIZft0+bKesh0IXKU3JfOq+XiHqzQ0xV1jXgftVeGVeNWvZdYfPPqpsLU9nR
	 c02JcR0me5SvIHmP3mstNCeLQ/VH2UbRJ7tok/vN/ARox+Kc2+ReK/YAcOcNpVw30SOFq
	 55xZlrn4UEkv/hYamPrpLNFfDFrBy2GiQXV06ijjufnB38TYV3Sa3XOO+7UAma8TXaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=JdL3NJqd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jsaKGria;
	arc=none smtp.remote-ip=103.168.172.142
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8D60A2604
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E8D60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=JdL3NJqd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jsaKGria
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.phl.internal (Postfix) with ESMTP id DBE361380274
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:49:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 26 Oct 2026 13:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793036983; x=
	1793044183; bh=xxV5ov3c0hTKqd9UolE8DYnovGSmzcocUgKkmdnwh3k=; b=J
	dL3NJqdbugJRjuL9LjsbKRphw2KicwxMAV+dxpERQY19YmZ6QzhL4ln9wQHwiRfA
	TnU5tgHVCMuKDz2ydh5yqEc6EV5jCwljkkQj5ZzyPNS3axhN+/hZgOXyZkM/RtCl
	9H4yepfmeOHHV3GJJdQv6ve8B9gW3kfR3KxjI7e4KDv8mLQVmsJcmR2Lppfijn+t
	U0bMcyWlTqeZTEcSSfT1blE7VQo0bfWtsnRymicu6qzh6hPxZ3SKxuYefnpAhLyn
	K5or2rlyWtepue8dI6zJyXApcau2pJxOGCpQFsxmwhXzgQXmXs+W7obSdzuFvJhB
	ArncCXmZNz1bgx71MLw5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793036983; x=1793044183; bh=xxV5ov3c0hTKqd9UolE8DYnovGSmzcocUgK
	kmdnwh3k=; b=jsaKGriaA692dIgpgEARXfonTPOY41+tEtlzdyhDRdnf0v/lFz+
	IxIAldbuY99yXj2+uvwHOgBYeG5g2FbmNzgrMSdNjQrdWzYO72La7ZCdUG1f9d9J
	Af60QpKAvmZ0RHGaWtqd7AiXuoG0sfBjbbg0mrPU4EZ4YR9IOmVFhSc3+nSwNnzS
	ouQHdvYZsOx4LL9XXeYHdChsXjpNHSbE53VnBXxZFlwuftFZHKE88Ukc6HVdGyl9
	6nlEbXIzh61dNNA6idTeqYQmheLPlFDf2hj4CxzM5NGSizwEo1XjWs6sPmF1gx50
	c0KDCCrRBx+TfNBYTIAurgl9KFFzUjhsn1A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793036983; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:poMQzOfOblpDEHyS3KqfGayocGYqhunnOSLu+H70MXbRf26
	NwkQk+c7k0KtMkXwLouhUSfOdqn6PrPn19AutsnFe5W8u1Nj2FFFLBoH2yYRe2ye
	2gPYk6yVcoMicUN02L5gKEHU3i/oQIXWHczQuFKzvnTh11VSZwQgRkRHN8XEGJeT
	9OynG+kgg4H80HeGOWGEIwW8ZoI8oBzluEXmhgzUFbANWGegcAAG+ADEs+lXJv46
	Z7u2GDtQl2/SlzyJWOjucNJK2lwxH32vk2wgJa76DjxG4h/Eipb7ulb93uoh1Ty7
	/EjlxxtvMwC79/yy76QQKrr8rL9GS/gClwor9Dg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oAI8CvIbumntInw+4PFy9SOzhfVHaiSI3xBGsLX0Fcc=:cIqzR+dk4dI8U2SGLdBfaB3Z+vbsjVLGPogfgOdxTgQ=;
X-ME-Sender: <xms:tJLfaiFURCNdynr59obpYBBiVl4V5UzanoXaw9VQTms5MmvDtIuP-w>
    <xme:tJLfaiezpFzXO-Zfv_74k1daYZBx6nHLGhU7gb5qHt1m95IWKbwRmmHtAaVqg2Wis
    zafiftWyYeKAGSyT1Kjbi9iIpDJqezGMiLgTiCWhUE99To5FR2lAiWt>
X-ME-Received: <xmr:tJLfahJkh1-pM4dmfx0_FPH8hg8zgScCWFiPl7YL1n4UUWyyhTGAzxUa80U>
X-ME-Proxy-Cause: dmFkZTF3TFhuE3wGcZJjUzIyjpcTOyexH41fjQWtbyhLeXHhYokFl+PdzJCSXxGGgJCuOJ
    dy5xoklUsRtz+csfRFFFJskyhlsSQsto9rVk3Xlz3nETmWH8sqjeYYmCn0LJzkpgO57i5k
    rdDoyf1u9Kchi7X+0v96xV5zGmpLMOO9JQ5HHJkAv5WxzI0OrT8Sq74zbsPUvq7mGA7rRZ
    IIwvOGRi06s646S/NkFK+4dyblma9DUxNKJT1uTJkvS+vsg2bD+Upt3/LTu/0HWVZlK0Jj
    DlFAwQClbZ6XOv6mqbXadmBiTvGlWIFDBKnMCr7YO4yM+t3ktQ/4bZdUK9LFzakP+92+Fm
    vG79z7HcXs2kjYGMgAzRjuQ0Qg90Hot+Ca0+OaVT98vuHtEbFT0dJOmcOSmfcw/Xw6u2d1
    ydWX/qnX0spiO/oLJjHsmk+rsjzeachNCfZqYri4OECtaMqBqLsy8GKT4bQbqK5deL+Y+j
    xz4oi0XTNlD6jG61NGTNYmy4QmHW5t9idNlTTjUXxyjcS9YURryFMnzp27h1BibhDflcz5
    UY0o1n8SpTQHwQ3/5malhwYKSeSMg8q6/xrtSPPcVMnMpyyR9vsCGY0TTUpc/3e38AVljE
    CwiXQtNotFjguQ2i5vkeoRsoHb1TyfkFlTP3gRHzl3UveODfQuz8nenQXqlQ
X-ME-Proxy: <xmx:tJLfarraKcese7WoQH1qripNE2RW3sQ02AnhQpBgIvlz7tnud-QoxA>
    <xmx:tJLfagazhqAewp0B4A9M3D6fTyn7_VpRNZ0nuifN8YsHYk9-7jyB2Q>
    <xmx:tJLfahiI7id630K9NmomSvn62flSZaHn2KKrgta1RGySXMbr7guD7g>
    <xmx:tJLfatrSUI9pQ0K6u_jA0hZM_uWTVUEDYP0jCuf0p5tgifabZsZhnQ>
    <xmx:t5LfapU-At2geLhbkQFkmFVQe5KK6EYoSm5kLoDw3GYWlWKmcDqAJ0O7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 13:49:39 -0400 (EDT)
Date: Mon, 26 Oct 2026 17:49:38 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vladimir Davydov <vdavydov.dev@gmail.com>, 
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Lukas Czerner <lczerner@redhat.com>, 
	Carlos Maiolino <cmaiolino@redhat.com>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Stevens <stevensd@chromium.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, William Kucharski <william.kucharski@oracle.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 13/16] mm/shmem: preserve allocation errors when swapping
 in large entries
Message-ID: <at-SpfCdyXq18_Ab@thinkstation>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <20261026-fixes_shmem-v1-13-703206d5fa0c@kernel.org>
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
In-Reply-To: <20261026-fixes_shmem-v1-13-703206d5fa0c@kernel.org>

On Mon, Oct 26, 2026 at 10:40:46AM +0100, David Hildenbrand (Arm) wrote:
> shmem_swapin_folio() adjusts swap to the requested slot within a large
> swap entry before allocating a folio. If allocation or charging fails,
> the error path compares this adjusted value with the original entry
> still stored in the XArray in shmem_confirm_swap().
> 
> Unless the index is at the start of the entry, this turns -ENOMEM into
> -EEXIST even though nothing changed.
> 
> The caller retries -EEXIST, so persistent allocation failures can leave
> the task spinning instead of returning the error.
> 
> Restore swap to index_entry on allocation failure so the existing error
> path checks the original entry. This preserves the allocation error if
> the entry is unchanged and still retries if it changed concurrently.
> 
> Original fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: 91ab656ece13 ("mm/shmem, swap: tidy up swap entry splitting")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
