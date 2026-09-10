Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC4495047;
	Thu, 10 Sep 2026 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047451; cv=none; b=Qw/bzEifGHyZsX1mv1fvs/pyLXYhLAx+dlQBjW72ogdHtAdxLuRHEvtY5pP7sHeLfql7BRyQOyw4TEmiBgtzOqxzmiO6dCsb6B7GVzHAYPmlvR9zH2aWaWB03uENyRf63xqO5lzfXaabi6QVXDLKE7yCSJGrfMwDLxATfLVciHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047451; c=relaxed/simple;
	bh=3qQIlrKTVXNwRUe+zvROS/6qPifGmLudF4Xf7XwsnjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TC+sJXqSBBIBNreu4dUVWzRJZPUHT/YMUDVfF6H3uvzKTv1eud7HgOh0GXnnyjXh/f7gD0V7HuhHpbHQn2metrQvTFcE7N/PXAvlTzJZ6wlcVuUOgcueW557BmqrE3L0FzPO44EgIjxBjj4lmLeioOG8jf9uazDHocLgU3blOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MxPTNwiQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MxPTNwiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732261F000FF;
	Thu, 10 Sep 2026 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789047450;
	bh=73NdsiSzx2IC1jJoyJd2c/TUGnOqFWmUTE19FcPsK4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxPTNwiQU4ixRQyds5mzBluhLRwTqS5fmkNwnhcMGfvfWSIxi1Zvi1HhmTcFuIGJV
	 VqAxuwqgLNdq0EF/CbsRtGdw78XH2v2zsyCVQORvxerNqsUVOw5aLqFzfDvjYD/HMI
	 pKzuLCIxJjHgqV5dIVQe/CytY0j9Kcy+IppgDMgs=
Date: Thu, 10 Sep 2026 15:37:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: stop propagating controller OF nodes
Message-ID: <2026091014-untie-reshoot-d251@gregkh>
References: <20260702145350.109509-1-johan@kernel.org>
 <anx-7aOxjC2Hinxu@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx-7aOxjC2Hinxu@hovoldconsulting.com>

On Wed, Aug 12, 2026 at 04:10:53PM +0200, Johan Hovold wrote:
> On Thu, Jul 02, 2026 at 04:53:50PM +0200, Johan Hovold wrote:
> > Some UDC drivers propagate the controller OF node to the gadget device
> > but there are no (and has never been any) users of this as the
> > devicetree binding and composite driver support was never merged. [1]
> > 
> > Drop the unused and incomplete support for OF node propagation which if
> > ever needed should be handled by UDC core.
> > 
> > Note that this also avoids probe failures when reusing an OF node that
> > describe resources like pinctrl that are managed by driver core (cf.
> > commit 48ed32482c41 ("usb: gadget: aspeed: Fix probe regression")).
> > 
> > Link: https://lore.kernel.org/all/1340720833-781-1-git-send-email-aletes.xgr@gmail.com/ [1]
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> > 
> > This was something I stumbled over when fixing a couple of gadget device
> > name leaks. This one applies on top of those fixes:
> > 
> > 	https://lore.kernel.org/all/20260702141536.90887-1-johan@kernel.org/
> 
> These fixes are now in 7.2-rc5 (and usb-next) so can this one be picked
> up for 7.3?

I'll take it now, thanks.

greg k-h
