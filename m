Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D53E3163
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428197; cv=none; b=MXh14Dw8ApxHhUYevcp6NMwq5zHVgxur+aYa95E2iB+OfT67NqMVOZrgvbSJgZtSwSo2M21Rp9k6OF3PRHV7rRK8n9RaIzYzeRhcC6zR4pXhhJmudOyi5/4l04njLOxo7RpnToxRfvoEYtnH71wvWqjyYshutTPh0OJt77ACcTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428197; c=relaxed/simple;
	bh=OYucJ8zQITIgVgimE5zlC0U1Hu6/+xr4Gh6nIkuPuck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+sx6ROhnRpBnuvM1He9CBY4b40upxG0aCcY5/VIs93clg566fkZnz9MvTVgB8qgfJ8GfQEDUogNdI/vacUS6wp/jyMmP99uda79mhdSVfGO6Axj3xRNs9e+Vnx1FbdiepQ02pR297UqB+7Gw4PX7nLCiPv58j4bYtYR0z3QtDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xZ7mpqy+; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xZ7mpqy+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788428192; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ZHXlcVNuqjzxvDs6KIJk1EVwoe1MLOPuPzurkmabzMM=;
	b=xZ7mpqy+a2g6ppKC1Q5oR4BSAcu1L90qY0Aa60zBfhqzlt+ogjITDvojGBEKNl2+L2V8SXthftLs9JnY9hYFmLx0pr2zdgca8KX2VuwgEbpPgcWYm7ZJThMee8S+k5AZRg9jQ337hzQd5DvvYxajOt/X6kolS5h2LMAh4HGL8uk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAFZ.Pr_1788428189;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAFZ.Pr_1788428189 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 17:36:30 +0800
Message-ID: <0b983d89-1fc3-47df-9dd0-5a945f05d65c@linux.alibaba.com>
Date: Thu, 3 Sep 2026 17:36:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mm/mglru: separate folio generation update from
 LRU accounting
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
 <20260901232421.40157-2-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-2-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> folio_inc_gen() currently updates both the folio's generation and the
> LRU size accounting. This makes it difficult to batch the LRU size updates
> when moving multiple folios.
> 
> Extract the generation update into __folio_inc_gen(), which only updates
> the folio's generation and reports whether the generation was actually
> increased. Keep folio_inc_gen() as the wrapper that performs the LRU size
> accounting when needed.
> 
> This separates the per-folio generation update from LRU accounting and
> allows the latter to be batched by subsequent changes.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
