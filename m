Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522089;
	b=eiZxDSGe27JyKjNwOloDE5zFH9iX0wpHVGBf6oEVUtPRxT9is2zbTWIGxyVprph1hLYk
	 QKTH7tB57fzBj/T6KWPPTNpQ+zuvTAM13jGo9SCn/VwD56HaTcsW5h3Sy3AYIRRI62Y6Q
	 hvx+16jwuYGCKeKsTgdS1Qai6GpEfIjl3+MckRRIaNnJN2EBtsHZ0DNtszsjDcfl98db8
	 sRuojwgSBec3KxTYlTr+xJF1cYLDF0+yNdib3fle800blsbV2naVvSnOfprCXB2sPWIHP
	 5PhQkWGaDbxdzGj/fepVsdiDIwID/TYfjKHPqbk+LVE1rmwv4yQReWN8Va6Tfe3rZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522089;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ryOGIzWANYk795wucbwRaaM2psKG1cATfQ6kt+6oYVQ=;
	b=aQXLgIbGE4MGst1foy49fdSYYIkvoAvXwFgJsPFkfhTfa8GFUFalBNwhp2R++d3b6Fe1
	 FymUQHIgtoy3eOxcZQDkYLmpQ94JErPrRGw/4SyN5bgDPH7NxD4PsMrcvn553FuGsuqgV
	 rGjwa9G4UxTPqhPL+sX7Uui7XogWl2VNBOyfYEsW1+0LDpxLOgE5pD/5UUYXGkWuOS6gv
	 qgzOBZ3SoKsoQI5Zyr5WH5orq16Z6BKDXbtwssrX7KOeSd5Nzjhs/4AqXi1ydcmK35k7n
	 z8IRWYOG+LOiKCj1Zu29cwZn6MMotH+JbbDbwDN6zFJey4bcT+jitW3AnkQG2GlA+tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xbez+FtK;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A24606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A24606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xbez+FtK
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso938128a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522088; x=1795126888;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ryOGIzWANYk795wucbwRaaM2psKG1cATfQ6kt+6oYVQ=;
        b=I+aCtN2IlsElJAuKPROmTaj08kUfF8HLHnsAJRjcopVb62rhdAbkVvLUEp6qy7oBav
         oc1rjZxbFe4ybf+hgMHQEoweBR2CvZLvEb3Q4DlKSPOrm+UZ0i/WUoG2RB//OjRGzsuZ
         FEXoejXHh0Yg6LrkhkMvBsQdkI47HPTLbSAJLSahYw4qEqJoh2PWAsmIHqy0ceO+yfFv
         nmPAHC7eReDdtW9GSvI2A69fzCUGilEeFBlhjL1paHomU21ByHiboaT5VaDMkWMni+aL
         9k4+noDvDfnGDH6ixpr0TLVxy1FzIk03yW4qTn15ksHOAL5IHyG3gFKaa78PwHx9bLg2
         qv+Q==
X-Forwarded-Encrypted: i=1; AL+hErEFTOB/U0iBBxyiKO6Ppkr0JM8peJPe+CqbG3+1tFfgsEgWxShlq+02dDQEnqeTDo39KV9Z+1FIl7uTwng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IbQFE6nORAmmRCaPdov346LtZsUoI39dZXr9bXjmH2/9uf9RY
	lrgynQfpfjlwNxn+JezhRhLFCbHVMwADmQpKy3YGEN7/JtRY/wNODOqRo9Cunt37prS2ygGHPaU
	dPwXINl2Bvs3pyo6mMZwm8GInYubAvxqnMmOQpZsyQPYEhpvVEEtO39aW7pDLozg42LMul90k22
	eOPImZbJhMl1V3pCmJaeB4SO2HlQeB+sqaqq7wcMSrhAMP8155xSuRsi290xeOgsSdQEGHGVdMC
	mTgRrE+EWjFRfJMb3V7vizS
X-Gm-Gg: AYBFou35RRLzzdG7eT+L0/ShPAPVkUDZ8Vnaowqv6WTVSpuTakHg2+qcw2TYnnORJU/
	3ACFQyaRC+jAgrinvRc71nt9e4apYT3P6gJ3ELQcXyEy0MeFXrF7HJY+EvxWxfHFqq9XN9BP4FU
	bDV+VJRul8u6GOzdw5jhvswRgxymIRHlehuFfkORtSajzb/87hf+IW+gvkJhHBl5wVIoGVGO4dU
	ldQPBHeo/dgDuZ4XQHc82LNVPb7GiOqvibxd/KFxCPIORKfYC/semjJLl829g5Vh5pSO/rbsNma
	YWDkyMiaJEcIHQeoEqx88MJeSoXcaa139j99ylRxRhvKru1N1URt9rKh8JX8cMXkZnicw7/UXDa
	8BMR7vXCxGlOF+0sjHpxE38Dq4l9CmJKNZ10ZV685zY7wj9o305AP8mg8kDGsYU7sty+WZKd/W9
	eX8BSp2Zap9Rn4DLi+lBm2pRqsoY7h39NDsbch7byn
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr250107a91.37.1794522087814;
        Thu, 12 Nov 2026 14:21:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdf4dbsm3925169a91.8.2026.11.12.14.21.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:21:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so148587b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794522086; x=1795126886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryOGIzWANYk795wucbwRaaM2psKG1cATfQ6kt+6oYVQ=;
        b=Xbez+FtKbFsQUfi9+XwqBxNfdXjUj4/Sv3i6aThTVP3JaumR2yE7SqUYYxNCbLU/Yq
         Znu3874ct7moOlcXwY2lafxJFQImVme2EIOwV8tdI3D44xetlvOajEI7Vkojp+rwFF4D
         Bbsn+of6oI1IsMs209zTAlS8gIbWpr0U+N9uo=
X-Forwarded-Encrypted: i=1; AL+hErFZswdLD7I0Z+89BYVX+o88XgNtjcv4deUU32FkqsgtfqsXwRLg34ffj5ZC7b58iRDgKx+cuCMaNXrByQk=@vger.kernel.org
X-Received: by 2002:a05:6a00:4b52:b0:878:3704:e0f6 with SMTP id d2e1a72fcca58-8beb7a2536emr537602b3a.28.1794522085890;
        Thu, 12 Nov 2026 14:21:25 -0800 (PST)
X-Received: by 2002:a05:6a00:4b52:b0:878:3704:e0f6 with SMTP id d2e1a72fcca58-8beb7a2536emr537584b3a.28.1794522085400;
        Thu, 12 Nov 2026 14:21:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1d6207fsm187440b3a.32.2026.11.12.14.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:21:23 -0800 (PST)
Message-ID: <742a9b5e-0ef9-4ec7-9073-ba3b4689aa65@broadcom.com>
Date: Thu, 12 Nov 2026 14:21:22 -0800
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
Subject: Re: [PATCH net v2 2/6] net: bcm4908_enet: drop a TX frame whose DMA
 mapping failed
To: Kordian Chmielewski <kudzo51@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, bcm-kernel-feedback-list@broadcom.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261112195051.597102-1-kudzo51@gmail.com>
 <20261112195051.597102-3-kudzo51@gmail.com>
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
In-Reply-To: <20261112195051.597102-3-kudzo51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 11:50, Kordian Chmielewski wrote:
> When dma_map_single() fails, start_xmit() returns NETDEV_TX_BUSY with
> the queue still running, after it has already stored the skb in the
> slot. Documentation/networking/driver.rst treats NETDEV_TX_BUSY under
> normal circumstances as a hard error, and a driver that returns it must
> not keep any reference to the skb. Here the stack requeues the frame
> and retries it while the slot still points at it. Drop the frame
> instead: free the skb, count it as dropped and return NETDEV_TX_OK.
> Map the buffer before the slot is touched.
> 
> Found by reading the code.
> 
> Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
