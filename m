Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6102D77F7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791252676; cv=none; b=drJCQU5eZuH075gqGD4ojqEdhjUy3h1iAiBDtKhMilARNG5SC563vnqpBcgp1BPl3hqzx9l6ZSrabYCtYDAEJOxNSZBJbyjXmutBcq275MlR6bVf68CsPH7hb5ew3IIuVhFayCTKWn4iJrUO0R77lFFrk+2/W5isye1/DuGoYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791252676; c=relaxed/simple;
	bh=f7D5f2zBx5F+sgI5FQe36BPmSURC8axCxrmXCcSCeLk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gy18Fxk4/ZzdX9v00PnrnY9qxqvKInW7Vn87q9XhjI53l4hTZmzaR76giasw40cYB9FWtX1NgV/64nY2B0w4ToC9GJWzDkvB275yBDXnwTOQk0+ImP3VkjrLuoHkefC3ID3ZLFNvTkYRXoIhyfpWzHX0GbobMRHmz/LIg1N6YOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amzje1mX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amzje1mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791252674; x=1822788674;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f7D5f2zBx5F+sgI5FQe36BPmSURC8axCxrmXCcSCeLk=;
  b=amzje1mXO9JTgSWrCNmyLrO5s8so+cUK23V/wht1VfMQ5KHfA/BZYdsZ
   6gonLOtPNbHqnfdFfZrzqk1rE+aLiohSSmGu0YgL0irYzFauJjXZhVvDY
   L6rQP6YK2qvENcGHLtQjcjTSeyDK+sg/p27mNL4S0NjSlSKZNADDuriz9
   ToN608tHz6DF8XJQv1CWg2e2Pmx/DyaS4iwXJ7g3sxVTwFF8u0nrO6p7+
   J0pJ8HntvhB6TxjYFjO2f3Fxvw/SzpB/A6cEK9PgtuQdIU1BDO0k/Nc5O
   n+OGhEi+dWz3KitGPXfWz3LCRG3OVg4RmWF9mx32y+YJMXs7CVPaTKUL2
   Q==;
X-CSE-ConnectionGUID: OGgQPLkPSLOOiCxRJPjFeA==
X-CSE-MsgGUID: QfjKV6JySBW/FN+gNN8mZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92043503"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="92043503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:11:13 -0700
X-CSE-ConnectionGUID: JMlpMnjZRm2Lg3EHqiJSow==
X-CSE-MsgGUID: M6Yz8J13RI+O1j1rLUvqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275643023"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.249.52]) ([10.124.249.52])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:11:11 -0700
Message-ID: <bd1240e6-c678-4be4-8f64-881d4a43b0f3@linux.intel.com>
Date: Tue, 6 Oct 2026 10:11:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com
Subject: Re: [PATCH] iommu/vt-d: Fix iopf_refcount leak in nested RID
 replacement
To: Jiale Yao <yaojiale02@163.com>, David Woodhouse <dwmw2@infradead.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260924115027.656743-1-yaojiale02@163.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260924115027.656743-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/2026 7:50 PM, Jiale Yao wrote:
> intel_nested_attach_dev() enables IOPF for the new nested domain without
> releasing the reference held by the old domain.  Replacing a domain with
> an IOPF-enabled domain therefore leaves an extra reference in
> info->iopf_refcount.
> 
> Commit 236dd58fabd2 ("iommu/vt-d: Fix iopf_refcount leak on RID
> domain replacement") fixed the same IOPF reference leak in the regular
> RID attach paths.  The nested RID attach path has the same old-domain
> handling bug.
> 
> Use iopf_for_domain_replace() for the attach and restore the old domain
> reference if nested PASID setup fails, matching the existing PASID path.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> Link: https://lore.kernel.org/all/20260731054329.2948252-4-baolu.lu@linux.intel.com/
> ---
>   drivers/iommu/intel/nested.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
> index 2b979bec56ce..dbcec6093d50 100644
> --- a/drivers/iommu/intel/nested.c
> +++ b/drivers/iommu/intel/nested.c
> @@ -50,7 +50,7 @@ static int intel_nested_attach_dev(struct iommu_domain *domain,
>   	if (ret)
>   		goto detach_iommu;
>   
> -	ret = iopf_for_domain_set(domain, dev);
> +	ret = iopf_for_domain_replace(domain, old, dev);
>   	if (ret)
>   		goto unassign_tag;
>   
> @@ -67,7 +67,7 @@ static int intel_nested_attach_dev(struct iommu_domain *domain,
>   
>   	return 0;
>   disable_iopf:
> -	iopf_for_domain_remove(domain, dev);
> +	iopf_for_domain_replace(old, domain, dev);
>   unassign_tag:
>   	cache_tag_unassign_domain(dmar_domain, dev, IOMMU_NO_PASID);
>   detach_iommu:

Thanks for the patch, but we already have a fix in the iommu tree:

83871c3ae10e ("iommu/vt-d: Fix iopf refcount leak in nested attach")

Thanks,
baolu
