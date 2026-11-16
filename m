Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817433;
	b=Tfd85AytFwyH7UNoeAV/y6t4lhsUUwH1hWtMF5eROk4Lg+0xIFsqBM58ERnuCbZnF37+
	 dZvvfCLjt/RqWtQ+J2ZiwZXT/juhUuGHZSWxDDQjMucpmpi/UaocnrjvOK7EIIQQ9GuVZ
	 K3nxIUeIsVSfWlKvOO5Q/JMeJHcI2I8qSTsm3xNDGZU2phHwciJhogw/tp5MHWBpxZGKM
	 DXvWkNtZVRASBXkuP0jpYUGYwc45MkfjbGfxL47ohlk8IZ8/qf4LMLY9AaeTPJJ45F6wt
	 GYoh7FvnlAogwjJ12K/qmsGWb5LO/z0qJA3i0KZ1zcEnSaFvihs7suLe3H2U8nLrzZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817433;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=l7+A+m7qDvZ8iB7GbQqDyIh26UTo2sgEvVBcZb8qmw8=;
	b=vQz5EQsX/lOTcaaiazxs/CkAR+gtrDBoTtWQOGGpyz4YcFN6Gm1Gwl/iQtV1x3aavCwd
	 DqPvj9JoPXr+TxydbOpDCwmb5z6DFRB+mHzAMq63sJuTw5TRHVOm+mT2kME+04UB7rJtt
	 qnrUIZRTpmmQ2A7nUOOXl5y3LgqQ5glfl4J7CWeDD5a93GE/2VML5gBo31mcTsbtBKuKf
	 N5Urjm2xOEAmDaa3/J7f4z/cYBLRQv2Taf+gNWAtBSv0dIUgNnC2kGkWmx5YAlk5FQein
	 +MHZexTGkLN5F76LkPKqgDV1Bhi4hYlZa3ULZbCQizZhNd5LI61uADHDUK3AMSs6bzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ya7+q6ls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C4606A32F;
	Mon, 16 Nov 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ya7+q6ls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD46D1F000C6;
	Mon, 16 Nov 2026 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817433;
	bh=l7+A+m7qDvZ8iB7GbQqDyIh26UTo2sgEvVBcZb8qmw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ya7+q6ls9GtEN5gVEcZOCqk0bZp9uDURQQ6zmi0PHbf7bURiFXjIfrT1NywXBrjKi
	 Dl36Uuno6krYk46X9g7LKe1IYUFIBveEsGnD1PYvbbjmViYO1M7DE8lzJrVYznI++9
	 AH2k1t+KRFbcd8SpY0REX6wHQ6PE16ELPlGlrz3sBnhESCK/j8GoLTi8W7kNxe2uXa
	 77n9Cdzhn4Tq6o/JGwUYzh1wQ23X1S9p8+PTbqj+A+engoBzmZAbIPKMvAvF7Gv4vM
	 RGr0tU5tKkBFGTCbtX0XfMJIZ9TKKyGE93JCWn0dkTqaO476MzLaGgAVyq/s+p0zM0
	 A1H/aPeRKWhXQ==
Date: Mon, 16 Nov 2026 08:23:50 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree <devicetree@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit <spacemit@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261116082350-GKB100890@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
 <20261114075506-GKB100523@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>

Hi Sandie,

On 14:49 Mon 16 Nov     , Sandie Cao wrote:
> Hi, Yixun:
> 
> > From: "Yixun Lan"<dlan@kernel.org>
> > Date:  Sat, Nov 14, 2026, 15:55
> 
> > Hi Sandie,
> > 
> > On 11:33 Mon 09 Nov     , Sandie Cao wrote:
> > > Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.
> > > 
> > > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > > ---
> > >  .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > > index bcd533484a73..051046fe90b2 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > > @@ -177,6 +177,28 @@ &combophy {
> > >          status = "okay";
> > >  };
> > >  
> > ..
> > > +/*
> > > + * Onboard SD card slot:
> > > + * Please insert or remove the SD card while the device is powered off.
> > > + * It works as a boot media. so set it to non-removable.
> > > + */
> > Is there any public schematic available for FML13V05? I guess there is
> > no CD pin (Card Detect pin)? as no "cd-gpios" property seen here
> > 
> > The above comment isn't really useful or even correct, I'd suggest
> > drop it.
> 
> In version 1 [1],  the patch is cd-gpios = <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;
> but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
So, there is gpio cd pin, but didn't work? it's hard to say without
the schematic, but can you check with hardware people, if it
can be fixed with SoC's internal GPIO BIAS pullup or pulldown?
So, gpio pin is able to reflect card insert status


> So In version2 [2], the patch changes to non-removable.
> And In version3 [3], add comment. 
> 
> The options: cd-gpio, non-removable, broken-cd  all work on this board.
> 
it works, but does not reflect the hardware status

> We just need to detect the SD card when bootup, don't need the driver 
> to detect hot-plug event , non-removable should be suitable and faster, 
> we recomment to use non-removable.
> 
No, this isn't a valid reason, it's use case should have nothing to do
with the property.

My point is: if the gpio cd pin still doesn't work, and the SD card is
actually physical plugable, then should use "broken-cd".
 
> 
> [1]: https://lore.kernel.org/all/20260922110231.3426011-1-sandie.cao
> @deepcomputing.io/
> [2]: https://lore.kernel.org/all/20261020081633.3673704-1-sandie.cao
> @deepcomputing.io/
> [3]: https://lore.kernel.org/all/20261102060012.100623-1-sandie.cao
> @deepcomputing.io/
> 
> Best regards
> Sandie
> 
> > 
> > > +&sdhci0 {
> > > +        pinctrl-names = "default","uhs";
> > > +        pinctrl-0 = <&mmc1_cfg>;
> > > +        pinctrl-1 = <&mmc1_uhs_cfg>;
> > > +        bus-width = <4>;
> > ..
> > > +        non-removable;
> > "no-removable" property usually used for emmc chip soldered on board,
> >  so there is no way it can be physically removed.. check 
> > Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > 
> > For cases that no CD pin (or no GPIO CD pin) designed for SD card from
> > hardware schematic perspective, using "broken-cd" is a more proper way,
> > it will fallback to use poll mechanism to detect the card, please check
> > 
> > > +        no-mmc;
> > > +        no-sdio;
> > > +        disable-wp;
> > > +        cap-sd-highspeed;
> > > +        vqmmc-supply = <&aldo1>;
> > > +        sd-uhs-sdr25;
> > > +        sd-uhs-sdr50;
> > > +        sd-uhs-sdr104;
> > > +        status = "okay";
> > > +};
> > > +
> > >  &uart0 {
> > >          pinctrl-names = "default";
> > >          pinctrl-0 = <&uart0_0_cfg>;
> > > -- 
> > > 2.43.0
> > 
> > -- 
> > Yixun Lan (dlan)
> > 

-- 
Yixun Lan (dlan)
