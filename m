Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702051;
	b=gYxOHK1ROEe05yT+yFhY+mlZ9isn1RpemF/60DEJCrXIt91fgL28CGlS0Sgbn8R8L5kb
	 9ngj3uYKvEIAOix+qwqJyGWk+tawhR/Hach1Nw5YygxT9PAXCqbDlVBXduOa16cpgeQl5
	 gwU1+lr3yBH3J7js6NHxxiZfEZbDjABeknU9CBqrTqq+DhuW2kf6+NHion9NNsyInS0he
	 Dgtj9l75JKgEaNVpzFBGQRQyjv2YZ1lX3Cm8Lnsn+84hzN0K7Qf64HSqLbxTWwz2rOLL9
	 s9icnEK7Ty6cLoph2qkCNhaXQ9IugOiOgcJPDbtLly1FJR7TvCjyIxa8cpM4qChoE4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702051;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=3GmTI+oAxaCM8I9nkTQEziNL8gxsE0YbI6p63kmMs+U=;
	b=ou/76CIR0OwGDullb3gwIr5bo9+LOnLfTaOwIwZeuYHQKWFbGRbVONvMmm6DEq5uky27
	 gUyDDVNGP7O1QnJt1tEW6c/K/CkCVzhMk9tqBuOxwxGguIopVatGxcArowWeMy45vAN/5
	 NLyHu5BNTkVpQYql8yIM8Lu/Z3dIagobR1oxsDAky4foZN1GSGusPTz3i1MBarQ5wZVA8
	 aKFPQaNcY86Ham65onbUtV45OeO4tclyvqhjuNjgtPTQJE5alklAftCEt4SLdwTGYuJdj
	 uDdVUQjCFcq7aDK6mHBtHwJp8H5iLBewhExW6kKl0XU2SuUZ3CbK8j3fEqlG3T9MJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5+FMwMh;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215D606FAE9;
	Tue,  3 Nov 2026 10:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C215D606FAE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5+FMwMh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793702050; x=1825238050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0V0fh2przo7r7md+e8U0YmIXDyPWRO/jFzU6LlNmtxE=;
  b=K5+FMwMhN0P8eqTZ4QM08xhCixX5yPMwVHbWzo8QgrO7iB7mlHnWstSZ
   MpIa3elNLGXTZsUTKgqNkmVQBfUeq15MFScQxwWVLFdhGd+f0NASLFQel
   HrMvQ8nb7wQ5WHdjZ5fEJcxUQTgH4rIBqh8okHZxPuiZPWLdbkj5WteUq
   9xGssXovvfbyW/IWzz7hMbAtQhqjTwpWCawkR4U2/3cfbe951fHrXiMzc
   LY8WRCQo0YECNGLY7bYBSb/bCRYiuiuemUhYQNU56pS8xP3x/iriJ8o2b
   vM5M8FfhEUW677PifPBVjsBQvW3RMOPPQZ3eibZxBa3jaDi6gYCj1Nq72
   g==;
X-CSE-ConnectionGUID: fjM4losBR9iR6SwvEIyOTw==
X-CSE-MsgGUID: LikpEuLbQKizLPNy5fqpjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2427477"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2427477"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:34:10 -0800
X-CSE-ConnectionGUID: LvWPIjPoStuKtB5XlBlNaQ==
X-CSE-MsgGUID: VJ8EYBCoQAe/AaGko+DNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6234062"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:34:07 -0800
Date: Tue, 3 Nov 2026 12:34:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v1] ASoC: amd: acp: Add support for more projects on
 ACP7.0
Message-ID: <aum4nJ6RQUyXjfDM@ashevche-desk.local>
References: <20261103034415.1495-1-baojun.xu@ti.com>
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
In-Reply-To: <20261103034415.1495-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 11:44:15AM +0800, Baojun Xu wrote:
> Add driver data and ACPI match table entries to support additional projects
> using the TAS2783 codec on the ACP7.0 platform.

...

> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c

>  	},
>  	{}
>  };
> -

Stray blank line removal.

> +/* HP: Sundae, Cashmere-A. */
>  static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
>  	{

>  	},
>  };

-- 
With Best Regards,
Andy Shevchenko


