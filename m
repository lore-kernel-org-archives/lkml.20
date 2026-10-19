Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B44E5346;
	Mon, 19 Oct 2026 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413746; cv=none; b=g09o9XVEZgwpU5MzbB1/UQFCgpj9eEeTEqQSgBbLOH893WtehB06oo/F9nGhJDcOPQbkn+7VxDXiN2U0OcPxQD72Ob9exKaLX6jTQpOImpS/0MpT6pwAtAGQmnb0VZb5GnZXvPAhv/sAPapc+hPwZ2mcFe4HCekXD5FX+dkgu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413746; c=relaxed/simple;
	bh=7rdBxsPN7jiyPDmYCgYr1wLCPcQQc60AuhIJ/RzGIO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftvBp14dAShTr7LD/tDH/UBfeGHHXzxUkZyVfVTXpH7xKjqimotTExRuN791LAiEcT8g1jwP/J96GE8fSaG4m125U6sl2rNksVbbs0N/UN1dWz9b16mNbmGKmfz5A2KN3gijSLaNnXuP0yYkhgAZLgXTWL+GY59Jm74HhM7zuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FXe4IpBd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FXe4IpBd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36FA71A126A;
	Mon, 19 Oct 2026 12:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 095FC60582;
	Mon, 19 Oct 2026 12:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 164D410328D37;
	Mon, 19 Oct 2026 14:42:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792413733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wT9cr19djIZjjMcHHSB8MIQuwEfBnI0V8SxyV1ge0ZY=;
	b=FXe4IpBdbRfsFkD7ThrqoLCIoPyFdRvGilBxoMYfwQVV9TiZ+xJSUeEC8yDZiqeJ4VtbW0
	G8Rn1rNBRDy6mgSy07K2Z/SdYzLj7vWIhiOk88FXzlLZdJbnSq1ZHTupdfDzY2MJHPo6h1
	s+1InRofRUi/Pn1TJ5g/cBfjoUeEWfaSOKYMn81RmBwWjDU8kWRezCyjh2fVp8GSUpRJG1
	xMMgzE0UmL4FnaZSl4DFc3uQGwBWVYNzs5UMX3lPOHbEPdPslwhW0/oAThW0L+1fOpo8lH
	5XhzLXzBdBG3MF19bkE+3uasdzAAwiREXSHFdSfwa8iwcfCVpd2zRL/yKipcBA==
Message-ID: <c67d8a1e-34a0-4e58-a4cc-64003526dcd7@bootlin.com>
Date: Mon, 19 Oct 2026 14:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve
 memory for LPM metadata
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abhash Kumar <a-kumar2@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Thomas Richard
 <thomas.richard@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prao@ti.com
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-6-richard.genoud@bootlin.com>
 <702b80bc-23b1-4057-b613-aa5aef2c8c7a@ti.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <702b80bc-23b1-4057-b613-aa5aef2c8c7a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 17/10/2026 à 09:05, Kumar, Udit a écrit :
> 
> 
> On 9/21/2026 8:23 PM, Richard Genoud (TI) wrote:
>> Declare a carveout memory region to store LPM metadata on J784S4.
>>
>> For Jacinto devices, this memory region is needed for saving ATF context
>> and the certificate information of ATF and OPTEE and DM image. This LPM
>> metadata area is firewalled to be accessed only by TIFS.
>>
>> U-Boot R5 SPL/TIFS will use this area to save and restore:
>> - ATF context
>> - ATF certificate information
>> - OPTEE certificate information
>> - DM image (which has been copied in memory at boot time by U-Boot
>>    R5-SPL)
>>
>> At resume, U-Boot R5 SPL is executed and detects that the board is
>> resuming (with a flag set in the PMIC), then it:
>> - brings out of retention the DDR
>> - retrieves the LPM memory region from DTS
>> - authenticates certificates from LPM memory region and applies firewalls
>> - asks TIFS to restore TFA and its own minimal context
>> - starts TFA on remote proc
>> - loads back DM image from memory and jumps to DM
>>
>> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
>>
>> As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
>> enabled.
>>
>> NB: This memory region is not part of DM memory (which is not retained
>> at suspend)
>>
>> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   .../boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi    | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
>> index 81b508b9b05e..1c0c1533f0a3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
>> @@ -17,6 +17,12 @@ c71_3_memory_region: memory@ab100000 {
>>   		reg = <0x00 0xab100000 0x00 0xf00000>;
>>   		no-map;
>>   	};
>> +
>> +	lpm_memory_region: memory@ac000000 {
>> +		reg = <0x00 0xac000000 0x00 0x00300000>;
>> +		no-map;
>> +		bootph-pre-ram;
>> +	};
> 
> Could you move this carveout near to optee
> 0x9E500000 to 0x9E800000 as LPM memory,
> 
> Since 0xa***_**** is used by firmware and this is just place-holder for
> lpm meta data.
> 
> Also better to move this k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
> file as these two SOCs are same and uses same map
Ok I'll change to 0x9E500000 and merge with patch 7/7 (j742s2)

Thanks!
Regards,
Richard

> 
> Thanks
> Udit
> 
> 
>>   };
>>   
>>   &mailbox0_cluster5 {
>> @@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
>>   	};
>>   };
>>   
>> +&mcu_r5fss0_core0 {
>> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +			<&mcu_r5fss0_core0_memory_region>,
>> +			<&lpm_memory_region>;
>> +	memory-region-names = "dma", "firmware", "lpm-metadata";
>> +	bootph-pre-ram;
>> +	status = "okay";
>> +};
>> +
>>   &c71_3 {
>>   	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
>>   	memory-region = <&c71_3_dma_memory_region>,
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
