Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2041493D26
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048327; cv=none; b=hFbLb+o1+Hv6tW6I+5SfCxlMU6b4ALt9y9nCyRbW3KBIb4w3e3OuhxCKMXfr6LNB5I03RJHQskU08QpRcvJgn4kXpNsqUubslUwIjcN+JzpS8O+i4WiXj75YSc7GvSzrT98yksSSUfdlFTfRg3btxjXUL/Dp0zxBEA0p3HzAI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048327; c=relaxed/simple;
	bh=XgIZtELb1ZIkrmHhfzgcSOPlpUFR8nECZHZzvS4SnIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYjqLCM1hzzT4PiMRJYE1MJqfUtDmEsf3vf2SlcIZO+EDaXOa6DOQNsyHE4fpdkxQ3RSvhJfn9X8hxdAXJkdazw6nRLNyz+y6wUc5ObZ5XL6zZjSW5rFJZZsIgiqz7cEsS0R2QrNn2+VJuZ5goN8UaTEzcbOsPrBZzGwN9CWmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bxCbnKx4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bxCbnKx4"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9309d4ea213so779657685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789048322; x=1789653122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIspwDR6Ddr/0LRMfUMSZKdiTeMmO/Ea9KmPXL0TMZs=;
        b=bxCbnKx4krHs8ONN9O/e6LrFPbk4NQkeLYbKM4sDfHNOAzMJJVjw/b2xyQbHCHb+R4
         0QRyYyoAcSbbTZaJHUGsvgUpBI6qzAql4H4NBZ82lqueU/vkDThzFMdFbq0uP5pwFJ/5
         zWcJBz9t8vR29iCjNQ05NP3W1zLHsz9MRMaa4krhb1iSt/9QEGm4+UEj2+KN7QYjEDLl
         f3H4R3QIh2DKow31hKaf8rKKYGsG/CrktsG7cKridL0A29isesd+GxlYNbuVHDxQtsrc
         pnNeiTTIYHvy3qx0AJfcjddL0wqIeMGhUpXTv/GiqzikK8/oq2M83JcXY042P6aj5udc
         IlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048322; x=1789653122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIspwDR6Ddr/0LRMfUMSZKdiTeMmO/Ea9KmPXL0TMZs=;
        b=WF6//gcYjvGX5wym0HX8xzNbJz7yN9LaVoi/nxxg3zrOrHUlCZ36NzJvBXtjuRgdl/
         +zP8YSPZAEnzFsVD7g78ayrgbESFyDJV0RfHP/uoNPhA8QksWuZwe97j4TPjmgSO+6el
         Bmb3L0ZzzsHomYYpoqlKRuPUZ+DMO/QS4+jeqB8PV12y5q4WQc9QqDN7Llcjcrz6iRo9
         bWrKOp4WCR9BWOLM7CMhAWL4GK2uU3hr7tvJfBCfbCs2Xl+eGZEFP3RDoCoAqq2x7sEM
         cwWcDrOmRRFqqinMh6xkswHvSdgRI4SSHvIs+CsKndAuN4dTMFfjUWPEz1ZHTiUcAeJ+
         e0xw==
X-Forwarded-Encrypted: i=1; AKwUvBwvFCe2g41U+ShUrUCx5zvK7HK+nM+N9zqBvEJPY6CXd2b1pUCVAAYn7i8u18WghZS4dbvTLkYXMHAv8vE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFH4OoMQm0RcVVQe6Fiwi6/yzU5xU77gp7uYddMeyhpTsQ8nvi
	T42DdlGFKeG3uk1KNMPcIJIBbTrO/xzgqwAYeTuDQsUwJqX7FdNcXwhRUogG4d0Hz3w=
X-Gm-Gg: AYBFou06i9huQnrswIav6pdYZBfhrjP95mzthZe/Z1zrraStxUA5xqugSp2C6YLCBjA
	l/XuMyHKpSi4M/XoK0+9E9LEJGBL4sAWFAFBhhR4aLSUnQJ8n1maCWcTUBmt17hf6oGeNak+0q/
	I4SfaCAn87+EytYRDxQbPcsrfiyNugDNKVPj3O5uddOcWP1CPbMNOXfOeUFP1KSycHNbjcDHEpI
	O+QHuBKSvdZgYV6As/m1W+DQ0CbZtf7QQ1hJp5QVZBwMBWvlb9AmizkKEQPitvMvKhQQ9xFca2A
	fdkFYAM7+IJA3130hWw+jAdX8iKRqh2gaYyEoHell2xDWN/iSWkKT9OwJKmQw6ri3Ss+XDrdHZ+
	paGrjfkmWAFRqkn17oTWsQCmbl4PLHMfhL2IeS46pRtuRoDnJXR5lZZc5CYwAUJticTulakil00
	IVk0OXYMIN6xtIcdZdyoyVmOLIl3l0vOZtrI2uAIhonx6aDP6iSH3htnIbohWGmPg15Z4/Ki08u
	BDfjRg0pZXByfetw1GXHHRfsUvxhefM4MIL6H73dM9poMYK5iiNkuvr
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr4519596285a.50.1789048317562;
        Thu, 10 Sep 2026 06:51:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e2b5f2c6sm62668785a.5.2026.09.10.06.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:51:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4fC0-00000002Vsb-1nwc;
	Thu, 10 Sep 2026 10:51:56 -0300
Date: Thu, 10 Sep 2026 10:51:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm <kvm@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH 1/4] vfio: Reject a second cdev open before mutating
 shared device state
Message-ID: <20260910135156.GD4083318@ziepe.ca>
References: <20260901215358.2421359-1-alex.williamson@nvidia.com>
 <20260901215358.2421359-2-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901215358.2421359-2-alex.williamson@nvidia.com>

On Tue, Sep 01, 2026 at 03:53:54PM -0600, Alex Williamson wrote:
> The cdev single-open check lives in vfio_df_open(), which runs at the
> end of the bind ioctl, after vfio_df_ioctl_bind_iommufd() has already
> updated state shared across all opens: vfio_df_check_token() can set
> the PF vf_token and vfio_df_get_kvm_safe() records the caller's KVM
> pointer in device->kvm and takes a reference.
> 
> A second cdev bind of an already-open device runs both, only to be
> rejected in vfio_df_open().  The error path clears device->kvm and
> drops the reference, tearing down the current opener's KVM association
> and potentially resulting in an unbalanced reference on close or
> premature release, while the vf_token remains clobbered.
> 
> Move the single-open check into vfio_df_ioctl_bind_iommufd() ahead of
> both mutations, so a bind that cannot complete leaves the current
> opener's state untouched.  df->group is NULL on this path, so a
> non-zero open_count is exactly what vfio_df_open() rejected.  The test
> in vfio_df_open() becomes redundant and is removed.
> 
> Return -EBUSY rather than -EINVAL here.  The arguments are not invalid,
> the device is in use, which could be a transient condition due to a
> delayed fput if the prior user is terminated.  This provides
> compatibility with the group path, where a group open returns -EBUSY,
> and users may choose bounded polling to detect such a transient
> condition.
> 
> Fixes: 839e692fa4eb ("vfio: Make vfio_df_open() single open for device cdev path")
> Fixes: 5fcc26969a16 ("vfio: Add VFIO_DEVICE_BIND_IOMMUFD")
> Fixes: 86624ba3b522 ("vfio/pci: Do vf_token checks for VFIO_DEVICE_BIND_IOMMUFD")
> Assisted-by: claude-opus-4-8
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
> ---
>  drivers/vfio/device_cdev.c | 12 ++++++++++++
>  drivers/vfio/vfio_main.c   |  7 -------
>  2 files changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
