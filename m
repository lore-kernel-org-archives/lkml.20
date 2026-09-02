Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC649C4D1;
	Wed,  2 Sep 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354806; cv=none; b=aTuZpvIMmOae+mDgCsZFOMQKntCh9NJ6GwV0noHfjuXxvqumAfBl0wMTGJsw+zGv4mXOt+Kx83kO199lefy0PscrP8o54duNXP80w3VdglLQZNuBlqptq1/OO4YDz2XkPPC2cf/KbQdLZhs9WlHVsp/81WGbLvum3RMv+j3S9n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354806; c=relaxed/simple;
	bh=Hp8r30wN83NaR1IXI2nottNI/AINs1StQ7FWK7RDIZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIChat7aOaK6J0dg7HEvErDjGkbfdOqwma0y2A+ZhtyfMpndgJLYKu7e3CzGFDqDiZbkfhCvulTOjk2/hx0ArYb9UzEVPuDSFTqER2DP1EzITonJfBsXK5819yORp8xspTpiOcIsgNO2G0kpDesIcOvz4fY2fuzgn0+YSvMzNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAwADuwt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAwADuwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788354804; x=1819890804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hp8r30wN83NaR1IXI2nottNI/AINs1StQ7FWK7RDIZ8=;
  b=fAwADuwt+Eb56ntN7iMsyRRs8hF9519u0wzBbB+9Q9Ny3tf21bUdziFi
   9BsBmLhvREXze3uFy9uS3DNARV9blO3DI5OXXYqMMRBZTrUhW7zEeHXFq
   cBUpT0e4pM1lgBIjNEDSgHn8l8Qb2FnX5e8qdzCuc69TmF1u30VT2m4ln
   LHljxeyhtLbal7/IWlYsYv7K2Kso+Tq3yh7O0naJCdjxITe9XpZo+x+CW
   no3yO/sngCYMam5eu0DaLYRJJWsXslxaVh9AvQ21K31VkykjlAdpOpk5h
   ta8Jb0L/egiKIP7sR0aYMZnV6TKTmuBoX9FI2z9H3s3fTUt7IaTqulwyv
   w==;
X-CSE-ConnectionGUID: 7g7IUuHMQGKrXEbI7gJe7g==
X-CSE-MsgGUID: trAi4VlDT4WMUNgesz6mtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99974407"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99974407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:13:24 -0700
X-CSE-ConnectionGUID: BuMGXFEJQyC2Np+Bss1zNw==
X-CSE-MsgGUID: zZ4W1jDCSVyqIBQhiq5Fiw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:13:21 -0700
Date: Wed, 2 Sep 2026 16:13:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apgg7oS94f5BaK8q@ashevche-desk.local>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
 <bfa79097b66fc3ed6155c7b8c5368b2e0fe9e882.1788286339.git.mauriziocasciano7@gmail.com>
 <apf7cJOoXrl_wZfr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apf7cJOoXrl_wZfr@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 01:33:20PM +0300, Sakari Ailus wrote:
> On Tue, Sep 01, 2026 at 09:04:24PM +0200, Maurizio Casciano wrote:

...

> > Assisted-by: LLM sparse
> 
> Sparse isn't an LLM AFAIK, or is it?

The documentation says about tools, sparse is a tool we use.
This is documented, please read
https://docs.kernel.org/process/coding-assistants.html#attribution

-- 
With Best Regards,
Andy Shevchenko


