Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436052;
	b=I1XJ18CyRI5dj+q6qZlR78KxzK3su5YwfssIKSE2a6CK9usF4HU7n/q/eFj2EMgDvboZ
	 hC9727LAFBCsnMWMVB5FZmaEX2T+KypjjJGtKTM7P/Is8uQLU38VjMTEWbEi4pR4FR1JL
	 tC9jsqs/Ty8m2NEHqdkS3i7UtXxXj/C/mPurmp8rc6JQi4E2WO6ZF2hcM0QGdj0YkGYR6
	 rT6oFgOf/GJOLkcr8Fti8S61C1t5HcxJuWNw3Kye4VPcNmbFFFIIXgE06ZFtErrngD8iN
	 Eo45o5W1UBC6t9qCDaDYRoZCcf4H9N99ic/42SqCshGtWpxl9OcBrwpCMNyIVBXOJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6svTTISeQUYx1ZIWsfbO5edWqBQzyZocELnYvruPeJQ=;
	b=pC7GTyGIKvApg0mGnpzysqYk/2nF3hFTf+nwiqLBKNcLkUIzD5NkJkDsMxtawjRX59Wt
	 F7lFgHH58PY2qGgfYjQ+AocqFkCEnkbYOj+4twMk18n7APkZNyH93zQhNvYz6bUV501Yq
	 1NFtWnYnnOB/R1EGxEZWuMkurG3IOnAUV9LFpGkTgEhz4ujw87ymfzEefMJyUjNyQgzIp
	 qlyA78MBhZ1E4CH1gVtCMDAzmxBXD6yhdOdDEnOciQBtnGxZNeG5svaFRNNGyVKzrO3k5
	 +ttWIcEYEulZxpVvP5b8VyGqkZHRgmMJdlsUifS32JCONgFla88eVem9D8XZakuEpFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LNZJGkN5;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3897606A31A;
	Sat, 31 Oct 2026 08:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3897606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LNZJGkN5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793436051; x=1824972051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BF/278JGTfk0RG+nqNh0X0rOdKPRj+r50jvDUKTf/J8=;
  b=LNZJGkN5fedasx/u5ahJXkPVl9/IPrxuqAP3zyBld8km64y73a01J4qi
   WWPAWivQaD2yNoBwehBW+puWITbKJDsFGNhips1ZoDzmxTTr8Rw5h7Be/
   3BhP/n4nb7p2YwY0DdL6wlPnylkphlkZy5hw3YXNsICycWUgKzEgAk7D/
   OuaNr6E5IBJ7MTXrmheO8hF2vIUtJMaES/xUMZY8kDOSEBrWPyonl8rDZ
   SvYrj4b1uUdP8G/NHTw2Jjg0AY7O3U9eNeCD0fQFGsSOp3LaAKFyhU/6h
   U6Nlm1WpPMA/f3WPirQBVh4PQenFcEDBVOHTBWdwZCvIUlGLv56qUqY0v
   A==;
X-CSE-ConnectionGUID: seBf/9a7SLygy5yT3URlxg==
X-CSE-MsgGUID: Ur5zWpxmQWOuAR7hXF5cwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2080793"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2080793"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:40:50 -0700
X-CSE-ConnectionGUID: GO8Lq7JGTfyf+TJ2wWyVRw==
X-CSE-MsgGUID: edkas0dCReeUBlowOcjoDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7429665"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:40:48 -0700
Date: Sat, 31 Oct 2026 10:40:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove redundant return statements
Message-ID: <auWpjhhTGEJS09n0@ashevche-desk.local>
References: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 07:33:04PM +0000, Avishek Chaulagain wrote:
> A return statement at the end of a void function is redundant; control
> returns to the caller once the closing brace is reached. Remove the two
> such 'return;' statements in hmm_bo_release() and hmm_bo_vunmap(), as
> reported by checkpatch.pl.

Usually we expect deeper cleanups for this driver, see [1] for the best
(so far) example how somebody can help with it without having deep knowledge
on the particular hardware.

This type of change has been appeared many times in the mailing list, you
can study the case why it's still not in the upstream.

[1]: https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurares@gmail.com/

-- 
With Best Regards,
Andy Shevchenko


