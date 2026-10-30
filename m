Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355971;
	b=lpc8zMxpzfmfNqI1wn6p66yNuyD3QgnfQNoOscs1uyvIwemNrzQVOF9oNCfmlZ/5TmJU
	 uiPBVmSpUwixeGeP02yyvaRg365d8qHR8khSdNgwAo7rYUs4ZkYpqh1dED8wiq/RT46yk
	 ddnRfCUFCTM+/wT/dMP+5Fm5+BCkyyAaTBEg3CbmFaIuNC2YMrui5vpaLb1lV/EDzLegv
	 ma1Bv3KxbRpjjxCgnYPfMVCG6flPQ8bsIsAkf75y9fzP273dubJU+JmS5ONV5FsiljC2u
	 x1PlBq4zRpxIP8Y0gF3+PZ2SXMnUAAbdKnUIgnJKwA0TJrypYa3TlH97AlWoNGCzsMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
	b=31MM2zwIMOAM3NjrXvkkXvd2quS7H9BPEy/hcOzxRQ6BNA5n48D7baDaOdOgKqolU6fL
	 Cs8HxMEzTfuDWu+UEMefLtupdZHhIJqwErL0JhKh3G7LOJx1xBTyyjB6E62JGwRdPtQZ8
	 skLv34ywSZfK/VxDd6/qJ908Fv9fy7/rtIZFfkwPmBnRxUVMSByGjRJjIub8xPFuSXWD4
	 anVBwg5/slEMmSLfbf01YToC82qX3Z5YFiadLwuMY/K3LVC+7rPtgOCWlDhBtrsTUgnOk
	 UQN8gYqhmSoLpYb/cViv4Evws7OzcLDNrTAst7BBVfv0bzvPbOCtVOiqz5scYCZrIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhLMcOaL;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE33606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhLMcOaL
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so980593f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355970; x=1793960770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
        b=PhLMcOaL7tR16t9O6qwnKaq504i2yptLi47qNgV2oTRgaJFinkcAjXKqL5IyImiZtT
         SP97MVdHIjdTbyfAFuD7U2d6bVxWfhydX0ZOhHdPc0l5OeQ+E9c+PSj6Rf4MLvAV9dRa
         cLD8CqB18+b5RCnqDP/SbF9KotPj17RkpymGVZef9iNn8w/r+UfrIuj6Nep9ElZ28bjf
         qKWVOaDHUGTmSZuLNgsKzw0EgGZFipgVCdG0lzH8bCGTiciYoyATJl9h748ncbkk0418
         WE/xegpkV4LyN4mWZ3GeIFEnBBrL9gjhvziGkyy0ia56EMIZDyW6cn4RHfAnJFwhE41Z
         cFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355970; x=1793960770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUelzvzI0I1/N8qXjV1BcthIIh2qTCSRp7SQgDbPekE=;
        b=oPzH7c1pg3Fv8bao36b8AW9EP/ygtRi7TWB9RW8oydnJNc9tgn+K2mId0Y358GTp60
         hI1Vil0W3liX3Xu6xRZ4EGd2dnzc913diiqRTfDV4Wfl7jHrLGOvHeuKnzHn8XGDGuDO
         kJBHG/7Nbh1c+z3Iko2F4DywVY/Q2hXCPxk4G/QuaJWCTFe+RV2woFBBUp0H+enHrh+K
         suryjK1a7Dn2bH12YPGxpb2soBmnzaxF5Fcbhcupx1D71NHYsVhno+SQwQUk+JeB/Bue
         ba++yvct44mbzNUVQWygZY+xMTHxmQsYS1WS6xaMM0VPiDCp279BFVspb95ysDr6tBP/
         Lv3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6v3ljTrsnIeoErJI7ifXVzMoPFCkHKKj+8PwXFVPtVvoZflPHX32X3zYVOoXeK9ETR+mrNzWNJlFA/18=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoFd58CBwZnbliDvevgxlglUXuOyvWEw3fgQw+1q9QT0cS3Aib
	kaCgycgusXDrrnBdL1hVTb/L+PC2JgX3yDQ6Fwwm5Nq0d8mniiFB22Pe
X-Gm-Gg: AYBFou0XsRlp5u984vErsZ5vXXnd/XEfG6w7gIHo3gV6U/32daY2LCPqZd+zBmRccl3
	gmTw7BLbniFEIi6AKc3l7Kq9Q7B+hlz9iDJztn/lQ/EKLHLu8YDyn+uEnlK4PAF3exmviuijHnB
	qj2R40EkBJoo1NGxF05JYjmprkkRR3lr/tqEA6+bgy/f2W8kyDiMuKihL4cUyuONi2E5k5iJRlH
	842YnOEK1ECHw5ARPIqhucwWmAJzxCZ37itFAVc0PYtUr62qDa3Qwc2UTv5054SXujdHVuBO1Du
	aKpVqU+tAfLJNaKJqKYeYmwhk8ZEfF1+HEA49fJEGfmYM7yo1bOTUmCHEvKVZd463o+txT0KQa+
	NPpHs8n8MVrndsSiGtxihay+rAn6M+1+Yn1ZsAq/fLh6c8azToVQPrvGb496wRjXooGAfMUW5xS
	JpmFZ9MrVpMp5rzx4YmGPU648pyl2APgQxgd413AsQvdZ+XFJZ0je5SIJmTL5aQ4I9VggIhGNR0
	xZJssGDAl0cgqhzXKlEsE4fdc7PwL3Mmo5+KnfV+0lvPSZaUwq76ysnxDHNDdKoAowvZKuyvO2O
	joVUEsN9jhV1YCaY4WsUzVha/07IraQTEGIC5YRzjCLfeecgC8m8s32ywjurjNetvU8K0vQ1AqT
	d2qOXHpB3EfqoGCcPVvJ/AZE6n6Sy39+eOEEfkarHa5jIPBv1kyj46HoFmeK/injVgfTBf1EKTd
	KTZg==
X-Received: by 2002:adf:e011:0:10b0:48e:6c3f:f7b2 with SMTP id ffacd0b85a97d-48e6c3ff7d7mr5879996f8f.23.1793355969523;
        Fri, 30 Oct 2026 03:26:09 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm2527884f8f.35.2026.10.30.03.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:26:08 -0700 (PDT)
Message-ID: <bcafcbcf-9503-4fe5-82e4-ab9f8a3cb687@gmail.com>
Date: Fri, 30 Oct 2026 10:26:09 +0000
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
Subject: Re: [PATCH v2] block: only fail dma-buf bios that need block layer PI
To: Kyle Bader <kbader@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Kyle Bader <kbader@ibm.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Tushar Gohad <tushar.gohad@intel.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261029155821.2983229-1-kbader@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261029155821.2983229-1-kbader@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 15:58, Kyle Bader wrote:
> From: Kyle Bader <kbader@ibm.com>
> 
> All dma-buf (P2P) I/O to a device with integrity data is rejected
> today, at registration and in blk_mq_submit_bio(). Only a bio for which
> the block layer generates or verifies PI needs that. The block layer
> then walks the bio_vecs, and a dma-buf bio has none.
> 
> Reject only those bios, and remove the check at registration. Then a
> submitter that attaches its own PI, for example with
> IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.

Looks good,

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

It's also enticing to shove it under the existing
bio_integrity_action() check, but it can be done later.


> Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
> Assisted-by: LLM
> Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
> Signed-off-by: Kyle Bader <kbader@ibm.com>
> ---
> v2: a shorter commit message (Christoph), and Anuj's Reviewed-by. The
> code is the same as in v1, so the tests of v1 still apply.
> 
> v1: https://lore.kernel.org/all/20261028181412.1919506-1-kbader@redhat.com/
> 
>   block/blk-mq.c | 9 ++++++++-
>   block/fops.c   | 2 --
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 7fff1305b..3fc9fdeb3 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -3138,8 +3138,15 @@ void blk_mq_submit_bio(struct bio *bio)
>   		goto queue_exit;
>   	}
>   
> +	/*
> +	 * The block layer cannot generate or verify PI for a dma-buf bio, as
> +	 * that walks the data pages.  Only fail the bio if it needs that, not
> +	 * if the submitter attached its own integrity payload or if PI
> +	 * generation or verification is turned off for the device.
> +	 */
>   	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
> -		     bdev_has_integrity_csum(bio->bi_bdev))) {
> +		     bdev_has_integrity_csum(bio->bi_bdev) &&
> +		     (bio_integrity_action(bio) & BI_ACT_CHECK))) {
>   		bio_endio_status(bio, BLK_STS_NOTSUPP);
>   		goto queue_exit;
>   	}
> diff --git a/block/fops.c b/block/fops.c
> index 01bc8afe3..5c8024011 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -947,8 +947,6 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
>   		return -EINVAL;
>   	if (!disk->fops->init_dma_buf_io_ctx)
>   		return -EOPNOTSUPP;
> -	if (bdev_has_integrity_csum(bdev))
> -		return -EOPNOTSUPP;
>   	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
>   }
>   
> 
> base-commit: 45b716456dd99488a0cef58482120dc0474aa696

-- 
Pavel Begunkov

