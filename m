Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D451488200
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430503; cv=none; b=akCn3DfUsUTDVPfI+HZGVPbdDH1CpedfQpU+pTX8g3vcp/ThS1C+vLei8pubOSBiE+IGLAOY/8rjvLBLgr9tCJBnsi3OtXf5t8It0ps0VQgugzqDA5a+zdh0oMiu1PdjjstNoH/m5PwyqJjDRxlnaAyJ4wg7czN6xXee59WRGDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430503; c=relaxed/simple;
	bh=yafeT4QC4RsbHYwr0HsgJYIHFVMneJvYSFB3VKRboJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKSBqxfeNXl1ZbqPc8GuqwwsJhZq2ZCTtpMIozj7i8DqRs868hC9FDzYh1qlG81Y0IE0a8Wb7mA59VNoWu1XbTeHnNj4PQcgdufO+nYb4JlaQc366OMYMe92ORVeBmSrDrfwPsf3MJXQypuoPUccT5Xn/TH7OOpEE37DyrFfQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=g/aqwiqF; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="g/aqwiqF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788430485; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=x3owqBbLN7wIxWV8uRXxeYJQqapN2luye/1oTJ5GGsA=;
	b=g/aqwiqF2AGPrZRYmjBiqyeAYH8Wuk2JKUaVApOqZQx73ypEjjYFK+qSvg0OTpPpCgUIIpXnpWX6MZHp1mPw68x6b8rtZ04gntCTuPp+mx9jnEBv9eQuf30v5V4V0I3umelrRejI59w40fGUmjtDFK3GQiTM6wHef5o6xYcIMkY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAFoMgi_1788430482;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAFoMgi_1788430482 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 18:14:43 +0800
Message-ID: <818ebe42-c53e-490c-a18e-955cc85a0597@linux.alibaba.com>
Date: Thu, 3 Sep 2026 18:14:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] mm/mglru: make LRU folio prefetch helper an inline
 function
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, chenridong@xiaomi.com,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 Xueyuan Chen <xueyuan.chen21@gmail.com>
References: <20260901232421.40157-1-baohua@kernel.org>
 <20260901232421.40157-6-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-6-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> `prefetchw_prev_lru_folio()` is currently implemented as a macro with a
> potentially unused argument. This makes the helper harder to read and can
> also trigger checkpatch warnings about unused macro arguments.
> 
> Make it a `static inline` function and remove the unnecessary `_field`
> argument. The helper always prefetches the previous folio's `flags`, so
> there is no need to make the field configurable.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
