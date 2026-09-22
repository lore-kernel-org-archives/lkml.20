Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13075577E5C;
	Tue, 22 Sep 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097898; cv=none; b=JZEc+FpbSeA1/AIwUl8qCGg7wKvy3g7dsuQUyNLoIH3H5qdl5N2Eetq5ErFtmLWuXuNKEUvrvWYGEYFQQfWnlKOnHGn/jNmykkEqaBorsslfQ+r4S3goWrHQceCihjQvuum1Z7LEXS+Ps8GQpdQ4ISOwoyINR+Tt82R+KcwMNSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097898; c=relaxed/simple;
	bh=QRiEBIreO4v6EWgEvqWAHlOBMpxbQOzEEApQipVV4gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pvp+vXkIZ+3LKvKVLZC5Ghc6vwomwBCn1XWj3lP6SN6kYGJLN6jRVkKHsFS8dw7M1RDuToGshXCVHPeb3d51jo6OcfhGv5fiaj2sRK0lyCd88xSbGMsBbIS1/rpkZ54qEbdWVyh4IUhIq+1x1u7LvFgQc4pLCQX6Kus11oT02Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3WYGHec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3WYGHec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AF31F000FF;
	Tue, 22 Sep 2026 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790097896;
	bh=kqcg//RK9J1hGxjYO0Ag5gWb1sgH7VyD5IOAC8lCeKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R3WYGHecbU9+Ibf9zY5MdkQmKuOsrjPQEL/MCiUNpcs6zoyvpKLQUVNSlFXs8erwM
	 lR7hqJ12pGhbTlt3Jy6n+zDaa1W4Rwvpii7GJPeXvtRJXMzh0p3XVvmD0j2Lc7Yg0u
	 wSPYWlUROPSQfHpEkBmmC8TLOfKqDQ0U9x7U3x22AMmlq0cLfywH0FZZaW0KX6QAkq
	 UaUcSjDvi9of3xUBNl5L6DG0KZGva6brgyH4f7T8AYzzDOyeUtYeaeyZgPxu+nim8o
	 kt23VAOdMNR3qzZ6in65nspPX3kqzNsYYdRkxbIWstCYQhGEzLv8F2zkR3GG8ZOuHE
	 kEqnImGgcUEnA==
Date: Tue, 22 Sep 2026 18:24:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260922-purple-overnight-2cdd2ddd5270@spud>
References: <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J3nqrcEMORpacz8T"
Content-Disposition: inline
In-Reply-To: <arKr-oapsl5qzo_E@SMW015318>

--J3nqrcEMORpacz8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > > >
> > > > >
> > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrot=
e:
> > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil w=
rote:
> > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time optio=
ns of the AXI I3C
> > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > >
> > > > > > > > > > A Hot-Join request is acknowledged by the IBI machinery=
, so a hot-join
> > > > > > > > > > capable design is always IBI capable as well. Both even=
ts are reported
> > > > > > > > > > through the controller interrupt, which is therefore re=
quired whenever
> > > > > > > > > > the capability is present.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.c=
om>
> > > > > > > > > > ---
> > > > > > > > > > Changes in V3:
> > > > > > > > > > - Move in-band-interrupt-capable and hot-join-capable i=
nto the common
> > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed propert=
ies in the AMD
> > > > > > > > > >    binding [1].
> > > > > > > > > >    That Acked-by is not carried here: the names lost th=
e vendor prefix
> > > > > > > > > >    and the definitions moved to i3c.yaml after Frank Li=
's comment.
> > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-im=
pose-495476599087@spud/
> > > > > > > > >
> > > > > > > > > I disagree with Frank. These properties make sense for Xi=
linx because it
> > > > > > > > > is an FPGA IP and synthesis options impact this. For othe=
r devices, this
> > > > > > > > > should be determined from the compatible.
> > > > > > > > > Please revert to how things were done in v2, especially a=
s no rationale
> > > > > > > > > was provided for why these should be common.
> > > > > > > >
> > > > > > > > It is common problems, when IP intergrate by SOC, which may=
 defeature some
> > > > > > > > part, It is not appeared now just because IBI and HJ have n=
ot enabled
> > > > > > > > widely.
> > > > > > > >
> > > > > > > > IBI and HJ is optional features of I3C. Ideally it should b=
e indicated by
> > > > > > > > some registers. But not all vendor implement provide this C=
AP registers.
> > > > > > > >
> > > > > > > > IBI and HJ depend on some slow clocks, which monitor SDA li=
ne change.
> > > > > > > > Some instances of IP may not have such slow clocks. Some IP=
's IBI and HJ
> > > > > > > > use seperate IRQ line, but these irq line may not connect o=
f difference
> > > > > > > > instances.
> > > > > > >
> > > > > > > All of this should be able to be dealt with by appropriate us=
e of
> > > > > > > specific compatibles.
> > > > > >
> > > > > > I understand compatible can cover most cases. Need variance for=
 property.
> > > > > >
> > > > > > >
> > > > > > > > like previous SPI vendor customized property, we takes effo=
rts to convert
> > > > > > > > to common one and also meet back compatiblity problem at co=
nvert. I don't
> > > > > > > > want to do it again. This kind property is most likely as b=
elow.
> > > > > > >
> > > > > > > What SPI controller specific properties are you talking about=
 here?
> > > > > > > There are relatively few properties in spi-controller.yaml, a=
nd none of
> > > > > > > them deal with these kinds of capabilities.
> > > > > >
> > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fi=
xed, but
> > > > > > some instances have not route all CS to pad.
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > > force-disabled: force disable for some reason, like, miss c=
onnect irq line
> > > > > > > > or missed some clock, or IP bugs, or board desgin's some le=
vel shift chip
> > > > > > > > broken IBI/HJ timing requirements.
> > > > > > >
> > > > > > > Of these, only the last would be a valid reason for having a =
property
> > > > > > > for it. Missing interrupts, clocks or IP bugs should all be d=
ealt with
> > > > > > > using device specific compatibles.
> > > > > > > If board wiring causes the breakage, the property may be more
> > > > > > > appropriate at the i3c device level rather than the controlle=
r given
> > > > > > > that wiring to some devices on the bus may not have the probl=
ems?
> > > > > >
> > > > > > I3C.yaml is for both master controller and devices now. I3C is =
bus, which
> > > > > > connect many devices, if wiring issue, whole bus can't support =
IBI. And
> > > > > > if any broken devices happen at address arbitation, whole bus c=
an't support
> > > > > > IBI.
> > > > > >
> > > > > > at beging, I suggest 3 state,
> > > > > >
> > > > > > [default, enable, disable], but now I think IBI_broken, HJ_brok=
en is more
> > > > > > reasonable to disable it, default value should be set by compat=
ible
> > > > > > string or DCR of I3C regiser.
> > > > > >
> > > > > > And some I3C device may be failure to work with IBI even DCR of=
 I3C register
> > > > > > show it support IBI.
> > > > > >
> > > > > > I don't want to appear two similar property between vendor and =
common, like
> > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > >
> > > > > > such as IBI-broken can be used for controller and devices case.
> > > > > >
> > > > > > > That said, I think that problem should be dealt with when it =
arises,
> > > > > > > rather than starting a trend of adding capabilities propertie=
s at the
> > > > > > > controller level when I am not convinced that there's going t=
o be other
> > > > > > > users in the same vein.
> > > > > >
> > > >
> > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more =
easy
> > > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > > Conor: Any update on this one? I think this thread is stuck at th=
is stage.
> > > >
> > > > I didn't think there was any need to reply. I took the first senten=
ce of
> > > > this snippet to be acceptance of what I was saying.
> > > >
> > > > If yous desperately want to have a generic property, the negative
> > > > connotation of the "-broken" is probably better in that it'd be more
> > > > likely to make people set stuff by compatible rather than have to u=
se a
> > > > property with that word in it.
> > >
> > > That said, technically this platform could be both
> > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, si=
nce
> > > one describes the way the IP has been compiled and the other wiring. =
I'm
> > > not entirely sure whether conflating the two is possible? Depends on =
if
> > > your IP's programming model changes if the option is enabled even if =
it
> > > cannot be used. Not beyond the realms of possibility.
> > >
> > > Also, ibi-broken doesn't work for your platform, since the default
> > > before this patch is no ibi and requiring a property for no ibi would=
 be
> > > an ABI break.
> >
> > The perils of FPGA IP I suppose, and not being quite careful enough to
> > document all of the relevant options from the start. Been guilty of that
> > myself.
> >
>=20
> Check impliment code
>=20
> +       /*
> +        * The interrupt only carries IBI events, so it is only described=
 for
> +        * designs synthesized with that feature.
> +        */
> +       if (master->ibi_capable) {
> +               xi3c_master_init_ibi_ops(master);
> +
> +               master->irq =3D platform_get_irq(pdev, 0);
> +               if (master->irq < 0)
> +                       return master->irq;
> +
> +               ret =3D devm_request_irq(master->dev, master->irq,
> +                                      xi3c_master_irq_handler, IRQF_NO_A=
UTOEN,
> +                                      dev_name(master->dev), master);
> +               if (ret)
> +                       return dev_err_probe(master->dev, ret,
> +                                            "Failed to request IRQ\n");
> +       }
>=20
> They can use master->irq is determinate if support IBI.

That seems viable. Where does that leave them for hot join though?


--J3nqrcEMORpacz8T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarK55AAKCRB4tDGHoIJi
0pgrAQCZOUKpGZ97g8Pqr2PmEJ8iGu2CWN3e1h6AAb6t6XhAgwEAu45jKDI+1aBv
fLMBFK82hDYeI+nh/MY6f6CJRebxVAE=
=Dihe
-----END PGP SIGNATURE-----

--J3nqrcEMORpacz8T--
