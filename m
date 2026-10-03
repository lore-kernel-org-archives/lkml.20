Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68983443E5E;
	Sat,  3 Oct 2026 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062880; cv=none; b=o+Z2RFUkI4iOQVj9wDek9a5BUfaxe6ZoNkA2F93VNbGgq/m0mO/cGAj0+nxULVTcjRn9jyhNMi6QiZsdU30fPCePgJki9w2/MSATJr0La4557lb4K0Za9/iqhjrjnAJrGLDbPpjopx+83WJqX8uy1gvhjchz/kQhi+WLaEtAgME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062880; c=relaxed/simple;
	bh=7pxUXrV13pVTWSp7ELkpGjm3pHeEUYqQsjz8o7cYB8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L24xWkVULopRrzLtCLQpnrajX6c7eAB2VAAI1QrtS85l7yc5bv9sFAN4kBUJtXsXqady3q0kc0VdrclKBMtssh9xMekta2sk2ytwtDVwnKoosSJQkPidI7U4aksrHgGc3ZOBG5IUDr03zdFudctmVgy2JFmm0pWwdsdz8y0V7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh09lXb5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh09lXb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791062879; x=1822598879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7pxUXrV13pVTWSp7ELkpGjm3pHeEUYqQsjz8o7cYB8c=;
  b=Nh09lXb5IS1tAmhbxLKxJ1aaYWJpVkbIOzJOC7jSfpMURIQ5bKL9RwuK
   7RDI0Aq107PBKcqC9DekINocdCV8kkMkYrzjqJ+Rd7U/BRf5rhv7lPbRH
   jUs6R2m53f7xLkfx+Fjfjz3XL1JIEiOpeDlmDqwJM275qR3w1E2nNIbaC
   NlRLGLoQDW9KlE1BucMr/apxkHW8b9RlU1dMMGp8cs/II5VIbogjX95XN
   SVFB56T5wsV4M+tG+K8Z314h3VwwsJRYXAEUSbDceu4BhhHDypGinpB9R
   m6QoULnUA3zAELsEsUywhSq6LQ65Iqr95nm84zezXJ3lipbFAvRAgTv88
   A==;
X-CSE-ConnectionGUID: enu9Q9U0QdqulAnyKSrywA==
X-CSE-MsgGUID: T4xLzxQ7QXa51wh4Li+jMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="101950507"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="101950507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 14:27:59 -0700
X-CSE-ConnectionGUID: 0eKlAJ80QiawfaZBdnpjrg==
X-CSE-MsgGUID: LcRPL8hHSFC+b6fG/D+aog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="304462937"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 14:27:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3903F11FA5B;
	Sun, 04 Oct 2026 00:27:55 +0300 (EEST)
Date: Sun, 4 Oct 2026 00:27:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/2] staging: media: atomisp: Remove pad_w and pad_h
 module parameters
Message-ID: <asFzWx6BOBbs5meb@kekkonen.localdomain>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
 <20260721163533.15888-2-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721163533.15888-2-prajvalchaudhari733@gmail.com>

Hi Prajval,

On Tue, Jul 21, 2026 at 10:05:31PM +0530, Prajval Chaudhary wrote:
> Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
> from overriding internal ISP hardware padding boundaries. Convert them
> into internal driver constants instead.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
> index a2462fc306fb..7c6c0124ff72 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_common.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
> @@ -22,8 +22,8 @@
>  
>  extern int dbg_level;
>  extern int dbg_func;
> -extern int pad_w;
> -extern int pad_h;
> +extern const int pad_w;
> +extern const int pad_h;

Please switch to macros while at it, with an appropriate prefix, e.g.
ATOMISP_PAD_[WH].

>  
>  /* Minimum padding requirements for ISP2400 (BYT) */
>  #define ISP2400_MIN_PAD_W		12
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 812230397409..d117fea2860c 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
>   * output res, and isp output res. however since we do not have this yet,
>   * the chosen solution is the next best thing.
>   */
> -int pad_w = 16;
> -module_param(pad_w, int, 0644);
> -MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
> +const int pad_w = 16;
>  
> -int pad_h = 16;
> -module_param(pad_h, int, 0644);
> -MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
> +const int pad_h = 16;
>  
>  /*
>   * FIXME: this is a hack to make easier to support ISP2401 variant.

-- 
Regards,

Sakari Ailus
