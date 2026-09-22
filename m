Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE04FC344
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071575; cv=none; b=HtZq9TwDG5iS0BRyLGJguErgfd7raVWQa9AeHW747UBuYqqdpFbzPa0eiTZbDeKZ4WGecEePJ5hWKlrYS2w4ed7F5xgb924LUtW3k7Id0wsYcLndEGaDAsS9hev+uOsWOR8IwcL7ZNIDwBkXQGVDDnziY596soSLMzUb5LEmo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071575; c=relaxed/simple;
	bh=UrI8CmsAFjHMg/T/hEUr9rtwzpYf4x9oaAc1H7N6riE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYzC2DuEOa/nM4bJ+43NwVIP4/DDo3kwzoNSqR4SaCrZi59C3sGzcBMfgX8Fk2fZla8LlnL5IK5ShEbppXhrdlulRb+ZIWfJP2Yiy/VwkRWCq/ZP87ofy0bediLSf+rJf6YWifFQFph1DKq44AM+/4yQS7yriI9gCzklCse5qEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pi83NApN; arc=none smtp.client-ip=91.218.175.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pi83NApN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UrI8CmsAFjHMg/T/hEUr9rtwzpYf4x9oaAc1H7N6riE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790071571; v=1; x=1790676371;
 b=pi83NApNqBQ7LeV3VAf9mzTPU7HJ2Zm4vnb5QUeHo7uotGTTUCsWesJpu33rJNqqQogSKThy
 Il8SyqjMpnAOFCIDwWYdYkc45/el2VldjPV+zlnSxqXF9URLGWXxMPBA0vTKsQMHAs7EnH97K2A
 s6xZmChrmEDNGa2F6JeRZWBw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 79606e1d96316948;
	Tue, 22 Sep 2026 10:06:01 +0000
X-Mizu-Trace-ID: 79606e1d96316948
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0613627-9801-473e-8120-4d4a83133391@linux.dev>
Date: Tue, 22 Sep 2026 11:05:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] block: don't fall back to buffered I/O for atomic
 writes
To: Tal Zussman <tz2294@columbia.edu>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Christian Brauner <brauner@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
 "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
 <20260921-blkdev-fixes-v4-6-e2801f71ede9@columbia.edu>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260921-blkdev-fixes-v4-6-e2801f71ede9@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 03:54, Tal Zussman wrote:
> blkdev_direct_write() turns an -EBUSY from page cache invalidation into
> a 0 return, so an IOCB_ATOMIC write is retried in full through
> blkdev_buffered_write(), with no atomicity guarantee.
> 
> Skip the buffered fallback in blkdev_write_iter() for IOCB_ATOMIC, as
> it already does for IOCB_NOWAIT, so the -EBUSY case returns -EAGAIN and
> the caller retries, matching __iomap_dio_rw().
> 
> ext4 has the same fallback and only warns in it. For block devices the
> fallback can be skipped before any I/O is submitted, so fail early
> instead.
> 
> Fixes: caf336f81b3a ("block: Add fops atomic write support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>


Note that I still think that you can add an IOCB_ATOMIC check in 
iomap_file_buffered_write() (until it does handle IOCB_ATOMIC).

Reviewed-by: John Garry <john.garry@linux.dev>

> ---
>   block/fops.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index 90777e8a9a6c..7f23778f6b81 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -766,10 +766,11 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	if (iocb->ki_flags & IOCB_DIRECT) {
>   		ret = blkdev_direct_write(iocb, from);
>   		if (ret >= 0 && iov_iter_count(from)) {
> -			if (iocb->ki_flags & IOCB_NOWAIT) {
> +			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_ATOMIC)) {
>   				/*
>   				 * The buffered fallback blocks on i_rwsem and
> -				 * on writeback of the data it copied: return
> +				 * on writeback of the data it copied, and
> +				 * can't provide torn-write protection: return
>   				 * the short direct write instead and let the
>   				 * caller retry.
>   				 */
> 

