Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010453;
	b=C9iWuPs0mEwyd3ZgbhAOzUT1a1yv0hFC7lq+pFjGJ+4i0Vfcjvj49kbjchFeojwwz6XN
	 Yfl+dp3qDMfd72MI3qUQL33SjewqFbxj64jK2gioQktq2fyo/iYaYyxK3WeoS5gqYbYQy
	 nOgZToB8Gw4ruD3IA4OGvs2Whl8GdejUDVercOH69ob/xkuxI54KbDeKz29mzzWYE0Jdu
	 ClGs7qcbSFXM5LCyey4jlosKdwh9jOGk6O53zLpmiXHINx/jsNfRNb4Kp0mr/be6G7XyZ
	 YJp7bthBCdAsUgJ+y6xJFB/y143bXa1T4IzUCYHvHLpKVS38uEWuHO9yE50KHncwErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010453;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=q/U105SNNRyTR/n+MY44QFx9LoDHyERXeBVNElVmADQ=;
	b=VW3D0yStDvVCHfHgsHQaonyw9MQ6JPKRv5XAeHDqPZRjyCASI0+SB3MIWnVaI6DNFMxx
	 QlXdBXlShgvvAM6Z8Rb3IuJF/C0svAeyRXL+i2Nu5oNHtHkxot6QLgPEefEtL0TT+o11v
	 JqeVgYKjBmE2wRqgCqj9uBSpiRfQtocHfkfLglQohzjJmsv2covsRYDh4ehOAHDTZFaRQ
	 IQ1VN9MDAe1MWWRjxjv1hlZPcMx6MAIWQ6LuSx6NS7A3wUvMzu7e7MTlqQEXnO+YLQQX2
	 PBnMK4Aaon6T+sjAr5S1KN1/gOf9LXrB0YT7bRjzzoC8p1fdP2JvwW5hh8l/iVyHQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cs12vAGB;
	arc=none smtp.remote-ip=209.85.222.98
Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3A606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A3A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Cs12vAGB
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-9908c849564so357733241.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010451; x=1794615251;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q/U105SNNRyTR/n+MY44QFx9LoDHyERXeBVNElVmADQ=;
        b=P1NawBTX8P649VOqJQnsXJFYgkus45wq/D4OjtgJKDkLVqt3dD/Wj6oInskQL9sKyF
         D+xlmzoAGSKtcbSnCzAsIMziJ2aHI7/+EywH8z2ROmMWkZ8BnR3x+hpZpmz0FvJ4LAGW
         KXj4kcoEhODC4qUGWWFU0nu/MUu4uHkY6cxV6Af3rmTWkPvkiwvu5q6RVtPKx6AREM/x
         U21lyMv8jVUI6uvsb2tPRmGxHlZyCMx2MhcQI7XNQMzsQjoLXjZQLhdUzz6lJX5zKS21
         PbX0VeHmKHF8U/Th0r+6konI8/l0J+eYoA0chpIVF9AgJy/4M0osxsfHEUcoZdLwW8S0
         zxKA==
X-Forwarded-Encrypted: i=1; AL+hErE6aARIo6DrKnw6yj4kLVuq/hAb40Q5DPki/QpIkR973RWNs1vgkfWjMbX4crd4WTw3G0ZlzbyaHScjRAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9swzi4Rokrgw3EhfD9DMD0wPQHfssuConOlWIs/8GJW+PaSBe5
	4qYQVVwobWB2HMfkipzEuhH0CDJn3jl5FCq5WfIBppkYy3FCkCIckwFjSBWbG5nxl70ISXldBSs
	tKSQ6iWSD/pKDnMJm9jf8YcAvAhZmWN0lg4KjPqG/G3y9p2N6GvSqZ5MwQAMToXeEeeIljqOy0u
	lXIMahtrGUbNyjTE72FNgtDKui2aFnheAHrKdfFNnt50d5IG22tyM9gHPpuOFq+ydmWP8YiTHsF
	r1zxbcyWFmWyzZ2pOTl5yqN
X-Gm-Gg: AYBFou1E5OvvDbO5pUSqiUkeFsn3CWmpzmy7OR+dum2i81zlr4QOzQvqzbXgrNugH52
	DwHPsqzzgYwv85uop9bbNk6612USpR47mXsPrnlTnJP+08x+Vbo1M4BKNHv3PiUvbtTz2Gxv+pY
	AUb1rjcNuUZGDpDhwweEjIQRbb5B9XS0UkweeMSsvkkMRlJtMh2nzLgC+ntjY0UYkRkdbr/BdYu
	cBdp9rAs5CDBCk39W544aEAMINH5ocUoTiThZRevZThG9L4N6Jt4mCLBKZHPEUStGQzFuNIoeUe
	v6YQ8Ccfeqo4vFyW4aX7dKD4LLD1kbWX5KNRK3DWkHGKgFDhIpSVXatwfe9bnHLRrGreQH7oXH/
	rh+F4rK+lU4sKYQH2Ip/8fCakrfLqnWA7XNhTYEq7gpKTHU6Xc3+G25KxjuhE/h75jaYHSAbNSi
	9381f1xPAFTxznlTjgdeiuDhSh4bd3a1gJixkcN9wy
X-Received: by 2002:a05:6102:f9c:b0:7cc:1045:610 with SMTP id ada2fe7eead31-7d2a1628e78mr1914685137.27.1794010451351;
        Fri, 06 Nov 2026 16:14:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99ba6607a88sm236531241.13.2026.11.06.16.14.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 16:14:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so4131959c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794010449; x=1794615249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/U105SNNRyTR/n+MY44QFx9LoDHyERXeBVNElVmADQ=;
        b=Cs12vAGBXc6AiDJFlfq0P9GGtgmS1GukKeG/FRojDr5OxbPIcEu5oRYXvyOJP5LN4p
         8XCEk0RhNWKQJRrB9RQQJBlThtUJfuoJl3GEkS5c4SSVgtYzq8VMhLmuCfIANk5vGzwd
         Uh0zEMQAt8Pwqo8fBb/donyb1d66rBfk+OwhU=
X-Forwarded-Encrypted: i=1; AKwUvBxrpASa+k4uKCJIk5/QvLCkAKUSty+qbo3OYORGLmKTOXakvoAnCFft/k1vjZ03I8mAyKpv4t13cV3J2V8=@vger.kernel.org
X-Received: by 2002:a05:7023:a86:b0:144:c127:dd1b with SMTP id a92af1059eb24-1b25d36f504mr6534737c88.39.1794010448899;
        Fri, 06 Nov 2026 16:14:08 -0800 (PST)
X-Received: by 2002:a05:7023:a86:b0:144:c127:dd1b with SMTP id a92af1059eb24-1b25d36f504mr6534696c88.39.1794010448086;
        Fri, 06 Nov 2026 16:14:08 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm9201848c88.23.2026.11.06.16.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 16:14:07 -0800 (PST)
Message-ID: <1b33c10e-fa25-427a-92a6-d26669712f09@broadcom.com>
Date: Fri, 6 Nov 2026 16:14:05 -0800
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
Subject: Re: [PATCH net] net: bcmgenet: cap the Tx queue threshold at the ring
 size
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Jason Xing <kerneljasonxing@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106-nb-genet-txq-thld-net-v1-1-53bbac647b71@tipi-net.de>
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
In-Reply-To: <20261106-nb-genet-txq-thld-net-v1-1-53bbac647b71@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/6/2026 6:10 AM, Nicolai Buchwitz wrote:
> A Tx queue stops when MAX_SKB_FRAGS + 1 or fewer descriptors are free and
> wakes once there are more. Queues 1 to 4 hold 32 descriptors, so with
> CONFIG_MAX_SKB_FRAGS at 31 they would need 33 to wake. As a result the
> first packet stops the queue and it stays stopped:
> 
>    eth0: NETDEV WATCHDOG: CPU: 0: transmit queue 3 timed out 2004 ms
>    eth0: NETDEV WATCHDOG: CPU: 1: transmit queue 4 timed out 2004 ms
> 
> On a Raspberry Pi CM4 only queue 0 carried traffic afterwards. The other
> four counted an error on nearly every packet.
> 
> Fix this and cap the threshold at what the ring can free.
> 
> Fixes: 3948b05950fd ("net: introduce a config option to tweak MAX_SKB_FRAGS")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Eventually we will have to decide what to do with those other queues :D
-- 
Florian

