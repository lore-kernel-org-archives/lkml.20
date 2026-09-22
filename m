Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C9367288
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057483; cv=none; b=FoOn7Ai1ZZO3dMJCpbr5grTtz64woizgjfm5avzYFuylf6eKVohrmZPVEWXwnODFUuDxtWSmFh1iMS2X5sjbtLrgGr4yFJplTZ/OOgIcVJb7MnkjkcIw+aoKheOiaGP7tYgqtV8Z1mHnLyAmeJg67odr2QukjObfyLL3mDz5Es0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057483; c=relaxed/simple;
	bh=QCv3+VutRV12zObb2iK9+gsnJAsGyawD+siHQYxH9NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lu7Rll9f19H9IGcQCBBVqrjtTzr1KUeh4rAGgqF2LRsd3qJ/Exp19GjHFFTP3QCR9HcwlHdkwZb5NC3ji/ahywV4mGAJOKjuDzURH6yZMS/5iEZQZBz/gILJIC2CmRGlKj207VzIpODhArt36PZhXQ3WM4FRlPhT68ix5DorgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC70U+26; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC70U+26"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4386887a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057482; x=1790662282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlAU1cyZsGgVwNObzTYZB5CmWtYF2TFVXhpno3VWcwI=;
        b=GC70U+26O4DCaW242h15kXKsf2w6sVBKhfYJOXF87vMMmzO9M3dSJbemDlVZF6iyT1
         V1VP3l1lp+NxYKo9y+qz3bTnXHGs4QuOPum0Vr9zXuG5UkMnVAsV4R8u7d/egqJ4Q44q
         NkWFcXwMKiT8uwDktZ7M+Er2qpBmWJ4TaMWOMTNVGFt+OOJ4iWK80JMPGd73ceORFhsV
         wMndzSfEYKxrOEMNRPYxsuc4Z3/Xdz8lVc4YkXI76v8rXXzp1nV30VojnV8x33nw8QTR
         eArxA9SLh2VRK9JjSiTv0ZlivHXBXcPA4Wgc1PRxF/xK2+odTVnDPoT4xqePWodE170C
         8oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057482; x=1790662282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlAU1cyZsGgVwNObzTYZB5CmWtYF2TFVXhpno3VWcwI=;
        b=0MWwCSHWS9txemU4my7uO3qe7+ZTDpOk1NnXWoa0cA92fT9Q0jVWmZC5rMZOsWzJxz
         8Nkbef9UTTTGPMMWwYAmtHJTDMA/Zik8BUsTOcM3ffjCohPLNVjxlSiTxXWP1OnqyUyT
         DruXqOAAkmF0dbcHX3GnLuoKmie/Pz4+zelrIjaVpUPqcfTYPd6rvc5dD1hD94Bki/8L
         NimUbka7G0jXfT6AohKz2siQLAXYUAXCYQbAD/slDSvMTA6PBfHWv199Sr3LOtgGaPAG
         QohD+1ln8mRR4V0d9bl9oYn6c5Q12uO0BnnqSdu3W8qdqqBePsAKqwDSZ+YRIuIhynuS
         x8hw==
X-Forwarded-Encrypted: i=1; AKwUvBxc9MUqieXewHjC4cBOF5qaCwvQgMITOWfjxPR7AVunUW1p74wp++I5i0PHytifB4RwTs9fYMrdU2Z3lWo=@vger.kernel.org
X-Gm-Message-State: AFuF++l6BINKGoPA92VlxhNRTLDklOw9UHJ7JtIk2kAeJqEnnbJHD4Kc
	KASCPyaQ0rZUWPJggossapF+JKltec245v0CxJ8+dP3SKcoGDuZHyQgi
X-Gm-Gg: AYBFou1+EvKxpyrLOZGBQLHEigfH6oDjJvpnCtPa/b6k/RTSZLbWajuW8co22aE7301
	1sG4nqVtkRk50H4O5iQFJrMbpfHvNBWLBnHIWKPcqmM5MRgp3yPZ7cc2EtNPY3slEyi92H1GV8C
	i745zn32SRMRnfAJY7lTxotCLiFvsHWvux9h5mx1QFR3k7/7BE/77moXo8t9YThA9bzO6t66w4t
	Ly9YBvaq7GBvzBuWEISAbnDPQXAU0lldNW+CYZoyycPuo61Kf+fRURA0uKZa3z8T3GeLIebAZmP
	Mp5fCdKTNJ6Zd8EDbi+dxOY0vT+sXJ2UazfNATAw9JZOVydb7cQoS/LHd9YXHLrtgUtWbRnCKqC
	D4zqe0FalYtIjb3JRHBMxoOLDp3ljcQ3oHCldQQxmL5CHIRkGrpLVD38lI89btJKQHH66ebJ6NV
	yKGYpkdwZEKHXbwgDOKkUAK94nfBTXWJNC0rwZD0wfd41yWVMEReLcBCJqqHfiqOHjHpI7C80=
X-Received: by 2002:a17:90b:4c02:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-3a073112c1cmr146819a91.25.1790057481645;
        Mon, 21 Sep 2026 23:11:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5a14a8sm1659901a91.11.2026.09.21.23.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:11:20 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:10:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [RFC PATCH 2/5] ata: libahci_platform: Adapt the return value
 changed for disabled blob
Message-ID: <arIbwfsrA3PlSWNW@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-3-inochiama@gmail.com>
 <f0db06a2-08e4-4013-96cb-c6754f673126@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0db06a2-08e4-4013-96cb-c6754f673126@kernel.org>

On Tue, Sep 22, 2026 at 12:23:54PM +0900, Damien Le Moal wrote:
> On 9/22/26 11:47, Inochi Amaoto wrote:
> > Check EOPNOTSUPP for disabled helper function as the change in phy core.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/ata/libahci_platform.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> > index 6e072d681341..3e8ddbeb49b3 100644
> > --- a/drivers/ata/libahci_platform.c
> > +++ b/drivers/ata/libahci_platform.c
> > @@ -371,11 +371,11 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
> >  
> >  	rc = PTR_ERR(hpriv->phys[port]);
> >  	switch (rc) {
> > -	case -ENOSYS:
> > +	case -EOPNOTSUPP:
> >  		/* No PHY support. Check if PHY is required. */
> >  		if (of_property_present(node, "phys")) {
> >  			dev_err(dev,
> > -				"couldn't get PHY in node %pOFn: ENOSYS\n",
> > +				"couldn't get PHY in node %pOFn: EOPNOTSUPP\n",
> 
> I do not see the point in printing an error code name. Instead, let's make the
> error message more sensible. Something like:
> 
> 	dev_err(dev, "Node %pOFn: PHY not supported\n", node);
> 
> Or
> 
> 	dev_err(dev, "PHY not supported on node %pOFn\n", node);
> 

Thanks, I will take this.

Regards,
Inochi

> >  				node);
> >  			break;
> >  		}
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
