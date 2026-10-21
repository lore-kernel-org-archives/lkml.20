Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602156;
	b=xPSJa+s6TwJhISJ2EIU1h1XVwnmQeArit/t+f/8k3xNN7DYpwmLxYAwmU0wVaw/GxUCo
	 ZXUiK9VuUXREQKm3Nli5G6BGZ9rMgRrnj82H8U0j7fe+qw5O0SDyOyhd8sz/KXeJRq49C
	 UjsIKrXGzJv0YR8cey4/opDEH7dKJcCCW1m+vw+Ke7werwYmWVjao5QoWOsxWyByoNIuD
	 T6gKYpM1sp4V9Mz7GjXERaXjFKUj8yHJZ/QWUwIF4kUNK/FsLsSd9XObK+BV0vkBAozpO
	 9hYBteEfjU7aOEtLX5fGhVbQ71ww+3XhTU1D613lsPNqfqCA8hYhwHmwWBUTQJBiMgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602156;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
	b=EJonmLeBJDmYbecbSlan6Sp6F7u6VOaLB5mB+M9+nFUNmbREmDhkqh07jla/tZMMq17x
	 i6pTJ4TL8uHweOwF3RitE9mmWcQgHdZ/+/Ic9E9gc4wB11AxpAyla56QfEeH/yEyrSVOD
	 qAItkwXe0erSKJ4fSxzXNucSQcfmo7b30XrJ2q+7e5STiaTOI2n80p9gvj/bsnbJ39wAj
	 r/MR+9xjPLTkMsJbeEF4B8uPORYT9Hm1OlK+0aUoQk8GPKILMfxlkjvS1D0wsJORKyTHb
	 pPLK/Xfb+QmdMaklSzVkeagQIOP7t2BMVOnlOcJZKSWBZuFPqb4r5v7w9lFFZZE3R1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ChBURhV5;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FCC606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FCC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ChBURhV5
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-67489c8202cso835802d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602155; x=1793206955;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=zPfnbvPuBB/BaBUeADnsQZeQ8we+EjAhTGTMXw/pD8qUkAHGPIYt6HzHjrqKcN1evn
         XrVuIUOtabpIApz/EfhVhn+K4lS044Tbu48dd5jBXu/3yCF0ptvSJtwp0XbFeGPde5Wz
         wzt97U3susc1uayQsKO+6G5JZDE4ARaSaFiI6nyezTe/2NcsIdlnHU1cWarcNYiTf8MT
         1rGRZZjn8rI4p5nZxOMcor/21EFG7Jz/pRqLYHSX1a4ITF6NQEeuuEwlhRMJfaXbCkZB
         Ipeac8Y9LNxqiblW0ck7bF2K6HWLoLRsaXpqWvimasdryOQKRuNZ3rdveMdkKcok37Lj
         oTiA==
X-Forwarded-Encrypted: i=1; AKwUvBxnaUQcf4f1x6rOp8F3oeyzOzbK83ySVNY+5WbSqe3FVXwYkTuHiE1o6z5HGhQvz70GccrStU2c/StzxpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp8MUtlwUWn7bcMSSPro7x8DEDziA+3RvcNJNL+ZOTmH1G12RH
	+DjOKVw24dhGeM+l5S6e70Brs832ljfVspww8Mxi/0UVwFvx/O3L/iCxgl00PZj2ViN0SwieIbS
	QxfKqpMsDMZ0CheqOWL/1N+3RF+D8AjLcdy0j2u9OHBoRambTVzcK0shiFOX5Ow/Lnu+cgDSS9o
	Ohih8s9JJWd3gCM/91UDPXs6uSjqBoEDhKFQcuFGQEF4Xx+Sr+S48MgzjQb/S4rc/3OPpXMhn+n
	yR/xIZE/UAPcXwhflqtjdz0
X-Gm-Gg: AYBFou2zT5rGZRy4fNi9YkpxMMxKYCZbdYZsPEG4u8jKtDreQxbpJMoApcQ7wM326bC
	5LIis73dYIOfvnRaBxycNkqhpvhMnK9tD2F/sdCVEy8bnQNt/SmxZAnSqpca69IGx9CdlSrWXBp
	RJV8GE6g9uwiDK8Hb2SFH2wO+D7Ld713pMjo0yX2Qs2EvLzwgHX+h4PX0oXWO50KAnPMbF9Pw2Z
	uFyNvY1IxU7u70FnJmuE91pB5QdjbnikpOZo+cSrgqOLjf8l3HSZfgAcsEBO06GY0svNHKlYUhp
	lLVCCnbB0mTlQQnrdvQcQfQ3wo37xKitiFKb4fo+WyXFgaQGFtTfu3aSGU46eqP4s/6q+g7NVmu
	I/M17QI5kqbvMgaOXUHTVqWS5rmCwzvldHpr2+pBy6JierKBobv6DRKt/cdfMpNu2Qz/Yd3WK34
	YvCgn346f4tzXfcnR+9iSQBPcroa7amnLdeNVQJtKO
X-Received: by 2002:a05:690e:488d:20b0:677:d4b0:47fd with SMTP id 956f58d0204a3-67a0e49b2dfmr881092d50.23.1792602153492;
        Wed, 21 Oct 2026 10:02:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c2104740fsm67906d6.36.2026.10.21.10.02.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1535732a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792602152; x=1793206952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hOuabnxLm0beCp1h5BHdKuYcbUneAYJ9aWN1l0DLgQ=;
        b=ChBURhV5LulMs4bCnLVaVA3IZSXrCR45ONzdkar9U+u6fyCq99Qx7YIGf8ZuCV0UKy
         MGg6AtqyP5bXC430p3V79frR0vkY+UmlgcIv2phwi4+zbCnwC4+als8nIfvpBCjJPaWF
         VjEtuHH3JJA00xJTlkxXLUKArOc7MLazZ+hdQ=
X-Forwarded-Encrypted: i=1; AKwUvBxosk+0Sp9otoNnMEuflyqcd9aPZs9niPPspouAa/yKbPDTj2GwfsbKuDDKEcHtHWhCOSwXzvkOP4r/99o=@vger.kernel.org
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118615a91.63.1792602152086;
        Wed, 21 Oct 2026 10:02:32 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:3a8:d71:5fda with SMTP id 98e67ed59e1d1-3ad870b2e7cmr2118588a91.63.1792602151503;
        Wed, 21 Oct 2026 10:02:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890c56sm333869a91.2.2026.10.21.10.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 10:02:29 -0700 (PDT)
Message-ID: <45bc44ff-664b-4a18-bdcc-bb812220e2e6@broadcom.com>
Date: Wed, 21 Oct 2026 10:02:26 -0700
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
Subject: Re: [PATCH 0/6] Fix SATA support for NSP SoCs
To: linux-arm-kernel@lists.infradead.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
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
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021165555.652102-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/21/26 09:55, Florian Fainelli wrote:
> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
> which was broken due to a number of things:
> 
> - the SATA PHY assumed separate PCB windows when a shared one is used
>    for this generation of SoCs
> - the clock/reset (IDM) was not being configured by the driver which
>    meant that depending upon what the boot loader did, or did not, we
>    could have had the AHCI controller still in reset by then
> - on some reference boards, the AHCI controller is not DMA coherent,
>    assuming so leads to all sorts of timeouts, data corruption, etc.
> 
> Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
> keen on having Damien merge all of those via his tree if acceptable by
> the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Argh, looks like I submitted patches 5 and 6 twice after I had 
re-ordered them, the correct order is in the cover letter:

ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
ARM: dts: broadcom: Enable SATA on BCM958625HR

Will wait for feedback and resubmit if necessary. Thanks!
-- 
Florian
