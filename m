Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607344;
	b=iqt5jpxsU9ANh0GIw49W3nLpBail7bCnRtTubnPkjCfMT7P4s935HU1NobVkj6PGDMT1
	 Uz4PPanPxvh/OHB1AcrLVlGULftWyS5jTOyQYrmW1kJHrEPJtHZIuZlsem659Vji3a7oG
	 hl2BbNMkqeRU59ey/1Z94qmNILs6mcph8JkY56M2cMlY26Xr+7Uq66HNyXG8T1bKXXcvR
	 PkyyGcZGGp6A5WGG07C2fHLSz7kY05xkqis33VIR513IPMBKsG3C7CcJyufGlXWeha/JB
	 qM1IecrNbogUKmCLBdXxapJvX+0IqvHrwqltReBYk63Jv23LVhEFzFa8/zIqqz3rsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=;
	b=RwE3v5MjI4/CLljcdedYVA3BzCZpYj9Tepue+AkuztZvO5XoX5gAXhpXvRixkVKpxWeb
	 Za73vvaYUDagx9up9WJvUf73XwpAyrUJdFsVmO6g22JtquBdzmYzz33tOrYAF2NimoPWe
	 8FrguOD7rK6crm9iOLXsbxsYFSUA4jR2mbP9WmLZ+nU8qup+GEYAST07GUON4ZRjudKQU
	 PKPZXzyb7XoDjARG/gr+ahxVOi1gHCiWxKgXv4gFYw5vMH62zk4jPKXZnmvy5fiEnvGHq
	 qVMsamVsDlsU9NcU35SUNxONNPvHWzkZRcmqygvcNXbSVOE8JfRa+7iXof9mPtmw/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUtD7FE+;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99152606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99152606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUtD7FE+
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso702235e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792607342; x=1793212142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=;
        b=dUtD7FE+TVZASY5X8bCnwl0NBlSB8Hc5GYh6WumK2NKn+3cqR7ELszaVwjmPUJgFMl
         xTJanywv4wxxxGQqM1CcZdgUA6gnqmEsYd+/IXwj9/j1Ak3Rc+XfSe+Y2Ug/QsJNskoj
         nzCgJsaWznraLXnVCqGmUylYwfPsD3dMKewPEJCFlVqIWgStF6N8s662PxT2gkPNxDB+
         NzmvWNmq7Q3nNilzrvcs6WkP7kumhMmzJ+lTYewM6XWWkHEBcnT51b5VCLh/nBwqBX+9
         HM2m91JCJNtrn5TrWGLdkp9/q4V8zE5vV45PYNoEGZUM7paSfOO0vq8yvZLD4x8BLNqS
         lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607342; x=1793212142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keAdan3S+AhmivIc4eVUa7LHn5sNz32xNdidLDde5Rg=;
        b=b+udKPy4akQxX0NhQDy+0L1gV6u1KtoT3DuCFJ+bdTIjQPl0zfsgZ7tbGks0HIua8W
         F1WIZJGcAzT0PbXOAagSuOS3cCofeWhkY3N9GHfdinqZ2j3VTrnjkV1tdoWz3wOX5/Oo
         AuCVZKlpZi9EsdzXte0ENXlvyeOzymYEZq5/a/Rs2Wls4WVAbLBb0uGrLF76AZNxGEt/
         BKh1AkmLjPboRKT7xeoFARf+0AC1XkIu6U9TP7QqLf29jFDkU9vQKhMHOIP47k/cWPhi
         CsgmUuKUoZ2GzZd2LGmjLxKHhMFpX46Z3PSgzY22WCKjWGZuagazDZXX2gmNYns4G+mu
         tJQA==
X-Forwarded-Encrypted: i=1; AKwUvBwc63Sje4sbnw7EiS20E4DQitfH7g4kLF5pP9XqaJwiO6kTeGGWcExm5PaweBCVRpVNfY7wyKwFb4xP4TA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEtkfZKm6doFNWlPBvxITMtSIjqdoqZBuhUk7By2xxzXUuu1fL
	QDDQ3u7INF9ElFHtdBRIAvv82mUZq5xonhMnbL4augSNwGXaVuOdjCN/
X-Gm-Gg: AYBFou0ZdUwlBwjq8g8dt8LpLCC0fM5YN8hfO1tmKY1D0LQIkrLkqRTJVXBYQ7ASQ5g
	HX4QdCns1PwXiR8ML7sIvcfhK8hZzfpZSZF4ynB5ojToPoPVnO3ssmfPJqy9/QjUIdpV/+cRwHf
	LvQNwtQPDdaU6/uEHJ+jMgyIIVO2HLSyILNIGRZh5Ng8GfdmRg2wXl3EZjHk46WMvs7CHCe1M1n
	tb1kLjQUzdeSX6rah6hHD/uGLy4pLqROSEcGQ9s9FP5v7kstLpMi8ngZsAKiKI6Y1sd8Y2HsAE/
	1+l/sFAnhplMWhUrOTKKJ6ww10f0LBmorJMHanzXPPz1GC7nsvz1b9AE0t9zNbmC/6Rd6m44U/P
	ypIa/n0K8KOwOmze2i7j9bAwXUSFiFXSNoRN8U4fVvzKheYiRMnuw0ExweI964Jr1NMn0+QJGnW
	8AABPAa0tC8ngLstWAxIMRo2ogFrSfMP6MW8XX5DDo5YJMSrtjDZbW9iKV5/gSpN7IF4jqdjSY8
	ftPhUEUSBV0ZnoGR7HKTEROHliGj8ncgpoM2PVLvihcj84wGDLZVnG99FOqMhk=
X-Received: by 2002:a05:6122:54f:b0:5ea:e324:7c0c with SMTP id 71dfb90a1353d-5eaebea8e44mr1145897e0c.22.1792607342092;
        Wed, 21 Oct 2026 11:29:02 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97d336fsm4115246e0c.9.2026.10.21.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:29:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:28:54 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <7fhtj462lymwxqcaakvocw3cngvauksghxavv25mmfbjxtz3gr@b2r6lb2b2djn>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
 <atjShkhCdLzf921d@SMW015318>
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
In-Reply-To: <atjShkhCdLzf921d@SMW015318>

Hi Frank,

On Wed, Oct 21, 2026 at 09:56:06AM -0500, Frank Li wrote:
> On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> > Hi Frank,
> >
> > On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > >
> > > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > > >
> > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > ---
> > > > >
> > > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > > >
> > > > > why not share one dtso?
> > > > >
> > > > > Frank
> > > >
> > > > Hi Frank,
> > > >
> > > > There are two main differences:
> > > >
> > > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > > in the one without the mezzanine.
> > > >
> > > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > > mezzanine board.
> > >
> > >
> > > And there are for imx8mm
> > > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> > >
> > > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> > >
> > > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > > work on optimization solution.
> > >
> > > If use nexus connectors, we can share one dtso now if there are not
> > > clock settings.
> > >
> > > clock patches is close to pick up
> > > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> > >
> > > Frank
> >
> > We tried to make the change to have a single overlay for the boards with and
> > without the Mezzanine. However, in the current state of nexus connectors, this
> > can't be done cleanly yet. When trying to describe the hardware at the level it
> > exists in, following DT guidelines, and using nexus connectors, we still need
> > two separate overlays to enable the native LVDS with and without the Mezzanine,
> > so we don't really reduce the maintenance effort.
> >
> > See the changes at the end of the email, this is the closest we got to a
> > correct and clean implementation that would allow the usage of a single
> > overlay.
> >
> > The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> > and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> > Ideally, they would be defined in the nexus connector, as shown in the diff.
> > However, after enabling the connectors in the overlay, the pinctrl groups
> > remain unclaimed. The reason is that nexus connectors have no driver to claim
> > the groups.
> >
> >     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
> >     ...
> >     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> >     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
> >     ...
> >
> > There is nowhere else in the carrier dtsi's where the pinctrls belong.
> >
> > The pinctrl groups thus need to be added to the touchscreen node defined in the
> > overlay. However, the pins on the Development Board (which uses the Mezzanine)
> > are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> > and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> > a different overlay, which doesn't claim any pinctrl.
> 
> I met similar problem, see below.
> 
> >
> > We like the idea of a single overlay for both carriers, but sadly the nexus
> > connectors, as they currently are, are not ready to enable this. We therefore
> > have to move forward normally and once connector support matures, we're happy
> > to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> > and for other modules.
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > index 72a4f846d694..d73a7e9042ea 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> > @@ -4,6 +4,41 @@
> >   */
> >
> >  / {
> > +	lvds_connector: lvds-mezzanine-connector {
> > +		compatible = "toradex,lvds-connector";
> > +		#gpio-cells = <2>;
> > +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> > +		gpio-map = <0 0 &gpio1 6 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#pwm-cells = <3>;
> > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > +		pwm-map-mask = <0x0 0x0 0x0>;
> > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	touch_connector: touch-mezzanine-connector {
> > +		compatible = "toradex,touch-connector";
> > +		#gpio-cells = <2>;
> > +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> > +		gpio-map = <0 0 &gpio1 1 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#address-cells = <0>;
> > +		#interrupt-cells = <2>;
> > +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> > +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> > +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> > +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> >  	native-hdmi-connector {
> >  		compatible = "hdmi-connector";
> >  		label = "X37";
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > index 846b36706821..736f034c7550 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> > @@ -11,6 +11,46 @@
> >  #include <dt-bindings/leds/common.h>
> >
> >  / {
> > +	lvds_connector: lvds-connector {
> > +		compatible = "toradex,lvds-connector";
> > +
> > +		#gpio-cells = <2>;
> > +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> > +		gpio-map = <0 0 &gpio5 1 0>;
> > +		gpio-map-mask = <0xffffffff 0x0>;
> > +		gpio-map-pass-thru = <0x0 0xffffffff>;
> > +
> > +		#pwm-cells = <3>;
> > +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> > +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> > +		pwm-map-mask = <0x0 0x0 0x0>;
> > +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> > +
> > +		status = "disabled";
> > +	};
> > +
> > +	touch_connector: touch-connector {
> > +		compatible = "toradex,touch-connector";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> > +			    <&pinctrl_i2s_2_sync_gpio>;
> 
> Thank you try this method.  Can make a pre-defined label for it, such
> such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....
> 
> So touch overlay use this label directly, like other port, i2c ...
> 
> After nexus improve by support mapping pinctrl, only few line needs be
> changes.
> 
> The bad things is that it need define NULL pintctrl for i2c gpio expander.
> 
> It is worth to try.

Just to clarify, do you mean doing something like this in the Dev Board
dtsi?

    &iomuxc {
        touch_conn0_pinctrl_gpio0: touchconn0gpio0grp {
            fsl,pins = <>;
        };

        touch_conn0_pinctrl_gpio1: touchconn0gpio1grp {
            fsl,pins = <>;
        };
    };

This gives warnings in dtbs_check as it doesn't parse the pins array correctly:

    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio0grp:fsl,pins: True is not of type 'array'
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml
    arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pinctrl@30330000 (fsl,imx8mp-iomuxc): touchconn0gpio1grp:fsl,pins: True is not of type 'array'
            from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml

Is this what you really meant, or did I misunderstand?

Leonardo
