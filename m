Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B933E123F;
	Tue, 22 Sep 2026 04:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050283; cv=none; b=f1cYKUQjrWcUyijHq6+AOzoqfr2govNfUbmJs9645QhF+Sruvg3GnAN/bvINNZZ9K8G+3EJcXcgn2n1s6eMY7dqRZyWm2YXsRZUmso0+ub9z5mCGOh+k3jS4wf9WduCEvZJ3V6o/AdFpij/0Ujueluu03QH/GEhkLdivXwjwJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050283; c=relaxed/simple;
	bh=fFsVaHpUJI+QU9Ho+BfwDVekjM5QPRLw2Msse0Qdk28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVMTOhqMn8dYXkQeabhEJckhQGjvubNE2cmkzq/lnC4g5F09lKZ5AOANPXLyji+IYLErFTZeLWEvlSGD1rhddhszDn1GQJuTkWVbYVxylPWBqw7t9J1ekXjTjLFq5hisp3JJ1fO+nQZ+5LcFiiG8xMFMupjWGYaltF1LMFXDL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbELCuYz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbELCuYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790050282; x=1821586282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fFsVaHpUJI+QU9Ho+BfwDVekjM5QPRLw2Msse0Qdk28=;
  b=RbELCuYz7S9XwoRnP0p9sHcq8qsvI+wPas1g+V5PzTqwOrErMXF8reHD
   FrpemYDTM8Lf5OCJ8raAaWwpZk9RkoDwT3YhZnlhs5vEc56p2v+IihT7M
   T0suStfFBGZinMCRMc3pF+MP4gSujX/GAlRcA0A5WMPjXzlq8J4NSgBrI
   bSgKWRKBO/fHrOrQkriPAec/eysIfebYqAfZG5RWPJQvr6NKpOW+3Z5g7
   L2e+fm1WjBDi+vygZKPEFkmsjEC7brpK5dDRg/WvvsRDQty23wAIF0LWO
   mYEvkm8IKQgtn8UKiPam+Jj3pouMwnOd1K6OfiUvbtoYsea8Kw76tQNMI
   Q==;
X-CSE-ConnectionGUID: 5uZJYq2kTVCt6M+80U0pOw==
X-CSE-MsgGUID: P0Gryag/Tf2ZP3+hm54Ygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89754381"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89754381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 21:11:21 -0700
X-CSE-ConnectionGUID: U8FTD9nfTFWj2CIZG16ZJg==
X-CSE-MsgGUID: x+w5ldHnTyyTiq5abmunmw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2026 21:11:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1C48499; Tue, 22 Sep 2026 06:11:14 +0200 (CEST)
Date: Tue, 22 Sep 2026 06:11:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: stream: Make read return framing error to
 the userspace
Message-ID: <20260922041114.GY106095@black.igk.intel.com>
References: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
 <20260922001742.14332-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922001742.14332-1-skunkolee@gmail.com>

Hi,

On Mon, Sep 21, 2026 at 06:17:42PM -0600, Ivy Lopez wrote:
> On Mon, Sep 21, 2026 at 11:19 AM UTC, Mika Westerberg wrote:
> > +                     if (!nbytes) {
> > +                             pr_warn("corrupted frame received, flags %#x\n",
> > +                                     sf->frame.flags);
> > +                             tbstream_dev_consume_rx(sdev);
> > +                             ret = -EIO;
> > +                     }
> > +                     break;
> 
> One question: EPOLLIN is set unconditionally in the rx callback
> regardless of frame flags, and tbstream_dev_fops_poll() only checks
> tbstream_ring_available() (pure ring depth), never frame flags.
> EPOLLERR is used elsewhere in this file but only for device-level
> invalidity, not per-frame corruption. So userspace still has no way
> to learn a corrupted frame is queued via poll() before calling
> read() and getting -EIO. I'm just wondering, is this intentional,
> or worth a follow-up?

It's intentional. EPOLLERR is used to indicate that this file is
"finished". A single framing error would allow the userspace still to
continue.

> Also, fwiw, this doesn't apply cleanly against current usb-next for
> me, git apply fails on the rx_callback hunk. Looks like it's against
> a tree predating the busy-polling changes.

It'a against thunderbolt.git/next [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/log/?h=next

> Not a blocker either way.
> 
> Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

Thanks!
