Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F85172FF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753149; cv=none; b=JippNXJ71yHnqto7b1qBu5QCGgQ13sNSU2lnfD8PzuwHRNmON/D8dd6qMef+vxXLW0xxUyNZq1t3Ug2CB34Y7dwW29EKNntwlbAfNaFazB4WUxhwJH5b84DDtXxauF4c8fea9AZfL2ayWUWNt/pge5A5jv/G+oD0DVzfakHmHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753149; c=relaxed/simple;
	bh=b68SMbhqEPsGIKJhflr4X1Z6aga2qlXGVURaZgut1Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWvcJx+n52j3Una+1LfUWJbHYDIVydjjPioFXD7dIE0paUEkp8CnStPNSI7vk7ge9jKVozLUHJt9VG6Q4idfghCMutLo/hSB0V9jKCeaf8q0XRv3Jg0mg5aPab1aGg+DEVAyhHyOezI3Rhj2uifkUeij1yiLSNtK/iA0FjbULAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Lh9gX65v; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Lh9gX65v"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-79b223424cfso239518137.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753146; x=1790357946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sncqGjwoZ2ISwzGsUBmcxEN97dqN/iEU1rIWLc2X1fQ=;
        b=wZjFZUcTBFoYiHQvPuICP4Xkpbx6rWg6nY3QiQ1vZFh2h43Se5dFpk3SsAMelAsjX3
         EGZhR2XZbwAe1OR0FLRziy5J/OZl7ICcf5zcyaTS0zzbRnU+SIByDYuBZ4esxrLRYbDD
         ztforHJo5Izml6pCPBMmczhsez2vuAzBGyCZDpqwBh6BmAsM8rKlM1dTb+cYTKiSPH3r
         zfScIeA6jMb9IWtAAu7V24CfB4sCmAMZZLUY7LVvbC+gucTkryjOQV3ozmwV0yz7rWEV
         mJAh23V/14fJMU5kwV/myW+m/sZFDZyWhZetNurj6FYf7OoHXUedb1h65JWWX9kyJf6J
         YLjw==
X-Forwarded-Encrypted: i=1; AKwUvBx0vHrrYEissQWNboxy+DcIUxsZ9ykoth3vYOHGAlnQmiJZgXRiM/ByS0VqzO9sCXae1ygHvK1cQuJsf0s=@vger.kernel.org
X-Gm-Message-State: AFuF++nKQoIDJ71EzDzMrtAsqxt62y0P4gyKP3sB0P6L2wPdejOR+rXu
	a+Qp4oSJcSJP7sXGPrI9lVz9p9YqNJhr3+R+ESACA1UuuBwJ6YiAONyoDsRIvlvHaIISHqR3F7x
	QZF7zipL0KSwjxwHcT71b/l2H3mDnWw5IfkwsPTH1BpYQLXTmLgdM/1ShWqpKpUJNEtPCLBnEnZ
	CwJNR9mOfx7eOOeW5hfSXqIntYGGaJJa3/c7Ch19+LQ4snx1/xS+Vpvyq5m5EWXEYBDKv+ISAOF
	/Z9cyYaxU0zlglask8IB/pw
X-Gm-Gg: AYBFou2OcoPQZxRP6rTmNnQ1082o4wzk3KfQtOZJFFk4braVhpU5vwlnoJSX/e+Uu+g
	470kvwzoZ66brqXPNeL+TluCKfjigp0cAz1bL0YBHT48HvxmOMABAZTrOGRWtET9NSKSpl3/R7B
	a8Iz7+58ndSUscnzLo7qUqzpmU7lgKWzA/rsUibzi5tlUsEKIPivRlzACI2K7S0+IZJqY7ggM4s
	YJVN2b8QwBpS0s3W592PXE9n2TGAKHS2P4I87eXGfmynajZ/Jyvc14ObWu+JNkmQereN7y2dPfR
	jiQ8tjhbCY4qSFPpphSj5xaT/YsuJxPc+46aaLXaEfM14frQVfn2wQBV4lyHsetlw8olAysRMxH
	Af2f86OJaNDfbQQf1Z7HY8PTOdA0rt/cixRrZxv9+afjBgiyp3OChV24BOmliausJwbTnUXr/xH
	+EI70RyQQK2y7iImej11zjNLX0WNjbUM6ZJqewGVDq
X-Received: by 2002:a05:6102:3f06:b0:7a2:1f78:c6fc with SMTP id ada2fe7eead31-7a55c88b9f5mr1882615137.14.1789753146070;
        Fri, 18 Sep 2026 10:39:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-984d52ead79sm15677241.5.2026.09.18.10.39.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:39:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f5e827c6so21666011cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789753145; x=1790357945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sncqGjwoZ2ISwzGsUBmcxEN97dqN/iEU1rIWLc2X1fQ=;
        b=Lh9gX65v2zTZJb3HEeTyPjzCBcBOhuiz3FJVHcI8y3i6w70vdhMaCb36UJ4GaIS+YU
         X2ISn0xntpQ58ia9onwMl7a8FcEKB6XCLOEw48sxdq/NFSHYtfg+sFGOOgQR8lmdFm5I
         Qbqrm0WN+2v8b3c2/GcNcu1i0ot48PASqwElY=
X-Forwarded-Encrypted: i=1; AKwUvBy+bWyLKxYWTd3z7r5yoG9jWkLMrZcZ3RZStNS/c6D8YUl5csYKOR7KuvhnWQzFtEmXsvY0VoZCJKVvZTg=@vger.kernel.org
X-Received: by 2002:a05:622a:30a:b0:532:84d3:ac7 with SMTP id d75a77b69052e-5329e47ff64mr57465831cf.41.1789753145332;
        Fri, 18 Sep 2026 10:39:05 -0700 (PDT)
X-Received: by 2002:a05:622a:30a:b0:532:84d3:ac7 with SMTP id d75a77b69052e-5329e47ff64mr57465261cf.41.1789753144786;
        Fri, 18 Sep 2026 10:39:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae76d5a7sm1954151cf.27.2026.09.18.10.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:39:04 -0700 (PDT)
Message-ID: <06a2be46-7ea1-4ffd-a6d7-95ae4d94ca84@broadcom.com>
Date: Fri, 18 Sep 2026 10:39:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/8] net: bcmgenet: clean up RX NAPI on
 bcmgenet_init_rx_queues failure
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Cursor <cursoragent@cursor.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20260918000732.276506-1-florian.fainelli@broadcom.com>
 <20260918000732.276506-5-florian.fainelli@broadcom.com>
 <d8b67a2402ec38f7cb374c5b223afb81@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <d8b67a2402ec38f7cb374c5b223afb81@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/18/26 03:43, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 18.9.2026 02:07, Florian Fainelli wrote:
>> bcmgenet_init_rx_ring() registers a NAPI instance for each RX ring via
>> netif_napi_add(). If bcmgenet_init_rx_queues() fails while initializing
>> subsequent rings, bcmgenet_init_dma() frees the RX buffers and page pools
>> but fails to clean up already registered NAPI instances with
>> bcmgenet_fini_rx_napi(). This leaves stale NAPI structs on the net_device
>> napi_list.
>>
>> Call bcmgenet_fini_rx_napi() in the error handling path of
>> bcmgenet_init_dma() when bcmgenet_init_rx_queues() fails.
>>
>> Fixes: 1c1008c793fa ("net: bcmgenet: add main driver file")
>> Assisted-by: LLM
>> Co-authored-by: Cursor <cursoragent@cursor.com>
>> Change-Id: I45982e0e198a44f3f56b1300f462870462b81108
>> ---
>>  drivers/net/ethernet/broadcom/genet/bcmgenet.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/ 
>> net/ethernet/broadcom/genet/bcmgenet.c
>> index bfb74dca55d6..ef155a170fa6 100644
>> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
>> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
>> @@ -3167,6 +3167,7 @@ static int bcmgenet_init_dma(struct 
>> bcmgenet_priv *priv, bool flush_rx)
>>      ret = bcmgenet_init_rx_queues(priv->dev);
>>      if (ret) {
>>          netdev_err(priv->dev, "failed to initialize Rx queues\n");
>> +        bcmgenet_fini_rx_napi(priv);
> 
> 
> napi->dev is still NULL here, bcmgenet_init_rx_ring() only fails before
> netif_napi_add().  netif_napi_del() does netdev_lock(napi->dev), so this
> oopses on -ENOMEM at first open.
> 
> rx_queues is 0 in all hw_params anyway, so there is nothing to clean up.
> Drop this one?

Yes, that's a good point, thanks!
-- 
Florian
