Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB731B130;
	Thu, 27 Aug 2026 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833730; cv=none; b=hr+2Rcz7WYOc96msSniLw9qA/Zki4m1lfYtVFJLWTrbOm162Kp6ZdKLUt/9Zil5221WFBa+RqlMvXMwM/XXykxfxsDtgLFSN+rE4LsKvf/v5joMHgbb5JXhWTE366CaAURp/O/AnDl3zL3EdLciOmwxQ5NQns3+BaRPi4Eki2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833730; c=relaxed/simple;
	bh=eUYdrSXjrJxYHIQtpcN0R307V+DHwArUuS3RzzxhF0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjSz2d+GRmofPnL2Jwgl1pXwrNMhYEzsETGD4VR8RfmsFxOGLeIajJdUEuahrXqn4Fv0SqlPfRRaCtlO/ru7RQFD9ilYWOenigI0RudR7zGPfNhpH7P1TFfDaJBKmf/WMLAdpZ927JAgLRCDQQzxo8W7FqFA5DTrX8TommiTBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Bdtxqsv1; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Bdtxqsv1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oM2gEe+6IgBb27GSgQlHVdE0f2UqFfybi7RdgQ4vT/4=; b=Bdtxqsv1KerI+YBpZ0/FgzcwG2
	TDcrDBDg3qTuizUAelMfoGxaiLOi4oywMUBTrF6R5/BQAPwtneYYXW0W0ENxjFaxetTm06VRCq3Lg
	CSxwzT//K2CaFkLnbrsDrV0QNSwhM3tY/gE4HBGG6mmuZeeTdWjdZeqP+rYdGbzw2X2vKRajABqzO
	55onwotYC7wXMWk/P/ej0ZaBUcgQm6BpkFcMnVJwDcDOD+ghc2oPA3wyecNGODUsLiIpnFhYyyroK
	gCUNYJQkGo90NVv3GsBL/9m+SobFhCH003svEDyfmfmL0EKvrBbvUfToTNc5chjBlS2qdrOxrq25J
	+TPOn8Aw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33642 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wzZDr-000000089dQ-1MLz;
	Thu, 27 Aug 2026 14:28:46 +0200
Message-ID: <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Date: Thu, 27 Aug 2026 14:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Chancel Liu <chancel.liu@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
 <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

On 8/27/26 10:56, Chancel Liu wrote:
>> The dailink_master label was incorrectly placed on the codec sub-node,
>> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
>> and frame master with SAI2 in consumer mode. This contradicts the SAI2
>> node configuration (assigned-clock-parents, assigned-clock-rates,
>> fsl,sai-mclk-direction-output) which requires provider/master mode.
> 
> Just a small question about the commit message. As far as I understand,
> these SAI2 node configurations only describe SAI2 providing MCLK to the
> codec. A topology where the SAI provides MCLK while the codec is the
> bclk/fs provider is common. So the original configuration seems
> self-consistent, not contradictory.
> 

You are right. Such configuration are possible.

However, on this board's wiring, SAI has to be bus master for BCLK/FSYNC.

Shall I reword commit message or is this explanation enough?

BR,
Primoz


> Regards,
> Chancel Liu
> 
>> Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
>> with the codec operating as I2S slave. Also remove the spurious clocks
>> property from the codec sub-node which had no effect in this topology.
>>
>> This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
>> PEB-AV-10 Audio/Video expansion board.
>>
>> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
>> index bb740f845855..8957b24a7ad2 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
>> @@ -77,13 +77,12 @@ sound {
>>  			"MIC3R", "Microphone Jack",
>>  			"Microphone Jack", "Mic Bias";
>>  
>> -		simple-audio-card,cpu {
>> +		dailink_master: simple-audio-card,cpu {
>>  			sound-dai = <&sai2>;
>>  		};
>>  
>> -		dailink_master: simple-audio-card,codec {
>> +		simple-audio-card,codec {
>>  			sound-dai = <&codec>;
>> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>>  		};
>>  	};
>>  };
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

