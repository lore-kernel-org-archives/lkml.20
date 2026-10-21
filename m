Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610431;
	b=MHvWalfPc8HP6pcXluJ42v1Q29F/78UTuaS+1GFrvhiGq+PqrFlOJDffKeiqP7FeiWth
	 hD8xT1v+TzX16ESiLVreSn/e6FMADyhEl6EGqSAsYq02x7CBB8jT8RhVzvuRjhB5lGmHQ
	 bTzaIa6Xn63LCeOb0MMgFUundnz6w9YBXJCz7LBVTZ1GwjJhfIgn7H1wQIPkc2t7sWclO
	 XO1/AfpnBjSQH8qFb+Z5QpRz+nmX7AqTo+1a3xQPRnNxBOcqWATMpQQ1joNLVnempQ7wj
	 9JelfQWeQIVDGeHogr6fmgGmC1nEkYGNKF6YhjwzFPHYkSJN9mELzlt5DiTB/yN0vTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RNiRiiyO7DJqjfqrX+rUB/oye1h9Xb+o0d5qxoLsqSg=;
	b=o5kOTHDcGf7ygjSu2MCA7yZf14N3XE9pKDVeYD4U3uAPHUPaex957VM3MGs0r9bjyFBv
	 AFoDXe0aO9LoDyo5EnelzNqeU+LdcApN2F4u6zHd2/xaEtcGsINKRo5tP9MZvbhSi6Tvn
	 Twb5qmkAvs3TwgHBc1+IAN1oL4qhtK5WewlIl8bUJL7huG2sgv4f2yG9ho45Af7m6WzL7
	 nzdjdpeUziSx1oIvbJngYlssU8z+27okSyJa7U+Do44j5CMWzp13y4gqC8nx6QKtj9fUm
	 JLEqEWFkrB9DYMHTxx5eLSR0+O9lchDBCXGshadS/XkyMvjxIJEDMc7Wd8zSKEvqxFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k3ubY76j;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEA8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k3ubY76j
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so630812a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792610430; x=1793215230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNiRiiyO7DJqjfqrX+rUB/oye1h9Xb+o0d5qxoLsqSg=;
        b=k3ubY76jKx5pTSepYJf8MKrcdHMsRSQrrqC43Og/urmHTQZzF6tbSnKTTX/HkkkUWX
         +YcZnydyfvxRZ+s8/7YGJTkTrfxsBZcPxOlCS10dziV92E/sYdS/YhwsSNpBEuy147dl
         hodDOD7QMzYKA833dr1pvan1+PN2dhNNwo+KfdV6rCuogw9HkRCQ2gGlSoJQdGpQNid0
         Zmoev8k+Duh9Z4RDWMUsA14eS61ZoUQQbl/3XOqyckH1n+el2UIkAXhMST6MsXve2yxV
         T/H+pydL1M4bw4xokzsSv+2tkl6/SLxCsWVUABOd14WvAob/fAJmHgUuPy/kM1a2hcIg
         YLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792610430; x=1793215230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNiRiiyO7DJqjfqrX+rUB/oye1h9Xb+o0d5qxoLsqSg=;
        b=lcOwMAMD84DbK4aBCMWjMyCpWouKP/c9HEV5ogkQ8rDs+c76IjrCEaGtj9//2Kml0R
         4qaYQBxDhplNMVSqvxK/XZT+UyKzpmjcZfFM5H55dcVT07H6VJerxjwMg4aNaDkbjkv5
         JYU63D6S/bbLPCSJQTKKgZ1IfOcpemNr4FnpvzQhNGkYB4+4PDXr4y1C9QLaKQciMDg3
         WeEYjTZ7xC4vLgnj3mUadU5ylOXEMv/1+xr7jn0MqMiPZOiUQZ0BBs7E+ef1Y/W/A1VU
         YeVM08vZcCcTVbQ6sjkb9Y1aUJ0MYu6eDK8QGA6fc1wZpKTOUP1Wp1l1EgmBbgfCjPeL
         9N6g==
X-Forwarded-Encrypted: i=1; AKwUvBxYhIgSlHFrAg75/4+s8v7o2XXTe2xiHl4zcylaeTUpFSDng7CCabWUVKmZ2164LJPAYL9fi+HuNaTxMX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvG047/mPNQaEYEYVHs3DS1WKPDaZiBmBh2iS308/2+Ag3ovog
	7D2Q3Al18C67OVmRYog4H9mgEaTHo8uiirlPkwnt0l/z11cZDxNYr1dI
X-Gm-Gg: AYBFou1WLYAWzv2FnbXsTr7qwhTduR3FHVO1mTp0Jc3+SnXp9rSrZpYa2mFVis2huf3
	OXsLPOIscUSuXaTVUe99fYhBiKU4qnXweX2SK+eGqjWI2TFQ3WxPKFRzfuRTQx97HcgHzUSUZ+e
	aE+Zm1pfrWmWYEZE99XhgSMIbwSm/A9TmREY5B/Jmwc6P16g1dfYzU+lkFK9xN6/Dk+IDZPxJ44
	WvbNlTc9xlQ+VXmnDi4nMQP2j7/LAmB1/nO3GN1KmW0ucUwa8osMIUjXYidEnt7lbg6tpaBwPwu
	TyqBAILiuz5+nlzf1LEmhmSuofurw96+KshOuWK+AaJWwYuljJDkIGZeWEKqkmcOaCwNNu5MWqx
	gG6fTKy+/gxeTkHYtcwiGRJacv7wpn9Yjc/rz0v5O4ibS8uwIHgniAwNl/N1rdhNzum6Sxb4g3r
	Ha9FJO+fpL87fgtKfSbMxnpMPsM2ty/0cpvpXUmoE1rgjPehjeo7t+GEcf5u2SoDJKZAVjv1CZL
	jjeo8FHC8v46lCu4D/G093W/ZxZJcBCEr1yx4vkLUFelGyubLUcDwnMHyzj
X-Received: by 2002:a17:90b:4c49:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3ad86f451a8mr2500980a91.12.1792610430130;
        Wed, 21 Oct 2026 12:20:30 -0700 (PDT)
Received: from [198.18.0.1] ([152.175.97.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm2573981a91.3.2026.10.21.12.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:20:29 -0700 (PDT)
Message-ID: <38114050-123f-43df-ad74-6a27effd37a9@gmail.com>
Date: Thu, 22 Oct 2026 03:20:19 +0800
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
Subject: Re: [PATCH net-next v4] net: phy: realtek: Add support for JLSemi
 JL2101 and JL2121 PHYs
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021170248.49264-1-cyan2254650260@gmail.com>
 <44fbfba4-edc1-453c-8e9c-8a6ddddb43ec@lunn.ch>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <44fbfba4-edc1-453c-8e9c-8a6ddddb43ec@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/10/22 01:30, Andrew Lunn wrote:

>> +		PHY_ID_MATCH_MODEL(JLSEMI_JL21XX_PHYID),
> Thanks for this change.
>
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
> Since the merge window is open at the moment, patches will not be
> accepted until it closes.
>
>> +		.set_wol	= rtl8211f_set_wol,
>> +		.get_wol	= rtl8211f_get_wol,
>> +		.suspend	= rtl8211f_suspend,
>> +		.resume		= rtl8211f_resume,
>> +		.led_hw_is_supported = rtl8211x_led_hw_is_supported,
>> +		.led_hw_control_get = rtl8211f_led_hw_control_get,
>> +		.led_hw_control_set = rtl8211f_led_hw_control_set,
> Have you tested these features? You have seen one register is
> different. There might be others.
>
>     Andrew

Hi Andrew,

Thanks for the clarification regarding the merge window. I will hold off
submitting v4 until net-next reopens once the merge window closes.

Regarding your question about testing:
 > Have you tested these features? You have seen one register is
 > different. There might be others.

1. WoL:
On my ALINX AX7Z020B board, the INT/PME pin is not wired to the SoC
as a system wakeup source, so I cannot test end-to-end Wake-on-LAN
from system suspend.
Furthermore, I probed the RTL8211F WoL registers (page 0xd8a and 0xd8c)
directly on the hardware: writes do not stick and all registers read back
as 0x0000. This confirms that the JL2121 does not share the RTL8211F WoL
register map.
Therefore, for v4 I have dropped .set_wol and .get_wol, and switched
.probe to rtl821x_probe and .suspend/.resume to rtl821x_*
(matching RTL8211F-VD) so the driver does not touch page 0xd8a.

2. Hardware LED control:
I have already tested the LED hardware control on the physical
AX7Z020B board. The RJ45 jack has green and yellow LEDs, and page 0xd04
reg 0x10 is indeed the active LED control register:
- Boot default is 0xe251 (Mode B with 1000M+Act on LED2, 100M+Act on
   LED1, 10M+Act on LED0).
- Declaring leds child nodes in the board DTS successfully registered the
   LEDs under /sys/class/leds/, and the netdev trigger confirmed
   hardware offload ('offloaded: 1').
- Setting register 0x8000 (clearing all LED rules in Mode B) turns off
   both green and yellow LEDs completely.
- Setting 0xa000 (LED2 link 1000 only) turns on the green LED while yellow
   remains off.
- Bitfield manipulation verified that the green and yellow LEDs can be
   independently toggled (e.g., single-LED blink and synchronous dual-LED
   blink cycles).

Therefore, the hardware LED registers and Mode B bitfields are identical
to the RTL8211F. I will retain the verified .led_hw_* callbacks in v4.

Thanks again for the review,
Pufan

