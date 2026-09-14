Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6832A3C8;
	Mon, 14 Sep 2026 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368990; cv=none; b=CkHynwALRMQmRNVLWF6DVTXnW3VnKwdKMA97ohypAvL6xeo24hBA6yg09vrN6xxAqlIYoVmovP4oVxm7pFvMzS8W6pTu6cDd+pbOV1ItI85G/agVlHt9BeQzNc3ci1jz+Ii4ccZ+OIDv1/oyRy0MFpknZifxCb8yw/oKlGKGVl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368990; c=relaxed/simple;
	bh=B7v2Fp9Slek40s8zzoxPKj28ikmQAUSPBlSLChPYibk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYd3SHo5Kdbu6yLmUtGZ87vA+uXDKZXvV284V2tGC02FHQwWTDRB7vOBCL+rdW4HGv1yg6CRbfr+yN0yresq15efM6CSrkNPLF8HsnizziMj86YmKg+jreooli84QDdD6l+JUt9kJZl/RXoeVhFCS6eymOScpK1XroI+Z+FPyWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vcIOU23V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcIOU23V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70611F000FF;
	Mon, 14 Sep 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789368988;
	bh=8I13WZHUYYZcEqeCVYnqZTYsj6lNKLX0eau5lBjszng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vcIOU23VXaXcjvB26L2+v6dCr9gbML7hT/GJQy7yTMS1hATuOYY4j9/iix8Jfk527
	 Avbdz2DYwQU9PtI1WIdximSaNTbVqvFafcDNadnOAyt1k5onPrEIMQVYCOqs42KUyc
	 nNOBHi29GK6Sedr9omJuG3HAWtBP0GbmEo6aPQrw=
Date: Mon, 14 Sep 2026 08:54:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Daniel Palmer <daniel@thingy.jp>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: fotg210: guard host shutdown in gadget-only builds
Message-ID: <2026091425-mayflower-unifier-4780@gregkh>
References: <20260914-fotg210-ehci-fixes-v1-1-a75ca67fac04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-fotg210-ehci-fixes-v1-1-a75ca67fac04@kernel.org>

On Mon, Sep 14, 2026 at 08:41:18AM +0200, Linus Walleij wrote:
> FOTG210 can be built with CONFIG_USB=n, but its shutdown callback
> references usb_hcd_platform_shutdown() from the USB host core,
> causing a link failure.
> 
> Guard the call with CONFIG_USB_FOTG210_HCD so gadget-only builds do
> not reference the host shutdown helper.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609141128.DQicnuRW-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Fix the gadget-only build failure introduced by the FOTG210 common
> EHCI conversion by guarding the host shutdown call.
> 
> Based on the complete FOTG210 modernization series. Verified with
> PowerPC64 gadget-only and Gemini host object builds using LLVM.

No Fixes: tag?

thanks,

greg k-h
