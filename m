Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA247045A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836235; cv=none; b=iHi3HjOwDxT2YKlHBFliVYDjJaAOzKvBBAEs4TF8G1dtowvaty+VOLGYmLchLAK3LUznH01OiSfWpgiV+mHwrn2B+qym4zfwxQ9tLyMgPAA/7BW0/0GHW7Y4WKAWkNXIhD7D1+Z8Snxy7/wLdCh5WFesxw6mMBW1epwlQdKi0z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836235; c=relaxed/simple;
	bh=ODna5VuKF+k/H3KNl1U5Jwcfx/yL3NhPgueLFtXANYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn/DI1j1fwezzNS7S3Nk/sCskZZg5QVPMFDv6cJ6b1h7v9v3lBDCRrS15buixatwpFiSlIf1ANHsQqjMTqAOH1597/66UKq8Ji0RZFsR9SQZRsLI59l4PkOmLYkb4vU+wrFxaRyCrqAsEbIgg6+BZUiqeb/Nxz90jpkrZr+fDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JGieIMG0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JGieIMG0"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92f0b5ed131so185642985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787836227; x=1788441027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndKIThMIJu+DQfTWfwfS9UtTsZjKDkhTAUOgVWRNeBc=;
        b=JGieIMG0pZjf0rDyJJ1pvyxUJ/uGuoEj9jL9+QpT3d87Qyx+2lcKm4yWba81F3AukM
         3IxsylOcTwfgXarIQ5/csJWTMi1k225ocYxiD7ev31sPaIHKV4rs3ccFp4OItkGV3+XY
         EymlSnlK35J9/i9EdkglqmpSSPfpx2GKVoqBcnXG+Pr8TknjIGwOsrGN1KUtOmAHBkIP
         IAnO5P4yq16S80awZZDFpA2hjoPoX5dsqPOIwfDT9uvs4vDFDFQtpPMO1lWjjelOgG3m
         OXzmqnS2OTQMD6j8TKt8WwuYlFQKRQi81LResoZcNHE93KQgOP7A+yAP20TZQy9i3nls
         QTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836227; x=1788441027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndKIThMIJu+DQfTWfwfS9UtTsZjKDkhTAUOgVWRNeBc=;
        b=OKnCzFs7UzJXEYe2YdRPqTCEGom2/G5ZwzdssFnLuzQV/KYvnoh4D2MIYLdvPjTSDn
         bWb5XT63y9oEmUA6vVQIzrfV7loujObd0J5TLILa4ILzMoNklaFUtPHdreKTEHSa2JaV
         7FuLv1kKB6Fv0SCcdv8MiMLe+xy6exN0MQ/lFkFLXmOAfT4jzr+QlOJCRmJcaGUee0LE
         5NPnwbe9Zlj91uBw7j+Fs0PvMxJ4ySLFMmp9w1e9kLAAtxZ/s8oeWBgVZtZcJsUdwo1q
         4Fg9V7WMWGzW5zvnHQzYwwturWnE+v4SrsBpZyPgDNiyLbKqz8AJi/3fBijKXmP3l52b
         DdzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9qkAsk/DgON8BsaFVZSU12f8+lpcqNlC7q3T+MaD0FtBT99SYqQAn46D98XJDFs5Yf6xVsuHMSjSrRoM=@vger.kernel.org
X-Gm-Message-State: AFuF++lekqUse3lSaysXdrH3FgEacQFiJ38K7ihkHzXfQCJb77DGqNBL
	+N6pnrSBQ/KWB2t5vzZlLSytnJ9xdDu1k0sdQIH5fX/TY7R35exacF5US5eQ3qdrySw=
X-Gm-Gg: AR+sD117CDZttvt4PLhUXDqp2WI8gq8jkwu/UvlIzVRNNfY//uwSta3BL/Kmga4DyFH
	pjNOl/0eymAbP1kSJGDYaw7PnO1FVxlGLQGqaoI/CblIbSzDnlVcCEDJYI9dI1fLjEbT+d/6o9B
	ZlXvk8e0aWvlszfU9vYaTpypL4UTE9+NuhujAF+zibIen1oA7HkBlU4MlFaXub9VYL1j0dCO6Oj
	XgJBuX6PCSZ3RXaOd6MtanloS6gCB+dm3vJdNpVeX7QR6Du5o23E7oxU6wzKU93IxZW+P8F4K6x
	105VU2AFgESXgA3dndJ5vvIu0K/uErjR+0/4w0TFKLg6YslAbHVCTMWnyHjj3pf3zdySRNfJbmu
	LkbNInMnFv9sOBeI/u9ORvprDnolo3IyBoE1RuQEFR00u1lZTomzCZ1/gJ/YJU3foBHtpT4KlWA
	P+AoQs8W5X4cPgP7H3G2H9v5Ux8adMUfTJKvKk8Mk1BTACIeQfjZu+MNp8ltv596ql69B519L5m
	Q5HNWY1R487oj8wC0SQfLqieAJQ3QNT2UixdAA7Z061zQ==
X-Received: by 2002:a05:620a:40c8:b0:939:869:a8bb with SMTP id af79cd13be357-9390869b48bmr364870585a.14.1787836227038;
        Thu, 27 Aug 2026 06:10:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30adcesm438997585a.4.2026.08.27.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:10:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wzZs9-0000000FntS-2wGs;
	Thu, 27 Aug 2026 10:10:25 -0300
Date: Thu, 27 Aug 2026 10:10:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/sva: remove iommu_sva_present flag
Message-ID: <20260827131025.GF1449020@ziepe.ca>
References: <aoq8VGFL/Mdjd/M5@hostpc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoq8VGFL/Mdjd/M5@hostpc>

On Sun, Aug 23, 2026 at 05:24:36PM +0800, Zhaoyu Liu wrote:
> The global iommu_sva_present bool merely mirrors
> !list_empty(&iommu_sva_mms) under the same mutex. Remove it and rely
> on list_for_each_entry to handle the empty list case, which is a no-op.
> 
> Signed-off-by: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>
> ---
>  drivers/iommu/iommu-sva.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
