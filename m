Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009767;
	b=PohaiCANvVZs1kOJ08l18Wtqrj8Kq1vhSi/uKW5uDl9q3db3cEM9MpA7t+/nVSJeSLtI
	 6gtd03XPlaz7AOau0HdSX7e8zsPuAry/EWx4eVK3GE0TDAZmp3OMyLYg/4VexIU4jyKJ+
	 68pocbWPBzNJH5hxOcqIGjC7eVnb/NXxuaL7/S5kg1SLfjVYdtb3RnZnMX/SmMKFkDigp
	 jrvOTrYB1OadELBcXpZW4SQeL6KFFy7bbvq6jO7ZzyVxUiJGOleHIhSQ9QytAoVLnGWup
	 qT0HGanF7o9ItAp1qzTUJ8z6uofmT5Gbydff6Ea/wcWEwk1vtnApMudd7eRZoEcPGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009767;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=2bbBoX07yT8rTJCrVM6gY2O9OIdKlfJo8J6sej1aUio=;
	b=otDa6bd5UbUub8y+g0cYYif6wVja6swvPQXoHV8mGi9uYjDHUnV/0x2YDAC0O3n0FY+a
	 BaMozNCarNfdJKbLHF4u97Pfpp5zTNsQuSbQMLazuM6wkm7olRueEgWkg8dfb1L5VpPyn
	 H3JDJzHgV+d3sY8dWZZz+4/6SjB6bgVMXMihTxZrVoNAg4z7Zz2bmMcvRGu8CBHujgWHB
	 p7ZHXssGUEaKQVN6hwvi6VTp0M5SXsDPvZUcFZdKyuSHz8uuRH5svnGElDTndhZo394jv
	 xAv0SpU61etQvR8QKZCER80d0C8zJ2fDE5O8ZN32yxqqvz+GOHDItiYELhKvJlPwCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hPD79lUw;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114F606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5114F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hPD79lUw
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so710428a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009766; x=1794614566;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2bbBoX07yT8rTJCrVM6gY2O9OIdKlfJo8J6sej1aUio=;
        b=HKcA5BgXO3F7dUyRMXE2SVoKQqsd+x1/K2UOZcbmaHia5y+sxb04hlc1kdwPzKjYFu
         SiQf18nwdBF7xMwWn1yDwN20i4MGdPPKP0rD5QvRt3SZwkwL6hBYlh0ON6QOvSUHa2mO
         O7cpregU+oTqqq6xdT7SwYh05i8auMQRbg4zKwvXbGdHv+ZSRD7ytRHMGli/jtbAgN49
         vsmIyK2dUk/MoKN8qDI5F1SxIrUniVUriS0n+s427rGhvmpFAmkic1Gkg71/fFV7/T1g
         kglaf/+GnJvCP85BcPQ1R2k2zCxgKx1nQYalH8jF/xVe/e6usQEKFkC0J7VWGsj0jbOi
         RXRQ==
X-Forwarded-Encrypted: i=1; AL+hErE5/kHKaP+4DcCbX4Z/jo3tah6G2B/mAH/OXrkuzD6XJDnTO7pn+0HOdUEAVtBQX/Mc6M7+NYM9h/jKdUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PUOGplaA1j/v3EL+DT2NN/gtOJGnb1dHzKRJ+6QchHWnsAprg
	fMnNLc89zN0TSjEj5Mo90jEmwkgT0teuq7lybJBfsBbNnD9NmKhkcgqQViUsE12KOPrTHIPPd7L
	v8coekQR2f+lrWUJXwXG4sAeS4TqFgCt2fFfe6/XuCfHCuOv/mRYN3VcXLJ40yz9D5zRTj02zgN
	5rCP6TQYu83ldvM1OQ5qflapJczYum18eyjEDaMXTWCFQtXXHL4ak78If4SCb0tz9e5Ztcp1qAm
	hdGJMD88eU6znq3Ep9FtBtp
X-Gm-Gg: AYBFou3W/fxoS6JdAv9XZ0RK+vM7oZ2qLtHDlWwuKjlm1hpzjmD56ynMEjXDeewMvXv
	yMdyG7z3/Q8hPqvSQ1cj3f7RQEJe1dHqKIa8GXjfpTlu5nbPQtYOF9PHpz/IxPcHGQWK36qQWAK
	wSLLxaMXDyXJDJrQBI6ZIUzdln1d8C4D0Qw/NmW4IgPZpdldh9hpH415orH3TKnZi8jzq5ZPLja
	Tk/4pu3muh+Liu5Vih0gwylZ1ElKLDshqdMYGkWE3Rya4NXpXLQqPt0q3fHdNbQp6McltDiUBnl
	V+uwATX6wPg/ntaE93q/VnxeuHZ9d3/c4iz6ICmRRU3MH5HwV43kPZYirTS0DTUwBQk2z2VGb8i
	Tmw+QwjgvAAGHKw3oqrgC6U1IkZ8c6ACbFFa8jqmBroXPT4VV4HMesHcFP63pDXPpzJlBxhVF5+
	8/C5H1BSOjJpZSqazCzYHwCmRdOwnim05fTgZfG56F
X-Received: by 2002:a17:90b:380d:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b0db6d6097mr4266856a91.41.1794009766289;
        Fri, 06 Nov 2026 16:02:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1034374a6sm250857a91.3.2026.11.06.16.02.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 16:02:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4048041c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794009763; x=1794614563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bbBoX07yT8rTJCrVM6gY2O9OIdKlfJo8J6sej1aUio=;
        b=hPD79lUw4v6ULgu1GePpYDYS3SwpS4ESWWX/lNyD8XyfQXgYpr2pzjD6bcLv0XH1x3
         wjqigfn+uBNdODYsSqa6Nt023XTpGbOqmGYVhFeeCk0j7hxQ6fAIxgduBKGDC47MnZWc
         uzAyZz/1M6GCHTR5CAo83k8e4N2z382FdYGkw=
X-Forwarded-Encrypted: i=1; AKwUvBwIgSmXpGDT0/DM2FcGjRGLQN9gxPkOLjKmYh8wRXaml+0YDCcfjDiqwFxTBCqbfiGXY9ZKvbQOQ2rtF1w=@vger.kernel.org
X-Received: by 2002:a05:701b:2512:b0:150:c9c5:1ca1 with SMTP id a92af1059eb24-1b25d318407mr5084592c88.18.1794009763185;
        Fri, 06 Nov 2026 16:02:43 -0800 (PST)
X-Received: by 2002:a05:701b:2512:b0:150:c9c5:1ca1 with SMTP id a92af1059eb24-1b25d318407mr5084543c88.18.1794009762313;
        Fri, 06 Nov 2026 16:02:42 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm8119785c88.8.2026.11.06.16.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 16:02:41 -0800 (PST)
Message-ID: <0897e70e-3a7b-4f1b-81cc-98b4bde1dff4@broadcom.com>
Date: Fri, 6 Nov 2026 16:02:40 -0800
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
Subject: Re: [PATCH net-next] net: bgmac: stop advertising TX checksum offload
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, open list <linux-kernel@vger.kernel.org>
References: <20261102215806.13723-1-rosenp@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20261102215806.13723-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/2/2026 1:58 PM, Rosen Penev wrote:
> The driver advertises NETIF_F_IP_CSUM and NETIF_F_IPV6_CSUM, but
> bgmac_dma_tx_add() calls skb_checksum_help() on every CHECKSUM_PARTIAL
> skb, so the checksum is always computed in software anyway. The return
> value is ignored too, so if skb_checksum_help() fails the frame is sent
> with a bad checksum.
> 
> Remove the feature flags and the fallback. The stack then computes the
> checksum before handing the skb to the driver.
> 
> Tested on an ASUS RT-N16.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

There is no transmit checksum offload through the DMA descriptors, it 
can only be done through FA/FA+ which is not supported yet (working on 
that).
-- 
Florian

