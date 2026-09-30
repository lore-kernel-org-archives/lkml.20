Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE37451996
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798442; cv=none; b=HZBYtu9M9EpOFI+lisQQOjLoRBEiwVS8UnZc9ByeTW8zC3kpnFJnQpluI5JrAggzyRjwCjBUvHbivRFkh7kYEOBzs6rLrVazziG0zHXMEkihea2K0FK2d5T2lpWNAtYxxWYQb+qIus3AdjW957ILKp0XpoJh06SJOIc49o8VhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798442; c=relaxed/simple;
	bh=j05inaXzvotjyKWa/ZFf47qCdIej5ahkTtsZ7bh+bp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUZ6PFK7ZuLzULi6QMB4/3Vk4zt1rGYDa1Yd6es1tJihFaAV80UH04QkI8S9BaG8DG5zx9r7iL/Cam3siGENBxVjkcFKL1NGl/oAaUjCTI4ZfCGx7NmmYZlOmpFKP4O5Y7L48JIJk3K/8hfRULHCsW5Z+o7GWogpp5lDuF2hSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FI4Ap469; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FI4Ap469"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so6445ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798440; x=1791403240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=FI4Ap469EUj0szDY0CjkcZAZvq6393RGCxgSJuELwEjLnef+1Y64Z4ItgN3DYJXlvN
         saf5icRsWXJc+D3d2VTF1kvyRqAW/nFUw0qni4he4dwhw9YRrLnGhaggGED8LJBodXbX
         9JJf7mhGh0XuFfjc3AIsiDXo+p+hGfGdl4Ji811O56nZzIhyeB+D1P6vVlBMzmYy6c/W
         Wec3CodnD6G/feTYO8ZkEV+HthFu+QdHvEG/7XkfVTYazzxkZCKGOP4AB7OTXDFaEdIn
         wIf510b4J9wb2mJavpu/ssa8VoIvi+ls2AvNRzMK14nGespmx636p+l7wQxUu5IXIwxV
         nE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798440; x=1791403240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=M53pefxY85n39pZgNdhpYE1LCHSLeOldJx6P8/0DlrmRoQXcrGmKjUqvY31JxvoN6Y
         cp8F2SsqYePTUIrebUGI3lZldjoaubvKc/6vV3v55Fnrv4IdhUWvwWWkG/oEOXHQ13/2
         0fY1IhrXxgJaEXy6AVhdvrVXfdxsr3FC21UiEUCMTvnEVbHyPIwHICUZn3KYmBGfKsqm
         b8K2g6TnAqhGyAyyib2ixbbrPjHRq2TH7yXNPTciiEKgtAQOKZxDL/Zsq25qWTYRRDe7
         tbk2HdASOpDW5RnIC4ovb6Fy2j5KElt9T+hXRY+SFa5qReyQngnXN/+hT3oZzkQJmMVr
         x3Pg==
X-Forwarded-Encrypted: i=1; AKwUvBx85r9GEb5X8MdaGbfCG040nAkSmcskPpwFv4+BjRsmQ+zgpeFsk0LWVLtNnfGkO8kbDhTTeR/IDvEp13w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6tOOvuyiZquqi22WQUUJDVSG36IolNBz+Fa9gZGO5sp6m28KI
	lhEShxMYuAAXjsj47POH35wuh6HkBEwETM7ZK9bFM0gr8tbeSbJ20rkCfIWK6poHDg==
X-Gm-Gg: AYBFou1MvvE16MkRN4jcF3fufZ8YAbVQAlVNNx/kh+AveFW8DKKjKPLl7XVRlcfa7l/
	YjEkO2rkMA81jyGYU6m+PTOFI1UmeXlMETGcisOYJZRheQMiBi9fL7EezEz5Dm3ZPMVadiOiVeH
	O+ZrZ07DztfLBenWFxtsKC9Lt/0mzf/BW1r0w3dxPRSCr+JKuD9Ga6lLtcpQWrH9VOPZBX2smz5
	IhAAfuZ1/dTDUFtejvKBrJltcmKHgNN8Q37rhaKj68HdWpVCL19RoT5r9phkDm/N6vtDtcaHNZg
	Q5/5LpX4/ORZKcrIXpNn6KDuzmF7wfrHuAEpbkaN40f0VzSk2//q6CYrg39Tm8mx901j+weRENR
	RGJ1yARJX18yNcfV9Xdf8F4vK9+xlx3yduiyS4gRFObRsVSbfKAQi0jR3Ddg5brap6HLpy1bCfh
	Lzd2OXiFXQy/WVfzCuEu+9qBQaJ9Y4kRcW5ULHh9xyzFV8yagskQy25PNi1Dc7O3R5hQZhTktdz
	TKTybQiy6bG+CNz3S/JfAVckE6L+JSJJXGh
X-Received: by 2002:a17:902:e951:b0:2df:8ff7:876c with SMTP id d9443c01a7336-2e305472617mr373115ad.16.1790798439504;
        Wed, 30 Sep 2026 13:00:39 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm753405a91.16.2026.09.30.13.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:00:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:00:31 +0000
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
Message-ID: <ar1qX_Ox2ONgcZM5@google.com>
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
> Mine only handles CMDQ error though..
> 

I'll add a counterpart to arm_smmu_handle_gerror() in v12, I'll factor 
out the body of tegra241_cmdqv_isr() into something like 
tegra241_cmdqv_handle_errors() (bailing out early if VINTF_ERR_MAP is
clear, so we don't warn on every suspend). The new impl->suspend op
would call it after draining the lvcmdqs, with cmdqv->irq disabled
around it, right before hw_deinit(vintf0).

Since yours is for the CMD_SYNC timeout path, I'll keep this
independent? WDYT?

Praan
