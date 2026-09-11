Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043D43304B;
	Fri, 11 Sep 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132706; cv=none; b=X54FKp6GeKctP8/vffDEwgSZEIA+asRPGPuyQsQ+HXNlv19H3s5TWiOcR8cx7Qm5g9UFR40ZxaS2CZEbog0WfiXty2EXgOPbQE9L7aH1wBPV+hFVEqPWtULptaerR82PjR96/sIr2ZaOlZ83pa5eVbJ4gO2Sl/Xa+ELj6wg0hdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132706; c=relaxed/simple;
	bh=21jQM9d+27pLB+0dGjFBohg0Nthg1DSEVV8j2w8lQBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Rq2JYl7uwWJFEbRfh0X+cbcrQpli5AC3OUVePlM4prcsd4NDMceSWPUDfsL1a4VDm6Wnr1x+AWquJ/VRvwa8pDY4/1igL2SOR0GbMit/awsdp8vu+sy6y2MfGOWpVrML+gfhD06ndXk2mzxt00N9Ke4gtJrcMTG5FWlLCTYb9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6eFZVZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6eFZVZe"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C00871F000FF;
	Fri, 11 Sep 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132705;
	bh=c2YxdGYQdAbBw/pBKfb1UnHuGGtzKtVFqsJvIXT1fJc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=E6eFZVZeSo8ddd8exUojW5PjEvEbRIVFkZACRu8A37xpu6NoN2F0WlLZH/mZ7FZ77
	 RrcC02E2mOi6S/OwMfIgTPlgV9ioZu0+a9Q7TIqWCveLB+NKrT8kp7lU9Lf65YOQrX
	 xvsCWMfWW4/AmjlCVeHVBekoPHMX/PgcEMByfmkiUe6i0AVwzJNNrnzarrpfHysDMt
	 sXOSQE8Ev95Aq5qLhb9q6qaf4JlFTD27mfYg12Bsui2O+mNo/xSMFFBgNB+y96MQaW
	 G5KpUrFCRJ6cX0V6/fFPBeo7ZFrcxTMMgQFYQ2vjEfj8v9fD3/eLzh4LqKStysMK/r
	 3Mji00gIFj9/g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 11 Sep 2026 15:18:21 +0200
Message-Id: <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, <sashiko-reviews@lists.linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, "Jon Hunter" <jonathanh@nvidia.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com> <20260911105245.408171F00893@smtp.kernel.org> <877bksq7mo.fsf@bootlin.com>
In-Reply-To: <877bksq7mo.fsf@bootlin.com>

--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 2:45 PM CEST, Miquel Raynal wrote:
> Hello Michael,
>
> On 11/09/2026 at 10:52:44 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when
>> read_sr2 is unsupported, leading to uninitialized stack memory use in
>> callers and spurious -EIO errors.
>
> The annoyingly right Sashiko robot is correct :-)

I actually had the same feedback, but then discarded it, because of
your comment in the function doc.

Here's what I wrote:

  But now we are lying to the user of spi_nor_read_sr1_and_sr2()
  because we might actually not read sr2 at all and just return 0 -
  or even worse any garbage the sr[1] was initialized with. And the
  user cannot even know if sr2 was actually read or not.

But can this actually happen somewhere? Except for the WIP bit,
otp.c and swp.c I don't see where we actually check for a bit in
the SRs. Everything else is for RMW and that shouldn't be writing
garbage as the expectation is that there is no flash with !read_sr2
&& write_sr2.=20
I agree, that it might be uninitialized, but if that uninitialized
value is actually used somewhere, we'd have a bigger problem, as
that new value is now just made up by us.

> The best way I see to make sure this does not appear, is to just add
> this fallback to make sure when we read both registers we just get zero
> instead of random data in the buffer. Again, the idea is to make sure
> callers do not need to be "QER aware".
>
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -867,6 +867,8 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 =
*sr)
> =20
>         if (nor->params->opcodes.read_sr2)
>                 ret =3D spi_nor_read_sr2(nor, &sr[1]);
> +       else
> +               sr[1] =3D 0;

Almost back to the original one :) At this point, I'm fine with
either.

-michael

>         return ret;
>  }
>
> What do you think?
>
> Thanks,
> Miqu=C3=A8l


--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqP/nRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gQ8wGA0tpUeHcnKU4YeLCb1EmyzVZpcBRBhWeQ
K5CF9p10m/03QoGTMMg/E1Ev4fYYqo+fAYDk86SvmnfpEadncfsV1cnLrS8ldq1n
TAz0HqmAtw55gUyxNSDPwsbYMHZW/h508hY=
=qKRq
-----END PGP SIGNATURE-----

--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf--
