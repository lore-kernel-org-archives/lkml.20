Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54216483BF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573063; cv=none; b=gmUG+Pg/KHWC0Q6mWz3BWsxu4jk69hAk70nhWp0co/8/GEULrgRZYykBjPZ1jOQh00CbfSBzkTQ4Mj5LKMQa0//NTKJ+B4kjjl1Kzg+0u0QvRIXvgS78gmKErEz3mC6jEdUYcGWvSFcbpGUxJ/8lFroXoJUsxWHXhaJfxs4DP3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573063; c=relaxed/simple;
	bh=90s6IWCIuEsaQl2g7YA/U6oQzClIiUwQ+qXs9lZRHmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imPzqUkeYdu+pmm62eFKJmHfPLu21N4rSMu/nX1ldpBGbtdP3MSChtJpCkUqrzggAotrSHJ2VsNtlbDCmgZsy0ILgvtprlgLEwwAqX0PU43tPfdw4G5KoPBkDLqtb7POvbfMstxbkLe2RhkkLcjbSzZ1GafpuDPUDhYfXgZG3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6YLngA/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6YLngA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573061; x=1821109061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90s6IWCIuEsaQl2g7YA/U6oQzClIiUwQ+qXs9lZRHmI=;
  b=Z6YLngA/oyBGCaUiAftj/8j1UDJM1Gp7to0dQBfoOvZUsVkPfGYV7ZXP
   TbN9A15jfF1RXOZRjEfYYCn26obAUIABzwGRIiL6b6QfA0eJzXo+XXBND
   mWMwlusZA8cX5CfPWrOzyPx+tRO++aUsffHBqdVVCyT8YAsI3cgxCASb7
   HJ/875A6e3aZnpM05xMVoRXtpO+HwZpncn5F3F/wyWO41QFG0rVgTjXg9
   yXXOtlqLD7+XQR+MQXFRNSv7biWxYMw1iKHgH9WLpj4Mj8SupildgpAe6
   zfKP3ecKDDwnGMfOhKY+YAMHMbR+Hu0PZyfSMlUNfcjqJxGAzu9j7FonC
   w==;
X-CSE-ConnectionGUID: wdcq5t5JQNCwofzOxmQNfQ==
X-CSE-MsgGUID: roOKkMYJRQCEag9oqPdo7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89996732"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89996732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:37:36 -0700
X-CSE-ConnectionGUID: 4F+3dotHSUmrBrd8/ObH2A==
X-CSE-MsgGUID: 2CtdKzNZRXyfVgXD9J0nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277112952"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:37:32 -0700
Date: Wed, 16 Sep 2026 18:37:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ziran Zhang <zhangcoder@yeah.net>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>, Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] list: add missing empty list check to list_cut_before()
Message-ID: <aqq3un8aNsSNow-_@ashevche-desk.local>
References: <aqp1RMcCSBftjsyn@ashevche-desk.local>
 <20260916111112.6894-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916111112.6894-1-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 07:11:12PM +0800, Ziran Zhang wrote:
> On Wed, 16 Sep 2026 13:53:56 +0300, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Is it IRL case or the code analysis? If the former, add necessary information
> > like hardware description (if applicable) and the important ~3-5 lines from
> > traceback (I assume you rung with CONFIG_LIST_DEBUG=y).
> 
> It is code analysis, not an IRL case.  The motivation is consistency
> with list_cut_position(), which already has the same guard.
> 
> > Nice! Where is the test case?
> 
> There is no test case.  If a test is required for this change, I can
> try to add one.  I wanted to first check whether the consistency
> argument alone is acceptable.

Any new code to lib must be accompanied with a test case(s) as documented [1].
Look at lib/tests/, there is already a set of them.

[1] 0a83293322fd ("doc: development-process: add notice on testing")

-- 
With Best Regards,
Andy Shevchenko


