Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667342E414
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235748; cv=none; b=sQmMYbKokzbnRWjZwc4Wgr5K5jFrJMm/j1jaaxoEmvuLmBmAxR8EHMVT+vhaSnjHpcBJeAJ8YUH9Y06IPrPwnn16jD8mG6AtNSSoFp075ANJiWnfFnF2DhSNSDHDB9yMubu7xOB4QzyNtxDNvaJ6i/XeEesXsP/YIAqy90ClhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235748; c=relaxed/simple;
	bh=q6ZjB7k23vKZB0rhd1Mo/4yWSK1OW+n2Z0uzPd1vkog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqEbcjkPVYy13GVfVJ6iUZt5N705bbHPzjxrGvUe+ZEMNnhmn4JIeQR822BhkvBlwjgjdDMfcHM1H9K5AwCp1vMdtT6OqGO9TmTBVRKvX6+BPP92jWk0qQeo3gknM25e5PzlZxko5wQiDymuuDfw0nyInuIwqnIfpzzvvLP4G+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLg6rw72; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLg6rw72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790235747; x=1821771747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6ZjB7k23vKZB0rhd1Mo/4yWSK1OW+n2Z0uzPd1vkog=;
  b=cLg6rw72JtZVXUf+CbTIERj50GOCqkYiDJaVpV9d+RpQ6zVKsuHNo9Hc
   FyJWvIiutBnse++50pf5dXPhbshYQbWLgxJHiDnXQ4NVaJwJWMQTYyIZu
   T4VpLwPSjOvjRDx/3U2f1Ro4T91XSElAIyUfhQWTMc7seay1azW/Y/xxd
   9Ygax7HTB+raM8tbTI1fpydfmTU6wdS9oIo6qQq0P0zSeMt13XW3eXozM
   xiuezrNm4enWJxDflU3m8kvcQDYHWrPyrYtwFVibrYeekrHvk0F2MHEC0
   vvfTuZGgWt9KktiRTvTBbF6zoyOl1HedEZRxNTV548GEoAqrnVQqodOrP
   g==;
X-CSE-ConnectionGUID: SJcdkpm3TUSCy27FzNI44Q==
X-CSE-MsgGUID: YzegjhfjQceOSMohO8yUjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91015393"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91015393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:42:26 -0700
X-CSE-ConnectionGUID: H5s+/T7wSdq1ncR9d4RMLQ==
X-CSE-MsgGUID: RubZmy2jSoG0Tp2D4vwD1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277325836"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.13])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:42:23 -0700
Date: Thu, 24 Sep 2026 10:42:20 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove console options before decoding the
 name
Message-ID: <arTUXC9zpqZhrPTP@tlindgre-MOBL1>
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
 <20260924070153.250783-2-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924070153.250783-2-david.engraf@sysgo.com>

On Thu, Sep 24, 2026 at 10:00:57AM +0300, David Engraf wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.
> 
> Fix by handling the options first which will add a NULL terminator to the
> string and refactor idx handling to clean up the code (thanks to Petr
> Mladek).

Maybe clarify the above a bit to make it clear that the refactoring is
needed for the fix. Something like:

Fix by handling the options first which will add a NULL terminator to the 
string. Note that parsing the options first means that also idx parsing
needs changing. Handle the idx parsing by refactoring the code (thanks to
Petr Mladek).

Other than that:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
