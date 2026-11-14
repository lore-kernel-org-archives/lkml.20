Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627589;
	b=p7XKfB8AsXj/t1KZpnUu2Pm+0su3wOG3M18LwFHR0ByY5lhkljmGiK7Pja9Hqoc13+Ut
	 A0lew0l8WpwVv6DSrw0xFjjCkAdsEiyEfmmQeMa/8iE8uCuwVmh2oqWPgNK7rkE2BS+ax
	 vY/ZK9VollqLPONfYcnRwUOej+c5Oxum+zuU1JzZFiSt0ngoRtohPWvMgAOG8QVNSTB1x
	 TEMDeIJnEAKhjF4ml4BKbbfngJP0CCMUS131bVWLbPIMCk4726PXhO/ngmbRLxbnkNgcm
	 qSAzFv0OwxbuY1IbWSJZzrcNUaYvATHyzpE49b9Wjopdrdao6s8GkzTakdNGF+sbayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
	b=J9h63pfcMwmRfft9tTCEG9ZjyXDdLS2/KeD1G4b3vkozRUUAQUrApzOYkVOE28wvxAo6
	 rTAoCniKwvJNAuAj3tLw0r8lUYu+MUBrBm3bqNFzWRGYIlqksQ/n6Ewp7eI8AdhM+SV1A
	 lX6eZdWTmX5vHW3Jtdy1j5/sJVxlewUaxQDYIlTLt/7ZNLzv9LAAIB7JuNeTSQS3jmf+s
	 odgt1KHcgWJJ0ake8BWW0sl3DLhpkq9kW9uE5RxM7hD8To4lr1qH/oPLCvdAybNS9fp7v
	 gyWuQdQlQKKC9zHkCuzz+fL6K/1xAKivxqxS1BLi08ch48TtXjVZPXmBv/qEuyqxkAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="SDFRs/j8";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5501606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5501606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SDFRs/j8
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso93750a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627588; x=1795232388;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=TySgQeXiwESKBQSfIMhuhLHVx6chDZafLCr6oahiAd2oWISRkmdAKOsjT1Z+NSIc8X
         h4knfS3opc9xQm4Sm4JIkYEMBMIr4elZ3PeE8RZ8Y0WVx5yFTVg7/jbQsGBMdTJzH/Fp
         Vfdk1EMU/FtBGZw6UFTWjdidMWYLYCHFahYG8FrWxwMBLxN3DYok/C274BCiIHLaIIqf
         XsxNVDvbJjCb9Sf5+JfHSI+8Uo9asp7ub1OA8hjXEnCjroB25EDDwD99czQJDfgiqc0L
         g2zLAXSPj28Kgn9pthWsxUo02mPQabSPpV+tumSfFAvp/M3M4+zIcNgTyOlQG0De3s5A
         WZpQ==
X-Forwarded-Encrypted: i=1; AL+hErHuTDhRpRJvkYyvwJ2qHR6RlZXZIY3Kkb8l7JqqmE8YmQyEYMBloYRTwZ/C6U8xupsQvb5adAx3/jQqR00=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lmxaEbcR3IhhVn/QG1IEzmGf52QvOySyC7xFwIziobK7oM8hw
	/Axw1cSRz96hZ1FCQmeAERglXlf9nTPT/ZyNJYitnO0bi7+uwaVPjrHn9Cw6iT9Wduirp4SMgfG
	fZ5b+hzycuiX37aKtH3kQIOBkDQ7VTFehUQPqPxu90uSgQHjD5nie3dr4wSBhrm2r5nNhsIhqsr
	HnGSurM4vloPNCkhQAI7wVQZhve2siD8JKzy4i3VY6ryRvESQUYQK3QtdlokuH9EmmZab+Y/eF7
	7xDMMfzLEVwlP4W9tRTgsqW
X-Gm-Gg: AYBFou00HG7jSJ3FD6URwhj9iBU3qw5H1r1cC3p25RzUYRlbP2v+8+cO6bMtqA2yxx3
	oyg+jfSiNBVC8mCRtMIdAKFBRmHDw1Gy/7GNYO+hjOhd7G7oQSpPbpw5/KhkmIlc6vIBEpaDM5k
	+nZZNKprH21ALgD70hGbtqkm2qadWDH1XZixIN+nEnao8Q5rqNDx9sLnDajQRCJJJkE8Y9hZjBX
	s1D2Ukfds83PTTMFXjzK/1YJkRY7pijsGmGGtKy4V9cGT/GoazonBCISgu1cepsxq5OQRMtNf4M
	Ucn5Hsv6fdSc8dkTVPMJZAF5+3xRCGPs8j/7TtPNDDEgtYSTACb4693D8kU6LmAblX20xcXIlCy
	pC2/giMhthm90KAzIuJMVbcU4iY7Kfvm5kJoCqp6VKXz55/JFvno24d5qSCQN3Iap
X-Received: by 2002:a17:90b:57cc:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b1b0cfd53dmr2630114a91.33.1794627587947;
        Fri, 13 Nov 2026 19:39:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae999e55sm5695290a91.7.2026.11.13.19.39.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so1221561eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627586; x=1795232386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q+rNL4+kMH5WgLqhm6XoPTnEPb1gasQ3ZKASdNBy/w=;
        b=SDFRs/j8g4/06YhWFLqs8QedRbXW2DtCqiGU7b62dfYehxGOBkoGNm0k1NhYXmxBwR
         Eyud54ZHdrV1F6CVpDOznznJ3vEHZ+0/7siXxTQdLJNUluOCCJ86hlai1MoVge1VcGcG
         s95ba3o4cFpRGrAM0uBLJQFQIip+xPkO1PpdQ=
X-Forwarded-Encrypted: i=1; AL+hErFJlhJa1v7NhJw0ycXjM9xU9FV3+M2zeR9t+zQDjx9nbVgfMrHclq1OemBWrB7YhT/AaN4OObbRCBOo1ew=@vger.kernel.org
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720452eec.12.1794627585779;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr3720422eec.12.1794627585050;
        Fri, 13 Nov 2026 19:39:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm12603206eec.23.2026.11.13.19.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:39:44 -0800 (PST)
Message-ID: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
Date: Fri, 13 Nov 2026 19:39:42 -0800
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
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
To: Brian Masney <masneyb@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
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
In-Reply-To: <179358503716.355577.9187303706042543606.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/1/2026 6:03 PM, Brian Masney wrote:
> 
> On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
>> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
>>
>> The timestamped MDIO write series [1] needs the reference clock the
>> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
>> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
>> a compatible match, and mdio-bcm-unimac's clock-frequency handling
>> assumes the 250 MHz of the STB chips.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/af7994af5228
> [2/3] clk: bcm2835: register the BCM2711 GISB clock
>        https://git.kernel.org/clk/linux/c/ab94dbf30233

Brian, can you also take patch #3, or you would have create an immutable 
branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB 
constant being defined.

Thanks!
-- 
Florian

