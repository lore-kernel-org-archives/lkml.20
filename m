Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119293;
	b=Ttne3CV3hlNd2aipMeG4JComfosKjuT2qKijS4FYZVdxxU5KpmuXbi+ihHKcoaJWWmjV
	 oRA07XI3L4KMvupW82LUFQPteV52SoglEuRe/M1bMt41IfnUZNEm4RicYYQE1P5ACYpcj
	 zRzvGjGFs+r01KJzsHXKX+c0JgNB9tQN0KEgTjO1WitsgV7ydPPGMamh+jE12CiNgvbhO
	 XagunzZ6wEVfHkRGeunUKeP3ekrjOOJTf3C3q+AHyfwGch7Dwz0xvv6pkdNGKwTLREAor
	 /4N0qPwCNvifbzgMyqGT2Ln6xBl2niGEabTHHQyy5S79qNeSf5UeNCgbwIdvSaaKUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119293;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=9c/sKlfVBvxiup6XUAL14dVdvN30VybMCeHge63rflo=;
	b=BwzysORtztUynLFf2r4Xx7PuC/o7XXY6snz1uI+M8coaw+C0hyQJJn+78J+AlHY8uxve
	 ilCklEdeFCP743DwWcQU2eue1EKqMhWuG1QdgjqQIeiwbZozjOgcegF8Lnx3EozTUXuHV
	 pba19mmIu6ib4JckRlDK+bJGzjiCjL8V/Wi92pWzd6jh2pw6pskfw876S4+wBYQeg606b
	 IAak1w9v2aoky6rDYp2ocFMdYxxlXyLyDyoooCNftcO9e/GtnVqM+e1e505MGHOqyrDX+
	 XlRpwQyQ1j9ndofYcebXpJzdXZXWtUo//Vr73J5amnsC7PFV7+sguu7KXZiFE2TpE6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gqt8l82S;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gqt8l82S
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso72047a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119288; x=1793724088;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9c/sKlfVBvxiup6XUAL14dVdvN30VybMCeHge63rflo=;
        b=Oo1FTM0tkC48YS0R/QGQmmDURc+Q4ZYJa8Zq3fr6v7JtzVX9S1MP/p/ItlW7GTM/4O
         KJ0ryEDzMqRgvvz0am+XldoPyAz+xou6IFRUPll77+hNke+JlVZ4BDk+PFKm1Sotk6w7
         3AVzBA7ZHSUyE3SiL5de7ahfzn98ox5qXY1ibgmo1naGMA6RpXlZLPpSQeEjfHuNOBkU
         73KjgiA4ty6qP0Q9EWR/8vkPQeNKaLn75QqJKpIZLvvhQZe2KwD0IIEvRHq/cvi6QH/F
         H+odnWl8rC4xbYpITTRaEO2LSibUqONBVlOEE+b7mth9FkMWkA1xwVGlF4I2TiHgbG2J
         9wZw==
X-Forwarded-Encrypted: i=1; AKwUvBzK4NIHRr/QOZAC1qiZ8ayryOXm79DVCG1OiASEn9kSPiYvPdqjSWq461zlgyi8558w2bLzfcbScsvRHWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4RtD2G6v9YhA+Zftcy860vPapvV1se+FOzWgna5eqL32s+gZT
	iAuXPF6D7QQWzT1S8PUywwzVF4/dPqVsU7ypusO54NYj67T9A/0cUPwEAMwq+D7QI/flMCRr/Nq
	0mR9S5jkrdwA8GAqZNk+a0m0Ow30LEucOXRrUNxmAsgcTwpZgBKCSII7gnhoZJv5xxKtEGJ5zCt
	VJgf0h1/hPqHb7Oh4NdW5+dp+hlcJPowEe8g6VeATCkZmmRGfm/rxD+lPiuh4NW1EOVoacEclxY
	kDZcjoN/BOZhnTAVptOBoieweQ=
X-Gm-Gg: AYBFou18deSf3lnMwrTFH0B1vJTkGD0FSF0CfoSFvpCj8MqsRXjjXR8rqmuuqbmkt+S
	TvLnbeJMqeCvr1y6uo5zrsiOIx9QHYiUaJrN/2dgGRBbvP4GbHbkia4DMuxpR7YRbjPeLkFCwap
	ScLKqUsulUu8rqr/ooSH6hkniEz5FJ9wJO8LQNWhaXAQIZXZZdVRSR8IynOILlFXQmo5fCJ5g68
	DJXukUIkP1/xPJ7Pge4sVDyWd2H+wk1izRdhOES4Dl0iYtnl1dulAph3Imx/fgf+5BuNUIpHnv8
	NZKgkgxfMpZ/4c8wqGhoOgf7/pPm/QCxzgoFFTO5NkPgxdmMlIGAYltWmaO6XSCEUCGXsCfRxPh
	HOFLpjAwhpNaicwM8bXejRaIohnZwzMODNRsTaqzOjUYhw/D4M5Pc7+V1NULbEd8fJhEt5YjCfY
	Xns08dmFdkdnPc2u0IrobgEMLDTPpmzA8spCpKw8H4RNw=
X-Received: by 2002:a17:90b:568f:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3adeae83450mr8474668a91.59.1793119288258;
        Tue, 27 Oct 2026 09:41:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae407e4ce3sm2486979a91.6.2026.10.27.09.41.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:41:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53664602c7fso2931131cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793119287; x=1793724087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9c/sKlfVBvxiup6XUAL14dVdvN30VybMCeHge63rflo=;
        b=gqt8l82S2503W5bNwUbFWW/cc7dpvpT7T6Fu/J1YvMhrYTZPx+VNIPLTaGxkA/OmrR
         N5XcazADUm9pHHpFq8L0phSX1NV9UcsfSMSIhkOsHdGRRBCPuSZuZAd0/6SWqwo4bKCk
         oSs+BtZC40NfMT6OfQmh4RtMS07bop4BIngqA=
X-Forwarded-Encrypted: i=1; AKwUvBwAjo3aHmNWv1eCjRVT0MVJTuJaIZskmJMAz+//VSrQss+mdr3uhC2XjVxWLYzrxVpjeQsch3DW/4z8wyg=@vger.kernel.org
X-Received: by 2002:a05:622a:5c05:b0:533:7a4c:d8ec with SMTP id d75a77b69052e-5383b54f453mr161685171cf.43.1793119286748;
        Tue, 27 Oct 2026 09:41:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c05:b0:533:7a4c:d8ec with SMTP id d75a77b69052e-5383b54f453mr161684661cf.43.1793119286272;
        Tue, 27 Oct 2026 09:41:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf2e96sm83296431cf.1.2026.10.27.09.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:41:25 -0700 (PDT)
Message-ID: <993d16f4-c8e6-4896-adf4-f7f36d937152@broadcom.com>
Date: Tue, 27 Oct 2026 09:41:17 -0700
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
Subject: Re: [PATCH 09/24] serial: 8250: 8250_bcm7271: fix DMA address
 truncation to 32 bits
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Joshua Rogers <linux@joshua.hu>,
 Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tony Lindgren <tony@atomide.com>, Rafael Gago Castano <rgc@hms.se>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Peter Hurley <peter@hurleysoftware.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Crescent Hsieh <crescentcy.hsieh@moxa.com>, Frank Li <Frank.Li@nxp.com>,
 Sherry Sun <sherry.sun@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Robert Baldyga
 <r.baldyga@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>,
 Kukjin Kim <kgene.kim@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, stable <stable@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20261027-tty-llm-v1-0-99b0202ae546@linuxfoundation.org>
 <20261027-tty-llm-v1-9-99b0202ae546@linuxfoundation.org>
 <auC-_1Er0Kp-Wq76@ashevche-desk.local>
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
In-Reply-To: <auC-_1Er0Kp-Wq76@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/27/26 08:10, Andy Shevchenko wrote:
> On Tue, Oct 27, 2026 at 12:06:35PM +0100, Greg Kroah-Hartman wrote:
>>
>> The local variable daddr is declared as u32 but assigned from dma_addr_t
>> fields (priv->rx_addr and priv->tx_addr), which are 64-bit on ARM64.
>> This silently truncates the upper 32 bits, causing upper_32_bits(daddr)
>> to always produce zero when programming the UART DMA descriptor high
>> address registers.  Change the type to dma_addr_t to preserve the full
>> DMA address.
> 
> Since this value goes to HW, it should be u64. Even on 32-bit machines there
> are possibilities to cover a bigger address space / DMA space.

That is one way to go about it, but since the size of dma_addr_t follows 
ARCH_DMA_ADDR_T_64BIT, we could also take this patch, and also make the 
upper 32-bits programming conditional upon CONFIG_ARCH_DMA_ADDR_T_64BIT.
-- 
Florian

