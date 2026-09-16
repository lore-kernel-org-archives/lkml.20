Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C151E452
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573526; cv=none; b=KCNyp9AQPbpqs6NirU568l9oN3IW/iGyZPOw66uwEgRJRDDQcW7yxlwCvSMLHpOmGGhkg8RWLT+GtRFQRn54ySTlUJsdXpnLXJgaroJO7J/W7jUaRfV2HKM2ZmrCLDYO8WB1hJh6IKPVEjAy/n9SVIAC7BfPCAGM742yTN/6FNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573526; c=relaxed/simple;
	bh=BO+FnyfrRD0xKudZRXx/t5gSZQLTWtm9w3aVtOsqmqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdeZbsCcfWbpuG7ujJ9EJLS1VPay5wElWed2EhQXVKBoNnWU0329GyZ8OojW3+ISiEvqNu4AxPNNAlW1///QiSfymWD8HcPg80HMqFWUbcZ96PgP54rsigBq4/Jw6D3r6yYzgmB0FF41mWR8mnqzTWnnL9i3O+JhqgDKE3UKMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7ZsrkHs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7ZsrkHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573525; x=1821109525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BO+FnyfrRD0xKudZRXx/t5gSZQLTWtm9w3aVtOsqmqI=;
  b=J7ZsrkHswNstWpUYaLhRXl55A0NzRq1fIIEJ23hU5zJw22oBF9hyTs86
   E4eHL15Mek2vTjfyGwfQ1WQhoGinakZb6NTZmph1stFN8fe6IWKXeXbJk
   LCJLIgoBwmLTkyUvQNxMzxboiQCS73lfQYGrWvXEBdde2TE2mLAhWcapk
   Vf9q0Jup+D9Qg6uvtHU2HmoIo/+HWDhKcW9oXBQ4OQANSERdd/0rxL9YT
   NQfhOjnJdTIdG6YoId++xd4L4qnKTCcRqihBDScaTpVLGwCum7ETJmym9
   j/5YcDC2r3gSVpPkEUbrCRKM0CbS98hJyyyc4YYIg3sscLSmMDK568TeR
   g==;
X-CSE-ConnectionGUID: oU3ej1fBS+iN7tujnecglg==
X-CSE-MsgGUID: iF/LMM1sTZ2hC6E+gwJAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89975229"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89975229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:45:24 -0700
X-CSE-ConnectionGUID: KjNO5GADQGyq+GWcWSsTJw==
X-CSE-MsgGUID: 9Tp5tHMmTLyvqznUS58U4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275331426"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:45:23 -0700
Date: Wed, 16 Sep 2026 18:45:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Message-ID: <aqq5kUT2xl0A3aRU@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 07:36:39PM +0500, Maria Lisina wrote:
> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
> 
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


