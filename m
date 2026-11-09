Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195974;
	b=XbFXWA/2NH/9vnre6vyE2uPsuJH5fkbm8L564cwSl457wGl0AAujoFUPSuO9N1zNelnZ
	 u/xaOo6VoGyNmNvLVSKGqDoxp3TyNpUacavjax9zub1PyItbGxdRlsugrPtN4YnPVU38O
	 iMO0kkPyFXIijyVlrg2645YjPCp6GBWlHYGnvgUAmi4pD0I3GNRHB6L9zmdzbiXT4/KGo
	 Rt3HWk6qAutfKe01RXfhojANDwK9lwJvSwDdZ2lXbcdiUpLEEY/vx26QFGumhak6TzmXc
	 anfOREp7ReS5lZhfgHNlMwDDdqxlpF/mvHkAVnsJ2aEC9VxXJ1C5rEvkm2qFfF+HF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195974;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Cc:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gr96iaWliwZ75RhmyhCPwLKsIFpyS1bTKCZs7TpnfkY=;
	b=0MhpnjkcRaXL32d6yu8GUOiVtJrADuvEadOWD6G72DO/q/0Znho40x7pcXlrq236xskr
	 5sGsroPmeLAJzKg9TvGyt5NmgTWAiwmvS8Onyyls8q4qmen3J/Y76z5Nq3kUMkD/QuU8M
	 fjb7gzBal0N2bYxY8kQfg0H1mRT78ZB18LK5Q/qTkT4X7HxBYz4t5eTtJFhbUD+zO31p0
	 66JctTPMXL6apeL18LVr5Lj8v3c64GfYoPNrWZW1+M1/Mlimjo7M7t1z1nIUE7MLRo9+G
	 NCFKRx/MU94B9X+n3JdNfwwEUpqLsJUx5rJcyQ8wEwyO5bjyQiM5VzSVGPgoidYbEkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSUo7BSD;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5930606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5930606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSUo7BSD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794195973; x=1825731973;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BBS1gsXzLye4daje8OnhsCSPUgDhwifPpec/GQS7W5A=;
  b=XSUo7BSDnpWgClKL2F+WOhETkdGLHHWNcq8FmVChVfesoyk9ykLgoPSB
   NhTyG4xNOIJbZ+jXdwuA5VzMpVDVMk4GscOBfvVrCz2jAcdQxKeS0iQky
   mjSbWUbbMqOdA4Nmxp6dqY+RNbmDAW8akWE6KYQ6FFILsKLYUXZnNugGF
   yPj4BBhbwqRHWLssPeAeyNAym6ktzsyj7X5U4nxiGsklDu4+xfnII3cF4
   vWNkI6bzGTJMPXqdvE3KCGLMwtjnjec28jAC8mqU9cuTqgTtYWOFGvlHa
   xJxtrFkYghHOjBwLcCjZEyM8bvgLMJ5Z5psrODnE9cR18y5zRxswjTm5b
   A==;
X-CSE-ConnectionGUID: KNjxsySITEWuNpAziQ08ig==
X-CSE-MsgGUID: gvFOV5/aQCa1xHdiJuO/uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2836534"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2836534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:46:12 -0800
X-CSE-ConnectionGUID: kX3MBr+NRvuhF+mtb/9uAw==
X-CSE-MsgGUID: rTa4fatiTi+HSG1WxC2X9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7658236"
Received: from unknown (HELO [10.238.0.90]) ([10.238.0.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:46:10 -0800
Message-ID: <9d2bb2f7-4052-44fc-9ba6-a7ad6267678f@linux.intel.com>
Date: Mon, 9 Nov 2026 11:46:07 +0800
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
Cc: baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Yi Liu <yi.l.liu@intel.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] iommu: Reject a same-domain replace in the attach
 handle APIs
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1793729087.git.nicolinc@nvidia.com>
 <1b3a334eade93a5047d51af040f1400cd563189d.1793729087.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1b3a334eade93a5047d51af040f1400cd563189d.1793729087.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/2026 2:07 AM, Nicolin Chen wrote:
> Both iommu_replace_group_handle() and iommu_replace_device_pasid() skip the
> driver callback when the new domain is the one currently attached. In that
> case, nothing flushes the pending faults that may still be holding the old
> handle. Then, the caller frees the old handle once the replace returns, so
> such a fault would hit a use-after-free.
> 
> No caller does this today, since iommufd_device_do_replace() returns early
> when the new hwpt is the old one. However, it is only a caller convention,
> which neither API enforces.
> 
> Reject a same-domain replace in both APIs with a WARN_ON, and document it
> in their kernel-docs.
> 
> Suggested-by: Lu Baolu<baolu.lu@linux.intel.com>
> Reviewed-by: Yi Liu<yi.l.liu@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 36 +++++++++++++++++++++++++++++-------
>   1 file changed, 29 insertions(+), 7 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
