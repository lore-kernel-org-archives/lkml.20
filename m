Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D08642E417;
	Thu,  3 Sep 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469116; cv=none; b=WVo9ALy4N4l5YhMq1csRpHFQ/U/bQP18z6nJY73KbLpg6aC0PfoVHIt2nsV8jJDkxkvw6TnlGz7mAa5Pni4s6iSBbCTrGluZAcudnqOiuwhuP5yQW3qKYcwSM8TNk2Df2PcmtNeN6AiUoKaO/XmbwQr7lyTdNz4xQ3YkTm3uK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469116; c=relaxed/simple;
	bh=WyLghW2Yt/XW78tU77Jb3nPkQaysxAJGDVLx3yZO+Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5MNGwl9BUeAov1wD9Bn6/VNUKWed8uFIBx3qzK2y/NF1IXkl/WXlKsr5dxfGjPKEilQlgQkLAh0Lv975woFwzEx5V/57RsrPsmLFFvEnwRcWu1fMuMFj6MK53NUsRvycBE55Csa0um0pB1al/t6K76+xsX226gmoPozhRSNANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B7/WRPfB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VZrSnuTu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B7/WRPfB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VZrSnuTu"
Date: Thu, 3 Sep 2026 22:58:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788469100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W477L/II8FxU5jV4Gwnwh9dbk0oImJX38o52mJuSnwY=;
	b=B7/WRPfBfjfmwBzOzIgig7Kl95rP6c+s5VisJc0Zey7gf3liJKOgu5BNMObp3Uhh732l5B
	LEwMz8J6Osovp+XoQgAwBODrbmV9kC9WC/xbaZgUCPz3x1IFu9nbq18DRnK4IqebrUhjBw
	k2RVUQSLvuZo1sx0raqyS1dyh9vs9vAhDdqxNq93GDY3+ydadlr1ODfs2qYymFKPc58NnC
	CaXPcaNL8t9USO7AjKV9O84+mV6V1ugRIVp46WNZfVpqTw3CBJfPHxbzd3JJsP0Tziet7C
	3JD3DJ7qUDDaOmjxSd4xnBNyj6WQv2PHQ8nc4SeM96pWMKfUEwAJr/8OnDvJyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788469100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W477L/II8FxU5jV4Gwnwh9dbk0oImJX38o52mJuSnwY=;
	b=VZrSnuTuOcjcBb6FSC5SVK0IX0F+vYHhmZrg0oqoQfFwXMGoqCA1uMo6zOoDdbzJ4NE80Z
	hxzivuQsfZk9+qDg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <gzc6sljogjijrlz5jdwxbbf352xigfpuaxeo542zcsq72dncqb@lltv7los5lie>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
 <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
 <apmfqyeWahoR0wab@apocalypse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apmfqyeWahoR0wab@apocalypse>

On Thu, Sep 03, 2026 at 06:26:19PM +0200, Andrea della Porta wrote:
> Hi Gregor,
> 
> On 18:04 Tue 11 Aug     , Gregor Herburger wrote:
> > The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> > Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> > the spi interface.
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index 0fc57e72632ed..81aec81c5ce12 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -69,6 +69,14 @@ usb_vbus_default_state: usb-vbus-default-state {
> >  		groups = "vbus1";
> >  	};
> >  
> > +	rp1_spi0_default_state: rp1-spi0-default-state {
> > +		function = "spi0";
> > +		groups = "spi0";
> > +		bias-disable;
> > +		drive-strength = <12>;
> > +		slew-rate = <1>;
> > +	};
> > +
> >  	rp1_i2c4_default_state: rp1-i2c4-default-state {
> >  		function = "i2c4";
> >  		groups = "i2c4_2";
> > @@ -94,6 +102,14 @@ &rp1_i2c6 {
> >  	pinctrl-names = "default";
> >  };
> >  
> > +&rp1_spi0 {
> > +	pinctrl-0 = <&rp1_spi0_default_state>;
> 
> Is there any reason to avoid defining the CS pins as pulled-up gpios
> in the rp1_gpio node and then referencing it in pinctrl-0?
No there is no reason for this. I will try it and send a new version.
> Something like thie following:
> 
> rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
> 	function = "gpio";
> 	pins = "gpio7", "gpio8";
> 	bias-pull-up;
> };
> 
> &rp1_spi0 {
> 	...
> 	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
> 	...
> };
> 
> 
> Many thanks,
> Andrea
> 
> > +	pinctrl-names = "default";
> > +
> > +	num-cs = <2>;
> > +	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> > +};
> > +
> >  &rp1_usb0 {
> >  	pinctrl-0 = <&usb_vbus_default_state>;
> >  	pinctrl-names = "default";
> > 
> > -- 
> > 2.47.3
> > 

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer
