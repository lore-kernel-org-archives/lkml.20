Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387929;
	b=JO1Hpv5BBD75m6wdR5jCidRiTRvkpVpynZH+DI+jPQd+08rKMZwrON0rAI2yG1wom4ZV
	 RXb8zISlAKUmSn+G0W2aIh0ICxayds9MihRmSUdS0T7+1Ltc4gdKoFT7aDAbtkzVwL2k3
	 lHsfXah8114T/S6L+ny+qQRJ3TndES9sxV2UOGl+ubPVst0KiMsS8OTOYypgLYlNNYkv0
	 9zhkKuz3RqrFqq5jA3Ig4FECKvnUbU1gepzCIhFUQz7KPgZPKLBru59lOyj40BgaPwr8q
	 S2xK4wvWNQdeCJEXhFL+CouxCseNzZV+0Xa37bycwsHPHJQY5ItBDpwwy2vM2Kl5rDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387929;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6boj/nrh3+x/lyQXEXT7Z8+s6teaalDRuOVNSEcHmJI=;
	b=Z9g4VZwQoqVy46s81T70y3cdKt1rnFHenUeQxo7kFvqz7JxszuFFh/VUooAZxmbogQM1
	 M/a4JauhgB4jPJjgP9N6iivXeZhOoATmR3rc+YFoihElZe4mAuoLHpmuHf5DHwXmh9muP
	 zNvhseuOkAcC0HOXiY0InIURFpfLWI8gQvINfH8LTEffzeAXnDmv9H2XrCUOc7r9x2AUH
	 nhHctsHC7GdeH05TNQMn8GuIyxRt5zi41WtLCP7XwyQV/9kmweWRRKD0pOd5+OAW2jhC9
	 eAqzXVXKK5vz9K61Qs7KM8wspQl/QB+YZqp3sK+TL4WbJOFqYm8/nGLi1JF8ulixhJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SRGpaGl8;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65280606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65280606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SRGpaGl8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794387925; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6boj/nrh3+x/lyQXEXT7Z8+s6teaalDRuOVNSEcHmJI=;
	b=SRGpaGl8oKHy+gHi40tUzldMMiFt88+z/8YewLslIxR7yIbNodk16EaS+ZOLgDuKsBe1Tx8aNbEbl9Ct02Hhd3B5O+x12oBW4cr+gNqphdUg5/3vcUlcIc8j5TNNEJjyJTEfQm0jkkGH0GbjHctCMZdgnZoN62NAVyyeCDmT7tM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEYLJIk_1794387923;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEYLJIk_1794387923 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 17:05:24 +0800
Message-ID: <1291b635-6dd1-4887-bfb7-075eee45b7f6@linux.alibaba.com>
Date: Wed, 11 Nov 2026 17:05:23 +0800
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
Subject: Re: [PATCH] shmem: Serialize fallocate progress with writeout
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, akpm@linux-foundation.org
Cc: hughd@google.com, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+aae8bd56cc1c38d50ec4@syzkaller.appspotmail.com
References: <20261111084155.80971-1-zhujun2@cmss.chinamobile.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261111084155.80971-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/26 4:41 PM, Zhu Jun wrote:
> shmem_writeout() uses inode->i_lock when reading fallocate progress and
> updating nr_unswapped, but shmem_fallocate() accesses the shared progress
> without that lock. Holding the current folio lock does not exclude
> writeout of a different folio, as the KCSAN report demonstrates.

Could you show the KCSAN report?

Also, what's the actual impact? It looks like there's no significant 
effect to me. For this kind of concurrency, I think READ_ONCE/WRITE_ONCE 
should be sufficient?

> Use inode->i_lock to sample the unswapped count and publish fallocate
> progress. This matches the writeout side and keeps the existing folio
> to inode lock ordering.
> 
> Fixes: 1aac1400319d ("tmpfs: quit when fallocate fills memory")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>   mm/shmem.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 990f1b083779..5769cfab1d71 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3969,6 +3969,11 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>   
>   	for (index = start; index < end; ) {
>   		struct folio *folio;
> +		bool unswapped;
> +
> +		spin_lock(&inode->i_lock);
> +		unswapped = shmem_falloc.nr_unswapped > shmem_falloc.nr_falloced;
> +		spin_unlock(&inode->i_lock);
>   
>   		/*
>   		 * Check for fatal signal so that we abort early in OOM
> @@ -3979,7 +3984,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>   		 */
>   		if (fatal_signal_pending(current))
>   			error = -EINTR;
> -		else if (shmem_falloc.nr_unswapped > shmem_falloc.nr_falloced)
> +		else if (unswapped)
>   			error = -ENOMEM;
>   		else
>   			error = shmem_get_folio(inode, index, offset + len,
> @@ -4007,11 +4012,13 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>   
>   		/*
>   		 * Inform shmem_writeout() how far we have reached.
> -		 * No need for lock or barrier: we have the page lock.
> +		 * Other folios can be written out while this folio is locked.
>   		 */
> +		spin_lock(&inode->i_lock);
>   		if (!folio_test_uptodate(folio))
>   			shmem_falloc.nr_falloced += index - shmem_falloc.next;
>   		shmem_falloc.next = index;
> +		spin_unlock(&inode->i_lock);
>   
>   		/*
>   		 * If !uptodate, leave it that way so that freeable folios

