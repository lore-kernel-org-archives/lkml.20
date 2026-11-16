Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811783;
	b=siBQDkS1CAOXhi1Er5LNuvhP9fLESBMx12zzRcNY/7J/Yg5Zv3nkalamElTH3F2C3PI/
	 CULWv8ZBNUW7Q/pQ5g4PM5icxh+bx3c70PzFhNEHFAaCIGWrcyYdE3/pKwB/fGcX+Sl7A
	 srqxY2KEAw49NSL62MN3GIO4wzAVe6hv+5+F/anIGPjOGpbFpuLQZZIno9eL1ThsdMK9t
	 m7R4C9e7F/1osFh+IaO8Q0Bpaly+PQCI3PJ6bQyTgOacTewkTn6+P4wyW0YV27+kyFYBr
	 KFmK0xLqZoqxmEgKchCqXIQDbQRUdHxg0nbF0DWVDQMGDtTp4sZHB25+faiw1WGfQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811783;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Cc:From:X-Lms-Return-Path:
	 In-Reply-To:Content-Type:Date:To:Subject:Mime-Version:References:
	 Content-Transfer-Encoding;
	bh=+t8ZxELPYTH2d5u1GirmDH7jb3H83Y/CovQh+JvDD1k=;
	b=D39JmO2KmX3PAGejlDZuMZdziHVNWasdMn5LrOGpEMTv9UBPXv0MtgojRNF2fX3Mxp/G
	 6U6z7zbrNVKbEvDIb11jJ5F5BVPOTvja8/EemHv/I/52nhY83VvCYOMeRr3VmLoqDJ88K
	 LM0FDc2QNG/Hq+sUchKY2jr04haFIhl+wGoyAmMJrTO6TQ2USRNVuvH5QQ/icEWnzsB1q
	 WB+tVEe8NHWaRmniEgcBFmq4jFeuBRuAG0RxjfiWscfWD5Pb2TIPMj/mfd9G8VFwqE013
	 umrwB24ARtQCXojsed++GKgBkiSpsbYd8jk84KbjOQgeFMr1KImtXiMf6SPZtI3musg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=oX2P7plc;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7F7606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=oX2P7plc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794811777;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+t8ZxELPYTH2d5u1GirmDH7jb3H83Y/CovQh+JvDD1k=;
 b=oX2P7plcXodZNslbMgvxRoEyJCTfwNtwRtlGEJqET49GZFE+Z9wquBJ+/BUp2n38Q3dA2z
 Btnb5XtrWUL2buosdGtxjOlR/mj+7gJBUupXuFMqlGhe0hQQKsZUrDl7tpP0GYpZmkZalV
 QxX6OteiWPli/OFVj+H0PXru9HkXP9bsbb3FuAae9RA1DarlV1+oBWJt/1gpDANI41K/Xv
 BBEr8rhOaZS1ctTd7Sv7s6vL615GhmQg2k0O69FdLHNlTlyv9QKdixC54Ha5HkW7Ee/DRb
 1qc7WBrh7IG7ZKXsWHNkxl7HJCzHgYqiaobpxXOBR+LT+CCaNtPSvdADsLNV/w==
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+16afaa77f+e5c053+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261114075506-GKB100523@kernel.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 14:49:33 +0800
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io>
	<20261114075506-GKB100523@kernel.org>
Content-Transfer-Encoding: quoted-printable

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Sat, Nov 14, 2026, 15:55

> Hi Sandie,
>=C2=A0
> On 11:33 Mon 09 Nov =C2=A0 =C2=A0 , Sandie Cao wrote:
> > Add the device tree node SDHCI-0 controller for onboard Micro SD card s=
lot.
> >=C2=A0
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > ---
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 22 ++++=
+++++++++++++++
> > =C2=A01 file changed, 22 insertions(+)
> >=C2=A0
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > index bcd533484a73..051046fe90b2 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -177,6 +177,28 @@ &combophy {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > =C2=A0};
> > =C2=A0
> ..
> > +/*
> > + * Onboard SD card slot:
> > + * Please insert or remove the SD card while the device is powered off=
.
> > + * It works as a boot media. so set it to non-removable.
> > + */
> Is there any public schematic available for FML13V05? I guess there is
> no CD pin (Card Detect pin)? as no "cd-gpios" property seen here
>=C2=A0
> The above comment isn't really useful or even correct, I'd suggest
> drop it.

In version 1 [1],=C2=A0 the patch is cd-gpios =3D <&gpio K3_GPIO(88) GPIO_A=
CTIVE_LOW>;
but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
So In version2 [2], the patch changes to non-removable.
And In version3 [3], add comment.=C2=A0

The options: cd-gpio, non-removable, broken-cd=C2=A0 all work on this board=
.

We just need to detect the SD card when bootup, don't need the driver=C2=A0
to detect hot-plug event , non-removable should be suitable and faster,=C2=
=A0
we recomment to use non-removable.


[1]: https://lore.kernel.org/all/20260922110231.3426011-1-sandie.cao
@deepcomputing.io/
[2]: https://lore.kernel.org/all/20261020081633.3673704-1-sandie.cao
@deepcomputing.io/
[3]: https://lore.kernel.org/all/20261102060012.100623-1-sandie.cao
@deepcomputing.io/

Best regards
Sandie

>=C2=A0
> > +&sdhci0 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default","uhs";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&mmc1_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-1 =3D <&mmc1_uhs_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-width =3D <4>;
> ..
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;
> "no-removable" property usually used for emmc chip soldered on board,
> =C2=A0so there is no way it can be physically removed.. check=C2=A0
> Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>=C2=A0
> For cases that no CD pin (or no GPIO CD pin) designed for SD card from
> hardware schematic perspective, using "broken-cd" is a more proper way,
> it will fallback to use poll mechanism to detect the card, please check
>=C2=A0
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-mmc;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0no-sdio;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0disable-wp;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0vqmmc-supply =3D <&aldo1>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr25;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr50;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0sd-uhs-sdr104;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > +};
> > +
> > =C2=A0&uart0 {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&uart0_0_cfg>;
> > --=C2=A0
> > 2.43.0
>=C2=A0
> --=C2=A0
> Yixun Lan (dlan)
>=C2=A0
