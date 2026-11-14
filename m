Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628634;
	b=Ijw15tjivOCEC/1xWoM3JQgluQSR8iVIzEa7CqxqY9gQ9JCGddVml1uH7OAUjahGDXQk
	 0bGjRoy1xYKpCLDI98eEW4+j3rpCeo5fflMThDlMCy4nWcc7t8QXBVs+ljc0DHIL1b6H9
	 9mlmcFgwIHCjAVdPf2wxDQNrgbJ4hzkVxY11NKR5lZsjxeUoQqJR98zMOWr55v1cHxhYr
	 Vzsg34wqwCuoGMC0Bqln2fcLysjT6cSdfqUy7xaJlSEQ6w10fST595XEWdj5bNtvTpET2
	 fAVTy45tuOCSW6Rr3byaCu98ZV10c9lRLhWPX0DYbuZHjH4ZwdR2C5zcLDY30GMn/vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628634;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
	b=0n5i7QAH0bj/ENm0BSpJu3t1E/CDFZ26HjXF3+rpz17+VRNdekPD067OAPXfkIKE45RA
	 F6pM4iXyaFRCUIHbvpplJzbJBZThJxlcAVL3YsKN98OCD9VsmsPXzFIUTnN01CY2xFBwI
	 26awPFr0xJfMyUZwGZzKxK6XgZRRcW3FnrTqlWPvlRMG1C+thMx1kw70EChvBhALLekE/
	 dUHRO9+C0ZJFa2REpCyM1E+YIA8WLeAuYnBjSIYSYF5+HBfJjyUcNvUgnaFx0kHU6aDKe
	 5TCnzJZfdvOebYh71UFmk/Wuh/WYejPHqZMRrTvRWKoT0KsogVY6bI7Cgp4wRI82fWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RAzVPlRa;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC0606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FAC0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RAzVPlRa
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9000345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628634; x=1795233434;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
        b=k5x5lWnzG5hBKpdl3FKt4kIXs1NZW3ORE6RXm5iWQsvvXlB6JXZ3TMdvT1O3j5g1u/
         buC1ARIc+dAIXpCDjcSfEMhQJwp7mpTBrEV0ITlFq/PEbrbcAbwlswhltrtWUh0uhtRb
         ovCvVEmWlrjxLduQ7IjJv76bS9fsz7jdG/j17c2THoDzaBLzQIQxv2ujvz6vgJNvCcLC
         0W00td1DYD09OsifGCnWycm9Td3eYvH7kjlpL/EtEHcWVCzXkKdtDKpioqwHBmrUSNVb
         fTJ7yYYS8GUT1eJ3LliUV3cE2bixu67qQJD4pCRQNo1AY/hs52KUtCaE7LvKIGmqcxGp
         u1IA==
X-Forwarded-Encrypted: i=1; AL+hErGnPLZ+CGlzsgOV18347vYkLqZ9CqliQs+c5jQ57R/WVQ7qNEYFJD4pFemlErGsPL8ilVcNtCskVJVQcZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i9utDwd9GwH60oBAm6gJFTSgrP4eSXHycVMsdJzckyg/RssaY
	YjFHQ/LgAnGAi9cIYFhceGDdPWWOBhNBBs+N/NVSSB7R0fjejhCttNy/tXmV74RPp5T5BteCFWK
	+IMmUxl9WLyQwKE6feWfrf/UkjTvunTBZ0kvUC4lm0ykvKWuNlfqWDxKbg6uv7b6wZAD1VLuKQ4
	qp9MFJMSFB/aDZr3717IrhgSCTSNZloDEO0YiNusPeo1GNMSRrfaLWbdeQ2+iPQANNgbr/7ooC/
	NINdWbRyN2qBCX+Oh9AWDVu
X-Gm-Gg: AYBFou1fRqlNkK6NSF8Rjuc/pI/cqr+u51IX7sabulbQ5hr3f8uY+UsZguTzvhSdvbd
	pkQc/dj5vUNA8Ijk4jc4Mgk5nuUrUdzB5OZDyHpV/zPyMV3GvhZvMuBeq4+nyk9IZM40diCdzEi
	Teid1rwZxunhF+0u3UACvT8QIaHcJw1/tXf11W/ZG15m9sefqFFl/8vKlOTj6Uqvo8ShWgmPx8m
	iTxE76MtZAz1wiqydmE1o6N4HvzCfBJrAZuoLY4takZv+pQnIq5ouFcTZmMe57MpxMGQr/kp//S
	WwBGXnPE0H1fLbsDqntMHvbnC4d3FWzF+64ROce10G07hN1lDbzkUD7eTcJdwKbwbag7+R4XaXe
	CnmjBiZ/WFQBaSzqotuvrN0M5CuJlq2JabmBrZQHCb/QLFQCCA3AR2faoUB1065Rh+L/KiK4zvw
	dTLT/g/PxKemY+m4MoV40W4NKjAuyQkko6SAsYsNEP
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr4160906a91.43.1794628633743;
        Fri, 13 Nov 2026 19:57:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da174sm7003222a91.2.2026.11.13.19.57.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:57:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2093007eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628630; x=1795233430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xROQ3RNQSNgpJHqRCF6i131rXgPAe1NeEIM3oiMNbk0=;
        b=RAzVPlRanUA5ieyjbJw6z3DN3zz1pio/074l/4JLaiH64KBfzqF9moDK4Z55Hyf5k5
         Dwjf8QR+BqDx+A2SFObZmOgyDw0YFypQSJQ5vMkouNpwI3U8oC4f5oOXsvqZNKA+Vre8
         2690MF++s9bfQOwOxj03juNy/laXUgKpgfjbg=
X-Forwarded-Encrypted: i=1; AL+hErGIdr+wUt1nSGeiG+oHyHxP3vVk1CpqRlxpyO3wUFDNgQ/fkDdHfd2/5zv4X7hyj0zkJL2ZykXv5mcG8Fg=@vger.kernel.org
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr3969389eec.38.1794628629220;
        Fri, 13 Nov 2026 19:57:09 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-379684ae78cmr3969346eec.38.1794628628469;
        Fri, 13 Nov 2026 19:57:08 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm11370237eec.22.2026.11.13.19.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:57:07 -0800 (PST)
Message-ID: <c5b6fe56-c9c8-4957-8827-fcc6edb5e73b@broadcom.com>
Date: Fri, 13 Nov 2026 19:57:06 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: R7000: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911203522.105474-1-rosenp@gmail.com>
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
In-Reply-To: <20260911203522.105474-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 1:35 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

