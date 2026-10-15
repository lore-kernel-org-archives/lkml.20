Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901651FCCF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067857; cv=none; b=pdRT4mIxpDDORcMAryP7l378rckRtJgW9Zql+aw1HxsEUIi4LLa+4/pRVsOxywJd+eU7wRkqF0BTZf3lck+DR+RSfpi2crlASy8+kJdESqFGxBYBiZEdEcjbtt3JUPJBBqa2eaHpWRn6Q7hLBtmUPsBlU1Rq6wkfteiHmi8aDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067857; c=relaxed/simple;
	bh=O80fad6ng26h+MCNVSCP0toYDmDIXGSh//fKI+vSOik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGuAMfwh7bB8Zvn8F8Os4o0hyaqRgxBWSj1fbYY9b5TP4l6a5NX0M/w4BgpzgNSUm55a9QAD6NI6MjxnnMNLJFcmnwyS6WXaQWRf3twVV/hjd4D4F+x9h5y8A6nvmREPGXWD5MoJWqlRQZiyZOXYajuICSC0FtwZICeGCDwH2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYraOy5I; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYraOy5I"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4341d61fso572418f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792067854; x=1792672654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hef51/0HYXZuEH04TGUvZw23bNJHS5JVanT3XxQDiQk=;
        b=BYraOy5IJAxY+G/4/7L+9soEbkhpbgeHrZoMM9U2dVFUm+ya0Idyws1h6dCJVnBqRy
         twQKHT5QNGwrvskvPDiwuJOr70sJOyixwB5ieyFZHpw9fh4fsA4Baba3YaTe1O7PXOvl
         VM8zLOvufV278M/qeOc74mac76oMJVIFUStHizEFciH36EmJf3ED/G9tYdg0ZiTiAJG7
         V44MdiEaMymuQG+zwFSvtEuFwGTbjwP6rdFRpJBVDqSR/wARZPbOohuf+IjtX+2EVf8u
         kAgG0/TEbUsw92Fx2ZYUbwfwJXoXOi6d09CXsCU49irLcEa88KlulhKEojlTMOJ26DOo
         V+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067854; x=1792672654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hef51/0HYXZuEH04TGUvZw23bNJHS5JVanT3XxQDiQk=;
        b=bmykf6nreAQcOUsv+eSjgXlQHKdRwJy5HSOaLIdvr2pKlsQDXUobUwtUgWXWbRwdXM
         zEN91/O1xQtNCAZ/GkD7xcBT4OCS5xRi5E3lTLNF4+vnMTZB1+YHGOxpNRL0RDIXnV4H
         nnBheijRWiZ7hhbazkMx/WAXZXWsl01dCRatQ/A+P/LwKcQVgqqyrZobzdN7BX3LVADk
         uqvRBuUzyNQq03RmGHSQ7tznuO+t8XK+aKwC8oDDf+us8pgoqkOki7Ch9t+YWE1eyHwT
         pDKxEQlTuE8JGmqyO4HvoYBdqj5h/PvUG8QLeCZEBCiHEWL0mn51+CwkDTLuzm2ek+BC
         DVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF/coRyyPY755qz7CYJZ6xixTGWq4EtNHK1pfK7N9Bpb3iBegS3zZr8jo+9WZ9tLlVbObeGD5pZc+V4yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkQkwoJQa1GsBMtqnBk++hOjRn6fhTrKGjUxpddac1heVVaVh6
	2KAKQfGSvg1z3snUSg9E1/q8OrZC5i6zzKiRZs4vLBTc5pazaOIhJJs1
X-Gm-Gg: AYBFou3eGRHj9O8/wqhlZJ0OCeVJmeKlRwZlK1uP5aJxF3LWItabaC/eqds+JSy3xzN
	9KYkFTk0pq7cfeS1rWomLr/N1GWlw2ROXyRjlae6FUOQqPDOR5g7x/LPqhaUQSWrGH/qNy4tsa8
	59XEPY1ARfqHNECuaJpk/LUoHEFWFcAxV3Dmdyeu7Rkybs6sUIjRMbl5eFiJDvO+i2chcofGxmQ
	yU7QrRJh+5ze/uXMC8NDVYzlSYOEkbdvdXtwceqtESmzZzoUQxsW4GDUEMz7tMsXLSKQoKEBSf1
	8PlIo3cdO0CjSA8KsYR7WkPjmVuZVPI4DE6VSDrVHPuUhcxo2ini6hXPTYFbmVqSKxN93ympftL
	0KdID10a7EWpJB2OYXUvMWuqFDzprdVV3lVTPpGW1wQIpq7fxLE2/su7o1jb9/G96KuSDhC468i
	X9VL2jFDkqBAAHA6+iEwUMFntVADDNQlLWCbIHonB95GXWcw+27ayXbewKR475NXtEqxp7elLiR
	Ys5RGrSGc7d5iEai0grvhYCh7rrYSiDt5VsSNV8uMhOGmrdi6Q=
X-Received: by 2002:a05:6000:29c6:b0:488:85c9:120b with SMTP id ffacd0b85a97d-48dbaae251fmr25056055f8f.3.1792067853958;
        Thu, 15 Oct 2026 05:37:33 -0700 (PDT)
Received: from [128.93.83.149] (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967a0dsm18293971f8f.3.2026.10.15.05.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:37:33 -0700 (PDT)
Message-ID: <69babd27-4f50-4637-9c00-e9d3efc76e0f@gmail.com>
Date: Thu, 15 Oct 2026 14:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] drivers: net: xgene: Fix dma_unmap_single() size
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261014084817.41805-2-fourier.thomas@gmail.com>
 <20261014200253.boklssmfbnwairjy@DEN-DL-M70577.microsemi.net>
Content-Language: en-US
From: Thomas Fourier <fourier.thomas@gmail.com>
In-Reply-To: <20261014200253.boklssmfbnwairjy@DEN-DL-M70577.microsemi.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,
> Hi Thomas,
> 
>> In xgene_enet_refill_pagepool(), the skb->data is dma-mapped with length
> 
> To me, it looks like the mapping happens in xgene_enet_refill_bufpool() and not
> xgene_enet_refill_pagepool().>
>> len which is set to XGENE_ENET_STD_MTU which equals 1536. However, in
>> xgene_enet_delete_bufpool(), the same buffer is unmapped with length
>> XGENE_ENET_MAX_MTU which is 9600. This may erroneously unmap other
>> DMA buffers or cause other issues.
>>
>> Change unmap length to XGENE_ENET_STD_MTU.
>>
>> Fixes: 6e434627bce2 ("drivers: net: xgene: fix: Add dma_unmap_single")
> 
> That commit mapped and unmapped with XGENE_ENET_MAX_MTU. At that point, there
> was no mismatch. I think the mismatch came with:
> 
> Fixes: a9380b0f7be8 ("drivers: net: xgene: Add support for Jumbo frame")
> 
>> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
>> ---
>>   drivers/net/ethernet/apm/xgene/xgene_enet_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
>> index 507db46daf2b..2ddcbf27014e 100644
>> --- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
>> +++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
>> @@ -185,7 +185,7 @@ static void xgene_enet_delete_bufpool(struct xgene_enet_desc_ring *buf_pool)
>>   
>>   			raw_desc = &buf_pool->raw_desc16[i];
>>   			dma_addr = GET_VAL(DATAADDR, le64_to_cpu(raw_desc->m1));
>> -			dma_unmap_single(dev, dma_addr, XGENE_ENET_MAX_MTU,
>> +			dma_unmap_single(dev, dma_addr, XGENE_ENET_STD_MTU,
>>   					 DMA_FROM_DEVICE);
>>   		}
>>   	}
>> -- 
>> 2.53.0
>>
> 
> /Daniel

Thank you for your comments, I agree with both, I am submitting a v2.
Best,
Thomas
