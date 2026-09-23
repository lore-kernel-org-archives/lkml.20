Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97374280CE5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127563; cv=none; b=reJFk0T0dZXeQ37bWVeuSl6zZQYjcpAwXfJXAqIbDrAYvg+0ZWe03pRiWmf+Tf3ttihf1PhpwjQp6UWp98GfBHGkxLWbZZwTuv5IqR3HygvkGPbUZmTT1mZLaFMGJ4PMngoAMgT4X43MYvOBy/GXjVAIxT6+t5GZ3bLSvey817E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127563; c=relaxed/simple;
	bh=oDrlZx9+nfZMiERKfWtutM6pDAryI7Y4A9huK4WaoNc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=vDE+fnLLZrGcOWkkPjX88kBe6ti1acOG7criFPtTssK5zEZBuaMjuHEDOvyeKFcffho1Z77wH+6FobQrcO0a14VkrNilmyFwExuEn/HUd5wpO9ORHqGZTJQdDh3EPqGT6Q1Hipdkym8ED8IZNQQOR1oV5bjFELs+wI+5BXTmXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kjHUXCdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kjHUXCdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0072B1F000FF;
	Wed, 23 Sep 2026 01:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790127562;
	bh=Pp4k4+H93MLyr0eA7iqH0KHLuo3rFJiZClzmXOfDGWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kjHUXCdimWNssHiG84hgXyOpxr4RDdpWMi+6H9URWbaXrRuJAML2fXUQ4z8D/OP0E
	 SCdk36sajdWZ3RdYiT1zKeGEZ0E8P4saW1sMHZheKdonIo4YJdEGC9FoiZjFg84i5e
	 B9jPLtZonTsACdUCJlHgqfgfY+XpkU1Nxb9mg1/c=
Date: Tue, 22 Sep 2026 18:39:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Breno Leitao <leitao@debian.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm: kmemleak: scan the struct page array in
 MAX_SCAN_SIZE batches
Message-Id: <20260922183921.b30bc1c3ba9443e021910851@linux-foundation.org>
In-Reply-To: <arJPsqUSHGiitXQR@arm.com>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
	<20260921-b4-kmemleak-page-scan-v1-2-fb97d4801b3a@debian.org>
	<arJPsqUSHGiitXQR@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 10:51:46 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Mon, Sep 21, 2026 at 05:30:27AM -0700, Breno Leitao wrote:
> > scan_zone_pages() scans the struct page array one page per scan_block()
> > call:
> > 
> > 	if (scan_block(page, page + 1, NULL))
> > 
> > scan_block() takes kmemleak_lock with interrupts disabled for the
> > duration of the call, so this acquires the lock once per online PFN to
> > scan a single struct page.
> > 
> > Gather runs of adjacent eligible struct pages and pass each run to
> > scan_block() in one call, capped at MAX_SCAN_SIZE.
> > 
> > The longest kmemleak_lock is now held is MAX_SCAN_SIZE worth of words,
> 
> Remove an 'is'.

That was actually correct, but it doesn't read well.

> Also, MAX_SCAN_SIZE worth of bytes rather than words.

edited, thanks.

How's this?

: The longest kmemleak_lock hold duration is now MAX_SCAN_SIZE worth of
: bytes.  The same bound scan_large_block() already applies to the data
: sections and the per-CPU areas.

