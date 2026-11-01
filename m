Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517382;
	b=FaQotR9bOWX6mKcO4asP9jRK3l1eJkgllnxOOyk3gwoVe4Jt0iBZRNr5XhjvsIQwpqZ9
	 JhwbJpfnfLVVTg7URb7z6vFjh1SmwvZVDSkCGkk6Hyis1e8/p3mt2d+wHdzZ92qIP7ZnV
	 n3YOPPrjCii7Gvp2gS690NqpjtaFBSLICYluwfW8RxsgAb5Pi0teDK/wtUc28IcM2mWFF
	 Kptii3PtR8wDvmzu0JyNulejyCmi6eEG6EFufqG5lC+UB0pfId3k6gL4sOBkaXy1NNtJ7
	 Yn+1gN28O7Mmfec/XFol90ztOg4y+7rpJg92xCIF5W4PhBvjn4QDbhsoyCMjt6ie/Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517382;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sKUtUKSAT7N9lWEULtTe5OHLm/0QKeLXLq/cuehm0hY=;
	b=HBGHa8G4MObvUi5t9Wj98+dv3Seasgkf+mqc0T2OfiAYfP4n+2DKKxHnBhIlLoWwYiO1
	 69raQEgXaRuT6A1WJO7RCG5rECoO8lz+oRcJRMCoSStwjve8kuBrNnQ7byjFNJYmFINzW
	 zFONUsSknxLIzPhmz8sf2QFFC/sf4B7E772ocVuV8xaDP6nu+XvyBdIRWo1YdGBODdkGp
	 uyg8IuwGA8fElnE1cyEMlMpu/9L0gt7xS1sri2WmHmlxSQy1Sl2xfxTRQPYPIAK/HWk8n
	 QUqHA3tmxyeeG+XNnqoCVe+NmtvOi6k+qxtO3wN3gJQQTtX0SNXbEAaasNoL5Q9yrNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LH6zBUF5;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B86606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B86606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LH6zBUF5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kHUvHYnw2dekg8CUjBUhuxM8s0SCtb5RHv0FpAGfgMc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793517377; v=1; x=1794122177;
 b=LH6zBUF5EdvcDy4FlVd/3Q5UigVrRVxhrnhHOqrazo9ldwqMs9obVky87NL6QenKubvhrI6q
 XMj3bb2b2YjNvk0CTEXFPZLQAaKmniolyu8Akifd0u0A92dWuwIDu0goFqmfLXuNds+0D3GofNF
 uuMft3H07+IoN39TmjwhZuRs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3d2700dedfd938b8;
	Sun, 01 Nov 2026 07:16:17 +0000
X-Mizu-Trace-ID: 3d2700dedfd938b8
X-Migadu-Flow: FLOW_OUT
Message-ID: <fe601caa-3676-4623-b77c-35930a6f65e6@linux.dev>
Date: Sun, 1 Nov 2026 15:16:09 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] mm: hugetlb_vmemmap: unify vmemmap range
 restoration
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-10-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-10-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Restoring an optimized folio and rolling back a partial optimization
> both restore a vmemmap range, but the operation is currently implemented
> separately in each path.
> 
> Use a single range-restoration path for both cases, making rollback an
> explicit bounded form of normal restoration.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 33 ++++++++++++++-------------------
>   1 file changed, 14 insertions(+), 19 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

