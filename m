Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4430E85B;
	Thu,  3 Sep 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410679; cv=none; b=MMrDXlsCDnJI1dlqxcHIIU20GsHU0q+FxpuUpo3YfI9NLFHHy6AQp4Myi/zD5fOjvksJKP2RrnCxb0tCqjz9UhAUvHRaB4sYTRn32dVrYVjMxO8X+fjc9qvl0Wkoz0jPuripxpyfqPzJG8YFhn8f2kGW4nesDDLyVm14YMcJ11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410679; c=relaxed/simple;
	bh=RDLCQUD0DuuqxN2Uw3XoHIFTfvz/J3c6T1OD3WPrDVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jjc7CzNh2NgehgQun65lqmS2cggYFlAkmepAPQUpH3fsIa9+0VVeTo/MT3+ntvd1gaRCr/rW3027NR9ac8t9fjqqbSE+1U7IaezGlgG1jhFYK0BaBAvfu9uRxK8tVoIQiA6UXJXaa8kpt3HX+JlyF4vggKmxXyefWKuJ9tPH7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGaoyGnI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGaoyGnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788410678; x=1819946678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RDLCQUD0DuuqxN2Uw3XoHIFTfvz/J3c6T1OD3WPrDVg=;
  b=KGaoyGnI1n9EmmGXm9r8JrAXjJTDvU0eHggq/GmgWzUwox4hLP7jngfw
   UixG8QY+lPQPXdLXgXw0R7ai9rUgf3GrRL9U+zyLFDmrgw5Q+Bs+CRkDP
   gwh8reZRds0kbdu767Q6ne9W4U98zQUDc6oMmtBBg/Y37BWZTLrcxaX4B
   rJPcx0IJnsF8LXTIG2JW3BVDPR+jL4CMM1g0tcEVOu6jDO6zFgPe1Pyyr
   h08QCHTzhwrqByrAM4ai+yX1bqde2N1WjKH5vFaAFaQPwlyEm9lX4A7Rn
   PFQHx5SH0hWQmooVx6uVsIMs4IIUoJNss1qi8kMm8qD4LB9IFSx3gM5LB
   Q==;
X-CSE-ConnectionGUID: xcq9ncpcTfiT44oZfNDYmA==
X-CSE-MsgGUID: hZT7ebH6QlerkRHAH7LFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99478271"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99478271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:44:37 -0700
X-CSE-ConnectionGUID: 4j/ZngouSvSxZ4uMBOZ/Dg==
X-CSE-MsgGUID: VdJPeIscTt+wDniNrf/k/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="294469063"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:44:32 -0700
Date: Thu, 3 Sep 2026 07:44:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/16] media: Add Yoga Book camera support
Message-ID: <apj7LiYzFEIByPvV@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 02, 2026 at 04:53:29PM +0200, Maurizio Casciano wrote:
> 
> This series adds the sensor, bridge, AtomISP and lens-actuator support
> needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.
> 
> It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
> OV2740 288 MHz link frequency and manual white balance, firmware IDs and
> IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
> actuator.

> Changes in v7:
> - In patch 2, keep digital gain independent of the external clock and
>   expose the manual red and blue gains as separate controls, as requested
>   by Sakari Ailus. Keep green at unity and accumulate register-write
>   errors across the three manual white-balance channels.
> - Move the 24 MHz PLL and global timing registers out of the common mode
>   tables into revision- and lane-specific arrays. Select both 19.2 MHz and
>   24 MHz clock programming explicitly when starting a stream.
> - Clarify the patch 2 assistance disclosure as
>   `Assisted-by: LLM [Codex] [Sparse]`.
> - No changes to patches 1 and 3 through 16.

Wait at least a few days before sending a new version.

There will be a v8 as far as I can tell, but send it next week after all comments
were addressed (or settled down).

-- 
With Best Regards,
Andy Shevchenko


