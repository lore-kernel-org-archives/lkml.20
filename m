Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF8D515990
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089812; cv=none; b=LJdAlRfYk/7p9irccAqGjX09nWDZh6qUarrWUV9JjbDsc5VcF36GzLMaG12j77oQ+QxXmwGZC5AmCnP4lyQhMICZtTwP+3K3oNjDLKJCvm+nfnKPrIyogpEBplpc5ydnH8PlH/LpvsNTuMgMm05Xm3GmEqo720FabHOT6kTsPDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089812; c=relaxed/simple;
	bh=eZvJzrFV596OF1br1NU0yVbzXelFlV68AjwAwCh1swg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heyjGHD4gl4kNwbZMNDdwwEM5O1CcnO1c4WYsKhc9yo5fKNyOho37yDKBMHBxpoiH9ODppFODmEjBh98Kg+Er9woB9FkE8jRoIxVszQQkTeB0tbPv7HaYJMjdEsCEjQxBqyIsUbrpHvj8B9V+ZJwczNaUMwOSGSr6LiRXm7bpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d1IDzF4x; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d1IDzF4x"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso30817645ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790089809; x=1790694609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=d1IDzF4xWm7B6UOIG67rVnH+XZYTiCxJ8+FXRmt4FCJSL+X8iUIgsu/p0mgi1uAOcQ
         RYqOOYPL0Nv3qPMrkoRycv+2bsbUdUav7C2d0lNpgYxlh/2XK+J4IJjD5Hu6fZDvcWxj
         H7bIm2avx+6d1dh4YVB9Lh9MfHf0CCrnFSVZbw/rmnyUvEDralSlxXpznAbFQzntWG7I
         SylJv307id2rEXdXBd+i/r1Z2ZA0xs5b3M2yGnT8fDlTPzDjC7yCpgFQTfybWAvB3R/A
         +4m/x3DRrd2ndHDAVZFyGS0USdUMr50f9dQv181MoxOkPPfE2/hwIDa7V5edRTIx83Bn
         Xr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089809; x=1790694609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=VAEeCNRcEjO3TfxMqTHXTYVJdExTcbMN5WoV0y5VXOnpdHbEhh9QizAkV6JFyqbr/H
         rz8uWQJJWt9tbwCXm+90XWdpFEacnLPL0KvS7uug8tqiSzC/NLtvNqYGB53KezCmhB+u
         z3ae/4B7p9mSzgp2OQHDXNZJ7XBVDqgN5evBwPB/NMxDGEnd16/7HQR0YyU1OJNW++RB
         Mz+M6oUvrJmMshJxqeMOe+KBCL5o4goquvwqsBjY0nO/jnHdn6UAlwTRjjWqAsZcmslF
         E+wbWp/86abXHGEsmKLQ1liLCdCA0mVN8SnBG8Tl4b2IBR16EInX7/wwH2s1AHyrQsNr
         Ud8A==
X-Forwarded-Encrypted: i=1; AKwUvBxIHL1CYqtTq9vzv6O+L4JWVEe0tUD18BnoU1prnzcgguwbX9iZsut+AqdTKuY31LRFK3Ra4I2shknQshs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4hs211NB500ssyQRo2w1an94NtaVdSCLKywh2X6smJcTjcbgm
	MT/RT9YNAfSO/Fu3SWa1rZb1v0wmwl0RpCZt8E0zysQbJiOAL70xCTVYysG2z4bwiXY=
X-Gm-Gg: AYBFou3w8CjRV8x0VveLHCdjKeJq3ZGImpOzdDZ/ANAWZ516cYftuxtlcyDK+dulK88
	USz9zw6HvNr7UHLa/+5mAtt8WORhAwjFNFwauTvEJsEk6Rc2fzfc+4vihyYfVpH94idJFB8hTEw
	1TDoAIgiytVozVdiUL+al5BrlBesgdKXamlm5H1Ti0LR9vHFWXh5ZX3Qn445OWeZmFlWjjbiuCZ
	x+j9IzFXakaX5tXKRxg6ebG5VYyfQWCOmG+zEislH2upCspO4wbSffXN8rmSoLH4LGO6AvfMbPl
	LmyRfr+5ZK5kyMdKjXP0jLgCyKY2XYP/jafeGl/tzbHV1D93m/PTHAhW/4gT6Dn3nugPZSgHjlF
	BcLnFMi1yMQXnZVSz2U9Q/Qh+41KDDPV+EawKozCMozCTSSsoC/bFu9VY791iZ37/ls0/uMzg6Z
	HNHIuUAjfn6ud/fx6UaZCCAfkYHXR1lbgYDCnTMafZ8jrSGFmlimVm7gonVub+pqVRG5YHMEWJ
X-Received: by 2002:a17:902:db0f:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2df609d1b62mr16580265ad.14.1790089809191;
        Tue, 22 Sep 2026 08:10:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0563eesm11964455ad.69.2026.09.22.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:10:08 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:10:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arKaTaFuNW936nwg@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
 <arFRqopkkJf7Nlq4@p14s>
 <arIgI4E5rGXq9H0P@bywater>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arIgI4E5rGXq9H0P@bywater>

On Tue, Sep 22, 2026 at 08:32:15AM +0200, Francesco Valla wrote:
> On Mon, Sep 21, 2026 at 09:47:54AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> > > There is currently no way to report the VIRTIO_F_VERSION_1 using the
> > > resource table alone, as the per-vdev feature array is limited to 32
> > > bits.
> > > 
> > > Considering that the VirtIO 1.0 specification is now ~10 years old,
> > > always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> > > it.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 74e0da970f1d..cfd66d9d1c9e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  
> > >  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >  
> > > -	return rsc->dfeatures;
> > > +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > 
> > I understand this.
> > 
> > >  }
> > >  
> > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >  	/* Give virtio_rproc a chance to accept features. */
> > >  	rproc_transport_features(vdev);
> > >  
> > > -	/* Make sure we don't have any features > 32 bits! */
> > > -	BUG_ON((u32)vdev->features != vdev->features);
> > > +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > +	if (WARN_ON_ONCE((u32)vdev->features !=
> > > +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > +		return -1;
> > 
> > And this.
> > 
> > >  
> > >  	/*
> > >  	 * Remember the finalized features of our vdev, and provide it
> > >  	 * to the remote processor once it is powered on.
> > >  	 */
> > > -	rsc->gfeatures = vdev->features;
> > > +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > >  
> > 
> > But I'm having trouble with this one.  
> > 
> > First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
> > rsc->gfeatures.  Why bother with clearing bit 32?
> >
> 
> Bits > 31 gets silently dropped because rsc->gfeatures is a u32; this
> was inserted to explicitly drop the flag that has been inserted before
> and avoid the "silently". It has no real funtional impact and can be
> safely dropped.
>

We have come to the same conclusion.
 
> > >  	return 0;
> > >  }
> > > 
> > > -- 
> > > 2.55.0
> > > 
