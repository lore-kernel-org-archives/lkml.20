Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD163C108C;
	Mon, 31 Aug 2026 06:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159191; cv=none; b=lH5dawc2aRSBhB0RQ3GbmF8FiXQUQaJ/RBBu0iXAqRhEH7emTE/bBAfHdjXvFVO72XJu8ElSt7AB1JqORks0loaBApt4va4/yFiUluq5a6lxBgas5MwRMSyriXC+abYWknL66E6XxOBASqoqe/uqeCDMWafjKkAcsqHx7fqIjug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159191; c=relaxed/simple;
	bh=3hnq8MyDBwwGMaWTnhRHK3thPjo7r6kFLSmFUNJfHao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTGMwx+Llmk1JZddvqzi7RvZJfFky2pEZ/YJr4vPJYQl99Rys79tqQycgw7LRj4WqRdyXZQEg4TNJbdnEKJSUOhIN9iclQfvdRZ2w3yD5w0/riMJjRqvkBgxDa3DgrVuv8g0XXMFkBmUzQXGX6QjsOV4Ka4LvhydudoU4ewezu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rve8clx8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rve8clx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788159187; x=1819695187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3hnq8MyDBwwGMaWTnhRHK3thPjo7r6kFLSmFUNJfHao=;
  b=Rve8clx87V7HWDoiEdIovGlCm3x6UtprJ6P/l7avh5j1Mv5PAYhRolQW
   tkITHdwq6EOCXHSU9X6tIvuKR43uPHkmeq6U1iD94Hhg32ouX4Kbf/+op
   VIv6O2xqX/27oX9IRAVoFYPAOS4mySbsNWJNytgWHjIuBZK6Hwdu9mSjz
   AdpkemlLWa7884VWaZN0Nspdx5T//5dmygm1jSEBz4zT4Fvvn9WgqGhLP
   gMuor9i6jRdp2JOgEhQh2Cbe+mx8K9B8cUB3kVsmfMRRdeIBQ9sr+FoxV
   tuO+U1SM/96wHxqmX4otjD7rMmZltoiLgax+zUo29/hD25u06k9D/oUHa
   w==;
X-CSE-ConnectionGUID: lkA0X8Y7Rli+On9EbWvjCw==
X-CSE-MsgGUID: paXjSFiJTVCLDrXXWYDGEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92245251"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92245251"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 23:53:01 -0700
X-CSE-ConnectionGUID: 7CqDnLebQ6+k9Wki5+SFHg==
X-CSE-MsgGUID: leAP/HUcTl621WkcSGpKBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272507811"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2026 23:52:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 111A999; Mon, 31 Aug 2026 08:52:58 +0200 (CEST)
Date: Mon, 31 Aug 2026 08:52:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] thunderbolt: validate DROM entry extents
Message-ID: <20260831065258.GC124825@black.igk.intel.com>
References: <20260813152206.28059-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813152206.28059-1-pengpeng@iscas.ac.cn>

Hi,

On Thu, Aug 13, 2026 at 11:22:06PM +0800, Pengpeng Hou wrote:
> The generic DROM walker can read a two-byte entry header from a one-byte
> tail and accepts an entry whose declared length is shorter than that
> header.  Separately, the USB4 product descriptor parser reads a complete
> struct tb_drom_entry_desc without requiring that structure to be present.
> 
> Split those contracts into two patches.  The descriptor check now uses
> sizeof(*desc), as requested by Mika Westerberg, instead of spelling out
> the fields manually.
> 
> Changes since v2:
> https://lore.kernel.org/all/20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn/
> - split the generic entry and USB4 descriptor checks
> - validate the USB4 entry with sizeof(*desc)
> - rebase and re-review against the current tree
> 
> The series was reviewed statically. I did not test it with malformed
> device DROM data.
> 
> Pengpeng Hou (2):
>   thunderbolt: require complete DROM entry headers
>   thunderbolt: validate USB4 product descriptor entry size

I dropped the Fixes tag, I think these are more like improvements. In
addition I changed the first patch to use const where possible. Please
check that it makes sense for you.

Both applied to thunderbolt.git/next, thanks!
