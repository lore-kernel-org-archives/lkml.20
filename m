Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F79446BF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194677; cv=none; b=VuiKCQw1zHDiauSHn7HqvLDEatmaRXgRojt8rHjN477Ru6v4bwM7X/g3cN0o1fK5Yv1Tu1p21XAObJj6Wqk/0hfEkBfXFTOsZ/Qq6WDi0pCkDiUbb5zVablarjpfLFfbkyPTRYq3Y1AswYO970VLATloHEO+ZwsNBWf08DJeroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194677; c=relaxed/simple;
	bh=oHX5S5UfFPvt8CW5tDL/Lr+kdvnzvnuIjZbXiUvlxCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qp/qltJpYdIq986NBnqMYb+8d5jYmRWWlBQQBHhDNzsly/04zA0e2jPVmh3BY09T2dMZ0SoXv/J8evgFhz1s55N0kdahqmuhfyPOJJ5cyLi8V2mBiPrWkC3cVWIgezLUj0KQ25EFKyATfhQbB/UM5xXLCb9TfNWugpj2Tk+M7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1625654a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194667; x=1791799467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFDKBytFqpiCAKHq7794WGTm1eiUeSTtEFvwUnjGNk4=;
        b=0vbBiXqXi2jcsmJX39Ybjhjh2GM+b35yA7pmWRXI6Ae/LyfRj35TeMfKIApP98A1sl
         ilkCyPQmdJ7Z9F2uRpAm7Zz8I+MWI0xMMOuQyMm7x+2NmwVMwsfobtB125KWDbspQ6sm
         eCLJOdMt63cKoyK5FHpx0qt8LXf+g6pXWv0rFVMakUjBLfhTqwaFUXJ50LzFwhV/pOrd
         sslrJ6kZzILefXygMjC+n4/2tuJ1ftGpdyQax8TPRndMXV1EZ6ZulJvBH68qloBZ6V7v
         GME3ItCwZSOrvrxoiFah77LYG9pkv+ICyOPtFRNItGcICThX3B4ffeSUaLEYAiJDEdZS
         mwvQ==
X-Forwarded-Encrypted: i=1; AKwUvByBkj8TgxcXYfZgARAzCkzdvlC6utVdQDqCIBN3nQz78SCTtq/aJMXG/zzJsaztDzFMuWTXVQva0CYJu2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHdBITTonj09w2egE0eTYK/nUzA5TOo9BESh0Ek/qE1ksTQUCS
	3SU3NFhDXI/+em6FjMRvjFO0AiBJYM8g2DoUd+o6nuNJsVW2sw3Y5z9K
X-Gm-Gg: AYBFou0q1/2gxiJuoaf1ZdwQt5POg4AjzqDpJk1GcSOTs4H1UiUY4GUkOjYSIYG0QXB
	LafN7fn5cBMF88LBFxYPkLKwhDssrSJrXbqrT58ppPgUQCeNkMH5ySRbnB/5M2Ax7hJrfCFsRBx
	j+tuU1e+AwI0fUTDpSLK5r4y35SH6hbOkjb2SmCOqf9ZfKZj2VD1myrNUwZU1Ufa9Gxv+9pfKR/
	O4WX5FU4P8A2vYRqDzlG5BNVFug91Kf82to/Du9UOoOuryj8N4asIyQ4IM34sFDkW9JexpwIVtK
	B5T0OhjU2oZaOzrCF1nGNs5KP2p/tiS8CIFGv9BGsE/rbtu5wPwOqmCKhSX5W/yKHWhf6X29hKl
	0VDZetfaqrcItteeA94M304AcMmzEqjEsUBZzGRXU9Wsx4oP/st1WJyMKcrvIMQVnK4F8ZE+hje
	WPsDc84pAs97RkywSRtKehdHoCIHohhV46KztXsqOVdEp4dTyrC3maiW4MZYn+Cpb6HmofH1L7q
	ZMFwJ6flHpGb1qF0hWMemTgWA4f
X-Received: by 2002:a05:6402:2421:b0:6ac:6968:9424 with SMTP id 4fb4d7f45d1cf-6afada1af02mr6404847a12.33.1791194667149;
        Mon, 05 Oct 2026 03:04:27 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb020bdb9sm3060982a12.23.2026.10.05.03.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 03:04:26 -0700 (PDT)
Message-ID: <f246ff74-a30e-4381-a6a0-ab51261f9e90@linux.com>
Date: Mon, 5 Oct 2026 11:04:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-7-tanure@linux.com>
 <d1ae6c21-72a9-4bc7-aaaf-9051d0f6b1b0@bootlin.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <d1ae6c21-72a9-4bc7-aaaf-9051d0f6b1b0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2026 21:58, Maxime Chevallier wrote:
> Hi Lucas,
> 
> On 10/4/26 16:40, Lucas Tanure wrote:
>> The board carries a Realtek RTL8211F gigabit PHY on the external
>> management bus, connected to the MAC over RGMII.
>>
>> Enable the controller, hand it the ethernet pins and point it at the
>> PHY. The clock delays RGMII needs are supplied by the MAC rather than
>> the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
>> kernel programs.
>>
>> The PHY interrupt output is wired to GPIOH_6, so describe it and let
>> link changes be reported instead of polled. The PHY reset pin is driven
>> by an RC network on the board, not by the SoC, so there is no reset line
>> to describe.
>>
>> Tested at 930Mbit/s sustained receive over a minute, with no MAC error
>> counters moving in either direction.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index 0fa83362b417..5d0365ddde72 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -14,6 +14,7 @@ / {
>>   	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
>>   
>>   	aliases {
>> +		ethernet0 = &ethmac;
>>   		serial0 = &uart_a;
>>   		mmc0 = &sd_emmc_c;
>>   		mmc1 = &sd_emmc_b;
>> @@ -256,6 +257,33 @@ xtal: xtal-clk {
>>   	};
>>   };
>>   
>> +&ethmac {
>> +	status = "okay";
>> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
>> +	pinctrl-names = "default";
>> +
>> +	/*
>> +	 * The RGMII clock delays are added by the MAC, so the PHY is
>> +	 * asked for the mode that adds none.
>> +	 */
>> +	phy-mode = "rgmii";
> 
> In devicetree, "rgmii" means that the delays are inserted at the hardware
> level, i.e. with longer PCB traces for the clock. With the above comment,
> this is therefore wrong.
> 
> As a rule of thumb, "phy-mode = rgmii" is almost always wrong.
> 
> The right behaviour here is to represent the HW as it is, that is to say
> pass phy-mode = "rgmii-id"; delays are internal. In DT we don't say who
> inserts the delays (MAC or PHY), that's for the drive to figure out.
> 
> If the MAC inserts the delays, then it needs to fixup the mode passed to the PHY so that
> they follow this doc :
> 
> https://www.kernel.org/doc/html/v7.2/networking/phy.html#rg-mii-electrical-interface-considerations
> 
> Maxime
Hi Maxime,

Thanks for the review. You are right about what the mode names mean,
but after a few tests I do not think this board can follow it. I tried
all three:

   rgmii-id    23 of 23 received frames had a bad CRC, DHCP never
               completes.
   rgmii-txid  receive becomes perfect, but then the peer sees nothing
               we send, not even an error counter.
   rgmii       1Gbit/s, 930Mbit/s sustained, no error counter moving.

There was nothing to tune on the PHY side either: the RTL8211F delays
are single enable bits, TXCR bit 8 and RXCR bit 3, on or off.

The modes whose names promise internal delays are the same ones where
the glue switches its own off, so there is no value that is both right
by phy.rst and working here. Keeping "rgmii" and the comment, so the
next person sees why before trying it. Glad to help test and convert
this board if the driver's phy-mode handling is ever reworked along
with the other Amlogic boards.

Thanks,
Lucas

