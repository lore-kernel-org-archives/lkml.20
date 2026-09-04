Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BFB32143D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489504; cv=none; b=V6AoocmCzJofY5Y0tWMFXeEZVJN6+MAsMylRyBNFDfrulyfxIcIdmHbAoim3b/X9F3BuaOo/gNLcU1EvVXZnGbJxaDzyhxENCpb09TeG3miv5jdI1WZ3kVt+Sb7XVXogoUrynvJNNtXGiV8ILZGU0nFwpk3x7fq0D2qkeHIDZTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489504; c=relaxed/simple;
	bh=NZvrE3f4qBvniBtxQ7hbL/KmGZVos+phA6Orddec4Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+K5MEm/Llzs6YcBL/3kYQAvAGFUvivoAfCpTSIaNrXiiX+Wo8EsNN9P6V+O9vYzCpUco41zhZ4N+DEJqGSCQoyzZ5nTlB6dAo9VK1YO44zCwlQkU/w8G0FIVlOz0ekyNfDJcm8lB5o+ozynKRXy7b1LSG4o8MWpa2VTzvquRmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qjPohMq8; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qjPohMq8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788489494; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1iDbS/2opdWj5daik4HnLoHkAw0htao1fAwdVPxrQ6Q=;
	b=qjPohMq8L4HHw3RJRIhLCiAJwW6xe5iJYEx03iuM+YYT7digHisecPeEuRJso4lOQtw1OF4PsvMXeiuUiUUGrCeilQXQR14tz/s/HVTHj/BhqMIj4DSDSefm0sODI3k0knoVd4tx88z5aqlWCSG1MZso2oxZdcBjjBjYNokXAQI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAHJ71n_1788489491;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAHJ71n_1788489491 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 10:38:12 +0800
Message-ID: <9d4b2f36-5fd1-47e4-9f35-a3fef2913bb1@linux.alibaba.com>
Date: Fri, 4 Sep 2026 10:38:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm/mglru: batch move folios to the second-oldest
 gen's LRU
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
 <20260901232421.40157-8-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-8-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> Detect folios that need to move from the oldest generation to
> the second-oldest generation, and batch-move them together.
> This can significantly reduce the sys time of inc_min_seq(),
> especially when the other type is significantly behind the
> preferred type.
> 
> Assisted-by: gemini:gemini-3.6-flash
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> ---

I have the same taste as Baoquan[1]. :) Anyway, it's up to you.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

[1] https://lore.kernel.org/linux-mm/ao6zFSzx6mOl874A@fedora/#t
