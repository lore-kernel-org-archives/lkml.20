Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27552399011
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129170; cv=none; b=mKvlYfF0jYH1b518HnYzLeSUqpqHJho8EXY0pkY3AbxaSDFOQfJmRTDui3dHEhtsTNqpDKFuZ5Pl7uMbH09A9wQtRJlUOKIS0i/oco3cR1Jon1xrYDFa87E9YqgSTygxAg9wGnwwVoJHKGamcTwYyUQYuTXCENaZESajMqGbKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129170; c=relaxed/simple;
	bh=Qh8HX4SG8hlVTvvatY2+gdSsGr1WlvqLeOHOcENmNDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX674F5hz+JMeqdX2mBMCaknYALqaHpavnaUyxVwFlnOC9iRDI+01NeYAc2N9COcPxVmTK4iDzEYVyZGbNddyO22i1VedoJrh66jk5ofU2vXeODQ9MbyoHKolCA7lMniNOyW0DEoV8oX3EciWV/xIYbtLss6euImOVAWtJDTKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=ASqMI9/8; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="ASqMI9/8"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so1407319a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1789129161; x=1789733961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PL874DxmWdEEz+/Ho1XLM1gCTFYGrhEvvkDpUQlsjxY=;
        b=ASqMI9/8k23f1Ib/KP9IkEMywegZw/62+20wGo/4MF18r5nzgKfXBd0diYk68p5OD3
         L+j2VWyJvh/axrrRgZ3dtKTw2MgTwx1aLBL988qJ2+/I+eng4j5If8OFYdJbBfwwJrIC
         UzD06MGLj6+D69WMrn1FFTFy9d0AEffPSl2xK2L4M5carM+s55ux6NdNzxCDmwkRDmf6
         me4WtCO89elIEfo89GIn+TPTw2J0lgm3R76nf0BdFoMYeIkyWrOUmwaRpOY/nRUo7S3S
         XrrM9Tb5TAGj40yh78QwAQTxnj597S2cOLdW946hK7IfCTtjkeqU17KRWobgiORNjVme
         /3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129161; x=1789733961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL874DxmWdEEz+/Ho1XLM1gCTFYGrhEvvkDpUQlsjxY=;
        b=MoBAVo7nrjvakoGcPa9fshWmiCqkcUYt3hPb7p/7OV35eMgUDCqYerFc6s/OpYsE9t
         TTyURH9ITniBrj9JU9SROM3dKKbzbREmvYWRQgE+iQlPw8vouax5FOcpVTfVV4rE4UXU
         b2V1nGPWw36r09KGC0Pxx9Wdwu03TxkUSkk2V2+uYDp9J/taf1SR/0eLDP07qvuXd8sx
         2RzMv6y3Z04G9Jw3MdEcrTNoaqog8wB/6FOV4ENJyVpEsmvOh7e5Uphz473S8sInraWP
         HkDLRdoqNnKPfpg/znp2sGPdHASIvr2GBbHVWPJICrf3eX3OvKWVyM7gVn0sT93h2eqa
         n1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgBhOAh4ZI9BiilOXUqwuHEnXCB0id5h0O1L5ZgXnjDVbdFR0Dq+hPwCkmSoqXXjwL2vgCotayUuZWgI8=@vger.kernel.org
X-Gm-Message-State: AFuF++n79OO5vpGI/hsbRV1vOBrf9kQYY1mgEeyQm3+r2L1ZBN6VXkPH
	QHmjNh84Ga6ZcBdbIONt+ypYcmleQ2xubYSzfHJNqQFnrB7v5/coBgEkCKyR8QM7UQ==
X-Gm-Gg: AYBFou3HYMZYBu7WNJq+teJN3YQuroK66X5K5mQgXHdmCRTERhB1PGZLZ7pltLPQyVW
	i24+vSTPCLyOF/vnS+4vwhiDNvb0lm2RBqgHjBEeatsdbby4hKNv6usKB4S7fDVDmFeeMNE6iN4
	2CMvBK/W06k9PR3sqiQu+HY27vsY78SOcKZ4xF2WTOi2jG2CQly4T8mmnhY6dW+9y1r0yVlVRNQ
	e/0bP8IAqNa8fYW3vekwX/Apx4mwqd81fdjGTVtsk/Cwmh1R9JG+jwKq3P4RwW5mpAFdeTN/1ru
	Pz3dK4SwomVVdwZihJgeY3vuAo+3Bm2tj3GU4het1aLciaq8DFF/uHdt+5qgUmSOGB0pgFeC5lt
	/AitcAaT5jMxw/cgwpFX0h+UN0wQBPN5G6ibnidpJaIsEiSMwu2yOhNv5jyzezX5Gf1DLDfLLox
	09xkVBzdCXG7a6bvCIJZ5ozqnHWgrgStkMzsX4QeVRtNTQN3PqkfmMrSUTzxFvU9f/LRt5GagCa
	gSQ+oS0X29zM+oOvaM5Ar9lDOK85oXCGeAJXtJ+811XdZ4yjP7U7nAQKny5PmJQTG2Rw/gnwiJF
	Ikt4xgx6IPV+PaGggLh8/nVde/O/ErT0pGrVc8TVh7PbD4Q=
X-Received: by 2002:a05:6402:42d2:b0:6a9:b203:f410 with SMTP id 4fb4d7f45d1cf-6a9b5694f10mr1718054a12.21.1789129160539;
        Fri, 11 Sep 2026 05:19:20 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:d90f:783f:2e2e:893d? (2a02-a466-4d7a-0-d90f-783f-2e2e-893d.fixed6.kpn.net. [2a02:a466:4d7a:0:d90f:783f:2e2e:893d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm778079a12.25.2026.09.11.05.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:19:20 -0700 (PDT)
Message-ID: <bd032333-c557-4595-ae0c-6cb2971a9a86@pardini.net>
Date: Fri, 11 Sep 2026 14:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
To: Diederik de Haas <diederik@cknow-tech.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-2-c1b9e5f10cd6@pardini.net>
 <DLCE8BRWYCBL.2UH33L4RQMAGN@cknow-tech.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <DLCE8BRWYCBL.2UH33L4RQMAGN@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 11:52, Diederik de Haas wrote:
> On Thu Sep 10, 2026 at 10:07 PM CEST, Ricardo Pardini via B4 Relay wrote:
>> From: Ricardo Pardini <ricardo@pardini.net>
>>
>> The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
>> behind pcie2x1l0 and pcie2x1l2.
>>
>> Describe the fixed function nodes and attach ethernet0/ethernet1
>> aliases, so that U-Boot's fdt_fixup_ethernet() can fill in the MAC
>> from its ethaddr/eth1addr env. The on-NIC EEPROMs on this board are
>> not pre-programmed with a unique MAC, so this gives a stable MAC
>> across boots that both U-Boot and the kernel agree on.
>>
>> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index cfdb5c13f8606..550358a756618 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -20,6 +20,8 @@ / {
>>   	compatible = "friendlyarm,nanopc-t6", "rockchip,rk3588";
>>   
>>   	aliases {
>> +		ethernet0 = &rtl_eth0;
>> +		ethernet1 = &rtl_eth1;
>>   		mmc0 = &sdhci;
>>   		mmc1 = &sdmmc;
>>   	};
>> @@ -644,6 +646,20 @@ &pcie2x1l0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie2_0_rst>;
> 
> The new pinctrl reference is ``pcie_25glan_perstb_b_pin``, so this patch needs
> to be rebased.

Indeed; I sent v5 vs v7.3-rc2 which doesn't have your recent series 
fixing those. I've rebased onto next-20260910 which does, will send in a 
v6 - but it's really just fuzz/context changes.

I'll wait a bit until Heiner/Krysztof/Heiko chime in ref the binding and 
its wording as that has been contentious in the previous versions. And 
who knows what Sashiko will find this time.

> 
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x200000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x21 0x2f>;
>> +
>> +		rtl_eth0: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x210000 0 0 0 0>;
>> +		};
> 
> Described on page 23 of the schematic titled '2.5G Ethernet B' and ``U12``
> (ie RTL8125BG) is connected to LAN2 which has ``ETH2`` as label on the case.

Confirmed.

> 
>> +	};
>>   };
>>   
>>   &pcie2x1l1 {
>> @@ -660,6 +676,20 @@ &pcie2x1l2 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie2_2_rst>;
> 
> The new pinctrl reference is ``pcie_25glan_perstb_pin``.

Will also be fixed by rebasing onto linux-next.

> 
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x400000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x41 0x4f>;
>> +
>> +		rtl_eth1: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x410000 0 0 0 0>;
>> +		};
> 
> Described on page 22 of the schematic titled '2.5G Ethernet A' and ``U10``
> (ie RTL8125BG) is connected to LAN1 which has ``ETH1`` as label on the case.
> 
> So this results in:
> ETH1 -> rtl_eth1
> ETH2 -> rtl_eth0
> 
> This sounds like a recipe for confusion and/or potential future mistakes.
> I think using ``rtl_eth1`` and ``rtl_eth2`` would be less confusing, but
> I'm fine with another construct which achieves a similar thing.

Yeah, that will result in aliases `ethernet0 = &rtl_eth1;` and 
`ethernet1 = &rtl_eth2;`. It could also be `rtl_lan1`/`rtl_lan2`, or as 
the schematics seems to to use the `_b` suffix, just `rtl_lan` and 
`rtl_lan_b`, I don't mind. Raise if you do, otherwise I'll send v6 as 
you suggested.

Userspace will be off-by-one vs the printed case labels, thus _some_ 
confusion will remain, but it's already better than the current 
enP2p33s0/enP4p65s0.

> 
> Cheers,
>    Diederik
> 
>> +	};
>>   };
>>   
>>   &pcie30phy {
> 

Thanks,
Ricardo

