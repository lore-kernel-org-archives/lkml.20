Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D063BA236
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165292; cv=none; b=sjzoPkNz7YYEoQeMSGyrG9y7BrqQdsDKOxRevpWAMT5hxtlqoKwLpvT/seoVHww9biF/nNvQ1ogZ8065Y4oXl1M8rfl1dDHaYh0H98jqaHAUfh17lAsUQ+jDjqejawNV4DapZUyZNHSV3s2PaGJ8yKPHxfXaB4hugh78J18KehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165292; c=relaxed/simple;
	bh=aJ45fFzlBpekeJy/sKwi+3XlPM+vobuOcu+HEIq6wek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6/RS68+YsvFnGsTIFilg675VCvU+In4zawtRXXdtYXoFXCRrcqTT5PXEm7ihN0eCMHcAWZ6esyN1iB2lPn0CkaPfGE4jjTCHZar5pbSZF8/VzHGtqIi8T+zX0ytRsE1zNr8e5mQomHKZAaAcNveL8fqcNnSIcZMbxy5yP71d9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BQmwpvRa; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BQmwpvRa"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788165284; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=EKY5CGhOvyevo/P0TzoHSDtfqd60ZagTatW+ckmf+JE=;
	b=BQmwpvRaN91VAGELiQARVxhrZqyKotFibbUBt56+G9kH6g1FGO9enbPRhn2QkJjYkuams0YjaiiRRUoDKgiugwRPQDOKOeF9N5OlJhkj32FO+30DOus5eQvvK0YVCdmGQ6PiLLb9T9TzipX8lwcZS/rWmXQtVhdKKRTsE9HyucI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X9v6q1g_1788165281;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9v6q1g_1788165281 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 16:34:42 +0800
Message-ID: <d65769f4-9b6b-4da2-b54c-7ff5ce47b9d1@linux.alibaba.com>
Date: Mon, 31 Aug 2026 16:34:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/mglru: make type fallback logic explicit in
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
 <20260829074204.45304-2-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260829074204.45304-2-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/26 3:42 PM, Barry Song (Xiaomi) wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> The for_each_evictable_type() loop in isolate_folios()
> is misleading: it does not actually iterate over each
> evictable type. Instead, get_type_to_scan() selects the
> type to scan, while the iterator `i` merely bounds the
> number of attempts.
> 
> Make the fallback behavior explicit in the code and remove the
> opaque for_each_evictable_type(i, swappiness).
> 
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
