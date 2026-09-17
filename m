Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894E25B0B8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603261; cv=none; b=krl7VySyNOclkfMbmfyyBs1oiig+w8eFb0Z95ttkAqk+QZOflUzHQTxwDUCZ+npfsGtstMJuaH6+r0fHwr1FsC0w75Gkb7/bjQF8/eBzggPs732ZX3wY6WtfD/f9yFnnjQnWKwc6e7rSqJUcYsLSZkyR/+XGsQxz5ohpHqDMzi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603261; c=relaxed/simple;
	bh=IdWYhX7fUEenQ8Jfb3hg51Dx3Sy7F5AHXQddTv3Adeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l44d7ZnAl7qHMksosz4jnUD4rJjziKjJahJQlvvjASDjBvHwm1yA7ox8BkMiURn2tXICumKvjwdjtx8q4YIkglObDdWF+rA7s4aDLXw6ic9Xjn/zIfwZ7AqVPGwhPgFdyncXqzbIS6Ia00LimvYjpAo/g6ek8bCo0/AeuOb0dpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=csCSYJmU; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="csCSYJmU"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7f432ac553fso96887a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603255; x=1790208055;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rnYsw47RhsCpAUpS/1U4sBUyj70+B1dKJy3nD1W6Sig=;
        b=CTRUYMXk6Zqj9rklOAWmYKr3NrZtZjW5NpPMv2Bi7/AA2YA/CF86xM/u42JtRNW1V+
         5Mj/yCJKp3JRna2H90On/joye62wxMD2P00yVQCk2e5c6mQA5DWO+somdsk9fAp4T7D4
         I8wiBX2TsbVHlD2cRC0bk8u5285xyQDyjeIiaaE6jRZVwCvP6qHYgOByRiNvcstVHsXI
         ZjnR2BQQnjXOMcL5OB/YsyU/S4OClmX1UQL5P6RyDJbBJoJby7wzTlNy/5PY0j/hzO5+
         Y8jOJK5E3brmDkUgn55I3DqdLpwvF6SiYRquuD4mUTSMEiisGsAzB5xLzKgb5aakWi6/
         pX3Q==
X-Forwarded-Encrypted: i=1; AKwUvByJ9qa/y0Mueo4pHqsxT45SXgMwdms+XsaS/6i7tPx7wMA7XcfEbBYF4895v+GgZ7tJNQKDRHaxZIZqsL8=@vger.kernel.org
X-Gm-Message-State: AFuF++kHZNXX/aiV1K6vIECkKeAAqfE+CDc+IbmogKa1vAyAWsSZsR9a
	KSWyBbqYJsF15XV/1TEcMm0ddpLzecqbmi2Yng48l5E7zwZ0l8TND98/zYNT/UvM+0ok5wF2ize
	XM16O0qvI73gJCCfAl7bfdD0YqZtIAftQ1ZriPgAYns55cx31n/zueehgJOr6YcOQe7aSVrXzDu
	4J7NuN4KqyTVo5FrQJHPUiAmHWfd7ry0G0qAf8owzz3kyeOq7IFND4ZTTegVZjSa2X19XmiKUKK
	TLqlVJaCT2n8GFVuTYnVvFu
X-Gm-Gg: AYBFou1Fq2a/bqpKBE9/zBH80vE2fxpdsewYlk6I7PiUZc+O0sT5US1+6DGS6UU6qE0
	DMpyBUoTvysiejMRD+fXT1aW43ISPk/cxdaeCfd1+VMCunUmXbppVMNcEA6Q4Wc6A8Vf9Z0uPXb
	nehAYsoG6uVpjSWaAwIJ4aOfFTUpY/lwrpmY0Lvv6lU+Ui1gvb+fBhzSxq25fuSq9gJa1sA/Kte
	CKtFty82obez56kEkpCh2MVFOQxLvWus/8zcsOual3NVrOSTSdzHf6/zixyKqilqy3QvIBQpL53
	eiymaFw+G239+AkFUKyPb+KzPF5LOaMuWSSZ4EIO2pmZ7tOa3NFqzZvCeBqJD7ZCoyK6ZbGsppP
	OwZDLeqKhZE2BoUibndr3Yw+4MTkRf/slQQTuoP9m2ET1e/9DAb189TFdb7ckHKp6J8xYDUp7v3
	fAEPDhgRPHlkIpM9Suc1D/0OvjjcxBiXJ4ooPrUFT3FfM=
X-Received: by 2002:a05:6830:43aa:b0:805:b3e5:18d9 with SMTP id 46e09a7af769-80b2df3d320mr9202890a34.10.1789603254717;
        Wed, 16 Sep 2026 17:00:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c470bab23sm585272a34.8.2026.09.16.17.00.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so314021a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603253; x=1790208053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnYsw47RhsCpAUpS/1U4sBUyj70+B1dKJy3nD1W6Sig=;
        b=csCSYJmUSAD4KZ4z7qC7RSiXsYs1Trhft/ZmruAk7tejF5SiZ1vEzVj5N1R+N2g4DC
         NpXY42H8aO3mTf9sTYnNuhN7YM5cV7H872sw57/yFW+d0jc//tmDUVXjuu9hIKiiLbHZ
         CVZfwN6G8BLdIPGKywsYDAPMwWzDb8U+WjrrI=
X-Forwarded-Encrypted: i=1; AKwUvBzjO4rh7a20ec15KNlDG4HGSX0Par1QITmEZ9NXzzqbii4qp7WVi93oQTl6DUU3NG2i/al6u+qH/Jj/4/M=@vger.kernel.org
X-Received: by 2002:a17:90b:510a:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-39e1e24fa7amr14368872a91.1.1789603253369;
        Wed, 16 Sep 2026 17:00:53 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-39e1e24fa7amr14368771a91.1.1789603252848;
        Wed, 16 Sep 2026 17:00:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21263234eec.23.2026.09.16.17.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:52 -0700 (PDT)
Message-ID: <f93d3063-956b-432d-a106-7b0e092d8ef5@broadcom.com>
Date: Wed, 16 Sep 2026 17:00:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] PCI: brcmstb: Add Broadcom quirks macro
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
 <20260911233541.1650895-4-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-4-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Introduce a 'BQUIRK()' macro to shorten the calculation of a specific
> quirk's value.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
