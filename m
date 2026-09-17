Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0F28B4FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603437; cv=none; b=SUQAdjxwY5SEpNSwH6z4VVJDhqgAcHxd/G9osa1gq3o0CX/41ku3pNx9bSzQAb1/SrlHIBky3esmriiaUeaKccZN3QV2ioULPPHLIWK1IRexE9d73SNVWfd2UhFxK08NxtXt0LSK97U82UUIfCNQhpeBiyASUmVmaePE6b1PZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603437; c=relaxed/simple;
	bh=0hZNfIz1ZuQ+o/BiLmL+UDToXwEhaeeHbpHh/MVO44Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQRHq3Y449On9poGf9fZix8HMPP9VxnCZgzzjxtk75R+MpLFfNvT83gP0bpsDtwESEHpYtOuvGBX+CPP3k5QjfoEBbuOHemhhkiEDajvh0sp909pLv9QFbRaOfYSKqiPecpHDWCZQF1YUGS0m7gxDx4UCTsNGDEc+NlpMzk/lT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fu/8r9mR; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fu/8r9mR"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2dd665f341aso1375185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603427; x=1790208227;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AZKUQlfoC/8Hz5OWhXA97Agge1eLf/8U2Rh0h/dSQak=;
        b=Uv3mCBIByn5ehkTVpEoowSaGOZeSrwBoyphIyNAP7RfGXIoihf/qntHyLKHcnqVCwj
         RLkkiXNh75+bwF5NavacyapUwFzFuJ+vhA6+ZY8W2wUPQnyGMYB2FVMJ2JFBjiuKwzXF
         vBubQUR01U6Qp+Mk4VKfmY/+EUGo+9CzLnhY0cyDFVjlFDKrkcreZ71Y7fbshqHrKwK0
         aRyGGiPCzlOzB2Ue54G+ZtDpK4A0zM5Kpl5Owy9mIrD4Ua3gzUWr80oZ4LGQQ0CP8qpY
         TkOJAJgDKN5N6gr0MMOAVyGwQdvy/wjzxhbTHHQtNhIW8FyK7mvjzT5DZB/pooJfTFdx
         J+DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMxZFMIcZMARMIc7LsAqwX9vSP+1SDrHVCkd+7nSPnHb7QBDcPu0fqcq7WiWXDp152yBB7wNi9CvoVR3I=@vger.kernel.org
X-Gm-Message-State: AFuF++nZYws9AoPiOdVPBMkb7OTDCf+I2pIExoOYXoNDcdEcaTj+Eb/2
	XmJQOnWYROVf2Na0G4hPYm9yHDAuGJCyc2+bUHZcBUYQtxchLUe8Fg9FLQ/aFg0/Nl88wrIGr6Z
	hTV4u9RX7wSl7OsggvH+s+/rLrU5WkyFRzpSnMC6H5d1JFUFqIuDEGPnr7/PpMukHJdLZDP+4ZQ
	iKpR6CCsWYu1kFnQfzWnBAcGXTmFSK/3BKZpQCIPN5TelbchItmikhEjtQvwQOfplVojwL9xUgh
	dzwN+jEKXMIG4GbdxqkTcps
X-Gm-Gg: AYBFou1Fv1thDubirWk1atNkt4a3PTvQ0cmZRcQ1Gda3r4ajglD4tofheFwFvLIswuU
	kNePWxewlLxV40242fLUtcjqcMlRUWZBrh7YyHZppJoovBoDQ4LtUEV2GhLDH07WEcMojl7cotl
	3Ol3dRAlRgAoVTkBneOnn4evppg7EmEjKqXQMunJYPkBQTe/AjDiTzmBwIYkisr3kdzehnWplZO
	alc9trpDcPNHOmm7aebaQUW4wuKQgbpt63XAb9hNHXEI65ZQvjlq4Wvpw0pS+MoEyUj+yIYWNnx
	5x3zOVyolKW0eaQ+HbP8VcqXw/jHtTRFDhIvtZbw0XAvH2EkNPf5jLOEiOPG/FqKVqJb3suGSAm
	nPpG6Hu95sCKnKogYnuOPlZDnK232+pHZin2+J0qbWb69Bq7KbdRSJWQsE830WSoT5/zic+aud3
	p7RYcVZqvt0FHOlWu6p7xyCkbZSA6jDpkvqxMTiByKg+g=
X-Received: by 2002:a17:90b:1b03:b0:39e:3558:f925 with SMTP id 98e67ed59e1d1-39e3558fa6bmr3360104a91.24.1789603427361;
        Wed, 16 Sep 2026 17:03:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e390ad594sm87445a91.0.2026.09.16.17.03.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:03:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so600244a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603424; x=1790208224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZKUQlfoC/8Hz5OWhXA97Agge1eLf/8U2Rh0h/dSQak=;
        b=Fu/8r9mRgOoYrsv/SXlgofssUTknQJHa+6+UoZujunEoGVuJ7qGp1o+7jDPFZdFdLh
         3fuNruEdg3lryxAkUvxt9VMN7By8qaHxG+6y6tfWWgKzaTHWJUcn2/7JXp6lgIzuc2IK
         qIEM7n0qIYrPrGPvyDn5ERTRe1M7SNHyCfmQQ=
X-Forwarded-Encrypted: i=1; AKwUvBwcncrtPU2oLfrhHYh+YKWe3ehUX0AuxVu5El6blFxC53rqDgqcNsVyyM9km1pKmnMnUbfcSV9Nue6M+Zs=@vger.kernel.org
X-Received: by 2002:a17:90b:1c0a:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39e1e2cecb3mr9562735a91.6.1789603424204;
        Wed, 16 Sep 2026 17:03:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39e1e2cecb3mr9562636a91.6.1789603423446;
        Wed, 16 Sep 2026 17:03:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21282976eec.23.2026.09.16.17.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:03:42 -0700 (PDT)
Message-ID: <073070a2-f46f-4016-95ab-1c407b0e632a@broadcom.com>
Date: Wed, 16 Sep 2026 17:03:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
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
 <20260911233541.1650895-7-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-7-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/11/26 16:35, Jim Quinlan wrote:
> Eliminate a function that evaluates SoC chip IDs and instead declare and
> use a flag that indicates the SoC employs a CPU with a variant of the
> MIPS-1 ISA.

Uber nitpicking, but I think you meant MIPS32r1 ISA here, MIPS-1 dates 
back from 1985.

> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
