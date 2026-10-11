Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999893612FE;
	Sun, 11 Oct 2026 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747221; cv=none; b=OkEkYYTaQ7F9m7suxfOuqhPmtfIs+As9ZkSa/XG3jxgtTdVZGAX1EtTiazrPXe9iHTYh6Y0a1KSilWpae8D0+jeogrcb8VloiZmaSWl8kjX8CTapo9gwLZb0fuq8ekgBAfn9YPpCIbtaHDB9hUz8nGb3DW+0s6YvN9MEkdg1CA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747221; c=relaxed/simple;
	bh=JwYgkiZmS1XwdOWdA9rHlulsRAp9V+0YFE2N5hdb5bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhPBVUJu2qAQW9vf25DrfrisLWFkQnr1SW5mHIN7CYWDOccYvu7hj1AhIRiE+/l1ZG5Yp6dnbfRg+ks3G82WisEC+Kpyot02Ui2clAkDvh/SepeSl6rzM96zQwkZgX3P0OlcXHA75JxEts5SMuSouZH5e6KtkHHYqRB8tbyAJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyf39hDf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyf39hDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791747220; x=1823283220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwYgkiZmS1XwdOWdA9rHlulsRAp9V+0YFE2N5hdb5bo=;
  b=fyf39hDfUpdsM3Fq1jDA8zOc1SPEsvMGT0px1cIfv+AuJT0GoKz+WW8x
   rbk6nifxMpztePtqTf55cnkfz9ffSf21R0ejDWmk9atiuAVv8E0zLS3gw
   N2g8D/F0i+3dDCy86f9smd8yG4NYwF355MrxYvWWEfbOSGVRABDebZ4YF
   sdcy8GFf0OXdzvq+c9kyMEOQB99WrnwMWqUY7Zw4LxLq/Yo2tqsfmGNlK
   64/2MGip8guIM66yIPEoKD9nKXnstd3+hgb+PW60grl2jx7st9Rcjrg1S
   hSFOQslgZvarudPp1UfpZTc2sPxS6pUgytKbdqYxjg5LdBgdhG4eOaetM
   w==;
X-CSE-ConnectionGUID: Wkr2QOUNRcS/XNjqSiKFOA==
X-CSE-MsgGUID: UK8Pd9sTSsa8AMaJ1QzBKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="469130"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="469130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 12:33:39 -0700
X-CSE-ConnectionGUID: KQdRUyh+RGC2WEgdyDvFPw==
X-CSE-MsgGUID: skuB1+RRQtCMwbZbb1RTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1055775"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.126])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 12:33:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6507B120D25;
	Sun, 11 Oct 2026 22:33:41 +0300 (EEST)
Date: Sun, 11 Oct 2026 22:33:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, michael.roeder@avnet.eu,
	martin.hecht@avnet.eu, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] add V4L2_CID_USER_ALVIUM_BASE and request space for up
 to 128 controls
Message-ID: <asvklbPb8PWcPp0W@kekkonen.localdomain>
References: <20261009173826.968402-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009173826.968402-1-mhecht73@gmail.com>

Hi Martin,

On Fri, Oct 09, 2026 at 07:38:24PM +0200, Martin Hecht wrote:
> That patch requests a continoous block of controls to enable various
> features of the Alvium camera family. There are many features like
> triggers, ROI for auto functions like AWB, auto gain and so on.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>

Thanks for the patch.

Could you also include some patches for actual control definitions in the
same patchset?

> ---
>  include/uapi/linux/v4l2-controls.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index d17e41d51d2e..5ed91c053617 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -255,6 +255,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
>  
> +/*
> + * The base for Alvium CSI2 driver controls.
> + * We reserve 128 controls for this driver.
> + */
> +#define V4L2_CID_USER_ALVIUM_BASE		(V4L2_CID_USER_BASE + 0x1260)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

-- 
Kind regards,

Sakari Ailus
