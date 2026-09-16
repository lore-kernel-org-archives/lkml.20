Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94D4AAC56
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574665; cv=none; b=qe/v5V2xLDEkxlbMQzHTtNrsypXVVxaxGO/DhWJqYJnAmt424PSfkS8pj5W1/pub4N4tEI4p/cVtLIIqiizkkgCgwZPGKj+aDPJ+KHHMiQw9q9JCTmibcDcgUCqWq5H54rLCN42/RBPRe/j9kf616Lo/3FO0BQQgHY0G+lyxhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574665; c=relaxed/simple;
	bh=92l4NDWgiz4obqz329dkg3ScCky7u3lxMDL7f4FNZOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUGK0xkyVy9cwHwSGc1ZFyvw9vVJluRjRe/5Ro5DYf5ByNkBEQUmL2+Fls1qPbUL9IKJ7ysdbOk5ZhrGhypDWHCn64Bx41NOBean3jBTVAzclQ93LIqQDnST56zLLMSDQ3Mv+giwn5sSnn9UkNRNM5JNnwZZ43m9uiiuz5Wfy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5I37ppq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5I37ppq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789574663; x=1821110663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92l4NDWgiz4obqz329dkg3ScCky7u3lxMDL7f4FNZOM=;
  b=I5I37ppqGomZH5TvdSh9dLxx5qF4uGAMrqpNKjm9OSMKsRrqOUeXRiP0
   6v5JEWR01ri0e2eswkZ3J82W7Kuk+I6hZNaTHMP2CdZTGNzeXOd+ajYwc
   LoL4s2UppyQUkB8MbRmGVAIHcCCqgRiR4nJx7j0eOkMQlkWY0W3MpU9O4
   iefvZGoM0ZBHdeZH5911l0GxOv2eD1K0TxpJMWAkjIUzmWgheHm9ELVw2
   IhFDwgaMJUWKa8eRxxQ4LejjLnYQzIis3T8z6RyxmPa1TenMRWrdqtJrD
   rpSncXl6kHhptiXpE8Ort7tp6NSscek6W68CCvfTaFFl16kBX4rdCMzWJ
   w==;
X-CSE-ConnectionGUID: FBLeWQNVRWCq2BXqZscFYg==
X-CSE-MsgGUID: saiW6nhLQN2AySBggaRAzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93828292"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93828292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:04:23 -0700
X-CSE-ConnectionGUID: L+BT3bNZR0yUTTjJTh89aA==
X-CSE-MsgGUID: FBv0/dHjQUWocOyRL7/fgw==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:04:21 -0700
Date: Wed, 16 Sep 2026 19:04:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Message-ID: <aqq-AwWnyBeSeEbT@ashevche-desk.local>
References: <aqq5d5ESVulYfOnK@ashevche-desk.local>
 <20260916155407.47647-1-sekoohaka.sarisan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916155407.47647-1-sekoohaka.sarisan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 08:54:07PM +0500, Maria Lisina wrote:
> > As Lee pointed out, we are fine with 100 limit, so one line here and below.
> 
> But doesn't the guideline strictly say no more than 80?

Yes it says, some maintainers used relaxed version (which is default in
checkpatch and now it's 100). Lee is the maintainer of the MFD subsystem
and it's clear he leans towards using 100 limit.

-- 
With Best Regards,
Andy Shevchenko


