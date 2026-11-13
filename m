Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592110;
	b=pUPka2hmdnexwdbygpBh1xKxtIy4QmehzOPKD2hYLy9YLg36OcQiQZQ6gSRjGVoL4ED9
	 fpJOwGl1AwO1VYVGcPO+ddPJRJdXcCPm3BVUbgFFUZBvxl/Q39ATiE3m++VZAeS6iWV9g
	 bbOjOexnl3fpuFPxyFz3s7gsAE0qKdiOds5+hP3yHRNzJZC0CsU+pRFiBkewOP9ss/nD1
	 pXc9MFgf0MzCWKDy2dONuSsbkeirE02VSZsU8pKyo28Z2MaYuCuWm0v4FAia2Er98FnLF
	 M7y1K/bnNMMfVSBSSsIwpMiNU/bWEYTvVTjPQPPE7Wja+TXgQrx9ccf6M84EBE1Bfpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592110;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=;
	b=jTrbSolvur/ve+O9FE4WaJ7aNMhOL1/yOYYKMgD2Ok9+JjFOlSsTzYpAtroso/9cvZl2
	 FzQXHRPABKLM/DOrY+uCorfQYP1KznDyo8vRfwwgz1WIRAZY9YDKK1usQSBLdSVSfMcYw
	 QG/O/xRDlvO02O6zkuZNzKSGJHf69T4N9vonzmn9s9hDZTVI0RK1F65tSihPQi3LZaTTr
	 hPAbz6dCyTTJALIuPmyaeDd7Wep+s1tnKs9kS+/R3RhcJTTHFgYGk95gsrQo9xEPP+rEz
	 MVHMDTKAmBKEzKDB4eInMTlK7bs0TvCh14ipVebrrXEW8XSaGefN3H8+mzj8ETTT6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QrbfibI3;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551F606EDAC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5551F606EDAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QrbfibI3
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so726303a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592110; x=1795196910;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=;
        b=2mxwKHS+0j+miVJgSAlHPpmUSlwjE1XGWj5HFo8E/BIadxLZjqiZ/SxTSUEdJE3SV0
         9DDQ/ymCssUfQPuAe6a9fmhmmbhjAOa0jARYrXU2V4eSmqld1jOO0rfgUNjCAQRALkGX
         n8racWHwbpnLQ/+nWNHhnw6DGQ0O2E4wyEGJxv9ciT3o0ALooZxw3momJwuO7BH7T2ao
         6WX8LKRk5W6iZBDKxf01RVHgMDl1mRljlslpEJTI3o7Yr7u8MsHMCCJvpfXfqtCHtN6X
         O6ef3QHtqWKsDoa52sf+u88ZVIVo/c6HwIftltNpoRyPcPk+IiZWxpIta8UxcNupppRh
         htcw==
X-Forwarded-Encrypted: i=1; AL+hErGGgSZmfOUtk2FoOVyTh1FUThsH6OSQ4q5TTpsEoG2fZJUyjzWDLqsrJ8suUXBQ3DoCg0WHSMLNYtvX90w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Id/3eXIYdAyRMUVkERVtczGmYfIWSUHY/I8D05R310TifOCxI
	virpjI8t9d5mVdJ3rPx4bcVLyWkax1VH/L4vfwodVmedzwGSjoNoGiFwiygdiBQD35OSdcPfsVY
	4uPrFg+K2AG4zLpRDgDxXlnFrBqn3fBwM1q5nmLmmMYjzkEEX3QwvvmgOYEvzOM9NiZbVgygNhD
	c4qvrsJ3eW72puSYsjPiEUez+hd1GsEg9y7olc8KBVRi6LzM8+2aHNw3zIT4N6rNWV07PS+obI0
	x2MPW8kF0IY6TzYpmaCXaVP
X-Gm-Gg: AYBFou29BniQLqAabEEoFj9i8ZhblhhqVoRiYTZ/kyboA7Vhn5hhb5xGmqolAHg7myS
	et65fqQAQR28SPpYoihB/L2qr6PU6PhxXcXIVFJD7H3s9QRZemSdUvtQcM0ZQevQaNtMJqe8C+o
	rdAEefWIsSzhiovc5deo1J10wMbxzEe2qoZjfMw1jSIarJTjQ1/iVXvNHkYN/xEsx8D10UCcHNw
	rfoc1SRZmY8rfXtZBF45Hd7ZYat9+4etCjEHNNzVyn/Jf24OZi7AxHMbxSxTPPjiFTnHHVkt+Sp
	JCIUzE6WSvFjpeMpYTd6LudtSbWxLQ8QABKdbMX/Xb51jSvTmDQgZpLmFdOLXCXItbKFcAqZe64
	mDyFkOWBqlEBR5BMEEQ10FDXu5P3Ni3OP1uUz8VOT53XcPpHR77N/u5qfAV6deETFuWEtxad4mb
	TTQVNIejhAp5fJTpS7zg/+4oFaRDcRWBrLOAFiH4/cwlM=
X-Received: by 2002:a17:90b:588c:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b1b0b5c4femr1630859a91.13.1794592109584;
        Fri, 13 Nov 2026 09:48:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2188ff4sm1254530a91.0.2026.11.13.09.48.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:48:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso1407378a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794592107; x=1795196907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=;
        b=QrbfibI3DVentZNBM7PRkyS1EC7HHIAnsaOwjS8nkIWquFg032Ok0Qi+APCJTANqnk
         nh3qqdsqi/85Iv4pGB/eenZAjJLE/p4ABLHUBjWDVm37wQ7meQDNEEOD9uHiVRUnCBaS
         A8X+xNNZj1tWJ+iJw1OpuEUNnrg907CbUet8A=
X-Forwarded-Encrypted: i=1; AL+hErGQQzg9wfT1ePik4bSnpZcpFvcyRtlGNdhkXsJFuWrNvT65Re+WwPvr+nFwd/xHNkMZEOvBSPT7nIaKcMU=@vger.kernel.org
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr1916515a91.14.1794592107351;
        Fri, 13 Nov 2026 09:48:27 -0800 (PST)
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr1916489a91.14.1794592106835;
        Fri, 13 Nov 2026 09:48:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm2462591a91.0.2026.11.13.09.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:48:25 -0800 (PST)
Message-ID: <16f82416-ea85-4eda-bfae-4047f414135c@broadcom.com>
Date: Fri, 13 Nov 2026 09:48:22 -0800
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
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Srinivas Kandagatla <srini@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
 <avauNsYkHqIAshCe@monoceros>
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
In-Reply-To: <avauNsYkHqIAshCe@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/12/26 22:34, Uwe Kleine-König wrote:
> Hello
> 
> [dropped Ray Jui and Scott Branden from Cc: as their addresses don't
> seem to exist any more]

Their emails are still valid, they just moved to 
first.lastname@broadcom.com, reminds me I need to send Jiri's patch 
correcting that.

> 
> On Wed, Nov 11, 2026 at 08:23:27AM +0100, Gregor Herburger wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Don't include <linux/mod_devicetable.h> as that introduces a lot of
> unneeded build dependencies. <linux/platform_device.h> is sufficient to
> get of_device_id, so you can just drop <linux/mod_devicetable.h>.
> 
>> [...]
>> +static struct platform_driver raspberrypi_otp_driver = {
>> +	.probe	= rpi_otp_probe,
>> +	.driver = {
>> +		.name	= "raspberrypi-otp",
>> +	},
>> +	.id_table = raspberrypi_otp_id,
>> +};
> 
> Inconsistent use of spacing before =. If you ask me everything other than
> a single space gets inconsistent over time, so I recommend sticking to
> that.
> 
> Best regards
> Uwe


-- 
Florian
