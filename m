Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A80449B2F;
	Fri, 28 Aug 2026 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919290; cv=none; b=PFRwP2cV9p5ID7fzp8Jcbt2CeMkjUgg1YOPX0sOYMYwJozwFy0VlYQv36G5VGOPDmVxc/D3gqw70lZOjMPjlvQgHSxEL3g++htIfvmge0ywJ9tZONar28x3SlqI2Sw2lBnNMB0ZZryBOGJXkh+9J5CGE9uKifV7U51a7yK6tTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919290; c=relaxed/simple;
	bh=P/m70n2jgQfbGmIHTqiYcqbL5X6LYUYH4JoBQU3+Ric=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQiC4H460iHUClxS57Hegzj3HlYDeIXUxbWFm9Tr2KQqFzaWc8kkuVMMvm3WzMJst68l8dYeaF/Q9vQbmNktonvXaahuXV3k5TgvAI9N6LIEtlauVvez3IkG4wawwowV51X67ui+0zYzOCDWtnnAIL6godG/HJ6b1sqU/oBk0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZNaQRRzJ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZNaQRRzJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=msvDF/LcXKGcuEENSdT1nkJoOjtd4vV0hLHcxOpOB/Y=; b=ZNaQRRzJ6UqWH8EuUm79pM+zlc
	Gd/esYsnOYqhYI2iVEjEAB9i584MruJIlnem5CqaHGU91jt/WCjkeZkjmFXrHJUSnZDFduLW8eGJp
	rX7r+7aPLUk1s/t4EQRVmgTWA6kua4gZrfcjhwKNrUTUxrtQ+ufikb7K1ZHK2CFu77NrZqcfJHtR/
	iDkE/JqPz5aLRXLLkTdg14II7gx05qL8vtvlmJgtP0LgJptN2vCP5jB6ar0H9s3eBGghQMNQIpTN0
	E1uPFBV6EFZLTCYRnie2bgBGB7XIXR+FNA3jBpjk+IpRMDHxpQyaBvV+Gex6C+IDq4carWtV8SN3Y
	5hnak8uw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Date: Fri, 28 Aug 2026 14:14:22 +0200
Message-ID: <4512468.iIbC2pHGDl@diego>
In-Reply-To: <apFpPP1O45BWXDv5@5be1eda4e59e>
References:
 <aouw7rH6FZxscUTO@0d3a7a881997> <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Rudi,

Am Freitag, 28. August 2026, 12:55:56 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Rudi Heitbaum:
> On Thu, Aug 27, 2026 at 03:25:23PM +0200, Heiko Stuebner wrote:
> > Am Montag, 24. August 2026, 04:52:02 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Rudi Heitbaum:
> > > The rk1808 is the npu die in an rk3399pro package. It is wired to one
> > > of the usb3 controllers rather than to an external port, and it needs
> > > its reference clock running before it will boot, which is exactly what
> > > this driver exists to do for onboard devices.
> > >=20
> > > It takes no supply from the driver: the rails are sequenced elsewhere.
> > > Only the clock matters here, and that is already optional and handled
> > > generically.
> >=20
> > the "elsewhere" might need a bit more explanation to verify it's the ri=
ght
> > implementation. Even if the regulators are always-on or something, we
> > still want the supplies defined - for future uses.
>=20
> As follow up on the bringup of the Rock-Pi-N10, the proposed change to th=
e dtsi
> for the rk3399pro-vmarc-som is here, but needs the provision of the usb f=
irst.
> https://github.com/heitbaum/linux/commit/6b114b6fff4022c330003d7f70ce0991=
5ffd774f

I might have formulated that strangly, what I meant was, who is enabling
the power supplies.

The "NPU Power" part of any rk3399pro schematics (should) list 5 power
supplies for the NPU block itself:

NPU_LOGIC_VDD
    --> regulator likely named NPU_VDD_LOG_S0
        --> enabled by NPU_PWREN_2 gpio fixed regulator

NPU_EFUSE_VQPS
    --> regulator likely named NPU_VCC1V8_EFUSE
        --> enabled by NPU_EFUSE_EN_H gpio fixed regulator

NPU_CORE_VDD
    --> regulator likely named NPU_VDD_S0
        --> TCS4525 regulator with voltage being set via the i2c controller
             inside the NPU - but enabled by the NPU_PWREN_6 gpio from
             core RK3399.

NPU_CPU_VDD
    --> regulator likely named NPU_VDD_CPU_S0
        --> enabled by NPU_PWREN_4 gpio fixed regulator

NPU_ADC_AVDD_1V8
    --> regulator likely named NPU_VCC_1V8_S3
        --> enabled by NPU_PWREN_3 gpio fixed regulator

Naming might vary, I found just some EVB schematics.

Someone needs to enable these, so the question was, who is doing that?

Thanks
Heiko



