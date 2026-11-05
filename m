Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870798;
	b=p3tckwUxHsO5MDviEdGEaF6BlV6IoM/oE+nPBjiq+83IxAl6YjELPB0lyy7TuaPPx9Fv
	 q3oepvmc5gBytVJKKx8w+lfiAVdOpeLhlIxGs8ib4sHoBPDj7mEdGLwOT8iFuiRyX6Tix
	 wnVPdTqg05z64loAEkya+18XL4BjCO+VvhA7YMOdE9k4oJLflaVeSXwd/n0UeL5tAKpNU
	 C/lic8s2r3hLi5koGmWyyrtM28xv/DbvFfvxWrLSVHhikuNIPPhSiO2genW0P3105hTul
	 aMsBoQNxRlDfjdefadjaoA8XRbXaNChjCBmcrm6fuywvpC4Iwlxy4Jws92dpaNyH1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=NtkrILUGf/nvkIn8ZHAAFeGkoeBwy8D5sSoL52f0eEg=;
	b=UBiNe+EgBCKcxqU3IjlNvmrywHgt1OENlLZkAb6b9D3AI/+WA92QIDljHurguGw4x3XN
	 uOyXc474hjDcHIHmeP1h1gkjcd5qin3785tl/HajC6JnSkSEm0BIq2qMNhk7ThnQsjba9
	 1vM9s560Cg4hQnJNGNVWPrOa1JEFROnUaKDutFxb4a92VhiiWK/ixA7NJ4JOjDcGR7er7
	 nQF6xuxSbwnw7VQiL6ogqegGBZlApUxmfnQ6+eT1YXR+H7pKs+Ehu2x9kZAL11vI/FA+7
	 VZ+6buidxCw8kzD8zrL4DjsKXufsU/ZIN0uZyD+S5DfNJgN2b1u+vTFg8S8/qYVj8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6XmLm05;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A5606A31B;
	Thu,  5 Nov 2026 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6XmLm05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793870798; x=1825406798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ktfdzqD84OijbhUvLsS+l/5tXhEGShY8wNnNh7b07Xk=;
  b=O6XmLm05vpdpS6iWpdNstSE9xFe0Hpx7Z8Feh2KTXuJCcqdZjT5Qr5Gz
   2HzNLkUD3C0ky6UZzVF4zBqGv8m/K4IH8MpQMx6gSDW1dDmFnxmtJI/CZ
   yM8CeOQJDvmmMmu0qESCh3fhfoUmULCxtWOR7T1zquiCQdXrSFRcjxn82
   Z6yLvJaYzelfuGU0LiBz8cX/uOIdcaZD5XF0NqHEJgzaR3SauZJSKZevn
   hRRssDgVAO5eOkV5UWEz1MHwpsoXjTb0c1sWox52dpiC3pMQzRo4HacIU
   FYq1LZLSmTeZ9UlroNqHBP8uzsCMaIcTDvb7/gF3cce7lQAmXOwVl+QSS
   w==;
X-CSE-ConnectionGUID: NDdwBDT1RVG72yekPTBAtQ==
X-CSE-MsgGUID: FqPRx8+4QwmcNpT0hxYvhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2551483"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:26:37 -0800
X-CSE-ConnectionGUID: bkATDqLmQWGkxmw7oZjk4Q==
X-CSE-MsgGUID: sCDUJk5xRjeOB5NN4TzEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7072608"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:26:34 -0800
Date: Thu, 5 Nov 2026 11:26:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxLyK65Ycr7R9Un@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 10:12:00AM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 10:06, Wolfram Sang wrote:
> > 
> >> Reviewed-by even with the "# subpart" still appears in person's credits
> >> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> >> patch) is not the same as 10 diff codes for one driver.
> > 
> > Yes, if you want to spoil that, you'd need to introduce
> > 
> > 	Partly-reviewed-by: ...
> > 
> > or something.
> 
> Ack is for that, no need for a new tag, quoting:
> 
> "Acked-by.... user may not have carried out a technical review of the
> patch, yet they may be satisfied ..."
> 
> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> found acceptable according to the Reviewer's Statement:"
> 
> Note that there is little sense in reviewing - as in statement of
> oversight credit review - pieces of patch in context I discuss here,
> e.g. one big complex rework combined with updates of drivers. Who cares
> about the drivers? The complex rework is important and should be
> reviewed, but people skip bigger picture and put their stamp of approval.

Nice, and what as a particular piece maintainer I should do if somebody
created some helper somewhere (not Cc'ing me), waited to a cycle and started
cleaning up or refactor the drivers based on that API? Basically I was stand
in front of a fact, I may tell NAK to that, but what should we do if half of
the kernel will use new API, half will use old one due to disagreements on
implementation, naming, et cetera? Rb in this sense tells that I have reviewed
the refactoring part that has been done on a piece that I'm in charge for and
it looks good. Breaking the flow or behaviour might have been done on the
upper layer for a bigger number of users.

> Stamp of approval is Ack, no need to mix it with reviewer's statement of
> oversight.

-- 
With Best Regards,
Andy Shevchenko


