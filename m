Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792912;
	b=qhTxposxdz+xMQ+GEjaI1zlwJZC8tOwG0Tb33YxiPzUAtFIc/yfIVZ2mp1RdEfCEBqWs
	 CtrIX50QSoAj/c7oznZ0OWEC+jlGJDcwHBS8nVc4cEwWkgQJKL9BVV5y6drrrDGT7KU4Y
	 u3vijBlnU14gTBDtvtG8KYx+gxtIwfUtAwMBafBM3ivTSerBv9IpplnOFc2xGol++vVxU
	 jVWrLItBgO3gHbJekWT659ypZ3zEYNJzBmzEM6+jUQxC6f3Q7cWUrX/zHHL62CVr90QYs
	 JfK0oToM6Oc1UFZtYkJJ5h53A5FfdSE8qRWdJ+liSXIbuTNb/XX+GCEFxkgOXnZ7o4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
	b=I5xNSMz8oYk1RO78iTunaV4k0cvVd/tIDWc7tdIoH5MZUxz5Z8x+6sZKZghFl14/mnKn
	 VgL5L3QjkO9oUqX0cL5hnmz+hk0vxlu6pXg9CHgAzS0UNdUJ1YCr6spPlQLnn0XYPzOtY
	 /M7x6biuKlVH1HpCtG0H1LXTOowvslUSl9QTQEHEPI6WykURQVYaeO5SMY8lZcFoCE1tC
	 hrsUJPcTky8K2KDX/vecZqJsUg47bSiRAuYbcaoTH1L3GMF7P5qpVQoU8owdpxeCxZ+fu
	 oncDpdSWnqqC8G9173pnT6Ku4LlGxaWkeQxsnorGH4I8SB2JZYw1B9reuuAPBEbNNvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6EB606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6EB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e4c00d71aso123549385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792792911; x=1793397711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=H2Nk80SC0IE0suPURnYr9e6hZbC4LBCNbP2UbticIu/vM5Zx8lZxl1WF9oIVeOGweJ
         W19x63RIXk3jCkb/8AZ9w0/6q6ZaY29bsZqX8VJh3ACjKIAi6gixXOH39qqPhJV0UGZD
         h9hrX7AQMBlOV6X6RgQiCpuKPLs0LqoIe0SH9hdfWiIr6eNHUZFFbT0I/kCisS92xxMY
         Ucn1ZlEpvxoCWlvTmp2e0dWk4YFXYfROdABgbIgP0F4SF8jcDI2aMT5TzMY19oaj7RhQ
         ktu/3+o+78VzxnRBhNe+IMPeqMjRjTTMOSsOLuA26L6BAOJT0HaC4+T4MRB1PHDXmGMo
         Ignw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792911; x=1793397711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=J0eU/UR9oiGjzlyzspsrHU0kHPFPTCzCopzxQJfOsZC+tN6zKzO1KMT/Urt5sMSCo/
         hoSH6gI4BauFQt2WF6PIhrkj5HNcy4R5v/UJ6ehPkeAfYC8Spmd1IxvC4EUu0+9kc/Os
         8g081Ecj1jF8wgWLM9yBT9dQBKMblkuH2+HPqIrP4rsNFB1Ps+99+k+xPSqNc7H8OqZy
         zmX29N9fa5h6c82CdLasZb2eN10DWdWBFIQqQmui3lQS38P4AMn1Q83DD7spmQPv6t8N
         8iTGO6XcVdnGsCizvpZE0aoQ148KGIqz+VlbQBF0eA72MSndicv3xW16oZXgHMJoJmAB
         pklw==
X-Forwarded-Encrypted: i=1; AKwUvBx0bwhuXwIpimHi7eKG1drQGqkzc+Y1M2HRUU4ZQmpM7B3MO7fxp+W7/QEY/JrMsWB5bHIwTTlXEmKZ6LA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlpBTXVk845fDEim1/fXgKMVvGupGNNkPC3jGkmuOISU2U/2Me
	dAH4SqIxV7BOzSGyiWBRt+8rTJD3tmNN2xttRaowJEXxKKpieEpCO81PFbhY5EjRbkY=
X-Gm-Gg: AYBFou3Q5JS7+mr0sOWmbboOHLfRNW5KXQ8eJpzhhePHGyftd9Wu8CaQSxOcjKZmz9E
	9N1wYLfohg5k0+1TCMTA26RPB9dX4NZYU3oZEtPex+F2OdYQNndpfzzap0rqs/l+umyn+m0JQJf
	PHWuN84f1GifIZtr5sZC0h30gUfXxzzZIdqfS0USYup36SYoVr9GuvDR8YVWEjGFcyavfGFxyf5
	by/4r4ZEzHU7RvESh6TB01lnxYJiC0ZB7cdCwVlD2mU7CRWzSacCh+keJB0IhHgDLLkMvo6Ev8M
	si1bpq5tjcLWjCp/yPxTX6W6VaRLow+dwKYq4jTuIFSPnsSFVx/dF16jBvdISUZjCfMgq03F5aC
	/l/Vi101o04JCVD7qfH1Om0jlmpTytCugN715A3LwL9IFGBXdYYvGDFEQheVWT0q0db/AVgbSfO
	70KkkpcMB//ki8v8E05M1oF5D6gM2t0t8HKPNZtqSZwHE749olR27KHXhlOqGWVq/btanyJ7cRg
	qSQCDmD3I36M2wHVAEhEm+fvprcH4hSnd+e5OI/NtMK2tc6V34o4LZXmJUMyag/6JgB/SqlaKvz
	WHGyuGktKD38OC+s/Jmmdd9/WMPbNzn4+gy45Q==
X-Received: by 2002:a05:620a:4441:b0:93e:c12c:f137 with SMTP id af79cd13be357-940ef9c87e0mr54142985a.82.1792792910841;
        Fri, 23 Oct 2026 15:01:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078a762sm18520585a.30.2026.10.23.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:01:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKNKe-0000000H7Vk-3jIV;
	Fri, 23 Oct 2026 19:01:48 -0300
Date: Fri, 23 Oct 2026 19:01:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023220148.GN3977851@ziepe.ca>
References: <20261023190036.GL3977851@ziepe.ca>
 <20261023201531.GA2805244@bhelgaas>
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
In-Reply-To: <20261023201531.GA2805244@bhelgaas>

On Fri, Oct 23, 2026 at 03:15:31PM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 23, 2026 at 04:00:36PM -0300, Jason Gunthorpe wrote:
> > On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:
> > 
> > > > Yes, the ACS combination is selected to avoid ordering issues
> > > 
> > > Does a user have any way to know whether the configuration is safe?
> > 
> > No, unfortunately in PCIe so much is really difficult when it comes to
> > deployment :(
> > 
> > > I'm wondering whether users might use "pci=config_acs=" to configure
> > > ACS so things appear to work as they prefer but may not provide the
> > > ordering guarantees drivers depend on.
> > 
> > I imagine that could happen, but on most practical systems the root
> > complex will blow up if you do asymmetric routing so there is an early
> > indication.
> > 
> > I know this because I've help debug such configurations at
> > customers. Some servers helpfully MCE if you do this. Lovely.
> 
> I'm still confused about this because earlier in this thread, I
> thought Leon said you do asymmetric routing:
> 
>   Bjorn> And I guess asymmetric fabrics must mean fabrics where
>   Bjorn> Request Redirect and Completion Redirect are not set the same
>   Bjorn> way?
> 
>   Leon> Yes, in some of our systems, deviceA to deviceB is going
>   Leon> through different route than deviceB to deviceA.

Yeah, that's what I clarifed, it isn't quite accurate. The asymetric
routing is between Strict Order and Relaxed Order TLPs, not
request/response.

Jason
