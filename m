Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E257C715
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653798; cv=none; b=QXmvC/qkWSFepTzRR7qpB9fGpFJFiVaGILtm3VaQfjfIjTmw43UmFs0kbCtbinMc/BtnBwCfz4epfMCwGl+FEiT7alr9fPyesvTNTpMh8f/lj6no6fJdrGwqLG4dcfEjshBPc8sbGOXlTMS83Al/Tpc6cJD9vPePIrk8E96NDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653798; c=relaxed/simple;
	bh=UbmtoRcQhGI6r6gk3HqT124AFhHJf8sbcEvBw8bmEJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXJE26k9C8P5ZiHuDU14WvvxlqXYhnArbHFuwuU4E9vRc4FO79Pvz49H+T/TPf3SPzFajQiH+bjw4oI0LwlSU5faYwm0HBrNSKLFRk7zaGiRAxRHdAQQqmkzFBYrOPaE5Q/MjKmFz0iuVvozbe/ttF4zG9AYwzFefMxzyzVJ+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW44A5W9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW44A5W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789653797; x=1821189797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UbmtoRcQhGI6r6gk3HqT124AFhHJf8sbcEvBw8bmEJQ=;
  b=DW44A5W9T4L9NTRnQB3d7u5kT24PFFN3noR79JK+y2NkyU6GmKZFAIK4
   fk+sfIOIxpI4ol7+V6Z0euh9D7bppty96Ds4krjO44x/bk2cm614Jz0ak
   D0Iut1GTvXPgHnL9W7NQcX+Cf5fQUsrOSKU8IFlX6eUfBWayHlnyKmgNT
   5LqtRz4dio7y7XohmfXMd2ZdZfYd76VsPUVP7HT0QcGrBBpXBzlEX41RM
   220ho18vI6La7w19uVcPDDuhEY+yttBs/Fb7azTEypQOmz22afA2FfSbW
   LEtrcqT8slwol7yByhjQsfQnIarf6I0QvFR1TAVWFhy+MKHQ6mlXkwvqD
   Q==;
X-CSE-ConnectionGUID: nkq66FjBSIO2h2ZyrKCQzg==
X-CSE-MsgGUID: 0pl/L1VeTYW3q5KLMELmBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100674391"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100674391"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:03:16 -0700
X-CSE-ConnectionGUID: oRv6ED30RkivZkkjjXAfSA==
X-CSE-MsgGUID: Efotv8S7TkyMYsj349Uc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267571221"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:03:14 -0700
Date: Thu, 17 Sep 2026 17:03:10 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <aqvzHtWzLZBFY5wk@tlindgre-MOBL1>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917060754.37315-3-david.engraf@sysgo.com>

On Thu, Sep 17, 2026 at 09:05:51AM +0300, David Engraf wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.

Just curious, which console did you hit this issue with?

In any case, thanks for updating the comments:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
