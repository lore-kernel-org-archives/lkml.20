Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673B480949
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430271; cv=none; b=moxNzAz5n3FRyf/gUDpRKkq6uE4Z1qFiZR9LiJ/6AFsYr96CD1J9syKxL2L0eeFpRdYlEHnq5hOdrIGKCApzTvGePlONbHEU+tIhhxynmInHmt9aD/yTuxaT3Hb9W8W3qQRaQZtX5DEqiQwI1fCXz0Wxlb3Wl9PWvp5/VVhvFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430271; c=relaxed/simple;
	bh=T4oMwmV9loAXaIRARb+UbTHvDb/4USedz/e9wetIvm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imso+PFjI00oGwsAhL6vnG18kYBqjZuaWFNx6krq8E4BqBpiMiOOJ9+wIrOLLxvsiiel3ySrtn4VUbyPPgktv4xuzJFb1PkULwGVAvLEcFTCIc5cU/Z+F749aRhlzm+/USvzP2xN2VL373F0xHTWzKurGh5D9oVw2/3HFHldaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cFRFSdob; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cFRFSdob"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788430265; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XuxH6CgSRG1EdPhP+jIRa4q6speJtBOZLJj1P0OaFuc=;
	b=cFRFSdobXAtwzuwaGEzqZEu3w1nVN99fisD/yAl1k/wywwlUFDOZW8+LaFAMLkSTT+0sfTQM5/06ycefk7hW9atPV8ghvfy2uln7q9ceZbClRz/P4fzCadJunmYpcAo4TcmyE9jcv60QhZzr5IlgkvGjRc+u6Q4HVi1+kV8i74s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XAFfT1p_1788430262;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAFfT1p_1788430262 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 18:11:03 +0800
Message-ID: <0f2d9837-0198-46f6-8988-8bc089c1234b@linux.alibaba.com>
Date: Thu, 3 Sep 2026 18:11:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm/mglru: enhance cold/hot inversion handling in
 inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, chenridong@xiaomi.com,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 Xueyuan Chen <xueyuan.chen21@gmail.com>, Ridong Chen <ridong.chen@linux.dev>
References: <20260901232421.40157-1-baohua@kernel.org>
 <20260901232421.40157-4-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-4-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> During aging, a folio's generation may already have been updated by
> folio_update_gen(), even though it has not yet been moved to the
> corresponding generation list. Such folios are hotter than those
> already in that generation.
> 
> It makes sense for inc_min_seq() to increment the generation of
> folios that were never promoted during aging and move them to the
> tail of the new oldest generation. However, folios that were already
> promoted should instead be moved to the head of their updated
> generation, just as sort_folio() does in scan_folios().
> 
> Otherwise, promoted folios could end up behind folios that were
> never promoted, effectively inverting their hot/cold ordering.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kairui Song <kasong@tencent.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> ---

Good catch. Make sense to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
