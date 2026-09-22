Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE303C342F;
	Tue, 22 Sep 2026 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069625; cv=none; b=Z4Ls54/c9BSpAiiRA8XiieS/RRqr3U0YQlJ6z+mHzdmzwPcsNF5sktzWuYSp3ekXpUTgvTZmavQPh7X1lkFvaKA/PVQx6Y17VKv+nDgcK3e8icj8QMBZoBAuM3S3OJD3sBjF5in+xW80bUn1bXFtnE0jtH+7l9NH3b6BdlTHH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069625; c=relaxed/simple;
	bh=8/LU8g+oQ/fgM/4yJAu8riwgtOdYC3/QvQu1sWF3O6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFJ7l93X6NoP8PIvanzRr073vzZVzVE62pAiG+40qatN2uDUyaMJzUfEnNwkCdhpVwWvy9jddFPgag2A6wZJ+h/DpCGIOlqRYjFNDtQwlStPa2KEM4vGFq5qkvDqK5jkq1ehdjKyVwKzndYPh72XpDKdoWStcJlSON5uk11oA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1Pyw8Ih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1Pyw8Ih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1D81F000FF;
	Tue, 22 Sep 2026 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069624;
	bh=dCb5W6Rk/5EPP17UF6/L0m1Y5v4rBXDuqOA2WoWNKNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1Pyw8IhvaefdHQYnwSdORaiScu/nthyi1JVG7nezctu2W77tsJrXvF6aNQ/yePlT
	 OyfN6ewEzcwu0qtrmuaYhBS4Hy/7Ru5UwEsuD31ofqkIQXTNr4qhfJToAZbDFQe5Fx
	 y/32JFxsI1bOpVDDqWnSsykyu5VS2khOQ0kGS7lbjZawpQUyzYmXdW5w3s/7JKZRjr
	 g4t7POeS2BFo4Jbpl7Wr2YB6vJcT7EJJVcfS14jECuIbjornFqAt+B5dZZhuf43Zs/
	 6v3k0BXyI6/Z/Ld8c8t/ARdpQoDtItpEw65hm19Hp9F48PQyVmKAvvs85cxbeWyxQl
	 V1EQYq9k5bGWA==
Date: Tue, 22 Sep 2026 10:33:39 +0100
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
Message-ID: <20260922-ethics-flap-9760347e869d@spud>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5N8z9olhDGrkXlQd"
Content-Disposition: inline
In-Reply-To: <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>

--5N8z9olhDGrkXlQd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
>=20
>=20
> On 9/10/26 17:44, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of th=
e AXI I3C
> > > > > > IP. Describe them with two boolean properties.
> > > > > >=20
> > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a h=
ot-join
> > > > > > capable design is always IBI capable as well. Both events are r=
eported
> > > > > > through the controller interrupt, which is therefore required w=
henever
> > > > > > the capability is present.
> > > > > >=20
> > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > ---
> > > > > > Changes in V3:
> > > > > > - Move in-band-interrupt-capable and hot-join-capable into the =
common
> > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > - Keep dependencies in the AMD binding.
> > > > > > - Update the commit description accordingly.
> > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in t=
he AMD
> > > > > >    binding [1].
> > > > > >    That Acked-by is not carried here: the names lost the vendor=
 prefix
> > > > > >    and the definitions moved to i3c.yaml after Frank Li's comme=
nt.
> > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495=
476599087@spud/
> > > > >=20
> > > > > I disagree with Frank. These properties make sense for Xilinx bec=
ause it
> > > > > is an FPGA IP and synthesis options impact this. For other device=
s, this
> > > > > should be determined from the compatible.
> > > > > Please revert to how things were done in v2, especially as no rat=
ionale
> > > > > was provided for why these should be common.
> > > >=20
> > > > It is common problems, when IP intergrate by SOC, which may defeatu=
re some
> > > > part, It is not appeared now just because IBI and HJ have not enabl=
ed
> > > > widely.
> > > >=20
> > > > IBI and HJ is optional features of I3C. Ideally it should be indica=
ted by
> > > > some registers. But not all vendor implement provide this CAP regis=
ters.
> > > >=20
> > > > IBI and HJ depend on some slow clocks, which monitor SDA line chang=
e.
> > > > Some instances of IP may not have such slow clocks. Some IP's IBI a=
nd HJ
> > > > use seperate IRQ line, but these irq line may not connect of differ=
ence
> > > > instances.
> > >=20
> > > All of this should be able to be dealt with by appropriate use of
> > > specific compatibles.
> >=20
> > I understand compatible can cover most cases. Need variance for propert=
y.
> >=20
> > >=20
> > > > like previous SPI vendor customized property, we takes efforts to c=
onvert
> > > > to common one and also meet back compatiblity problem at convert. I=
 don't
> > > > want to do it again. This kind property is most likely as below.
> > >=20
> > > What SPI controller specific properties are you talking about here?
> > > There are relatively few properties in spi-controller.yaml, and none =
of
> > > them deal with these kinds of capabilities.
> >=20
> > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> > some instances have not route all CS to pad.
> >=20
> > >=20
> > > >=20
> > > > default: 	decide by comaptible string or hardware cap
> > > > force-disabled: force disable for some reason, like, miss connect i=
rq line
> > > > or missed some clock, or IP bugs, or board desgin's some level shif=
t chip
> > > > broken IBI/HJ timing requirements.
> > >=20
> > > Of these, only the last would be a valid reason for having a property
> > > for it. Missing interrupts, clocks or IP bugs should all be dealt with
> > > using device specific compatibles.
> > > If board wiring causes the breakage, the property may be more
> > > appropriate at the i3c device level rather than the controller given
> > > that wiring to some devices on the bus may not have the problems?
> >=20
> > I3C.yaml is for both master controller and devices now. I3C is bus, whi=
ch
> > connect many devices, if wiring issue, whole bus can't support IBI. And
> > if any broken devices happen at address arbitation, whole bus can't sup=
port
> > IBI.
> >=20
> > at beging, I suggest 3 state,
> >=20
> > [default, enable, disable], but now I think IBI_broken, HJ_broken is mo=
re
> > reasonable to disable it, default value should be set by compatible
> > string or DCR of I3C regiser.
> >=20
> > And some I3C device may be failure to work with IBI even DCR of I3C reg=
ister
> > show it support IBI.
> >=20
> > I don't want to appear two similar property between vendor and common, =
like
> > num-cs vs fsl,espi-num-chipselects.
> >=20
> > such as IBI-broken can be used for controller and devices case.
> >=20
> > > That said, I think that problem should be dealt with when it arises,
> > > rather than starting a trend of adding capabilities properties at the
> > > controller level when I am not convinced that there's going to be oth=
er
> > > users in the same vein.
> >=20

> > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > understand,  logically equial to in-band-interrupt-capable.
> Conor: Any update on this one? I think this thread is stuck at this stage.

I didn't think there was any need to reply. I took the first sentence of
this snippet to be acceptance of what I was saying.

If yous desperately want to have a generic property, the negative
connotation of the "-broken" is probably better in that it'd be more
likely to make people set stuff by compatible rather than have to use a
property with that word in it.

--5N8z9olhDGrkXlQd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarJLcAAKCRB4tDGHoIJi
0p7eAP4tFd9rr2uq/A+C1Y5UyVjJDiV5gOV1JvJgbx+lDNY8iQD/TrOOsgJoq3me
FtYE9IDQ5RfCy9sedzqO/ChUFPsjWA4=
=3f1n
-----END PGP SIGNATURE-----

--5N8z9olhDGrkXlQd--
