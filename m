Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AB2EA75E;
	Tue, 13 Oct 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877092; cv=none; b=oMaE9AyVGTyIqtcJiPOXl4ykJf5Ae7t2tcC7eXw33u8dO1XjptJUafRp3+wHThjOmeuz4pjAX/VKZeIP0rLN0wS73m17HQEuE0THHzyrHv9EwiMJ6MJ85z+aX4fZY64s8GNDA67QTVQpuWe5p2BNfIt2RDT5FA5fzb+CbohTFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877092; c=relaxed/simple;
	bh=SqVXPe3nO47FZfgShQTC+ilti+y4uaJBeGIASaBxJ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjtO+OBNL5c/niBf72oI9QK97rXXBsR01Gqsy2p4BHIKFmfBSo/vglBoneCJybMMUTn6W7r55inNDlq1sOPgGesH5DHVm1zpX9TcjNIA4bLhIfAI2DQDzol5ImSX9wDEgV5vtFfu9owFP+KX5ekX3SJCPiNsjfTJt/4oF29L4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDC6LEDJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDC6LEDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791877091; x=1823413091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SqVXPe3nO47FZfgShQTC+ilti+y4uaJBeGIASaBxJ+c=;
  b=XDC6LEDJC3xoqDVocWmDI3XGbuU4X01bwjkV5ni2OUkU6LKNLaTrdMKJ
   hBfKcdB4wros3WOou38JK0w4yO6luH0YXEGkQ/ogfBzxAYemKfRfX8gXz
   IeK0+46Y9tFUNdVN0K2asvmlkfIMCfk5nK3l6+dnL8+r3P1bsrTg8oCd4
   n8b2eukB1snlTjvkM7pUqM/LuI5fc2MfYOAssXjEJUTcgjtkx0KP9vPPF
   /J6/G8x4O9Y55cb5c0+G36IYrHQ1fk6L6dh3ujSx/teB6j0PvKTyvNMMI
   L7EjUzf6xie/HYM6wu13YViNiNZiiRET0KLky8dHOfQPQ7pMOAg2PW8uU
   Q==;
X-CSE-ConnectionGUID: 5yDo9FEcQ6OUtAxwJtU5yA==
X-CSE-MsgGUID: JYdR/c+/ThO8/esw0BvUAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="480203"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="480203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:38:10 -0700
X-CSE-ConnectionGUID: cNpSCCtWSYyyTx7CO4XiWw==
X-CSE-MsgGUID: 9tkJTg/cQsCn3msr85kypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1145625"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:38:08 -0700
Date: Tue, 13 Oct 2026 10:38:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: atomisp: remove the circbuf library
Message-ID: <as3f3d32o4zPAZ75@ashevche-desk.local>
References: <20261012230754.1914517-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012230754.1914517-1-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:07:49PM +0000, Rareș-Mihai Vladu wrote:
> Thanks to Andy for suggesting, in review of my earlier typedef
> patch [1], that I look at converting the custom circbuf code to
> circ_buf or kfifo.
> 
> While looking into it, it turned out that the circbuf API is only
> used by the local queue path, and ia_css_queue_local_init() has no
> callers, so that path is unused. The remote queues only need the
> descriptor and element layout shared with the SP firmware and a few
> small helpers.
> 
> So this series removes the unused local path, moves those few pieces
> into ia_css_queue_comm.h and drops base/circbuf/. Please let me know
> if you would prefer a different approach and I will rework it.
> 
> Patch 3 only moves code, apart from dropping OP___assert(), so I did
> not touch the existing style issues there.

Cool! That's what we prioritize for this driver (from people who don't possess
the HW), thanks a lot for doing this! I will look into the code later on.

> Compile-tested only, as I don't have the hardware.

-- 
With Best Regards,
Andy Shevchenko


