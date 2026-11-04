Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816107;
	b=MM5rjdsE6vYgTnDGdYad570r0msyHYXwTyCZbWlhxuIx8KSFJ/jIma5+tN98loZ5+iAE
	 I0u+/8cHpdPpLoKwmiDH4viFEs9g+YQD6iOFfiQRxEt1RgJU0pQdWIazfMX2YU6IRlb7v
	 NzXGcZzypnCxsQSJdE3bYTKd4ClY0LdaexBdmqVr2g0kCYslMxAMEiaKfBmsDQcHfaWpx
	 voAc4u/XGpA7PSw2u8GxJLgXDNpI0xUmW1qHpRkM2mYBJSL2K6li0PU/QYDqyqqeXHIqg
	 w2oCVpbZVSTfdEsWETckYdMiQNtkBv9iE8WsJODlAR0Od6KmrsHh8kej8Px1C/BtnwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816107;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=yHIKm5DcPdY+mPn/+7ZVXqf5/F7GQhUZ0K5Xi+pYbx4=;
	b=zP26qsv/1p937wV9W5OtvG4HiZXZbcdnv4gywqLBUAy5tlZDsaHq/sW/hY5lEPTly4YO
	 DfLOcbejVhDFj4PmfVtSoTrt5+nRyDH8tMrNRYv9JCmJYM8C+1bsllv/XamMmhStO7OeO
	 LUcsQIxGnZTVkw+GlVJLsmmznnlZrbeWqFn6k0qp6+q3IObgZfQSjxuGmULaxeR+LYQPs
	 Gm6b2uXMMA2+HIY7Vh5Ce916MFBaTCR8oQBjzVvTLi1jP8dtomEu1pfdMaoHkgj74scKJ
	 nU/QDaQN5gFwjgTda7Qzw1JxcniLtMuCFDAcKuciQ48Ysty/WxrikI6s1FgD8lE9lZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EGXSYVIR;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E563606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E563606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EGXSYVIR
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so915678a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816106; x=1794420906;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yHIKm5DcPdY+mPn/+7ZVXqf5/F7GQhUZ0K5Xi+pYbx4=;
        b=zC/cGfiCC8o1lh2Ej7P0YdH2ZyzxeyTZete+ZW1MxONVXUr4ie4jiVldpnity2HXIj
         LWhyQOppYbtIlDXVBe0ZKGiPHEzbWYPjflXpKJ7FesAdEUET8ro6Cz+SCfOg1FND6rxg
         9NCVa6N3LvshZ97Ucb3P3LD8uAqvv7RpVt48ZF447YL93JAFPCh4AaS5AC/T/aDUtN7K
         EkHVkaOuqgBBaie05j0Wdxny3j1clXBTSqwilsBtBJR7BbrGL2krkcK5nUfxgJCW/E3T
         HsUpApEOykhfYpLH6DsT/w9VRwCMhzd6LmO7OnE10hiwb7oqKVc/W0hsvX2pQ9tSXDgg
         yyug==
X-Forwarded-Encrypted: i=1; AKwUvBy7nv6yR1IZebmvryU6pX9W2UeSR9dDAfJafeGptIFlQzvaVjEdQXeBEohme/bjwicfJtHpZgKgTlUvld8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w6dHb+Vxe3kDntmZFqSC6RGiLepVIxU47nHKKvsZ6N6J1htA3
	bS9sBP6KJmfNpvQAbnJrPTpJVQq6GLPuzEtmkyMV8vHHtOUXeLw2Dzsep8i5d5d6/9Xytj+xLNw
	hMHBl/A1bZbcEmx6Ns5pUe1z8nCuGNbkKM3uCf6Ciozi5uf2QEd9qj/UDrO5UzaRt0ZeULGg8fx
	isRTL+QmFs7O9t9dV5vkFSseERZZQ9Co7K0ow8UUnYa+9GkKJWFlgJ8tC68J2k8vRpx2E46Zgrb
	KMdnOG6lnXjkITRSE38vf9kk6M=
X-Gm-Gg: AYBFou1qtM+9N3Iw6KcYQtbzx2U8lgRcnXcqeM1m9h/P+rX7YZqOHS20A7V8heXZYmN
	DfRTbFNOXND1dhY/QisRY5PKq2rfr+n1sgA3tJYikaqTGHB8R5l2+U/bijneLQ/tupI6VrynhCC
	aA3hc8qmRl6qaTbKe0GkcQq+y57A2MYKP+/irnYKAKfE8/SYYugYoG79Rhg/Y3ir9ZEyq4Zf4L3
	ZJkgDGeS8nnS4cD6zDnAWm6IOJefCzPHsLwdW29Z+JnSgRH4cLEjKZCRMsP4Kx8ggfkdv4W5unf
	KP8x5bYW7ONk6QIxxY0Adfyb4ayPld+QYf7qOiMwWXX2n3pzLjOklM17eAMViVeFTvDehXaY754
	i+K4dugD4h3fgwHOBHf/rmAyao/P4gCkDvFbY4eYeZEJvrQWvGVCtYoMX03ASv8fXAf/XhGdFpU
	JrTjlMWZRKvcG/16UrkLK9rDbWp69rk7CyIJ9K51lR
X-Received: by 2002:a17:90b:4c81:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ae897c85e6mr14199581a91.18.1793816106347;
        Wed, 04 Nov 2026 10:15:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b3195213sm50744a91.3.2026.11.04.10.15.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so115871385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816105; x=1794420905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHIKm5DcPdY+mPn/+7ZVXqf5/F7GQhUZ0K5Xi+pYbx4=;
        b=EGXSYVIRjU+yC9p/pkiP4FmlZ7QPalCdWd91uyVuCVl9P13YvX0uKHk30CVtKBMRAp
         Sy6ezxnASpzlE7eDAwkMkge85iOilLuunY8SVz+9A6oMGhyv2n7g1qaz5L+3l64pRJIM
         hsMmPsTaq1NGjqXiJ4hpMEVAmwrUloIxoVObs=
X-Forwarded-Encrypted: i=1; AKwUvBz2cVvgp2WIOjRV3z9a559CRAeNWbXe7hr6z/WXSLUSsELL06hZoCNvBARuMOK69CVQuyeH0YUZFZAo/xY=@vger.kernel.org
X-Received: by 2002:a05:620a:3942:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-9442178e1edmr2712097585a.66.1793816104966;
        Wed, 04 Nov 2026 10:15:04 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-9442178e1edmr2712092585a.66.1793816104498;
        Wed, 04 Nov 2026 10:15:04 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d468f69asm262751685a.1.2026.11.04.10.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:02 -0800 (PST)
Message-ID: <2a28ff89-f14d-4e2f-bda1-058bfbe54852@broadcom.com>
Date: Wed, 4 Nov 2026 10:14:58 -0800
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
Subject: Re: [PATCH v3 5/5] MIPS: dts: bcm6362: add the integrated WLAN
 backplane
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
 <20261104-bcm6362-wlan-v3-5-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-5-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:31 PM, Alessio Ferri wrote:
> Describe the bcma backplane of the integrated WLAN macro,
> with its clock, resets, power domain and the interrupt of the 802.11
> core. It is default disabled, boards having the WLAN need to
> enable it.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

