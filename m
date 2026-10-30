Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324983;
	b=0ub9p03iOq0gNnRsssOAJ8XETcNBfitmSH8AdZ8nWu4VYpT6ad5a6P4T2I4ff/eydflv
	 eOGDzY6NrlIJLlSu0WrDCuNapghOQWA83doAVk6+vvMs1RxeHFJwGT6XcS/buZZEyEFPq
	 yeHHE6jbTJhQ2NG6ln5RTK7lMuLfIEGI7Q9Wn0a6DxIbz9ElHh61K0G2gki9cyZA7A/7U
	 8IcC9S5GCnlL2xST+l/1dqy55kI9VCaFIxu2IEQWApFKgCvT4trSFTRBnGn1B9+nrKX2M
	 KAsH5moO0SEzQylIqO0SjzCkj7NyR5nztLYE9nWySX/JSRPg93MnCCkKlkxj4FpWo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ks/als92P7W6dfkbUwU45ITyxrQRBrooZjsUBw6Ieik=;
	b=w+HZGm7/fnOyRx3BgSQcVJxz6Io9/5n7QQvcF0Yi1xxUrSFhr/SFQK/HRmaHSMtoO/Zy
	 ngLBYHqPaZ1W4iPRS9TmgRky3/dWnC7++F3XT7g5+R51vxFONXfEG6SeL6d8Zsx8XyKi2
	 uUK3vUwdUZvDHOYsnwGZ1lSrMCM8td9srSS4HHCKpfTE4KiquS+G5+Ut6R2nimaYC6dEI
	 aQjFfxjLcsXMCWkpUp+EGY4clsutEaixhUT1yq26gGhZd2KvJJKrhyqukvoY+zL6TArQ2
	 TO5XQ/u8+u5M6+Rhj75EiuN/bHh8JOVFUIkJedw4areS/xawmKQGxOLQmxSqjFFluaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iD5IOsSI;
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iD5IOsSI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pbxzV7BQ52dy3p13iURJvjvoZreCLEfbqYQbK2sAiaE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793324979; v=1; x=1793929779;
 b=iD5IOsSIZVHtf3NUxmwGJnmDh6oWImrqcYxGWcyoDWrwBHgf1pQyRkU7H5gC/Ypfb7A2d76J
 TEGvdZk0yj3P/sTuOVNK31dedzPDAEsqP4hgxZdMkwUATqDp5AhsopEk42lJiotlUjj8rfl8a4b
 huG4aQLCY+tO7AwvKbeurjwI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb3448e0ccbbf1c7;
	Fri, 30 Oct 2026 01:49:39 +0000
X-Mizu-Trace-ID: eb3448e0ccbbf1c7
X-Migadu-Flow: FLOW_OUT
Message-ID: <8f8d1c9e-da88-45a9-bbe0-c1b1403e949c@linux.dev>
Date: Fri, 30 Oct 2026 09:49:32 +0800
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
Cc: cui.tao@linux.dev, cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] blk-iocost: account flush sequence latency only once
To: Zhe Liu <liuzhe1@kylinos.cn>, tj@kernel.org, josef@toxicpanda.com,
 axboe@kernel.dk
References: <20261029092424.764545-1-liuzhe1@kylinos.cn>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20261029092424.764545-1-liuzhe1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Zhe

在 2026/10/29 17:24, Zhe Liu 写道:
> A flush sequence with a DATA phase can complete its original request
> twice. Both completions invoke ioc_rqos_done(), causing the request to
> contribute two latency samples and adding the same queue wait time
> twice. This gives such requests disproportionate weight compared to
> ordinary writes, distorting the device-wide latency and queue wait
> feedback used to adjust iocost's virtual time rate.
> 
> Skip requests marked RQF_FLUSH_SEQ in ioc_rqos_done(). The flag is set
> when the request enters the flush machinery and is still set when the
> data phase completes; blk_flush_restore_request() clears it before the
> final completion, so accounting happens only once, after the whole
> sequence finishes. The remaining sample covers the request's lifetime
> through any postflush, and its queue wait time is accumulated only
> once.
> 
> Fixes: 7caa47151ab2e ("blkcg: implement blk-iocost")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhe Liu <liuzhe1@kylinos.cn>
> ---
>  block/blk-iocost.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/block/blk-iocost.c b/block/blk-iocost.c
> index 2ae40138e041..601029221e6f 100644
> --- a/block/blk-iocost.c
> +++ b/block/blk-iocost.c
> @@ -2868,6 +2868,9 @@ static void ioc_rqos_done(struct rq_qos *rqos, struct request *rq)
>  	if (!ioc->enabled || !rq->alloc_time_ns || !rq->start_time_ns)
>  		return;
>  
> +	if (rq->rq_flags & RQF_FLUSH_SEQ)
> +		return;
> +
>  	switch (req_op(rq)) {
>  	case REQ_OP_READ:
>  		pidx = QOS_RLAT;

Reviewed-by: Tao Cui <cuitao@kylinos.cn>


