Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8ED36B938
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724722; cv=none; b=mlMG9PPTk/ZiaXfSSp/xMF052vq41kVmFJKnzQu53CO/Ynfvxrbu2X1K/GQjLoWXGNxEZB8fiDv7vHpEa6V2T5d/HS8zb+8qXGPv6AYzA7o/mpDUNuEK30TikZbaIKeZzN4nGB8NZX2X/K0PCSVzJI4ojQ7qut9EzU1eCx+Q+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724722; c=relaxed/simple;
	bh=imvGqAJsdDloML4ECKUpkPV0DcICx3LvQjsFZoOnsRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsviLgSD4j0fPg4Gyjt936NwkyMMZITGwpTcFhGKCjJr5W3m2D1704vxZJ+kyHL6bBqOAsYLe8bdeEcmyTflO7AZGTRfvdPWO5onllKTipvtNYKfmxQqcGvVj9rFcdtXJxtdQ7Or/IDexXYj2E4Ox18ouTrfwX1kGTeslJTpH/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZlj2dd/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZlj2dd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789724721; x=1821260721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=imvGqAJsdDloML4ECKUpkPV0DcICx3LvQjsFZoOnsRo=;
  b=lZlj2dd/PpAiUSWaS3iWELpJMigmERZP9HLV3ohoyUPQ5xMLoDC6/UEH
   5KpEhFgveQhTq+mN+JTH2uHDMtpABTxQVQjlq/mzCggwIkQjmq+HYtbD6
   JocHbH+rfdKctqroumGFWP0C/cJQlG7ZI2ndlfeySEaEsUn3bV7xDw58o
   LnLDZXIjeIgrlkuYsMUpTSy7N/6eNUAt8zK0gNQMXYQU8mUbFA8sky99S
   k04fhmfjXfmxmpILMVgEyDnFSW5GZiWYH/yB+1+KIudsZUnHmgypWcU7V
   U0MudZcqCJNR9lipHkdUm5TaJK3lWx5kC/9DK99pCBSPlSe0S7YbFr8IW
   g==;
X-CSE-ConnectionGUID: +fmE2BTsRsqeiAGugSJgUQ==
X-CSE-MsgGUID: wFTGH+XfRsONH9CyV00COg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90350147"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90350147"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:45:20 -0700
X-CSE-ConnectionGUID: VpCEzmjyTeuar7b0bifrrw==
X-CSE-MsgGUID: I8Py8lRESVKOmZD3jd0Nzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276287154"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:45:18 -0700
Date: Fri, 18 Sep 2026 12:45:16 +0300
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
Subject: Re: [PATCH v3 1/2] list: add missing empty list check to
 list_cut_before()
Message-ID: <aq0ILEtZRbqpYt7w@ashevche-desk.local>
References: <20260918081026.8050-1-zhangcoder@yeah.net>
 <20260918081026.8050-2-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918081026.8050-2-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 18, 2026 at 04:10:25PM +0800, Ziran Zhang wrote:
> list_cut_before() lacks the list_empty() guard present in
> list_cut_position().  With an empty head, the function falls through
> to the pointer updates instead of returning early.
> 
> Both helpers share the same kernel-doc wording:
> 
>   'You should pass on @entry an element you know is on @head.'
> 
> Nevertheless, list_cut_position() returns early for an empty head,
> and list_splice() also checks its source list before doing any
> pointer updates.  Make list_cut_before() consistent with them for
> the empty-list case.

OK, the reasoning sounds good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


