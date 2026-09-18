Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1F5038F0;
	Fri, 18 Sep 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745326; cv=none; b=QiQ5KJIofYDsaFfOTfb4VX7zsYu40fcdv4DuFgcXtvU1Q4cKF5NQLHJluK4MOMRt0W5eBv3OvsJslgNI3mzV8yf9LYdk0+tSrxvksDOc2WTJ7NuTy+Dr9V31HtU5ahgNVEZH9XSoii09a3kxTeAFPoTv6pJ8BbjSq9mf6C1Z0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745326; c=relaxed/simple;
	bh=wU4gETurlTl2nr2f1G/BLzuQUhvCIsjdRVd5oL4Yp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DznWXBJ8Z7FC8dpzE7p40vYk4N4rQfxZB5c/WGE2KTjGKpXoGtOYUzGUgEE1pbVJ85lTUxgpriVEEP+0G+qb8QVRNcGrEuRsgkfaLuvw7qw1SqFgcqZaYPePoFCYR0jO01rOAwRS2QkhXJkzbT+QdpuOnWjKafQJS38U27Nltf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOdm43TD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOdm43TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789745325; x=1821281325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wU4gETurlTl2nr2f1G/BLzuQUhvCIsjdRVd5oL4Yp2I=;
  b=SOdm43TDUAzTLdntSrpxLSAc2kKPkRPa6wUDD63pdWFIUhVcq4sZOm0E
   Aubyy4jt/3n6B4rgAH5S1jn+rA5gaSGVpYGgsl3ErQaakze64cVQqxVRZ
   U2TUv2lkiZVPDRjtQVE++fBqrGop+uIT5l4nyZF5a+RPsnCk94koUz5Ow
   wH/PtXGmVgA9Ha1Ey09abiF5M/8zL2GvFGZLR/welkH180TVcWRH9eSzo
   Yc+PVRXu/ayhh3ctDiyXMcVlnwFherSq/7lGuVwzvhcoEO5u/ET3Kvqxh
   3K0fLIO4j057bxS91TAM9d4Ce5kXmRBRPEKmvzmg3aG5LCQGE0lv0rKyr
   g==;
X-CSE-ConnectionGUID: 53Na4OPWTBegrpUl9iCUVQ==
X-CSE-MsgGUID: /mmRXV8oQMaUfoHodaoQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100856990"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100856990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:28:44 -0700
X-CSE-ConnectionGUID: z9VK+lRhTqe5epqTSMZrxQ==
X-CSE-MsgGUID: B+TDvUJ5Rj6H1JHHSvpk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="279681432"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:28:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 271F7121BAB;
	Fri, 18 Sep 2026 18:28:38 +0300 (EEST)
Date: Fri, 18 Sep 2026 18:28:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hermes.Wu@ite.com.tw
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Message-ID: <aq1Yps6g7m7TQJvd@kekkonen.localdomain>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-20-78d72d7886a5@ite.com.tw>
 <aq0RaLPX5o0HU_yC@kekkonen.localdomain>
 <69a3df11b37f466fbdca8be37a6cc378@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a3df11b37f466fbdca8be37a6cc378@ite.com.tw>

Hi Hermes,

On Fri, Sep 18, 2026 at 11:19:38AM +0000, Hermes.Wu@ite.com.tw wrote:
> Dropped both aliasing assignments (sd->state_lock, hdl->lock) and let
> the core give the subdev state and the control handler their own
> independent locks, like most drivers do. it6625_lock stays exactly

Is this AI-generated?

Please use the control handler's lock as the state lock, too. This is what
most modern drivers do, too.

-- 
Regards,

Sakari Ailus
