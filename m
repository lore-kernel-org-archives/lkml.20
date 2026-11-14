Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626475;
	b=2JUGY+l5NgdqUr3FA4uZOO3nz1j7vb/lgA7nunJJQFZhA6w/6YzJsAkG2CC1FJkJd2ZD
	 YDuJXwwppoKdLe+zuSTdboU8n3UMsK8Ewv7JJzSC1LRlmLTHI5uf3lRinY9roRdYFuJOU
	 RWVZkzQZz3QxfqLAPwbnwMOJif+RSZ4SHEfg0NGrWBsyB+t3DKUlsjLyiTRp8M4hoaomE
	 sbqLrfBAzNInPHcO4u3tYQ0ctUilcuZfuYTw+7u52Ou+1MXkrqu/W/ov3qZL/6gqQ9FgL
	 2NTPtI4pzLQNCixToW+q30xOCozUCGf3+XZFfRan6Z/oPrd2pv+SGTv80takVSEVExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626475;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=;
	b=1srwu7tn3lYGB1WlxOYHVyqQi8DE9hwnbyf5V/h/VH6uH3sITFNwY5KhVhoPVaB5uRnU
	 UEFqKXUyB2JopipoxsEK9TVs+phYCtDaa+pBbPBQTqzxJzZh/UYvvzTpDl3VaG9kZJSWV
	 Qo5e7uXaC2w9CjiGxj/4cEezLbRkZfmQuHcokzK92Bhbyl8Okx1DTZXMLhc0vxQM/++1I
	 F0ZZJnTZ+g71ce8VklvQe1R/TGf4jq6/vp+89E+dXGOTpPPwK93ij5j/dMRG0iVHEcG9b
	 Y907xWw60zLj9BiMlONNzg27aVVtBX7DcizUqPVtt0Lz/emNLWaa3yqxc1bVEM6o6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DTcUWjow;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A4606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84A4606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DTcUWjow
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1348253a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626474; x=1795231274;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=;
        b=Ap0Hp0v7LwGbs/qCsryfFCHwZD6KhdUwwas6Z/niSZV7PZkQvpfwu8xQ89TT3psvyX
         5mJaGu4Kl/bZ2BhC5dA4CTSW2B1PCiqEcsjyXmENPH1gh8c/nL2BEJAeUJABjEw2jfMv
         i82fLtQ+fpaZ5Xj1IE5zwXwJUMWyQFR75Fx8uc4JCPATAR8Tu7p0aPOM2gkmXdceWx8a
         KgvYhdJ85ESr6h7Ojst0yWuppS7XMy+W/TeDgCuoj7p1rT8Rwpu20S4zyJg/zLuAdCnY
         Lf0sGVC8G8Yo5Zx53nonuiY/8261wmHOfM0yTZWprK9I3oJW0v/9oE0tI49uknsllgKE
         /5ew==
X-Forwarded-Encrypted: i=1; AL+hErGwrl3E8aIXprkJbNXS7MwOs8uAD1IzVyEAP92vk3Nr3pTDH8tT+yMQHXQu5QdvkyEWsbjPu+A2sa6D5/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HLbZUg4BDcelkvq1F/7ydXhbhPh7KNc6j2mnI2QXQF23BVvc7
	90O+2o2vxc80+U7710IcMGaezVagKbS1xlrChGsqWQHGLkprYuDvavVrFrb79kf0mu8C3UlOZ3h
	eJqOMLuupGGVr7s2RBt2OjQbsC5I0RZ3F4/T+5vPy1viuOd4JA5nqC9XkmHQM5Hcy2fMl+r3J9R
	bYc1iCy8jj5BNVsKRx7fI9oAXzMuw6wXvqMGTqItaT/Nqj0utF7yJrg/f6fFgX9oKu+OCrkFkX7
	IIQAIry6JLVudMm3/hrsdle
X-Gm-Gg: AYBFou3yURdr9qlZnUCNCWO4OjiIuY1uSWWacMpP6AkJc9enDUffX8dGp8v4Z+OQlJ5
	0SCHPkru2Kbzrzb3f3woBy6m1f7fSUjWZIRkaJ8Yqh+DpP1EYdE+uW/M8oDSdsnVI3pIM7xeZ4Z
	cXgvmoDPvPuEZD4L19mqqTjUQBc+O5FYb4LL8mq/mnJ5fCtRxCRbu+QZQV9Ey529NuGve6QL2Eu
	0AxqYbwGL8eS6QI1kbCICLy/gdRbqg9nRaQ55X6CSeDbqSNgijrwCOUHBLGIFSxaQ0fxz9kWUdy
	i32yUYGfKFugcQldEKamTXXilImk1UGQp/bTmCvlnSQnPAS87/zlJwuGLWpZA5VgAAUyBj0nnVj
	UMG0KAz6VpfLMDqFUtFX+QUwnbThxRnmiCyRF1KJ3jUjBW9x77/w3Z22roX8h8YpDSZWGjKrhqd
	B9KV3oQKjKmIubujB52ugrbxQnCQIK/U2K51B6ZrEYmNo=
X-Received: by 2002:a17:90b:4d0d:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b1b09f37d9mr3893687a91.17.1794626473858;
        Fri, 13 Nov 2026 19:21:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca69asm8990321a91.5.2026.11.13.19.21.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:21:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so3656880eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626471; x=1795231271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=;
        b=DTcUWjowdaiId55lsgNhC2W8H64GkD20eSmwVJhWWvwu3XMce7qESYwsMj3jWthDfo
         rlzpT6wwrbJjMJR8yrIq1F2gn3yverBQnbYIRog1xuUOd0DYrwae5TTsubv/498h7uNx
         /cl6UY7NGFbMRMPxysuK8RQYUfoI7s2WDH1kI=
X-Forwarded-Encrypted: i=1; AL+hErH6OoUVxEyTy7KAw5UG4F37/dyCCaPrRFcKj+mMzUOjjNYeYMNtzN4lkM+Aj3C8I55GT6jA7nxxxHU16QU=@vger.kernel.org
X-Received: by 2002:a05:7022:f519:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b50317545bmr4251767c88.24.1794626471011;
        Fri, 13 Nov 2026 19:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:f519:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b50317545bmr4251713c88.24.1794626470290;
        Fri, 13 Nov 2026 19:21:10 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm17687180eec.18.2026.11.13.19.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:21:09 -0800 (PST)
Message-ID: <01568cee-cd7b-466b-8546-ff45f3a69056@broadcom.com>
Date: Fri, 13 Nov 2026 19:21:07 -0800
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
Subject: Re: [PATCH v2 0/6] firmware: raspberrypi: Style cleanups and fix
 child device lifetime
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/7/2026 10:21 AM, Sander Speetjens wrote:
> This series does minor style cleanups in the Raspberry Pi firmware
> driver and fixes the lifetime handling of the hwmon and clock child
> devices.
> 
> The first five patches address checkpatch warnings (missing blank lines
> after declarations, incorrect indentation, unnecessary braces, and
> undocumented memory barriers).
> 
> The final patch moves the hwmon and clock platform device pointers from
> globals into struct rpi_firmware.  This pairs their lifetime with the
> parent device and prevents leaks or incorrect unregistration if the
> driver is probed more than once.  It also checks the return value of
> platform_device_register_data() so that an error pointer is never
> stored.  Registration failures are not propagated because the child
> devices are optional.
> 
> ---
> Changes in v2:
> - Move platform device pointers to rpi firmware struct
> - Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com
> 
> ---
> Sander Speetjens (6):
>        firmware: raspberrypi: Add blank line after declaration in response_callback
>        firmware: raspberrypi: Fix indentation of return statement
>        firmware: raspberrypi: Add blank line after declaration in probe error path
>        firmware: raspberrypi: Remove unnecessary braces in transaction helper
>        firmware: raspberrypi: Document memory barriers in property list path
>        firmware: raspberrypi: Store child devices in struct rpi_firmware
> 
>   drivers/firmware/raspberrypi.c | 61 ++++++++++++++++++++++++++----------------
>   1 file changed, 38 insertions(+), 23 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Discard those messages about patches being applied, I see there is a v3 
which I will be taking instead.
-- 
Florian

