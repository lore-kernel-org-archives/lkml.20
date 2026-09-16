Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164D3515E5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529048; cv=none; b=XN9cJo4L4X42p/K7buHL8C+xy4D68Dc4kzP9byu9FsiYDWvl1eXczsWiImgKVh1M01VQCmin9abC9ge2hwQzLyNqJHWbG3sUGzX54RdzIsUuVWHDJ/fl02botNpxsqv1gddjMR7XXHvc05T9qletCkJQAPvO2Sv9OpwmoSHjZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529048; c=relaxed/simple;
	bh=5oHdvlz8Z3UhgQt96+qX3SbpjRdbUsSwFiLBqj4iBYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdljIt2BmCC2vpL4DJ3wUtWsqizC4ZgsCzMz63AmyscUiB/r9T7GWWDxc6xfS4tuknufsx1dXN/NCTlIFVpRQ8oMV7cVje+eLvYwC/qFjDCDijCyO+jgr2DoHxEqw0XxNo4+0PZShnew5pkN7+w6PMAKiqy3hllfX4Z8mleV24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HzfBVGHy; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HzfBVGHy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789529041; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vUYb0DZMMP72i2B5f0BuQh15vGJ+u1qohoIAllECgHE=;
	b=HzfBVGHyWBcQtbP0qpk+rpfIvhL+jcpPHTylMiYveyHZnsqWEqyr4nxKQY+HxvlXNyBtgxlAzA87Bwj2EJR59CEQARQK5zKX4joeb6MOqgKOeyyvnT16Dp8hFHXzddERzjn16U+2xS/e4IAyk/VrZoPB/z7NzClmBryYiLEuJgI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XB3ciWe_1789529039;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB3ciWe_1789529039 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 11:24:00 +0800
Message-ID: <7afc2108-710d-4f54-9472-6b9f156ce945@linux.alibaba.com>
Date: Wed, 16 Sep 2026 11:23:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mglru: restore accidentally removed seq < max_seq
 check
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, david@kernel.org,
 hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev,
 ridong.chen@linux.dev, shakeel.butt@linux.dev, weixugc@google.com,
 yuanchu@google.com, yuzhao@google.com,
 Chuanhua Han <hanchuanhua802@gmail.com>
References: <20260915101556.50467-1-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260915101556.50467-1-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/15/26 6:15 PM, Barry Song (Xiaomi) wrote:
> Since commit 798c0330c2ca ("mm/mglru: rework aging feedback"),
> the following sanity check was accidentally removed:
>         if (seq < max_seq)
>                 return 0;
> 
> That means we can perform aging for any value less than or equal to
> max_gen_nr.
> 
> This has been inconsistent with
> Documentation/admin-guide/mm/multigen_lru.rst, which states:
> 
>   Users can write the following command to ``lru_gen`` to create a new
>   generation ``max_gen_nr+1``:
> 
>       ``+ memcg_id node_id max_gen_nr [can_swap [force_scan]]``
> 
> The correct semantics are that writing a value smaller than
> max_gen_nr should return 0, since the requested generation already
> exists.
> 
> Fixes: 798c0330c2ca ("mm/mglru: rework aging feedback")
> Reported-by: Chuanhua Han <hanchuanhua802@gmail.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
