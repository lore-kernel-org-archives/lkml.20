Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480535;
	b=ZXwQa/yF3N3ZAD7beFmKC4VPESBPQ8rDd/1HpVGI9ONJxcy3xIbHUAAhDNazI4kBhJEg
	 pDvebm4DObzJmEG6tAIqD9fH0w2WdVV0X6rBKARWNaLB4FbvkCSoJEJNxuqPmx4C4MGBD
	 aX/XuOQNER5hQA58tREpps4UlIackGML+1ilrJatRzidddFf5M3jZHQEvswLA1ayfgvc6
	 rmK6Njy2022IxJuCscgjhoQ5epm+gyFk77r0m1Wc6Gq161C1DHV59n+Y4k8fFkNuwu/Fn
	 3HlH53aR0YweaPdvU1cAc/TkSS+0s2tDcotPQbN1szG9mL3ajqmv5uJ8mhUkQc2R+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480535;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Virus-Scanned;
	bh=qhkLYVl6/Dw/M20zhg225iFMlPva+T68NEio9JosIOA=;
	b=pFKbUaFSjlUN0zlqua5s+iHKj+ACiPBTfVW6qSLPWbLEeS70jhclXXLbGdQkzEfp0hLb
	 Y5n3P9szNAWcquhaqrG+2pBNkzvxfeBqj0Vl8pR/zV8t/46M/NqCnDoESYBFAdOgyIgQd
	 V5NvMHDFVY08Xw8MHEWjEzeRnWpn+cuiuv4EhvgfG6uv/mUqfY5Thuh7T9rwY9glsMX8w
	 S0RKvV/vfeaAXYls/YWT2NJe2IKZpDmZJOyzv/SrbBnKi43xlJ+LnK7Jz43W4AJtvBMRp
	 a8ZjxQHCXOf8GIQvTET5el6AzMNycXBvbIAyaGjbi1eosoU9QyOywRgOX9YoJf18yjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b="nbsyQB/C";
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CEA606A31D;
	Tue, 20 Oct 2026 07:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CEA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=nbsyQB/C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qhkLYVl6/Dw/M20zhg225iFMlPva+T68NEio9JosIOA=; b=nbsyQB/CitEQuCQEQizau+negH
	HnJWyxJ2MnuUR1YK/ztXflLq/Njoovu6RqZgeVKwX8MD0x9lMkJLVKkOqnUi0sNSIj5FLQ0Npt/uH
	zO3GlNHVjUrR8OxV5tBq29/wBOKlHe8u1UuppRRmhDw/WzdDW2PW40n0hMBLPXniUnuW5lDpDnWoQ
	vo8jJB3JQxpSGSq8wqptPdcJ+x6S1giSCmRepg7BzeUE7SS8PvqWgPjXNLXwSnXKjqjstj3Q0uiJm
	Af7BE7rsav93Q9BEM85Fobo0lr28y9crHbqL2emoEqX4HSD0eYL9gU1FR7CkDvi+3RlBLS+MBk7VK
	5vZExLsA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJ44E-000ATf-1B;
	Tue, 20 Oct 2026 09:15:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJ44D-000Gsz-2f;
	Tue, 20 Oct 2026 09:15:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller subsystem
Date: Tue, 20 Oct 2026 09:14:26 +0200
Message-ID: <10418539.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7e41bccb-4ab4-48a0-8cc8-26995c5ce2ba@nxp.com>
References:
 <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <7640235.DvuYhMxLoT@steina-w> <7e41bccb-4ab4-48a0-8cc8-26995c5ce2ba@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9243036.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28159/Tue Oct 20 08:24:12 2026)

--nextPart9243036.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>
Date: Tue, 20 Oct 2026 09:14:26 +0200
Message-ID: <10418539.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7e41bccb-4ab4-48a0-8cc8-26995c5ce2ba@nxp.com>
MIME-Version: 1.0

Hi,

Am Dienstag, 20. Oktober 2026, 03:47:21 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Liu Ying:
> On Fri, Oct 16, 2026 at 02:46:47PM +0200, Alexander Stein wrote:
> > Hi,
>=20
> Hi Alexander,
>=20
> >=20
> > Am Donnerstag, 15. Oktober 2026, 05:41:54 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Liu Ying:
> >> Hi Alexander,
> >>
> >> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
> >>
> >> [...]
> >>
> >>> +	dc0: display-controller@56180000 {
> >>> +		reg =3D <0x56180000 0x40000>;
> >>> +		clocks =3D <&dc0_lpcg IMX_LPCG_CLK_4>;
> >>> +		power-domains =3D <&pd IMX_SC_R_DC_0>;
> >>> +		#address-cells =3D <1>;
> >>> +		#size-cells =3D <1>;
> >>> +		ranges;
> >>> +		status =3D "disabled";
> >>> +
> >>> +		dc0_intc: interrupt-controller@56180040 {
> >>> +			reg =3D <0x56180040 0x60>;
> >>> +			clocks =3D <&dc0_lpcg IMX_LPCG_CLK_5>;
> >>> +			interrupt-controller;
> >>> +			interrupt-parent =3D <&dc0_irqsteer>;
> >>> +			#interrupt-cells =3D <1>;
> >>> +			interrupts =3D <448>, <449>, <450>,  <64>,
> >>> +				      <65>,  <66>,  <67>,  <68>,
> >>> +				      <69>,  <70>, <193>, <194>,
> >>> +				     <195>, <196>, <197>,  <72>,
> >>> +				      <73>,  <74>,  <75>,  <76>,
> >>> +				      <77>,  <78>,  <79>,  <80>,
> >>> +				      <81>, <199>, <200>, <201>,
> >>> +				     <202>, <203>, <204>, <205>,
> >>> +				     <206>, <207>, <208>,   <5>,
> >>> +				       <0>,   <1>,   <2>,   <3>,
> >>> +				       <4>,  <82>,  <83>,  <84>,
> >>> +				      <85>, <209>, <210>, <211>,
> >>> +				     <212>;
> >>> +			interrupt-names =3D "store9_shdload",
> >>> +					  "store9_framecomplete",
> >>> +					  "store9_seqcomplete",
> >>> +					  "extdst0_shdload",
> >>> +					  "extdst0_framecomplete",
> >>> +					  "extdst0_seqcomplete",
> >>> +					  "extdst4_shdload",
> >>> +					  "extdst4_framecomplete",
> >>> +					  "extdst4_seqcomplete",
> >>> +					  "extdst1_shdload",
> >>> +					  "extdst1_framecomplete",
> >>> +					  "extdst1_seqcomplete",
> >>> +					  "extdst5_shdload",
> >>> +					  "extdst5_framecomplete",
> >>> +					  "extdst5_seqcomplete",
> >>> +					  "disengcfg_shdload0",
> >>> +					  "disengcfg_framecomplete0",
> >>> +					  "disengcfg_seqcomplete0",
> >>> +					  "framegen0_int0",
> >>> +					  "framegen0_int1",
> >>> +					  "framegen0_int2",
> >>> +					  "framegen0_int3",
> >>> +					  "sig0_shdload",
> >>> +					  "sig0_valid",
> >>> +					  "sig0_error",
> >>> +					  "disengcfg_shdload1",
> >>> +					  "disengcfg_framecomplete1",
> >>> +					  "disengcfg_seqcomplete1",
> >>> +					  "framegen1_int0",
> >>> +					  "framegen1_int1",
> >>> +					  "framegen1_int2",
> >>> +					  "framegen1_int3",
> >>> +					  "sig1_shdload",
> >>> +					  "sig1_valid",
> >>> +					  "sig1_error",
> >>> +					  "reserved",
> >>> +					  "cmdseq_error",
> >>> +					  "comctrl_sw0",
> >>> +					  "comctrl_sw1",
> >>> +					  "comctrl_sw2",
> >>> +					  "comctrl_sw3",
> >>> +					  "framegen0_primsync_on",
> >>> +					  "framegen0_primsync_off",
> >>> +					  "framegen0_secsync_on",
> >>> +					  "framegen0_secsync_off",
> >>> +					  "framegen1_primsync_on",
> >>> +					  "framegen1_primsync_off",
> >>> +					  "framegen1_secsync_on",
> >>> +					  "framegen1_secsync_off";
> >>> +		};
> >>> +
> >>> +		dc0_pixel_engine: pixel-engine@56180800 {
> >>> +			reg =3D <0x56180800 0xac00>;
> >>> +			clocks =3D <&dc0_lpcg IMX_LPCG_CLK_5>;
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <1>;
> >>> +			ranges;
> >>> +
> >>> +			dc0_constframe0: constframe@56180960 {
> >>> +				reg =3D <0x56180960 0xc>, <0x56184400 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_extdst0: extdst@56180980 {
> >>> +				reg =3D <0x56180980 0x1c>, <0x56184800 0x28>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <3>, <4>, <5>;
> >>> +				interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			};
> >>> +
> >>> +			dc0_constframe4: constframe@561809a0 {
> >>> +				reg =3D <0x561809a0 0xc>, <0x56184c00 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_extdst4: extdst@561809c0 {
> >>> +				reg =3D <0x561809c0 0x1c>, <0x56185000 0x28>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <6>, <7>, <8>;
> >>> +				interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			};
> >>> +
> >>> +			dc0_constframe1: constframe@561809e0 {
> >>> +				reg =3D <0x561809e0 0xc>, <0x56185400 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_extdst1: extdst@56180a00 {
> >>> +				reg =3D <0x56180a00 0x1c>, <0x56185800 0x28>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <9>, <10>, <11>;
> >>> +				interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			};
> >>> +
> >>> +			dc0_constframe5: constframe@56180a20 {
> >>> +				reg =3D <0x56180a20 0xc>, <0x56185c00 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_extdst5: extdst@56180a40 {
> >>> +				reg =3D <0x56180a40 0x1c>, <0x56186000 0x28>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <12>, <13>, <14>;
> >>> +				interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			};
> >>> +
> >>> +			dc0_fetchwarp2: fetchwarp@56180a60 {
> >>> +				reg =3D <0x56180a60 0x10>, <0x56186400 0x190>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_fetchlayer0: fetchlayer@56180ac0 {
> >>> +				reg =3D <0x56180ac0 0xc>, <0x56188400 0x404>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_layerblend0: layerblend@56180ba0 {
> >>> +				reg =3D <0x56180ba0 0x10>, <0x5618a400 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_layerblend1: layerblend@56180bc0 {
> >>> +				reg =3D <0x56180bc0 0x10>, <0x5618a800 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_layerblend2: layerblend@56180be0 {
> >>> +				reg =3D <0x56180be0 0x10>, <0x5618ac00 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +
> >>> +			dc0_layerblend3: layerblend@56180c00 {
> >>> +				reg =3D <0x56180c00 0x10>, <0x5618b000 0x20>;
> >>> +				reg-names =3D "pec", "cfg";
> >>> +			};
> >>> +		};
> >>> +
> >>> +		dc0_display_engine0: display-engine@5618b400 {
> >>> +			reg =3D <0x5618b400 0x14>, <0x5618b800 0x1c00>;
> >>> +			reg-names =3D "top", "cfg";
> >>> +			interrupt-parent =3D <&dc0_intc>;
> >>> +			interrupts =3D <15>, <16>, <17>;
> >>> +			interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			power-domains =3D <&pd IMX_SC_R_DC_0_PLL_0>;
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <1>;
> >>> +			ranges;
> >>> +
> >>> +			dc0_framegen0: framegen@5618b800 {
> >>> +				reg =3D <0x5618b800 0x98>;
> >>> +				clocks =3D <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <18>, <19>, <20>, <21>,
> >>> +					     <41>, <42>, <43>, <44>;
> >>> +				interrupt-names =3D "int0", "int1", "int2", "int3",
> >>> +						  "primsync_on", "primsync_off",
> >>> +						  "secsync_on", "secsync_off";
> >>> +			};
> >>> +
> >>> +			dc0_tcon0: tcon@5618c800 {
> >>> +				reg =3D <0x5618c800 0x588>;
> >>> +
> >>> +				port {
> >>> +					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
> >>> +						remote-endpoint =3D <&dc0_pixel_combiner_ch0_dc0_disp0>;
> >>> +					};
> >>> +				};
> >>> +			};
> >>> +		};
> >>> +
> >>> +		dc0_display_engine1: display-engine@5618b420 {
> >>> +			reg =3D <0x5618b420 0x14>, <0x5618d400 0x1c00>;
> >>> +			reg-names =3D "top", "cfg";
> >>> +			interrupt-parent =3D <&dc0_intc>;
> >>> +			interrupts =3D <25>, <26>, <27>;
> >>> +			interrupt-names =3D "shdload", "framecomplete", "seqcomplete";
> >>> +			power-domains =3D <&pd IMX_SC_R_DC_0_PLL_1>;
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <1>;
> >>> +			ranges;
> >>> +
> >>> +			dc0_framegen1: framegen@5618d400 {
> >>> +				reg =3D <0x5618d400 0x98>;
> >>> +				clocks =3D <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
> >>> +				interrupt-parent =3D <&dc0_intc>;
> >>> +				interrupts =3D <28>, <29>, <30>, <31>,
> >>> +					     <45>, <46>, <47>, <48>;
> >>> +				interrupt-names =3D "int0", "int1", "int2", "int3",
> >>> +						  "primsync_on", "primsync_off",
> >>> +						  "secsync_on", "secsync_off";
> >>> +			};
> >>> +
> >>> +			dc0_tcon1: tcon@5618e400 {
> >>> +				reg =3D <0x5618e400 0x588>;
> >>> +
> >>> +				port {
> >>> +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
> >>> +						remote-endpoint =3D <&dc0_pixel_combiner_ch1_dc0_disp1>;
> >>> +					};
> >>> +				};
> >>> +			};
> >>> +		};
> >>> +	};
> >>
> >> I'm thinking that it would be good to have a complete display controll=
er
> >> DT node in the first place, including those prefetch engines attached =
to
> >> fetchunits through the fsl,prg property.  In this way, display control=
ler
> >> driver's life would be easier - all child/grandchild devices are always
> >> available.  I'm considering to adding a check to the Linux display con=
troller
> >> driver to ensure the availability(at least for critical child/grandchi=
ld
> >> devices).
> >=20
> > Well, this sounds reasonable, but this is beyond my knowledge about the
> > internals of the display controller.
> > FWIW it works (at least in my case), any additional DT node could be ad=
ded
> > later on.
>=20
> If someone says that new kernel must support old device tree, then the di=
splay
> driver's life would be not be easy.

Are the upcoming DT changes incompatible? Well then let's get them merged
first.

> > If there is something to test/review feel free to send it onto the
> > list. Please keep me on CC.
>=20
> I can try to CC you, but in case I forget to do so, the proper way for you
> is to get any patch in question by yourself - lei + mutt is a typical sol=
ution.

Oh nice. I wasn't aware of lei. Thanks for the hint.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/

--nextPart9243036.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmrXFNIACgkQaS+g2M0Z
/iVN0AgAse+V/CYm+Dy0bQX5cqzMYNpFL9PJ41NO6eipLqn7wRqtNSjfh+IyQGx2
EiqgPUTIFeKXNTIs+GNL9Ol1nRTzS/0M0pjLXTPNWs3RBQQZa6C5IyRs84PSlZSX
zIEVE4sLGyJJHWGYjgdYAYITNK1idsyH3lv/U5KzmxEXCIpc2AEk/OTswrRfcSPw
nNZuaPwNMgQDH8NZuGb3gK7R6/VRekIV/XSQd9xOeq3em7AVOOhF0Yi0wIc745Lg
MnGVrU1yfuZaHKenY98SksCD6Y+L22TDTM8tI3b3+Vqu5qjWD2zLRuJQiy703VxK
0oLFuENrafG7FSn9RXQPEz7XZR0dig==
=yoOB
-----END PGP SIGNATURE-----

--nextPart9243036.31r3eYUQgx--



