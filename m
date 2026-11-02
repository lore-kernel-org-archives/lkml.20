Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590337;
	b=RuXncyw3D31wdJ2uJB8q4eRp0T4UGc17NEfJDkwFFqjvddUwLBwBLdrdpiotAPGugRuK
	 IyoLSgdVEG/YG0ThYapj3XJxQz7UlBOknOMBOqFuO+GzhdbVmxHKuHIX0OzZQQVG2G8Hk
	 FjIdYNJ7TE9tB8HYpDWMtgSjEFJizNoTPAdjLdUpVc6rY0AaVrdTqcP6tjsxdxf847BsM
	 YERkMmRzcmfsbS8J0C7OMXhdRc3BZ1MRjXxluyI9Cn6eBDkIZDnoYpt0a/QNvn+VnkCkA
	 vuhdwxDjFhOWeproT/aTTFxVMoHFVsdWj7mu91taLWx0cFRRVpFHNYO9PI8+MzenAqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590337;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	b=gjCScLMlg8nusqwWRxxxJwEqnGbj0Z2OVJ1MbLWwJyg3aYULzltG7yooQL7bA+jcx4OE
	 OfWpkPuRJrF1BMlxOy4I98I+C0mJU7gSCdxGZt25SuYSP/vbCHJUtPla3tsMjPVcMnVx/
	 CC/yc6WKRTJ3rzeojDOChA4sRbVHIUgeRV/iSxwzHqgV0PzaIZuO5tAkx3UtigNidhQsg
	 LTl7FQkddgY57q1m8CfAq5KICKCO392FIu2fPBoWtrLQGJhh57HaEl8tLZgj/JUk8zDpi
	 OLc+ShZLf06qe/YCPDaNadS6+lvpO/BTFqjCqOOG9VrjF6818Uh4C7bvy7JW7+fuOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="GHh7PQ/S";
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956C1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 956C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GHh7PQ/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793590326;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=GHh7PQ/SCDFcy6aq9PfBgT8U9i6BfzpKIdKiQ+qaAGzdWbarYYrtMoeZmmO+G1nY/
	 /PZmsrj1de8wOJ/QYnBKfKbH8y40vOXVyoyxHTQlym620klkXio8+VM2kOffXykTag
	 PT2xL8npiGru+GXUGrsvKtwKFXUxu9eirDMqGOrs=
X-QQ-mid: zesmtpgz5t1793590325t9d9fff2c
X-QQ-Originating-IP: 4PvlygZs1chJ6c6P8ulMEaZlG19StBd9gZ/Pw04mpX8=
Received: from mail-ot1-f44.google.com ( [209.85.210.44])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:32:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16093569855118793847
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-844a8bf7e25so1808549a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:32:04 -0800 (PST)
X-Gm-Message-State: AFq9FYIXulJ5TamvvvvyH0+atPukIdY2fZzABmyAI3/hE0oBqjV+9xWG
	WxkaEd0xhlw6+kJkkU7McnArzMzbR32onsL6R7JtAfnNSHv95tkxDN+v6Z3vmvA5a9FhyvpZv2W
	gXGPXbCoq+JegbldhpBbfMr1QS86AnqM=
X-Received: by 2002:a17:902:cf08:b0:2e8:b5af:22e0 with SMTP id
 d9443c01a7336-2eb36465f1amr76602555ad.41.1793589814309; Sun, 01 Nov 2026
 19:23:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com> <auYxFRtKWbGAlRTL@aurel32.net>
In-Reply-To: <auYxFRtKWbGAlRTL@aurel32.net>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 11:22:58 +0800
X-Gmail-Original-Message-ID: <EBCEB49359C4BBC0+CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
X-Gm-Features: AclHuK9_kWiUHPoaWjYOWVhMFk9nT072XgylDHIVHiujJpZKDNExi2p2MezyEo8
Message-ID: <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MNrAFlesFo5KXUCuEIipNrMx/yyu2BBH693YcgNfO2eNvkOQ8dW8H8ny
	MndtSEGOY7clwzcr02qKd88jp+1oFUU5J3gVz6PJZooFMbqVJjr1Eg1lkcWGkm/lA7EoQ4/
	Hq2i2aPmjThIJl4ChYK5jI5nAuz+A6nmqzJ12JfRoORi8AxhsL+lfpds8QF2ifjcWwM9C/S
	eD0kblvZtEhnX8sIPAGHt48Qj6JvF5YpiKbnXPRMVpgNUic6+D+GrBIZVND+FR92mN0CZIO
	/xN5REHgMrrt0U0W0wJR9TXVl4fNffyKo5okzNg/kbP7KL5iw4QNyYEdGiaabCm3SUPb757
	DTnHWDB5Ef+gdstT39uE2Im2A+rJRRg4BKiV929pyO1QaY4d6VCZXKmlmbcNZokQwa33YOR
	YLKQPgY7R2a0pcWXSy5zKBqm/VDxDsCstlpoIfV0/zihk2yBc9fnHfzEyQp32f8HiH+193Z
	J5liCO3zNgc7UZThxna2GadkWb4MI/VHLYsHse30lzBt0Qmahw3SXUWIxNpWdgfsLFcl7VF
	Lgb9MxVJYdk94/fAw9wdk35s4A79jnz8YJtVn83+1znk47ZfzKiramGcPhp34xpOXVKXdTG
	Gn98NLJemYTy++/kRTEKz+hb86TFYHxrfwndeFLLT4eCYKCvh+95gA1Cv+1apHe3FVlnr5j
	8v5DS/zhzcadgMBUkkK/wLa1WcR/K2IiYHLWzz5m10SiNtErCjBZMZoyp8ABeroyqFV/Dvh
	kWjFK8MdQ6zSeGPi02tg8qeR3l6Op6qb3kZ/GrPs1Ed/9J+m4WGckfZFkfBFtD8kSpTMj8k
	qn0SE4pmL16gE7x+c36fIvQIYO6qeo8G/YbWO/P2oNcsw5MjbTO+70r9D5JtKDp81rIxKEa
	MC3aVYkCCE0C3fTMIdiKyEhMQJN0jrURJovI7ZZDg7bmvSkpGknAMMEggcLUAOSOMYaXyUn
	8xzVAZTlTANgZG4RpHi1Q/K5f3jP7VY0BNdR6agBv4v5V2G9Uwgsz3c/Hdg0kWCNswZ0bPT
	dlW4frWIkpjhyhzYEelOzbrsbpOQfy+Z/aUxc6qIZVxIMNR7JdZENdEH43XeefdlD9F2PQg
	v0iTw3Xlij32WsIBRgLsVgTwPMzhYK/slRDorVidc1zTIManNmWLUIpKrCjESv8pA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Hi Aurelien,

On Sun, 1 Nov 2026 at 02:19, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-10-30 17:40, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed = "high-speed").
> >
> > Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> > a USB device.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..74d4fdf9e405 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -323,6 +323,15 @@ &usb2_phy {
> >       status = "okay";
> >  };
> >
> > +&usb3a_u2phy {
> > +     status = "okay";
> > +};
> > +
> > +&usb3a {
> > +     dr_mode = "peripheral";
> > +     status = "okay";
> > +};
> > +
> >  &usb3d_u2phy {
> >       status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..220dfe29bb78 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
> >                       };
> >               };
> >
> > +             usb3a: usb@cad00000 {
>
> Please move this after the eth2 node, so that the node addresses are
> kept sorted.
>
> > +                     compatible = "spacemit,k3-dwc3";
> > +                     reg = <0x0 0xcad00000 0x0 0x10000>;
> > +                     interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-parent = <&saplic>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     clock-names = "usbdrd30";
> > +                     resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> > +                     reset-names = "ahb", "vcc", "phy";
> > +                     phys = <&usb3a_u2phy>;
> > +                     phy-names = "usb2-phy";
>
> Please move the PHYs definition to the board level, matching was it is
> done for the other USB3 ports, as other boards might have different PHY
> configuration.
>
> > +                     phy_type = "utmi";
> > +                     snps,dis_enblslpm_quirk;
> > +                     snps,dis_u2_susphy_quirk;
> > +                     snps,dis-del-phy-power-chg-quirk;
> > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > +                     maximum-speed = "high-speed";
>
> I think the maximum-speed property should also be moved to the board
> level, as its value depends on the PHYs configuration.

Sure. I will address all the above comments.

>
> > +                     status = "disabled";
> > +             };
>
> Any reason not to define the snps,parkmode-disable-ss-quirk property? It
> is defined for the other USB3 ports, as well as for the USB3 A port in
> the vendor kernel

The original thought was that this property is SS-specific and thus unnecessary
without usb3-phy support. However, since it reflects a hardware characteristic
that applies regardless of the current PHY configuration, adding it makes sense
for consistency and forward compatibility.

>
> > +
> > +             usb3a_u2phy: phy@cad20000 {
> > +                     compatible = "spacemit,k3-usb2-phy";
> > +                     reg = <0x0 0xcad20000 0x0 0x200>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               pdma: dma-controller@d4000000 {
> >                       compatible = "spacemit,k3-pdma";
> >                       reg = <0x0 0xd4000000 0x0 0x4000>;
>
> Otherwise looks good.

Thanks for the review,
Chunyan
