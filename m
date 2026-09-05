Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0836B916
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595360; cv=none; b=QMeK9Z9znYa8NbdZvre9CCN1wQIBBtQXF7UwN03kq4xQExYSYlqFWQhlys9LwT+bRXsxLcMZh0zbGsIwCAn793zx7Q3hTm2pWBu8P4n479rQUT4c5479GbcQRO/sPdJoSrY/StBhOUAM5Sjk36JQFkB8U7fsXEv8Xf5tLQF4s6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595360; c=relaxed/simple;
	bh=QDXLQRd61Zgxx9IVQcwa2lFHRF2BZa4tENoP5AUMdPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5llevcJ61O5SI3C6FJqRXEHOK9TCHfW5HX+6MWdynarcDbM3xPHB8J/czST98964DIqXZl01KdqWWF+ueKDof2rNBrbsul6KYNhsEdz9jZNn5Lmu/ywbIXt4iX8kZSMTjyXqhkIEj3kpWXY3bZyY5Y2RipuEaDkPonUF2KBaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7AUhfih; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7AUhfih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595359; x=1820131359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QDXLQRd61Zgxx9IVQcwa2lFHRF2BZa4tENoP5AUMdPU=;
  b=I7AUhfihOhuGSzH/KasSlDwF63C41GGyDoQWCpFcKJLd3ZvGHFc3Bj6i
   yhk/iQMabXH0+Xlra/R81vDfoNgrk410uloV+ZS73ly0MgdDGtZBIwBwi
   x0z98aSDDwrwXH+CHoO131RxzZHjWAHoheGwNOaJtGdpRvoj7nbOT+mpb
   am581TDvRujsibz1N/VlLgh3gxvWTInDngM8YFjzocW+YaKFvPW90BekF
   o5GIUnieKz6xsDJje46esiYmqLInYxvs6fMcppYwQuWr1XgIA6IztpEPa
   YzhGVR8zvEL7TZfFIgszw5OU4LyyHahNqzI5rRcYjn2+Mri4rXOPadBnm
   Q==;
X-CSE-ConnectionGUID: XNpYZ0ELQNmzBqZ2RVQl4w==
X-CSE-MsgGUID: y+HP2u86T3KFkQUiUNoBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92902893"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="92902893"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:02:39 -0700
X-CSE-ConnectionGUID: goJZG5yBSamPMa8veDPDlw==
X-CSE-MsgGUID: dCAHdfj/S0mdB5/mNy/MyQ==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:02:36 -0700
Date: Sat, 5 Sep 2026 11:02:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/4] phy: core: Add common helper to add phy phandle
 device link
Message-ID: <apvMmo9fAfkaDID_@ashevche-desk.local>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-2-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 04:37:05PM +0800, Inochi Amaoto wrote:
> It is very common for adding a device link for phy phandle
> for device managed phy helper functions. So add a common
> helper for future reuse.

Makes sense,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


