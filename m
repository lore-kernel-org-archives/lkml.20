Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8596C4E01E8;
	Thu,  1 Oct 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850860; cv=none; b=be783qNRQ7s3VpZiyzp4ox5tdxkcUY3sgDHx/V9EBwVjvK4e+1yvT5B95ITGc4hgrjF6JDARQ55vp+u04ZgpLE5YOSpBMhZPbsY5lRJvXrOq9dGTxJAj25+H5OvyZMzte8VKyi9M+rfwKS0TcYhLwkclePMIcOReN2bZ0ClxwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850860; c=relaxed/simple;
	bh=xjVMW3aXX1KCF37mr2VmMH/GPb4/XV4kex/2mMgZ8vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3vG5NMFu2CMpX3RVXHDE3GBzOF39ci8E/OpA2en7pyfKjj3jF/SolCIawl4B2OCQ8o6npgcnN2LSyzwj7FIId4qw0QgcnRADqPO8nywLDy8kVkvWiaY8TiwxpUm+ZYbQOtppgQF41hA8PfcaIYU9frNz3RBfF0Oya9rVVdEl8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRIe2UAT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRIe2UAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790850856; x=1822386856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xjVMW3aXX1KCF37mr2VmMH/GPb4/XV4kex/2mMgZ8vg=;
  b=mRIe2UATDSdZaLmFvFN6OGLwz+5EIW0R/B+IYI79mYBa+/QlPOJNyjIQ
   sTUCVRidPTXscavljCMnHbchDOfmdTrYuujAWVHxV/ixh2R1ExCC4DsEQ
   EykxqelgOhSXggU+HSaIfd97ee0Eki/vupzllvVgSwWZ7LqfRVb15ZzFk
   eJ0wjlvE3TCDIuBhpOIjanrXxyB46fRrGWOPEtMWKBkn3pSjrGHfRUTxh
   FT89Pbs+UdOn/yXhvyyc5DGzpzFbUSEfriQLVz6OlEGp/hWsMjRDXCp/Q
   Wm3hY4nxS+mD2Mc0FpQlR1dGFVH4FT9nMuJAQwWO5TwAKKSmvLdWBymxk
   A==;
X-CSE-ConnectionGUID: H11a5I/DQie8aIBLQSsMSA==
X-CSE-MsgGUID: Yy8gKO7+QnG9F8Jgk+eJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113390217"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="113390217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:34:10 -0700
X-CSE-ConnectionGUID: 7S1VmvmGRveXsMyrE3BPbA==
X-CSE-MsgGUID: Guu9ITM9RUmISY1TW2anfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274044840"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:34:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B52BD121BA0;
	Thu, 01 Oct 2026 13:34:03 +0300 (EEST)
Date: Thu, 1 Oct 2026 13:34:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-isp: ispcore: Fix inconsistent step sizes
Message-ID: <ar43Gx4cm_bKLC0b@kekkonen.localdomain>
References: <20261001085130.84565-1-barnabas.pocze+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001085130.84565-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

On Thu, Oct 01, 2026 at 10:51:30AM +0200, Barnabás Pőcze wrote:
> `risp_io_{input,capture}_enum_framesizes()` sets the horizontal and vertical
> step size to 2. However, `risp_io_{input,capture}_try_format()` passes 2
> to `v4l_bound_align_image()`, which corresponds to a step size of 2^2 = 4.
> 
> So move these constants into macros to avoid the repetition, and with that,
> use 4 as the step size everywhere.
> 
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I already have v1 in my tree and I don't think there's a need to fix that
tiny typo just for the typo itself.

-- 
Regards,

Sakari Ailus
