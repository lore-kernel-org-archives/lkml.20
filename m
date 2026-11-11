Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408976;
	b=s9x7IuAQbpuP7TYSbTlT42CXdHuBNgymorxiFB1hF2uyoz6HKiiaH1QZH3R+gdGxtvkj
	 ZDLcZeGJy6CqFw/qwHYkbVv9ONMBpjs9nqs+d63kDmm5017L5rac8S8+OJiJ8uToP8UKj
	 sSzNDsdU8boiaSm1w9klfN3j2SE5hzlH+k/fGBzFQN9Ypu6w/F0+sYel9UUzICwiIe4iS
	 qygcxL712x0/kYvfl72s+2tkzEw1dZnThZF4jxxVWZs23hK1Ysq7VjY/++pVPcvuLpSvP
	 P3eMIOR18E9xHC6qFhzdMEAmn2LLMvj0P5xKnudxoTC7KnVensy7t4mDXJOU4j0EDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HIxqZpO2DkxXQxVSlLihZrvF0i6BWvR7KaufIV3r23s=;
	b=KRPYQQJyNOjy6ocH2yPXT4qHaG1AWqMLuIKLK2i9r6MBJioqCcCXm4u1ZFOc+uB1aCmP
	 2d3WDDirfvPfX2rJ9Rrb+an9yY0m9hJbW7M8pKBS3b7sLrom6aKVH2Lp8Yn4ZahHl0QIE
	 VShDZqfYFmniwP1RUw3LlNBM5ePQsw6WBn2dHGGPYSdvmmPUyVc25EsEAzekX0vBHPavM
	 qQjSp7ClSwptr5DGptFaWUdGB35by/XVx+Z5WtwZ4ELCPtUXxoosakZUzpEm9cIqOtZsc
	 F09nkocq0PeFq18HiBTnSgtZR3+A/B7j5dl5IZlQ4tjNsLsiiQTRLcU6CcZfAq+QzxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mXh5ESzV;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A371606A332;
	Wed, 11 Nov 2026 14:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A371606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mXh5ESzV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794408976; x=1825944976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5so1kCrTiCcFWXxMcqxCPb9dL1nC50/E0xGXG4pyrAE=;
  b=mXh5ESzVA9lR+mgIpwi243JbM+SpTNZGUcb8mK2PD5uLj42P/GRSyaXX
   fDJbjEcO6h0S0q6C5J7nWsO3FJlmGps7XjfaES4R0yiFe1dgS+qko6l/z
   CHyac/a/PjNQTiVtCcFr49ePw3X4IJtO7ZfsZscvTGBMcIC6z7lbv3pli
   UIcuf7rH97nRFh25qA2T+ND7WZQnlI+AbZYBpxPUUKqfd6jV7dwXkSf1P
   sZsby7VISbV0IhMCzNQ2Pg8mGy275RRoayIzdB9FwgjSuUw/M8fbLe/yL
   LRL5nsplrT5c1zwjXlM9vlBN0wYWhF9dgZNKhCEPVy3rs3Quub6Vf8dZH
   Q==;
X-CSE-ConnectionGUID: DQmkG58VRTK8mdO4M/KTHA==
X-CSE-MsgGUID: mhXGSIPqQoeneRJT5r91jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3075593"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3075593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:56:16 -0800
X-CSE-ConnectionGUID: BywnVwgeQzui3PC5ta84og==
X-CSE-MsgGUID: GWttU/xnQA22g+UdHz/5CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8774236"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2026 06:56:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7536D99; Wed, 11 Nov 2026 15:56:13 +0100 (CET)
Date: Wed, 11 Nov 2026 15:56:13 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: brianellis@gotenna.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be read
Message-ID: <avSCDSv15j7KBrDa@black.igk.intel.com>
References: <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>
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
In-Reply-To: <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>

On Mon, Nov 09, 2026 at 11:22:57AM -0700, Brian Ellis via B4 Relay wrote:
> From: Brian Ellis <brianellis@gotenna.com>
> 
> ulpi_read_id() checks that the PHY's registers can be reached by writing
> ULPI_SCRATCH and reading it back.  If the write fails or the value does
> not come back, it falls back to OF matching and returns success, with
> nothing logged and ulpi->id left at 0000:0000.
> 
> Commit ef6a7bcfb01c ("usb: ulpi: Support device discovery via DT") added
> that fallback for PHYs described in DT, which may not be powered yet when
> the ID is read.  For a PHY with no DT node it does nothing:
> of_request_module() returns -ENODEV for a NULL node, and ulpi_match() can
> only match a zero vendor ID through OF.  The PHY is never identified and
> nothing says why, so code that keys off ulpi->id, such as dwc3's USB3340
> detection, silently does not apply.
> 
> Commit 8a7b31d545d3 ("usb: ulpi: defer ulpi_register on ulpi_read_id
> timeout") made the failed write an error for this reason.  It was
> reverted by commit b659b613cea2 ("Revert "usb: ulpi: defer
> ulpi_register on ulpi_read_id timeout"") because QEMU's Zynq machines,
> where this write times out, then could not boot from USB.  So keep the
> behaviour and only report it.
> 
> We hit this on a ZynqMP board whose USB3340 takes its PLL supply from
> VBUS, so its ULPI clock only runs with a cable attached.  Booted without
> one, the scratch write times out, the PHY reads as 0000:0000, and dwc3
> never enables the USB3340 transceiver delay, all without a message.
> 
> Warn when register access fails and there is no DT node to fall back on.
> PHYs described in DT, and PHYs whose registers work but report no vendor
> ID, stay silent as before.
> 
> Signed-off-by: Brian Ellis <brianellis@gotenna.com>
> ---
> How this was tested: the failure was observed on our board, on AMD's
> 6.6-based vendor kernel, where an earlier version of this patch warned on
> every fallback and printed
> 
>   dwc3 fe200000.usb: ULPI id read failed or unavailable (0000:0000); relying on OF match
> 
> on a boot without a cable.  That version would also have warned for
> DT-described PHYs and for PHYs with no vendor ID, which is why it was
> narrowed to this one.  This version has not been run on hardware.  On
> usb-next it is compile-tested only (x86_64 allmodconfig, W=1, no
> warnings).
> 
> On QEMU's Zynq machines, where the scratch write times out (see
> b659b613cea2), this prints one line at boot.  That is accurate there too:
> the PHY is not identified.
> 
> Tool use: an LLM coding assistant (Claude) helped investigate this, wrote
> the code change, and drafted this changelog and these notes.  The
> observation above was made on our hardware.

Instead of adding this kind noise back, I would prefer to see a patch
that fixes the root problem. Do you know how is the PHY powered on on
this system?

The message is probable only useful for debugging. Maybe it should be
dev_dbg instead of dev_warn.

Thanks,

> ---
>  drivers/usb/common/ulpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
> index dec4baca1c..9d94d51726 100644
> --- a/drivers/usb/common/ulpi.c
> +++ b/drivers/usb/common/ulpi.c
> @@ -209,14 +209,14 @@ static int ulpi_read_id(struct ulpi *ulpi)
>  	/* Test the interface */
>  	ret = ulpi_write(ulpi, ULPI_SCRATCH, 0xaa);
>  	if (ret < 0)
> -		goto err;
> +		goto err_access;
>  
>  	ret = ulpi_read(ulpi, ULPI_SCRATCH);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (ret != 0xaa)
> -		goto err;
> +		goto err_access;
>  
>  	ulpi->id.vendor = ulpi_read(ulpi, ULPI_VENDOR_ID_LOW);
>  	ulpi->id.vendor |= ulpi_read(ulpi, ULPI_VENDOR_ID_HIGH) << 8;
> @@ -230,6 +230,13 @@ static int ulpi_read_id(struct ulpi *ulpi)
>  
>  	request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
>  	return 0;
> +err_access:
> +	/*
> +	 * A PHY described in DT may not be powered yet and is matched via OF
> +	 * instead.  Without a DT node nothing else can identify it, so say so.
> +	 */
> +	if (!ulpi->dev.of_node)
> +		dev_warn(&ulpi->dev, "PHY registers not accessible, PHY not identified\n");
>  err:
>  	of_request_module(ulpi->dev.of_node);
>  	return 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261109-ulpi-warn-unidentified-phy-8c94d2e43f19
> 
> Best regards,
> -- 
> Brian Ellis <brianellis@gotenna.com>
> 

-- 
heikki
