Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097C38F232;
	Thu, 10 Sep 2026 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053841; cv=none; b=TJq8EnFXw6Bch4KUy7jF3rUfOBBq9EGgiZiUxfbzNSpDTRyeQMcEBCHEULUlM7AO+v1GolpNPriyJ0w4cIviBe6+YQBNStZsqVl1ukBYvk0ZKvnohhQlFjtO5qe9VMWcj7dN8BIxop5xPAbSqgo0ZKwSZI8UKOsrm284686AtPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053841; c=relaxed/simple;
	bh=AJLf0w2MP0N0+yUWTqolfEUFEKi+szr9GRVAR7TB2Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/fEBkIDlTuesvsWbCH4tbzl3sty7aZZ/rrPIAv11Xkry0BSOOYnmJQV58nxrHb8gppddChuZDxuulifEfClgj/yW+3eNIemavDtoTgdDcWxVKfK3w5FNFU9zZfDbzUIZPNWa2ctaKZnS+SzLRcB9oLQ3BvQFjSm76OdwC0KWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: laurentiumihalcea111@gmail.com
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: frank.li@nxp.com
X-PTX-Original-Recipient: festevam@gmail.com
X-PTX-Original-Recipient: elena.popa@nxp.com
X-PTX-Original-Recipient: consmin.stoica@nxp.com
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: imx@lists.linux.dev
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 697642020A4;
	Thu, 10 Sep 2026 17:23:50 +0200 (CEST)
Message-ID: <818e023c-8a88-4736-9577-355e97da4466@pengutronix.de>
Date: Thu, 10 Sep 2026 17:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 elena.popa@nxp.com, consmin.stoica@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
 <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
 <f0136c29-e372-4ae9-972a-23d7a60d75e4@pengutronix.de>
 <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <a41510f0-8906-4698-9919-b65b40cc9b89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 9/10/26 5:08 PM, Laurentiu Mihalcea wrote:
> 
> Hi Ahmad,
> 
> On 9/9/2026 9:20 AM, Ahmad Fatoum wrote:
>> On 9/9/26 5:39 PM, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>> +	memory@80000000 {
>>> +		device_type = "memory";
>>> +		/* actual size filled in by the bootloader */
>>> +		reg = <0x0 0x80000000 0 0x80000000>;
>>
>> If the board has at least 2G always, this is fine.
> 
> the board only ships with 16GB LPDDR5 so yes, it'll always have at least 2GB.
> While the current size is fine, maybe it would be better to change it to 16GB?
> Will have to update the commit message as well since "up to 16GB of LPDDR5 memory"
> might be a bit misleading.
> 
> my other option was to leave the size set to 0x0 like some QCOM DTSIs seem to do.
> Not sure what the preferred way of handling this is?

IMO, the DT should not claim a memory size that's less than what's
available across variants. So either 2G, 16G or just dropping it is fine
by me. No need to change this on my account.

>>> +&usdhc2 {
>>> +	bootph-pre-ram;
>>> +	bus-width = <4>;
>>> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>>> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>>> +	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>>> +	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>>> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>>
>> Looks unexpected to have same pinctrl groups for the higher speeds.
>> Are higher speed modes even possible on this board?
>>
>> If not, I would suggest dropping the extra states.
> 
> The pin configuration is chosen to meet the timing requirements of the 200MHz
> state. Because of this, I would expect the configuration to be appropriate for
> lower frequencies as well.
> 
> The intention is to use the same configuration as MX95-19x19-EVK since, from what
> I've been told, the trace lengths are similar to those of the EVK.

Ok. If you can actually attain higher rates this way, then nothing needs
to be changed.

> Thanks for taking the time to review this! :)

Cheers,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

