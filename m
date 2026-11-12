Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522061;
	b=bMrNmp7e2gqW+gMwSUEgInbJkP+rDrwNKW2qpfdOnMMbB3FOjhspuVHk5fz/K0kMH0Ad
	 VzvfIaPYbApv81RZY7bAT+ySaoGNM/QoiH7Goc54m1zA1qgnVXgj+PiGjxNydviCiZZIG
	 Y7QiA/l1NrDmLk4Okasqs8Oiyuc9k47H3fp3GANg0CKvNIpndNq/hBYj6QtyffheWLecP
	 2BiTIHJYk8+V0bFbSTdGM1n8rnjbw3PbUWLxXtpmv6qZTC0WiW7IDSaJJQTo0xiLMP1Ve
	 to60CTs+mX+duU4WGKI2i8V9uofB4cSxpZM3qyIQ7Zty80kUGk3NfmpqfY+yflzyhAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522061;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=+fJZVoPcPX/ONJ9AsxeeWQcx7xzpx+S1dW2PWwFnYJc=;
	b=uPyl0Ua8V4M4aMLw1eSO2xDePSoxFxz9qmKfrRdXrO0nbdbBKIXflbOHLYW991b7xd7W
	 FHzseFHbuMLXoOoJr7YaVqGwdC3K4KqSAA3g5zxz3QAQaTnDvasdxOKzm2MZ5nZcC+ttc
	 Hhe8h4xg7njHRQ5FdECF6wNOoq3a4/qp7WnnvUL/XftUmvsTqO+HVYno0K6g2rQ9EQek6
	 STv+7yw+sjj6Y/IY+MNafs8iq3hsRtQtN3IM5ji125yd1zCqI81WKoZG0ms90ul3TUtWE
	 4nXqKQkmTF8wKnLH6TRwFUTV5mp5HoUdHMMnvcbJjwosiUlb0BORC8S/IgxxdmanJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DVlH4upX;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBB606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EBB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DVlH4upX
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so343230a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522061; x=1795126861;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+fJZVoPcPX/ONJ9AsxeeWQcx7xzpx+S1dW2PWwFnYJc=;
        b=sLkjpQQP4sOrC009oTDYx7SMfjjwOSJjoTqM4dOwn915T+/5D9UFOpmnjIKVnxlSiO
         KYG3gFHesY4A41hVNCHRSR+RO1q05yGhRlPAW8qjaXm62DyyXlRiJ6CNwA5PVKJWOW5F
         DQCBgvPAGmSPSTnkLbnaukj6k4QS4uDuj/crmbuRsHabzQCEXdvgUug0JI4OGijdJnDl
         yBvlp88X0aFfkHlq3F53q4hlpONP58fG3MIaCBM5WW39GJPS+5JUWT09GHZQFc9Z+AMF
         HB575Z7Fj/n4M+MJAZmNizXiE28qagmtk7r+ZapGBhKY5dIPPfEnd2JY4bTXKZtDbKW7
         tFHg==
X-Forwarded-Encrypted: i=1; AL+hErF4Vs7eCPfhC9bTezJNqu7MRpHOHwffMXf7XGXpHFhIvJXwTJNk7UkwCodBlK5IYCExwOM0Nx5eud6WAiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xor46Ls06HmauwroX2Y08UQEytLPlReLLb8ccGdjoFvtPHIN2
	OzF/2tLyvAJiRba9DLWYyMwkecGHzEwQfg3R3wXDi2jH0wNV4OlrEwTNAdGV2mZmuIjHIwotxYD
	qgrbLyuPVMURpVdE7K+IodV9Ccc+wS/pEMiju4yieJS6NGZOge6wN6bTV+7A+/yX05eC95GVJ2e
	ebTUorsQGUHBxlj9cwUYU5dc8lnR5rcNiDFsosw0m94/eGZzIzmn3fD4ZX7Ser33SkCif05hDBy
	AwMKUJ1wTy5n1tYRfZKUV76
X-Gm-Gg: AYBFou3Rm5jXj/nEDYPit8JK6pna8hXj5wpl1I23ZmS/BqR47Hq0LktGhPMnzkm6ovV
	51NQHf4ZJwMrlbQ165OX+DTuMpvomZ350jqymAY+RArpuEzNClTi9R0Rl0TGyK3fUX6QlsI/eiQ
	/MtGb24JKhKz7vxGT/Zvcd6V7oPuXwPcTFrgghsAbcQ0bOKydNo2G1xQxLsRS8mfQzuv5zl6T3g
	Gou6OwR2AJPQn0BF9FuYdtKKQl2wcI6Lu57n1WWOrES8+dMgX7a0CXqJm8Ty3dhtOqUn7EysHhA
	TJDb/bno89f7BJ4DZE9aTfTxS/YcMvjxfSOT/pL2at7Va38tc5INLNqea8Rii5gsIfdexM8EVEG
	aMQeUTsVdcu+kvb3iNo3F3r1B9RdmA2G8uByDF/Jaua/2TyFfyZCdSQ+lTrui+Bsfg02f72Kk9M
	G2Lpy7HIh37wwTfSzuQdu3lUTj0Bo2TnXIusuEUuoC
X-Received: by 2002:a17:90b:2803:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b1b0b57df0mr369259a91.64.1794522060660;
        Thu, 12 Nov 2026 14:21:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm3700625a91.3.2026.11.12.14.20.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:21:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so514583eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794522058; x=1795126858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fJZVoPcPX/ONJ9AsxeeWQcx7xzpx+S1dW2PWwFnYJc=;
        b=DVlH4upXFjuYcDg0HpkpMRF0gviR5iNLCuMWxTGxkVeHYq7LH32zIhknrEdQTIvHnZ
         uDkTrowa8BUxv7qrfF9CCPzZFwk9yEoQVlk9vcBJbShgV65//VLUEKyn4qrJt6NSouLw
         AJYa0ixqwfsqoJDN3tvpOf3cYEBtQVTNpMhok=
X-Forwarded-Encrypted: i=1; AL+hErH2X4T9uo2Ea76GRUVSCBi/fK/Gn+4ouvk4DiWi+L8otiy1us11wQxz5c7jK4SAdaoF6u9N2r8gaCuNrOs=@vger.kernel.org
X-Received: by 2002:a05:7300:d58a:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-37966291a49mr604005eec.17.1794522057916;
        Thu, 12 Nov 2026 14:20:57 -0800 (PST)
X-Received: by 2002:a05:7300:d58a:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-37966291a49mr603982eec.17.1794522057222;
        Thu, 12 Nov 2026 14:20:57 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm1264958eec.28.2026.11.12.14.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:20:56 -0800 (PST)
Message-ID: <fc3fbb96-92e1-4161-9539-5241390a2211@broadcom.com>
Date: Thu, 12 Nov 2026 14:20:54 -0800
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
Subject: Re: [PATCH net v2 4/6] net: bcm4908_enet: unmap the buffer of a
 dropped RX frame
To: Kordian Chmielewski <kudzo51@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, bcm-kernel-feedback-list@broadcom.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261112195051.597102-1-kudzo51@gmail.com>
 <20261112195051.597102-5-kudzo51@gmail.com>
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
In-Reply-To: <20261112195051.597102-5-kudzo51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 11:50, Kordian Chmielewski wrote:
> When poll_rx() drops a frame (too short, or not in a single buffer),
> it frees the buffer without unmapping it first, so the memory goes
> back to the page allocator while still mapped for the device. Unmap it
> as the path for good frames does.
> 
> Found by reading the code.
> 
> Fixes: 4dc7f09b8bec ("net: broadcom: bcm4908_enet: fix RX path possible mem leak")
> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
