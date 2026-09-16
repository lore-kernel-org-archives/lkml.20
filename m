Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25934E8DE6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556058; cv=none; b=VKtZo6YwuOw0kFG0IZ+XUjQrN4imonMTmqR/UshOGQtaQV1jLqHG9QXQ05RhPvJG7c3ZnO4QlzTrPsggFURvfvWaUSfz6IBgBYIsfaLt0HMukmm3BFoLY/UrCc0HvSecZ8U4NlzVTiM/WwlGpRNaih34iylRZg2xfEYfZZtQ/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556058; c=relaxed/simple;
	bh=m4X7MRZWd3cNk0VKYyFRiUeErjk5zJGY72sxjbNNxKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se3D6vmKnJbu2ZtolMCSugTJtYpKFgpBNl2jVYhDhYeqVpgIwqxGfMiBJZlXuxOWBiJhYA9ONTM0AaPQP6efjJms86QCgM01PaGd5iZzmz7zO+OUzUi/nfaYt+m1bfvVb95zWUyOpsYSvU1FtPqpmsrI1e7III0JLJWUTIlfdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETII8s4i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETII8s4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556047; x=1821092047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m4X7MRZWd3cNk0VKYyFRiUeErjk5zJGY72sxjbNNxKk=;
  b=ETII8s4iAi/buVGnMFYThsauIgUpejOlo/TTz9H/ihjzQpCVCBffTZuI
   uJTfYiLgtvrJUvZQhMvZy5oVBVdeXr/QHCRoDq4jdlMH+n5gAz7Xfp8xZ
   B997pfQoJWzru0SrSQ5s3PNATy0AeMsyyWTIkz6Tq8bYI9ya8Lc4wXz9A
   E+5ru2FLixhfmirNNHfZKGaBH602J2HfPGLXe+BDD+L8MhpvlTCy7iWoQ
   PGnt08v++U69b/GJwXVn6UhDu6uZ3OE1auU1mWbRFs2fSYDf/1j0Oy0YM
   F6f7hJM+cLMaZw8DeQyRQJm0yznwMAZ4hn4wiD7egw9OO65bapxvOBUZk
   A==;
X-CSE-ConnectionGUID: 5GNyxhHpTDKe0eczv6glBQ==
X-CSE-MsgGUID: R4LZ9wtrT5qfXHVYWOdoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92435977"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92435977"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:54:01 -0700
X-CSE-ConnectionGUID: 3tBVsHOyRI+fdT7YcSwq/w==
X-CSE-MsgGUID: QSVgFW3ST+i+qE11Rxk29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1528991"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:53:59 -0700
Date: Wed, 16 Sep 2026 13:53:56 +0300
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
Message-ID: <aqp1RMcCSBftjsyn@ashevche-desk.local>
References: <20260916100001.10634-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916100001.10634-1-zhangcoder@yeah.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 06:00:01PM +0800, Ziran Zhang wrote:
> list_cut_before() lacks the list_empty() guard present
> in list_cut_position().
> 
> With an empty head and an entry not on the list, it
> corrupts the list.

Is it IRL case or the code analysis? If the former, add necessary information
like hardware description (if applicable) and the important ~3-5 lines from
traceback (I assume you rung with CONFIG_LIST_DEBUG=y).

> Add the missing check.  When head is empty, initialize
> @list as empty, consistent with the existing
> head->next == entry case.

Nice! Where is the test case?

-- 
With Best Regards,
Andy Shevchenko


