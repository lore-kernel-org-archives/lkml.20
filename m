Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549313C9429
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711573; cv=none; b=bfTeh+7Mj28EHGx0Yf7pOnqFYJfbC+qFIXch12C9faz6jY02Z3o9SSAhVc1fLWpDnZX+xsRG26Nfow+p00zqMb/Ubzju5nkVchT+RwA6rkECCqNzHvtRquBbNqxIxUmEfQvviTT5pZzSu8xXc84hrxHnsxk9LJL47NPtNMEM2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711573; c=relaxed/simple;
	bh=UEloR02Cs6Sy3DDSPGUGj81ZJcRLjJI+Tqpr0v5reZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVSJJuxDu5SK8RALBk9WWlEoeuqVOWuUXadf54IjYi1P1H+OkarqpspWcI/w6Vyab+8ROmJ+uOYgiCdavo8AoUmy5lZhETozlcP4t2p3nWLMH5FCSYwGPR0cXdzwbYSWXkY6nRYoq+ukuwev/yaAYkQRjjBCKe9WPpMR9+tPn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0vrWfnl; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0vrWfnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789711572; x=1821247572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEloR02Cs6Sy3DDSPGUGj81ZJcRLjJI+Tqpr0v5reZA=;
  b=X0vrWfnlzkGs2/kVBYo0xK0YKgkiGm8WWt/m2/+ugNZgTtmifqQ9CPdB
   0h/BuPT/+wX2VgREfCE9B5EowZzbYV0GTu+9RZpf0Okucklr1zOG4vxtp
   U6EnXLtVODvdmyh9f+GezmVahqK5nsSc9bt0KZi93Z30BVhudowdrrHTX
   VaLIv3SiLe4zo3u/10cnGfwDyoh3ArOYCsJlCkf2ZNzNq3h3Ol4BUYK8H
   bL6jFGFqySeDSR0FOQSp65ygaJ/aw6C1Iy4OoRnIxcic/NRKA8Y7gx86I
   lsgEm3fZsSzlj/GITKa+5HBTXiwB/BcwJYGcMjI4GgwXjaBXMk/O2Tqua
   Q==;
X-CSE-ConnectionGUID: +GS5MaQbTKuPlFMxFqhTvQ==
X-CSE-MsgGUID: IyszdtyyTTqUJMYlEWXCdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="697656"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="697656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:06:11 -0700
X-CSE-ConnectionGUID: jh4zobi+T9y+IHUswoFMzQ==
X-CSE-MsgGUID: Pu0UCSVBQQCzOMuwwb2oOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269931900"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:06:08 -0700
Date: Fri, 18 Sep 2026 09:06:01 +0300
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
Message-ID: <aqzUyZB3wulN_W3f@ashevche-desk.local>
References: <aqwFiYq_SjheX3T4@ashevche-desk.local>
 <20260917161456.9181-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917161456.9181-1-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 18, 2026 at 12:14:56AM +0800, Ziran Zhang wrote:
> On Thu, 17 Sep 2026 18:21:45 +0300, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > The kernel-doc specifically says:
> > 
> >   'You should pass in @entry an element you know is on @head.'
> > 
> > Do you have a real life example?
> 
> No, I do not have a real life example.  It was based on code
> analysis only.
> 
> > The room of the lines for the body of the commit message is ~72
> > characters and not 56.
> 
> Noted, I will keep that in mind for future patches.
> 
> > What makes it different to the similar cases in list_splice(), for
> > example?
> 
> list_splice() has an empty-list check too, on its source list:
> 
> 	if (!list_empty(list))
> 		__list_splice(list, head, head->next);
> 
> list_cut_position() does the same for its source list:
> 
> 	if (list_empty(head))
> 		return;
> 
> But list_cut_position() has the same kernel-doc wording:
> 
>   'You should pass on @entry an element you know is on @head.'
> 
> and still returns early for an empty head.
> 
> So list_cut_position() handles an empty head before doing any pointer
> updates, even though the kernel-doc contract only requires @entry to
> be on @head.  My patch makes list_cut_before() do the same.
> 
> I agree this is a defensive change, not a bug fix.  If the consensus
> is to rely strictly on the caller contract, I will drop this series.
> 
> For list_cut_before() specifically, making it match list_cut_position()
> seemed reasonable.

Please, summarize the above and elaborate all this in the commit message
in the next version.

-- 
With Best Regards,
Andy Shevchenko


