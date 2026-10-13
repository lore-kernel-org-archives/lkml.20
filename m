Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7975437CE;
	Tue, 13 Oct 2026 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924848; cv=none; b=m12mskzNSKQENg/8EY5OuP5FLx/qRbAXB/eZf9A7UU2HBSG4Iq++r2Sft0itYZJWvPvIew7Sz34UNhORguH8Ivd/l8RHwXzjJoODxICJ1FHikowxYF+g7y6YK1nKVU9XvU+86y0TkjaNc4PtFQWZF6LC68garefkHOiGiIS7U/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924848; c=relaxed/simple;
	bh=S99ly0hySM1Oppd062WwvIU3tAiY+7B0+KcZ40Lero8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqgA+5RKdxItOS3hoyI6a6sYcLiHH+6FBoJtH/mpOVrNnbYgvJlm5wOng32/+ntmclXudq6gOHxkXXjYF3VTdZA0fztEqvlTYT3Tw4lLm3gxbuO5G004owuFF3bvNuMSlC+4c3fAeL1+2ZN2D4X5+42U6FD2dJePLn2EHETbHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdG9Le1K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdG9Le1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791924848; x=1823460848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S99ly0hySM1Oppd062WwvIU3tAiY+7B0+KcZ40Lero8=;
  b=FdG9Le1KfBLXfvl339ymSFZxCiCtPmKaXF3A+wTu0Y2D08SA4bka9QvG
   H17L0JfMV0AbdVc4K3Ve+aumWxWMAHoU4Z9IXDKtzSS/I9RyxmA1x9Z+Z
   0rrdkNOK6bk802uihxnL8R1+NXRBnIIohLr/bQWW4zkMUjHT3tfgY5x8t
   J74n8rdovMC0NBc3EV110eRPO+EiHDhyuEGdUkDaQmYRU7Tz7bqokJ87F
   AWC+kTBlQGI6tdY/cv2XpBBIwqtS3Taj3I0vkgqMzDVqLB/iNXVdRf7/D
   qX0baVxx80HIO40F1t72qd9R86TYKDXqGWFYTpJmQEPuEYaATW2nQ+f6z
   A==;
X-CSE-ConnectionGUID: e+ukQzGUSJ2FyzNouDkwdw==
X-CSE-MsgGUID: Yx//+zFXQI2WKlH57Yz/3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="649454"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="649454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:54:07 -0700
X-CSE-ConnectionGUID: b8K4uZ5PQnWjXTJAI6OitA==
X-CSE-MsgGUID: A+jsxrnWTieKBlwuYEL73g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1353957"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:54:06 -0700
Date: Tue, 13 Oct 2026 23:54:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add
 some sanity
Message-ID: <as6aa0lqhUC8dttv@ashevche-desk.local>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 02, 2026 at 12:30:46PM +0200, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.

Any comments on this, please?

-- 
With Best Regards,
Andy Shevchenko


