Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291655;
	b=vL9XR8VAukCP2jw6twE9pISS6vd2fh++8zC70zKzIIRlQYxPJi/pynlnIEN8MNA/ztSk
	 Wwuii1uB2Vwp2aQ4RSRN9AHXrgR4MtcIA2vn/HVgefdDYLoZRmATfTLNb8lfKn2XmbgXx
	 nXiUbJ+DNtqC9VpMh3VhCsYyW2LDRfO0GfCNjzEtWDSmy5/oin+xLlFOBootnweyYYNkL
	 pt7HGqOyTaln5l88yMTC5eCQ9RuuwXkLgC9Hfz20AVjzpRYL9o5PIdsCnjHW+vRijh0JR
	 bg9+GaOWBklYjRJPdI4FiwtskPGVH60iTHERp3wE2Q+aSeA/+zqqskGNiapLtOz4tSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291655;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=;
	b=fB2Bhy2PrNCMh2a8YTKpi8LvIxN0TdvTk04rVA/7+21XaTI1mGeK86Ft6ydpOOQ0aknD
	 MGsJAt7y7WAflZPVJ6cEo89BVlgnfXG9BioBh89Vbly8Ou9OWf+RZJRe78zoaenHaRyiO
	 S+Zne9WVhnozNL7w5/icv94rpWzTm9GySC149alFJr5MqEqc/+NfDH36UwdD3xqZbuNOM
	 ryzxSwVGjZFvTyehl44SeG7O/CwWVHax9a3SMgoKekvJdpSdc557Bc7uqQ+HQQWW7LnbS
	 Nx4609ycap5H5VDeErkSOX26rldwe5FkcPUiaTQH72RPR5Z7vOzyLuvZkiMNbhGH31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gkQ7QqdU;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gkQ7QqdU
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2eac4877accso9355655ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291654; x=1793896454;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=;
        b=iiEKgyQgI8ZOMhQ0Es4cJLWuxJB3dg1UmPfkXyexvpOMc5s/4XUUlnTqdp2RlEH9KD
         eTwgayYKr9eNnMct47fgWMg0WKKPLCxiCO8gLI+9FGGHgsLDk4Fj9PoE9V2DEqMaoRvw
         4vXq6Hd1Q02aXHHosapxxcZaH8mTvv2qksFWUNbDMKPUlDGGSi2xCscF7HqBDjgPGnVZ
         oNIko4CLZUQSMU5yvAhXXJ9evBRRiC7AsY+4MuXEj0SpwIwZm79NngX3v5cBxw1julnY
         KmMTk2e8DaaWeCXLBDvtUV0KRISmNG42Mgi8dYaz1QsEjal38Z3M8zqsTE9TewDFaFXh
         928A==
X-Forwarded-Encrypted: i=1; AKwUvBweOo2xvgo9DkChtP4z9CISruPwc8KNQcwlb2gj3BA9vurLR0AOhW5KN6cgwSF2ZVsJiJcZIBi2O7+3Cvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcHYLMdbo2wDmZyfIEaHiWmUQlozTRqRCk7LVKjYP/c3Ysqo7r
	Q+Rzc2JaXJFChhB3OMJyNA/Lta7R7g9xlyDgXPsW0eMzsLu5+YIrswz2sjYKOwxKUMZeSjxD9Rs
	vciUJS+HCk6mlot28/ABwg9n4czgzmqenpcnIDZjMnsGZlSGaU8g48rLURwprq5zaVWeWbj9DWu
	PImKyDIpNf0qWXqBCUg70NOXZTiasgvFPyIyZHhTWsowaHwz2BLBP23cHMnwFHGwd0eVnKv/+1y
	nmFAI3xWGiqyDYmdcQUa3lEl6M=
X-Gm-Gg: AYBFou183YXlTcLTVSMyI4W2lvNvOuMr18cdSbZp5by8+TLVeWqzM7tyPNNdVl+IEkO
	+cxhLNE9+sw505tyWS9JcfEUHLHxY3KGi0XLoS7O+zq+1K4IkZvUJ5XBWbsgnpHDRDctMUSDxsD
	ajUH2aPYdXMPrzm98C4NKNb48ZY9otRYXVGdzXS3RR4LYMa0154hOHIqOMeFuNz/dEGtZwg/qz1
	JLfMkxAfEHmIDAdMwSDV2Q9SeeLbvNNVQzvHyCxXQGjRhVsVZPN0tvx1HS8mrOaGCM2uGTSgFoN
	W0Ikva8pmq8cVJjmx3UP2NXajMErNI0jknZQ5eRsxUjG/T+kLQdpPZTwOM7m3VY6xdmuwlfW5fo
	9WrZWjW7QwmNb2zkXLwc3u+s81vp8ga18ziaNEhh50hWkJ+LkPqESphTJQehYhqA/MM6Dwr0Hf+
	2w1X2QMrv++UouDUxXXbkuZkK8um0qGDLf96AFZxar
X-Received: by 2002:a17:90b:2805:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3ae57f9a782mr4227238a91.8.1793291653841;
        Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm2355467a91.3.2026.10.29.09.34.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5358515b4easo53187781cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793291653; x=1793896453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNO2F+RkIlNcamMaL3GuwTqaLUzBlGoQvXn9YjXH54Q=;
        b=gkQ7QqdUXfdzozYa3LxDOFkv2LvAvSvB4iq51yFDb5acECKPgocdFxJEiMt9b2s86I
         ymSmB7Nc2yJoPoa9q1t+QyWT9CEbKHkFalDv+FhkAemxkSk1KrBazQy7knPgApzYuDk7
         4OhjsoBo1f6/zYMK7jwE4+pccRCc3IoypsJpU=
X-Forwarded-Encrypted: i=1; AKwUvBzs1wJoZoRkhOqv0ln94wXf4anZLd4e4Ep/oGzCp6bFEp7WcKYbO23mnRMpZo9rQbFhGQ+u+kAuF9jf0Qw=@vger.kernel.org
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr887708585a.31.1793291652743;
        Thu, 29 Oct 2026 09:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr887704785a.31.1793291652182;
        Thu, 29 Oct 2026 09:34:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94420a8b71bsm208785a.20.2026.10.29.09.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:34:11 -0700 (PDT)
Message-ID: <47109427-e5f3-4923-b250-8bca019a3158@broadcom.com>
Date: Thu, 29 Oct 2026 09:34:04 -0700
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
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT
 registers
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261009003201.68288-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/8/26 17:32, Karl Mehltretter wrote:
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
> 
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
> 
>    sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
> 
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
> 
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
Florian
