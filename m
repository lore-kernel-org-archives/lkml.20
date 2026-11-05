Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871171;
	b=aAMIG0FtNcK9fOw/U5gew9HMFDWN9GX1boTU2DrvLnTr3W8Yc/VIdKvLIwW/KalccAe2
	 7AOQaVaOug6YUoDZAvl5kF0sH9Nz8Llqu3lagp7l8UPEH/7XwCjW1WZmkAhT6VmmqD6QW
	 iM9su1ok2vlhESqWDpK1DPEf5JJbDMO5y2ahQh0wSQ+CN63hE38zpABZiZgqHNFycB279
	 Fnyl4Gv+6uQ2GRNerrgjDlH+7CnsUvPqUknskEPAY2nACFMbuc7Yzpynq4j8IJbIUdboQ
	 Y6as8Znppy0GZ1y2HZyJSM6qLDny+AVJS8tBqgOitjfkej2ka6iEfDABPBKw5f7iNkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871171;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ysAWuQsmXi0UpVaJ15Q1RIi/6yFzToRukQ4uvO9n3gw=;
	b=sgX46R38TLS/kLPgOT1RB4uNuFjsUjm/GPlywP1Y2HnKmLs+iPAiiHU7uvBHiPkbwTi0
	 9FsvT6KT/c4YIT5eOjDiNk6wtJqFtz5QJT0kccjHc3yxJECudVVjhRlK3s2mSehASvjm4
	 +f53RjhU9HBuhS3d2VEy2QIFrTnFRzg20LIu3nUwUOpVL/w6GiTSjrI5eOWICrNazG8n4
	 tdbH0kAsvYdAXMYfe4Ec04ZeFBuiOIQX3J+xqsdMvmYBjpc+PLOtztDUS5LFtIRvibcSb
	 ufv8HE5/+KO53DqwWFN+djfOrHWWyQqcAR0ZKReR1VejBo21WTEhQDkZejaN9Qhtczw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xLtixwq4;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D41606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D41606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xLtixwq4
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793871167; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ysAWuQsmXi0UpVaJ15Q1RIi/6yFzToRukQ4uvO9n3gw=;
	b=xLtixwq4lf07giPU+hnjSd8DVy0chpDOZYUxpFnK64pQt5WMZlp0jVaJABZCL6jd/1cjq7p8SWAFzeg01CCHc96EKQk+kJ43HzscgIXLispOlO4Y9n/aIKvlILeymWaNNHEhxv/GvFltj0xvqce9Fs0QBoO2VoWfslaQBIIgWL8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XE8D.3c_1793871166;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XE8D.3c_1793871166 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:32:47 +0800
Message-ID: <d07c04cb-3ee2-48fc-b289-7167a8589f38@linux.alibaba.com>
Date: Thu, 5 Nov 2026 17:32:46 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] shmem: skip empty unmap ranges when punching holes
To: Hungyu Lin <dennylin0707@gmail.com>, hughd@google.com
Cc: david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261105055619.58289-1-dennylin0707@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261105055619.58289-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 1:56 PM, Hungyu Lin wrote:
> When a hole ends before the first page boundary, shmem_fallocate()
> calculates unmap_end as -1. Casting it to u64 makes the range check
> succeed even though the hole contains no complete pages.
> 
> For example, punching one byte at offset zero calls unmap_mapping_range()
> with a zero length, which means unmap to the end of the file. The file
> contents are preserved outside the hole, but unrelated mappings are
> removed and must fault back in. This can be reproduced with fallocate -p
> -o 0 -l 1 on a mapped tmpfs file.
> 
> Keep unmap_end as the exclusive rounded end instead of subtracting one,
> and adjust shmem_falloc.next and the unmap length accordingly. A hole
> ending before the first page boundary then has an end of zero, so the
> unsigned range check skips the empty range. Retain the unsigned
> comparison so rounding the start near the maximum file offset continues
> to be handled correctly.
> 
> Fixes: 83e4fa9c16e4 ("tmpfs: support fallocate FALLOC_FL_PUNCH_HOLE")
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Use an exclusive unmap_end throughout, following David's suggestion.
> - Add Baolin's Reviewed-by.

Thanks. This still looks good to me.
