Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820701;
	b=q0dC/9em/+6n+VQdUHahJsssYOgZut0lhky2YvU8Qn6UB4TLQPmFfovT7ndZT+P0rJaP
	 Cudde4fUYetKV4JX2Hxdg9gWAtGw5KDguLVbw3IuM1SxeD102EO2LWv/VvE/wdcVLTSSh
	 34gIWPHlKx3HmmVOp5Ha9uYeuMz4ehfH+qQZ56UrpYNZsUseGSNUV5GXFQO9bo1iXAF/W
	 r/tBx8Dqyx4Ag+Xvd8Yi4+kd7/3qhHOwTGFfij9w1z1zchoKHikORfZCW+nlAMQ0GFzG9
	 agf3i7WMgKsR4TolLhRTwUPEd5Sbq0EnrN3m09FfcWVaKX/C//iZKaQuhGDfiVhw0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
	b=I1zB+wznV/rokfokqN3fEGB0S9oE+oKbcLZbFHLgzYHQ/uaMd3Y/5SEKI/detV4YCrlO
	 Tcqg3QM51OeC748sHwsbwiBgnojfkMQkf9nkusvXVNYwZB6NkYOzjPtNbWoWIVR/7cziK
	 wo1Oy16jdAJ9F3iAUC8vnjNDITf9MdQd226PVBknFdqcASrVUob1zrfh6c9L/gvyj5J9D
	 1WzFfK8l+eCtNy1AkMh8ISkjv65qkjc219Kubfss3DzF+KwyhEywdb372OeWJgICxytNP
	 mA9GpERVwvtx3UOLK0g2aoYVQXKBeZk6IifI76aNyTTcQ7JVloCKIR4I5ZzpIMxINvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EZcf2wTk;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324E6078170
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6324E6078170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EZcf2wTk
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-930c0f9c1b1so110929285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793820700; x=1794425500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=EZcf2wTkD+DUBFkK4Kf7IDSujj65CxJ1zv9d2f8p3SG06gtvsT0t+m2FBEKwTaLbdx
         FjlAU/gzIVFzN48oCK0JegUU3l6CcBvJYreTY8FfKEqN+7xSbQMxUyxTzpJuRNInWtNX
         bU34dNFsk1Hz4MbrSLbWANgqJFVMh3fjtT+PhutTYP31XcpWwodufBHzJysUUvDTjzjm
         z2wlWgpMF/QNFWFWE7mx8gDC6FV//vyjLuAhsthVQBtJiTVxhVJTyMJrETbYVwJRAVJH
         vpeGwkg4fYdDVWnxGdeXV6ybzqiM6icctzpK30WFh0sYTH5osJ07n+0FWdDxwzHibYfd
         YaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820700; x=1794425500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6VmJzWY8/ktSu1tEfSH85YFZcsMq7VS8KWsZUWMCkc=;
        b=BxQ4d/uSKNjm3KZV21v3T7giJD9lfxbTQAJLC8xAVjB3uBUnOWZWWt0boxTvvXxQgx
         jvIoLQ3IAyHTViw1AnQNphcKGl/QvQgFAOPwAmeAldgvC6ZwTIwgtqxQcFyTeOPYVci1
         RTxTYcSgQs0UNPudZ0w1rYWnKnJUJmrB0AKZ0rFxFs3sNG4aON8TSWwwsV1f5IDIFoqH
         0K2lUYcGNvZxRlsTLcTx0htRgqpSlYPvuxSvgR+eF+ZGLw9c5hhgorNixD86/T8KpAmX
         DqhoTXhxBAi1w00QoZ+KmTz8kPEr2d3aNSB5c1Z9p0oIHqH4yzTchiizTh2KGiI1EQbJ
         k10w==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6UhuDgWHblDYb0HN/4R1xEsOklW6PkAv0/tb+rVaAU69eVmqx21WjvbywN4HJYfkdNXPHb/YfaXHfcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jcC3umZ/Uu+CcmGrPwC9+GYQ0fqansPkzlqTu7VS5VvUMC6aU
	cZVOouVTQEhYIseb9RGsbJA1P/UqP/J4ST8tfHzRsZtV1fGjZ76rXlBzOutJ/XdlfKg=
X-Gm-Gg: AYBFou3446k0+nwkZXsrz0fFPcf/EMmsgBAYqqqiA32frXGSCxOUVweoSoM8UZEIuP+
	X+geU93ZbbNLRsSBbfQ3ASAgmV3KiUtf5Y9Be5JT1cYUOhALem5+k/ElSHZtQ323hRKs16Jvd6q
	fVy7yVLJv7D2JSKcf1sHKrUh1cXB45DXe5K2mn4KM0Bm65WJvuzfyy4IwTVQrOSxDmYZS9avPwA
	3UfGZdeS+AF2K/7fF0RkRVzt4jOjvryct7YpcaI2dRrWzdlatNKoOCIUc2gtK2j8ZpnxIsyufav
	Xn7Xz5JlGsdzliikaOlHVri2T0dkjQ/vo0m3V6hKt/KLxBDVaBA0wBA98hURo1L+onNgh8eMVRZ
	EKLNy2JEfp1pATjFiMbnJoKxwlfosKU2hA3b74DDi6hFNC5GeYzLFqybRWEZ9BUZ3jeWEXb7sAs
	UzjJ8uM2NEGVWcW/LlNDgRCQLTnq5AnZqk6EHz4TLvqVavHkU4XxadTV1Wc4A7yJz6grR0ybHFo
	7lvk6ER16ddAOPQxfRKssbUulrg15NDDmgHTH4lh4hJtcIxr8YOqEJpnHNb513QGwGH7g0W3AWg
	h6YlewretySfeZAde4xbQ2wDKsqhKEpTistcBKwvgKGr0nkysipYlfZZf/kq9UXDL8b33vBflSW
	bYkJfPJeevA==
X-Received: by 2002:a05:620a:1a24:b0:93c:6534:d04d with SMTP id af79cd13be357-9442167725emr2767779185a.35.1793820700269;
        Wed, 04 Nov 2026 11:31:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4844991sm278199585a.28.2026.11.04.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:31:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOghv-0000000HG9b-0zIw;
	Wed, 04 Nov 2026 15:31:39 -0400
Date: Wed, 4 Nov 2026 15:31:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261104193139.GB3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
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
In-Reply-To: <auuBjRjQwXl7UvvO@nvidia.com>

On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> On Wed, Nov 04, 2026 at 09:46:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > VIOMMU_ALLOC currently requires a nesting parent HWPT_PAGING even when
> > the selected vIOMMU implementation has no use for one. This would force
> > implementations such as the following Arm Realm vIOMMU to create an
> > unused parent.
> 
> IIRC, MSI on ARM still goes through the NS pathway. So, it wouldn't
> be "unused" if the device attaches to it (or its nested hwpts)?

It is unused by the RMM VIOMMU. I think that is what is Aneesh is
explaining.

> By dropping the nesting parent from VIOMMU, it just simplifies the
> attachment to an S1 paging hwpt, right?

Yes.

The VMM must always maintain a S1 paging attachment that is the
identity map of the VM on all devices, same action as when there is no
viommu.

Jason
