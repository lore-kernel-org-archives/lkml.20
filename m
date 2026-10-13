Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D75521207
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924089; cv=none; b=GIC/u486GSivG4ibw5JiZDpcC8HpHMxhy14UHNznT4AjrC6gwzt68ByLAk2NHTvuAMMZywzdsB62CmK4bugl5jEQXSGEaOvce76DPzFgzunIpZO45dTafHDOuEH5v8Fx+3aDQnHTEhoffhEPlKvRgAJjUl0Mzd5tUox+YpSI9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924089; c=relaxed/simple;
	bh=wvfWH+QJTkRnPqJKdcdsA70fOCFk5+tEIxUuMj2YLoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syphA8bHwPy45KnbPqP5NOnwRw3Ha+lRSotPepAGbnFEDPs3GCV8RG/AKIzUpPa9P53B+0Z49r4H3bLi+2UqV3IVNL12I5J08teuYkoOgwrlaxdTvWwCXS2B1X+tLFyGdUbkUnPfARgfEWb8Vs0OnpDPYfMQ+v5cd9xik7feITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4qhHO7g; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4qhHO7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791924086; x=1823460086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wvfWH+QJTkRnPqJKdcdsA70fOCFk5+tEIxUuMj2YLoY=;
  b=I4qhHO7gIRsJ+7iMUXj8tJEmKW5VGC7toxH08HL2nPbJcGEulku1RBZl
   j0Z7BGDe8DxKkW41d1dJrsHF2G7T85KEskiNm+i8zHgj6HvoHQShZBzlt
   H5S4f/sUcZuI3wkU7TaizGa2u56+CsjMFd3Z3IaxXP4x8MBFLiDlacRY/
   N4bkNk5eZqijyxKGGsA19j65Mtp4Trez0QtuL9MZ1OPxHu3/VBWvEFbcI
   0VyqvLYUxaQOBWSza8HSjKbeVhRoZJzS1PeRdlhw3nH4e+3hw1w30G+GV
   MZ1qhYJEf70KQT4IowswsEmBNxlsDGAfl5skQevXeM6h+zv1UE2u3jrVP
   g==;
X-CSE-ConnectionGUID: 6SPleMAWRNe+sO41HLterw==
X-CSE-MsgGUID: 5zsZN0bXQp6dSgpfPZlNvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="671492"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="671492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:41:25 -0700
X-CSE-ConnectionGUID: Gc5No3pUSm6Vfkp14o2KJA==
X-CSE-MsgGUID: b8EKutncS/61izjqdtwlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1283468"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:41:24 -0700
Date: Tue, 13 Oct 2026 23:41:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] lib/vsprintf: Use EXPORT_SYMBOL_IF_KUNIT() to
 export symbols
Message-ID: <as6XcMDhDGoCHYP0@ashevche-desk.local>
References: <20260714122143.743227-1-andriy.shevchenko@linux.intel.com>
 <CAJ-ks9ky8BxXmmZQ5aayyXtzQsWF-Bpxxs_+-=pUM2uT4shAyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9ky8BxXmmZQ5aayyXtzQsWF-Bpxxs_+-=pUM2uT4shAyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 14, 2026 at 03:39:23PM +0100, Tamir Duberstein wrote:
> On Tue, Jul 14, 2026 at 5:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Replace EXPORT_SYMBOL_FOR_MODULES() with EXPORT_SYMBOL_IF_KUNIT()
> > to mark the symbols as visible only if CONFIG_KUNIT is enabled.
> >
> > Kunit test should import the namespace EXPORTED_FOR_KUNIT_TESTING to
> > use these marked symbols. This is the standard way for all KUnit
> > tests.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Tamir Duberstein <tamird@kernel.org>

Thanks!

Petr, does this fall in cracks? Can it be applied or do you have any comments
on this? Or may be I missed something?

-- 
With Best Regards,
Andy Shevchenko


