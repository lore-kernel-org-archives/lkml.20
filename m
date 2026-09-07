Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE6370D5E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767047; cv=none; b=rgAlOvpaRGI3UvJI0qxK/zMfnv3HU+ddaUW2H2hfMI1HBmPemMZ3iTQdQRbL3WZGIqZk8oES19/zCCDrEiOV01M9x7braMpjB0qBPow9FB1U30F18Ul/kB3IEI6VE/MSHRnUvmqtQmiSSmRhYoChzve2JOsgkqHvke2E9aCLmnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767047; c=relaxed/simple;
	bh=AX/+BYhy0Ow612c6UdpbNfWv7MlZH4voK6HgZTyj6Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ofv+mu+nq9VU1NG3LWN7a6mpSvWnpZwY15Oot7qGjH/VilBlroLRu6XvVJGHWEbwOKlwYFVKE5UDspAvtsObu5YY3LfN3eAe/5ygpmpk0Im5uktFYoREuHJhl5ZUnv9yJ+xuPxGBj+En4Re2GtKnDAmzteZpcU8kcvRmXWK+BOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHcWvEz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHcWvEz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FD51F00A3A;
	Mon,  7 Sep 2026 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767045;
	bh=WqU1djRZxSt1nh3zcheMqIKq6ZNjalLZQ1iHp63Z5TM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZHcWvEz/9PARpUHvye3I/SIP6Z73Yg08URI/RQc3JEujjcu9flHGtLT1NgG7oqJKQ
	 +aLogYYyK6bMMgHBR18vQRtetl7W3ZzwhQBrMmVtI3dyFg+RCWrySEjQgv2Ne9MzdF
	 u/trHjYliLe6lXnspu3m1rZCnmfuiiRraqapmJQtb5qKJjkBLgYglwQ4Fpq8Nwj+bx
	 0G8L+0cUU7BYK9Bd2eDrCeeAKAIHsOhRkcJ51coT9heNeqAewXUI4lzunlPnLmUiVj
	 f+cZG4E1+fnlG4NUp6+gwrTr3H9vIphufAbWB4k3PdGxSaJj+8Sf2BA4GHlJav2ubp
	 w6EeroWTPSFfg==
Message-ID: <60a8cf51-1493-4dbd-8779-8f007f6783a0@kernel.org>
Date: Mon, 7 Sep 2026 09:43:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mm: minor janitorial style cleanups
Content-Language: en-US
To: Christos Skarlos <christosskarlos.kernel@gmail.com>,
 akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
 osalvador@suse.de, ljs@kernel.org, hannes@cmpxchg.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 kas@kernel.org, jannh@google.com, pfalcato@suse.de, kasong@tencent.com,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, mhocko@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 20:31, Christos Skarlos wrote:
> This patch series resolves various coding style issues flagged by 
> checkpatch.pl across mmap.c , vmscan.c and hugetlb.c.

Checkpatch is meant for avoiding the issues when submitting new patches, not
to be run on the existing code to generate fixes just for the checkpatch
issues. NAK

> Changes in v2:
> - Restored filename comment at the top of mmap.c.
> - Restore <asm/...> headers in mmap.c as they are architecture-specific. 
> - Remove blank lines above VMA_ITERATORS and NODEMASK_ALLOC declarations.
> - Fixed commit message typos.
> 
> 
> Thanks for the thorough review and guidance. As a newcomer every 
> feedback and advice is really valuable to my workflow.
> 
> (Note: Apologies for the stray huge_memory.c patch included in v1 by 
> accident; this v2 series correctly focuses strictly on mmap, vmscan, and hugetlb.)
> 
> No functional changes are introduced.
> 
> Christos Skarlos (3):
>   mm/mmap: fix various coding style warnings
>   mm/vmscan: fix various coding style warnings and errors
>   mm/hugetlb: fix various coding style warnings.
> 
>  mm/hugetlb.c | 16 ++++++++++------
>  mm/mmap.c    | 12 +++++++-----
>  mm/vmscan.c  | 11 ++++++-----
>  3 files changed, 23 insertions(+), 16 deletions(-)
> 

