Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584327;
	b=wnRr8aIYc72/Mypd0a9FyePsKkWmoWUxMAMDVak8sAXyimZLBJvpexyFPbxy/sw+bayX
	 SSGxfBa8E3AGTCqtIA26onbAIEKwW3iyP1izYFkDwJ27DcJxSsNh/JTRMNdAdRA/gHCZe
	 mWBfs3rwjpftjDTfJf3WmQbxK1bdRCd19B3aZAW1ewnTmHqT0eyhWZfnACb8WROMtIico
	 uatM7UqqQKvIp5Knzh99gzh+4IQNCVEyFwdqg2CiW2c/cQROvzGkx8tgCNWfyY7MGA5n7
	 kkdpSlavQNHT+F56OqRwwZq6x1zGnz76K7GVH0z7eMLWVjovXzI2gKnmAXnjPhxqAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584327;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=O61xCztn16+CXQnXsR44bdFGXvhE9RH8gNBloavPbF0=;
	b=qoKj4XMQKL2zNlb5/B/2+NN6BDCx/3IeCwTfKtGO4NbDjIaH8FY/HWa31ofmd7OoGqrf
	 K0S9+T4wsGPsgq6IiJvg3gvGNCjhwo0im/rQLoW/2WtDUsCFMXYDWbhv08SOvIdlproo9
	 SYJMk/VTIYtAwrwxdCNfqvEhevoFNOP7IOiPg2Bn3/YIqb069TAK2jSvLC+sE7KqEwXjw
	 fpxHPZAcKxuaEe2SSRz+nl8XAF0/99ZMdC6IYHXYrWaE7qXVHKdMKYRl0ZAkEP9KFzCds
	 kj9lrB9POkcqUJKcWWlMkuOGWKUuQVu8fhIfPs7dTNhIzB064cem3knIPYR9QWzL5LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="B/MBRnAI";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C359606A31A;
	Wed, 21 Oct 2026 12:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C359606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=B/MBRnAI
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13F841F8;
	Wed, 21 Oct 2026 14:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792584195;
	bh=yj25+04SNewszu7HyA3/Agpl6CsSY9REc1aQTeuyfqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/MBRnAIffrF2sWUzabo7wzt3nUNy3A1DjS7krugH8cg3EaZz5GzxhCWtegJRr/wL
	 MuA9YIrcIO03Azjr60Daeu4AD7398haa+ivusRKGQISE4HDNAexIL0GkQEox9LzcsL
	 1FEEjT6ytrgCYLv1zfxotxpC3ezR2PXKz7jr+osA=
Date: Wed, 21 Oct 2026 15:05:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <20261021120521.GA273922@killaraus.ideasonboard.com>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
 <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
 <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
 <atiogo14sCFw4xlT@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atiogo14sCFw4xlT@kekkonen.localdomain>

On Wed, Oct 21, 2026 at 02:56:50PM +0300, Sakari Ailus wrote:
> On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
> > On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart wrote:
> > > On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > > > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > > > exposure and analogue gain controls, image flipping, blanking controls
> > > > > and test pattern generation.
> > > >
> > > > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > > > 2, for which Dave (Cc'd) is working on a driver (see
> > > > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > > > The register defines in the two drivers appear to be quite well aligned.
> > 
> > Asked and answered at v1
> > https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/
> > 
> > > The current version of the driver implements very few features of the
> > > IMX908 sensor, as crop support has been removed pending the raw camera
> > > sensor model, and Clear HDR3 is being developed. I expect more
> > > differences to appear when those features will be merged, so I believe
> > > it makes sense to have a separate driver here.
> > >
> > > In the future, I expect the raw camera sensor model to open the door to
> > > more code sharing and more drivers supporting a wider variety of
> > > devices. We can decide then if the imx908 should stay a standalone
> > > driver, support other sensors as well, possibly across the Starvis 2 and
> > > 3 families. I'm willing to help with the refactoring at that point if
> > > needed, the maintenance burden won't be on you (and I'm sure that
> > > Lachlan and his team will of course maintain the code base).
> > 
> > Agreed.
> > I have compared the datasheet for imx908 against the Starvis2 ones,
> > and when we start looking at HDR modes they diverge a reasonable
> > amount.
> > 
> > Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
> > to the earlier ones, so adding Starvis3 would need some care.
> 
> There's quite a bit of this in the CCS driver, due to the variance it
> allows for implementors. I don't see this being a problem as long as the
> foundations are reasonably similar, albeit we can see whether this could be
> further extended later on to other sensors.
> 
> I'm fine with having a separate imx908 driver for now. Dave's driver also
> exposes the variant information through the media entity name so that
> should be done by the imx908, too (at least if there can be multiple ones).

As far as I understand, the IMX908 does not have a mono version.
Lachlan, could you please confirm that ?

> I'll review the driver properly soonish but I reckon it's in a pretty good
> shape already.

-- 
Regards,

Laurent Pinchart
