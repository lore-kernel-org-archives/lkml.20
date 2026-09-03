Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183B511E65
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466329; cv=none; b=aTvUW4zPWW5tl4fJtEVdqZYa3mOwBwXnK9jreSlmRAswwsbTXLM7zT11tQjQuepNPom0+496cGkZg9Of/dm+Av9m7qavBcO5n9x96M5h9bMm30w+XSWmRppKjw7q5zMD3f/5wl3mPEe1q+pHq8SyUq8QRFHvFnoLKn4geJHuqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466329; c=relaxed/simple;
	bh=2x3Fg80qrgO1JMvyRsoWryYQdJjCtQvS1HZl+tKOeMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=X2v7OhIiVL8O9FObqgLkQWO6OwtHVWqxr4CIFzDIauOSK94i2N3ax1qfGn53uzToRbbkL7ON0GZOw3mvsxis8SYA5M6td+iq7woKofdlAHbz8ljcdGLesE2RJp2SLANOtBdz8ZLggq30UJSKEPLmbK4lxRTBJCeE4kCnecmX3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IxBApYry; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IxBApYry"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d9520b9155so2317595ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466309; x=1789071109;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=FGdcxHUzMn6hqsGNRV2IFl/cKXZ8wxsjbnw5dAWpFZrHwTy/I1BSq+HZ6V95Mcsxd8
         7jnK2oFsd9JeEpbXwRNLLWyS+sn0hzx27MA6arnTGFqtcZG9uWKzJFnTsIMFLUKSGnL1
         wmSOGwja4TIrSF9NIjNVc+w6plTM6cQ1Q/JdJkiddjyfAYtwWR0bNiF/WHKJ9OX26vUo
         HZPpgY4ztxyaz30eajWxCPApnUTYcwcTXXO9ApvHCkLSrl4ySvV58iK7sgsrm8miVuha
         Uh1CIWs6zepe1hXlkJnnXTqgnpjAyN2jI3hg0P759GJYKwkjvbxSMVbarUYEf2lfxb1X
         3BCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3R+agFpp4eRcrb/oLovdlUiGayYHqGlKgGHPZCfFTWlRyVvrbwu3V/bJD9sJwoZxemIDZDsYqlFZVTck=@vger.kernel.org
X-Gm-Message-State: AFuF++kzCf6hcpUIS1O8P8MNl7U/4JD5bp+AdO3SrPPFZuG/R20hk4K8
	juEADlSt++s7JHquWpZpuuc7+yF3iZVhsHQA6c7DNcnuAoZmsv561qzUFRJKbnhQDEe4yPKWBue
	WOdTOV/DmEcFyRQ17dWrllngKU2yY1mpfTrjmW8n+1B2UvmB7dQVOztQ1SwBaUHNVlztNAAa87g
	IXX7NGfBLMRRHV4LULJRa8ddk+pXjbwUBJ9WLTulrMi0UEnLyvdWFWRa5UQXe9SWa2d7ZQc/yvx
	4uR+yHkcNuRzuNyHshdfr8L
X-Gm-Gg: AYBFou2rwGfLgo91M4fKUxzwYRFw5o60uHyledIZkjF+psWLHSsouI2xK9OVuLf6/ds
	NT0VdFCMXIlDrbXMqB7OyMVTdJSN3jfdeeKQmCimG9OOmqUhESlR0Aa8iczbIAeQEc2zvelOWZq
	BXaHqmKInZWOI7P7SbXYqg/gXkTq+DzgjTbZty0lUVaaQQ19D7tMtH+bNQrDjzwsOq5nOHmcDWp
	0r/AFGXmprgy4F/0+xBw4Mvo3Q0+VhFK/wv4t1upcVQNo2RGv7wY6w5zhJwHDtKsPD2eratNgZd
	XE4fpUlHcJFTU5A5iNydiu6KuHb9yWGCh0N4vuDDJmqdIsmvnoTRQk0z79vHlEvYCcxmHd9OPrd
	cN18PeN1PYSDt3lV+TwAHyUOfBQ7VxVb6HBJg67iarZfRK0PCrrWar/AGmiFxC77QexXRr6enwm
	tbOM0vZA7crLMdsnbdtPCV3T5UOQai8c2JYmwsErpw
X-Received: by 2002:a17:903:468d:b0:2d9:56d8:75f with SMTP id d9443c01a7336-2db1266772dmr23152955ad.9.1788466308941;
        Thu, 03 Sep 2026 13:11:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2db14898accsm100585ad.5.2026.09.03.13.11.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso26254485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466306; x=1789071106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=IxBApYrySYMAETAe4+Bm9eRkwGYZUDu5bngMYt2j2f0brZS3VcQ/g16THiJQwlEQdv
         7+Qbdee0eqAL7VuQba7nbAFsOls2FZVkefB9JBe6VlTE/mYeNcKYfhvL9u/zHU00GfMv
         zmbw2M75xkyD2sJbzp4q7F7yn6x/97rwicGrM=
X-Forwarded-Encrypted: i=1; AKwUvBwMpGzI5ctRLBaaHFYguzmw07M+c2+lCfJ6PAkLXpnSwJBF6VqzofYg7lxzGhBPJZXrIvrps0Xm8jScbuA=@vger.kernel.org
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97448085a.49.1788466306398;
        Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97442185a.49.1788466305792;
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee9fbsm51700885a.1.2026.09.03.13.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Message-ID: <be3aac0c-3475-4f48-aaef-765aadcc6b75@broadcom.com>
Date: Thu, 3 Sep 2026 13:11:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Add RP1 PWM controller support
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
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
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/20/26 02:44, Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which is then exported by this driver via
> syscon registers. A subsequent patch will add a new device
> and driver to read the RPM and export this value via hwmon.
>   
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea

Uwe, how do we go about applying these patches? Do you want to take 
patch #2 and I take patches #1 and #3 through the Broadcom ARM SoC tree(s)?
-- 
Florian
