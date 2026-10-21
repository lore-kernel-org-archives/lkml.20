Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579186;
	b=S+Bzp9NcrVR7/ID8w2qaXab8v6aBpPSADIWdZKVU+4/8x+VMH4c0PNEimfCLB4FwLa7m
	 XeShgxpZdVDXacD0Sy1+3hIS8Zyrk2uQrzc9/0NzJEwiQzWShH8xP/2yQuPjg/amLCivd
	 5C6jPCYs+miKu7qpVJsFYpYQptHlgdwEOMHqItDawGq8hw/5kLxSovJgiXDol/A9zttbQ
	 z5lx3FzP/ojhvsevwgPygDvPMWWHHotjdjGdLaDiY+gslgIjpJULUbIWIcPakDlYu7Pu8
	 L+SgF8vdEve5ZS2vZ0XNH91QpwoADqWaNWtZF4kKGXIpmmZb9W9ywV4JZP2jtBa2new==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=;
	b=q2B3V8qcTChK1vX7dFfPw8KnMSk48WWTZFZkNy5S9kn5J48y/QPZATjctI/eNtcw08nc
	 7cp1ovsnVUjfT4Q41G17v92sPXaRJtaYJKv0KgIxACIwhmEwY+5lyyRaiLhGc2Ooh6qHW
	 z61IvanF0+21NTzJWff9dFv6rtq3aFnaibgFLEX5K/0mWCHV20k989xoY0h7S1DHS0dnW
	 FpTCmxKEHgrVvYX+u/QYd5Ei0MEWZ4UhWSZTs/0wdMynw1PXmb7DnaJf9pKYuRcFVBzrF
	 KPkYoXba99+WHaLK1g50Z8I+gxvD9JwERgBcFt9ODrr7+MSoaQSwlO/r76tBko3/yMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ke5PZvY6;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95EF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ke5PZvY6
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5e931215e5fso404318e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579185; x=1793183985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=;
        b=Ke5PZvY6UDEbXFwtSoW2xo02clTM1UgMiilCTj51zE3m8JZ75Zl5/klNG5IMcKzyKl
         MYyWUwpX2sJmG7YmF4xAcZmdnFWqKq009o9AOwuyhnYsBAqjBmtfKaZLUB5yl5WfTkL7
         txEy/cAm7EAal6GfPCl5q7gTzs6PeYIk9LQWnP68jI5m6N75KRo0rbVD/KQ1JVODnP71
         DpzkM5LpfiWr/GTffrrZTsHZHEN9+Ehs8aSTSpss6p7gQMsssCRjAp1RLGH8RekL1ofq
         wZ0n3z1Mppb/WVLPpn/5cKwf2h/nocTwQd1/PO+xA2tZgDe9y+YdUGxVtRKYYbJTPjBA
         Aeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579185; x=1793183985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aafQ9iCPHSVe3sQfOa/qU9zZlkpiMt393ivgSciYmVQ=;
        b=TixnHZLAVephD7CgOaUOatS29jTAtsCMOer08Vwxkab1WgPHYafcVLiuf6b37Mhtt4
         6SQa3/IJfA2n0eHETwQBY17Aj2ESRYcQbxEcAiGSjmENy+eby4CGuB4sAUDypuQjSPCO
         ALkBrrfSRVkaV5xlPZgHAY127LfK8PWXPl8C8XEM9m9U1WaKM9KjxX+SZsdL0bRWXi/n
         YbjMd2PD/0Sjuqm5e6wURNZXsjdrZdBT2/ueG0YDmP5+t/4TtDs8J0XIHa2rh57nwOZ4
         V4BDVQqlx/Fiimx01+GAOypMDw4hOEFKIVy4FgK46AP9UZlXKTecOI0gZzMNjNHLoHyN
         82pg==
X-Forwarded-Encrypted: i=1; AKwUvBwghOn2lwwA1VxKLFwX2iBWY87bO0IngP9wm8sSGP89qbQHVh2z2LSMhR41oXW8j6iRsSI2WjiMgg//0/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4jOqG+/52CRRdUtOma7pJnaXxYUXKPVSDBORPpiIMU0zFXa78
	TbR1ya7LdiBrlpzuNL0i69jv4pcVduF2/CeXi1hzhPmCYAtKlskaN2u7+LrApmwt
X-Gm-Gg: AYBFou2dODDofDHTe+jZCV9iSRus1tdtxX1me7nC7Lnx9xLZtHc5m7VRYGBZKUCOUTt
	6tMTdT48R3XehMGuIuJppWdQgrJjWme+4sQTYi4yWl45NHeBKzZo/s63wYF7m3aW90ayYI9s9u/
	E2Ug+pXDh+p93wQ9ULTbxy8ldKpiIc65+A3hdZc7DN4z+eh1S1+80DXQ/t7MlnCnY5lbfQFLpcu
	6Y+taTpfcs0B+JJ1iDeM6JeDnUnIPbWYjCHNtb0Bxtj8VEj4yGgwhjSW4nM4Q714ygi94sZiuBe
	vMj3mpQAm7SbJw8A9YB8pJut1iHtDtU42ODLyXa+nQSziZWJRgl96hVy0CROZrcWyI02LvuV8N/
	dJQO5o0YAQFRrqUuts5+FGZ7ftEuOx22yVlIwv/u9rQ2Vxg900LVBOxROXCv4Whs58RaOl3ppx7
	gAPKglDXKWCq3cyew74tqf1CHTLtC02/Ml1tAg/7yKXMiuA5dndUKxH+nqizZ/YCkLHCF+dBsov
	NXEn1jniKAj2iTEiLicgGpRxKTwxNAfdmb79AShevA99yb5YMqDuHtN6l4A0Zp1W7yLxdsp5g/s
	+YtJixWw
X-Received: by 2002:a05:6122:1b8c:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5eaebd96736mr504117e0c.7.1792579184449;
        Wed, 21 Oct 2026 03:39:44 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97f0a94sm2630002e0c.11.2026.10.21.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:39:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 07:39:36 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ernest.vanhoecke@toradex.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
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
In-Reply-To: <an3tiDOUUYLb8PAq@SMW015318>

Hi Frank,

On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > by an ILITEK ILI251x capacitive touch controller.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > >
> > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > >
> > > why not share one dtso?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > There are two main differences:
> >
> > 1. The mezzanine one uses different backlight controll pins, so here we
> > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > in the one without the mezzanine.
> >
> > 2. The touchscreen GPIO and interrupt pins are also different with the
> > mezzanine board.
> 
> 
> And there are for imx8mm
> https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> 
> https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> 
> Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> work on optimization solution.
> 
> If use nexus connectors, we can share one dtso now if there are not
> clock settings.
> 
> clock patches is close to pick up
> https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> 
> Frank

We tried to make the change to have a single overlay for the boards with and
without the Mezzanine. However, in the current state of nexus connectors, this
can't be done cleanly yet. When trying to describe the hardware at the level it
exists in, following DT guidelines, and using nexus connectors, we still need
two separate overlays to enable the native LVDS with and without the Mezzanine,
so we don't really reduce the maintenance effort.

See the changes at the end of the email, this is the closest we got to a
correct and clean implementation that would allow the usage of a single
overlay.

The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
Ideally, they would be defined in the nexus connector, as shown in the diff.
However, after enabling the connectors in the overlay, the pinctrl groups
remain unclaimed. The reason is that nexus connectors have no driver to claim
the groups.

    root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
    ...
    pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
    pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
    ...

There is nowhere else in the carrier dtsi's where the pinctrls belong.

The pinctrl groups thus need to be added to the touchscreen node defined in the
overlay. However, the pins on the Development Board (which uses the Mezzanine)
are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
and we cannot claim them in the overlay. Because of this, the Mezzanine needs
a different overlay, which doesn't claim any pinctrl.

We like the idea of a single overlay for both carriers, but sadly the nexus
connectors, as they currently are, are not ready to enable this. We therefore
have to move forward normally and once connector support matures, we're happy
to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
and for other modules.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..d73a7e9042ea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,41 @@
  */

 / {
+	lvds_connector: lvds-mezzanine-connector {
+		compatible = "toradex,lvds-connector";
+		#gpio-cells = <2>;
+		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
+		gpio-map = <0 0 &gpio1 6 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
+		pwm-map = <0 0 0 &pwm2 0 0 0>;
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
+	touch_connector: touch-mezzanine-connector {
+		compatible = "toradex,touch-connector";
+		#gpio-cells = <2>;
+		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
+		gpio-map = <0 0 &gpio1 1 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
+		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
+				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 846b36706821..736f034c7550 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -11,6 +11,46 @@
 #include <dt-bindings/leds/common.h>

 / {
+	lvds_connector: lvds-connector {
+		compatible = "toradex,lvds-connector";
+
+		#gpio-cells = <2>;
+		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		gpio-map = <0 0 &gpio5 1 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
+		pwm-map = <0 0 0 &pwm2 0 0 0>;
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
+	touch_connector: touch-connector {
+		compatible = "toradex,touch-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+
+		#gpio-cells = <2>;
+		/* LVDS_TOUCH_RESET_CON# - Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		gpio-map = <0 0 &gpio4 30 0>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		/* LVDS_TOUCH_INT_CON# - Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio4 31 IRQ_TYPE_EDGE_FALLING>,
+				<0 IRQ_TYPE_EDGE_RISING &gpio4 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff 0xffffffff>;
+
+		status = "disabled";
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X14";
@@ -159,6 +199,16 @@ &i2c5 {
 	status = "okay";
 };

+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;  /* SODIMM 44 */
+	};
+};
+
 &lcdif3 {
 	status = "okay";
 };

---

Best regards,
Leonardo
