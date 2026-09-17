Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9894D7D2F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658521; cv=none; b=pUaTz7uBFxhDF64ZWFOoUGk28P8RiE1g6IZOvqFRmFSHktPNuHk+0Fx92q+2b4I+fvjV9ftqf8v7VfJ97kZXHRJNlDdhqebBVUmDWUtjy/XiBy/rTsnYDcBVzurX9oULo6ooKbzLg4eDyo5T20lYjyWiv/3WOnjvtE8isxWUZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658521; c=relaxed/simple;
	bh=1my0mKupKeWOGfq1A9bOsjC4A+oqQMM8wHYqvgEgJ18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJjw3QEYG/2CSxg/3FGhup7MuYUpHA9jim6UMkFjNlmzmCbHzotdgGyk/425MKkIC1ijNz0JE/fsgGrRArz/Vemhh94bEGnHp6n0iocNBlUFZDzeyjL4d5kP0Zuk+N2kfYJnkwvUXOs1v068/eUv0MdVEsDEojTTfHgl5vtyt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb86sfLW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb86sfLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789658516; x=1821194516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1my0mKupKeWOGfq1A9bOsjC4A+oqQMM8wHYqvgEgJ18=;
  b=cb86sfLWy7dTQ+Mfl8w4U8y2cBnce81937nIaXgxftrcnhGS6F3naYYM
   +BQhQHEa8RTVarxMfrqSN6DcA9w9rFq46w2EB3hr8YVqC0yiv6MvsQPe3
   7Cyy983dcOVGR+ul1wDiSFNpi6mBRXhncP7O48gNWBh+93CHHNMp3jJ+d
   0AJeugq7q6+FZOJG5B+wEj+swOydZ3Z59TzAwYUi0foilB89fZQxfnE2/
   xJDBqGhhmlEN+1ucKCDPlobkBmvjAwcW9QrG4YvtGCZ1x5vXd+LoJW1X1
   WQaJ9soJVnpUl6TDBppdHRt4kxsujmxtEbd0OVoNTq4UVFyZVxkUATSLU
   Q==;
X-CSE-ConnectionGUID: jfWgMTIETS+mPOQUE2p9PQ==
X-CSE-MsgGUID: OvFLUf6nS6mz0KqCAKWN0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92601156"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92601156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:21:50 -0700
X-CSE-ConnectionGUID: obDSdxvyQFOH+w/xlVo5dA==
X-CSE-MsgGUID: BopzksajRZOXxumN5KIH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270564088"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:21:47 -0700
Date: Thu, 17 Sep 2026 18:21:45 +0300
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
Subject: Re: [PATCH v2 1/2] list: add missing empty list check to
 list_cut_before()
Message-ID: <aqwFiYq_SjheX3T4@ashevche-desk.local>
References: <20260917125505.50897-1-zhangcoder@yeah.net>
 <20260917125505.50897-2-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917125505.50897-2-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 08:55:04PM +0800, Ziran Zhang wrote:
> list_cut_before() lacks the list_empty() guard present
> in list_cut_position().
> 
> With an empty head and an entry not on the list, it
> corrupts the list.

The kernel-doc specifically says:

  'You should pass in @entry an element you know is on @head.'

Do you have a real life example?

> Add the missing check.  When head is empty, initialize
> @list as empty, consistent with the existing
> head->next == entry case.

The room of the lines for the body of the commit message is ~72 characters
and not 56.

...

What makes it different to the similar cases in list_splice(), for example?

-- 
With Best Regards,
Andy Shevchenko


