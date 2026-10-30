Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400331;
	b=jtn47UpvoGVLoNYkKNBLtLLQEfaNJ7kn7p+sGZvD6SDvDp/ENtQxDoRGcGcPRnrg+lSZ
	 /6EicnS2+okyBJN1qwoGWrv6qzCA6wbeGpyaIv2b7WIuZow3DNxAWbrq4liOlLYvYXB/J
	 9fkgOq6mQvH3mJp9ve5C4+BQ5U+Fj3s/Vkfqvtkq1z/VlJi7eW0iXoQGjquHu7xCiOMgB
	 69Dn0gu66x8Ucmirjarw2LiYNINExo/kmiV81adOeLXRl5MI0AEMZTjgU8sQT+i9ABaTm
	 WwsSJ/z1DpeDqo1fxQeGJwaP3Yp2vsh26miK6jQny1OGKc2uwQmWoji3o0SzRNRgtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400331;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2yXPCghD4HtJhKnd45tIgCVhaxQCotBo+SDg/yWeoA4=;
	b=gW0wkrb7Sersu9u7xSuUTI8D6hmu11rdrYVEYkZhOkjpYtjCFOuoKHj6THLRcrjP1YYM
	 MLHsPVzBNX3MF2H6JSrp5+v125pPDFBo7Gj4gZY0U4IRkUmG7cn3xuNeaTAE2CALmQTKz
	 1OLL5cwJwSIy/6+7J7hUTEXZYQaL6hfap9P9dOQ+gGLMrHcA/uSFdd4GqfPIclB9QiJtq
	 0npDfJRYg0CNEbPI8b1XrGfS5n3MD+kdWWy9nzd0ohoAeauxipZ4Y7VOEk6IuVlNiy0s/
	 0buStpNZ+gONANDzUqyM7rUoKE710i7LhIPhCSvz6X7r4wbD20HjHYVMYcngAWSJaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOzGoj8m;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F590606A31C;
	Fri, 30 Oct 2026 22:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F590606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOzGoj8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793400330; x=1824936330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Fn2pxKKvk3BBbz8SBlqHGp+ZY9AeRFTROeqNefvLPg=;
  b=MOzGoj8miUebD/6eL05UVgwKBS+u6aXteDvhH7Vf/t1+Vw9PUrfy032V
   anJj7q8SIJsB7N/ybG5EbzxoBiEwbB8j0OlVwOlNIpDTto54trsjANG5C
   4NTCDVaoM0lIugGdA/PsI6rvnpLVUsPXWp+7GRYeIm3mwP/s+QCOhbmGf
   J3RFSmmN6C4k0/1sgqWpKSK1OPgAthikmHYDmaEmOITi7YXshFNjrlElz
   xyKkregeUIgPbFMBoDjKyrz5gPrXFm/ErNrnq4qLL/xRHhRVuioF3dwzk
   EvDTnbLAxHVtZd0v2zTQhAzOPyjTvnso44JVl8eg64rHhXbSCQFwVnQrx
   A==;
X-CSE-ConnectionGUID: AUhXp65WRuWB1dKrJM3X5w==
X-CSE-MsgGUID: W6f7bnOPQE273E/ocqQOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2049381"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2049381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:45:29 -0700
X-CSE-ConnectionGUID: VWGASS47RUWa2XwHK0yW1g==
X-CSE-MsgGUID: mtv4XWKLRlK/Qh8b1qPScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5936487"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.110])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:45:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC6D5121B75;
	Sat, 31 Oct 2026 00:45:34 +0200 (EET)
Date: Sat, 31 Oct 2026 00:45:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/11] media: intel/ipu6: return an error from
 ipu6_dma_map_sgtable() on failure
Message-ID: <auUeDraiy9tu1NDg@kekkonen.localdomain>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
 <20261023195446.22578-9-valerii.sokolov@pm.me>
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
In-Reply-To: <20261023195446.22578-9-valerii.sokolov@pm.me>

Hi Valerii,

Thank you for the set. These are really nice fixes!

On Fri, Oct 23, 2026 at 07:55:58PM +0000, Valerii Sokolov wrote:
> ipu6_dma_map_sg() returns 0 when ipu6_mmu_map() fails, but
> ipu6_dma_map_sgtable() only treats negative values as errors. On failure
> it therefore sets sgt->nents to 0 and returns success, and callers such
> as ipu6_isys_buf_init() and ipu6_map_fw_region() go on to hand the
> hardware an address that is not mapped in the IPU MMU.
> 
> Return -ENOMEM when ipu6_dma_map_sg() maps no entries.
> 
> Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> index a923a1e4bd..37b5c25259 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -459,8 +459,8 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>  	int nents;
>  
>  	nents = ipu6_dma_map_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
> -	if (nents < 0)
> -		return nents;
> +	if (nents <= 0)
> +		return nents < 0 ? nents : -ENOMEM;

I think this has been written as-is since the thinking has been a negative
error code is returned on error. So I'd fix this on ipu6_dma_map_sg() side
instead.

dma_map_sg() returns 0 on error (which is probably the source of this
discrepancy) but I don't think we need to align the error codes to that.

>  
>  	sgt->nents = nents;
>  

-- 
Kind regards,

Sakari Ailus
