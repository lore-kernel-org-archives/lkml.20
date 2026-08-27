Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A2371D01;
	Thu, 27 Aug 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861110; cv=none; b=bZYA9BoYyv8fdeSNY4ytU5nHSkKv8FbarOdELN/FcD3mBHaUI5YxG7Uc1ht8oGLoYG/ufL0WoJGXhRvlEPXAjttPlnyxGr7tCe9jtC+dAD5SsxXGAGyCboExso5pqoHGLd8myfwSIdQntZKJBVUOE3weKM3NHv6aWks7R/YMn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861110; c=relaxed/simple;
	bh=ZyZVrFLZWf8aItalWsTwEJWsealVHGSumyNJEWF6u7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUed1q5h2NE1Zm7C7Zn6fEmeoZ83laeO2rfu1+hf7CBifgKfO8rP3MKOx2xrhyjn9Uu9vU0F4+J1qpkrHARJ0vNG1UCOVYrs/c+1YslagfjjK6ml15Fsv7b7VHIV9CcHLX/F4maVmQWaCXpGxA+HMrrXBf0fJnI8NLJT0dN/s/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ltq2hm3f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ltq2hm3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787861106; x=1819397106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZyZVrFLZWf8aItalWsTwEJWsealVHGSumyNJEWF6u7U=;
  b=Ltq2hm3fEKxq9QL4UbcJcbDDn9OXbeOvlpU1w25m0R2SpPM7Jm1yD6Ul
   a5Pqaba0vCMH9zCTrNrY9nZPbTiBRUREpjZqaXAj8QKmzrGQ9fL2o3OXN
   D+zoc2z44ASyQx9wdZGEHY5UYaEAyd/pESUH+suQRocKvTbsG/elpUWIP
   EZSS8SIvLUzXuxC5v4J5K2qFyijgI7+oXF86zQQiI9CQwnYPPdsDUNc+b
   WxCjHzj2bOk6SCDyipzDKJYsTawAHIoSAPk52BXK9CUa/hkEiqtp7Fok9
   icsFJV10MXMH3Cj7YqmuDFAna5MhOtZ3X3ejmLWctwo/vkTJYtlxyItBQ
   A==;
X-CSE-ConnectionGUID: pyhWnAD7RJuD2dul27hxHg==
X-CSE-MsgGUID: NssOaErITdi8p1FHe7D64w==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99038212"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="99038212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:04:38 -0700
X-CSE-ConnectionGUID: eDMt6mGBSXuKhmtqGpriRw==
X-CSE-MsgGUID: HBBfwf0YQOWpUuHIswziDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="267987125"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.24])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:04:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DEB9C121BD8;
	Thu, 27 Aug 2026 23:04:31 +0300 (EEST)
Date: Thu, 27 Aug 2026 23:04:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] gpio: usbio: Remove bouncing maintainer
Message-ID: <apCYT42UKw9V-u5Z@kekkonen.localdomain>
References: <20260827155127.2334936-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827155127.2334936-1-dave.hansen@linux.intel.com>

Hi Dave,

On Thu, Aug 27, 2026 at 08:51:27AM -0700, Dave Hansen wrote:
> The email for Israel Cepeda is bouncing. Remove the entry.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

I've posted this
<URL:https://lore.kernel.org/linux-usb/20260803164533.58833-1-sakari.ailus@linux.intel.com/>
earlier but I guess it hasn't been merged yet.

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24ca91ce5d865..7f147a95940ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13521,7 +13521,6 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
>  F:	drivers/platform/x86/intel/uncore-frequency/
>  
>  INTEL USBIO USB I/O EXPANDER DRIVERS
> -M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>  M:	Hans de Goede <hansg@kernel.org>
>  R:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:	Maintained

-- 
Kind regards,

Sakari Ailus
