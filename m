Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3896449B1A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800032; cv=none; b=RiYOXxtYiNNabskGjFf5thS9h1ezQ9nXYsmypR68B//bZvK+4Mg9MASlznWxLlysNNIbX1AB7AZPK5YJRp7NOW198JnUdKo2NBgAhXU19wT3wVGKeHcOy8A+tIzPJFDsNRLisN6H9J7kgqveO8IRrWz0Vlssq1yzlcLhdzidh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800032; c=relaxed/simple;
	bh=DZYdnMPeCPCWuZMC+2A5Kvn23lXKdPJQkldqykQeLRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzsRU/oWHDO494su5ymGaLl31S18l1tr+UrvnD+JQQkaINLU04AJzwHc0pe1+G5RghQ5B4hB0XVv3tB8FvVtggsXXjaAbf5E3f8v+qgJf2+askz3QEsBv2tVzLfOW7LaPZZiBFefbCWuEA+3Ear4G9eYJevlqBU42i1mwuKOqCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DHR8Iput; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DHR8Iput"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC1A41655;
	Mon, 12 Oct 2026 03:13:41 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28683F66F;
	Mon, 12 Oct 2026 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791800025; bh=DZYdnMPeCPCWuZMC+2A5Kvn23lXKdPJQkldqykQeLRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DHR8IputLfKZiOG/Cr147bz/6e2FKghaMsaanyvD0RL2vM9SoSsKoqC2Hj38TMcDN
	 THEaR03KepS1PrdqWT3oseA5r0gXnPw7zAGqseAuB6yQ/zGmvmNvVtYQD2LJRymCcl
	 rOehn6TnHZzJdMuiPxoPmPw90va1+pRqWssBBilo=
Message-ID: <dcf15f02-dc4e-4c01-909f-5b1983168d03@arm.com>
Date: Mon, 12 Oct 2026 15:43:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC NO CODE] [DISCUSSION] Anti-fragmenting ordered buddy
 allocator
To: Rik van Riel <riel@surriel.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, kasong@tencent.com, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, brendan.jackman@linux.dev,
 ziy@nvidia.com
References: <20261011215412.1181172-1-dev.jain@arm.com>
 <16a9c5ef3fde0b7693e52dac91a2d397526dd99b.camel@surriel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <16a9c5ef3fde0b7693e52dac91a2d397526dd99b.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/10/26 3:29 am, Rik van Riel wrote:
> On Sun, 2026-10-11 at 21:54 +0000, Dev Jain wrote:
>>
>>
>> Apart from dividing the freelists between migratetypes, little
>> attempt
>> has been made to change the algorithm
> 
> Could I convince you to take a look at these
> patches?

Thanks for replying Rik.


> 
> https://lore.kernel.org/all/20261007021250.1665929-1-riel@surriel.com/

Indeed, I had seen these patches and from a cursory look I liked them.
I will eventually try to get into page-alloc review.


> 
> My current plan is to first improve the
> fragmentation at pageblock level, and then
> add some slow path code on top of that
> which can steer the allocations by physical
> address range, to preserve the potential
> for gigablock page lalocation.
> 

