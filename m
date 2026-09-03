Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806F5111A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465531; cv=none; b=RyfilIzdfpHaGojHUVTiBh8VCrfdg4MaO1rB0E5fGOnkGj1J+RI+koYw0Qd3OzgPMZZkZnCm9YSSZMjzxpoLM0ePYSf2C/wh69fhtwltxn1Lv7RuiCl5oFSz5YFJAZl/31gRukjbBgk1h88l2kIFxr9/HYtjvIDQ0GntQzQKJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465531; c=relaxed/simple;
	bh=uDhQag32lGRQivC4a2W8BJ/uM8AmsjMofr3iPBL2ud4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx5rgwvK+mqsnIdPUc5UZv1G4HjMqFABvVrSHaVNuS/PonDbAK/rMoiiF08NMta727FSUxy2LaMsKBZabneBFxNi9w6HrGqm8D+dkon26YJfUxusCVoudRcnSFMJMDtU7XYohIAUBQFhxfKGd0BkoNaIm2T2Az0ewc15tycVWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GxrIiiXk; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GxrIiiXk"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38759bcd877so210792a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465516; x=1789070316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=khFuOBkB1vjsFgU/yUzBAHiABtuKryqUSfIss3DInIA=;
        b=E9988U2aP6v8omOB7W6rnh1eYgWtVgj9JpEDYvdeZ40xDrGwTervSVQHceuvBpcZTW
         FqohLbETyOo9cZCrgUfHwHNBLgYZvSGF7S4DnGlQW3XQBchdzFWkjutcOZpc+cYHGhhc
         nqqaguhkLdFCbULfjWVDAa5GGZmYwiIXRJpRbS1q22r0SpDYCA0Rkrt0Y3fB0+ANf79M
         PJG7yCp98CfzMzwIRmmb9ULPOzOlkzdSbcOjXVncn2wpXTHQgPwm6uRhUUlV4NpBDZ99
         sZb0oQBYR6fgyloHIDuQ02yvavYXkmORR/l0B8a7KtnS1OzEzRL+QuKg7gTkGnUHQBkX
         9G8A==
X-Forwarded-Encrypted: i=1; AKwUvBx+b6+IVdH1AtFbqFR6peqAchq53/eJsHoc4ZNU3rjn6pzNkQCItrsfgfcAM2FAox8ZOucpwR0UxuZ41W0=@vger.kernel.org
X-Gm-Message-State: AFuF++n4vNjZp6Df2sh+P9mY7xIvV1hFAPFgN8YobFvp/doenOaSwQZO
	ag8b5uggVle2MoCkXxXq1Ly2scLnheynzkBV3/cyScvD23RjHrjemVehKf1fmKc2Bj1j4ABtSMq
	ND65VzxXVEaTZ5AeJruDwFsGmeAqdF0LbZOVNWEslzN3hoTOroEhpoYokauR3nX9cOBj2bG8xt2
	ENuwHsgdyAB0LoDtHjX6h1fMZRGDI5hR3pYDgUC3SkZ4bU1Gdw4RXGotQFUNv4mBXHrjjCe+8mS
	Lu7/myopqYEQv2t+lavD7C7
X-Gm-Gg: AYBFou1HNydNignAP5iDEisqycYcLCfwSTaFuSpRqZM/I2d1AViuEzu/fTdoWS1WRKS
	8N06aIz0ODHSM5CgwVuM6gUklaQEFmwrRtLku1H4tP+j93Augjf6KsIZrq6IZJlUi41rfmtT8cw
	OQ4rqW2HlsaDLs0GPkEurAzCV1tUgmflFdSWhR6vLOxAL4Cbv2DqRJKYLaGwQTfGHiqSju+ltpf
	PIXKIqVELVXcG7XIcBjTpqzvo489FLC83MLdyWYjBi2c+/67vKng9aic+8Twa5101rm/rklxpR2
	QgV1EEntS53nVLj60AUijCQ/sUhVaUlATUPBf4oSjUK47vNXg1orT2V0rYjw8LAMl3GuvBf/yVT
	EVd5VaNgjTpid3kNzt4gLG9aWDXJLky0DCW75vSdvWmJIKolDRxrFSnvobVuRTBSqkJApX1GGV0
	t/Nj3+QqopFOgnTj46JIdWOkw3vkVYJk7XDJiusOIzmJc=
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr1351128a91.23.1788465516419;
        Thu, 03 Sep 2026 12:58:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b261435e4sm171219a91.7.2026.09.03.12.58.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:58:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso52208685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788465515; x=1789070315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khFuOBkB1vjsFgU/yUzBAHiABtuKryqUSfIss3DInIA=;
        b=GxrIiiXkypQs9uG+EMpIldZqjrY9SpIchwoAZ94W9buBdH/k2Mys0l7t62uxRLymsH
         Tv//SyvFJRBZoOH5oJ1EauFOrNb15V9mECP0k7QwsigLE2+I+AqWVZPB9nBo2aUQN8Mx
         zGJhZ5yvROd6kROOG00vsf4cQL6acD8FucRMc=
X-Forwarded-Encrypted: i=1; AKwUvBxaOTPAZZNeJtjbKm9sR/3eTd9OCvlD25gdpgk87a8FNSvVtotxM8mOdbikemrf7LzB6dUe6ETAUsjbHf0=@vger.kernel.org
X-Received: by 2002:a05:620a:450a:b0:92e:8310:7369 with SMTP id af79cd13be357-93980729fd5mr85822185a.37.1788465515203;
        Thu, 03 Sep 2026 12:58:35 -0700 (PDT)
X-Received: by 2002:a05:620a:450a:b0:92e:8310:7369 with SMTP id af79cd13be357-93980729fd5mr85815785a.37.1788465514680;
        Thu, 03 Sep 2026 12:58:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm45535685a.40.2026.09.03.12.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:58:33 -0700 (PDT)
Message-ID: <2c71e79e-af7e-46a8-ba2f-4a89bd68a91f@broadcom.com>
Date: Thu, 3 Sep 2026 12:58:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC68U: set WAN MAC from nvram
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
References: <20260805190156.6942-1-rosenp@gmail.com>
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
In-Reply-To: <20260805190156.6942-1-rosenp@gmail.com>
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

Also, enabling port 5 is problematic, see this discussion:

https://lore.kernel.org/all/20260831085217.391-1-strst.gs@gmail.com/

This applies to all of the similar patches you submitted, therefore I 
won't repeat this feedback.
-- 
Florian
