Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAF73793B4;
	Thu,  1 Oct 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834439; cv=none; b=mA8webArp2XKzn2oMmogj2NKCKdyA9/CPdoTh3EiiokqLhmiiVF/wvQ2gW016KOwk/RH/Au/G50LyTDR8ojpNRdi8lZFWITrD+/Z0iNJl17NUUUvdjfm09/nzmcB0ASc4dYsbFx0+s5aopjLCU9QngkFoFxm7WyAp8OFwXzNuf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834439; c=relaxed/simple;
	bh=fTBzghfiQ6G266t0RzcRm9TGNS3+YrZKvd4H+bWPwxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBcbwSGWPespc84WzF+jqp8ia7BRZa1/9hTgAhLBCDSgpCVokHqu3G9NSqqPKRKOaI6JZAtmI7g6RIvy814zOluNt0vfzERrkhe98PkviwwJL899DX3MvCx5onR5chNWasP26JOykSHguBNcezG6l7r9b1PEPIUyLVJxjhpOdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:54566 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xC9qQ-00000001W8y-0Rgz;
	Thu, 01 Oct 2026 08:00:34 +0200
Message-ID: <37eb1b08-0430-48d0-bac9-88a4a1d8db8c@norik.com>
Date: Thu, 1 Oct 2026 08:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: imx6: phycore-som: Convert to generic PHY
 reset binding
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260930102532.2262700-1-primoz.fiser@norik.com>
 <20260930102532.2262700-4-primoz.fiser@norik.com>
 <ar0vxTCkxOg00jhn@SMW015318>
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
In-Reply-To: <ar0vxTCkxOg00jhn@SMW015318>
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

Hi Frank,

On 9/30/26 17:50, Frank Li wrote:
> On Wed, Sep 30, 2026 at 12:25:31PM +0200, Primoz Fiser wrote:
>> The phy-reset-gpios property on the FEC node is deprecated by the
>> Documentation/devicetree/bindings/net/fsl,fec.yaml in favour of the
>> generic reset binding on the PHY node itself, described by the
>> Documentation/devicetree/bindings/net/ethernet-phy.yaml.
>>
>> Move the reset GPIO from &fec to the ethphy child node as reset-gpios.
> 
> This movement may impact back compatiblity. Any other user use
> phy-reset-gpios under $fec?

Yeah, good point.

I was tempted to convert due to checkpatch warning.

Since it's a legacy board, lets keep phy-reset-gpios as is due to
potential backward compatibility and other unforeseen implications.

I will drop this patch in v2 and convert patch #4 to phy-reset-duration.

BR,

Primoz

> 
> Frank
> 
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
>> index 9070388eecb0..88eabc7af6b7 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
>> @@ -56,7 +56,6 @@ &fec {
>>  	phy-handle = <&ethphy>;
>>  	phy-mode = "rgmii";
>>  	phy-supply = <&vdd_eth_io>;
>> -	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
>>  	status = "disabled";
>>
>>  	mdio {
>> @@ -65,6 +64,7 @@ mdio {
>>
>>  		ethphy: ethernet-phy@3 {
>>  			reg = <3>;
>> +			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
>>  			txc-skew-ps = <1680>;
>>  			rxc-skew-ps = <1860>;
>>  		};
>> --
>> 2.34.1
>>
>>

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

