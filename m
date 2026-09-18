Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84533B6F4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716815; cv=none; b=tdlH96Jj55aIMXbb7f+DglqKpQXsePG462rCUtS1GaqvSHFsjlypF9C5vAXvh10QVnt3NE4i4uq/nhDHfQ8zv/Mom0FHBSx70LnWEMXvZS0W7y9AsKQooh3ZLSVBrtU2BUhnUlU3ZruFFwEaw5Q/m0X0ukoiKRyTWRls2Gf9+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716815; c=relaxed/simple;
	bh=SURsjIbMS2MD+1UzMQJz7yvtTgI/3JtC4+4e9nyPsh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJmbTeeyHYclD+g/yT7p8WDJePoR4hz95eJO+7MlCsuOK5iPZVdkaNBPiq1HcS2p/QkQfeHxUkgW3+yxddjRj32F0zpHrUKPQEfLUkh1Yer+Rw4ntB8pKAk+rkm6f5m/cZkvD27UI8BabV2UqVdjTa2cLUn0d96s8fcpKK/RNOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efzPzZHB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efzPzZHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789716813; x=1821252813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SURsjIbMS2MD+1UzMQJz7yvtTgI/3JtC4+4e9nyPsh0=;
  b=efzPzZHBC1ipxqTUXdokR4GUt5f/AD3/X1vgfFCLOXndpVkoPmoIvox+
   SE5s0VfwlQ/QQ3nnNAYqa15QtZiQFH84n3LZfMhSryr6+9ETiR0MXiOrX
   qvgTFctd64qy8HmwbqdjPLbtw3z5c+PMinuBKoaebO64+6pfUbboaYVIj
   l9gbGLFW3wVrJAsEg/NBPPgL8hUGcFYycp5IEyEx+sxpMfnFDXjVHnjY7
   BmceKQork5CL3to+oUibcn2mkpIHJcVsm/DfOAtAUdeZqB3a4gJb9iZGq
   zGAX7lyVczjT93AnK+PJqffBTodCxr/z16R192bJvo4a6wqJRfZ8BOtST
   g==;
X-CSE-ConnectionGUID: 8TQDJk3JRHiY9o3G2G7C+g==
X-CSE-MsgGUID: 9jNuUyD1Qpqd/Z1NoP4ABQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90068741"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90068741"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:33:32 -0700
X-CSE-ConnectionGUID: vFMbEMuIQTqkqKDmddFS9g==
X-CSE-MsgGUID: svWvaB+iReu+O2zGVauD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2457732"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:33:29 -0700
Date: Fri, 18 Sep 2026 10:33:27 +0300
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
Subject: Re: [PATCH v2 2/2] list: add KUnit test for list_cut_before() empty
 list case
Message-ID: <aqzpR8diXzWigmYD@ashevche-desk.local>
References: <20260917125505.50897-1-zhangcoder@yeah.net>
 <20260917125505.50897-3-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917125505.50897-3-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 08:55:05PM +0800, Ziran Zhang wrote:
> Add a test case covering list_cut_before() with an empty head
> and an entry not on the list.  Without the empty list guard,
> the call would corrupt the head list.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(New test cases, when they are desired, have always a green light!)

-- 
With Best Regards,
Andy Shevchenko


