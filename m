Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4CF4E06EC;
	Mon, 28 Sep 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606019; cv=none; b=TwVOFAKZSMtKuCu9I6NQkRuaobpdOanrx75qolua7QhFILh85W9rEwaPHy07jRrovM26bE6T9ryMlOgeAuDa3kV1BXm9BstfvMCNII3AIBHsx7pwnLa3kWyN/E2ZKe/TR/RjFDawfzhd0z1K1eLuqly8ScsUlEuMW3ks2k67b5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606019; c=relaxed/simple;
	bh=HPS5uK+ZJd3KQXIVlhPORKHhKQtshiOTXo/yHj3VgMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujsHfmJpvtspCEZfZ5QbYglABjqXhJyOGZdhthjz8mN1U83rIKfG9UNMx2LQ21p3+IWE+43+hg32VMHrXU4IF+xvgEwjBR7F91xT1Gg9EojN97kDs3FYMEn+F/F0lJ+VDXvEDAuIF3iJGxMdLfzqdoPr5KcCLpsoGtuZLnBQ9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXepms0e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXepms0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790606008; x=1822142008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HPS5uK+ZJd3KQXIVlhPORKHhKQtshiOTXo/yHj3VgMQ=;
  b=QXepms0eaaJySR3FWTOd3c0OxlJv65vEmEdzkkcY51icv86Z9iuoH5pD
   4q8wleZ4ZPaICdVHKM1lmjyhTf1EOHzcZaQMrE2oKtQvbzs3QcPpN1bBN
   6hLN8b0rQtgHCfwjljKOBAHrOfxfnd8COJf8L8GBxrf1+Q6KvkA5uOW0N
   rQCjiVjNC9dVH5AaH7MDjhYphEf/NZjCxDZhzA3Ws+au9fAc0VBSDzb93
   vjXA9rzsPv34KRTZrjDrRE5rvbwq1d7PbcFTOzV6oFoFUtJ4ZFjwn2X0u
   YehC6+AYxYDukQ1t643xjiAakwl0/4qrih2sJlncdqxuf86W8hw+V2lIF
   A==;
X-CSE-ConnectionGUID: RJN0P+YuTmKK2UkK8OOtHA==
X-CSE-MsgGUID: dD2SW+qNS++j4RcYiX//lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="113091583"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="113091583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 07:33:22 -0700
X-CSE-ConnectionGUID: hDklSZ8nRUmIdMTETvtOqQ==
X-CSE-MsgGUID: hbENvKVRTAy71HqqFUt4vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="273215947"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.134])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 07:33:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53393121840;
	Mon, 28 Sep 2026 17:33:23 +0300 (EEST)
Date: Mon, 28 Sep 2026 17:33:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: hi556: fix power leak on remove while
 runtime-active
Message-ID: <arp6s_vpgXx9RTMY@kekkonen.localdomain>
References: <20260928135140.2354361-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928135140.2354361-1-congnt264@gmail.com>

Hi Cong,

Thanks for the patches.

On Mon, Sep 28, 2026 at 08:51:40PM +0700, Cong Nguyen wrote:
> hi556_remove() calls pm_runtime_disable() but never hi556_suspend().
> pm_runtime_disable() only blocks future auto suspend/resume, it
> doesn't force a final one -- if unbound while hi556_set_stream() is
> holding an outstanding PM reference (removed while still streaming),
> the device stays genuinely active with regulators/clock enabled
> forever after.
> 
> probe()'s own error path already shows the right pairing (calls
> hi556_suspend() when powered on). Do the same in remove(), guarded by
> pm_runtime_status_suspended() so the common already-suspended case
> isn't suspended twice -- same guard sibling imx412.c's remove() uses.
> 
> Moved remove() after suspend()/resume()'s definitions since it now
> calls them directly.

A few notes on this as the rest:

- The quality of this commit message needs to be improved.

- When you're sending a bunch of similar patches, please send them in a
  single patchset.

- When moving functions around and then making changes to them, please do
  this in two separate patches.

- If the device's PM runtime status isn't SUSPENDED in remove(), it needs
  to be set SUSPENDED using pm_runtime_set_suspended(). Please do this
  while making other PM runtime changes to the remove functions.

I'm marking these as "changes requested".

-- 
Kind regards,

Sakari Ailus
