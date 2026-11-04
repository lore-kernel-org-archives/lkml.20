Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816118;
	b=fv7sZfUjij6Iy7GWBaU5QlH8hiK/ZRlPL2cxzwYuY0zSXck8jPbyuSQvdXJiPIGLqD4O
	 7l+SF41BdKpOTnIXaaQev8g2uO6JV26ROLr9G30RoAIztJxmRPVtDqbd92dpgB1a25b5b
	 DGOTunjjpcCYjX9fNNrVYFYH3DwUCcdu3Y+v4ZYYs9ssgFkaPdYpvzezzTCFkkcUZCMIB
	 vyM0GeXVgICMQL038BX56pkc4ltRlRp3jpA8CHxmUSrJcnmu9Zc+jvu0MJwPfWjdr424E
	 2PX2qI1EBweo5xi1Zise2lqwuO/P6fl0uMPOYWW5gpdO34q7KDYcwLG86KRqxLy51dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816118;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
	b=E2Vf+6kInd0ZFWoSQLrl4aQJ+aUq12LGQj3O+Vn+lcaVGT4pErsO3gmI/tkj+NrhtI85
	 fdmRarWUSrVvX7SRwsZ2TnAv8mJcmYsQwVt7ldbGG6JK+j4f+lxNpHPKcXzs3GaVZbbFW
	 RN7+wwoW85LeqttB3A8miBG1j7Sr2ioN7PRoVO/tIcxPduYZ3tqJFYMooV75BNQbc9YP+
	 23389Bi2Yx40OWBOnwk0DsUW0AtLDsJ7ztQTBFg3e/6xlgu32U3W7Wkwyd2LMxtn8dTAB
	 zdDjXUcoXIR8RXIPhuT3SeNEhKVWYrX9bbrdCIi8YaN9HtQN5ylu4hyNcKwJs+aRAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fFU22zeE;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B307606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B307606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fFU22zeE
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso426682a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816117; x=1794420917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=MGYTMAWB0CcFJfRa1Ya3WpXClS8IVj3BWNkfPv9klq6saYrTezEPKqLEP/smtUg2KA
         yNB5TmrxRxFS0Xl4Aa7OZ/MXCAuD8xXRsyUKkb7EYA6QU2WN6KCVvjNfe/UxZ210q0pd
         +xCw9GP+jNq1sefDCfy5qJYNDfi5rgnrbHgk+GrUYTel4uhTrh4urTsIIhTeymc7u3Uk
         docLub47iuranSBSIILUvVQjMiHzhe4GsUZFlRRxKcZ79XiGCboQYEHUTuv9SlbRPJAP
         ctUquPkE1qVcg+U3RBY9tu3Euhbxyg5Fb6EkLWtqxwhzGZmXorQ4sTVYaerJ68Pmf6es
         ge1A==
X-Forwarded-Encrypted: i=1; AKwUvBxzuKI/bQ/IM8btXILmaUwvEZY84IcBBGpydRCyhrV+hxOV04CQ5pIR+sjz+humm4HbTEoHOYxdXnTXbNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GL1DAkHbRKYabhxetqqEnlwXSkKfGudYNI0mviwyMeMA0+62X
	riBNCdENefrPvYwtc+UIAnOlCLsL5AaaLK/xWU90azyZ8ST5DaG8t0DpzT2LbCExpgjQkFtQiyJ
	gRbCsnjAEg8y5QeaXW48uZ9KKyJpjr339mRlNUYBhqDQYesXcKgv4SEFW5qRV0BDlSu4OeN7vh8
	VJmU9OkVAbJG8QNAdKyDH+LbTKbLJ8MYOdvOhT5yesWEnmpL/MM6VmBBibhjphYPZ79e0p/YJ0J
	X/Rw8lJACON4yMfZcpkkpfM4Bs=
X-Gm-Gg: AYBFou3seXmI4qHNDMGejggEDbp6Y0sVm8S0uq6/DYeZPwTBvgXjd1Fq4rJXDt0K7fu
	j3smyGy1dUD1CN5cSm1L57f/4vNdZRU4aI1/e3c7D3WqxOWBxRHnqmBuL8uYIIYLnKPYUFkgyEk
	LlqP2Pg+J+f2bqOw+pKJzJvDubJIpdOMtcjMBtWPsvFrS5d05YtAjCaDiFxEnnlcs89OfeoPt+I
	cB4F2r/dVchzHbabtda2pU+l6uQCcaLNIf6XU68nGMV1+GtFjVdau6hPjgq9mNUyQqRv0hL5DBm
	C4/eUWQH9obQIARCKMLD7SCoLsTFAKOINx15st1TXnN4O6xOHQfFpw3j8APXJIv//mSEPb6Uamm
	gNMmUkU8S7EKLCYZ6k3AAWJQE4DpJzKqvjUStvDv9VKU5TwRTpXatEDpQ8TLh7eB9bvzNokG5mE
	E2uOiUUT1TAcw3tRS93/eiEHwGDe0JyzDY2rP7RkCj
X-Received: by 2002:a17:90b:164d:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3ae89576062mr15612513a91.7.1793816117458;
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b315a3f7sm51590a91.1.2026.11.04.10.15.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c0f73807eso14307766d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816116; x=1794420916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gMaAWh6NQk15R7de3+ypmCGtyxD6uFeXuRwji4RdbQ=;
        b=fFU22zeEOUr9v1KGFgGKhFk6YuxSVedNvOcme4Px9/eBMcFh9dKyJAPf/bi5voOqie
         EaG1Ce+t4FxlJ8mjQ8R/Sn/OWtj5BK9lrDsKVGpfWrPll1QDqICGtbrf1IurlCZK8qPf
         aI/hcSHaPEL5OjGxjizH0TF6X3Q5+uSGpLwyY=
X-Forwarded-Encrypted: i=1; AKwUvByjXbbIokTYwGpfDbQX4FcQ+RL4jKlXzTOlbUuqLDKSU7nxS4TB8dq+g/CCQoKTq7t9Ccbl++BVqiog8JQ=@vger.kernel.org
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60525346d6.35.1793816115985;
        Wed, 04 Nov 2026 10:15:15 -0800 (PST)
X-Received: by 2002:a05:6214:8110:b0:91c:61e8:f9cb with SMTP id 6a1803df08f44-91e792ee5eamr60524216d6.35.1793816115094;
        Wed, 04 Nov 2026 10:15:15 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfba098sm25119636d6.12.2026.11.04.10.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:14 -0800 (PST)
Message-ID: <675d9836-4958-460e-83e5-159627c8b0de@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:11 -0800
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
Subject: Re: [PATCH v3 2/5] bcma: scan: support big-endian backplanes
To: Alessio Ferri <alessio.ferri@mythread.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
 <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-2-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> On some SoCs the bcma backplane is a big-endian peripheral, so the
> ChipCommon ID/EROM pointer registers and the EROM itself read wrong
>   with readl().
> 
> Add a big_endian flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and use ioread32be() for scan-time accesses
> when it is set. Core register accesses after the scan already go
> through the host ops, which the host driver provides with the right
> endianness.
> 
> Nothing changes for other devices.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

