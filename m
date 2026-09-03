Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66909456E12;
	Thu,  3 Sep 2026 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438331; cv=none; b=t0MEYP/0O2WE05ESVwNDBFYwmDviFvJqAFD77QoeKJMHE1afLBlje5EJcLUIVAQaI1uC54BnEgg2zhBJ5GRaJns2kknhsdWbaKLCmKpmdfq5mZv5iWvDD4scaYD4e0TegvtGG+2B77whB/IOPfznKazd3IBCESlJDk5fawubWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438331; c=relaxed/simple;
	bh=R2SqMh4rgpRBaXbyeR+2YMywMcFVzIaIxTIjw0w9Tj4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=eqlinrSjGuuYNLrXjxgyENheWB8scfq3k1E8Tyjo2izfpY2pNgdD9ZXeelvDtOIEJg3b52tcvTEe6gw8foSX6s/DEU/NeV7MPmP3WX1jWKKVRB8gr5tJz2lwRicXRk6hlZ7Oek7AWgpRHKNSOoxocWSFr0ma6G+MdcKLycY/coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PdltrEiG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PdltrEiG"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:42c8:e78d:2576:d7c8:5aa9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8B2A2335;
	Thu,  3 Sep 2026 14:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788438237;
	bh=R2SqMh4rgpRBaXbyeR+2YMywMcFVzIaIxTIjw0w9Tj4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PdltrEiGVDlRF050lOWxW1LKmgMRjKaO9PKaUHHwgy3aXoSSp2Axz8GL3CxT/a5Xn
	 VNGtbMUOtDCniBoBl1TatrXfWmkE91zK6bgaSNJ+fKeyRKsd7HN5oeKZRMH2Y7nrEf
	 DE8K9S7Y3kcHYEFB5XN4uIEH9fKRA/yIZxY+bmUM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntChzSsnbXcNi6rPhzWsrS-uL_odbVZoSpj0byFQnhYOZQ@mail.gmail.com>
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <178840879109.11722.9212352209191978851@freya> <CAPY8ntChzSsnbXcNi6rPhzWsrS-uL_odbVZoSpj0byFQnhYOZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Update imx678 to act as a common Sony Starvis 2 driver.
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 03 Sep 2026 17:55:23 +0530
Message-ID: <178843832369.11722.3418940142738960168@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Dave Stevenson (2026-09-03 17:25:42)
> Hi Jai
>=20
> Thanks for looking at the series.
>=20
> On Thu, 3 Sept 2026 at 05:13, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >
> > Hi Dave,
> >
> > Thank you, I'm glad this turned out quite clean :-)
> >
> > Quoting Dave Stevenson (2026-08-05 21:39:15)
> > > The IMX678 (8MPix) driver has been accepted.
> > >
> > > Whilst preparing a patchset for IMX662 (1080p), I observed such
> > > commonality between the two that it seemed sensible to attempt
> > > a common driver rather than submitting a separate IMX662 series
> > > again.
> > >
> > > On checking my box of sensors, I found I had an IMX675 (5MPix) as
> > > well, so that has been incorporated.
> > >
> > > This set proposes a common driver that is working with all 3 of
> > > those sensors.
> > > It's sent as an RFC to gather confirmation that the resulting driver
> > > structure is acceptable as implied by [1].
> > >
> >
> > Overall structure looks good to me, I was able to stream with the Soho
> > IMX662 module I have.
> >
> > > If it is viewed as acceptable then there is still a modest amount
> > > of tidying up required:
> > > - DT binding updates for the extra compatibles.
> > > - Rename the common functions so that the model references are
> > >   only on the model specific parts.
> > > - Add the Sony init sequence for IMX662.
> >
> > I added most of the registers I could see were different from the defau=
lt
> > values:
> > https://github.com/jailuthra/linux/commit/9ecb2d905581e9cf7ca61aa45c3b4=
40fe7042307
>=20
> I just hadn't had the time to analyse the Sony docs when I sent the
> first stab. I've now done so from their magic spreadsheet, so
> hopefully our values match.
>=20
> I've now got docs for all of them from Sony, so will check through them.
> And I've just been told IMX832 (new 2MPix) also matches this scheme,
> so that'll be another variant.
>=20
> If you're on board with this, I'll do a wholesale replacement of
> imx678 with starvis2 in common defines, function names, and the file
> to starvis2.c as a first patch?
>=20

Sounds good, thank you!

Jai
