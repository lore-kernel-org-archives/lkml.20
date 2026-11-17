Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883277;
	b=aCkGlSPxgcATAnkWthliUSN+aE+40r9zPAOr14sgBZWnnfdFzWawwy6J0TSZSmjv+Vaw
	 vuuGzqKVHTmw4oITC4gPC1eUXxUUBCcBSWsoSMPx7IphBoNjUqrTi9KZZIBams8r+Kk3m
	 4BKrRWqOgfTTtKLxp68yUftp1gwDoIHJORS3H39Etq9YvsMej3SvyHcnirEwJ3qlDdsPD
	 7he57Kn2AgFI3wXGjO/MuRuUQ3LP+fehf7LAAJIUhB7RhunSp9TtsJaZIRaeJhE/AoW93
	 1wdpDKrN81NmzFWB01i0Q2tqCXHqEkVod0/mzniVvZ2xbNN05GVVFfO8mNWB/FY99pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
	b=01Iz/YUIXBYBRONxoQ0N93xQR2hKMQtw+qGoSxrTR+rj5o1/ciyoO7AGD9ZTcaaDuCfG
	 Ho+ls25KE8wLCHS8O95rsTUxBzvNKpqYt91NP0Fnk6RLRcfq79HOgrdW4XhygjLbPLINy
	 NQ66J9Ux+dbJiYy/TjNajGZAAxprOUE2ZnI6R/dkmxtJ+xBjgzxjs3WN2mghtzBQIHl9P
	 Q/nLmeZovwy7tO3Ch4cmSE2eqJ5e9FTNzmKU3N9KheKEzcpqizDXOIvtEQw/XzPtpichF
	 uInWRo9e5ithyZ2/cAKn3c/dY1eA/pUM30lbHlbSpXJ/hvtb5B3vB4lfo8Q9+AaFABg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpv7yFj3;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0491606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0491606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpv7yFj3
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso317026c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883276; x=1795488076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
        b=qpv7yFj3Q2nPcAN7KHsRHLBqCNYBADkrVnYKuUVtR6MFdoG3PyldCv+tn8xynudmqf
         5WBOo/d4tQR7jwng0FNFzJVW8QHMJMJEg/rXm9Rd1Z999K6acAViLSKcBHyZFcpC9T7p
         eTQg4p0CT8t0fTUgNHgSOvUC5vNrcrM9aOCWvORmSkEwHVXJGFf5NC/WJaUtesFB1RLc
         3plkN4f4XYdRCTU55lOuY0cKX6RUz85BN0bs1FoFkHNETxr8uOfqgv7uAV72v24kYZ/u
         gU3sLxI7YDGQmj0JlKG0/ralskhVX4GRtdhP+A3NFPlgFrISqqiDUZ+YmCx4TBfAKDhS
         gTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883276; x=1795488076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q04N6U4B5Q631xjtJZ+YPrWXutbUwLW0YUT+T/yxok=;
        b=f+7MymZ4jL8wHGniOXhXR3VOSxRF9LAtThv1gbtsw7zqzmuUf12fQ9lFzgFiBuO+yK
         Cs03oIn0NBwE+BLexm9LaZ1igZ9fixSDMMRhvsdckyZVI3yitB4Hz3dpWWQH9NoSmr3I
         q+NXqJNRGhj4ZptrR5xJArUVc0A/YEOZdH8D+8MQXj2dnuPGnOhvCEj8RnqH6oIcbKbd
         +YncKBSYU4QlksUz9DxWv3W9sP712OH4jpw6G+TjZcCqDLopYIhMZ6+BRD4bpSrvOj1l
         2ErF2i4Rhz3WI+UgzjxhAcW2Rkxg4r3BCSKXPpVZlaZAzDftH4xwJaklVmF3NjGfIYtW
         3qOg==
X-Forwarded-Encrypted: i=1; AL+hErHoI2+EIXDXoX8q1wcsCCNDjLZ2p59SCOLSrbgOQ95WJZuO54V4FI8t0WMDtr8gfC2Ocrdrae8QCmARZRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d0lOqzoUJ+UyofXtM2a4L8p9VoBqhby53GKsLLyAb5k+9UUPo
	pmMKd6XHVxZ7tRJHaRgFqDse44qwCUZfdKU0l9zJEa62m468zsvS79r2Sz09mXVybUA=
X-Gm-Gg: AYBFou1/AglepVON22VWA7182lLwXQqIlPgFeisQQW1H2XOImQ7WHiz17hz/+L3hPQk
	JHoLH2fjuIHGOjQryn3Vt/0bRM2NPeqLiqjRGULfQ7YLLRLyCP2hnuPFHRt3pjVCKQGqj504vwh
	VRpYtYiovwt69KtdziDy5FWeAq04110Na6KRgVGc15pLmezkawjBRGVcR0VfQVKXN4f/+5At4Oc
	ie1poHy8IekwAw/z7EaO0BdLWY4+vdEmUQTAeCpIc73uPASSiZI9ysYTCWtZ910mTEINbiuq7T3
	tdC1l1kkx1oOBArgZ+8BflE11vcqJPBHy5xIo334ZS9Z7Dx4/2sFxIkyFapN1dU7LC0O1J3ABMQ
	c3ycXA6zuOa11Hr+ZnbrVUgPl/gESpyfW0wDJbjLeFrBY9BqH16YnGdIc4eIWA5MtIqLAbzaxKH
	86BFf9+neUuWCeDCpDlxtOA3astDjCjRH9+9zLDQJDnsjUk6afxoUQyGzjeg5eAgfLZUW3bY64P
	XOSijMTx51IQxhBse6wLKiZ/ixAYLR7VC3q1M9h9tq24UkYI6qE3gCljJY4s6IPBPyvq08Atx0w
	zNr5P84MdBdf+kEVT/q9EuDupsY8t4Dpm7hUnsGAX1fJ+pRsXaZkFLhkJJOH/91dKx38iw0ETKT
	VEgcWvz006DmWlsuPkGgWdWhD756PemiY3g==
X-Received: by 2002:a05:7022:4392:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b503175a36mr18573024c88.25.1794883275826;
        Mon, 16 Nov 2026 18:41:15 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm35592113c88.2.2026.11.16.18.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:41:15 -0800 (PST)
Message-ID: <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
Date: Mon, 16 Nov 2026 19:41:14 -0700
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
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116044519.281756-1-teel4res@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261116044519.281756-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 9:45 PM, Cheng Yongkang wrote:
> io_timeout_complete() does not check tw.cancel. When it runs from
> io_cancel_local_task_work(), a multishot timeout that has not reached
> its count still posts an IORING_CQE_F_MORE completion and rearms its
> timer. With a zero interval the timer expires again right away and
> queues new task work, so the drain keeps running it until posting a
> CQE fails.
> 
> Normally the CQ fills up quickly and the request then completes. But
> if userspace moves the CQ head far ahead of the tail, for example to
> cq.tail + 0x7fffffff, posting keeps succeeding and ring teardown is
> delayed for a long time.

But why would the app do that, to shoot itself in the foot?

I think the fix is fine, but the premise of it is very odd.

-- 
Jens Axboe

