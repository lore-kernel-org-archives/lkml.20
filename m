Received: from sg-3-27.ptr.tlmpb.com (sg-3-27.ptr.tlmpb.com [101.45.255.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA22367F5E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250922; cv=none; b=GMB7u6ZMeDTSvunY633Qph3MKgUB2PYCFp233p3djjCuRt3m5I2vV/Ct5P4p/0Bx4lFWQaboJCxm6Fwi54rvXorD5VM6wSE4wOFvGgUSrZYTTrcFH6PLaAMHzY9FRbCK5pz+9roJvtE+7A+vrCqyr+x/IQrH8k4Td8qv8/CiVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250922; c=relaxed/simple;
	bh=Tf++B65BqI9goJyWRFQD12XSAHLb8zatZrIZcNoy2zE=;
	h=Subject:Date:References:Message-Id:Mime-Version:To:From:
	 In-Reply-To:Content-Disposition:Cc:Content-Type; b=DJ8N/nseDuH4OUfps6trdUjXYvX59ywOh62Tcib7Hm2ciCdUJ6RIdT5m+82Hh3XmhAdc2A4C0RlZYUAHvfBfcDXmAPDaZ+oCQLJKRQCVkfD/i9TtK9eNsjNqquXCH+dvrIeK5djmZ2iadWaXcrtQ8SJ4KVVKiZ+UWZfRQ5Oz9E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=RTgwB7yy; arc=none smtp.client-ip=101.45.255.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="RTgwB7yy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788250868; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=3EU+WyNrIBc1ywamQPHDaiJRGwSjOx0FUX2meGEGOtI=;
 b=RTgwB7yy3RUB2V2Y0V/Ev+NQIiTFkN1gPRfmsFJ5Q7N/L8RhjAjZMz1EJWD3dELqz1cR75
 Cf1if9MVfxaoY9TOx8iVtvEwqI/hyIAPzLEEijPBmO+papDf+MNjRCUiCoYUEoIq/UFFP2
 gKM3R5pD3DOKDarzfQCQR7sI6YTB0hRASmY64DbsQjliethOZ1lh1v0X5kN33W+dvnOIsh
 LiUvySASzQKQzIzlzkT62CSGlAEgAYTS4y0ZZOdg2Z/doQGRvWvyS7zZGiwTel8x2PMrXf
 lEYv5C09wAeZJWDqqrK4crE9oTxSCVj0YkmgzcaBDSwfXrGUoEfv7cYJtfOTTQ==
Subject: Re: [PATCH] iommu/sva: remove iommu_sva_present flag
Date: Tue, 1 Sep 2026 16:21:02 +0800
References: <aoq8VGFL/Mdjd/M5@hostpc> <20260827131025.GF1449020@ziepe.ca>
X-Lms-Return-Path: <lba+26a968af2+bea163+vger.kernel.org+liuzhaoyu.zackary@picoheart.com>
Message-Id: <apaK7okXkiSLwspN@hostpc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
To: "Jason Gunthorpe" <jgg@ziepe.ca>
From: "Zhaoyu Liu" <liuzhaoyu.zackary@picoheart.com>
In-Reply-To: <20260827131025.GF1449020@ziepe.ca>
Content-Disposition: inline
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>, 
	<baolu.lu@linux.intel.com>, <iommu@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Received: from hostpc ([183.129.139.234]) by smtp.feishu.cn with ESMTPS; Tue, 01 Sep 2026 16:21:04 +0800
Content-Transfer-Encoding: 7bit

Thank you, Jason.

Hi joro, will, robin, baolu,
could you help merge this patch?

Thanks,
zackary

On Thu, Aug 27, 2026 at 10:10:25AM -0300, Jason Gunthorpe wrote:
> On Sun, Aug 23, 2026 at 05:24:36PM +0800, Zhaoyu Liu wrote:
> > The global iommu_sva_present bool merely mirrors
> > !list_empty(&iommu_sva_mms) under the same mutex. Remove it and rely
> > on list_for_each_entry to handle the empty list case, which is a no-op.
> > 
> > Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
> > ---
> >  drivers/iommu/iommu-sva.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
