Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500995;
	b=N1CZUz1G4PBtERV1CBoKMw5ysi3FVlIrFSg7b8XGc0p/I+AZKZXd5mIqS9qgmDzNW5ym
	 HRH61kAOOnXqTA3IrvyJ8MgK3A47n3zic/TuHU8J8M7pakt4h5N7HpkkWcKztIBRp1KAA
	 Kj1BkcX5AjQHOSpdGEgHYEkMejgNgcoSXHUwsbtkSd3ySmw08L17vqx/Ln3ZnGCzkiTnM
	 pUbD6kiCJs0Iyl840+hb0kDBa5DFz8QxvMEGTBIYcfqrF1BBwAamdPd29eLVMOcL9HAfv
	 zkr3AisEwpsIYXR+UUVtcgXvvd1XjSMUese1vpT313Y+W1odgtEMmrbYWILVxgL8OAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500995;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=87wfgv30mmnUtkeJzoc3U0Jc2RYjCYcciK0pi6z24Ck=;
	b=4ma8ymH29NOJhjJxBp0I2s8hGWj+V2j3i8UghjbC1kQ7tUMoFnIUV/z0o8rYFeOCHxqX
	 m8/H0YBJ2sRlf4eQZt1wmGsGw3+dGp7FS2KdfuLl2P9pjMQWNHsZUuGrDN/O4XMAZzHYW
	 dDWSop5A1vrPiEtUaKFG2oXloGv2rytgxYX5em73Fv1Qls/U1RF7es2FPnnExCe8MhoTT
	 tl1cEUnUA4+r2/7j6/6Imvdx4r/dA9vlx4ZPuvfSL5XTRigFR+EPimGH7cvICkDx3XXY3
	 XM33sFYrwBJGy8wzDV6dZw5XYbPmvDYMNfe2iPmZhd6b8lbAmBlW3qAdBhYuycFEMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GPzpKSKV;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA51606A31A;
	Tue, 20 Oct 2026 12:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GPzpKSKV
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55B8F22B;
	Tue, 20 Oct 2026 14:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792500865;
	bh=eAnj6WZydALzwcU6GInyS28FdkRUR1+ZbwGLLJPnwh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPzpKSKVoY9pw1qPhs5DHpHccMUCPJLztNk7cuiIQvZUrbbgICSOiG58IYch8iyaj
	 7kXQi6ZAeQFvLMrsn3V5z47Y1dkqtCPQe0LFfKFb8g4ZOgNZZDtz8rB5Pj5Mrxp69s
	 mZPe4cQDqK0bahtDceyi/wtkax953bK/V3Py6inw=
Date: Tue, 20 Oct 2026 15:56:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <20261020125630.GA158670@killaraus.ideasonboard.com>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
 <atdGr8S2sf1kZFUw@kekkonen.localdomain>
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
In-Reply-To: <atdGr8S2sf1kZFUw@kekkonen.localdomain>

Hello Sakari,

On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > output interface. The driver supports RAW10 and RAW12 output formats,
> > exposure and analogue gain controls, image flipping, blanking controls
> > and test pattern generation.
> 
> The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> 2, for which Dave (Cc'd) is working on a driver (see
> <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> The register defines in the two drivers appear to be quite well aligned.

The current version of the driver implements very few features of the
IMX908 sensor, as crop support has been removed pending the raw camera
sensor model, and Clear HDR3 is being developed. I expect more
differences to appear when those features will be merged, so I believe
it makes sense to have a separate driver here.

In the future, I expect the raw camera sensor model to open the door to
more code sharing and more drivers supporting a wider variety of
devices. We can decide then if the imx908 should stay a standalone
driver, support other sensors as well, possibly across the Starvis 2 and
3 families. I'm willing to help with the refactoring at that point if
needed, the maintenance burden won't be on you (and I'm sure that
Lachlan and his team will of course maintain the code base).

-- 
Regards,

Laurent Pinchart
