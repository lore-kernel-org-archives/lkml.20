Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461779;
	b=4yAehVdP+OY5fqwKw0YQLgyRjuE32cJA0XfuUDoJFlL6eMKHdDc8KUgiPaSdIQK66Rjw
	 xg7xgzMkNfY/T3I1U7UZ91SWdfGGIayph3r5iCyMuw4UUQggsYHbgWyWp3VPBXvWSE01B
	 RihYkxbChOP9VoWSfxeKW5YvuPY/fJ6/81KYd4kPmrQCpsqx5ipWf5oofTuaPnVz39Orw
	 aH+PMKCvWsDj6lW68ZfzESJOWWPsjXfLPmqA8HWUWbSRbsMFsPyOviszamXuL9/7m/l1L
	 Hr4jsRi9dau6cxj0gBPjf7tFdRoA1dBSucxcbGwUS4cqO4le1HnRJb59K8YZ5eNdRlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461779;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nOZ4Ter206XpxcOoYF6+q+So3F0oft7pzSF2vobVs3M=;
	b=z4gzgmw0KbFkc0Kharnxadx9wQlK6Okgkw6WExcwRKI0ST9QYwxCIemCqc9CEET0mXyT
	 DVzx79rQEBeH5VNydhibhOmIFS89JPJDYyIUgXf0/0gsGea3aT9MRCNAa5hTrxhxnIXTv
	 sesffoQKHb16GmFrDh95VwwWvyHxHyj5cs2ryQZV7ifWXMpS6Tcjd4ehOyKU1RVwouVfs
	 NMVZJaQMqemGkyV0ffCGWNPTtLY6F+4evofy81aOSOClb7EiVx/lmtlqP1MWlCY3mPMLK
	 ap+YsIW98isV9pdQazu/rMHGVO5XX6WFLFfn4D2kf8Sfws/Sa6jQY7vpDzmWDlC748A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi5nSi0Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0474606A319;
	Tue, 20 Oct 2026 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi5nSi0Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04711F000C4;
	Tue, 20 Oct 2026 02:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792461778;
	bh=nOZ4Ter206XpxcOoYF6+q+So3F0oft7pzSF2vobVs3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hi5nSi0Z8e4PuO1zKyB1ESBMT7Zc9KPxYUe3Bk9Z6LfL/4bOKOA+XMoewdt4dVXwO
	 1Y6PhXJZaVCbF4HFyBVScVN17PIkL46KDlsZ2hg/HtJIDoxqQ1rCrbfpdYb4JXR/Ef
	 84g8R1QG00wFQyOpX3UlpM7TqM7T+aJVmktP2c7F6iIXbBq7BMq9NwrDrVfBJtErR7
	 8SQVHrqkKNe7hrYc6kM82Hn2eclsjmJ++91F0fjdDVX4IBYbuOrb2YOqUdgYmYJxDP
	 XXe8tou7YeMTxbmY//w09p1rOdPnGrKrMJ77GKNMqtuuQ8LHfz1D2Nl2Am75fGcWrk
	 QEM61ljMCKXxA==
Date: Mon, 19 Oct 2026 19:02:56 -0700
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, pawell@cadence.com, rogerq@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	balbi@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: cdns3: imx: fix kernel panic on remove due to kfree
 of static platform_data
Message-ID: <atbL0FjdTOQoJHjQ@hu-petche-lv.qualcomm.com>
References: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
 <atZ_w13x6QgsMhwn@SMW015318>
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
In-Reply-To: <atZ_w13x6QgsMhwn@SMW015318>

On 26-10-19 15:38:27, Frank Li wrote:
> On Mon, Oct 19, 2026 at 04:49:44PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > When cdns_imx_remove() calls of_platform_depopulate(), the child
> > platform device is destroyed. platform_device_release() then calls
> > kfree(pdev->dev.platform_data), but cdns3-imx assigns a pointer to
> > a static global variable as platform_data, so kfree() on it triggers
> > a kernel panic.
> >
> > [   56.809541] Call trace:
> > [   56.811982]  kfree+0x44/0x398 (P)
> > [   56.815300]  platform_device_release+0x24/0x4c
> > [   56.819747]  device_release+0x3c/0xa0
> > [   56.823413]  kobject_put+0xa0/0x120
> > [   56.826906]  klist_children_put+0x18/0x28
> > [   56.830920]  klist_prev+0xb4/0x1c0
> > [   56.834325]  device_for_each_child_reverse+0x7c/0xc8
> > [   56.839294]  of_platform_depopulate+0x34/0x80
> > [   56.843664]  cdns_imx_remove+0x34/0xcc [cdns3_imx]
> >
> > Fix this by iterating over child devices and clearing platform_data
> > to NULL before of_platform_depopulate() is called, preventing the
> > invalid kfree().
> >
> > Fixes: ff6d6e6c6778 ("usb: cdns3: imx: add glue layer runtime pm implementation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> >  drivers/usb/cdns3/cdns3-imx.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> > index a2f041e1707c..2c86fadd2cf2 100644
> > --- a/drivers/usb/cdns3/cdns3-imx.c
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -218,12 +218,20 @@ static int cdns_imx_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >
> > +static int cdns_imx_reset_pdata(struct device *dev, void *data)
> > +{
> > +	if (device_is_compatible(dev, "cdns,usb3"))
> > +		dev->platform_data = NULL;
> > +	return 0;
> > +}
> > +
> >  static void cdns_imx_remove(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct cdns_imx *data = dev_get_drvdata(dev);
> >
> >  	pm_runtime_get_sync(dev);
> > +	device_for_each_child(dev, NULL, cdns_imx_reset_pdata);
> >  	of_platform_depopulate(dev);
> >  	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> >  	pm_runtime_disable(dev);
> > --
> > 2.34.1
> >
> >

-- 

Thanks,
Peter Chen
