Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF09306754
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351630; cv=none; b=jQmi3lr8KsEpYnfHXCA76f/G0aLSHn1MLhru8iutTutUd9VJ+DZCVg+h6xqHM4vfRbpjCkrtZLzwGrhhvATusNm3tf711HV9/0bWy7XPPyWVBb/QtzoCmwJW7L296kaXsvFzqOyshZ7+/3aXX4RQAvwBAh7DdDDyDp1FS9yZuFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351630; c=relaxed/simple;
	bh=uPs+i2OihBBu+JXLEyoxDXnXOIQble+TBFRt9ebpb3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3VxEIzmvJTr6r5rEaL+Y+S5mxsgfN/Ay3xcU/qf8TXaRfCenVp7o1DKCJCyrIiBtXIDVxi/9b045aBU3eVWMlnwByVSPpTKQdAb9JnyjEm3tTYUC/gI4oiuK/cu7Z43lwfs/LV67tUIC9bmiDijSaxbj61TzVVF4Nze87kN1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yXOS3fxT; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yXOS3fxT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789351619; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BgzKCoOLIarGhDXj37aERpIPf1VVGbogeSsR/DLyI5E=;
	b=yXOS3fxTMPftdydeqb4JVLQ5X9Ahk5YmKBVfxExAe4h3Qi/E1/CJabs6vGA2QX+9n2zQn3DY+KkYuuHyo1rZGFKNXtu3iJj/D/zFfTV5R2i0zo9JbizIwOzU/Rm7Y8SATc2rzQZpeorz7GgjcS+4vZbjC7qArmqmpw1rPWd1tqg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XApv68c_1789351617;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XApv68c_1789351617 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 10:06:58 +0800
Message-ID: <a3632566-ed3b-4af8-840a-7895d0e47f14@linux.alibaba.com>
Date: Mon, 14 Sep 2026 10:06:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: shmem: ignore sysfs configs for shmem forced collapse
To: Kiryl Shutsemau <kas@kernel.org>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org,
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, ljs@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>
 <aqPmxRkJokRyVzdU@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqPmxRkJokRyVzdU@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 7:37 PM, Kiryl Shutsemau wrote:
> On Fri, Sep 11, 2026 at 12:04:33PM +0800, Baolin Wang wrote:
>> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
>> ignore any THP or mTHP interface settings.
>>
>> However, after commit 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled()
>> into shmem_allowable_huge_orders()"), performing MADV_COLLAPSE on shmem
>> will depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
>> (although that is the default), which can cause MADV_COLLAPSE to fail
>> unexpectedly.
>>
>> Fix this by returning the result of shmem_huge_global_enabled() directly
>> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
>> shmem THP/mTHP settings.
>>
>> Fixes: 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled() into shmem_allowable_huge_orders()")
> 
> Hm. I don't think it is the right Fixes tag. "No functional changes" in
> its commit message seems to be true.
> 
> This might be a better fit:
> 
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")

Ah. You are right. Will update in v2.

>> Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>> Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Thanks!
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks.
