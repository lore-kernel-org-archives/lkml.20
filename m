Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9C443A88
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543555; cv=none; b=PBtlu1k1ejQ3w/FLNphg6DDzBQhpd/s05sUWiSgBZWfI6aKClnnNj2li8BpXx18SSEYSx6VJ+4CyH+RVPdBySAA6PtmakyCIMGxRBcTBRrHtXoPrEjMTTx52ZO/DCgEMrUPbzE181lKjyb9119fefoSDsueZSk4TTNp0gIcLoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543555; c=relaxed/simple;
	bh=oQP+u4JD3Tz5keSnn55jVh1FaFdJ9BK5OQaBPfBOUpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYHQsfvp0HmrkpIHBb7dS76T+iRrcWLTvubbPecvYU9bB7M66HJ89KlZ9BK+cNKZ6rD6noj+g3JmNX2kSZUAd/Ba31810VvNkzoQ22H+JGJoJMwv2JFWzr4O70pIZhu0Kj1N7ZJP/AXYFSPI6sRTzNweujJ2HOys8K5rN4jm4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYr8L4N/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYr8L4N/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789543550; x=1821079550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oQP+u4JD3Tz5keSnn55jVh1FaFdJ9BK5OQaBPfBOUpo=;
  b=jYr8L4N/4ho3+lPFxfB1vITEN6twbCptDLUl8NiafoYkcH8UZGJzrd3Z
   iIhDXTibL6F9E8nhRi2ZPF8XbuN93Yf1vVi327foyqUMOvQmAJElyP4+2
   t512ivTZlccIcWPzPFqUcqtHWNdd2KnylscndIC1reVp6FZnb8MOqoFz/
   PQSMVgI9an63vLjHe8aQ3R9WyjbHaAVewyhOEIejomoMS8cnJH8xsIErs
   TR44eKhMjqJl75DSVT8FcfxLbCMQERh+agFccAyHP+KOW/BBZNS4crZ7P
   lHwYZARSoMRiFldB3Uqx2dNLO0JVCOLkV+dNICpiB90zPfafCoePKnEEp
   Q==;
X-CSE-ConnectionGUID: egiCO/njTLSL0XF5YyINjQ==
X-CSE-MsgGUID: 0frx5ew3SMm+eCO/tzOKMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89959160"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89959160"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:25:47 -0700
X-CSE-ConnectionGUID: nTnSttqCQES/gWJVAsRRsg==
X-CSE-MsgGUID: A0T+wDLMR3WnLm9aCFqeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273222953"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:25:45 -0700
Date: Wed, 16 Sep 2026 10:25:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <aqpEd2uG4IOFmw_L@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
 <aqpD4q6jMw2FdArD@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpD4q6jMw2FdArD@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 10:23:18AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 16, 2026 at 03:13:35AM +0500, Maria Lisina wrote:
> 
> Thank you for the update, my comments below.
> 
> > The DebugFS API is designed to handle errors gracefully.
> > Any explicit checking on return values is considered an anti-pattern.
> > 
> > This patch removes unnecessary error checking and converts
> > intel_lpss_debugfs_add() into a void function.
> 
> Yep, these two paragraphs are good!
> 
> > While at it, this patch also clean ups legacy and deprecated usage
> > of S_IRUGO macro and debugfs_remove_recursive() function.
> 
> No, this should be a separate patch.

...

> > -static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
> > +static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
> >  {
> 
> > -	struct dentry *dir;
> > -
> > -	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> 
> > +	lpss->debugfs =
> > +		debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> 
> > -	lpss->debugfs = dir;
> 
> This is unneeded churn. Yes, I understand that dir won't be used, but if you
> really want to refactor do it in a separate change.
> 
> >  }

...

> >  static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
> >  {
> > -	debugfs_remove_recursive(lpss->debugfs);
> > +	debugfs_remove(lpss->debugfs);
> 
> Hmm... Why?

Answering this will give you...

> >  }

...

> So, if you really want a refactoring, split this to up to three patches:
> 1) drop debugfs checks along with the warn message (as your initial goal);
> 2) replace macros by plain octal values for the permissions (optional);
> 3) assign debugfs directory directly (optional).

4) replace debugfs_remove_recursive() with debugfs_remove() (optional).

-- 
With Best Regards,
Andy Shevchenko


