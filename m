Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206812;
	b=j3Fib+jriWUQauMw9bm/cmT47U1WKSfA+cBdtYALw2knJQyR45SWGZscV4lRebWpI8VT
	 rAKGZ+DTX6bvYqXjxFP07SeDylnNd8/usoqApIxNOcpwn9rRZ2zZ5ndQ4VF5GEsX7NLpb
	 PO2WkOA2CgWKUZIDdPvdl53/lWM44RWppqWhReXnnEXbyH6T7m+iStGVqbGRfkCOwOyA/
	 ZtgK5Kp85sFdHjfqlFFOuDuOgRIrE9TP9IN87qOS9FTXrzQJ3AZ3GE4tbPkMEjDBPcTiy
	 /ninwPPM08huRhQBpiXAg3WMMF/MI8xAVL0/rl/shj0QeHvG4ZLTsa0D19QJvCoemLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=OGZNQpKI2A8LcMcd/MmHbTTOSLlmhVgRy9eyEEKBTEM=;
	b=FdT7yDsgVWo/SgIyWqrzDG4HPsvnGac8YqLSmr4m7lEB9tdkCi3uf06sDFBFxdjgl09A
	 bm1wpv26LV1/qomlXryj+vWDeNWu8ZrKcMQi7X2MeJFzWaSQNIVJhFjKztLIYYtxthL5B
	 A5TeiUoJeRfa9JAupjXNX7M+NnS7JvMnH53X9Mz8u5AFcJ8j3jkV3IhCD+rF+On1KgUij
	 a5rnupUqbZ5sPk6ik+E5AapBK3kod6F5f4G29lCGkU2nwCqGLLJU10pNbYJSGkwdFJkvK
	 YMM8pKaW8+2RwDvEUpRNdbKDpokUETR/bg7nSLV4X93wsRbjLXAf6gXe/EpD4BRyDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TfcCUjAI;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3132B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TfcCUjAI
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-91c791d5460so15160166d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206811; x=1793811611;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OGZNQpKI2A8LcMcd/MmHbTTOSLlmhVgRy9eyEEKBTEM=;
        b=iRGTWwo3zRL6D0L5VpocY0IZBbzwnLDerIcGyqVFSjItu13X6saJ/u5SxI7wqbrX8+
         ZlIQPUSPusRtjpIZNJPgrUfcIVM1zXCO4WOZZJd0mi03JtUUQ5hVkz9Ny/uY9hahuIN7
         yfEoDuumOTQh1VeGggecZ17ui6QZM8tpQyXWeFGHpLEMODC3P6+VZ2q/nKuY4+WRfw78
         bXifmXYydJagE6jQ0VdoGwt1lYiK/2gvvm9XmZFY7fITwD2pT2ClQpM3OZfcSIl3E1hC
         4zYS07iac/u2+GCkP/uwq02vsEWNIU0Z1Zzb6XSh6UljnG2KQApXhjHqJXeJVM2uZhal
         EU4w==
X-Forwarded-Encrypted: i=1; AKwUvBzR4nu7iwDohI3T0r8KTiJ7LAlChuXFYNkWm781C5OY0znuQmzzHUbrogJcUHHJTOStFZdw5z/WoIQBcL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP47tB9CxdOkqSx6xRZMN0MhMPWyXAlHphVMtI9vPd1xxv5pm/
	ob3Gb+bDdpwa42edyU3pIBauVV3hKGKQrTv2MDzDHBHz1g4C36UOjuCXj92mSXDuWb2FrlVgse2
	TyI9OR7r/rlWyKXswZOnhCQGrmJbF3Fge1/kB9xbKZ/KwyjlEHk8xY1jANPU4qSg/BOJvmqFtyv
	Xom8rlNAP/HCQez/2zkoGm5O0ex/0aNgosWvNOyeZ0sk8TejXUf7pbx7dp3V7vpM4IidM0o6joL
	Ba38V9KUADR4D5ZI6fNCeYK
X-Gm-Gg: AYBFou14XzsigHt787ogEiuRK7wG8mqWerjLtX7NroEofxuZbj5FHTM/plhGOrcjiIV
	Kbwf4Y3lmrcE7u+2PLZBaQmSEOjlxUIFm2gCR2lbQq+fqnNcr2EcSUgFQRyDkdV6JSlqo6Qj5aO
	NLNOfo3JdpJEVwrroHKaPZ/kBqS2AA6N4S1XcqR6HgqNnWB05tmgo8cAibR868XXQPnOXAy59LA
	5JSu0Ehinx3xEi8GOyb07zABxDDnz+E+JCESjI1NwPFSqucEYmZe4TPSLNwGocIHbzDiesKwxwb
	x3jFzjukCdTOsb+12yCc87jFfaKvMmOLj0/67Z2tTh3PRTKdRPH1sENBIY50yziUOMCFSvmkyo6
	If9vtFzhAB1zC11tq1l2+pNakh2+DqS8ZeLW1R9IUQCSOJx+eh6NWlZ+Qm6/4RXzN9JnNSjGCx4
	aEn0CiD9mQa3m7DFbGPQ1PZCHRy50kDgyfOvD/VIil
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:4409 with SMTP id af79cd13be357-94408d5bf35mr431932185a.69.1793206811052;
        Wed, 28 Oct 2026 10:00:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f0a75ea7sm180743385a.16.2026.10.28.10.00.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:00:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so209675385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793206810; x=1793811610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGZNQpKI2A8LcMcd/MmHbTTOSLlmhVgRy9eyEEKBTEM=;
        b=TfcCUjAIR/5bnnVkepai46f5D2WVmdYsheavuu6HunEHL5giAty/DbADrIYKnG8H6L
         5Xojlavkxl5T9/h8Qe0C1m5FBNLbG4gxP81N64hJlfV5OXo4OIZlaSzsJOonACzJWRq5
         QwY0iFPzYudgJIlU5xkl5ec3qmfhCR0WcIHhg=
X-Forwarded-Encrypted: i=1; AKwUvBxAjWviZ6lMduqk9+tRYKUN2ZR/1KrmGLtcNzmSPuIpZLvfz8JPXQjZi1nMtFwT33mTkbKzl9j1oylNMyU=@vger.kernel.org
X-Received: by 2002:a05:620a:319a:b0:93f:22af:cce7 with SMTP id af79cd13be357-9440896dc3emr425256185a.12.1793206809847;
        Wed, 28 Oct 2026 10:00:09 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:93f:22af:cce7 with SMTP id af79cd13be357-9440896dc3emr425249085a.12.1793206809376;
        Wed, 28 Oct 2026 10:00:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f066a5bcsm1307476485a.13.2026.10.28.10.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:00:08 -0700 (PDT)
Message-ID: <725c51ed-6e7f-44cf-b5e1-73fc39623fc3@broadcom.com>
Date: Wed, 28 Oct 2026 10:00:05 -0700
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
Subject: Re: [PATCH net v2] net: bgmac: fix oversized RX frame check
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261028011035.49201-1-rosenp@gmail.com>
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
In-Reply-To: <20261028011035.49201-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/27/26 18:10, Rosen Penev wrote:
> While reviewing commit 77dac783f11
> ("net: bgmac: rate limit RX error messages") , Florian spotted that the RX
> length sanity check compares the length reported in the RX header against
> BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
> space reserved for struct skb_shared_info. The data area handed to the
> hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> BGMAC_RX_FRAME_OFFSET bytes into it, so a valid frame is at most
> BGMAC_RX_MAX_FRAME_SIZE bytes long.
> 
> A corrupted length between those two limits passes the check, and the
> following skb_put() runs past the skb tailroom and calls
> skb_over_panic() instead of dropping the frame.
> 
> Compare against BGMAC_RX_MAX_FRAME_SIZE instead.
> 
> Only compile tested. Not tested on hardware.
> 
> Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
