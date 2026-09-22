Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27124DD3C0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059789; cv=none; b=d86yJRxluwzRz2Ra6oK6tz46PKr2yVnOrmqTBjHZmxztNVR5gc20SOXC07iFEPfR1XDg+A+x3fcxYUxlq4gW+5qsnCURn9Gc7VAVZqap9aYJOCL/Xh/XJlwkb76c5+m5hp1J5HDP36euFyRDiRKZgtWyoHLuYqTlSWv9CxlEt3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059789; c=relaxed/simple;
	bh=B3wosUAQJBLDFLILxBPX0SZDChxcSn3whe2zVQE5GLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDqVLybGTcBFaSn/9MwP0DH+oZoI0J9gLiccRtp2pWtwUE4Xh8zNPSnsIhxABrxKhgz3KNx0aAfmiEXaYRqo1czGofsYMMY9puieTw6FdSRj7d8m90c7sKwmZanuAfv5gN+fTJsAyT7SVCV+EYAj87mbpb3WVhIgEGrhUB83L9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=VNUVZ8GX; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="VNUVZ8GX"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so2615165a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790059784; x=1790664584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dt+xEJCMHk3Wb3Te/EW5gGwA4SLsGhrrMq07tSq9fOs=;
        b=VNUVZ8GXOFMTGEI9z7q/1YahEKijl0Jl5E+fTOzx8qdM7lH8sb4BeQqcBsJ09gcDEv
         2R0zdX08N0Cmvx3dmP2ArSCH1L0XZ4c5uqF71piSsrUYyQgkQQ3PHNIHag1cILhfQu+G
         qJhQW6mUjVmhq8otLhvURDcfWddXtEdXT5+8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059784; x=1790664584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dt+xEJCMHk3Wb3Te/EW5gGwA4SLsGhrrMq07tSq9fOs=;
        b=oDbEOgX+pLPFJ4gLE6IZrmjG5OpA5T5dj9e4/jS+uY8Gn1lxwwWlKd2p8uB6vaLanT
         j8FfKBGfc3bUWSrbiE+uZVffTdCGPOJ9G/xPxXlvYyws1MXsjeaxYzuLtxUG1MN+pVux
         azW3fUjCnj3ZAoXSjYpWzQIi+OUZsRKQP/wKx7R1jmnq7CFakzhbWbgxhtgI0YDbnJE5
         +r+aj3kvr8cJz+k3CevA25qLsjGBhSit+zSixjf8Y6sWg6MXCsMSt+3pVTxLRb6xCOcp
         4wxzKeoltsE6NDeStGKxQJV9B/T4El4KWag7ObdXLg8SFc9Gnqgs7/5EHxTf0Iexh2gy
         R/Rw==
X-Forwarded-Encrypted: i=1; AKwUvBw2/mpvjffN2cIdAXOkTQk6DegSOtGTKhRCA7ZTpxqAuttWU3y4jrI/LckLmFdhi3HnDerDCAWgGNjSNgc=@vger.kernel.org
X-Gm-Message-State: AFuF++kIFI0q36+gF7B9UKdn5ffYFUU3YYdhQd340x0VNexD3kLSOodN
	IeDNDRNQLsCn1aujG5NhpTXicnBs/NE9KRMFG1Jl/mUh/G9hdIhnBcc/P4+CydVbGJs=
X-Gm-Gg: AYBFou2AVMApB/xMPNRzYRb4CSzYFnJccUxZd4T5YVNy8Tfuv/q2OZwQQtWaez+e/9M
	TkAjdQ01w+rlydl36kmNgYuuakl2PnV2GwExSZe+iLRMwVBzJZ6l7ct7uh1KbuyRTv+8ZwhTJZb
	Eg57U3YufhQW2gwzwgXQfQ5j6z0c/NIIP57Oi7mhqB6X/CO+iZUI+JDifmljqStsWwog6Ms77PQ
	gCD0fehB8rODybF53jwZbvJmS64pt62WdTeiJYSjyeX00tPZ8MLtRcLmUbbSe57DpYNxLGiakRn
	bkdnunZLemmV+IMzEvgzhceFC+hwPTR/eN/bYJ1o0fxHfXzWM87N1quhaLUQ0+iAoMY/kuuIk4e
	enlzBXUA/YCE5ynXsLKiwhZWjEVYy16+XIycI/mKRqT0BmOEOaMVj8KIgycKDt4/oIDIJe25YIX
	YidEc4Nj2E9nILJ1jtiS8sp3sSAViHNDKYi7JvllESz2H8XDCXEDNEW9AbqWgNOB74
X-Received: by 2002:a17:90b:574e:b0:39e:4c81:6c61 with SMTP id 98e67ed59e1d1-3a073119e14mr213705a91.28.1790059784299;
        Mon, 21 Sep 2026 23:49:44 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm2985765a91.7.2026.09.21.23.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:49:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 06:49:36 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] scripts/gdb: mm.py: remove fallbacks for
 SECTION_HAS_MEM_MAP and SECTION_IS_EARLY
Message-ID: <54itd5fvuuqpwzc7nr4cvygcpfqh5tfizrt3oudnwjth7nwbs7@lk7pjhgoxmwc>
References: <20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org>
 <20260921-b4-sparsemem_cleanups-v2-9-54d81d65e125@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-b4-sparsemem_cleanups-v2-9-54d81d65e125@kernel.org>

On Mon, Sep 21, 2026 at 09:59:01PM +0200, David Hildenbrand (Arm) wrote:
> There is no reason to handle the absence of the corresponding BIT
> values. So let's remove the fallbacks.
> 
> Link: https://lore.kernel.org/r/vpz5zqg5nwbpolxbkip45vxxdt3lni7j2haal7q42skc3b57tu@uh4cec4x32dq
> Cc: Seongjun Hong <hsj0512@snu.ac.kr>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  scripts/gdb/linux/mm.py | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
> index 193a88d763abf..7398105ff3f67 100644
> --- a/scripts/gdb/linux/mm.py
> +++ b/scripts/gdb/linux/mm.py
> @@ -71,12 +71,8 @@ class x86_page_ops():
>  
>          self.NR_SECTION_ROOTS = DIV_ROUND_UP(self.NR_MEM_SECTIONS, self.SECTIONS_PER_ROOT)
>  
> -        try:
> -            self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> -            self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> -        except:
> -            self.SECTION_HAS_MEM_MAP = 1 << 0
> -            self.SECTION_IS_EARLY = 1 << 3
> +        self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> +        self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
>  
>          self.SUBSECTION_SHIFT = 21
>          self.PAGES_PER_SUBSECTION = 1 << (self.SUBSECTION_SHIFT - self.PAGE_SHIFT)
> 
> -- 
> 2.43.0

It looks nice.
Thanks! :)

-- 
Best regards,
Seongjun Hong
