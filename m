Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5862359A70
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232496; cv=none; b=g+XFrSQLqZXMT10Ucaw2+S1Z47yVTCQCzrmurTuUFmD4gebSbfVfhossuCRWyygZ2xkiIn8opY1i95/dd3wUVEVuJEoeAoIAzHPNJtVWY2hltKbe+GiJSeOZMvUpNLwkkf00TJGdu/MZpJhzLcEReZSs8gr7JWBUIQ0031hoknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232496; c=relaxed/simple;
	bh=fDvxDhzbYt3DMeQyxit2JKIBkeTLvVcghnDJIHoTikM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVAQF62JFkBoZPwghWaJlzvb8FfAHCe5vKTjlZFx/lwncaSHhiJ3NyLuWEKT/IKoPbvqiI4N5YT2489PffGh4IomxMPZslHVwzw6zZ1muuzj+P+Zt536+3YmCs9jRLGZ+R2IhEHC0R8wUfplP0kdaJYMdHhScnVcwWbYkpOTi2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qB3UERn2; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qB3UERn2"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so8946955ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232493; x=1790837293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=qB3UERn2uwag+SFeINTHk1APnvHGvvX0dvPc+lWaeyFQo5hcMmMiJ+l09WamLyzFHf
         wAxpQ8+e8kpWWrXkYY5zf3n4gu74AqD+yuQ9wS3gSJjxu3cz5nRK9qMM3DjwnJJgH43a
         W5NNxpHlqonRPDV6RijBSpw8eg1xlWGP5k8WLLpzbT6ru2mv6+Ww7MFBMs4/yJnDZTqv
         WKM0Mf2fTbgKoB3cOpuqLKwLr8mX62a7m+jWsen3HSroB3S2NyLpSE8+i/ug2aVeYaUg
         /qD9/o08gHc8HqUaAOm03AZNlIiTCVsHnGXTneWbo4DyASNeQv9f1caIKrSKESedD5ro
         VshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232493; x=1790837293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=LPbDI85joBlVqlskP8eBJGD3DfWWQHiuJNYZ+G6UomZbaeexgjeGqOgxjGfKQR1YRE
         eovsYR9lekmcX0SQBfH1etL2e0dFhTei95Pq7CBSlWgo5c4IOjqJWCbDXP3fnYBjk89L
         sa2fDJkSK08MNJqmRxAQvERUfI2C7x74cE5iCJzfkosauTVI5cgtnq5VKy54ruYYZIOp
         5jsg3EGrIZJkSgPUTa3d3V7yB8S8AedQUFPtcU3lBBC6jbRWOCD5VZhJy13r8AThmEGj
         qs2nkHROcHsOhEo8GfKytvoZMj+Q6sE7MWa+Z6IEWffOyjnRj3cEXFyGBXGdBmaiHNo5
         XfOA==
X-Forwarded-Encrypted: i=1; AKwUvBw0Xa05cSSGHvk/t7DoJvmFUiF2GLWuKyxMnqFS3Mo/10nmVPGEKS50PWWICWxT8f/J2oaiuhRAKVRT0R8=@vger.kernel.org
X-Gm-Message-State: AFuF++kncCc03qhZcAKwTJ4tHlmj8SE+nhg1i1rNHjRKBG4yXyWsTLpX
	A8IFtj4rOGqe9MAS3+zw+5FqT1CnuuMy+Ro7bMX6rB5kMmrPG6BLxIht
X-Gm-Gg: AYBFou143qq3xPY9p6SmBb3ulEBJjjl80g95kzbuF1iqChsoo92SC8Ux6HnMfRbNzy0
	gSZRguqXI31wqtx438xVzrzs2YvIxALbQpGjixfZdp2cdVf5HcaGJcGB52dvNb21+yTjpsIDLwX
	Wx+LiVKIblxa0Awyi/bY+mm7W4uOVhxNOm7KAZlsb9WG8by9ZHmy4q/TnrSKdu3P+cNcgFObmRp
	phzVHm4EkiNFFC+3fn2a20+CiRl2mWj7dOqRp4PMOZFTVy5e7lLVBjGXdH1N3Io/95SOccisAcH
	xMPLTbOUQEzZVeiankwRJHan0xDPBNeJh1g29eBorIXt8nogqYb2Q/ZVzEepECEGAIfYCeiq01y
	jW/AA2ZB/A3sZoGoUYZsDKghM0sR+pbVvMRClhMhPRgbQxju1nK6zLf+cCskQlIOyMqYa8a7KeC
	ipakz4nzUBcF1QsKIQ3Szcu5rG+guS08N9fBZDlr132QslQhoUj4W4De7NvMWWEaED/ncg+Pnye
	S7MWE9LkV8q8m3nSg7lY6Nhy7lxKgu0iFTRJWQ97jL0CuhmiJQ4ukR5JnmGzGTucg==
X-Received: by 2002:a17:903:2f4b:b0:2df:448a:e016 with SMTP id d9443c01a7336-2df7dc1e167mr13424515ad.34.1790232493096;
        Wed, 23 Sep 2026 23:48:13 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c7d82sm21463085ad.46.2026.09.23.23.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:48:12 -0700 (PDT)
Message-ID: <0e6fb86c-e995-4ef1-b08b-44a5e8be93f9@gmail.com>
Date: Thu, 24 Sep 2026 14:48:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Jacky Huang <ychuang570808@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
 <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Jacky Huang 於 2026/9/19 下午 01:49 寫道:
>> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>>
>>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 
>> 1).
>>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>>
>>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>>
>> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
>> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>>   3 files changed, 137 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts 
>> b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> index 78534d613486..0a068abda6e0 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>>                          power-source = <1>;
>>                  };
>>          };
>> +
>> +       hsusb {
>> +               pinctrl_hsusb: hsusb-pins {
>> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
>> +                                      <11 12 9>, /* PWREN */
>> +                                      <11 13 9>; /* OVC */
>> +                       bias-disable;
>> +                       power-source = <1>;
>> +               };
>> +       };
>>   };
>>
>
> The outer pinctrl group node name does not match the MA35D1 pinctrl 
> binding. dt-validate reports:
>
>   'hsusb' does not match any of the regexes: '-grp$',
>   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'
>
> Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
> ma35d1-som-256m.dts.
>
> I tested this change locally. Both affected DTBs build and validate 
> cleanly after the rename.
>
>
> Best regards,
> Jacky Huang
Agreed, hsusb doesn't match the pinctrl node-name regex. I'll rename it 
to hsusb-grp in both
ma35d1-iot-512m.dts and ma35d1-som-256m.dts in the next revision.

Thanks.
