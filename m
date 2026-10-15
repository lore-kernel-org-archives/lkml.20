Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109435893
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022813; cv=none; b=o0f+5Kapv2JKAF6o+veO8C01bVTQ8QLDeN3IrYtLtfEDgUe+/xiyfptEZISR12FsXjd/LjXgDhXhqDnDtKBk71xbsIqHvPqDS5dNPpAvq4HECMaidyMlNhKD+pXzInAodXX7q7qspxPcgcfP86IbfiD8d5uE9tM+XPPdNy0oDps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022813; c=relaxed/simple;
	bh=Y1j2IAmDNpy/11ji2yeubu8arnWuY9EaUML0l2Bnxww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxFQQ2uuvUoXxaFmqac6mEhaLrtkTLqEhXvA8k7wx7G+Q19O0I7QEFpZXcR/LxSNa1KclbbN9EoHgi46jt9qu1+yrCnWP8kyEU/EJWikNT2/kxdmoUXi0UaZvE4NwDhzVLhkEWd5/CuScHLoCMKuvjbpsot0x74WG+8ZmzkHt1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=luBmiaKG; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="luBmiaKG"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9178aabd30dso46804226d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792022811; x=1792627611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3XFik+OiPTKZRBTKKsNSHHZcnVJeKmiSTNRzSNQWFTw=;
        b=luBmiaKGhfat1XeT7DWB2qnyqFKL1auwhlq1cTgJlMZP2ddopIZhMBcg8S70yXK4ZF
         ljOABYdvkNJwJ5R0kveTmIKwavh0wh0LNTCXF96BE4xIcf5helzRNvUCpwDuUyJRrxSa
         gqpjzmQHmaUNJwQm0KP8SE+ku41eswSWBir5KN/uwK/vEvd2WnIJmFhQEX8lOD3H9PD5
         AMT1SpnqPj7qFDn58d7whX7HnS8giP388N9YQ5nz18ZbDSOfUuo+JmACuV3jbi+t52m1
         i+XsyP/sT1Dd41A8v7IQXfwA2aZuRUWZrJKgX4EIDVOLRX91ncV1Ijew/co2Yh96CPKj
         3WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022811; x=1792627611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XFik+OiPTKZRBTKKsNSHHZcnVJeKmiSTNRzSNQWFTw=;
        b=KR1V/K6tnpXZGBVtiMrUNE/xtLHz9PTDEoSIjHgYfQCUt4iX8BJYHrH5COaUNeDBOm
         d1IuT1wt5dV2D8YeVD2WS1UNzS6pSM0klMqS7/yrVOCh5oKWoldxzodWeMIHmz7RFP+9
         BgWz7FotNYiikwjCmst+hpT+K/o4mPvWOVn12b+ZdxHX8fajTVt7lI4uOd4MQBYhc4Lv
         kT9fNMb7uDI7T3SV/yVsql8q8mwvbdw30gNpGfz0DcnkTZtM5L81WaU1tNswmjNiLUcJ
         KmBq6uspeL/TAzuIWnbN95u8CzASqZH8YpQ7y3iTnqeqNU2lmIjcSTHuork+nPhSthhl
         MZuA==
X-Forwarded-Encrypted: i=1; AKwUvBxKooXt3Cl5TdG7dZBISjvyf/xD3zMUh6zEUyw9/UGa9EtJjS3jKr+u0wsvTSPTrei87kzF20qmwVLwgOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE7X2ZkxwN4keK5vvZAmSgjXsNcJUJ8lAbbfLw6oBx7gXc8fxo
	agZPhjRThCLrb57uBytXi9PWanWRUupmZCykgNIB0MaVNfn5magg2ZjpFzeE083yMZA=
X-Gm-Gg: AYBFou13l7Au77USFM0H6p4pG4KuBqFMG7q+JrwoVE4JHfJb+K3eRfowuLLBx7w3WB7
	bETpHFt8XXMz+24YXk6gOjorwtG0uDIzXuPcP55+5/XhRpvrYwe+Xy9gBChuvyqUQVt1BLSzFsq
	M0zBiz9zlgOokgmE65EakrV5MO4Mx9lIhYdToHUgrfnzRObr42mYVNP6Nu63o12DbGwd7eN27zY
	MtvcqeUIXiOmzMdYMQYE+ADL1a3yumy9xPNMc+JLeUXcbnHji/2o5VtesaHeqWbdHdrH7h0WTUl
	WNLYD6RmG4wQuhus9ZMLRNGASnMyy7Y3eszGBfE/M2WOwnd0cnSwK3BFCChZLD+afwUMxs0h4aB
	Sh7eGzcSJ12qf/XHCL8scP7OHeqepA9CrvtqDjqPXQr24+yOF9kKyjmvwUgDfxSj1+fsVAbpXx6
	J9G4NCX4wvYvAj1/ANIkg691rh7vXdq2g2oRw5O/6reNybNW1STdvErGHkiW8shZ8AEOdqYqW34
	siObqROJzyNGaArLu6zccazbm/wzyiZAxp19VnXUywNuR5qM4CyFrCv
X-Received: by 2002:a05:620a:2992:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93ebd229343mr2677174285a.23.1792022810691;
        Wed, 14 Oct 2026 17:06:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5051333sm620942285a.28.2026.10.14.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:06:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xH8zh-0000000EzB1-0n38;
	Wed, 14 Oct 2026 21:06:49 -0300
Date: Wed, 14 Oct 2026 21:06:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	"alex@shazbot.org" <alex@shazbot.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"jjohnson@kernel.org" <jjohnson@kernel.org>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
	"yishaih@nvidia.com" <yishaih@nvidia.com>
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261015000649.GP14213@ziepe.ca>
References: <20261013140345.GK14213@ziepe.ca>
 <20261013154225.214531-1-jtornosm@redhat.com>
 <20261014150047.GO14213@ziepe.ca>
 <MN2PR02MB68639A3F262110A6E9B96683D49D2@MN2PR02MB6863.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR02MB68639A3F262110A6E9B96683D49D2@MN2PR02MB6863.namprd02.prod.outlook.com>

On Wed, Oct 14, 2026 at 08:46:33PM +0000, Michael Kelley wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca> Sent: Wednesday, October 14, 2026 8:01 AM
> > 
> > On Tue, Oct 13, 2026 at 05:42:25PM +0200, Jose Ignacio Tornos Martinez wrote:
> > > Thank you for the direction on device MSI domains. The Hyper-V
> > > reference is difficult for me to follow for this case. Could
> > > you point me to some existing KVM/VFIO equivalent, or similar
> > > example for my use case? Any pointers to relevant code,
> > > documentation, or previous discussions on this topic would be
> > > very helpful to get started in the right direction.
> > >
> > > Also, where would this need to be implemented? Kernel only
> > > because it is already supported in QEMU in a general way, or
> > > kernel and QEMU for some specifics?
> > 
> > I spent some time with AI to research this and drafted up some slop
> > for you that outlines a bunch of ideas and explains how some of the
> > bits work today. Not saying this is something to follow but it should
> > be a good starting point to come up with a good idea.
> 
> This is a nice summary of what Hyper-V does. It looks right to me
> based on my experience with that driver (pci-hyperv.c) over the
> years.
> 
> I wrote the documentation in Documentation/virt/hyperv/vpci.rst.
> With your permission, I'd like to adapt some of your material below
> and add it to vpci.rst, primarily to provide some broader context
> on the "why" and the implications of the overall approach. I'm
> not sure how soon that will be, but it will go on my "to do" list.

Sure, no worries do with it as you like!

Jason
