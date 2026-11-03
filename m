Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734376;
	b=kyBbg79GQl1c2NW5Ek4+he8MtP/o1dFkBcZhOD91Quj26o/BpPbK1q2lg1ARqhyP6EhS
	 iGmjfoxBupJhCRNqlN2MXb2MyNCFdfixJbzplgg7YiWJ/F9mFyNTxb0KSYybb0DGdKfbs
	 lvwEV460OfbiyJ6zrY6RmCk7Iw2XUqLt9Suq5sDweoVXM33S+gnSGs7WFg2gFvjasRhvl
	 Fk/U3ssMB0KCQ/qtyLPnmiO/H+HXo4EMj8Y6k3Ie+1s/jkJHEs0eTmLPKKuEIbfAwmPJj
	 ZnUZRbkPrdfl34VHfUKnCtKRXlHOLevOzhdSNxYH7U6oc+g2Rps58Fzbi9Zet+uakXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fS2oe2B5dSHImTbALo6NjH0E4DZsMbovYECl1gVRP0I=;
	b=zi2gtH0urDk+vTkg9gd0sqQaFpQVNp0z9WJEcS5gwsacQQWkY+pspvxtUX/PiRm1LSAp
	 ZaTxzC/V1572gH7odlvoJtY3P2SFG60NiiTXdOv4oPUeiy70WMdrT8Bw/u1qpAfaav9Bt
	 aKyexvOspRUvkYQimESIvQFo9qtCjB84WovNkVhw4fZ3ctD1S/4ftOO4tFjcuMiiNL8n1
	 HV7fj1R2UjO9oW940+sUvkVIc4ywbEc5EO6wFx64+xnYvhvjm+0DwMYOLSEU7VVgpT7j5
	 ivBFH5T5LtYWf7Xcje0YKbZgXoXOW8FRvzc8LNlZ8rFhepbZsy3YJ6+bQvuQ+hiet1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jkTDUkHK;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B90A606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B90A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=jkTDUkHK
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c67992ce5so65006d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793734374; x=1794339174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fS2oe2B5dSHImTbALo6NjH0E4DZsMbovYECl1gVRP0I=;
        b=jkTDUkHKnz36P66UyKQ9eCVsk6huriYJfOMuJhbA/mO3EUctUMkiTn2cQblHemNz6/
         UrbI8ZchmYo7NIPdMGVVyUOgdl4n4AevfQpzSC64NjYq8IXBkDZbMxPz32FCFcYn1auI
         C6vXumLHxrqRhbjnttjnCBXQwQvIDSj483c8v51zr361TlZdrDDVUqqKhYJo79rEsBfC
         Goa+1yfdinWOMl4MLZRAZiLTNmfb2F1n7IOYvzMwWKYcJpkT50N3Uk/KWwwSyFEigtzN
         NZMSGDz1rTB9a4xuPcbGsp4KsVskZeyMbhbPqBjQLUXyLJD3hB/Rdv6n3UiG7UdrfFp/
         10mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734374; x=1794339174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fS2oe2B5dSHImTbALo6NjH0E4DZsMbovYECl1gVRP0I=;
        b=afQ3cFEV1sjUhSPIrbCgJXfBNgPruWQ8maDPBQN9//7HGAut3Tl/J3yzb0pAP136/O
         rd6ahgM+RJlHxqxO//8F5NP+2wWOcD4gdIdFy4I/z6kqh4SeCIkY6iRmBjZjdM4zgxg0
         C/zov4yi3vJNGJNQvPAai+7jECQ3LfUMvvXSqE+abssxxaJTfwMTEyt8oihqtcR1JQyl
         ffxAamNXJrdg+saxG2070Dwfa+1cHkZbkjCM8nMAvK7xVzHJrNBM/AQVeOuu+9mu2yn8
         +DxZVcP0ClKpNtJZA9bYVQ1B7rmC0bGwx4eCq4e8UGRyEVhAyFTlP8rc0ED4QgApOo5D
         CzSg==
X-Forwarded-Encrypted: i=1; AKwUvBxLZHLNhXUkufPVvrQTTJvlp5D6wDjEp8XZw4i3UuBKgLvUe4OwerNYvck05k57aj6CsZxdp2kY8Uj8gYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/mUHbfRJq6DEK2ksKQxSJ39wFiVeGVXS0Zqri8qg6Kg5e6vD
	AtD+DZUvycIBUNz6tpf4sOme3yUZZxpVwa602T6gAhuAwOtPEjZ6aN/CxVvZQgadIqA=
X-Gm-Gg: AYBFou02W1Dehsg0c2kkYNsjFcOgMV16Ut/Be9QCwY0wx9mubcWd9M/8hnHTrv7lI3c
	PK2x9ApgGoVFtTHwMsvwvjNYJ930yEXXVzGaUwtQ6ThsAxUvqGugfBB6tnhIibEC0702qvQ8851
	q5vTtYb8u2JnBvlg8Rs/FzYNLFXqSKwnQOoyPmpieq9AVwb5LApjSNueZE3Gn/So7xJOS9TCMO2
	BYr/7z74GCIBg5oRw0aaj7F+hAkh09k/uJDk5zzz9wv5vIsd/NrqI8e691CPF1Q1QCnTuyx31be
	nWbh2G9pfsB3Yxq9BeMPs1fSqp1N3tT6X0GM2Z1qQoCL9MIL1YElRvjhj2Koy8xELXHgrKC7v2E
	0fD8tcrHMFE1vVxySOW/EoEMvg3NFmnjpFReD22wrSY18RtltNawJdmN549OupnZLwVOsRkXXxx
	BPpnFLToKdYPgAhra74l49K9mOu6LkDzzqYT/pq5KKvfmg1vR6Rh8otvrQVPZ8mC7LB5brbQeI+
	aLUSKBPqVWOKXjJGLL5zXUW7eIJetUgqnmxSpAcQ0ffZ3iF9Ehdg8NHcFPc5vM7xN6hpXg78pr3
	KVXqLG7okDpcEwdli/d94SVUg4SMwaswG8D8jC9iBgZ6O1UHlaRWtlQc0skqxZ/CUEofOd87SHs
	SKCzRxxiMTFbI9HLeAl9K71sHglkC3l0=
X-Received: by 2002:a05:6214:5906:b0:91c:79f4:1eac with SMTP id 6a1803df08f44-91ca4b74df6mr227056866d6.34.1793734374301;
        Tue, 03 Nov 2026 11:32:54 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7c575600sm1135846d6.7.2026.11.03.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:32:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOKFZ-0000000DmXF-09NL;
	Tue, 03 Nov 2026 15:32:53 -0400
Date: Tue, 3 Nov 2026 15:32:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Tal Zussman <tz2294@columbia.edu>, Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jean-Philippe Brucker <jpb@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu: free dev->iommu when iommu_fwspec_init()
 cannot allocate the fwspec
Message-ID: <20261103193253.GN3889730@ziepe.ca>
References: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
 <20261031-iommufd-folio-dirty-v1-1-2cef66d2d6d1@columbia.edu>
 <7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com>
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
In-Reply-To: <7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com>

On Mon, Nov 02, 2026 at 04:51:05PM +0000, Robin Murphy wrote:
> On 31/10/2026 8:33 pm, Tal Zussman wrote:
> > iommu_fwspec_init() allocates dev->iommu with dev_iommu_get() and then
> > the fwspec. If the fwspec allocation fails it returns -ENOMEM but leaves
> > dev->iommu allocated, and it leaks.
> > 
> > kmemleak reports it when iommufd_fail_nth injects the allocation
> > failure:
> > 
> >    unreferenced object 0xffff88811c138b00 (size 192):
> >      comm "iommufd_fail_nt", pid 783
> >      backtrace:
> >        __kmalloc_cache_noprof
> >        dev_iommu_get
> >        iommu_fwspec_init
> >        iommu_mock_device_add
> >        iommufd_test
> >        iommufd_fops_ioctl
> > 
> > Free dev->iommu on failure if this call allocated it. iommu_init_device()
> > allocates it before calling into the driver and frees it on its own
> > error path, so leave it alone in that case.
> > 
> > Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")
> 
> No, the bug is clearly the early return in 2a918911ed3d ("iommufd: Register
> iommufd mock devices with fwspec"), so fix it there please.
> iommu_fwspec_init() has always been designed to be called in conjunction
> with iommu_probe_device() which handles cleanup appropriately.

Asking AI to audit this found the other case I remember...

Yes: ACPI DMA configuration during driver binding can leave dev->iommu
allocated after failure:

 really_probe()
  -> dev->bus->dma_configure()
    -> acpi_dma_configure_id()
      -> acpi_iommu_configure_id()
        -> IORT / RIMT / VIOT
          -> acpi_iommu_fwspec_init()
            -> iommu_fwspec_init()

 If dev_iommu_get() allocates successfully and the subsequent fwspec
 allocation fails, acpi_iommu_configure_id() (line 1614) does no
 cleanup. acpi_dma_configure_id() (line 1670) ignores errors other than
 -EPROBE_DEFER. This invocation has no enclosing iommu_init_device() to
 unwind it.

The OF path has its own manual free fix already, it doesn't rely on
iommu_probe_device() to clean it. The other driver users are the only
things actually protected by ops->probe_device().

> > @@ -3074,6 +3074,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
> >   {
> >   	const struct iommu_device *iommu = iommu_from_fwnode(iommu_fwnode);
> >   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > +	bool new_iommu = !dev->iommu;
> >   	if (!iommu)
> >   		return driver_deferred_probe_check_state(dev);
> > @@ -3088,8 +3089,11 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
> >   	/* Preallocate for the overwhelmingly common case of 1 ID */
> >   	fwspec = kzalloc_flex(*fwspec, ids, 1);
> > -	if (!fwspec)
> > +	if (!fwspec) {
> > +		if (new_iommu)
> > +			dev_iommu_free(dev);
> >   		return -ENOMEM;
> > +	}

Just move this allocation before the dev_iommu_get() and free it if
the get fails. Then the function has a more sensible calling
convention that error means it doesn't need any unwinding. The
new_iommu is a little too weird.

Jason
