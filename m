Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59539902B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775581; cv=none; b=q9b3marSjV8RXHYb4UUrU3YBUe21EQmgdDwD7Y4+/+I9OdBCGuUkLg6zUOGMmNAokcN1hYI1JQGpNx2wk+iuWEoXaHbpUmBmC0FBnrl7r7UqblQk2RsXVai9PJ4F3dB6pwT3v3HizSowLnBzBka4mgbcWEpNHSAd8dtqMqUj99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775581; c=relaxed/simple;
	bh=JGIElWR1TH2NMfiEhiBJgGaDbYGgOqDPtEOc4C1/2D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9AGg9XFzU50MYHBi7myQvprk4vAo9JhXigMxumxiywQYkR1gCOnO+kHzkafioGqqXzp29HoqNL/IBLgytTOYYq96H9rMG+6uaCLu8Y/AqP2JzcTovDBbvvjrv4+PwtNCMGPnKYDY8yatrNgbuZD5eR1RAHimYWGq9x9DDfmXag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y348zVtt; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y348zVtt"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-381b831d535so2429962a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775580; x=1788380380;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=ry5pmMp8pW48yz4LHQyXuSvYRY7uvm+gPI2u3cnz5ZwNB+vJK/aY54vKLqeu9ac5be
         dZKGR5LWBqGuB5QW9XVoklTjj5k9osdVMmHZyjdW5bC+bkqUhTNoBjGBvmC8asTx3fqT
         1o0xRqANcYOAbf/mrWdb9qNbq5YJiMuEnGjsqfB6BK6R3dq0pbcPEqIScdz3KGz9MF6c
         YuP2LCbIhfHBYiN/w9onN/aEMqMGk9modxD/f/3mhNoUKBAar+L9D4Dc3H6zK3Psppq4
         ownXtCOFzHNZz+DGHJzyUSE6WTND9aYB0/lQBISAqQFsyL34fFRc9EcCKWOp5jXHABER
         Sn2w==
X-Forwarded-Encrypted: i=1; AHgh+RqCnQFwW2frDBWv5/UGp8o2ehG78a/jfk6zJGkEIm7rBCTduZ+l7+iemvmClyta1NMO4Dad8ita04ttKnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVxYvBLlwt6AqiMdqeb5d4a4xk1IV4rP6fuJs8Sz4Q1167VlGS
	L6q831L/pt4ifdm0WwgW8gS5fJV1716a9vwiGwgk1p3M/0MmjXsOztoiDmSm7F7+Xj5vyBFf6kr
	KcgZVU3ohksCj8JDfow9loB92KVSLjsAXtIWsTELGQ64xR0W94Y9yRIp0Hf5fL0GAOzj5KoQXdu
	Z6gqcNMuEcRMAGRydPbPAQDsukWVEej9RrJnuL7sR2atpSxE0Mpxg1d1OoVT93ptGUqMDX8uwC4
	PE9VvAP4xvMU5Zhwb4uunVr
X-Gm-Gg: AR+sD10/5G5YdOWYeREkA50hOHqAenT31b0CpK+x8I96C4mSkOJ5muhWHyZE/6ZCN6o
	f6zNk/ayEfRdc+ZvTyGSSmCajjJBPd7SxZjtEgUQpL4a+wQNF9fmmR52gs0bDeZXhmzX4ghKEiK
	Kk/ms9Sb5kkHIyT6RNeCKKQz+hG3wFJtZnFjluFzxXkQxgoFiQi2JGdNR0pNNl1t+uiY30Ev9Cd
	G4fpgBtdhxBcSCRaYLLoKxVii7fV6VyXa7RvVttJeboFpxnbJbSe3vpVtxn6aaLMsT0rhNNngUU
	Sq/W/wNJTaLguYBkuXpWjKrkOHZGKVgeKCcSsw1V45fzyxn2v45AxSSxc5Y1TR76ciYOJLcQuLl
	z0Yctgv4y/u90XW3jmqsTeaif6W0ewblAa3TQ8Z2K4oK7J97pZptY2e9ImNC1czGQbzRJvV6nS5
	5r7opWLMuc7DLhAlnytvmH9JSAIFsekvz/gjx6Nx/2
X-Received: by 2002:a17:90b:1d47:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3966d733a1cmr19758728a91.12.1787775579708;
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396a78d9572sm21076a91.12.2026.08.26.13.19.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so33067505ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787775578; x=1788380378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=Y348zVttR1HXESxkrChofkY22Rs9Szo4Mel2Ne4yJ9ZBkzFs+EPgNTFPZceq4jSZpY
         ubj+t7LV/sAVUDUiWzSMog8hTKNjSRDKB4hEi+5DmNA7Ex1xxVc0ec1+YkKnjQHl833a
         0vjTZJjREkb2deVxFfCe/PgjMeVH47Pbk642A=
X-Forwarded-Encrypted: i=1; AHgh+RoKWdecL67M/2uYIPYPcea5scZM3+kNdCFwt1+8dpNxU3Ynl8EtzpZzNZPxhhloeOVaWLVhYEvnhTIe/bk=@vger.kernel.org
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182678715ad.11.1787775577871;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182677995ad.11.1787775577440;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm16611574eec.5.2026.08.26.13.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:36 -0700 (PDT)
Message-ID: <e073e341-76c5-43c7-9e0d-e7b3f10007f2@broadcom.com>
Date: Wed, 26 Aug 2026 13:19:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
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
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/25/26 13:56, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Only if you need to re-submit, would you mind listing Jim and myself as 
bindings maintainer for these two files?

Thanks!
-- 
Florian
