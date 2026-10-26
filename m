Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039693;
	b=denM1leSAYoLAqt4hKxMGN7+vfTOxBgl4A1GIGWa2hhY9fK1Hsihdq4LiphGOjrpI2w1
	 p4tSy7d4fSd3uwA0OmcnKn7Y7eIvmdoYNN1SofIdr6TUcdjinvgPunYDkNOAtaOsIsc4Q
	 F+r3RM7/h3KBBqgpE0lIjh94dcl2MAk3ptAuAotLR2+Qe0dCICBgVolBYkTaZSz4ElR/q
	 STQfnrh/QnFoE+Lc30Q+YpE2JoCn3n2nxBuV05+T9QuTInwQ9Q/mvhvMySXEAx8Cc4mGB
	 c/DVnwDIzGkW8Vk9WqtGkXrDS8tFADnKVMy6iiUU87K+M1Zq3r8FCRB5j+BvmSdvZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039693;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=dRw8LpiQcAPkVI8lNgkCIMe+p5IntnocuWacHPuFlko=;
	b=k9tC9Vw+tXKw1uscfp0osimyl+Doxc0vcKw3esRrQHSLy/OgbuYkrdWKGurniCGUBICD
	 WW6foGfbbc2fp2mHQPtOEuXWYoOJ99ba52+pjlkm8+qUhed5r3GMmfOwHF/aoTdNNsbcc
	 lvg6W8Li0cR0V2vLn1unQiM9kbE6OL3hvPksbQEIoCNYbpLFs8wBPe95/9sWepxvcaNa2
	 EfaGpB2Cw76yXKW0K354u0SPfuS6SRd1wZGAApFF1Jfee34K7UPfDrpT5VzT8xrourd2+
	 zzFTLzufzB/KgxP+VLDl6qOmc84Vq4GDT7CHSxtIRUoPNA9UwYzeaTl/sBLeOQx50NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hXLQSWTD;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E6E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hXLQSWTD
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1731438a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039692; x=1793644492;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dRw8LpiQcAPkVI8lNgkCIMe+p5IntnocuWacHPuFlko=;
        b=CaNT9/821SB2x3JGotAnxakrNBjZ9n0UK0vULIKIrThyroKaDmDuL4pWkXIxpyX8HS
         +plBZKXxheLarqrZb8R2HtaOGULOsZGXDXpvpbde5wmcwPPaYLiiZM8Oy7qGbHTwOdbT
         mC7pBrUQ1wVApE5VA20U1w4f1R/lJxBjLtEvswiVmt9ZLVkDEH9PK5dllB/LlOVHVjwM
         r7bz8LexeWl3bK5TvE0Iw/jPw08sBZt/vT2jLrhoo0H4GcSJJOwWb1xH+l9WE9a74Uh0
         VYK6uz2nP7yq28bIFPKonfo3f1YKERRO7OHLA/qevwHEzumEMxNz+CnUpvGGOLCTJplr
         A8Dg==
X-Forwarded-Encrypted: i=1; AKwUvBw38ssexyEbKfVmkshwGJ+fLOlhL0S/6brckpRGYnb1K2krzKmpBjJdWIxvP6a34qBxkzFrE9m9JHPIG14=@vger.kernel.org
X-Gm-Message-State: AFq9FYKugLAQTWMlyvkThFLOrmmABRt1KlFPqNBPYEKHXb8dEAjNaow4
	qsoKIm2m+BGYd2dYnrX2b9iGawc7plmpjJH8Kz9hCo1YpVqYpWtnUeQonnexftKE5PXxh+9Wxm3
	yyYL21g1YCz2PxW38SWnNZ5aCFhESgtV7ivaalYPakLX9zuILHDawscZKxOcDh93qYHQ3V2x2H6
	lHhf7YHjyppNVpqISgoRUBWlrjTrOOeyiLUciLiChzUdLjZVRO1gFZ779M1jI7oS14s9IFiwEMb
	x/mAuzfyrdYZwGbdzc7pvRlWbs=
X-Gm-Gg: AYBFou0lOWpjTa1QYyegEnpbbTCR9QbpQwfxbbgLGzfaCVhcS6h/NmGCY6q5xL9OJ+d
	l78YKS1HPSKIaiqIqPcxhBl4jt1OEe15yy+kYS531/0cFlBmOn1RxgdOamz8rL0UWba83ZAp6Ur
	QuB8XeA2NyLhX9mkPIoecdrDkAvQwEQRjxZWwNfOWrWWA6QFRCQA+OUGWfOBpBSUssZoCydRYPo
	X7lM5v5oi3zrtPgNb6+EyOLB+jZ9EBkF5zwfpBQcALqnO/oXnFHgUOSUKmRootJYbCieP3Y7dtk
	nNhb7N+LtbVd1z9OxMpKrTZDssZ1l4ZAgInsDoBu1KysmGnL78pNZfC069bOKl4ipwYikoI2Yvu
	2z7mgDzH51e3fqunt6ZlChIE9FzLrNJr5hIzZBVr5wrsP2b2X/4nLIxkaTPHtljHr4Et/Ixakva
	xdb8rkck19QvU9PjSR+w63EkLC9Z2cnmDuAsdzghn/
X-Received: by 2002:a17:90b:564e:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3adeb13970dmr6169482a91.56.1793039691887;
        Mon, 26 Oct 2026 11:34:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeba45ee7sm3133060a91.1.2026.10.26.11.34.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:34:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3addd73e66bso2195454a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039690; x=1793644490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRw8LpiQcAPkVI8lNgkCIMe+p5IntnocuWacHPuFlko=;
        b=hXLQSWTD7Jr0K1XovDHxrzPul/M6iOov+3jez6TkK3Jc8grFRY0yze2xhMsSyfdcMR
         Bntw7SMq0GSs6zw0b8ATS1021BVL1CduXuBCK8Kx9TmANGqIwMRJ5O1yvb8WcAgnBZdc
         LAUqmxgdDBDXRZHNj5SXSXTxPksuyoeV1Q4ds=
X-Forwarded-Encrypted: i=1; AKwUvBwcVJMX/vZjC39BcV32H4UcMs9euloPUAzdLIWangFFZAErWYq/y13vS0vatLgFYL/QeafLHN80FDnCcTs=@vger.kernel.org
X-Received: by 2002:a17:90a:ec8e:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3adeb0fb5fbmr5796922a91.41.1793039689903;
        Mon, 26 Oct 2026 11:34:49 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8e:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3adeb0fb5fbmr5796899a91.41.1793039689475;
        Mon, 26 Oct 2026 11:34:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427782sm516108a91.4.2026.10.26.11.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:34:42 -0700 (PDT)
Message-ID: <47511aa5-3032-4bd1-bf8d-bcb1a2280367@broadcom.com>
Date: Mon, 26 Oct 2026 11:34:36 -0700
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
Subject: Re: [PATCH net v2 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps
 mode
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
 <20261022211104.2091128-3-florian.fainelli@broadcom.com>
 <CAOiHx=nXKnzqB+-BvYg7rgxpLq9p2JP2xk8JchK-3+fqzpG7nw@mail.gmail.com>
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
In-Reply-To: <CAOiHx=nXKnzqB+-BvYg7rgxpLq9p2JP2xk8JchK-3+fqzpG7nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 11:31, Jonas Gorski wrote:
> Hi,
> 
> On Thu, Oct 22, 2026 at 11:11 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> The Northstar Plus IMP port uses the switch's proprietary 2 Gbps mode for
>> its internal link to the AMAC.  Its fixed-link description reports 1 Gbps,
>> so applying that speed clears PORT_OVERRIDE_SPEED_2000M and leaves the two
>> ends of the internal link configured at different speeds.
> 
> Sounds like the devicetrees are wrong. Shouldn't that fixed-link
> description be updated to be 2 Gbps then? ;p

That's a fair ask, however that would require introducing 2Gbits/sec all 
over the place, and it's not like we really have a good way to report 
that even through emulated PHY registers. This would not be a bug fix 
however, which this patch set is targeting.

> 
>> Force the 2 Gbps mode and flow control for BCM5301x and NSP CPU ports.  The
>> mismatch caused switch output queue discards on both copper and SerDes
>> ports, with one discard for every TCP retransmission.  With both ends
>> restored to their high-speed modes, iperf3 reports no retransmissions.
>>
>> Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/net/dsa/b53/b53_common.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 0880310c9ce3..1f4964c28fc5 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1663,9 +1663,13 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
>>          }
>>
>>          if (mode == MLO_AN_FIXED) {
>> -               /* Force flow control on BCM5301x's CPU port */
>> -               if (is5301x(dev) && dsa_is_cpu_port(ds, port))
>> -                       tx_pause = rx_pause = true;
>> +               /* Force flow control on BCM5301x and NSP CPU ports */
> 
> The comment is now outdated, and is missing the forced 2G mode.

Ack.
-- 
Florian
