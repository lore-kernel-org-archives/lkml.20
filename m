Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAF4F85B3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416657; cv=none; b=OSe8akAPJJIIugHSogPURcbWNtd5FXJgJkeoB6EyQC8Wm/rhUHeODVjDsSe5ECpuRWOmqZX0+z7wiWQ0UqM7Y0fUDEVAXGbMaIC2LrvMH8i+OeA2NcEmly5D6uSrtDPYbgb5/xNI0SvVGJIoqAolvgeiiUXfhXK2LdyhIPLXv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416657; c=relaxed/simple;
	bh=uIuobwNhfyVUsj1zAuU66QsxRjheSBek0U9eSTXLQYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZl4wDrCfbtW43K31TW4kqxIhNFyHTzQR0x/Ypo1BwgVx0jTgzUz5NoKPX3qL51hRp4E7KLuQJmnFm/dc6UqpVMkBDhRMPvuo2ZcKhn6RrttO6VGhC0fF19dZKZJ7ZwypTEYYRg/BR+sRFjkG8Yc+v/l331SLJbZKqiRGRJxs3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6u4JlG/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6u4JlG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792416656; x=1823952656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uIuobwNhfyVUsj1zAuU66QsxRjheSBek0U9eSTXLQYU=;
  b=G6u4JlG/+aDB3cpMaLjk4Ie0ttPbWZm3mbc5X/7gARdpaB9rw6X5j3oL
   HEAXW6Vj+Vkp34mCcqRzZTiyD8cu2zQiVfGLaVzqUHw7uhRa29WtY9B6V
   Oud68s5fxBXJgP3ojAdlZGCOQ8EEDPz49GEZbEfXKafJ+442BQvEdfPOO
   Jr7U4eWOjtJa2HWMCErbCB2EaiHGbCMjb2bR7/TuBWFP+fbthczGk2Xoi
   QVwBXyHlYxStUgE++nfSKqpyl21eZWEE8fThUfO/Yzu85PENhmdAELmFs
   gB5kWmSKejYXbwJbXSKJrSLy8iidyFnz0ZnLXHnI/6cLWlzxCbG0mXxlY
   Q==;
X-CSE-ConnectionGUID: Dz2pX8LdQPOiZZUJFcOt9g==
X-CSE-MsgGUID: P14yfjvLR6WgP7qN8dZDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1120354"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1120354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 06:30:55 -0700
X-CSE-ConnectionGUID: uUwqYWYTRWeci4QHBbTswg==
X-CSE-MsgGUID: luTHl8xXRl+q/Oo2j/7j3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2424760"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 06:30:54 -0700
Date: Mon, 19 Oct 2026 16:30:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: __efistub_cmdline.c:undefined reference to `__efistub___ashldi3'
Message-ID: <atYbiw9a0AGySXEh@ashevche-desk.local>
References: <202610191553.uvFTO4t9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610191553.uvFTO4t9-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 03:27:47PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c03c1a14507dfaf8b856c2608f9ac216021fc222
> commit: 9a4580db6e9f83428813f671a79486469684069f lib: fix memparse() to handle overflow
> date:   5 months ago
> config: loongarch-randconfig-r2309-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191553.uvFTO4t9-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 16.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191553.uvFTO4t9-lkp@intel.com/reproduce)

Blast from the past?

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9a4580db6e9f ("lib: fix memparse() to handle overflow")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610191553.uvFTO4t9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
> >> __efistub_cmdline.c:(.init.text+0x288): undefined reference to `__efistub___ashldi3'
> >> loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x298): undefined reference to `__efistub___lshrdi3'

-- 
With Best Regards,
Andy Shevchenko


