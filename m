Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004067;
	b=4pWnmaW+w+1C/KQkGrMJ8v0u7Qj3R0wq4wZJpy+0BJrEDBNLp4aOOv1j2a5K7KQVaQZ8
	 cUDaoQXeYr1RXV+Z1zigqtrNyDMB8o4QimZWas7U8yjh2k/bCvxOWUP+Ke5152BPpt5RQ
	 maxlsCZtoH+InuAUs95t1R9bzYe7d2E9ItwYG46vtxMgUK31MwXkIrPPqfuvU1OUBjt+v
	 OekHRCLdLhMKf8YdoICeXvyZ+79v2SW1eTXH9NKh8besmILQi+whk7N7MLolHZz6F8R6J
	 cEKbFopIwCs6x3kHv8j9Rb5EE1qNu/YpCL0MqMISkOFv+E2hlSPSbry8EP/y9kAoQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
	b=wcIshrwX4rWVLRf0gFCaHdU+h+i4LuTtKegto2/4Hy5C8ZjnCKGFp2lp/J347p5uIZ7y
	 enPlKzLvGQZ8KkiBC09C9jE2upZvIJjK4CGWZJi3QgU8Y07bWh63AwK+WQULWHkwy3fv7
	 iW1kOhojj0ku1ZhXJcNfxDT+p1Mp/MeUBRe7bK2+DVnIW9Vr6HPFtXiESQq2sGpC3Fv6W
	 scjFJcw1EKlGlaYu+eMz5PCuCJDB6ueTfd55JqguhpWOOtaIO81qVh/vamZGz26rJ4Lvk
	 Hla82QctX8JTROuWALCI+Kyn79vEIRDoicMHRICug66ylIFQRX6lKqDpGrdw6KNDflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B8606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891B8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so658011f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794004065; x=1794608865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=LrO6gz3q3TY5UyCJOUBox/jjNcpxcJ2iAUHSQ0uClQVQf0wM2zRmqenKRj+0+YEWiW
         yV2HOJRF3YA+WPieH13BkTkh7BEKnK040T6AxoBSU/NZTmP6uA2l5fW5B3zeTwH+n6wT
         PBK0Fihz1HLsWmo0/C98BGnDAsRDCdtWZrWElYILBY2JcuYZKOBBVwLZEhNzZVRbtkxS
         ug+KkGnyno3GobtlniguEXtAX/Y7ZSWcbFoKp5v+NeQi53SUrFn9GTu/o4mUslsT5GLs
         0CQE0/7Yi5XJ0jYhQ6kvPCXZIIp6raSkr09c0B64iFEt5q+7wtbJkmvR6BWeM5uRL2Zk
         +VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004065; x=1794608865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=FBYum4ywH1JkH3ecpNd5XwdA640YF+T8duJtDgIlOzYE+Zt7hb+hSBFaNkR8MqPkKb
         gs3xzqEQneVG3i3c2BFrXUwvch+aY2sbG0CrN/db1I31ayJSXwcid1JCJi42TSk1KkOj
         c20hLxRTXTwiDB21c48Y0pJ2pE9sEUohKr6JmVbOGCpRHSmCiaYA/YWRyvDZ2jcULx6o
         ZjqaRqNzIQfXfBzO6RQiM1fHTT+R1wbhSE9nTeV11WcfXJ3YWoeimTOVxH3SCwwsYoPp
         YgTLhL3FN1MVhSxzc7iUhTgPp6+8BOot9nviu/2I2faT4ipinOPTdA9/XUoLsHyQdMZJ
         PI8Q==
X-Forwarded-Encrypted: i=1; AL+hErHJsYSJp5xbPAqJ/rRHI60Pq2irIBxPOM/KkL/4F4HSs0iLWFWBKHmFX4AEpSayD8AVInQ2c9NSEqaGKMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tGEuKlqi1rOFIrGJwSE3w5Oe4NfZc3lLe8ZM2mr5OfpMuMqLV
	x3cQ/Y78vU/RjtiXbUu0/cKWbYVhxCBnPKsVodfBGo/ANWcD4zTjxwy80IDoe5zyG34=
X-Gm-Gg: AYBFou3trzI4emPOqPng7DFgIge4Hs9WADWguoHhy8WY3QD9Dj/k0PXKM6F94E+aGi4
	B2TJp3+++LSBxZbQ0eagui4uM+W0B4M7g9qhtNkMwCYj7oRWeEKPrA7foKdlNHVsTyTaC17s8my
	CxU5CqYKPl0rK7KpPhweBcmYUmU4xBAqbJOpqw0AvAelUfHvcReguKzBbtuDCVxufJahNv/HGuJ
	C/myIrd1C5i51kxPwMWqSZbOfU0L6v7g1KnL771+oh4fapQLJ/0nlplDqqqaTpJ5LJXT+Urg9EB
	Ry4jsJhpQ9YZb0j/shEUQUZ1CpPrizHRxhhVx/wKn07833oV6ckhrNUxTxcgxKi6Fen6ZHOGd87
	zHWfl2y2r33WD4yCJ3YJWBwxmb14sN8RDYBlICuUpQAAvA57MjAemBM7aTCMzVaIgL7F4+vivUR
	6mMg0SN1wPjfN0uj1oO1uuGQ1GoyVZZSEc5QX0NWgEa++1r50Nu/MGn72J+2nJM1nfly+WQBGMp
	JyrupnrbX0NN/Z/1NPqHM9Cc1Spcw013nkFPqnMx3eUAMaEzfpgsakQWZJ78KFlscH2SsHM7gUH
	BQmVmLDcBSpM2JIpy5d0QW6Nl1FYXDsGsX55lOqVSogKXeTSfM0eBXpXSx4Sa9tYMDAs9ab7zS/
	rTrzdqNdf8SE=
X-Received: by 2002:a5d:5d13:0:b0:490:ef5a:bf39 with SMTP id ffacd0b85a97d-492733d12f2mr5925598f8f.6.1794004064618;
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm5497080f8f.28.2026.11.06.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Date: Fri, 6 Nov 2026 23:27:38 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au5RoF6BooP14xhY@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
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
In-Reply-To: <20261106-headband-buckwheat-fecbd459ee85@spud>

On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > 
> > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        clock-controller@0 {
> > > > +            compatible = "amlogic,s7-peripherals-clkc";
> > > > +            reg = <0x0 0x0 0x0 0x49c>;
> > > 
> > > What's with the weird numbers in this example?
> > > 
> > > Examples don't have to be real, but when it looks like this the
> > > immediate thought is that the modelling of the device might be
> > > incorrec.t
> > 
> > The numbers are actually real, but the example simply lost their context
> > because I copied the node from the S7 dtsi (not yet submitted), where
> > the controller sits under the APB bus node (bus@fe000000) and the bus
> > ranges make the addresses relative to it.
> > 
> > 		apb: bus@fe000000 {
> > 			compatible = "simple-bus";
> > 			reg = <0x0 0xfe000000 0x0 0x480000>;
> > 			#address-cells = <2>;
> > 			#size-cells = <2>;
> > 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > 
> > 			clkc_periphs: clock-controller@0 {
> > 				compatible = "amlogic,s7-peripherals-clkc";
> > 				reg = <0x0 0x0 0x0 0x49c>;
> > 				#clock-cells = <1>;
> > 				...
> > 
> > In V2 I'll use an absolute address for the sake of clarity (PLL has the
> > same issue).
> 
> Before you do that, can you please share with me the s7 dtsi? Cos surely
> you've got it in some git repo online somewhere.

The S7 dtsi is already upstream at [0], the peripheral clock controller
and PLL will be enabled in that DTSI with a following series after the
bindings and the drivers in this set are acked, following the diffs that
will be submitted:

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 2c204dcebbba..5f2a61f42cbd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>

 / {
@@ -160,6 +162,22 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_pll: clock-controller@8000 {
+                               compatible = "amlogic,s7-pll-clkc";
+                               reg = <0x0 0x8000 0x0 0x1e8>;
+                               #clock-cells = <1>;
+                               clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_HDMI_PLL_OSC>;
+                               clock-names = "fix",
+                                             "gp0",
+                                             "hifi",
+                                             "hifi1",
+                                             "hdmi";
+                       };
+
                        uart_b: serial@7a000 {
                                compatible = "amlogic,s7-uart",
                                             "amlogic,meson-s4-uart";

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 5f2a61f42cbd..afc88abea301 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_periphs: clock-controller@0 {
+                               compatible = "amlogic,s7-peripherals-clkc";
+                               reg = <0x0 0x0 0x0 0x49c>;
+                               #clock-cells = <1>;
+                               clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                                        <&clkc_pll CLKID_FCLK_DIV2P5>,
+                                        <&clkc_pll CLKID_FCLK_DIV3>,
+                                        <&clkc_pll CLKID_FCLK_DIV4>,
+                                        <&clkc_pll CLKID_FCLK_DIV5>,
+                                        <&clkc_pll CLKID_FCLK_DIV7>,
+                                        <&clkc_pll CLKID_HIFI_PLL>,
+                                        <&clkc_pll CLKID_GP0_PLL>,
+                                        <&clkc_pll CLKID_HIFI1_PLL>,
+                                        <&scmi_clk CLKID_GP1_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                                        <&xtal>,
+                                        <&scmi_clk CLKID_ACLKM>;
+                               clock-names = "fclk_div2",
+                                             "fclk_div2p5",
+                                             "fclk_div3",
+                                             "fclk_div4",
+                                             "fclk_div5",
+                                             "fclk_div7",
+                                             "hifi_pll",
+                                             "gp0_pll",
+                                             "hifi1_pll",
+                                             "gp1_pll",
+                                             "hdmi_pll",
+                                             "vid_pix",
+                                             "xtal",
+                                             "axi_frcpu";
+                       };
+
                        clkc_pll: clock-controller@8000 {
                                compatible = "amlogic,s7-pll-clkc";
                                reg = <0x0 0x8000 0x0 0x1e8>;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi

--
Carlo Caione
