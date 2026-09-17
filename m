Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90749B44F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688666; cv=none; b=fR3vr1hF85qwI2WHoZGBfBLiqjL+TzOcBVn9t+ljca75ZA3AzXivIq3A0DSeRZ77R1+ynW+9wgy7yHWxMbp7n+dj5YetxParDKSKGkWtX9km1VF8wwXsJL3SQdnLS6WolWxslGgSe+8rPOTgHuMvWLkUmL0QlCQAK93il+Mt/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688666; c=relaxed/simple;
	bh=0qb5BN4Fj2nv+sgYAPZ46br5D4GO5PoKovsuRwRkY1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJgGJAk/6dvDkzibWwklmJAqFjv2vhrDL7TkvxEITV9sy/GVCJ6qAj4S4C+bINHoJh3OPQ36aU3PP8G+ZfVabXdHcZW+eydl4qAPto0H/8StYd2eiS0WksbI9Xqq1JGgFDXbDSIQn8w9x5C02iDPOcFD/MEbHJzc4dr1aRbHwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fIHOCuxa; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fIHOCuxa"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso220606a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789688663; x=1790293463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0O1lZsSl6FgDJ9eTYr2jlFm3jSIkWmZkODdW+Q8s2I=;
        b=fIHOCuxar3V6N3nRyYwyOBcMx25y+NyZcqs0AY84mFT+xwFfPqJKwOGb1ksccBidBR
         d19yafntAo/US2zxt0jccsO1B9hLnulcO6//5cM+YtRTWok9yTdBcYc6Q9WTeJyxW7ON
         eI3t6eOD4nof6MnVagWJkU0eMMhvHyvq0uXy61hruFYTmmIRDzo1MQ7GMnj4hS670t08
         AfuE+GvbslBfgsg5/3Ox1ym/OaKTZ9Ni8/RVv2pVbG+FCGRONjilASp/y5djgrZJdAXT
         b2nLbmdDomUtH3chp9Kv/8DkXeW1P01VAyEgZlFwQog+TIqwsnMzIWibWRhVlBMcFroX
         v3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688663; x=1790293463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0O1lZsSl6FgDJ9eTYr2jlFm3jSIkWmZkODdW+Q8s2I=;
        b=ShwWeVyzKXzFv6cjhk02Kr5gnmCt1r1758Sw2vDytgFizRCHz5bdIt8F4rcmsKZ7RH
         JxHqY39B2drcxZEIu6Jw7y3u/jo37zJifkncQOwh+xmmF2zC59P/zB1h5cJNynB0H0t8
         Dzygs90/Q1kWYVd+kGMJGsveY1ZGx4qt+so11kZitTy3qsJY81UIzARxkIAddXtbCK7V
         5J/WcNA8DVADnMGzfTZE2ufYD70oS7pcXib7VHtc2j1dzSeEyNCxnTmdhsgDjE3SnpRX
         XsqoAdNbBWw2Bqg3VlJ6xXPPI4/j9ORBnpJ+otw8QJTr7gbEDbDMx6cvHQ+4vZD3VF8Q
         +Jqw==
X-Forwarded-Encrypted: i=1; AKwUvBwexsaSWOj4CZKw8T7qhNJ237CQKQbgPc34STswCOFWWsEdVJTPDEdy8JDPRlJiJL/L1TAlOvjxnM/K6pA=@vger.kernel.org
X-Gm-Message-State: AFuF++kea/oz44aWxaCmVBHVPR1Kt6+1QmBfTjmaL2M/UmUeMvygMlqU
	zEVCs+k+JUTM+tDHgmBNmwCfbUQNgQ1V2fJpMYnBimTBh3nCL50RuyegElDCqVBVGQ==
X-Gm-Gg: AYBFou2AxvDXgONJzjxSm/GKdx+z/DETRUMhbasfdOlpks9liwA9rZX6eCqq4EfBFNV
	fXzW6MdRobBXTVdfjBL6L7bibmo/nTf2CABvA2zTQgO8kq1GLAN5tLI6e8M3e3LV1pmkCs7DU0F
	jI4Wzy33Jd+BPZ/IBntw5Nwp5A5PeQQVM3Aw38cCLOQoKfUCXWXR5Hwyyz1J5g1vKr68TxNUrnn
	DdDkGs64OOfjEGwePi1RMD/tUxxp17kIJwqgFqnwN1e50L9jGHTd3UufzIBSuj+nlUoh7CLfKPu
	szyMmd1/OIm4F4NrtBc5KiN9Am/RBbrBbB1y0KybdKK/rbZRu9EWQ0gx0nmXiGJjUiHuvrV/bjK
	RqMgGFtTVCTuC5nsC5LO3ySS3IWk1Ab+9Smy1h+PBZLgJyWLKuNWKLgDJYCU29RdeEbSY4AyTwS
	SBpQXKrg+pt/Ov4Yr4ktVvwKv2wCqT0l6yemeGbQLvLphGdTAAeBBTgzWIpK+Si2kDmk30Fz5ct
	KOgFeB2z+ETQ2iBK7byLQn2C3nW/VidVAGp7aHVID4jxb+UKr8=
X-Received: by 2002:a17:90b:2ecb:b0:39e:4c81:6c9a with SMTP id 98e67ed59e1d1-39e54fafb06mr1575707a91.32.1789688662542;
        Thu, 17 Sep 2026 16:44:22 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e535f0421sm443246a91.1.2026.09.17.16.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:44:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:44:17 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <aqx7USJxZrk9GIWm@google.com>
References: <20260728221007.2098560-7-dmatlack@google.com>
 <20260917000723.GA992337@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917000723.GA992337@bhelgaas>

On 2026-09-16 07:07 PM, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2026 at 10:10:00PM +0000, David Matlack wrote:
> > When a PCI device is preserved across a Live Update, all of its upstream
> > bridges up to the root port must also be preserved. This enables the PCI
> > core and any drivers bound to the bridges to manage bridges correctly
> > across a Live Update.
> > 
> > Notably, this will be used in subsequent commits to ensure that
> > preserved devices can continue performing memory transactions without a
> > disruption or change in routing.
> > 
> > To preserve bridges, the PCI core tracks the number of downstream
> > devices preserved under each bridge using a reference count in struct
> > pci_dev_ser. This allows a bridge to remain preserved until all its
> > downstream preserved devices are unpreserved or finish their
> > participation in the Live Update.
> > ...
> 
> > +static int pci_liveupdate_unpreserve_device(struct pci_flb_outgoing *outgoing,
> > +					    struct pci_dev *dev)
> >  {
> >  	struct pci_dev_ser *dev_ser = dev->liveupdate.outgoing;
> >  
> >  	if (!dev_ser) {
> >  		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
> > -		return;
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!dev_ser->refcount) {
> > +		pci_WARN(dev, 1, "Preserved device has a 0 refcount!\n");
> > +		return -EINVAL;
> >  	}
> >  
> > +	if (--dev_ser->refcount)
> > +		return 0;
> 
> I guess this is a nit: I was looking for a dev_ser->refcount++ in this
> patch to correspond with this decrement.  I *guess* the
> "dev_ser->refcount = 1" in pci_liveupdate_preserve_device() starts
> that, and the "dev->liveupdate.outgoing->refcount++" there is an
> increment of the same refcount?  The connections there don't seem
> quite obvious to me.
> 
> But I guess "dev_ser->refcount = 1" was added by a different patch, so
> probably *not* the same?

As mentioned in the other reply I can combine refcount=1 and refcount++
into a single refcount++ to make this simpler.

The refcount=1 is for when a device is first preserved. refcount++ is
for when a device is preserved a subsequent time. Bridges are the only
devices that can have a refcount > 1 so that's why this patch introduces
the refcount++.

> 
> >  	pci_info(dev, "Device will no longer be preserved across next Live Update\n");
> >  	outgoing->ser->nr_devices--;
> >  	memset(dev_ser, 0, sizeof(*dev_ser));
> >  	dev->liveupdate.outgoing = NULL;
> > +	return 0;
> > +}
> 
> > @@ -385,13 +418,23 @@ static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *outgoing,
> >  	}
> >  
> >  	if (dev->liveupdate.outgoing) {
> > -		pci_warn(dev, "Device is already preserved\n");
> > -		return -EBUSY;
> > -	}
> > +		if (!dev->liveupdate.outgoing->refcount) {
> > +			pci_WARN(dev, 1, "Preserved device with 0 refcount!\n");
> > +			return -EINVAL;
> > +		}
> >  
> > -	if (!pci_is_root_bus(dev->bus)) {
> > -		pci_warn(dev, "Cannot preserve devices behind bridges\n");
> > -		return -EINVAL;
> > +		/*
> > +		 * Endpoint devices should not be preserved more than once.
> > +		 * Bridges are preserved once for every downstream device that
> > +		 * is preserved.
> > +		 */
> > +		if (!dev->subordinate) {
> > +			pci_warn(dev, "Device is already preserved\n");
> > +			return -EBUSY;
> > +		}
> > +
> > +		dev->liveupdate.outgoing->refcount++;
> > +		return 0;
> >  	}
> >  
> >  	dev_ser = pci_flb_alloc_dev_ser(outgoing);
