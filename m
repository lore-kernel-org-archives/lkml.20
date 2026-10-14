Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2983EC832
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983225; cv=none; b=JzD+lRM97rpwNJ4JQUPY1sFvrTHgbnp6dkfLtkoHg+gJXi4eiJbKQDNAbCoviDGg42wqjZluzx8Mmy0UUB5dG+kVYgvNKWjO2C6fz7F7Wakdk7dZ9l/m3UBkYqtdcvSr6LIsC1pC28pFO/8iD6VauFwN9chjpkpstu5i4ZhCf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983225; c=relaxed/simple;
	bh=OySODPiskWWvzQQMx1Yq/HwVMV7iyUkBWw0BjUbVY6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC/1zPuqx39FReeg2iFdrv6otBVGyoFDsEXYtyZzBPjoxx70G2QzL/hCZUqwAfcMrFpGhv8lkS9xWVKDJyjn7KJ/h9Vt68WVtcIpvjTr474HD5FmWpBuBTM9DUavNoJ3l9ZpnpOPHw0FWJJ3/HKPgrS+Dcv7k2NDQZBmLmG0or4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LttP+57Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LttP+57Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso38400905e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983222; x=1792588022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5Xx2GBklmLYql9VZXZ+CeE2dU9lwoFm77pkgYHcd38=;
        b=LttP+57QkPAzmVVgUvRW/Pp91UXzLM8OE6jaXUaXULC9NYjzeL97NCoVyX/bypkvRk
         peQUYRfnh5Y7MVpWP9KRooCb+/mVQrAcK3pfdPbFtHqN7CieKU5nDRqxKJs4KaykY5Mp
         47FHCnhxBfn95ZlIQUM5t5uirtgnxgVmEnAsTSU8pPnjLE6qTS4hZ3q7rZwFqBphpimm
         LGq0XY1fMplM7a0KAexltkifQNpAVK1FaCAC4DdwrUBEjs104BAMvmB6DmZ+xRfXWIk2
         z3vVscEpYOosS5Z8V4hkMt6vyU+dMBCChD6MxSCniSCY6yv2aP/zXSFRlHwh6OdTiP4w
         tZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983222; x=1792588022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5Xx2GBklmLYql9VZXZ+CeE2dU9lwoFm77pkgYHcd38=;
        b=EppeelNGaOvVdP33jsz6A0tMM/pueFvF1Wli+ilGLWqtoVUnHyuuz2HpLgHxGYp8T4
         ErVxHp6CL3MAz6Anx2WiwQW0PQRnECERMywEYfk+61Ko+IPmrSakqglJYiJUnp/kyesb
         2hBWupFEIMoO9RqNV3M5i9+Je8eJucpIvzQSk6AQXIcoqTDybu9sffxFJHbRuj7VjwCF
         UDqEZ+liaeG1wUCA1PoTZpLELdl+i79/A7ve78Hf1CDw4eNaggmb98yiRHYqZZkpze8C
         BiWMfDOLbzsMa87CCnNY7r6+AYgKVLM0jl8+h6RsLNIVvUp5OCpe0e4nB2ZJMliTtFuX
         K4wA==
X-Gm-Message-State: AFq9FYLuO5ILSJ13xv0DDrC1rU/ArssCc7z5Rb+8aPtx+q5rdhR8NAIS
	cps0CMXOaLaujZNbdr/yYPrXxAJPJkwb7yFdtsTasB3W4t4sKqOQ4sY2
X-Gm-Gg: AYBFou1nzvwSSepJGYeZfwUAqji677NBVxr2N2OlGaPvQIlulhbmB4E/HkRkOnyHKRg
	w7TaPRcXGL6D4LjMV9YxTG0Jm1MLnOdE1NdDxR/FzbM9ari7QyI6TB+z16hPQeM2qRikwvp15dr
	jf8IYD9Sw9ePEAVUmoTH5ks461IfxHDvYA1atXDuCfWHWIxLsfU5Pqn4gIS3G2W7jQ3SJO1izaR
	adJeNx8FSEbVPXvBaO1vHHpTRMI5ALBzM6kLux0JAxTKfg7CQ/ry/Lmal2GI5Lrp2H1MNn9MGQL
	pI5KZCpyX8xea6pny5lBrzGvTvxqjxw8SDXH+jViEfaBJwHF3ICJmh11tLrW8RFmgNTlfvvLn5g
	X4twNLbXnvn7HPfUGAXLK4fQODawdOMCQcEzsYUfZAooFnRCyByoG1Zm4dNt7asdo8j8Oi3E73f
	8jbWGHwoLjFcmy3cMaOc6ARPH+jaTZy1gF1mMzLPJ6xu4UJ7kqW0CZZFDQoSyVZoqwxAUgPIJeB
	jx5ppi3TZXGMNELyeCkmcdygHbAUfUxq9oeTeVOIhMo9wSD8VY+u43iM22klHft7d1POujbYGmw
	/X2/G/g9qJEcbDp1IdJOPQnZo7ZDCvAOjvvoC9VHnWE64b6hsQ==
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr313643615e9.2.1791983221508;
        Wed, 14 Oct 2026 06:07:01 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b3602990sm52779585e9.0.2026.10.14.06.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:07:00 -0700 (PDT)
Message-ID: <8d0e7d1e-086b-413a-87de-20e21f519daa@gmail.com>
Date: Wed, 14 Oct 2026 14:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/13] dma-buf: introduce initial file I/O
 infrastructure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, dm-devel@lists.linux.dev
References: <cover.1791975048.git.asml.silence@gmail.com>
 <49e24334953262e85d5616c9afde88c680e4f3a3.1791975048.git.asml.silence@gmail.com>
 <b461d367-8965-4798-b7ac-cffd4301cd1b@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <b461d367-8965-4798-b7ac-cffd4301cd1b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 13:30, Christian König wrote:
> On 10/14/26 13:01, Pavel Begunkov wrote:
...>> +static void dma_buf_io_kill_map(struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct dma_buf_io_map *map;
>> +
>> +	dma_resv_assert_held(ctx->dmabuf->resv);
>> +
>> +	map = rcu_dereference_protected(ctx->map,
>> +				dma_resv_held(ctx->dmabuf->resv));
>> +	if (!map)
>> +		return;
>> +
>> +	rcu_assign_pointer(ctx->map, NULL);
>> +	percpu_ref_kill(&map->refs);
>> +	/* make sure the map is not visible via ctx->map */
>> +	synchronize_rcu_expedited();
>> +	wait_for_completion(&map->drained);
>> +	dma_buf_io_map_release(map);
>> +}
>> +
>> +int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
>> +			struct sg_table *sgt)
> 
> You somehow forgotten the kerneldoc I asked for here.

Ah yes, missed that function. I'll add it but perhaps in a separate
patch, if you don't mind, depending whether we queue it for 7.4.

> Apart from that still looks good, but I had only time to skim over it.
-- 
Pavel Begunkov

