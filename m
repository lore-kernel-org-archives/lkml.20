Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816153;
	b=x8WsztwnNc3giBxkFdo4x03rF6KXWOL8pF4KjTsKAd2++M0jlAjP1HFm+7xw+E2ihXQs
	 SK6Efl3WIgO1wuVu4rivzuQ+AcYgw8q2zvwPyllhH5wx8dP+hvrfAjXmOET1y8oQWaPt3
	 w11/5nSSchZCQkjs7HE5AVQLggNdKqfSw66kPItOI2MHVznGY/hAzEwrqMpGxVEHsnzWO
	 7gbwfj5/8aIOu9X2sNib0Qha/3wgmRZu08y7REcFg+iEfitGDdx6ilXQ16f3XX7hCT+Zu
	 EmiKdKasdBvrGyj3LC+f+KQML6GqeD7d0Q0PBoSuLGwbmO1oA2NQCWvvdAplm6v2LxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816153;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
	b=kpnxhWDYia1Xfw8MYbi5IdS4FvQQkpPOcKBs57GTMLLhvbBzQUUl4HMa0C+Lys8A7Cdj
	 iF57hsmhDEsNW676zF9vyMM1fgtzkJkt4Wu2BV7BwPMJoVg1dTcvX8S8QXIiwwlAIeWXL
	 i2DUUb1uXqjTAMl7UjlBTp3eRjPRlA2Z4TJRHhhZS62mMYQxqjHaf50RxqoWoQ2vvfYkC
	 RaHE+xyHzs5krRqpDsyL1wYFm4lxj3pgR3GiLxWxrTdIFgSBh/LskaejTcIZXiBa7CmCE
	 HDK+igS9Vl/5acr+2OUTLNwXWR0j+EPw6WxIwcGc5GHf0BwzznN0TVrFYSTK3M0J7Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1164606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1164606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HL0miFsj
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc147d86bebso606076a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816152; x=1794420952;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=BMCClA7fDq3mZ5f8gDdwkheIsiK8zdWvhkx19gzUQmhZG4wHEqg4dJFkBNKJvBOC0V
         fFyOcUsI3yqSa3rEU7YKIsDeq3nDSkLl97rQpdbkQXzyBQ5Zxlzl8r/hUi25upVGse8j
         lPU/bkOEd2uxw/QH0ds4ApTmjh869RsU31R8WKncg/8/v9NjjuGiHUyFxobiDVuHdohs
         TnivkGckpllj16iUX65Jq1xR2iVCr/r+E5wHPFvNCjpdAHOgLKB7xcimkGeDWwVprBXz
         RBTxRLymPcgK/wms7vfBUnZI0sizPD0qJ8VCGymGjNr3JfS2igxikzp0zhm1Ny8AjQ1I
         S96g==
X-Forwarded-Encrypted: i=1; AKwUvBxL25bTcBFc99iG6AbOm//PdXQYSuEVijcrB/OY+rQIusiRgTekq074pjiLcaFQsumoarR3AkHrFBuigKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wJ6QEUG0mx+KgH7g6lTRMNXfWwMYbJidrNl+M365fdBZ7ONHt
	zCU9MORvAJv0At3bjO55KRZj1ee1wV1YJYRZEGACbquVfvjLbtVrjmUDPUP90Vekzbxb91f1Yyx
	5O4uLjpqM3zMlgXNxYfalgTStoSShnFivW/W/tdwhiMtZYlLpQAb2gkMFchPX9Y7iraRbdCgHbN
	/8TallhvXqBwNnHfPBNgFMLvWXzBDXn+xp97nDYX92YZSFNBlLNWWhAjwJZGfIfxopJ9BZONf4+
	iIsaTx+MAXhkcyD885nB95Prls=
X-Gm-Gg: AYBFou1+s5TIj8Uoj5dq2nEcK/QOZO8pFPIE5ohI1aze/wg7KNYOmem69BpM4kYG2w2
	q63HIKzem/EwQcabXdbz6U6AlKgoxS80lb+9TrJyvGmkxS0cz81b1/JjSQ5Epv/7BCQt93EYapI
	BhqBIMnA/B66/okVpW4uE86LOOEaXynwKTS++nqEH5hMkXwzOqRCSBfpYpXq8lD5Ri14BtpjU8R
	u4gRf+1C9MwhHU7vhMqNSE1xyLut97NSBEGiDeKmoUyWNJ42fwgQeLvTvhIdZITUXunQwIcLUDY
	xwdzI1AXQtENPHgP8hGSwVaZGna9pZYh8O8hoaRgCHvzvSWQzouBYk5aFaJ+pXYQyI9UD6oECFM
	/Y0g4SdSFUUe20vQK7+nLxEYdRsZillCfEM8VMrxFKaoenOJl0w94NhwYOYYitk67OFVJTVZpR3
	/CBZA5VA0KRZRM+UjlxFBhoDsAaMP60m11EXp1o4+E
X-Received: by 2002:a17:90b:3e4c:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b0afc6476bmr161186a91.28.1793816151966;
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0a7d138d4sm362446a91.2.2026.11.04.10.15.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2998876eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816150; x=1794420950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2zJEatOU4CyFqJt2nHtTite5aLEewM7QlV0X2jkmG4=;
        b=HL0miFsjjSv/CpcIZvjozOqslbWgvwdETERSoQyxZWMArhUne4FYR8HI7sww73FYyY
         EDsPzEWXEnYRKC7dWJ25onLVOA/iTK5NeNkPYcIKmzue754w8uaF2Z9gkdGEwoLgiAlG
         sY07/JG7OJiLR2TbVPHP+hbuw1eBoKWOvkpZA=
X-Forwarded-Encrypted: i=1; AKwUvBz4Qn0oO3OGpAfLqtV7hTZS6sUl8Myf1OljVYwXAUPqouW5mhzhS9JFx5wkc9WGe55wOZUF5yWxFVUcASU=@vger.kernel.org
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308740c88.21.1793816149686;
        Wed, 04 Nov 2026 10:15:49 -0800 (PST)
X-Received: by 2002:a05:7022:b881:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b24f4d380fmr308704c88.21.1793816148953;
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm10038316c88.13.2026.11.04.10.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:15:48 -0800 (PST)
Message-ID: <1113b8a2-70ce-40ea-b8bf-9a40c8116dcc@broadcom.com>
Date: Wed, 4 Nov 2026 10:15:46 -0800
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
Subject: Re: [PATCH v3 3/5] bcma: scan: accept wrapper-less cores on
 wrapper-less backplanes
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
 <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
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
In-Reply-To: <20261104-bcm6362-wlan-v3-3-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:30 PM, Alessio Ferri wrote:
> The scan drops every component that publishes no master or slave
> wrapper in the EROM (NMW = NSW = 0), apart from a few known cores,
> because without a wrapper bcma has no agent registers to gate and
> crash. Since usually bcma is loaded early, it ends as a loop-crash.
> 
> Some backplanes, such as the integrated WLAN of the BCM6362, have
> no wrappers on any core. ChipCommon and the 802.11 core are gated
> through a SoC-level register block owned by the host driver, whose
> aread32/awrite32 ops emulate the agent registers, and core 0x837
> needs no gating.
> 
> Add a wrapperless flag to struct bcma_bus, set by the host driver
> before bcma_init_bus(), and accept these cores without wrappers when
> it is set. Other hosts keep rejecting them.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

