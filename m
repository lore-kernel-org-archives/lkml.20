Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8713B14A2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165851; cv=none; b=Au3pnDDjoIbPMt0YDSzVgnw0VxngtSnariSRHssTWy0z8f7CgREQqLzwykq7thaxdGrikY6CQOTsdAFAQXsS7t+zhCGfT2LbHl3/o97ku08mNjIZiPOBaPY+huwg/WOtd4vnZpR4p5wCS6dUCYR5Zt53ztIUjrpNTaFC4US75Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165851; c=relaxed/simple;
	bh=WUqdkbwnPNh6/u8L4ywCzeT2xFA6T3CkCs/kKHgaOpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lowoP4yfdrg8vTpI/ZGa3O5hlGf8ZUf+q3BMMbICzljnsuE+uR9OY1R48CXwgAu65f1sNP9qju/yeML8+zykyYFeZWrGFv9VmWYSYDLuUdJk5xcGMtZTSwO8LyWVjIxd7UTNwaIbqCxbOF/kb+WXEO4jwgMKplymGcy+ynBjzfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cevWiCXM; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cevWiCXM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788165846; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=etMu0VI5+wpQmX7ykhBd022G3QB/fUHBgr7JAI3YPJM=;
	b=cevWiCXMAj2yYqlGUMVyjdZNjglKBVJUn0VkeqgeG2Ypi4E/z+eXH48WVjcu/d+WuuF+aP2dhXdL1RuLVZfG0gk3HWVoCvUHNZSp6I6xuoqHkWW4TWtMyXiU1WdLOgw3oCPYXaud35DLyMKDvoqAf5VuCeYDsowfVKQ2oOvkG8s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X9vX2gk_1788165843;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9vX2gk_1788165843 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 16:44:04 +0800
Message-ID: <fc1721d9-aee5-4ffa-96a7-9f9b68ae0871@linux.alibaba.com>
Date: Mon, 31 Aug 2026 16:44:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in
 isolate_folios()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, chenridong@xiaomi.com,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com
References: <20260829074204.45304-1-baohua@kernel.org>
 <20260829074204.45304-3-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260829074204.45304-3-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/26 3:42 PM, Barry Song (Xiaomi) wrote:
> The existing mainline code retries the same type once in a rather
> subtle way. `for_each_evictable_type()` may provide one more iteration,
> allowing the same type to be retried if we scanned some folios but
> failed to isolate any due to protections, promotions, or races. This
> patch makes the retry behavior explicit.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
