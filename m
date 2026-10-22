Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661151;
	b=MCVDCVifg0fj3/26Usjzs7frecb+8SUrSHOEP3mga/6uNFUJ5Nsegsm/kCwtGeEmp6Pv
	 Kdm+6xpCEa+lyw4BmXULYjf29sRrp+TYpJY8jnvwTg7TIolgim+63Z8MZy8XUQEQuo6PL
	 dgPu10lwj5fwNFj4gQboPjtwKmFxfgNTrQifApXwUOsyCs7yhqLx+Tmw8eLfb5sHEeuWU
	 +sNDo5tZ+LmT1bMrVKjYj/QN3viKySh8PhES7a9CT3qhdHAKfpnSdFguyO+H7DWfwU9Ks
	 TZWiUUSM3nC2HUELb52Dd9I8H6j/msuwmNgtbq8k3tPlfYJHSxSyNJPMYW/mwhlNtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661151;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=;
	b=YlzEfgMsGp8vGvsmLADHm+fuRFeOPg8fv9krgE56GNAuIFl374XizKeG3We8yDorH8xi
	 9ADSwbT2ieDj+ojBk3vzwpBEqxN3u8PYmpIn4PaW/U3w+18f9/x30wQ3Nxt/ZWEP0sw/0
	 yiRxGkySLzO5Uh/HPNhayn0ynrgN+Hyv72ElAomB4J5idX2vJlhWDldbQTYLMtAnz0WOp
	 VDTxTSL2ztpN577fRPWlizA5XjP8WQadstLuIQJT3ODfYU0G2NAOW0vDpunB99r99qRlR
	 1SYzuk8xqKjwbd+EWx9ca7UsBvKwIt6RIFv9oDzbxuwBjxlSx4zbl2PmX0+zIUvGaBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=m3R8cqC9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A98606A31D;
	Thu, 22 Oct 2026 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A98606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=m3R8cqC9
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ABE0A1F921;
	Thu, 22 Oct 2026 11:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792661141;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=; h=From:To:Subject;
	b=m3R8cqC9bN5rVAb3hFAteUVOrvqJuH6oDlJJpvVXlBd2+MauylWg+f/aqhz9A0QcA
	 d+OsiaxgschYB0IDOSnkv8s1mse4K9lQTg6WbjqzTuO37lEq+/gleMONdXV5NKwTxC
	 T4Jenk+3pBQoOrN466ELQl4fWydTW2uz9dr2iS2ICkQD72X7+GYQX5m03cFwPgrbV7
	 jjSqCQjxDERBCC4WDQdiyb4Nzia6QVjizaKvZx5iQQMW6eZEhhee4o6n0jOwAkxeNO
	 YVX3LOAYYYNq90P7evM2r98BcmO910JKpFCoR9EcsG3jGHQ0jX4v9byTr3zuV1wb1p
	 mWEi80kUDDNDg==
Date: Thu, 22 Oct 2026 11:25:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@nabladev.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261022092536.GA232648@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>

Hello Christoph,

On Thu, Oct 22, 2026 at 09:12:12AM +0000, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@nabladev.com>
> Sent: Wednesday, October 21, 2026 8:56 PM
> > On 10/21/26 8:37 PM, Francesco Dolcini wrote:
> >> On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> >>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:

[...]

> >>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> @@ -60,14 +60,6 @@ &ecspi4 {
> >>>>     pinctrl-0 = <&pinctrl_ecspi4>;
> >>>>     pinctrl-names = "default";
> >>>>     status = "okay";
> >>>
> >>> Drop "status = "okay"" too , since this controller will be unused ?
> >>
> >> you can instantiate a new device on the SPI bus from userspace. up to
> >> you, but if I was a user I would appreciate to have it enabled.
> > Good point -- Christoph, is this the (use)case here , can the user do that?
> 
> I don't think that's the case, since there isn't currently an SPI device
> connected to this interface. Nevertheless, I'd be interested to know how
> to instantiate a new device from user space.

Documentation/spi/instantiating-devices.rst

Francesco

