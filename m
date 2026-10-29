Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289663;
	b=EZ7EjxgL4W8zZnVQrSV5IQLcReIuroJAcXvOfrfeyn9b4NhdfFljrVsT8M42GNKeFFHO
	 NicNnxNyIqW+V8PbA7X9xPium2xitMO74yqyVPlDZQr+ZyOIIGf7lGCxo3h6f5WV6u+e2
	 ZQQHm1YmY406bKqQaIjP7CrTyA78VaT1ML2bD0SHOlDN/oiDq1tawO2ZkGeDwtNbiCTc/
	 QHivDNXzYLJBp3Ei5ebzyCQOLvf5b/IXla7EJMEUiO18Hg4+dKcaDdcQgU0ppVmalrgVz
	 c5WE7g2p25+FDkCqV+6c4H4qkcYM9voY13239KfoI9n4rhKao5ZrpYMRKNEs3gHS8Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289663;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yWQBZdKwYPknyhR1ZTrFCJ4aE3HypJnngTbN5hSuA+c=;
	b=R656x2MUG7BaHQPiSZbBsNfoTprNQDk7epB5g11bJ4o98RdopeBr/iF5Obt1B9CLZOno
	 OIUy/8oxmV4ajjl/DaunV6vZDxINwc1PHq5PSoBO5VZm0CUnLbN5UvBI2RSKIx9ClD6QO
	 /rnXyaPULVE3wnG4sbT4WQo4+RmwhHZyKZSe73eKxhcnI03iEmLbjBraxRexTUjWKblO9
	 4iI51aMB0yHFkQ6G2iDG+B9h5M+yvhWd2dfNhIeF1GP/Pec6Vd+5uCxBIpM7z1WFm3IW7
	 5A+tlj8zmHwJFOb/gMwt7vnaRAskfpWPA8GTciC/JjRxiPHl1+OrmyU8hOYGqVALC8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n2UqB7dS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n2UqB7dS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8003D1F01816;
	Thu, 29 Oct 2026 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793289662;
	bh=yWQBZdKwYPknyhR1ZTrFCJ4aE3HypJnngTbN5hSuA+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2UqB7dSuTofD/3gI3MDpOjn0/XaiWYNGo5OddSA56jhBdGyopbKHgm+ENtVkMgp+
	 gCn+wsOF+N8A9B0WjerC66AEX5ulkSnHe0wD38qqSinDztfHu4bUbdALl+zP9MgQWE
	 d/+gu6UHwvenaAkLCVWxlDBoZi61wQ0na+/JXMwgzd7XXG9IbISZmPRrJuKxScdWkq
	 A6gWl6Bc7jHeUy8c8eDSXkQfo3GbCvi5ajLDUcIh1AhbBiA2OA27YEMIgp2emixnfh
	 tx/v7E0C8CEbQneptTgJtGwXf9xz/YQFWtBisFgBg8oAmxZ2V27Bnj3aH3KFVhoXSD
	 Z83wG5jm7A5qg==
Date: Thu, 29 Oct 2026 11:00:58 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/31] accel: ethosu: Fix probe error cleanup
Message-ID: <20261029160058.GA1232511-robh@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
 <20261029-ethosu-fixes-v4-3-4aa25e22578e@kernel.org>
 <auNrrlOyKRzSp6vv@lizhi-Precision-Tower-5810>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auNrrlOyKRzSp6vv@lizhi-Precision-Tower-5810>

On Thu, Oct 29, 2026 at 11:52:14AM -0400, Frank Li wrote:
> On Thu, Oct 29, 2026 at 08:35:50AM -0500, Rob Herring (Arm) wrote:
> > Once the job scheduler has been initialized, failures from ethosu_init()
> > or drm_dev_register() return from probe without tearing it down. The
> > registration failure also leaves the SRAM-pool allocation in use, because
> > the platform remove callback is not called after a failed probe.
> >
> > Unwind the initialized resources on both paths. Also do not call
> > drm_sched_fini() after a failed drm_sched_init(): the scheduler initializer
> > already unwinds its partial setup, while drm_sched_fini() requires a
> > successfully initialized scheduler.
> >
> > Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Adjust for previous patch reworking runtime-PM suspend
> > ---
> >  drivers/accel/ethosu/ethosu_drv.c | 13 ++++++++++++-
> >  drivers/accel/ethosu/ethosu_job.c |  6 +-----
> >  2 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
> > index ae7ebf29cb2f..9ee144c41550 100644
> > --- a/drivers/accel/ethosu/ethosu_drv.c
> > +++ b/drivers/accel/ethosu/ethosu_drv.c
> > @@ -375,9 +375,20 @@ static int ethosu_probe(struct platform_device *pdev)
> >
> >  	ret = ethosu_init(ethosudev);
> >  	if (ret)
> > -		return ret;
> > +		goto err_job_fini;
> >
> >  	ret = drm_dev_register(&ethosudev->base, 0);
> > +	if (ret)
> > +		goto err_sram_free;
> > +
> > +	return 0;
> > +
> > +err_sram_free:
> > +	if (ethosudev->sram)
> > +		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
> > +			      ethosudev->npu_info.sram_size);
> 
> Does worth add devm_gen_pool_dma_alloc()?

We want this backported to stable, so I think we want it as-is and then 
perhaps later add a helper.

Rob
