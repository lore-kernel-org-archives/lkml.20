Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A39C4F6465
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789547; cv=none; b=OiECCuzXf46OsAo0od2ylqCjsoVQUecSBr0k07qt4st0pbneaO/F2CfnFP+eBUMbCZzWWEsONG+tYnVqUx5I+NajNUd3yuYtmzGndfxBhELPHeVsmyCXGNG8S4RN0KoYM9tlI/1JrDSPqQpK29pnE7FRpEW7PqCUHmQMU9flbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789547; c=relaxed/simple;
	bh=KANePYIkrVNp1cnhNyd6G+q8PZ8ZhUnLtrRM+g7sCN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMNuvML9OWqO1tmDbvBzz1T0vBWcAfEqVHB0QnagJtT/K4wurlerRlc01S1P5aQPzHjW2lxx6Lky5d8DDhmaen8sDi73FVkHVoLYAX4+9bISolTPdpxIX8brirjWEdQDX36L/Tl6eQC1SFK7IuL7URXUEtXubhqWmmub2U39y+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixHulrZx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixHulrZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4621F00A3E;
	Mon,  7 Sep 2026 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789545;
	bh=V+1QIqU52AVFPMroKZLyqFAwYP3b20aWfmSMgRX5j9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ixHulrZxrmJT9lfSwaDj4SWjTvLSrkbTPBYKU+Fg1+sffniB11uyw1qCzpuRdYiPk
	 zUgv+2NJ40uemHK8XhXsJOpt4wt7YiN9kzADUr+JnCKuYxU9CiAYDCFpqxge7IYxBA
	 JOxsmcRLr6fYAGMULodWLhhHGKphKgZXC0r3XPjg8BORNg3KNbXumftopqVU6lmYjj
	 +I2KxYz8OU52dWkzagqLJVmx3afd77dfhk/xPqvnfRcwUGz4m+/PRGDT0e9nPlW0NG
	 gY9nNDSFFWRR45lAQwhZXJphqNBH3T35d4hIu/LtSMOLiYLF0P1AdSGi3buftlb1PB
	 NJjV3anxHrL/Q==
Message-ID: <d0137f1b-b28c-4f2e-92e9-0dad044fc0dd@kernel.org>
Date: Mon, 7 Sep 2026 15:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: vmpressure: scale window size based on machine memory
To: Taha Sezer <tahasezer.is@gmail.com>, ljs@kernel.org,
 akpm@linux-foundation.org
Cc: vbabka@kernel.org, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260831130316.448-1-tahasezer.is@gmail.com>
 <6a9673f4.cbade83c.66f7c.3d66@mx.google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6a9673f4.cbade83c.66f7c.3d66@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 08:43, Taha Sezer wrote:
> Hi Lorenzo, Andrew,
> 
> Thanks for the honest and thorough review.
> 
> Lorenzo -- yes, I did use an AI coding assistant (Claude) to help
> write this patch. I should have included an Assisted-by: tag from
> the start and I apologise for the omission. That was a mistake on
> my part, not an attempt to hide anything -- I simply was not aware of
> the disclosure process for my first submission.
> 
> Andrew -- you are absolutely right about the math. The original window
> is SWAP_CLUSTER_MAX * 16 = 512 pages, and my formula clamp(fls(mem),
> 4, 64) produces values well below 16 for every machine under ~8 TB.
> The patch shrinks the window on virtually all real hardware, which is
> the exact opposite of what the commit message promises. Embarrassing,
> and I should have caught this before sending.
> 
> For a bit of context on why I chose mm/: I have been writing a hobby
> kernel from scratch (Caelum) that includes a VMM with COW and demand
> paging, a slab allocator with NUMA-aware allocation, TLB shootdown
> via IPI, and SMP boot -- so memory management is the area I am most
> comfortable with. That said, comfortable with the concepts clearly
> did not save me from a basic arithmetic mistake here, and I take full
> responsibility for not verifying the output carefully enough.
> 
> Before I send a v2, I would appreciate any guidance:
> 
>   1. Is the general idea still worth pursuing -- scaling the window
>      logarithmically with total RAM using fls(), or do you think
>      the fixed 512-page window is fine as-is and this TODO is
>      better left alone?
> 
>   2. If the approach is worth fixing: would keeping the original
>      multiplier of 16 as the floor (so the window only ever grows
>      beyond 512 pages) be the right direction, or would you prefer
>      a different scaling strategy entirely?
> 
>   3. Any other advice for a first-time contributor on how to
>      approach mm/ patches more carefully?
> 
> I will hold off on v2 until I hear back, so I do not waste anyone's
> time with another half-baked attempt. The next version will include
> a proper Assisted-by: Claude:claude-opus-4 tag.

Note that we now prefer

Assisted-by: LLM

-- 
Cheers,

David
