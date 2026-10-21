Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591925;
	b=K4iF16VPLRXxpKeRyDAt6fExsqYAeptA0HRF/xqwjy9yI1wUu5B1nrjCoX+od0KzXoYm
	 IOnYgAXSgAG5VGy8kLFN702hoxgu1EqVuss7I/6CQA51IUkVvBNIbEqcTsmMzsjiKyktd
	 AfbJ5A0kEsbMOQJgjAVxVrXUaWCnCtPUgZz3hoaG1qjUO8xsD+jCaYW5A9Wua+i8gpHqa
	 UCDjnbHKtFYU9ScwJ29qjDFbfPf/+zCbdEP2Xn7l5KnILESWG+6oECnkjcQs8W8yWQNdJ
	 wGTSm98mLDjkQhOUWi1yor/4cPXZR7irMy/BsyT/YSl0msqLa0gK+x8Z/2jzqrj3aFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591925;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=DOWxmOloLCk/GJqOypx8Y3q9hplaq5kHOPcwQodZKOU=;
	b=q3oyWkcZGsQM4J9A44xi4uaklev+ibe4AsYOLgGUoOv+crQ/9uAOvY+v0b1vmmVVCaSh
	 6baX6/qb6/dqKREbVqYkFFR6wYjb/G6b9Y+IxAs+gO4u4fECpVNQlx06VzDl2DTYqT2eM
	 CTPkbGCBMj/gEkTAhZYLy0hNTXLkRMiOYuZUQ/z0ONpc69socYyMup5W+tCZOhKCF3qhS
	 id3eVdJDGRiAwicvo86+1OLJkchRaNYxAAK1ZkgVJpydf/P/9v3Nr2pB/YavliXy8W7bg
	 SaF4VqA7DYP/DeGOP9WRUWkWcJdAvkjzfCt+zxqHSOdZtgSy0FIOlKHoFY/6MgGQ4aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LsE8vsUk;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5589606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5589606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LsE8vsUk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792591925; x=1824127925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJKxYhaYT/D6ARKKkl8F5Hfoq55zmQgq9XXbQ1YEi2M=;
  b=LsE8vsUkX7p5V4BMsXEQqY3AqB31A7aX+GKkFAvKkkjyi33fSBwXGKMD
   Aa4f/HY7Ks9G6JISrkQ8KUFxjBYZLdkLcVRJQfMBnyxQ5PxE7ot8L8Bw2
   TGNA/LyaKyYNHzyR7UbFKAUzHrtm6B9p03WZeItZUpAFovTR8AZW8O/cC
   W5sjUfm6i0nUrpbbXjFX3n1l7V9ckQjSU+KQKb/S+gSJiuDv7GfCrBo0c
   dcTcFdJVasGPy8Knqjk8KWeS84rW/czjt9ib48F5t9bzojC8CFKACG3zk
   InM88TDlT1sT/bJFk/KSUrC/EqDvrSyEqxai2sHUYohrBybsVcIj02URs
   A==;
X-CSE-ConnectionGUID: Wv4jT2f3SL+Ce5XeUIxLWg==
X-CSE-MsgGUID: QsQKnTq6R122XI3pE8OUXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1191249"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1191249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:12:04 -0700
X-CSE-ConnectionGUID: VPNVsHxhTpO/0dHMJoIszg==
X-CSE-MsgGUID: CX78PQI/TpyKZjQHqnempQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3566801"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:12:03 -0700
Date: Wed, 21 Oct 2026 17:12:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/vsprintf: Preserve the sign of seconds in %ptSp
Message-ID: <atjIMG_BiztTvRay@ashevche-desk.local>
References: <20261021110628.37106-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261021110628.37106-1-dennylin0707@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 11:06:28AM +0000, Hungyu Lin wrote:
> The documentation defines %ptSp as equivalent to %lld.%09ld, but
> timespec64_str() formats tv_sec with default_dec_spec, which does not
> have SIGN set. Negative seconds are therefore printed as unsigned
> values: {-1, 0} produces "18446744073709551615.000000000" instead of
> "-1.000000000".
> 
> Negative values can arise from time differences, for example in
> fnic_get_stats_data() after the realtime clock steps backwards.
> 
> Use a signed decimal printf_spec for the seconds and add printf KUnit
> coverage for zero, negative seconds and the signed limits.

> Fixes: bccd5937447f ("lib/vsprintf: Add specifier for printing struct timespec64")

Should we Cc to stable@?

> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


