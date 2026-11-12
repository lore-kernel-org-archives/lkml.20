Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522042;
	b=E1OIbGNF8HGN5bqT+3MpkwSrubicXnI+K9xaopMiLcOEvvm8JH12bYGzc5lIPjlTkFiU
	 pyvKj9Qei0amTU7mXhxHiBWiS/fJo3be/HanBhtQvbdTAd24ObuU5B6bIJeRUs6NH+l/S
	 nFz4V/EUqF21WpnAi+d8n6s6ONYgoYrUaBI32qeWzq5cFP79NENX4HgAhnWT/QSEUp73T
	 rRK1OhN0duIWAcFJZN60zlCri1OGqvIJWMB7D0BhjsbISWVpHRBEq5y594+v/ADYJz5Xg
	 iJ30vZzFuZeRD1Bogx49I1IzD8Hb3pScBbSDkcEvYdXWDnC6zzAPvU9kRc6QSMDaYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522042;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=LoF4OTllmT9/8Bym4KO+EuEoV1VsIKNsPgJWXYwUKoM=;
	b=U/+DyMrj0gswMpdLTCbZvV/W2Pu2+2mLl+jNydRRz0/eD5KoIOC5IxQfltWvwWxKgNmM
	 SzFr0KgxEN3j71BuPslFBZ5CEexpv+fznru/nk1NGVmlKgPMPfFh1NqQmzDDNnz1zgo/Q
	 zLuUjGjUgtwQ2hcxR8u+8J+ceeypCgV7MacqfhiP6jx6ZKJCoZedfSy0oVuE+35eTtw27
	 x5IgCZSqyu05JZqIJy9edAxvT1bEzRks5uVsCcoEj6NBkBnzmCGHR1MV6J9jzRtlTfXMh
	 5EgFkuRfmSTZln8UaTcvvtFAR3Fa5QU4JS4rw3Et5RyaHFYzE+0+8gLMdWq2ghOaV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SW11b93X;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE3606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AE3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SW11b93X
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2edd50e36f2so1949615ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522041; x=1795126841;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LoF4OTllmT9/8Bym4KO+EuEoV1VsIKNsPgJWXYwUKoM=;
        b=d3X1bln16glUMrsSc97JSKD4V7v1Mrqsgz5Hl5hcitPieTwN1vFb17R+IYA3hM/HVq
         90eWrQtnsEcEr/d2f+s0Y7asN+kac7A8Wl7vPDKjCLacJSeetoLilBlhrkwRgDl8OqXO
         oAjdQ+KfGqbTUw82pSolHct7Gr2qD37W5ED18GKY9riBTjqHzIHAEw4eBL+XtHhHEUNy
         9kJjCG5yKnn8BzALOmfgbR0sWNk9GHujc/WUUtLZSpOgyK4+4ZY0D4W7dRySb8Vne7mF
         FkJCseCvd6NgVlMtu9yX0UM65mpgOAkpGtF/tmAOkQipq2pYtZtHsuQvIQIOyPJe6PC8
         KSHw==
X-Forwarded-Encrypted: i=1; AL+hErHqk4cg3wNDBiPpN/mk+xAajZOZRHtXBejwO4bS+cLjqnOR0LfN7V+BPUkO2LhI8oj/MxhymPVIUwHqjKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Py8B2/3YyBin6ambt97tBT9G8i1azH8SBkpv08aI12rHHNi/v
	0//oWpj882BbWuwMENOcZ82MhKqKK9FZWBlVV/FNSU5CjBoovaceDZwpyokvYcEWSATTSJxDvfx
	EoSiJUxGww/I8vZ4lb32WmHwBXFX4tOO9uKbt4A6HWJo+jWIAUUhIHRPDucKMQIfykzLZaSqdG7
	EThxvZkBR+52I1/ZEOd/bkzmB0FKj8ttK/jbvIjZwV8pS+QZRMxFSM4mk8LTfbctHH0lxx+FCHj
	crmpqUpZRPr1t2VlYX1Pnj9
X-Gm-Gg: AYBFou3nVHWyV/xixTHa5W+IJnlklx/Wtck3wXKcLrynlxV+CWYTXxZ0qD3RoRVKy1U
	qRlb7E+1KakGcvI5J3RZg+zvWjwOeQTfn9gmY4pydjiYmVFX2E2jG8iOVEIxQsGVP4f2F2pdDs1
	g59ZqNgd6odabSxu7JjH8lofGpAADVXH2XLs8MFc3if8ZSKJBmZDDm0OhWdk/Xu0v/QCXG6k1+F
	xOkbzGALr/0p/fnSZqVw0UXXLa1UYN+TeZrHsZjhkx3Ti1XWJHuVmdEgzEDg5PCTj7WSXYhrv0D
	9bn795Drew3RJIBwGmcCjtwzVwlDALVIqdV0CyEGM1KEslG+bfkJccHQB6w2ykT0onKiUsbUxNr
	l7x1vhFO3UqbBNuyj54wBQcYCGaQvgPsKGJ35YGes+tD/lq7kr1ZlFdBHMfjUYeohQK+sETvT7j
	nnO7NiWFX/+iz8j87W3hR8Ex2p7WV3m2l/+X6w2q6/
X-Received: by 2002:a05:6a21:7e82:b0:3e2:91f1:3878 with SMTP id adf61e73a8af0-3f7a4dbe2c8mr396933637.10.1794522040473;
        Thu, 12 Nov 2026 14:20:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cddc18d22b1sm36231a12.25.2026.11.12.14.20.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:20:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so769425eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794522037; x=1795126837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoF4OTllmT9/8Bym4KO+EuEoV1VsIKNsPgJWXYwUKoM=;
        b=SW11b93XR3HnGhP/sq0Lfo9RYtiDlMdYcMHSUNQtIRBtcXdTWJzgHlflxfSRCVF0Jk
         utveVVM0JVSSF3i4tdkxSPlt7fOAkjhr6lYKC3UQAr7R7FnDRY1V6FJD0mMuO0KsxvhC
         0Czg1X7Y4g3FTUd18hnCU96I1Kp9wb4EsBfC8=
X-Forwarded-Encrypted: i=1; AL+hErFrXCqkMK7jrsxf23OvaimrZLmESStnvbcI7lP+qNklao5ccb3nOmbYMjqQGSHeYZKwzDI//O8ObcQpRR4=@vger.kernel.org
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b503112a76mr766363c88.12.1794522037570;
        Thu, 12 Nov 2026 14:20:37 -0800 (PST)
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b503112a76mr766340c88.12.1794522036859;
        Thu, 12 Nov 2026 14:20:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm1959526c88.8.2026.11.12.14.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:20:36 -0800 (PST)
Message-ID: <361df07a-d231-43da-91ca-8c507797bb1f@broadcom.com>
Date: Thu, 12 Nov 2026 14:20:34 -0800
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
Subject: Re: [PATCH net v2 5/6] net: bcm4908_enet: unmap RX buffers on stop
 with their mapped size
To: Kordian Chmielewski <kudzo51@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, bcm-kernel-feedback-list@broadcom.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20261112195051.597102-1-kudzo51@gmail.com>
 <20261112195051.597102-6-kudzo51@gmail.com>
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
In-Reply-To: <20261112195051.597102-6-kudzo51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 11:50, Kordian Chmielewski wrote:
> Since the switch to build_skb() the RX buffers are mapped with
> ENET_RX_BUF_DMA_SIZE and slot->len is no longer set for them, but
> bcm4908_enet_dma_uninit() still unmaps them with slot->len. Use the
> size they were mapped with.
> 
> Found by reading the code.
> 
> Fixes: 3a1cc23a75ab ("net: broadcom: bcm4908_enet: use build_skb()")
> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
