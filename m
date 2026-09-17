Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B412D0617
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603290; cv=none; b=PeOUlATQnZSbqLRQCNHUfq9bIP1gwnBrWZXrludycSEUcQfQ9atphsxQ0s8Kr6q+RnLffb3OYuqR8Vuk6aSH85YUsApvQ+wLBEOluNarlWs2yh2d9AF//lvG6l2BrkfKL9R9jy/yBmxoeCwXMDStcFw2VawQhldKkiMeHXjVVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603290; c=relaxed/simple;
	bh=havp6OXbc7alV/WLx4jLw++iHS0bqicCCYO1lAy6GlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcD4MYoExOV9kaXPNO8AkMDTc0nFDBpy5cGG13+rYd4+1ZbjEI6vwUQKZjBR/8t4Lz613UhSiga1ezNTOg7ajK/Dt8sCd2U8XEdHv70hxRz7SVCg3dtuHOaZ8ms8FSP4dTicXDI1/oi5tpGCdoSoiijdJFCSELCXkgC3h9+xMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eS4eVjPy; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eS4eVjPy"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-85a50f6a7f7so280407b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603277; x=1790208077;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=la3EFGPTmY4WhuQJZNNkENF+jYrhdOvMI5n97zyEnQ4=;
        b=K4+tJszbKmEgm9teKxX31tWCVnEu3GrQcSXW48uZp5554cgE68zCLCBsKFwiY/ieJQ
         tPKvFNxqR4Uc3O+ut/eYAgrvE0YIjvIP51rgPYWEmQk5gaMLDjnRTa4+23fPXujb5dDd
         NJTG1lIMzBWPnDWWsr8dDuM1KFEqGrclfThvZPtLEeUx5S8xqZm7Cm7nXvuAGR02oXrx
         msdf4QOpLOIbQopOTM6PtOrr6aZXUwM6sxNMAdvFFHV+RCZKCyMCtGppfg+KTl36J9jV
         Svpa3jeOZg0KaZV1nVSExizuCw4ign7vhWNrLQhd5d3C4Y64+G9bd5ZKeiqYBClpYE71
         UlOg==
X-Forwarded-Encrypted: i=1; AKwUvBzqsJHqDtpW6wuuk3mDpS+cfd7bHY9fkwDr2nGd1VgYPscZdkfmG1/u+FxbGu1VRF/aEFweA2Q/PRKevSc=@vger.kernel.org
X-Gm-Message-State: AFuF++nQJFtFHuFQzsGrBB2KMw+k++2wuIIx2d3grcw2f8RukLFGrIxF
	rNU537MKXjMbvf2858Y0VWWWUJjSTGGKo2jY+lk3KOsSfGfwqCWtv5k+wP6ucaS4g071lbUkaXv
	f6QLBcTcgrhTjFNmzzw8bpBcp3scz6jaG6yFgyFqn4YaA7SQ1e4RRPAi5EdvXvnpIbjVvnCCniK
	YPp2VLtuLsz6TRI+fADgnzsp5A8Xsgl69yhjXS9aARVYdBTAwVEViC4DaNm27wSk6lBVTlb60v/
	5hMm95KBxc6LeUx3zUNZOFH
X-Gm-Gg: AYBFou2/m6AETaHijDdoAtsx84gwyS1UVFqV4QJoHDj5T/WxQTYTAkdry5xg+bTc+LX
	Ex1CurmbJpDbV1xyY0B5ChHMuarowJJPcnY/3F+BfkdZ8eBDqp8UKw0DUObCBh/TWMdE7U1gcok
	JF8JXNu4Cr4T4odFJW7y3TQBTgWJEI08aOT0a+DyaSs6362FLJHJfTJxR9n+alsYc8+ovjU1gly
	IFYfKNoJhxtSx/+KUXIvb0xV0slN9JaXmZzu32fep35+lwiUYXUSn0kFk950sh4JDwILGk6iCAd
	Ha50Yqu924w3Ed5mvVIX9qqs6ppzRH74UOnXZBybZcjXvDQnB/8ij7bHHD3gY+XxixSG86/6XTV
	4+3GlrERGj0/ejEpzkRfDa/fcwgupjjxOE4SZKAlaQPLznR/ruzOkx625zZKU5o39I7ibfQf7D8
	KErxgSZVATODzmFydFiQgPY+z6OE9O+2/B5vQZ/B2f
X-Received: by 2002:a05:690e:1301:b0:671:5206:72f5 with SMTP id 956f58d0204a3-671632908c4mr1665048d50.64.1789603276952;
        Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6715fb7c262sm218470d50.20.2026.09.16.17.01.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4fa572ba2so203722a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603276; x=1790208076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=la3EFGPTmY4WhuQJZNNkENF+jYrhdOvMI5n97zyEnQ4=;
        b=eS4eVjPyxKw/2QfKUhSBrrfLHNi3BP1ZeAVZpGMGTUPiQIU/VtnGXhIga2UqJP+lzd
         hTdt+4S2sVSPvlI/hXxv3s6Fq6rjMvaULhDT9hyyg72ECCp96K2GWZJtc9BilDqSHj6S
         mn1abzeWa7mzekKKOt/WoP/+4RCANGWdff4do=
X-Forwarded-Encrypted: i=1; AKwUvBzeUVA8lHJkfd9Z74okgkca5+IgMVjcnucuYwqI3xwGpdFgj+9v7ZGj10m5atylHY6BiDoJ4s5Rh00BEzM=@vger.kernel.org
X-Received: by 2002:a05:6820:8ca:b0:6b7:46e9:9708 with SMTP id 006d021491bc7-6c7d46e3955mr4212755eaf.56.1789603276068;
        Wed, 16 Sep 2026 17:01:16 -0700 (PDT)
X-Received: by 2002:a05:6820:8ca:b0:6b7:46e9:9708 with SMTP id 006d021491bc7-6c7d46e3955mr4212698eaf.56.1789603275627;
        Wed, 16 Sep 2026 17:01:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm11174848eec.8.2026.09.16.17.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:01:15 -0700 (PDT)
Message-ID: <fbf36dfa-b3d4-4102-8573-1911814e93fa@broadcom.com>
Date: Wed, 16 Sep 2026 17:01:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] PCI: brcmstb: Declare and assign quirk
 OB_WIN_32BIT_ADDR
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-5-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-5-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Even though only BMIPs chips have this quirk, it is more uniform and
> readable to define this specific quirk in which the outbound region must
> reside in the lower 4GB region.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
