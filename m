Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73E48B37D;
	Tue, 22 Sep 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069969; cv=none; b=mMgZvOUCP3jyOXYa9l+kgVZYIOKDWpSOULkp5oozDluzNrdqfjg7NyZF5oAoKSztjpUWsfO1wJ//axIREzhtrj9zT6OqJVVKVe8iiKHlVYzdk1h8gN+qHh7jpB8j3yMxQDVwjoeZY8bp/Fv+LBSkI4tQlTOAqPWI1fYPIKpY+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069969; c=relaxed/simple;
	bh=ig3RXksvRWIhFz8H9Bq6vdIuu8O2JHhDcVdl4VJdzLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpF6gOAkiuRmI1XeRdSmMLA/e+a8TQuzowN7lJk2s5tm+CVDiPL3lMBZZw0Qr/TO+G+V1edarM9+XnkmCcrB3AKumGi5ENuBLZ/yAx5gLF9tmIIXxLbE4e6QOj8N1aKu0y1WIKfgZMKuRYAKeirwnKiJBSTrV3X4sALehdEoT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2SEbANS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2SEbANS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA211F000FF;
	Tue, 22 Sep 2026 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069967;
	bh=cmgJ7EI3aXcwdtplUp/Zi7AC67D438gcMraWYvZlf1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2SEbANS9jNH8mHtr71ZufVoQlvgV4QpoaHeDEJOc37RGA6kNvkiDorxche3ermxY
	 vHU3zjnUGek7QmuKg5CFOzVh+j/+tywjVQAVWzlF1zm2CQPVo45BV4NL0f+GOpUt4M
	 hhoPimT/o37c5PCxjsS2539DJd4I9fXPOMjMSZsBDeFpNUxj7rDb/NVMIRovZQWccG
	 01LJxJ9tXLqSdJPYGhVkcOLp+IjMnGSOc5xobpUFZ39hv6djRspf0M4+uNG7DhX+nm
	 imkghBjDvew/cCgnattUG+TqSKedkXHiM3lumfXJAxzSL4RjGjnk+Eks+1YjtDRwzw
	 PbdeckEePtuYQ==
Date: Tue, 22 Sep 2026 10:39:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260922-immersion-salvage-00450539f1ce@spud>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Hmaxv1IM9OzCHNc"
Content-Disposition: inline
In-Reply-To: <20260922-bullpen-reprise-f62e01922d88@spud>

--1Hmaxv1IM9OzCHNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > >=20
> > >=20
> > > On 9/10/26 17:44, Frank Li wrote:
> > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options o=
f the AXI I3C
> > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > >=20
> > > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so=
 a hot-join
> > > > > > > > capable design is always IBI capable as well. Both events a=
re reported
> > > > > > > > through the controller interrupt, which is therefore requir=
ed whenever
> > > > > > > > the capability is present.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > > ---
> > > > > > > > Changes in V3:
> > > > > > > > - Move in-band-interrupt-capable and hot-join-capable into =
the common
> > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > - Update the commit description accordingly.
> > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties =
in the AMD
> > > > > > > >    binding [1].
> > > > > > > >    That Acked-by is not carried here: the names lost the ve=
ndor prefix
> > > > > > > >    and the definitions moved to i3c.yaml after Frank Li's c=
omment.
> > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose=
-495476599087@spud/
> > > > > > >=20
> > > > > > > I disagree with Frank. These properties make sense for Xilinx=
 because it
> > > > > > > is an FPGA IP and synthesis options impact this. For other de=
vices, this
> > > > > > > should be determined from the compatible.
> > > > > > > Please revert to how things were done in v2, especially as no=
 rationale
> > > > > > > was provided for why these should be common.
> > > > > >=20
> > > > > > It is common problems, when IP intergrate by SOC, which may def=
eature some
> > > > > > part, It is not appeared now just because IBI and HJ have not e=
nabled
> > > > > > widely.
> > > > > >=20
> > > > > > IBI and HJ is optional features of I3C. Ideally it should be in=
dicated by
> > > > > > some registers. But not all vendor implement provide this CAP r=
egisters.
> > > > > >=20
> > > > > > IBI and HJ depend on some slow clocks, which monitor SDA line c=
hange.
> > > > > > Some instances of IP may not have such slow clocks. Some IP's I=
BI and HJ
> > > > > > use seperate IRQ line, but these irq line may not connect of di=
fference
> > > > > > instances.
> > > > >=20
> > > > > All of this should be able to be dealt with by appropriate use of
> > > > > specific compatibles.
> > > >=20
> > > > I understand compatible can cover most cases. Need variance for pro=
perty.
> > > >=20
> > > > >=20
> > > > > > like previous SPI vendor customized property, we takes efforts =
to convert
> > > > > > to common one and also meet back compatiblity problem at conver=
t. I don't
> > > > > > want to do it again. This kind property is most likely as below.
> > > > >=20
> > > > > What SPI controller specific properties are you talking about her=
e?
> > > > > There are relatively few properties in spi-controller.yaml, and n=
one of
> > > > > them deal with these kinds of capabilities.
> > > >=20
> > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed,=
 but
> > > > some instances have not route all CS to pad.
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > force-disabled: force disable for some reason, like, miss conne=
ct irq line
> > > > > > or missed some clock, or IP bugs, or board desgin's some level =
shift chip
> > > > > > broken IBI/HJ timing requirements.
> > > > >=20
> > > > > Of these, only the last would be a valid reason for having a prop=
erty
> > > > > for it. Missing interrupts, clocks or IP bugs should all be dealt=
 with
> > > > > using device specific compatibles.
> > > > > If board wiring causes the breakage, the property may be more
> > > > > appropriate at the i3c device level rather than the controller gi=
ven
> > > > > that wiring to some devices on the bus may not have the problems?
> > > >=20
> > > > I3C.yaml is for both master controller and devices now. I3C is bus,=
 which
> > > > connect many devices, if wiring issue, whole bus can't support IBI.=
 And
> > > > if any broken devices happen at address arbitation, whole bus can't=
 support
> > > > IBI.
> > > >=20
> > > > at beging, I suggest 3 state,
> > > >=20
> > > > [default, enable, disable], but now I think IBI_broken, HJ_broken i=
s more
> > > > reasonable to disable it, default value should be set by compatible
> > > > string or DCR of I3C regiser.
> > > >=20
> > > > And some I3C device may be failure to work with IBI even DCR of I3C=
 register
> > > > show it support IBI.
> > > >=20
> > > > I don't want to appear two similar property between vendor and comm=
on, like
> > > > num-cs vs fsl,espi-num-chipselects.
> > > >=20
> > > > such as IBI-broken can be used for controller and devices case.
> > > >=20
> > > > > That said, I think that problem should be dealt with when it aris=
es,
> > > > > rather than starting a trend of adding capabilities properties at=
 the
> > > > > controller level when I am not convinced that there's going to be=
 other
> > > > > users in the same vein.
> > > >=20
> >=20
> > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > > understand,  logically equial to in-band-interrupt-capable.
> > > Conor: Any update on this one? I think this thread is stuck at this s=
tage.
> >=20
> > I didn't think there was any need to reply. I took the first sentence of
> > this snippet to be acceptance of what I was saying.
> >=20
> > If yous desperately want to have a generic property, the negative
> > connotation of the "-broken" is probably better in that it'd be more
> > likely to make people set stuff by compatible rather than have to use a
> > property with that word in it.
>=20
> That said, technically this platform could be both
> "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
> one describes the way the IP has been compiled and the other wiring. I'm
> not entirely sure whether conflating the two is possible? Depends on if
> your IP's programming model changes if the option is enabled even if it
> cannot be used. Not beyond the realms of possibility.
>=20
> Also, ibi-broken doesn't work for your platform, since the default
> before this patch is no ibi and requiring a property for no ibi would be
> an ABI break.

The perils of FPGA IP I suppose, and not being quite careful enough to
document all of the relevant options from the start. Been guilty of that
myself.



--1Hmaxv1IM9OzCHNc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarJMywAKCRB4tDGHoIJi
0mThAQDKrOwb+4IKRtiHJ09cuoS0GRy7/bFsJp11ykJu9Fea5wD9HusEc6cqg0h4
BIAtZ2JCdy+/S1+/tls4mhNOiURnbwM=
=YPGo
-----END PGP SIGNATURE-----

--1Hmaxv1IM9OzCHNc--
