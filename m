Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536684AB3D7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573364; cv=none; b=duGZ5PkPswHTMx3kUfK6uAi37UQGJsbabFPsjDIcdqhuxoWwo3rTfRZf+soYISyTK8SmlBtb72sy9Su64R2rwVB4btVRZ6Y5Qhr1qnZ0PTXQMz/aetRl0aQzoWzHiqD/7O78Ru3m49l53Kl6g8v38qM+KsVkFT++FlozLZDaUKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573364; c=relaxed/simple;
	bh=M0DwqKAlxhLxP1NZoF9woGjuh8FYwAiWpOUlWUljIWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRR+N88tIGA6iwp7eR6ldFRBphXU1SdFo/LmQY2Nsi+nAJXlHrUO+riEDirQH+vYMxGzlPPbDNYmnS3rMcqg2352CFULgX37Fek0NF+TpGwI/mn6E+bC4KFFzexVJphk5R+TjthEQVSPK/XeI7Wcofx38QPjAV4MR3Y2Wzx4Ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6ygh01v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6ygh01v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573360; x=1821109360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0DwqKAlxhLxP1NZoF9woGjuh8FYwAiWpOUlWUljIWM=;
  b=W6ygh01vwkRZfFHeK1ZikbV20wpzIZBGvvVak2P6S2v1644IaLr081PG
   Cgd4gwrJQyAzcFxfwdQdLR/K1WCX8nQh9T1/vz47HPahnKZczw8LMV5au
   w1xl1Rrt//Jd3ApSmjat+DGCIVstTwLBs4GAKsea8Y3SXe53RP+mVT0vz
   CmgIvED/5jPMBJrsuYJwKBsvy3tEIJ6kWG90qFATfYwPOXD5OAbfS5dTF
   T1Smsgj8qDAKmu7FOXiNyd5XLtmCA4xAYxNXJyF+SbevSwL1kCO6rMK4l
   Fz0PGzeMgrYG/5pYr4jYNgPmJw7DP8pMqdPrNhgcrzPjMBha/mjc5xlnQ
   g==;
X-CSE-ConnectionGUID: 48HTzjX8STGD55m9F+wP/Q==
X-CSE-MsgGUID: Gg3o6wf9TeedeyTzVcN+pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89090393"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89090393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:42:38 -0700
X-CSE-ConnectionGUID: +//jVAnPSlWPAe4BMOkKpQ==
X-CSE-MsgGUID: apKexJvAQXeAhjI56MWPNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296857731"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:42:36 -0700
Date: Wed, 16 Sep 2026 18:42:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Maria Lisina <sekoohaka.sarisan@gmail.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <aqq46mmXI07okO67@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
 <20260916102732.GJ11487@google.com>
 <aqp3FMncWrzR1adT@ashevche-desk.local>
 <20260916134247.GT11487@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916134247.GT11487@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 02:42:47PM +0100, Lee Jones wrote:
> On Wed, 16 Sep 2026, Andy Shevchenko wrote:
> > On Wed, Sep 16, 2026 at 11:27:32AM +0100, Lee Jones wrote:
> > > On Wed, 16 Sep 2026, Maria Lisina wrote:

...

> > > Why continue if this returns an error?
> > 
> > Because we don't care.
> 
> If you engage your Embedded mind, you will reel at the wasted cycles!

True, but it not the hot path. Anyway, Greg KH is keen to see debugfs properly
used, id est without checking. I am fine with that.

-- 
With Best Regards,
Andy Shevchenko


