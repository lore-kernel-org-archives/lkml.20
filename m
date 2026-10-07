Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3741A766;
	Wed,  7 Oct 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791406792; cv=none; b=a44hSaZ/rPNwGzncoJn49e5UmT3Q41psVCqBiUNfD/wwsQ8umMjJ1cYLazdwsCvquMlYeaA85SuALI1kuPyE/d1rjNyWxalqzvmOA3Mene5WsgXw2QtWefcUeUVZI6dwk5CpvvOdsr1lHo5m+igUp71Bx3V1VEPOTCddrBml+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791406792; c=relaxed/simple;
	bh=tU67LunbAVxcJF/HZHBTpn4xW7i4imG6asrV5eXa508=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciuBxM0onTiMCnXv9oaCTTLBKKf1ZelHflsZIwwPqP3L//SKKwjGR1aP64DRJ/GpKFL69zTMZJPu83+4L5aDbaukfxGM34alYkcjs29dYVyBI6Ol5m6HhkrpsK9gb1BqSIiAocCNpqihUupmgYDnIWsGjtG0z+YW/HAIIUsg8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4IiJccD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4IiJccD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791406789; x=1822942789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tU67LunbAVxcJF/HZHBTpn4xW7i4imG6asrV5eXa508=;
  b=m4IiJccDOkFPPfJD74v6tLJ4WQJ57KNBJHFyJxaMen6JQpEtJ+x7xCDJ
   B5djbk4Jvn6N4JmkOT+eG7iIUULuVlH42zyXxJ9N/DY8T4+zEc/sWTyVL
   3pJNk/CsAeN8l4RnAFupiMcy7WoHz3HR3E8TfvZbewTskoNbvxyJhZ6M7
   0op/bbj34hpbXaDZvLFTBcUAaTfoBq/SR+8PRqXIfKVDIF1jeJaMQqpld
   POnb6YM6kZqnl1s0Yx0P4X0rsly6JXMjOgIPQUgTUxrx+GFuwH85QFYzz
   FwLiwt5Z6S22t3I0UYe0H+Ya34App1vZb00K9aSlJS9E3qUR0GByVkRQ/
   g==;
X-CSE-ConnectionGUID: zaQCt1P9R4iza1p2YoFePg==
X-CSE-MsgGUID: kkV1zicUQ8+XUq2gkRNcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="67344"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="67344"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:59:49 -0700
X-CSE-ConnectionGUID: UOzN6fUMQHigZZqPLAyH7w==
X-CSE-MsgGUID: jMvqQRr1SGm4aidLiDQX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="163093"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:59:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0C0D7121BA5;
	Wed, 07 Oct 2026 23:59:45 +0300 (EEST)
Date: Wed, 7 Oct 2026 23:59:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>
Subject: Re: [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Message-ID: <asaywQrMq-GSrI2r@kekkonen.localdomain>
References: <20261007183311.24637-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007183311.24637-1-lsa.uz@pm.me>

Cc Manik and Divyamani.

On Wed, Oct 07, 2026 at 06:33:34PM +0000, Sergey Lebedev wrote:
> The driver sets is_snoop = 0 on the ISYS output pin, so the ISYS writes
> capture buffers without snooping the CPU caches. vb2 syncs each buffer
> for the CPU, but on x86 the DMA API takes the device to be coherent and
> that sync does nothing. A CPU that read a buffer before then reads cache
> lines of that buffer's earlier frame, which show as horizontal streaks
> wherever the scene moves.
> 
> Set is_snoop on the capture pin, not only for metadata as the TODO had
> it: the CPU reads pixel data too. IPU6 sets snoopable on its pins.
> 
> Tested on a Surface Pro 11 (Lunar Lake IPU7), reading every frame with
> the CPU. With a VD55G0 at 644x604 and 320x240 in 8-bit mono, frames
> holding rows of the buffer's previous fill went from 301 of 698 and 684
> of 697 to none. With an OV13858 in raw at 4224x3136, about 790 MB/s, 300
> frames came at 29.95 fps without a gap either way.
> 
> Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> Tested with the bit as a module parameter, both values in one boot, on
> this driver plus Ruslan Koreev's monochrome formats [1], which the
> VD55G0 needs. No row ever equalled the same row of the frame before it.
> A clflush of each buffer before reading, later than any buf_finish could
> run, still left 61 and 24 such rows of 101352 and 46389 (another boot);
> with is_snoop set, none. At 4224x3136 no row was stale even without
> snoop: four 26 MB buffers do not stay in the cache. Not tested on IPU 7.5.
> 
> The ipu6 driver's IPU7 path, drivers/media/pci/intel/ipu6/ipu7-fw-isys.c,
> also used for IPU8, memsets the pin and leaves is_snoop at 0 too.
> Released kernels drive IPU7 only with this driver, hence the stable tag.
> I can send the same change for the ipu6 path, untested here.
> 
> [1] https://lore.kernel.org/linux-media/20260924171820.1179823-5-koreev.r@gmail.com/
> 
>  drivers/staging/media/ipu7/ipu7-isys-video.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
> index 8c6730833f2..13968caf64d 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-video.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
> @@ -407,8 +407,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu7_isys_video *av,
>  	output_pin->link.pbk_slot_id = IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE;
>  	output_pin->link.dest = IPU_INSYS_OUTPUT_LINK_DEST_MEM;
>  	output_pin->link.use_sw_managed = 1;
> -	/* TODO: set the snoop bit for metadata capture */
> -	output_pin->link.is_snoop = 0;
> +	output_pin->link.is_snoop = 1;
>  
>  	/* output pin crop */
>  	output_pin->crop.line_top = 0;
> -- 
> 2.54.0
> 
> 

-- 
Sakari Ailus
