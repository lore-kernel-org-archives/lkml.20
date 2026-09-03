Received: from mta0.migadu.com (out-80.mta0.migadu.com [91.218.175.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332F39448F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418740; cv=none; b=aoXhMW7eE5C7Hc+VSUKz2tNnMFSW2WG24/2P8DmiayhXZoVxv8bBTUADvJhUwaFMvni5XPlA6t5ntkT34l5HhiwRsCiEHX70DC4/LcS3gRdn20eo6MDLYksiTQwxdyrq4xffaPGZXEGKlPUV9jmfeCLiTe0111WH47QHnbiVIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418740; c=relaxed/simple;
	bh=o8BUeq3Tc6Gx1WZx0lieJxRX6+dzsYla4Obyg7G5q/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdIWR+UuDKSVKKBNVJIXvp79wKcqa1TGflJX5KGYU90yDM8xU6qCt1TCZX5foe70pLaOCIZZkYhZE2pxlM8WqJiabKVk6WBpunpPsMvBi4OPvOuncFlXDySk8cm+C8fmg0GIwl1aj3L9fRE0tYdon+4r/7mM1PrH39jddlRQcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OgzCsGXR; arc=none smtp.client-ip=91.218.175.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OgzCsGXR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o8BUeq3Tc6Gx1WZx0lieJxRX6+dzsYla4Obyg7G5q/g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788418735; v=1; x=1789023535;
 b=OgzCsGXRz2zEtCr+NoWbRIhw6dzGOqVKT6bG7QZIcF/+vjxcIsayyLWFMwWTgWSDh7SGK0DA
 OgNMpmaki0LdnMRTDfSCD7ukum/ZmWASUk+Zkxq2QXLaFd57Rti7udCE3Ug+Lvbpj99B6orNjcn
 T7ZD1T381nEP+z2uRYJ9YpKM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d042a3bd066a7172;
	Thu, 03 Sep 2026 06:58:55 +0000
X-Mizu-Trace-ID: d042a3bd066a7172
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f9653d1-2467-4e32-ae8c-d5cf7bdf92dd@linux.dev>
Date: Thu, 3 Sep 2026 14:58:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] migrate: Skip hwpoisoned hugetlb folios during migration
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Mel Gorman <mel@csn.ul.ie>,
 Andi Kleen <ak@linux.intel.com>, Muchun Song <muchun.song@linux.dev>,
 Jun'ichi Nomura <j-nomura@ce.jp.nec.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20260701105544.97059-1-kaitao.cheng@linux.dev>
 <20260902193438.232552868db3af5d54ae3fa1@linux-foundation.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <20260902193438.232552868db3af5d54ae3fa1@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/3 10:34, Andrew Morton 写道:
> On Wed,  1 Jul 2026 18:55:44 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> 
>> Date: Wed,  1 Jul 2026 18:55:44 +0800
> 
> Well.
> 
>> Hugetlb migration does not check whether the source folio contains
>> hwpoisoned memory before trying to move it.  After the folio is unmapped,
>> the move path can reach hugetlbfs_migrate_folio() and then
>> migrate_huge_page_move_mapping(), which copies the source folio into the
>> new folio.
>>
>> That copy uses folio_mc_copy(), so architectures with recoverable
>> machine-check copy support can fail the copy with -EHWPOISON.  However,
>> there is no reason to attempt the move once the source folio is already
>> known to contain poisoned memory.  Architectures without such copy_mc
>> support also fall back to a normal copy, which can consume the poison.
>>
>> Check folio_contain_hwpoisoned_page() after locking the source hugetlb
>> folio and fail the migration with -EHWPOISON before unmapping or copying
>> it.  This covers both a hwpoisoned hugetlb head folio and large folios
>> that only have the has_hwpoisoned summary flag set.
> 
> As always: please provide a description of the userspace-visible
> runtime effects of the bug.
> 
> Even better if you can present a reproducer.
> 
>> Fixes: 290408d4a250 ("hugetlb: hugepage migration core")
> 
> Oct, 2010.  So I'm assuming this isn't super-urgent.
> 
> otoh, now it's out there and known about, perhaps Bad Guys can find a
> way of triggering this, so the urgency becomes higher.

In the subsequent discussion of the v2 patch, it became clear that the
current fix can only narrow the race window and cannot fully resolve
the issue. I do not currently have a complete solution in mind, so this
issue is blocked for now.

v2: https://lore.kernel.org/all/20260707090136.52904-1-kaitao.cheng@linux.dev/#t

> Anyway, please consider the Sashiko report
> (https://sashiko.dev/#/patchset/20260701105544.97059-1-kaitao.cheng@linux.dev)
> then update the changelog with the above info.  Decide whether we
> should cc:stable (and describe why) then resend?
> 
> Thanks.

-- 
Thanks
Kaitao Cheng

