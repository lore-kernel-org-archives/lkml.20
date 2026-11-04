Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797372;
	b=UE8BVcqlTBWVM2B17nc/AqfLc3jSSqZwMQUOTmLvX++x0miozio9srF1ksE8Z2CfQIvh
	 es8CAyBko/bqg0cEMv0pshlY+Ld06GkvBdXvEOeGFW/aTARD/Zjpxsdm06OrUxLU2p7gS
	 lJuRnMNoS9uccQleQqKGWsSUKGsds4BQPP2rn6S3jl9bm4tacaChPvKHyN7Zuq0KrH8dV
	 skdsAF4+aClV97RF7MKVS8KSqhPvBqrBVFBegpYn9nZmBkmMemx4GNAZ/NE/EITWxBnXS
	 qyUTTIbQrEb4Nq96RXpL1x6fsnp2ZlYErkVhccaqPJhZD2BpKMvZNwdreA6mNeSVuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797372;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SRGqHpvlbItrb8SBzeCSixfB+wFJyGeT6RoSoZOZfJY=;
	b=u5+Zdu4STBov13TEVYinNSjqdwVAAO1/uNrLbb3V1Gvk0GhVzd4UV3SUGz6gASgZMUAx
	 GKdcyj6x7/aMRTZJJXUuZS33D/iMi09NGW/1pzTcKk4x3diC2oLric9/YV9pkKBK7rqlR
	 kE93LDmI0US3oMXovRo1G72NCoPXtfooJ56+qw6nPPKLiGCBu7GkdlI1p3Z9o3pUAsaOK
	 C2XqEPrm5o71h27CBMpP91wrvQ3ZI/NcrGclb2vAOUGvZWxZ69qqR7Liv2WMc+2r8iFc5
	 Q3NMpIOQNS/uPxLp5F0/ROtw6pTq/TF7SSQ57x+IGKbDLWwhRFSeTelGDj5iu4cNirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OewmQ6qB;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0C608361B;
	Wed,  4 Nov 2026 13:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B0C608361B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OewmQ6qB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793797371; x=1825333371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GAcKRv5e4ziBm7pGbCW6+/a3seuaUkhBJrvH+Iricig=;
  b=OewmQ6qBL2HnZJn/Gq7xl4l/cnxiAglRMGbB8dRhJ19WE3+WGyXP6W5i
   lOohrAxekR4CvA1+wUCgm4kuOA4w5o+PE4VOZHXO+JvihYeWUr+in9/7+
   5w7O8oUusciB31tMJ0FEEDCc0uxYz8ay/9/ufnT/slNt4SQbbacFY8O7V
   c7i4nO5Xy7DrojXmFBNXNzBuaz9STyagYWbIv0cE83wQZVqmH/bynjXt9
   I4yTjqaukhanGXQtRDIuTAH6AR06bO7iwOL5bB7FEo8x23c/xgA45U/vG
   CCNCnRyGiQnqy2AXXZGUHlZSAkJJ4TS+yn0cYWaCY/MrYkUYrFIxHUdkb
   Q==;
X-CSE-ConnectionGUID: tn8iwtxrSHeVDRNaEbJRug==
X-CSE-MsgGUID: BWkLRxpQS6K11zOBWVXTBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2582775"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2582775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 05:02:50 -0800
X-CSE-ConnectionGUID: 8XsczXFPSj2Ko1poeOs+TA==
X-CSE-MsgGUID: ctcZfa2CQkiSXMpzoWuq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7056592"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 05:02:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F18E3121B88;
	Wed, 04 Nov 2026 15:02:56 +0200 (EET)
Date: Wed, 4 Nov 2026 15:02:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] media: intel/ipu6: fix IOVA leak on first entry
 failure in ipu6_dma_map_sg()
Message-ID: <austAJyXh0xorYV0@kekkonen.localdomain>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
 <20261103211031.1573726-8-valerii.sokolov@pm.me>
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
In-Reply-To: <20261103211031.1573726-8-valerii.sokolov@pm.me>

Hi Valerii,

On Tue, Nov 03, 2026 at 09:11:03PM +0000, Valerii Sokolov wrote:
> If ipu6_mmu_map() fails for the first scatterlist entry,
> ipu6_dma_map_sg() calls ipu6_dma_unmap_sg() with nents == 0. That
> returns immediately, so the IOVA range allocated with alloc_iova() is
> never freed.
> 
> Free the IOVA directly when no entry has been mapped yet.
> 
> Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
> Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
> Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> index 90f530a937..a923a1e4bd 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -444,7 +444,10 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
>  	return nents;
>  
>  out_fail:
> -	ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> +	if (i)
> +		ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> +	else
> +		__free_iova(&mmu->dmap->iovad, iova);

This should be handled in ipu6_dma_unmap_sg(). I'd release the iova in the
beginning and reverse the order of the nents / iova checks.

I'll merge the rest now.

>  
>  	return 0;
>  }

-- 
Regards,

Sakari Ailus
