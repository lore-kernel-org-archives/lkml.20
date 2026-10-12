Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BA33314D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783521; cv=none; b=UkqglPB+xHGrnE4dmVvg0w6oEP4tA6UcnFuL0fxSDKMylwn94wnXwN+1OH6YezcH+luYj7cRS+vP0BrFFvwwfJEKlgEfb1JFItVdgjjZ4JrhSKX+Qmi3x8T/O48sT9wb2xD2AP4j0quOz7bw9KgUr2+DhK7mfAGTFNFXL7mw00M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783521; c=relaxed/simple;
	bh=mh+QSAWOuJxqcV+GJ8VBkG+hUNx/Je04E3SQ7sUHC1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lc95B3X3U29sYqI9FlmZKjJwPxI1lNPT67KyyreniRsr+fgXlSzN4JJi9Q1ImAGPGYJ7bkBacZc6sl2fHZyu2gFcYgGUZhsFx0oX6lHI29ceQGn71k9vTUNT2oPsiY8ojHRXo7kcs2fYgDQqJx+52fZZDxO4OO3Qd+11L//ZoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n3O4ceg4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n3O4ceg4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BCFA1A00;
	Sun, 11 Oct 2026 22:38:35 -0700 (PDT)
Received: from [10.164.148.108] (MacBook-Pro-3.blr.arm.com [10.164.148.108])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6CA3F882;
	Sun, 11 Oct 2026 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791783518; bh=mh+QSAWOuJxqcV+GJ8VBkG+hUNx/Je04E3SQ7sUHC1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n3O4ceg4v+A7OtL1DptykjrlXOQDcjts0lE8QZcl23PRddctLRdrjIBw1i76GaUcX
	 teXegmHnKi+2MQMG5XDhos0jfRvUvmZ4yD48o5TOrOBCaTv2Mik9Yy2LJp98XyJKx1
	 XwhfALwVNrddAbz5OLKDUEWaknQL8668PmzN0W1o=
Message-ID: <e2152674-e0af-4b07-9115-4668917171b1@arm.com>
Date: Mon, 12 Oct 2026 11:08:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PROTOTYPE] mm: reliable 1GB page allocation
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>
References: <20261004013657.03a63c4c@fangorn>
 <55adcc67-e545-4bf5-93ba-7e4180f1b523@arm.com>
 <003fdeb213ca0460c8681d4ae7baa562b337ed1a.camel@surriel.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <003fdeb213ca0460c8681d4ae7baa562b337ed1a.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/10/26 3:14 am, Rik van Riel wrote:
> On Sun, 2026-10-11 at 22:58 +0530, Dev Jain wrote:
>>
>>
>> On 04/10/26 11:06 am, Rik van Riel wrote:
>>>
>>> When the kernel free lists run low, the slow path moves pages and
>>> page
>>> blocks from inside mixed gigablocks onto the kernel free lists.
>>
>> Did you consider a design to introduce MIGRATE_POLLUTED: simply
>> have another migratetype which stores polluted pageblocks.
>> This idea can work in general, not sure how relevant it is
>> for gigablock concept.
>>
> Don't the first half a dozen or so changes from this
> prototype do that already?
> 
> What differences do you have in mind?

Sorry, it was just a drive-by comment. I will eventually try to
review your design document.


> 
> 

