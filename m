Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638274;
	b=3Vyv+kKQEjY5JYLaztaJvUhIbpFHjvZaxeGe3FaZzX/5J64Q4RsopqlIsGU++g/xhkUb
	 sgAAXKndhOS7vkk/2ke1EiloDMWDUB/8kfgJF7zpaMQxEqLWYzrOa8jVhofFj19JZJMoH
	 TIhQbD9XEZeDdUKqOaBGj5R2kZwTL2RjfSOg1ekFIypFmw0s/KcIwjJQBYPgbN2thgtb1
	 aqeCPIDb+E5jwIhk+pTOOmNmhPCO+pxya0cLDnbvVClwA0fX0odwjUhMnlhi5BQibxaxi
	 Rz4DN+G40OhbxTBggxB12vTFz4tL2b7gCU9VfR68nan8sgNO5TB8qMwvroFdDUizleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638274;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dSWvNA1kVkMo4dfNmhCC1F6Z/Nf1KQ1Twcadzs7yfCU=;
	b=4RQvTrDp0aK9ZIlAhbiTxptdxY7Zvsmf9m++rZgU+sRiL7bt7ZjO45mJLulSrNGMQX6C
	 +UnOYknxgnV49GDB57q9L5J0cVLqxx2KmnTx3tEfCs8drNoSgN6L1ZEdLznFVYJNzdwui
	 Gztj2ftudZmeeQS+PPRQ7HJCzV0aNt2jnAn+X0xmSIa4eYL2zAoTZ7x/3IFZ490mvKy5m
	 i23LGMJPawX/UvdprwhAF1RDCEYRoVn78nD9HuT3HnVWmznKdx9rGp7jLzH+KAZxdM5Xh
	 gH9KAFLWt3Jphu9HdpU+J82KIHL/X1PQb2VDoRN6XEk8/hC5d+qn1PkFkOM/F0ThIRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cxx5ojWU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D5560771F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D5560771F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cxx5ojWU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74AA616F3;
	Mon,  2 Nov 2026 08:51:09 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9803F59E;
	Mon,  2 Nov 2026 08:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638272; bh=1i1kgIOr37Qqefc5GDkhrJkMUL1IUNkCijO3tn0h/fE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cxx5ojWUJmN0/QsOVD6XkyIEgyf1+vOfzZmV/NvRuP/cL7SmHTNYkv+nVvyub120v
	 eJ6U4jkkXmo5Q+qsw7VWlLSVVGVXp2/QH7OwV3QsSktO8p7NxCqtyQx//x4nRsASAU
	 h4o8/T/e5Kq7b+TKG57FCX6tfpZkRXIWnzlErCQo=
Message-ID: <7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com>
Date: Mon, 2 Nov 2026 16:51:05 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu: free dev->iommu when iommu_fwspec_init()
 cannot allocate the fwspec
To: Tal Zussman <tz2294@columbia.edu>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
 <20261031-iommufd-folio-dirty-v1-1-2cef66d2d6d1@columbia.edu>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261031-iommufd-folio-dirty-v1-1-2cef66d2d6d1@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 8:33 pm, Tal Zussman wrote:
> iommu_fwspec_init() allocates dev->iommu with dev_iommu_get() and then
> the fwspec. If the fwspec allocation fails it returns -ENOMEM but leaves
> dev->iommu allocated, and it leaks.
> 
> kmemleak reports it when iommufd_fail_nth injects the allocation
> failure:
> 
>    unreferenced object 0xffff88811c138b00 (size 192):
>      comm "iommufd_fail_nt", pid 783
>      backtrace:
>        __kmalloc_cache_noprof
>        dev_iommu_get
>        iommu_fwspec_init
>        iommu_mock_device_add
>        iommufd_test
>        iommufd_fops_ioctl
> 
> Free dev->iommu on failure if this call allocated it. iommu_init_device()
> allocates it before calling into the driver and frees it on its own
> error path, so leave it alone in that case.
> 
> Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")

No, the bug is clearly the early return in 2a918911ed3d ("iommufd: 
Register iommufd mock devices with fwspec"), so fix it there please. 
iommu_fwspec_init() has always been designed to be called in conjunction 
with iommu_probe_device() which handles cleanup appropriately. All of 
this mock_device hackery not using the proper probe paths is enough of a 
pain as it is...

Thanks,
Robin.

> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>   drivers/iommu/iommu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index cd1bca7ede9a..69be8819e05d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -3074,6 +3074,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
>   {
>   	const struct iommu_device *iommu = iommu_from_fwnode(iommu_fwnode);
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	bool new_iommu = !dev->iommu;
>   
>   	if (!iommu)
>   		return driver_deferred_probe_check_state(dev);
> @@ -3088,8 +3089,11 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
>   
>   	/* Preallocate for the overwhelmingly common case of 1 ID */
>   	fwspec = kzalloc_flex(*fwspec, ids, 1);
> -	if (!fwspec)
> +	if (!fwspec) {
> +		if (new_iommu)
> +			dev_iommu_free(dev);
>   		return -ENOMEM;
> +	}
>   
>   	fwnode_handle_get(iommu_fwnode);
>   	fwspec->iommu_fwnode = iommu_fwnode;
> 

