Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04D3F1ADE;
	Tue, 22 Sep 2026 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112589; cv=none; b=V/JC8VPVRYceLkosUEmp4aINvLKUhMCkzqiv+hadMWNHFKpdsN/HkES6zsEdblgKjfJdBEdQUJ5FOKOuyLGH1wv/vjtRkYPWr2r5g2znEG5l3mahlnvt/L5lGlM2xFJA0rnShy740+3VxLDv2YXgjQvrt/WPTijAfbAl2tJ7wdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112589; c=relaxed/simple;
	bh=WRYsuw02M5uiU3Hup8d51SIi6ysZk/AvEI/aXNqoooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RePbKbjEbBfg6kztM6XzcsfauC0goo4CZ15ApTkfYFOq5WK8TQdQ1gbo9GzktnIrXToyTeCtFZsHUP8pbReGONg/L6/Xbu0m5HY+XrBT230EneK2RnkGik0SN1fsCxitfJk8kJC3f4mUN/brPk/szgegEsFEW5FnWwpTVRbFLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a36lGqaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a36lGqaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9FA1F000FF;
	Tue, 22 Sep 2026 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112576;
	bh=yKojB88UjpXGtOazU2N02Nu8K9kCYOGjnI2fYZ70c1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a36lGqaqd3Pv41FJOCCFv/gToPy7yWy9a+rGuV5XEh9jGn3pAmk2/Re7X/2T14T4c
	 XYbVENqyEjfdRCukK8xWbbBat5IU7uFJ/+Nd3rre19Rw7eAS6DZQe80te/WAeSLg0X
	 u8EN1uITsAhOKRIqnkwXqvCJ4SvdqO+9Mn3Z8pKRoAGU58wPdwZxAHezLeRgwFxb4Q
	 kEQ64ECFV6Nx42t+7+X0T2CFgunw51Mw3iqA3tUTP4LdOsaIKstSo11O1wJAF0VxiD
	 +XiYHo2oHruR7VfwiglKPyawb4eNm4gSN8ze4laYrOtvZ942sN0JEOKWwivTH/Q6+i
	 P64Y+LlCZ+s5g==
Date: Tue, 22 Sep 2026 22:29:31 +0100
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
Message-ID: <20260922-unadvised-stalling-5cbeff8f982a@spud>
References: <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LkC3daycRRxByKPg"
Content-Disposition: inline
In-Reply-To: <arLKWE1tJrKnzGdp@SMW015318>

--LkC3daycRRxByKPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
> > On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> > > On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > > > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > > > > >
> > > > > > >
> > > > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrot=
e:
> > > > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley =
wrote:
> > > > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Pat=
il wrote:
> > > > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time o=
ptions of the AXI I3C
> > > > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > > > >
> > > > > > > > > > > > A Hot-Join request is acknowledged by the IBI machi=
nery, so a hot-join
> > > > > > > > > > > > capable design is always IBI capable as well. Both =
events are reported
> > > > > > > > > > > > through the controller interrupt, which is therefor=
e required whenever
> > > > > > > > > > > > the capability is present.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@a=
md.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > > Changes in V3:
> > > > > > > > > > > > - Move in-band-interrupt-capable and hot-join-capab=
le into the common
> > > > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed pro=
perties in the AMD
> > > > > > > > > > > >    binding [1].
> > > > > > > > > > > >    That Acked-by is not carried here: the names los=
t the vendor prefix
> > > > > > > > > > > >    and the definitions moved to i3c.yaml after Fran=
k Li's comment.
> > > > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwa=
d-impose-495476599087@spud/
> > > > > > > > > > >
> > > > > > > > > > > I disagree with Frank. These properties make sense fo=
r Xilinx because it
> > > > > > > > > > > is an FPGA IP and synthesis options impact this. For =
other devices, this
> > > > > > > > > > > should be determined from the compatible.
> > > > > > > > > > > Please revert to how things were done in v2, especial=
ly as no rationale
> > > > > > > > > > > was provided for why these should be common.
> > > > > > > > > >
> > > > > > > > > > It is common problems, when IP intergrate by SOC, which=
 may defeature some
> > > > > > > > > > part, It is not appeared now just because IBI and HJ ha=
ve not enabled
> > > > > > > > > > widely.
> > > > > > > > > >
> > > > > > > > > > IBI and HJ is optional features of I3C. Ideally it shou=
ld be indicated by
> > > > > > > > > > some registers. But not all vendor implement provide th=
is CAP registers.
> > > > > > > > > >
> > > > > > > > > > IBI and HJ depend on some slow clocks, which monitor SD=
A line change.
> > > > > > > > > > Some instances of IP may not have such slow clocks. Som=
e IP's IBI and HJ
> > > > > > > > > > use seperate IRQ line, but these irq line may not conne=
ct of difference
> > > > > > > > > > instances.
> > > > > > > > >
> > > > > > > > > All of this should be able to be dealt with by appropriat=
e use of
> > > > > > > > > specific compatibles.
> > > > > > > >
> > > > > > > > I understand compatible can cover most cases. Need variance=
 for property.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > like previous SPI vendor customized property, we takes =
efforts to convert
> > > > > > > > > > to common one and also meet back compatiblity problem a=
t convert. I don't
> > > > > > > > > > want to do it again. This kind property is most likely =
as below.
> > > > > > > > >
> > > > > > > > > What SPI controller specific properties are you talking a=
bout here?
> > > > > > > > > There are relatively few properties in spi-controller.yam=
l, and none of
> > > > > > > > > them deal with these kinds of capabilities.
> > > > > > > >
> > > > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP i=
s fixed, but
> > > > > > > > some instances have not route all CS to pad.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > > > > force-disabled: force disable for some reason, like, mi=
ss connect irq line
> > > > > > > > > > or missed some clock, or IP bugs, or board desgin's som=
e level shift chip
> > > > > > > > > > broken IBI/HJ timing requirements.
> > > > > > > > >
> > > > > > > > > Of these, only the last would be a valid reason for havin=
g a property
> > > > > > > > > for it. Missing interrupts, clocks or IP bugs should all =
be dealt with
> > > > > > > > > using device specific compatibles.
> > > > > > > > > If board wiring causes the breakage, the property may be =
more
> > > > > > > > > appropriate at the i3c device level rather than the contr=
oller given
> > > > > > > > > that wiring to some devices on the bus may not have the p=
roblems?
> > > > > > > >
> > > > > > > > I3C.yaml is for both master controller and devices now. I3C=
 is bus, which
> > > > > > > > connect many devices, if wiring issue, whole bus can't supp=
ort IBI. And
> > > > > > > > if any broken devices happen at address arbitation, whole b=
us can't support
> > > > > > > > IBI.
> > > > > > > >
> > > > > > > > at beging, I suggest 3 state,
> > > > > > > >
> > > > > > > > [default, enable, disable], but now I think IBI_broken, HJ_=
broken is more
> > > > > > > > reasonable to disable it, default value should be set by co=
mpatible
> > > > > > > > string or DCR of I3C regiser.
> > > > > > > >
> > > > > > > > And some I3C device may be failure to work with IBI even DC=
R of I3C register
> > > > > > > > show it support IBI.
> > > > > > > >
> > > > > > > > I don't want to appear two similar property between vendor =
and common, like
> > > > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > > > >
> > > > > > > > such as IBI-broken can be used for controller and devices c=
ase.
> > > > > > > >
> > > > > > > > > That said, I think that problem should be dealt with when=
 it arises,
> > > > > > > > > rather than starting a trend of adding capabilities prope=
rties at the
> > > > > > > > > controller level when I am not convinced that there's goi=
ng to be other
> > > > > > > > > users in the same vein.
> > > > > > > >
> > > > > >
> > > > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is m=
ore easy
> > > > > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > > > > Conor: Any update on this one? I think this thread is stuck a=
t this stage.
> > > > > >
> > > > > > I didn't think there was any need to reply. I took the first se=
ntence of
> > > > > > this snippet to be acceptance of what I was saying.
> > > > > >
> > > > > > If yous desperately want to have a generic property, the negati=
ve
> > > > > > connotation of the "-broken" is probably better in that it'd be=
 more
> > > > > > likely to make people set stuff by compatible rather than have =
to use a
> > > > > > property with that word in it.
> > > > >
> > > > > That said, technically this platform could be both
> > > > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time=
, since
> > > > > one describes the way the IP has been compiled and the other wiri=
ng. I'm
> > > > > not entirely sure whether conflating the two is possible? Depends=
 on if
> > > > > your IP's programming model changes if the option is enabled even=
 if it
> > > > > cannot be used. Not beyond the realms of possibility.
> > > > >
> > > > > Also, ibi-broken doesn't work for your platform, since the default
> > > > > before this patch is no ibi and requiring a property for no ibi w=
ould be
> > > > > an ABI break.
> > > >
> > > > The perils of FPGA IP I suppose, and not being quite careful enough=
 to
> > > > document all of the relevant options from the start. Been guilty of=
 that
> > > > myself.
> > > >
> > >
> > > Check impliment code
> > >
> > > +       /*
> > > +        * The interrupt only carries IBI events, so it is only descr=
ibed for
> > > +        * designs synthesized with that feature.
> > > +        */
> > > +       if (master->ibi_capable) {
> > > +               xi3c_master_init_ibi_ops(master);
> > > +
> > > +               master->irq =3D platform_get_irq(pdev, 0);
> > > +               if (master->irq < 0)
> > > +                       return master->irq;
> > > +
> > > +               ret =3D devm_request_irq(master->dev, master->irq,
> > > +                                      xi3c_master_irq_handler, IRQF_=
NO_AUTOEN,
> > > +                                      dev_name(master->dev), master);
> > > +               if (ret)
> > > +                       return dev_err_probe(master->dev, ret,
> > > +                                            "Failed to request IRQ\n=
");
> > > +       }
> > >
> > > They can use master->irq is determinate if support IBI.
> >
> > That seems viable. Where does that leave them for hot join though?
>=20
> No reason to keep hj because the difference between HJ and IBI is the
> address when address arbitration. If hardware support IBI, it should supp=
ort
> HJ. HJ just use special address 0x2.

For this IP, they appear to be controlled by different configuration time
parameters, so I don't think conflating the two is the right thing to do
here:
https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
Per this doc, and the original commit, hotjoin configuration is not
permitted when ibi is not supported but can be enabled and disabled
separately when it is.

--LkC3daycRRxByKPg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLzOwAKCRB4tDGHoIJi
0tlLAP0fpiGDzo/aM4C0+bwrQ47VfXaCXmELfQhUlx6RC3bwgAD/Yb6FqXnTDZ1l
1Two2fYpvNw8zDGzFTi2XW+6yG8JYgQ=
=j+JB
-----END PGP SIGNATURE-----

--LkC3daycRRxByKPg--
