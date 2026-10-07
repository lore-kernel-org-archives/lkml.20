Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E641DEF4;
	Wed,  7 Oct 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359172; cv=none; b=A+wd/VYPqAitLt5znUkfkDiwuNNb/pd4sqZK1e8KK11acvTNz8J3l1/WeheWkLawTRZ1WZSHRePTDsh61C5Do7ooSoo3rVzLPzwHK94OH/Cg+XPGjfxOKFI/YkC/4lVd60rMvqNFYr6uSYhIKvZ4rCoJIfjV4lXAcmms9+Y38xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359172; c=relaxed/simple;
	bh=vxNzfzJMGl9ZDog634dWEBHoC0T/pNTbFvn6sxwLcBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu4Kh1G3nDHOzef/STR6XcFKFlUyK2RSOxieKxIictxcUnKSaAZMloMjDDzc6DNQSF+Ur4Mv0kvIDGeup8l8AbsiP7qgvLF7m30xtcROWn3iITsdbefmwx2fompCxNgR13k2bQCH17+OBp2yROQpRrlfY1ozDE2CglJbvkYgWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqB8nJkb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqB8nJkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791359166; x=1822895166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vxNzfzJMGl9ZDog634dWEBHoC0T/pNTbFvn6sxwLcBA=;
  b=PqB8nJkbc0sWLjUeZywyARVdk+jtH5/vj2xrJCjwwyAvWtInPKh4lCZ4
   ELLPG4yIXKUmjjjdhlbw00+p+F6rUJWu4bLWKu4mpMJlXRMBkFwabqLgN
   MnlL+AvZVPJTHTRmFyaoMdSJ+IKXU00u9dhiDPf5XmygOOU7Bu51pqRzb
   Dfqaes/+CUhdR7t80rtxRPvcD1R5lerhB7FzkvSKY8BcA+YUJgIZk+4na
   MXncYVhXsbjs1W6D4WtlUy2+dYejDcCbyda9wc5FoTdXXSmR4Yd/IKBMU
   r1oiILeKNuu08Qw5GuLEJDf2QvKnbE9gfzPbdVX7CbFQMN5Vbi4ngCT1K
   Q==;
X-CSE-ConnectionGUID: wER9VUviRzWaYRDE+31IZQ==
X-CSE-MsgGUID: VMryI0e9RkWKTu7IsMJ3CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="215881"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="215881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 00:46:05 -0700
X-CSE-ConnectionGUID: yvjSRatGQIyrKjS3h0Gs/A==
X-CSE-MsgGUID: 4qb9WxixSGi+vn4LoNFbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285296957"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 00:46:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 19B42121B96;
	Wed, 07 Oct 2026 10:46:05 +0300 (EEST)
Date: Wed, 7 Oct 2026 10:46:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: fix typo in comment
Message-ID: <asX4vd1YLEFzXYJM@kekkonen.localdomain>
References: <20261006163055.66095-1-contatocaio.ferreira7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006163055.66095-1-contatocaio.ferreira7@gmail.com>

Hi Ciao,

On Tue, Oct 06, 2026 at 01:30:55PM -0300, Caio Vinicius Ferreira wrote:
> Fix a spelling mistake in a comment: utlization -> utilization.
> 
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

The driver will be removed soon so I'm not merging patches such as this
anymore. Thanks.

-- 
Regards,

Sakari Ailus
