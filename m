Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CC3BED23;
	Wed, 30 Sep 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757035; cv=none; b=KsTydUQ2fzlHmRt7TnixBsQfD1Y3Kgs7LWiAFjHFMuCqlb5vYu/8SgbFGsDIjL8KFzaJHtiOeK6Z+2Jky57W/iNGQCv0QarVNKfkfQfEt0B6DWHfSHZ41lyum0wRWaqqHCKRR8NwvRH0nKqYGvsrbVdOdRWle1RsK0da0yeqipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757035; c=relaxed/simple;
	bh=Ydk1UzmYkCmyaMmUxBF1eUbedcHi9fidK7gv8ursg1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWdFC/P3hbG+8DQ4ibNaDCNO0/jZN8rf8pTzTaALvoXFmDO3/l9scMNaI0Rtf7qy6bdxqgE0yaPzqslandAyZBQWyb2JRh75QAwnErMJR4bfhhnO9bBdgsGEZ00ucEImrBXSKYoBVNYxU+g0moDcAlspK1+OguaViFyOwRtRGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNZkJCbR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNZkJCbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790757034; x=1822293034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ydk1UzmYkCmyaMmUxBF1eUbedcHi9fidK7gv8ursg1Q=;
  b=KNZkJCbR1698NDGakt32h0FZmoXSUWWBFpjTp4ejFQK10wN0BLVykgPD
   2UAazzt5BTIWxtYLXSwGjwzX8lto/or9TfMAMDYD4iBOPI1pVbsIWYFsH
   eUU6M7DxW78H+an1rTOILA+ataH6OAkopUIj8jMaK7rRCBGwAXfHtVL9E
   SirOjGmHD1zIT/YKMGtrVOpSVUo9W0lM++GvpI8o/N9fuXqsBXw44PjbZ
   4PnftOdf1gKjLSOnGFkLoxhoZuo4ZvaDVF5mVl1AzjkJAN2F1+PAULhtd
   4Crt8mzQhNQekQOqQRBkPppyMYPxO9G0WjTB7OsBYUZoxGNyaEQ8oBQbH
   w==;
X-CSE-ConnectionGUID: SyjDa5lUSYulkP8ZL2FEXA==
X-CSE-MsgGUID: Ws+1hUAdRiKAggaitoyMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102060236"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102060236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:30:33 -0700
X-CSE-ConnectionGUID: 7Cdf1t9XTKiLIl7ly1EE1Q==
X-CSE-MsgGUID: die/4IOeQrawIw+kc5WN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="272091278"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:30:30 -0700
Date: Wed, 30 Sep 2026 11:30:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 5/5] doc: phy: Document some bulk helper functions
Message-ID: <arzIpLoItQemk3CG@ashevche-desk.local>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-6-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929085235.469515-6-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 29, 2026 at 04:52:35PM +0800, Inochi Amaoto wrote:
> Document all newly added bulk helper function, it can be used to manage
> a set of PHYs automatically. This is useful when the driver want to
> simplify the management of multiple PHYs.

It misses to document unusual behaviour on an error and np==NULL cases.
But before updating let's discuss first if that kind of behaviour
is even desired.

-- 
With Best Regards,
Andy Shevchenko


