Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9D49552B;
	Sat,  3 Oct 2026 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063010; cv=none; b=eJJzhXA3w5IrG7enxQ9UNmkDr5aDVuZW32xW4JzGKceLzbXXTmokvYSrvtPNYmbDTCPZwroim6fByNbmlquK79RoprKN9mTNOFarAzI3G+0N5gkMNjKtqLyWDoEf/QUiDSPPhr3KuW6sv3ybYsfeLCHUrYFV1Lr6SHeX7C2PAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063010; c=relaxed/simple;
	bh=D8x8axyFP8hKFCMfmt2XmWeJmTJTn183MyVucMGFPXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6+EuTVf9G/v/doU1rdL50spzi6NHdj6c/hJFnDlW3oZ2BryDl+eePvvV4oTITD2Sf9WY2fJvTWcFLULYvLR2oG1O9iFmKVkYAQslctzfDY72QYm5dn2YQwL4Q+zF8tM4ZeqIiG6GyXEUP6TBKFO7r2QQMBQcn8M2Ahu7Z8XBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXm96tWC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXm96tWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791063009; x=1822599009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8x8axyFP8hKFCMfmt2XmWeJmTJTn183MyVucMGFPXc=;
  b=FXm96tWCPW3zHcOm8NDnvgdF2XSltjJwaC/38mQQt7FjDQQ53XlmmNc8
   I4+57XQVt9hLXNo1uNFgNqwKK7aDHdsB+T6aoeaf7sYlzCs/11OGzCA2e
   O6aa+wqwdIr8LC9OAtXDYcL5tVt6u46tBlD2T/ZoMVlZWNYyopNY4wI7A
   5mwROAvSeCoFlQiZNdnAN3fF33TmkPIteq4fBpFirR0NA3CvitzWVRLLo
   dHTwkzI+Gri/fU2uEKpdvpxGZGPy7mIecjYNhBALn3mMUc/gKFS0anV4S
   Ew6LQ9IU7ToyyF725tfrajT7QF1iGDpcHkjqCOPcznV0tBo82KELrnwZM
   w==;
X-CSE-ConnectionGUID: ixVRk/ugTZ2bAp+9dt4kUg==
X-CSE-MsgGUID: DBn2xDk+SwC2BRAdm8Y2cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90818175"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90818175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 14:30:09 -0700
X-CSE-ConnectionGUID: 884xvonTRIqeU9tyOSMARA==
X-CSE-MsgGUID: 1sNEDaDcRQqRF48yLzmY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279754011"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 14:30:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 49AD711FA5B;
	Sun, 04 Oct 2026 00:30:05 +0300 (EEST)
Date: Sun, 4 Oct 2026 00:30:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 2/2] staging: media: atomisp: Remove dbg_level and
 dbg_func module parameters
Message-ID: <asFz3bcfdOOYG953@kekkonen.localdomain>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
 <20260721163533.15888-3-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721163533.15888-3-prajvalchaudhari733@gmail.com>

Hi Prajval,

On Tue, Jul 21, 2026 at 10:05:32PM +0530, Prajval Chaudhary wrote:
> Remove the 'dbg_level' and 'dbg_func' module parameters to align the
> driver's debug facility with standard Linux kernel APIs (printk/vprintk).
> 
> The internal logic relying on custom debug parameters has been updated
> so that message logging and function tracing no longer depend on exposed
> userspace module parameters.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_common.h   |  2 --
>  .../staging/media/atomisp/pci/atomisp_compat_css20.c | 12 +++---------
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c     |  7 -------
>  .../pci/runtime/debug/interface/ia_css_debug.h       |  7 +++----
>  .../atomisp/pci/runtime/debug/src/ia_css_debug.c     |  4 ++--
>  5 files changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
> index 7c6c0124ff72..aa230c3708dd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_common.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
> @@ -20,8 +20,6 @@
>  
>  #include "ia_css.h"
>  
> -extern int dbg_level;
> -extern int dbg_func;
>  extern const int pad_w;
>  extern const int pad_h;
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index ea49ebe2da5c..647f6e7e2455 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -784,7 +784,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
>  	isp->css_env.isp_css_env.hw_access_env.load = atomisp_css2_hw_load;
>  	isp->css_env.isp_css_env.hw_access_env.store = atomisp_css2_hw_store;
>  
> -	__set_css_print_env(isp, dbg_func);
> +	__set_css_print_env(isp, 1);
>  
>  	isp->css_env.isp_css_env.print_env.error_print = atomisp_vprintk;
>  
> @@ -3372,18 +3372,12 @@ void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
>  
>  int atomisp_get_css_dbgfunc(void)
>  {
> -	return dbg_func;
> +	return 1;

Maybe you could switch to similar v4l2 macros?

>  }
>  
>  int atomisp_set_css_dbgfunc(struct atomisp_device *isp, int opt)
>  {
> -	int ret;
> -
> -	ret = __set_css_print_env(isp, opt);
> -	if (ret == 0)
> -		dbg_func = opt;
> -
> -	return ret;
> +	return __set_css_print_env(isp, opt);
>  }
>  
>  void atomisp_en_dz_capt_pipe(struct atomisp_sub_device *asd, bool enable)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index d117fea2860c..55b3d4d3d6ad 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -45,15 +45,8 @@
>  #define CSTATE_EXIT_LATENCY_C1  1
>  
>  /* cross component debug message flag */
> -int dbg_level;
> -module_param(dbg_level, int, 0644);
> -MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
>  
>  /* log function switch */
> -int dbg_func = 1;
> -module_param(dbg_func, int, 0644);
> -MODULE_PARM_DESC(dbg_func,
> -		 "log function switch non/printk (default:printk)");
>  
>  /*
>   * Set to 16x16 since this is the amount of lines and pixels the sensor
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> index 2d0e906530af..029adbdca945 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
> @@ -8,7 +8,7 @@
>  #define _IA_CSS_DEBUG_H_
>  
>  /*! \file */
> -
> +#include <linux/printk.h>
>  #include <type_support.h>
>  #include <linux/stdarg.h>
>  #include <linux/bits.h>
> @@ -39,7 +39,6 @@
>  #define IA_CSS_DEBUG_INFO    9
>  
>  /* Global variable which controls the verbosity levels of the debug tracing */
> -extern int dbg_level;
>  
>  /*! @brief Enum defining the different isp parameters to dump.
>   *  Values can be combined to dump a combination of sets.
> @@ -125,8 +124,8 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
>  						       const char *fmt,
>  						       va_list args)
>  {
> -	if (dbg_level >= level)
> -		sh_css_vprint(fmt, args);
> +	if (level <= IA_CSS_DEBUG_WARNING)
> +		vprintk(fmt, args);
>  }
>  
>  __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index 5113aa5973f3..86b2cca2f441 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -135,13 +135,13 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
>  
>  void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
>  {
> -	dbg_level = trace_level;
> +	/* Trace level is now controlled dynamically via Linux kernel dynamic debug facility */
>  	return;
>  }
>  
>  unsigned int ia_css_debug_get_dtrace_level(void)
>  {
> -	return dbg_level;
> +	return 0;
>  }
>  
>  static const char *debug_stream_format2str(const enum atomisp_input_format

-- 
Regards,

Sakari Ailus
