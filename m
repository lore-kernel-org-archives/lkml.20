Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351128;
	b=LleWyFK4DV2DgBqdc2EXONjIGvKZa4gM3M+kbKoMH4/IaE5UguriqEqMkkaRCHisy1GW
	 QmHFkP3PtCUXqTY54wpzwsxOVH+LJ5a8Ae2ODOiq7yAq++goiUbFQbDHdWFUmVjZRDjkp
	 ZfhJjGLfE1FEmJE8PebiDtbSrdW9zKafnlr1JBj4pt2Rq2A5FqPhSI3GrBah55wcGnfnb
	 509tQUHMVkyRlh9sBsGbKeTtbTVLegvxyl320zTFHfJYxMFXzxOfwuKJUOOLCgqfRUxXm
	 vWRJq1Tc9B+7+40KSfdDHVbhR/xlwC+yK1Czqe+cDuBqctpk5rP+8ngVE/JK0DckTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351128;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vseUV4o9md+LD5/Wa8jfu6AIFMT9KG3u6VgrASquvzA=;
	b=5s2t2WsPmQ1ywOAPOO0/v6UjgJemBJxT6PiTZAliRfjjyfsa6G1DcSHlryafqM/6D9Qm
	 8N9W31phxd7HL6/ZTu/n1aeL0nCv27rWrIDO5TwMjD3tw3YDtFcPOI4G/IwuGzfQ6Uand
	 L8ApqyzXu8upjPl5FL6IZ7vEvDEYkZ4F/Fih4D730QgOkb+thYUOFvTeInQcyaoPItI20
	 7i+dE92q3HqhnyuJhjhWYJIT97tQk60zfWZEo5noBB+gpao89gJJxNyqUtE/JYwiZJea/
	 rAgLInqeTwW/2TGXET+YA+7XkvUkqRa21g3d7JAgORMzmfQ+rtvQBYgayiUZgG47tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crQtrazu;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B1606A31A;
	Fri, 30 Oct 2026 09:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crQtrazu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793351128; x=1824887128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kMGzZAECmr53FsMSctMRr27o0+GGxgHjgR8ag5r5LBc=;
  b=crQtrazu7f468zQHFw4pZSQyclbTFVoDWrpqVrPlz5A47yHuuJ3oshsr
   gYgBETQHnRcXtwzIQAMlBplT3qHEe7AZ0v2rKzmKQUm/oEfbU543BeHRw
   CAlmHYuzUHCB0BqVDSlI2x67Vgm79ZpAxwHW/l+aPcljaT3fdRNYdtI7l
   j6g9wfJ7MthTnoiT5QKcDYTYT7sQamB2z4gkVvc3wFUfiAh7CXXFzQSWO
   g8f/CxcSVNn/a5IYlnGlzJBnLZ3CRqnDxgfjnYqIFI+Z7uYixTbjv4tEv
   /nZ2VnSB6M1q2SrKybmvx7mYsoh3xiYWi51s0CZ2pukTpGQxzdoriMfAf
   w==;
X-CSE-ConnectionGUID: e+9NfJvnQoOJ0EnX+F7ywA==
X-CSE-MsgGUID: H9KQGM/eRiez+1qIMZlIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2123522"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2123522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:05:27 -0700
X-CSE-ConnectionGUID: sdek9oTWRkutoemTA7lacA==
X-CSE-MsgGUID: c8sl7dtzTBCkQILpFzYdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5509413"
Received: from szadworn-mobl.ger.corp.intel.com (HELO alaakso-desk) ([10.245.246.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:05:24 -0700
Date: Fri, 30 Oct 2026 11:05:20 +0200
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/11] media: intel/ipu6: bounds, leak, and error
 handling fixes
Message-ID: <auRd0FTg3VXiUxGV@alaakso-desk>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
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
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>

Hi Valerii,
On Fri, Oct 23, 2026 at 07:55:28PM +0000, Valerii Sokolov wrote:
> This series fixes bugs in the Intel IPU6 input system (ISYS), Buttress,
> DMA/MMU and firmware interface code:
> 
>  1    Move the vb2_is_busy() check from VIDIOC_TRY_FMT to VIDIOC_S_FMT, so
>       TRY_FMT never returns -EBUSY and S_FMT can no longer overwrite
>       av->pix_fmt with an unvalidated format while buffers are allocated.
>  2    Return firmware message buffers to the free pool when sending a
>       stream start or capture command fails.
>  3    Bound the number of input and output pins in
>       ipu6_isys_fw_pin_cfg().
>  4    Clamp the crop top offset in ipu6_isys_csi2_set_sel().
>  5    Only call auxiliary device ISRs for interrupts that belong to them.
>  6    Release the firmware context when ipu6_fw_com_open() fails.
>  7-10 DMA/MMU fixes: an IOVA leak and a silently ignored mapping failure
>       in the scatterlist mapping helpers, a missing DMA unmap of the dummy
>       L2 page table, and a dev_err(NULL, ...).
> 11    Log the correct frame sequence number on EOF (debug only).
> 
> Patches 1, 3, 4 and 8 are tagged for stable. The other fixes address
> bounded leaks or cosmetic issues.
> 
> The IPU7 code recently added to this driver appears to have the same
> issues as patches 3 and 11 (ipu7_isys_fw_pin_cfg() and
> ipu7_isys_isr_one()). I have left those alone as I have no IPU7 hardware
> to test on.
> 
> Testing: each patch was build-tested with W=1 on top of
> media-committers/next, and the series was runtime-tested on a Raptor
> Lake laptop (Lenovo ThinkPad X1 Carbon Gen 11, OV2740 sensor).
> 
> Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
> 
> Valerii Sokolov (11):
>   media: intel/ipu6: move busy check to ipu6_isys_vidioc_s_fmt_vid_cap()
>   media: intel/ipu6: fix firmware message buffer leak on send failure
>   media: intel/ipu6: check pin bounds in ipu6_isys_fw_pin_cfg()
>   media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()
>   media: intel/ipu6: check irq_status mask before calling subdevice ISR
>   media: intel/ipu6: clean up fwctx on ipu6_fw_com_open() failure
>   media: intel/ipu6: fix IOVA leak on first entry failure in
>     ipu6_dma_map_sg()
>   media: intel/ipu6: return an error from ipu6_dma_map_sgtable() on
>     failure
>   media: intel/ipu6: unmap the dummy L2 page table in ipu6_mmu_destroy()
>   media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
>   media: intel/ipu6: fix EOF sequence logging in ipu6_isys_isr_one()
> 
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c   |  3 ++-
>  drivers/media/pci/intel/ipu6/ipu6-dma.c        |  9 ++++++---
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 10 ++++++++--
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  |  2 ++
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c |  4 +++-
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  7 ++++---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  5 +++--
>  7 files changed, 28 insertions(+), 12 deletions(-)
> 
> 
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> -- 
> 2.56.0
> 
>

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

