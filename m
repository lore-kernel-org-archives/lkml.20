Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673640;
	b=mceYT3k3gDHidWP1t4uyviWrP5Gf2orFi1ERY2nj5SuKdnAFWyOI3XUy3vQUO++r67yv
	 vrsd6sv+1tQ1P2CIeaK6aC1K7auqCdAc4RfsfWSP7PWcYjWehuNrCOLxnQvS1tHYpEx9f
	 gzDUVwChOr1f1wrdgUnSVFLl6kL+pPq3acGtMsWOFMnnB9LAe31vlL1S/k+vgP5c2fF4y
	 00BSkXGRl3dORjmSDl5wliXgLzkJBG1mLUpFUYVq+Z0XEYp0xi0cb4ZVxgzmksko8a3rY
	 npGcBOpkKEM4UrXW5Q8iMiiVfDAb+HzQHEsvGRQ99TB8maDehKoeneaauGTvuSdPGRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=;
	b=2vJ580pDRWMFueTwCMZ0CSO1WsHzMBONW//3/roCcwwW3RBqT7+y9AnL2hpC7kpjgvS6
	 tu/L6CvzYb7MKojIKrL78DodGKKBv6NMSAZfyY50nAL08xQzpuFiccBXrm8PWMahCs5ro
	 hWiaXBqJKtTS5Ay9Q7TPR2ouiRs3Xit5En5l0YEO07gGm5dkVD4YEgDzMNK/5MRLGBMi2
	 t58Es0MKYctE9sdL0q+nVPdup91EznIZaRzfR0FghxnyFIHq8kq8QJRpzEYnI0iRQkX5c
	 XW1WJTtJRBb/3S3sZvDbA2wGbuAvV2uRYcXobiB4rAczkdUXu8XZhbS+3ECX6SOmpRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ck5Ibvxo;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3AC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ck5Ibvxo
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc603a168fso562136137.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673639; x=1793278439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=;
        b=ck5IbvxoohuaLvEhR2fUCmthBU4munsOm8/TwICdDT8dGBNhZbs/U0l/xEomGAIs4P
         yR09KUfGIovUyXQyeK/FA5aN7veN4mvb05fpehbdVt60nFxFPtn2Gm8bcocxneNd6yEm
         2eEp/2of1ht4zT8VxzcdL6v3T4h5YSfIHOTNrZWy15DwesHdfazlQVW0Mr9hbsYle1jP
         nqqAjvh4do653B3zc79L0Nj+lDefRwAFi2w5a558WCS/cgfDr/gDYADU7R93xRFzmVy3
         Xi4zK0KNVn90HSo1dQ+9i+1Uj9WgJfXPROVix9vi6YkZ8+3BJy6znaHnJbtzAlzb2FGg
         n3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673639; x=1793278439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+z1Rhi72CLA+3ImnBbdKj5H+tRrYkqgiI5aTXiScNiA=;
        b=T+Km2ZrWkX2R51eCYU+fxNlfjKE3o7fomNVDumCYo0Tx3493uen0nvAmH4iKrfLDHu
         Y5oV3/DUYk/hN7qMSh5bFbScJmdGt61ACEZMCFtlGCUrXJ6Mm/VE2HnciVOjguU6V3jb
         PkH5SluFtBNsaZWXKenjy/goct2eja0UWU3NGp1hlG2iSKXTaJ4h6WJvbWJ+7uFX8DnO
         wgNPEJV5eOXNw2LPy/bIWjh3muiHHFdM/iSHN2D4yqBmCD32HrAevnR/P0UMETO0qKAL
         G+PZIe6xDZf5tvq7xdt9vDfK6ZfhAvcOgmju6/MSm7YJKPLREPvsY3Mw1SmASo1l2KTz
         btJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCAUBgYfY5v0eFAJswJc+LAVCdhiglgOHgBBM2btx7el4ECK3Blz83cptV/kwGuDccxPmsPUcqC9RFYIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvgzx12a3POJHJP/azani518lmty8vWPrbHC1xoNz1bw0+b/0J
	l3WNqa2zGchEoUgp3+y1moFWGpuyvyKqz7RreHZkSS1G+tEARDc9aFrp
X-Gm-Gg: AYBFou1aHTjBTTCVNP7dwL+yCOSI2/etJyFiQk/nV0JrJaj44+EgfcWqeM6cbr1pBie
	nYjr82C/vHwF/AU2IsnCI4d4cwvhwjlKYIyNRLvVyrMUDp6/3GtMF5kzP+4HD3v4GlneilovBWl
	FHjWQx1m4KCwY7bhjSr+lbsur29qN3AVVBqmJUGNiTPO12+4QWzC8rhoCDFpF/o9e/K7Mwgn+DD
	n7wsqkNDz0Dvu/kFrj7OJcZXzCS5u8yINlpbp+qSktC1smbYOv03p1ZrJt5ZHTGtdprUhMiPfbP
	RZJz9j91IA/+JzKCtfj10fy5ajeSsgs+YLP+rAyrjyA+cULZipSzyZpxN9b6YLiRCHdKO36D6LV
	B7rA4H+MBmYlUPhCRN6BBipS4HbjSncr1Vwb6gnBjnO4Ov8QBaqO3vFoejTwgOEvftgHIAXhHXo
	Bv3BdqXtmIUTWE3ICQtDr/5edboMPE/N7jozgd6a/85oUuqISHlXwAh2fNghafqxGmxqnUYY1l3
	1LeBRQJLFGRtft1YLHZ2cztVp51hzIOpHNgVxSZqhP+Dz4Us/lDbOKJz4ZtZN6o1Eyl2ZZMZaJH
	PzDCJIsWg5blKX0pGl/K
X-Received: by 2002:a05:6102:149e:b0:7cc:9d46:f091 with SMTP id ada2fe7eead31-7cc9d470bbamr1373148137.24.1792673638506;
        Thu, 22 Oct 2026 05:53:58 -0700 (PDT)
Received: from leonardoc-nb (201-43-119-247.dsl.telesp.net.br. [201.43.119.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc921b5daasm6073113137.2.2026.10.22.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:53:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:53:51 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <k4khlrkmuqdigphq5q5irhkegtrxvb3z3sljt7blazq3bjtzlq@l25wykhzg7ys>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
 <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
 <atkGl7o2Z2D2qIcP@SMW015318>
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
In-Reply-To: <atkGl7o2Z2D2qIcP@SMW015318>

On Wed, Oct 21, 2026 at 01:38:15PM -0500, Frank Li wrote:
> On Wed, Oct 21, 2026 at 03:28:54PM -0300, Leonardo Costa wrote:
> > Hi Frank,
> >
> > On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> > > On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > > > Hi Frank,
> > > >
> > > > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > >
> > > > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > > > >
> > > > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > > > ---
> > > > > > >
> > > > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > > > >
> > > > > > > why not share one dtso?
> > > > > > >
> > > > > > > Frank
> > > > > >
> > > > > > Hi Frank,
> > > > > >
> > > > > > There are two main differences:
> > > > > >
> > > > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > > > in the one without the mezzanine.
> > > > > >
> > > > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > > > mezzanine board.
> > > > >
> > > > >
> > > > > And there are for imx8mm
> > > > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > > > >
> > > > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > > > >
> > > > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > > > work on optimization solution.
> > > > >
> > > > > If use nexus connectors, we can share one dtso now if there are not
> > > > > clock settings.
> > > > >
> > > > > clock patches is close to pick up
> > > > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > > > >
> > > > > Frank
> > > >
> > > > We tried to make the change to have a single overlay for the boards with and
> > > > without the Mezzanine. However, in the current state of nexus connectors, this
> > > > can't be done cleanly yet. When trying to describe the hardware at the level it
> > > > exists in, following DT guidelines, and using nexus connectors, we still need
> > > > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > > > so we don't really reduce the maintenance effort.
> > > >
> > > > See the changes at the end of the email, this is the closest we got to a
> > > > correct and clean implementation that would allow the usage of a single
> > > > overlay.
> > > >
> > > > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > > > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > > > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > > > However, after enabling the connectors in the overlay, the pinctrl groups
> > > > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > > > the groups.
> > > >
> > > >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> > > >     ...
> > > >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> > > >     ...
> > > >
> > > > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> > > >
> > > > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > > > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > > > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > > > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > > > a different overlay, which doesn't claim any pinctrl.
> > >
> > > I met similar problem, see below.
> > >
> > > >
> > > > We like the idea of a single overlay for both carriers, but sadly the nexus
> > > > connectors, as they currently are, are not ready to enable this. We therefore
> > > > have to move forward normally and once connector support matures, we're happy
> > > > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > > > and for other modules.
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > index 72a4f846d694..d73a7e9042ea 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > > > @@ -4,6 +4,41 @@
> > > >   */
> > > >
> > > >  / {
> > > > +	lvds_connector: lvds-mezzanine-connector {
> > > > +		compatible = "toradex,lvds-connector";
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > > > +		gpio-map = <0 0 &gpio1 6 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#pwm-cells = <3>;
> > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > > +	touch_connector: touch-mezzanine-connector {
> > > > +		compatible = "toradex,touch-connector";
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > > > +		gpio-map = <0 0 &gpio1 1 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#address-cells = <0>;
> > > > +		#interrupt-cells = <2>;
> > > > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > > > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > > > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > > > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > >  	native-hdmi-connector {
> > > >  		compatible = "hdmi-connector";
> > > >  		label = "X37";
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > index 846b36706821..736f034c7550 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > > > @@ -11,6 +11,46 @@
> > > >  #include <dt-bindings/leds/common.h>
> > > >
> > > >  / {
> > > > +	lvds_connector: lvds-connector {
> > > > +		compatible = "toradex,lvds-connector";
> > > > +
> > > > +		#gpio-cells = <2>;
> > > > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > > > +		gpio-map = <0 0 &gpio5 1 0>;
> > > > +		gpio-map-mask = <0xffffffff 0x0>;
> > > > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > > > +
> > > > +		#pwm-cells = <3>;
> > > > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > > > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > > > +		pwm-map-mask = <0x0 0x0 0x0>;
> > > > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > > > +
> > > > +		status = "disabled";
> > > > +	};
> > > > +
> > > > +	touch_connector: touch-connector {
> > > > +		compatible = "toradex,touch-connector";
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > > > +			    <&pinctrl_i2s_2_sync_gpio>;
> > >
> > > Thank you try this method.  Can make a pre-defined label for it, such
> > > such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> > >
> > > So touch overlay use this label directly, like other port, i2c ...
> > >
> > > After nexus improve by support mapping pinctrl, only few line needs be
> > > changes.
> > >
> > > The bad things is that it need define NULL pintctrl for i2c gpio expander.
> > >
> > > It is worth to try.
> >
> > Just to clarify, do you mean doing something like this in the Dev Board
> > dtsi?
> >
> >     &iomuxc {
> >         touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
> >             fsl,pins = <>;
> >         };
> 
> In your board,
> 	fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
> 
> If use i2c gpio expander, which have not pinctrl, you can try
> 	touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};
> Do you meet this case in your board design?
> 
> Frank

On the dev board, these pins don't come from a GPIO expander, but I
tried both methods:

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
            fsl,pins =
                <MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x1c4>;	/* SODIMM 208 */
        };

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
            fsl,pins =
                <MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x184>;	/* SODIMM 210 */
        };
    };

This doesn't work, as the touch controller driver isn't able to claim
the pin muxes, and its probe function fails:

    [    8.181431] imx8mp-pinctrl 30330000.pinctrl: pin MX8MP_IOMUXC_GPIO1_IO01 already requested by 30330000.pinctrl; cannot claim for 1-0041
    [    8.181468] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: pin-6 (1-0041)
    [    8.181483] imx8mp-pinctrl 30330000.pinctrl: error -EINVAL: could not request pin 6 (MX8MP_IOMUXC_GPIO1_IO01) from group touchconn0gpio0grp on device 30330000.pinctrl

The other alternative was to use empty pinctrls:

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {};

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {};
    };

This does work, but it also gives warnings on the dtbs_check:

    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp: 'fsl,pins' is a required property
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp: 'fsl,pins' is a required property
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml

I also tried a few more configurations, but there is no alternative that
works and also adheres to DT guidelines, while passing dtbs_check.

Leonardo
