Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2E4BFE6D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798612; cv=none; b=idxX8Pu3vCmFlwJRa5rBBS74eJfUAHir5E0LC7IEYZDqpoqmRyiMwyTnOx9TgDb3GZIpds0s4k8my9kLZp0RNyoVz9MVba4nV534Q0dc8GrR4AgdDH03rDWC73emYosHh+4tw5GkdlIPKAZtmEfVdi/OjKD8KowuXE/tIrKwK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798612; c=relaxed/simple;
	bh=tb7tRqjRKsskIV4ptJEZWXYPWkaWUIXs01cFsV/GkMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+n2Wnww5IuPd+0zk7TBSmbWyHdEyPF0IwwF12Mp0Y/oP6wBjbZRKKcz/oHZf1thNr1GxwP8kSoPGLvI7mp/3NVjj3afAcjMxT59K2tecvpTxipiL5ZoSBFdunY2hUckNjxRdJ2uaJzI5Ql6KIZvyNRf+o5Wm9GkS9qmhSLlAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ClU0L5P2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ClU0L5P2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e2e4ef20beso18495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798610; x=1791403410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=ClU0L5P2YXhWqY7+ryTjDFdyyKkUWTwHZ3Dc7i7y4Qkc9I/1b/Qy43pDAsPaGReDKU
         xg+5kfDYP1WMGHzGBTSTIYS21Xt4Irj+dMxVFbsm0U9tiUcqHSxrphpge8q85iQnULAu
         VT4TVGW1z7ihPY//HX65nLVdsvJmz7eEZ7Ml4xHM3twxUGyf75o6znuzA7ZLYbbXHlLO
         /IzQ0rkJzMEbRuiRDSemwKYdgtUWXnxz48SYvPhHxWuNIqqFqQGUfsJ6vvTzeoJS2WfT
         11ngj7wIZ+Jmu4FY6L0VFM0SECdYHzhzrkJhpXfqM40R5lgu7JDXviSKQMV78i4gWOcz
         yepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798610; x=1791403410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV7fs5Nei/k8o70WCYEk0VoBwcvkJqHkvDHNbl1vC2Y=;
        b=kZv9rcPeOtp9AiVSSnM+DzekMe2AS9R9xHSAEEtWZljT+xrpjk3TfU9LMKvGOUQNV+
         ckQOiH8B1ZMhkgsrIPkOCtokGFkzL5VEKb8/sc4dERCHYcPgFWJNY32aznNz+mBEt4ht
         ChjikHRRNelUmsiRZ1jYWF42QFeDPRI0Fti5KUKWrOld4kzUE5aL5Ktvez/rD8sEInee
         PFWKkhbH91/bIbfKj7wS7Um6tYAwHEzLDjkLtZFx1vSRV9MO2O8RffUTNMmPgbUOXaoR
         IAprzUOQTXmHMy/AJ0A3wpqAeGqrklztzspd02r8shB3aAfvWetfeUfxRrOiKJxEWv8H
         34BQ==
X-Forwarded-Encrypted: i=1; AKwUvByFWg/A+aY1vwmMouKNd1nJWyhghMJsXCW7k7YnGvQathXVmxXkvrAHe9cO7OinbTjFjlwwX3vWOKatseY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3fhrH3gpbJi2EcEc2p5aN5luyoh3yzYGiDuwez7/tQTa87Qev
	YbsfS3Uel1CscXjw2Q7x6jHbV6rH94Xr58Zoum87RFeYaVtspUOQ0rMrrWWu39ldog0mPyoDkzY
	qULLFJoVs
X-Gm-Gg: AYBFou2KuvAvAaXkQDS0Ey99mcRP6/OU6GSE2+GCVX2Wz1ZxSuiBjAnFjqHCaaMoiJ+
	9K4+ex4UYwbCuzbMVYsLUibJJSvyp4N6KBsAzI/xOp/UP8Frv4qHlpPW//jhaV4RFBUURjsDMER
	HdRfNDep1YNcKvdNW+ozWWJ4M8ip6KRwV6Xy6jHfeTifgEvBKT8y4yItj7l2Y5zCTlHXdalOp49
	uK+jNruKWYEcjmynhpSSwxznj3+T81dkGe6YAIpon/e/VFZagE+Dq9e8ssZMClSdVIWAQ8jdn79
	qP0bw7hI7zJHKdkg1yzUcyYNeeUb8FcyJRaWudh0eMrHxtekZQclVWeR9Qt+NlOfSo7yUThX5kK
	fUivMIMccBzcqbgoC0Dw2HSjID+XCUz9zKSHOb2j4IJy2+euKMb1TROMEHrfjiHwswx2b4A7zLr
	t3LtaxBrKdSYFxZim4ugLytNbyjneDgi9hdQxxOjU4V1eFEI1ZtsiCqdBrW3Jgu41OCCLNU8cJN
	skIsEf5zge8ibrcYC1iBLJOQlpytw5cBRf2
X-Received: by 2002:a17:903:32d0:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2e305407c5fmr334005ad.12.1790798609384;
        Wed, 30 Sep 2026 13:03:29 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm1914285ad.18.2026.09.30.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:03:28 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:03:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v11 10/16] iommu/arm-smmu-v3: Factor out
 arm_smmu_handle_gerror()
Message-ID: <ar1rCWg2mJ3aiZS2@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-11-praan@google.com>
 <ar1WQCud+B3nAWX6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1WQCud+B3nAWX6@nvidia.com>

On Wed, Sep 30, 2026 at 11:34:40AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:04AM +0000, Pranjal Shrivastava wrote:
> > The GERROR register's state might be lost when the SMMU is powered down
> > during runtime suspend, requiring the suspend sequence to handle any
> > pending errors before the hardware state is lost.
> > 
> > Refactor the gerror handling logic into a helper function. Subsequent
> > patches will invoke it from the runtime suspend callback after disabling
> > the SMMU, ensuring that any late-breaking gerrors are logged and ack'ed
> > before the hardware state is lost.
> 
> CMDQV has a separate IRQ, so I think it likely needs a counterpart.
> 
> I have a similar patch in one of my series:
> https://lore.kernel.org/linux-iommu/16ae24cc2a002802b990afa1a69fe4ceab1e0da2.1790188510.git.nicolinc@nvidia.com/
> 

On a different note, I should look at that series, I think there were
multiple things that were fixed/addreseds in that series. I'll try to
take a look soon.

Thanks,
Praan
