Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96149503BF6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465451; cv=none; b=F6GIgvO0Qlb/SX79NEIYUxzGnW2FbIEju6oX14pbbwBBDZIc+Tqvyjg+oRqKSQhvOFmhqswlzNKHelQMOM1thKxWotwLuvlRV6ImdXmuV2f0ab47Jl/rK6XJuJ/BfU1UjvcHJ6n/qMq/DabIpEyftcwB67R3ZMmsesHEXNWnFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465451; c=relaxed/simple;
	bh=GrcHiJ7+BfXxAUhzrvoXSnZzGEU+4x5jBw+B7k7gmCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U96wUBV1KXpRvGP9+REeOKzJqQnTXa2lfkjz/7s9N+XpLrc5hPTnZMzjqspNtAmcifXZLDrYp6kMWM09X+btTp2quXErGcBPyzBt6L6NWTHufvE6/mCwjiTHmsGytQCEC3CVOive1a7Quu0T6UC6UZa9idsn6mRAgRxRKSswSwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EG4dvvGK; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EG4dvvGK"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so243405a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465440; x=1789070240;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CG+3ejVLufbC+NpKWAEcR1Z6tEvzwvJUKgbwfN9xzf0=;
        b=jG5QSspC0nW1Rmgvc759O6Inxa4gDhvL+OwTDWuhZpc42WYAeXPi+Ons1ysAW465fG
         AUmd6C4hNgS5rydXRPTcwPn0gOiw+O8Cj57cWl0TaWlt+S3DxQh/mCvFKdy5Pa6wSinq
         OujKi4CCGkjZKHbxz8aO68sCcyOBiraUk+o4dMyy9IoII/y9nxfxC0w7MriZpFcwM+YI
         1lWtF8rfXOoMPuXYTVK9H13qZIrFY1H24NC338mnvNBbgHHANTA5kMhABWr/PtCeLGnM
         04lcpP+szDhdX3ytMJkCkaNi3ehfClsRIcqgCH7UILdQSMQcOLfDjnG3KV4vf5K9OueV
         T5Sw==
X-Forwarded-Encrypted: i=1; AKwUvBzg6Z6ZMD5wlXVgVMGpP3F3Qz0ILiXfHnUeQ2QxIbchXo37snFBZPKCeuYkOx+BaxP2Fxrp2Y6YpjopTJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mJaCzOYvS3KY07lsY0sk8uVt7hbzRi6xw432Zb4SHh9vP6sFDl
	/ZdfuIYZip/RlTfdeJs0eyX8ywigOSiEUnPRU+we8BNoODU/jTjSZGD+l8687QMuYqIB4frTSbe
	RHB4LlJCQs3v6g3PzQDvCpsZZIXUw2sf+IuIcNpoJMvgbD/WBJqauJKb/MeOXxaLK9pHITdmXrO
	HFY9OUpFVrcfUFhFhMUednUDtUVpgughgo666sawNcmvfEgyCP7C5hAyha0ojBrITL2+9oaMBLl
	eaLhf/+SDSFJbldHYEPDs6H
X-Gm-Gg: AYBFou21IHQWlWYAn730vRTLP5ORNrlQYevKdsbPXG7+uRT3k5mRPr4ahPLMvcRa1cK
	A/ao9rZLhhKww1u8MZh4mtUhgqfACok5EJJN1wTeRckueCDUzctANzg/J2wD8Pu3BUWtO9R5koo
	YT5EcZOWeJ924SKBvaXt+nmop+KdOX4xJ0WSJOICvy7Uad7L4aR/aNNyY2ASWgW6oPS1CzNqa1j
	qnO6ZWJtGdmxH9MJFhycHGIkf5gI6wVYYsyrfrh2CpxB5pSNWD7AO7ORF+grRzw4YkFXcssqAmp
	6P8Leyy5Hdi07eElG8jn8Bfpvtn1JeKWymUiKzcY9cLI+TtrVnX2k5GypJINxCxga2y+RWl7LNk
	tD/IgU7JHyfknW6lFIIVPwoNV35gm8k7VYY6Z3024Il9SKMCAKeuciDzaHpc7gx/nokCkWsCm0N
	FolujDBD5LkO4vYTd7pbM8/EWmczGwEJbL4r3VbVoeKIc=
X-Received: by 2002:a17:90b:4d86:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-39b26240e63mr1120210a91.18.1788465440428;
        Thu, 03 Sep 2026 12:57:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b1600a8fbsm1458720a91.3.2026.09.03.12.57.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:57:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so9389501cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788465439; x=1789070239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CG+3ejVLufbC+NpKWAEcR1Z6tEvzwvJUKgbwfN9xzf0=;
        b=EG4dvvGKUmpHhKsqSdwKcoQ6Sn+Slrmt9qgm8939IssUVsMmq1Fit3594d6Nwn8c0n
         aHjFhIm8LVjFHd4qxNBib/tQoIJ/NoWemRu6nbzXRbHy+jvC0zwHu5nDY5PUhU0da2e5
         XjTs4xjZDKlhhuhWhhGeEBfIimCKKRxoM11bI=
X-Forwarded-Encrypted: i=1; AKwUvBzFAmH4+I4l4se8G3Jnu/Cw11kz4Sgg9nTAlhot4lFPP/T7z4BLDFil5sBhE2Mohv1Apw7B5ATzv6vQB4E=@vger.kernel.org
X-Received: by 2002:a05:622a:1a81:b0:51c:d52:6049 with SMTP id d75a77b69052e-530548e0cb2mr14536371cf.28.1788465439069;
        Thu, 03 Sep 2026 12:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:51c:d52:6049 with SMTP id d75a77b69052e-530548e0cb2mr14535931cf.28.1788465438491;
        Thu, 03 Sep 2026 12:57:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664474sm2764476d6.21.2026.09.03.12.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:57:18 -0700 (PDT)
Message-ID: <b036760c-2b78-42ef-9840-104a115c94a1@broadcom.com>
Date: Thu, 3 Sep 2026 12:57:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC56U: set WAN MAC from nvram
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
References: <20260805190101.6773-1-rosenp@gmail.com>
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
In-Reply-To: <20260805190101.6773-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/5/26 12:01, Rosen Penev wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

You are doing two things here:

- assign the MAC address from NVRAM
- declare the switch ports along with their label

Please split this up in two separate patches, thank you.
-- 
Florian
