Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608057;
	b=f/MdeqUC4Pt5BwVmFGDcXdUT4oV+mJQ6bTVbPoMSKJmLQXTcm+miiYkaeRqKJoFapP+u
	 9tzN/q6COjqIzXnMajFVH9XwMNqHd1Bzb4rWJBafUHr58DxZ1dpQogz3vsN/J3LsGwKYK
	 jKgCp2PukpKSNWUevQLwoAInn5l1LMfUAEkH1v1Ca08OXWzVw/QPyls7hMeVhjas5ayfo
	 SgqIm4J6nQBOp4Pl7x/0LifPUFEVLZQ4cC4F5Lv9+ZAhqHcDRoP1lF0x3cxL4YuVsn1Dm
	 0CWld0e4ULIhO2Bn71K8Anr8DOZzDjrEuhkjmMhUIbRxPbUiPuGUfHsDTiZDkq9S7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608057;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ak2Wm9pxr1mRdtezE4lHs4tQ/HsTkmBnYFyE5Zyx9V4=;
	b=ft36em4mwLWGaNg1SHUXJhTgcd+AQb+VuRg6tFKXpNLVtWPgdSBHFk6XN810r4DEzc1X
	 z/5F0BejYBmSgs8jpVYAxgkySaSjnl1XqyNllJlpydu5ZbdDw5zh2Wa4yIaOzUQ7Rp10q
	 5yi8nnyNHC6LRCTZeQOgLdphpVWl9bgwPxwE3xlsgUlqECHsSgjeDK6O2wWrNfx+XYeHH
	 My0eIiFhvRm7wfSTIRNrLu/ynC2A5BtMX4np7hrj3L0dfzqtdfE1SKs6XDkTYh7G5bkn/
	 emPQu19PhhviPpfMoiBqHgoa7NkkmyFKCP5LEsXRRgZhyiD5D7XvY11140MIYG5Xxbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cNZak7ic;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0C606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A0C606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cNZak7ic
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-3791619605cso3036148eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608057; x=1795212857;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ak2Wm9pxr1mRdtezE4lHs4tQ/HsTkmBnYFyE5Zyx9V4=;
        b=utQvXpeY8oyOOL85Ptgjt4KgaxqqMUmIG79YcXskM51AHe4jM1k/JLEN2XuZEeSimH
         RM6yjVlaQPKhBLWzeLa/7vHplx1U3buk5wCqFfU2cMkPFZvqFwDLfwP0dLM4ZdidWp+d
         sEqs57cts7AG9R2+75yZBT8CqsdF/nUlYgnc0FdmmtX8oaLugGZrQP8l7IPSZ9qiRjP8
         /daEpLmT5lA1cDEP+h6zasgappFUV89xR+HZCHc0ZL+0OMLHfBKsFX7fnuoWt8WpHbKA
         ST5hqfoK6AEXfNDMPHNeWwEZqWDKHCCHl9PKqwhuKDNcXSOIvmWDKFBLQ8S3w2KCssNx
         s8zw==
X-Forwarded-Encrypted: i=1; AL+hErHQkwWtcaZdNYXeq5J9JcxToHLD2EknJFaFo4kt+WDwK/y6KYyRjlAjo/EG0kMnzBxLVgt3IkOx9v7gzbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c/01cPlisvH4NZ+dpAl0YG7lpl4Hbgh9xSwJ1P/6DnEr4vlRF
	rcukC//Re2nCp82Z6e4uS7myLTmABcshUI1M6PueHUMpviVSX9cpzKWjbIq4E0BNqaGmhinXvNS
	shL0RfarGaWfVUNYmpC4FDjEEYvzNcrJfFUgHH15t/xPqtXVyugk5dlFMVcbMdKapsAZyxq3lo+
	+LUk7/sPdFU3foD5IshESj+UxS8rwkJZap3r3k6ZAOUQcTix3cKf0Kn73Im+lQGi7uyMzdtScd4
	NLuZuPjf0F6oGKTyBImQInv
X-Gm-Gg: AYBFou0iozH2VMRk8c5eg/b74BoB7Q/TIQATBJJ5NoDczYlCwoKslQnIVwe+lB6CYEE
	eZRKm8dGOZ6cOG0YQCZSGc0c9IJ43HfWqzSitStZO+Eqsr5mxs8Y3z9zQxjxQ6W/Wm2virlGG5J
	BnhO/W8N5hScGQvLx9wc0nn6QJJw2nHf0z5YVJ6Ri5IAaDuOlgjGn9URWVjByFMMfFdXops0LAq
	2zpgiofy/wtWwkB+Ob0oVeV7MMaF6CJL9SUWT6Dp379IHJsLVpQtgODtWvt5WSxRRL19hPgKUOP
	5k4P0mLSFmYVxRj9VvamVrG1qnngNZbI8m/bZ4/FZMjoe8yVDp3vuWYmIso3gRtVo1sg6BLV4jo
	8m+ye/aN0WsF1UiuGEz5bxiHkbMyNVl7COn/L58jBWKInwEOS0WslPdr4cc8Ql6TXs7xwCA9V+8
	yOmn4NMBLUCnsWV7cXSkDRL8m+FKJLaGBT2E0zyQPi
X-Received: by 2002:a05:7301:7108:b0:376:b957:bfb with SMTP id 5a478bee46e88-3796628d619mr3083888eec.17.1794608056307;
        Fri, 13 Nov 2026 14:14:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3795a77246asm214129eec.22.2026.11.13.14.14.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:14:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so31779051cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794608055; x=1795212855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ak2Wm9pxr1mRdtezE4lHs4tQ/HsTkmBnYFyE5Zyx9V4=;
        b=cNZak7icpEAkVysJyZvhYXzuHvmiFnuIpE/HIhJ0tyrfN/avaOQeIYBCaM5fs+YHli
         25WKSkJvXzxbc5iWmV+Ny1N1gNkOAZR5Q0wNo36U1rwoau/uzrBEU147GVrjOu6pzPL1
         eu2FuMGKkNPW+8wXnh+Z/LMhNzFf86LXojpoU=
X-Forwarded-Encrypted: i=1; AL+hErGBG/0d7strEZ9e6+H+z+Oi9C5Zlyac97JPTtAvIXUI9OlkJ3SwvCavirATuHQ0FwpqPn2QEg9UCA8uSFk=@vger.kernel.org
X-Received: by 2002:a05:622a:4d4d:b0:537:c478:70e6 with SMTP id d75a77b69052e-55ac755d4d2mr59848901cf.36.1794608054980;
        Fri, 13 Nov 2026 14:14:14 -0800 (PST)
X-Received: by 2002:a05:622a:4d4d:b0:537:c478:70e6 with SMTP id d75a77b69052e-55ac755d4d2mr59848581cf.36.1794608054560;
        Fri, 13 Nov 2026 14:14:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm27491251cf.24.2026.11.13.14.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:14:14 -0800 (PST)
Message-ID: <98b20b6e-8268-4295-975b-8a290c00de23@broadcom.com>
Date: Fri, 13 Nov 2026 14:14:11 -0800
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
Subject: Re: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>,
 Nicolai Buchwitz <nb@tipi-net.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-4-florian.fainelli@broadcom.com>
 <e4f0d156-a7ef-48d6-a034-955e01ef90a6@lunn.ch>
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
In-Reply-To: <e4f0d156-a7ef-48d6-a034-955e01ef90a6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/13/26 14:04, Andrew Lunn wrote:
>> +static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
>> +{
>> +	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
>> +	u32 new_cfg = cfg;
>> +
>> +	if (is_c45)
>> +		new_cfg &= ~MDIO_C22;
>> +	else
>> +		new_cfg |= MDIO_C22;
>> +
>> +	if (new_cfg != cfg)
>> +		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
> 
> Is the write expensive? The bus is not faster, so is this optimisation
> even noticeable?

It's not really noticeable, with the firmware images that we have it 
saves roughly 30ms per firmware load per PHY, but it's a cheap 
optimization to carry, so I don't see why not?
-- 
Florian
