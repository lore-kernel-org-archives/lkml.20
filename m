Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510831;
	b=x+S6tAsBJIhD5iqdpAhDrUOyEvtIvBzYMJSN32q9O2EPoilC2Z+4r6Ou5eIpBCGM0js/
	 nZn1glxgRgn769/2neWn4hxO3JYY0wgio2xpJhqQOTTfDm6NKsKrVdbW7/Nbzu6d3a2vc
	 L/fcvWICTP9SybDNgpTUv5ehHnAVt5RYKUOpfxxuGCMuaQ5nQBYP2OqBo43/CkWLAbphB
	 UwkFWnK2Vw+LdnXo6PqZcdy6paHRYSsUfOA+NO6Rqt4bhwq5twBaU1z3uNBkVoFH0VPEk
	 MH1FLHmsKdhcJJxJB3zjLk1A8gF8//669f+qH0p8uR18oVg2wql3cKXv77O3JELoZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510831;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
	b=YfdMZgaxSY0ihHxJzvt/0eP3J6gjpaN1jFPBal82v4R950Y+tsWjGkG3Qhg81h1aTKgM
	 AT82pJWP9JpUMU4Q3OfcjX1eXdhJM7s30l6kNr0RGKYGVLWTY5+IoQcX4/SEspd1xr2Wp
	 9vMGS9aUcWRcs4BsdAepNe+Xpung41XNRRsXGnn7lvsVr8edkke7OrjWkdy6OZWh8dxIi
	 2gIi7Jg+wpvrxWVBYalU0KF9qWKj3oghPtHNXY0XLwxdUTLxWsOwQwqCrI3eFP5+9UPq1
	 zsFOAfkkXjOIAssPthjkGSzKm9xcLJVE3cu5Ov0MRLRVRe5hcggpjGQYVuM9XST5jGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZX85BI2;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD981606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD981606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IZX85BI2
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso3103629a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510830; x=1793115630;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=BoXvMh+XZXOe3kQvpmQp3St6t9zlTFSz7UNDoJBuERxuJf9UvdkWFqg48U7LIBVsON
         nqWtShFfg1UPqB57ZDD11K0mhYP27sqOmkqEXiXXHQnDOgUpujZEICloNqOx3u5b2Wzh
         b8aIfs9vUapnNdnFaaiQ49MVGCh77u+q1OXcr6BR8NIOPI5zb9FL27uVsG7zGiV9i0CQ
         yS3sIzYOahg9NLj277eYcmHPKcPNDxcFAEp21b5q9htKtz/Xyg3xjCWVlO4/b5auLQMm
         g6t6SbQi7IGq5PLJ9wdtXePJCyZz3ZeggYK1GRNKcQmCYQHchns46vheR/GpWY+sJQJ4
         REZg==
X-Forwarded-Encrypted: i=1; AKwUvBwa22Dl0FnUnem43ka/ytjPf0rV3+lJpxIh75OvtfCx36Ztlf0FC+aOEbBm+uMnjfDoHFdDV4wBbbgsN+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC2yg4oftbeiLm/UAYizyeHUwsTROIgeMZ4NXlTUl6yxghcAXn
	5DQcd9Z4O0LgPOz+aTZ354rgC/GkbHi+4VplWqaFzoch7wHtjj705Br5zwRQwpdXtCt54hNhEim
	zoMS/eZY6WRNzKZY9QbTOOOODQz3md7YzfSSbxlrNyRiDQy+iyCxvvX7gDNME63fTByi+uq2otN
	DdZ7dLvAGwsnaSxO7pLN9s+VCvWuAAaxmvZvOQPysnAdi5bma7rjhkf1PtI9Wg2dKobbgdGVX1H
	J3RyvhkWm7yGQ27iLkFkDD4
X-Gm-Gg: AYBFou3dAbWESGZCLn0aP+99QXcZq0gTXwpUbCLYeO3UifKH6t4T3Yk3JT1pELZnUGZ
	6Ji/cy2HAZgGQ+eMs+3W66KGPoM3rEy6ccne/RDziKfi+sIUZmLPOFWurEZP8QBlsdnNboJLYv4
	tXDa0i1paS2Dq3UuVnhkgfcAiYLtYaL4gIpWLQtnyNzpSvLzFs7rOEk1b+g20QM7xUR2dSA/UH6
	xIaAhnEcKVV+mYBkAm6C1dAfpeI9MTiEka0nXeAJKN2bPKbvxaWteOjXnmyk82RCxg/gs6QcxHo
	/KycEW2nZTWGLN35WuPDyu5JAn4qE15aJuJFs53Z7QMmBXcjS6QI97u+NKqANDn/V+oJvVvqsX2
	SvlsC42hoMV/txBcNPqKsTL61yCogc2uFlyLSICNQIyllY/QNDxNB6jfSRcO4lqACNxGUWEcku1
	jo4pDVLbwmekSguXFcIWmW8tn9aw3FOUaORm5f1imbWxc=
X-Received: by 2002:a17:90b:3d92:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3acef578059mr10943304a91.50.1792510830051;
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad8021164csm75888a91.4.2026.10.20.08.40.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363b06bcb2so80998191cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510829; x=1793115629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=IZX85BI2CjOQVXf3MfJB93CEuOCp6S0brf/Vz4Ot2DhTAnD92sQDmF+XACFN/rv0Vq
         3zrQ4lASuAsEdx9ZrvWilN9ReCudYovzAfEGynw8sVAlVhS0So1Rz7q8lENdLcKNyHtC
         p0uDRWZeSYA0x12ppQwjIn4Y4TcOerm+bp8k0=
X-Forwarded-Encrypted: i=1; AKwUvBzGDJJyNJz6dX33EZ7tTWTUwcNIdbnatsfEiaQtv3yFjVedZWiaaGpf1GGEaPaaImUjfYJ6Lij5glgFODA=@vger.kernel.org
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164536641cf.74.1792510828734;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164535781cf.74.1792510828049;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm81961331cf.14.2026.10.20.08.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:27 -0700 (PDT)
Message-ID: <d31ed7f0-2b4e-46a8-9345-68173710dd0f@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:23 -0700
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
Subject: Re: [PATCH 2/3] clk: bcm2835: register the BCM2711 GISB clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The generator at CM offset 0x1d8 is not in any documentation I could
> find, but the firmware calls it gisb and runs it at 200 MHz off
> PLLD_PER with a 3.75 divider. GISB is the register bus of the STB
> peripherals, and on BCM2711 the GENET MDIO controller clocks its MDC
> from it. mdio-bcm-unimac wants that rate to work out the MDC period.
> 
> Mark it critical. The firmware enables it at boot and nothing in Linux
> owns it, so it must never be gated.
> 
> Checked on a Raspberry Pi CM4 by moving the divider at runtime, the
> MDIO busy time follows it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

> ---
>   drivers/clk/bcm/clk-bcm2835.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 118df86d717c6..bc1de20c7e00e 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -117,6 +117,8 @@
>   #define CM_EMMCDIV		0x1c4
>   #define CM_EMMC2CTL		0x1d0
>   #define CM_EMMC2DIV		0x1d4
> +#define CM_GISBCTL		0x1d8
> +#define CM_GISBDIV		0x1dc

Yes, those names are correct and accurate here.
-- 
Florian
