Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F99489897
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397969; cv=none; b=OhLCHuf2eiY3uKtGd1bZ5OjXyf0veuxUytfQh3qVdboD0ZSadME99QvQadP4HF0jWIVqtWJJbTjcugnIqC4Qd7j5oJAEcgfN9umvIX3QP/5XxpMA9WO5h/LxrMmq9t6MEdxtWh5qhSs4hX1fYW+p6OFKi3NT8/e9ST5HvWNDNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397969; c=relaxed/simple;
	bh=4YdSqPMQ3AqrylMN6xPYkljWBceL/O9a6xta9YhYWKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzvCsUlKOQnORaVsr0NpPsCQuLSOjB8VSqp+0ZkguwWhatjUuNoeb3UB1BjAwNpoiM1ff+Ou2GMtu63ri9OOMC7jd9swSNkr/lgodE8brpjoryqYQFs0KJxw2Q9zRFgP/gFf3uNKPTgRNMH6wju2fopZy7oGXOvofba627slHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vwD7w+R7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vwD7w+R7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db33db4de9so68335ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397968; x=1793002768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=vwD7w+R7u7S2GwbGjPU0K8nlbqJjuNhOHWabyhmS9KMnkcYDXb60P1SUL+CuloZjun
         tf1jxsbJnYKd3GVfDc+JPUclon+isQJGwDMFfJtrZDnQpHHPGOcw/w4yhpvUp6n5xRKe
         evlUTxU0fxfC11yGQOL7YY/mRwNxLht4mlXnE2/HYbZQb+90qUn40JVdzRgw9LciOEw2
         h6eydTWLdwCFcgzJXQSoRbEYDwzJrb4p6i9mmWEF6uu2D2b/F1WrtU7teZ3h/5Wv0O/q
         +vJJJ8Y6Z0s1ArnZf/qVM/OjXi83Sh/pAqVGypYwfDj1rpEwo/yDFvmKJPv/Nn6vB115
         MPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397968; x=1793002768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=vTG+jvpz+a144cEbRbDn97dP9odwZUT4C2Fsi8HZPQfh8rUDvP4mYE5RCzyTchg4Cb
         PbhZ/+PE4U0RmXz2jNUTPJ29ChMX8UzG7o2KnkZN0nDp3O3iFFg18Yx1YQ91vGYQYRlN
         BLmzDrbcXB+sWPUkmEVyYzWvXgzcsszE9PKrgfJNX6qPn8LmulDIk4qJABfEAPBJ9MTB
         xn/tIEAFzpnRMNM+JGUj3lYosD1Wn8A37fMgHOzIln8kxQ4Td/YjT8I2+lPUtbExiy8q
         lngeo4yRCRmHyETuIQWTe7JH+KxuGBMmmBvajzMlAaaqh2b7g+8epfz+CLCF38hY6q0e
         uh1A==
X-Forwarded-Encrypted: i=1; AKwUvBxWv/bbskNu2Sok/UzqAMASr8TG4QUgDb+OWEPxkH6cQB+l2qO5ld+yr4Iu9ycqn8Gudei+HOYRlGI+jC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYX9l4uK00EenNfnbeDLyPBeDe+xoElEXRYQkV+EneJ8tOCwJ
	mi9V2EJSmZ7bph8pUzSq+P99hy8jm3mklZz86sUUw6+pYzlnhGX+fEclI0dvsrTKWA==
X-Gm-Gg: AYBFou1A1cNRt8nJlsHymvkjiD5kD4KOogrK7mm/P1T4z6h0y4JdkCGzMetcla5lHlv
	lhdbJ2MMDMMvU8ljM44pN9l2v96E/920186FTPI5uABnQcZk7i18wvvz0LurzLT+byXMpSun1xs
	A5aqlJ3WN0DOHjCkYs4Ziient6xtOh3kO/W2GXuQp6E3ItAUCMTqMS7DO70l82JweckCuqaC5Qe
	KkkcIZi4GxOj2FLENfzjVz+ZiosVepU2S8JddYMTwS1dxTfiS9s9z7OMj3J8I7Nj87E8AQ7BX3n
	3saUDQvjYpMIEtWT6jETAbl/UthcTIPVtDNlsZL5yvdWy1eA0eopUK8HeWOrC/qPMhemPF+e0CK
	UCS1+DAzCROXLcN8SYI3Lg/cabhRmnpJ5BZ0W/vsPyLUloX64kUM6UedUeGQMArNL+Vb1h2zVNc
	gK8MRkuhruQPWwAz5SiOy91mLX8mKSgPBHwoLfs37V0AcjgSCmXPZbbGPZYqEMdw8dmo/yoOX5+
	rixHFAt9eeJgor9zbJQzGBJ0A/kCmX8odmB
X-Received: by 2002:a17:902:d2d0:b0:2e6:12af:5b04 with SMTP id d9443c01a7336-2e9ae497cc4mr6838265ad.0.1792397966463;
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm865449a91.4.2026.10.19.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:19:18 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/16] genirq/msi: Provide
 msi_device_domain_restore_msi_msgs()
Message-ID: <atXShi9ReURhBmdB@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-9-praan@google.com>
 <8733u8eygy.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733u8eygy.ffs@fw13>

On Wed, Oct 14, 2026 at 11:58:21PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
> > +{
> > +	if (!dev->msi.data)
> > +		return;
> > +
> > +	guard(msi_descs_lock)(dev);
> > +	struct irq_domain *domain = msi_get_device_domain(dev, domid);
> > +
> > +	if (!domain || !irq_domain_is_msi_device(domain))
> > +		return;
> > +
> > +	struct xarray *xa = &dev->msi.data->__domains[domid].store;
> > +	struct msi_domain_info *info = domain->host_data;
> > +	struct msi_desc *msi_desc;
> > +	unsigned long idx;
> > +
> > +	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
> > +		/* Only handle MSI entries which have an interrupt associated */
> > +		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
> > +			continue;
> > +
> > +		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
> > +			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
> > +			struct msi_msg msg = msi_desc->msg;
> > +
> > +			if (data->chip)
> > +				irq_chip_write_msi_msg(data, &msg);
> > +		}
> > +	}
> 
> In this case sashiko is wrong:
> 
> > [Severity: Critical]
> > Will this result in a NULL pointer dereference in hierarchical IRQ domains?
> > 
> > Since irq_desc_get_irq_data() retrieves the top-level irq_data, data->chip
> > points to the top-level irq_chip. In hierarchical IRQ domains, the top-level
> > irq_chip typically does not implement the irq_write_msi_msg callback.
> > 
> > When this top-level irq_data is passed to irq_chip_write_msi_msg(), it will
> > dereference a NULL function pointer:
> 
> All MSI top level (device) domains implement the irq_write_msi_msg()
> callback. That's the whole point of the top level MSI domain as that's
> the one which has access to the device and the associated message store.
> 

Ack, I can try folding this into a comment to avoid sashiko reporting
this multiple time in the v12.

Thanks,
Praan
