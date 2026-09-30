Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43830569F;
	Wed, 30 Sep 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761465; cv=none; b=KK2+QYEfECfXfrT+rA7ir0LlnNCyCWofIPxMAdqpImNs/ldVdg8up2VythdiCWliXFpYrC5rCUPwgkRwZyDZXGTFwjdxTqbRqHzCS9zJIh1cQ9LftOgKZGQKKJ0x94zUVR8jC1Tb5KEOlwIPXUEIol0jfGhUWJU7ZDzxXmIPCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761465; c=relaxed/simple;
	bh=FL6rCNePyUvTAA/B1xwZPzBHbXLYlHZXW9W/X94InN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcCZ5UgQqu4X6mix/G2YJgTEIYIEtSieeqhCy+mgN/2gsRt38rRC26PJmsvyqztcpN9FGIWTbpXwqtgE/354TyoNP7RY0r1+MmTVQVZUcCCk1ARUB8pwubsmTyaz/ZOmmShOkllUzHo4uUC96GMJfDm0RAydWIKfNhyflJaW+cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgVuz4au; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgVuz4au"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761464; x=1822297464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FL6rCNePyUvTAA/B1xwZPzBHbXLYlHZXW9W/X94InN4=;
  b=fgVuz4auK4A0wD/nPK3NgGaXTxTEqlWChfd+VO3e2eZiMxmNS20bw8kw
   OSwIU8geM7hsHU0NJ0sgQHbnpCaDbe0xqrECSeLkOBkO1iWe8oHFTHBuD
   xZY2upwXZdY0/5cfrVXYKzOYfck3l+tTZtSO/wP1r52mhYCe1lbiso03c
   D053GTZwhkdcwLlZI6Q27+C3uzYpLGghwjAmw3zYfiUXrYnTEBfta6t0y
   klBBGK7S8etthcpGccDceOLouf9Nb842mxC5lBQ9rgFhzi5AA8FaGYjEU
   t+0SZ5H5M6faxRs9e1P8ZeOFYwGtezQXZmZpEOPmoKY3fjfQYXeuchimA
   w==;
X-CSE-ConnectionGUID: j1eCoFj6TwirIkePunA6EQ==
X-CSE-MsgGUID: Nq2GqcaITyeO2PDCROeFVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91593250"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="91593250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:44:23 -0700
X-CSE-ConnectionGUID: zOoXZ3AtTviKrA7IrwIJYg==
X-CSE-MsgGUID: Kt2L40X2TDaju94SNARPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278848145"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:44:20 -0700
Date: Wed, 30 Sep 2026 12:44:18 +0300
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
Subject: Re: [PATCH v4 4/5] phy: core: Add managed phy bulk data helper
 functions
Message-ID: <arzZ8omO_vKnUZhS@ashevche-desk.local>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-5-inochiama@gmail.com>
 <arzITUCmgUp3uiRn@ashevche-desk.local>
 <arzSkE1kY_u4jJWT@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzSkE1kY_u4jJWT@inochi.infowork>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 05:21:08PM +0800, Inochi Amaoto wrote:
> On Wed, Sep 30, 2026 at 11:29:01AM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 29, 2026 at 04:52:34PM +0800, Inochi Amaoto wrote:

...

> > Why not an error? I do not see the _optional word in the function name.
> 
> IIRC get_all it a special optional meaning: treat not existing device as
> 0, this follows the same meaning like clk. Vladimir has a good explaination
> on this in the previous version:
> https://lore.kernel.org/linux-phy/20260907124318.6q4rr2huxyehm3zs@skbuf/

Thank you for the pointer. Perhaps add a short comment or a sentence into
kernel-doc to summarize that reasoning?

-- 
With Best Regards,
Andy Shevchenko


