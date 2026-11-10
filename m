Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333746;
	b=rrott1IIbphbx58IHlIpFQUdCC6HU8pdwE6VgEXS0MoKckiZxEGP1BLE6UMDh77jk59u
	 /4iSZnAShCF2J1g8aMPoYquikMUYn4FZ0HWPey6n7ATEbRVWbkzzf6gQt/Z10P6Rsg2nI
	 9U8NKaleIqVAaZq7UPd8LZyIbJfpU0qYh+dYMvc9PL4eGrb0rI1jnPVzxE0P7nd644pOT
	 tRcipLPrF69codCu+d5Y6k2bA/Oc3LvWvluKiScWvc6fsJb7B6tI2VTDruIyG2YmWUM4T
	 Io93j8VrEzRT5KdMxzgtWhVzWCqdid/MYHuP9s7qD/E9yTZrwulE74VQPtYgeMmy2JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333746;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
	b=rbmFlY0U7KD5ALuwGOfHKclgpx2oQL7B1wtFR8x/bAWiJeurNzTx0oQf3MjOw0x7geKr
	 uKCnK6CYYJCJCdd+Y9KrJTtTtk7yljbD0r6EoiFCl5988RvA5QXWjY6ifDd7/OL+jW9/t
	 A3Bjdo78RcrvEiab8IWoHYkb0gIriGm1Qquq5XJsiFZqxa/fCz9hfhUecI6Mq+9bnWFOw
	 fLClrUBz/iLJHHDNEvDZ+bjPup7YLEOpg6XDaW0ayn13xVrkOoa1esi4bdKH/8X9XeAnW
	 uB7spkZlfod3UCk8BLsheTP0DYkB1TD15hMbNjIkmR62v5zo5gt//fafKK0RwM7C2zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ldc5R0GE;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C2606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661C2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ldc5R0GE
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b179528d56so250915a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333746; x=1794938546;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
        b=TYnQHqYBJSrNTXR0A0aNnr/6SUpg/pPhh8ScvgOmcSqUq3gNsP7KUffK6UJIkctc6U
         ghwR3zof/0KOQcKVZdMjGglxOaVcOmqtXCcqCHhPTjFSKUbOtVDTtR3PEHjBYWA8S6/a
         8I6TKUFDZ0f0m9QsJAA6dBD9yrn+zqq42gV0HpQXH5eyCtTN/xkmZxTlNaqPxI8F9S1o
         KBSlvLpopeG22Yq9ElTqSUfaBf1JBjV55fUM+1lNysn86g8Tv4Cnt7iF3bdj3YDVvh4e
         JBzKEzzu8WhGHi3rnGpwItwV/AMe4q+o2mp+stsBY5rDkZhcME4MKcYD0oIMATbuwOji
         e1nQ==
X-Forwarded-Encrypted: i=1; AL+hErGBWdS83Y1p4ouhPGV9hed2OI3FavjeuiacysrGqdtiKy7CKa2JXQv5E8m7tBiaPoxoueHz9fJUoHqBODg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pgXDFoACL95zdYE4CX9iwD7fFRNoijGTeiRF3sStnSXbp9YCN
	rNvWwkMRgI4X89SwmWW8GSMWgYs38z4vyoWbzufFpKAqQLxi+M63a/QEVrHgmDpS2ujraUG0vhS
	jkwX3Ep74tQTFNfuIxavQ/FeF4nUqrAKq/sdfJwc5HasxQnJaQl1QMd5r7s6yP+jyILCrYBGYBF
	72+19bYNd8jZhCvlQx1ZX5vLtD98Ap/96FI7xS3SXrfetni2jzLxRYj4jszsJy4jsbItk95u5Hc
	VX2lS6xNpdSB2W+axLfMe9O
X-Gm-Gg: AYBFou3C0mSjVO0CQ1+BCOiGantgjHPX3p01oOyWwgO9e5XiQG6ck4KhNIsE9ADmvla
	DX685iB67+dUpUGg2A1EfcsPSwzk/ldhBJSBBNrtfZVxluvm11mvuntORTWl2vPvVJotQCvZsbe
	OEeXjebSPFAHaXBb7HweqtlnslC7IChdoQyZztotuKuQ6telzFqpMatQGbEgqDybOCQUEnusnBU
	ZzUYhqltHIzRftOoX8PE+PGzEMrgUSHTPJipe8TL239oJtsdGj+SWDxOoB6YwNTLtYvUabIaAme
	q4WyrBeSqYX3ucgu4+x8FYiBmyG7PjB5zzTjGMOATdrCBrgzgc+NuehlFQ1CeQrkc/NUxH+IGr1
	/Q+XMZS0XZCNnDuX7y3acuCkjIW1yZX95sS/VegwGySvd1fTiT+f/IiS+TBY8WZMYX5eQmq8nzt
	TjX0RqWtfrRyrQ80qFgnUexack55ZhZvLcLcjWpNlz
X-Received: by 2002:a17:90b:548e:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b166cedcfemr3825013a91.30.1794333739324;
        Tue, 10 Nov 2026 10:02:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdd8d5f6e2bsm51785a12.2.2026.11.10.10.02.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:02:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso1973489a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794333737; x=1794938537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHzP3xDiqkHH4imeAjQs63vhz22eXayGQ9d35KFXeYw=;
        b=Ldc5R0GEkq0Qq44M/w6S5MS5K7XSGkElclmtoGsQIat528WnfMLfrnsjeSpaS6Isj+
         qbdxbBm7Ko5j5xubrtwtaK0biYDkOIhDOZBqBnZpe2AU3TSltw2xiG6otyffaktTcBtR
         mgNTUOkVYXb+1lvYQy9CSCI3A6udd4gMGvsZM=
X-Forwarded-Encrypted: i=1; AL+hErE8LCQioHHQraBm5l9sXB/KQoUu8nUHwJUTkLA6+lqMOi1clzIp89SNg/28Tjo+Es6qR+3ox4hXjjJBOGg=@vger.kernel.org
X-Received: by 2002:a17:90b:4c08:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b166d1def3mr3406915a91.46.1794333737321;
        Tue, 10 Nov 2026 10:02:17 -0800 (PST)
X-Received: by 2002:a17:90b:4c08:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b166d1def3mr3406881a91.46.1794333736749;
        Tue, 10 Nov 2026 10:02:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d0e16sm641838a91.5.2026.11.10.10.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:02:15 -0800 (PST)
Message-ID: <6a244da3-9730-4d0a-a809-441b76e14643@broadcom.com>
Date: Tue, 10 Nov 2026 10:02:13 -0800
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
Subject: Re: [PATCH] usb: gadget: bdc: Fix potential ep0 BD table leak
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Neill Kapron <nkapron@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
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
In-Reply-To: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/10/26 06:32, Guangshuo Li wrote:
> The ep0 BD list is kept across disconnects, and ep0 does not have
> BDC_EP_ENABLED set after allocation. Consequently bdc_free_ep() skips
> its tables before the BD table pool is destroyed.
> 
> Free an allocated ep0 BD list during final endpoint teardown.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 device controller IP BDC")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
