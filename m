Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C33D3D1B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881703; cv=none; b=B0ur7R8yULga/oFIMLIq66HkRdbRRdRB8wHCNRu5tb2f3C+tjwCshGLI8OJrHQs9bwi5IdZl2unWLAFxX9WP4Q9m7fu0yuaR+BQpIc+NGsUh7Dg72RTYxuNteF+BtI4NmR6C7pi49ZqIpyjGbjRTK9CdQrn9/qLzjHW2FHX2h54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881703; c=relaxed/simple;
	bh=1ZnX7owDeDu7Y9IxBTqKe8wBfbwxgCpY9C8TQDvy+6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HujU95p5rU91m4M9F2FugO70dE87cmebMoeLU7FhrgP4K5GsoAH8qQVgdvDTQaOnr9ZiYF9+7E1ni8S3zMB0PZxP06S0TGDvq9Bg6MuBd/yhoFqWxQVLw643s2A0dH3AaN8Is/CxZ9t4re2uBBhAOxA+en8IxgebaJpgtU58Vzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sOcjFnQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sOcjFnQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB51F008BE;
	Sun, 20 Sep 2026 05:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789881701;
	bh=//VimQ+hFQIgkMulo3jdX1O4vmbRNUpRTAUsH1KrIG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sOcjFnQgwq8+MkcOrOstTlBlDRpuQsvljQxXZP3kzusctPOSLNEILL3uz957bkxgL
	 2jpnwLluMZ3CPe4ANPknnznuBV5tlu07Hq66qAyjUvgBLlXYC3B5t8/pGqZdrU6qMc
	 eXM2oMtQWq3XKwd4nhh6ZZEWFU2/p0XBhO5otGkI=
Date: Sun, 20 Sep 2026 06:19:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] char: hpet: prevent hard-IRQ divide-by-zero in
 hpet_interrupt() via HPET_IRQFREQ
Message-ID: <2026092022-thesis-kinswoman-19aa@gregkh>
References: <20260919203515.2581203-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919203515.2581203-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 08:35:15PM +0000, Hui Peng wrote:
> In hpet_ioctl_common(), HPET_IRQFREQ sets:
> 
>         devp->hd_ireqfreq = hpet_time_div(hpetp, arg);
> 
> where hpet_time_div() computes (hpetp->hp_tick_freq + (arg >> 1)) / arg.
> Whenever arg > 2 * hpetp->hp_tick_freq, integer division yields 0 and
> sets devp->hd_ireqfreq = 0. In addition, HPET_IRQFREQ allows updating
> devp->hd_ireqfreq while timer interrupts (HPET_IE) are already enabled.
> 
> When the armed HPET timer interrupt fires, hpet_interrupt() executes:
> 
>         base = mc % devp->hd_ireqfreq;
> 
> in hard-IRQ context with devp->hd_ireqfreq == 0, triggering an immediate
> divide error (#DE) kernel Oops.
> 
> Reject HPET_IRQFREQ with -EBUSY when HPET_IE is already enabled, and
> reject arg values where hpet_time_div(hpetp, arg) == 0 with -EINVAL.
> 
> Fixes: ba3f213f8a31 ("[PATCH] HPET: make frequency calculations 32 bit safe")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---


How was this tested?

Why no cc: stable?

Please slow down.

greg k-h
