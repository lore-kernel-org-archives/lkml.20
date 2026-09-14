Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEF35C19F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357258; cv=none; b=Mnbf+qHleyVg3a8sW4kJtSwc2ztSkEO9ugfPyuS/iAbr9cfZl2DMCS11J8Sd4Irui4/swAz8j7HhiNRXAKE4NSnvLhwBt7RIgW9OghXYxiBIGrynqST9Ht8gsyJ7yFDEQx+t1gppkzzSCOkVvF8l+SMeBTScAE4P6wBP1nxtm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357258; c=relaxed/simple;
	bh=YqcD7n8V7zlnYr83ELaRQGgNpYA9gvPvxqx4lzUd4/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXg5ZXvQbXxWN4myA+SEUabUVqNcvXVvDC7w4BUWeypEBKBM0eTcbo8bEbL6y39APeCX/6C4v0sYrcLakQODXboaRMtSoteJauvQlfOJx5fRYX+y5ttA8xyq73Lc/FzE1QOe3m3oC7/rFhgzYUTWT5tUXdesXKEmd0ln00cyTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Qp3Zhowg; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Qp3Zhowg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789357252; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=AoexynbmVsxSclYh9BsIybBGJ4wqU7ohzfDGpEpM46o=;
	b=Qp3ZhowgXqs8HY21xZFxnj59rnK4pw2v/3yjZdlM0DL8PlB1cYs6dTM9ZyHWRf17nq+81dEEHNz/seaZagy0tCsqCaSU5k+P6pQq7HzjA3K2UO0XX7BloxLLc0YYYiWQIsGk1xsSQSZWIPVozsWoIJsWgi59qinVra5K6z82oUU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XAq4-4F_1789357251;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAq4-4F_1789357251 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 11:40:52 +0800
Message-ID: <1e42ffaf-fe9d-4da0-92a4-a003f913e795@linux.alibaba.com>
Date: Mon, 14 Sep 2026 11:40:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced
 collapse
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hughd@google.com, david@kernel.org, ziy@nvidia.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
 <20260913194327.019b3db96ea9b0719fc147f7@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260913194327.019b3db96ea9b0719fc147f7@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/26 10:43 AM, Andrew Morton wrote:
> On Mon, 14 Sep 2026 10:12:41 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
>> ignore any THP or mTHP interface settings.
>>
>> However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" semantics
>> for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
>> depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
>> (although that is the default), which can cause MADV_COLLAPSE to fail
>> unexpectedly.
> 
> Userspace-visible runtime regression?

Yes, it could cause a userspace-visible performance regression.

>> Fix this by returning the result of shmem_huge_global_enabled() directly
>> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
>> shmem THP/mTHP settings.
>>
>> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
> 
> Should we backport?

I'm not sure, since the issue is triggered by a rather uncommon 
configuration. But given that the fix is simple, I think it's fine to CC 
stable.
