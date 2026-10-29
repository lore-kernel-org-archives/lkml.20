Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294540;
	b=Jdb/GrsuCAORZq+IMNWPxq4xjFUmH86GZVvq+hDo1W9JH4FI/cs0kBIJU+4X7BjKlzKB
	 u0IRTiEwCYQl/u57kaAwG3cc5lfdT33/6Wb2DqKmkH2sBoXd5bFGVT3TSnaC7wlzxHKzH
	 6roaThShBFov5He3/QJf7AByexrsbm/yrpD0v9jGN9XIFxFQ/pCU23AN3vX6zkHddDLdN
	 pTN6Msh0gDcKYDu0aiyGPFbXeSPCzUIgQCNJF0n79iRSomNBn83pKTDBxQdVEZJmXktN3
	 tjlv/OA32SwdKsDBz4VR3p+cjR+z8U3Hoan+y9kClj1hHvGXVxCROtD5BcjLj1eBm8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294540;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
	b=uL3yJZPccmvZTmYDTo+A7BvHjLSTHh8Y8A+dbz09TNZAIJm8zuxBdVd2tDP+1HJbyMwt
	 AzWg/zAjeE/E5OzFNfczScQG4utIIbG/9BO4dK7/JnDYMHVnSmpSSv1FMXkS8B4+7IMVh
	 OhmWGgqwiQtf1p1axp+RqdJf7JU7Sk02kl5XDGd41TtnIZ7LtgRkblnrJMRSKc5NBzkR1
	 UZ76ws94WqJUgIrf3SHEqBrRFsK//84zDFtgDRbIOMlNLCSh3OlqJqlughdHXOqHgV9hD
	 pmnYqCTr8xOmM4LaazEbRjppPO1bKR4q/0ajaWm0r1Sz+kHy38o8KL3JU9EUs7L9OiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="hp/Xq3oM";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39509606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39509606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hp/Xq3oM
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1560368a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294539; x=1793899339;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
        b=ZTtzLYou1Qo5ctaq4gwM6q6lkJRns4QK0IAnNDpcYtjwWO+R0UlWQBmtHAqdb3+Bin
         yp9sX7vV+I3v9TInC6F/9kLo4mpIEvkQaz/rLcw02BDlcjm8p8lVwyOOQuyWZXWW1BuR
         C9UTE/axfcBP6A1hm0e4PyXCC3TVVCjjPVeS7SqgDUGM7Qm/pwBDsAfKzlBY53uh8EVu
         Bp/bUqWV3H0a3tywJM9qeNfiPvkw6MZ9na2SrQspTkoYkJTDRKyy3Xawe5dIZfFls7gh
         ypxzFbKLw+tMKvXZKSqQPfJ58xaAR6sNH2Ox+OY1ND4edjBGriifioMs/KXo5Qfl7yFv
         uB/w==
X-Gm-Message-State: AFq9FYK15gENrfQBddUsjBII8uT41qTrxEeQ+U6jyFJe+Mpk7bbNf1fc
	APiRM3BvcU/Cg6BrJ80P9XNpJeeo+y/ObPkpouV8dxg3UJ6JE7Mb7jVyLB0tYLoBk0nE+NotSgh
	WYOZ5DwelOKLnzsMcpg3lWa/JSz+qg5G86FCjjIozHB+9/hvYZYK2ZBDNj5Ltnz6vDKZrqXQEh2
	3afj+DN5xIS9ICQOw7em25PjJlbsbC9X++ez91FKo80UssftIJSU1xqsXi4qEnW33LVUqSzffDD
	DOvzwBm27QWbOvaDkxHY4AMXuE=
X-Gm-Gg: AYBFou0yOSmsg2vmUUXkrJ78mpeChzYRrJJ+o4kLFK5jU8Pcfy/zRsxposv1YAcpSqB
	kJENlRLABo8k/26/715VRpKSW8jh/Z2NKrP7wR9pQSDqYatL5hkIMgSNher0Jf+jOPMJWi/yYkL
	lcljQTVY70ISut0qVe2NGpaaPCVclrGNZp2rVTXCIsoG84wFgGmMBA62GiWJAZx+NRIYETEy5sk
	ClbQzfAdWYgtNf7MP2McHmTVDXA1dhldZEUsFwFS9pmftFgpTCsHdgu/MaZ//6EczleM/poZt+w
	6CRkW0fk+eBR9tcDm3If+R2zGjiC3oL8NqVfDkgS6SZAHcVZxdvAFQLzh+1p2v2u6HgKIoJh3on
	9J32jYsjgW8ZZ9DdvBs2fzIjcEHbi1Vz0bV09VpSrliUeEd5r/N1nEZZGrFT6jn5pUTRVYHrHkm
	NNjQk5dE6PcMPqjKFfm2NkzAFFpvUIZRBAtCtkgwcG
X-Received: by 2002:a17:90a:a381:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3ae8410aed4mr397504a91.22.1793294539354;
        Thu, 29 Oct 2026 10:22:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e84adc9sm2346906a91.5.2026.10.29.10.22.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:22:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so405936685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793294538; x=1793899338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
        b=hp/Xq3oMfrHs5VzOo4R3jRxIbcz0coLDq3eL0oGYAJWYCkWvfz5/AsQVGJLzLXDiEc
         jx1VFzDz3O+w/E7NUXU0VzD9htqtrRZTkS3VuFBm+2PopjkgVvbnjr/pDTEjrV/Jnq/O
         BX13T8cktUeg/2g+XmgFNVcVZJrLZupzpVGWk=
X-Received: by 2002:a17:90b:5903:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae57e2b52amr4762312a91.6.1793294177292;
        Thu, 29 Oct 2026 10:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae57e2b52amr4762297a91.6.1793294176832;
        Thu, 29 Oct 2026 10:16:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm444813a91.14.2026.10.29.10.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:16:16 -0700 (PDT)
Message-ID: <fe8b7acf-b495-4202-a5f1-51950c55c037@broadcom.com>
Date: Thu, 29 Oct 2026 10:16:11 -0700
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
Subject: Re: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
 <20261026191618.3178830-3-florian.fainelli@broadcom.com>
 <20261029-versed-automatic-orangutan-43cfde@quoll>
 <e5c4ac0a-f5de-42e7-910a-cf2c9c4cabbc@kernel.org>
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
In-Reply-To: <e5c4ac0a-f5de-42e7-910a-cf2c9c4cabbc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 01:10, Krzysztof Kozlowski wrote:
> On 29/10/2026 09:09, Krzysztof Kozlowski wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: brcm,bcm-nsp-ahci
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          description: AHCI, top control and optional IDM register regions
>>> +    else:
>>> +      properties:
>>> +        reg:
>>> +          maxItems: 2
>>> +        reg-names:
>>> +          maxItems: 2
>>
>> Please move entire allOf to the bottom, before "unevaluatedProperties"
>> line.
> 
> And you already have an if:then: block, so this should be together.

Will do, thanks!
-- 
Florian

