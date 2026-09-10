Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7353A4F4A;
	Thu, 10 Sep 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058350; cv=none; b=d0k+B4LGle0JIFLN2OiSgnecrF+x4BaLPQPbgzUD7eRXRDNuzOWP/dudJjBEHff4OkMUlbthUQaia/Pzss5C+fH0Yjpq8pyktXU7THythMKMOGLwzwvyQwhBso48D2J+UlDI7rvkyQDU8f8IHGMaIBXatbtEowUzV5bh1zGKF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058350; c=relaxed/simple;
	bh=Ta7gu2SURjls0C3yd3Ubg1mY+sBZiejfBfLWaQsKXVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeDoMQOicbL994QsV6vOAwHhdYVzhxHbWZLPnSAGTL5gxfqXAv3JzkYo2jflBg/9CbEdBLmRkIhHmH0rXnCKsDHNJWgAsL8lB2FZ30bblW83+sH/jVJUXV3caKek1bS1C9lD9mG2oCvcld1gTuULUR7D5bBTzU54TwJYqdd/hfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JZ5Hc1Mw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JZ5Hc1Mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919A11F000FF;
	Thu, 10 Sep 2026 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789058348;
	bh=J1DxlwO1SBdCyEGtWOR+zVNhrDhFkdpFxBdKteLQo+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JZ5Hc1Mwtqzu82LhttrRUmeNlpFGPoY/bvKKGXp0zNzZeCve25kEo7dE5/MTLLrTo
	 V3kaRcRTsTTSMPXUvcjx1+vxlE0faXEcaXLeUh0ZnBDYFdkZzJI5LSGu1aag8/NYiB
	 gO1D980rZweXLHkH+hv9NaGqROLVzJLcMEWD2mfU=
Date: Thu, 10 Sep 2026 18:38:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026091047-cover-resolute-5d4a@gregkh>
References: <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
 <20260805041319.3197126-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805041319.3197126-1-khiemtranzo532001@gmail.com>

On Wed, Aug 05, 2026 at 12:13:19PM +0800, Nguyen Quang Le Kien wrote:
> pn_bind() and phonet_free_inst() race on opts->bound and opts->net.
> If configfs removes the function instance while pn_bind() is between
> the !bound check and setting bound = true, free_inst() frees opts->net
> and pn_bind() then writes to net->dev.parent via gphonet_set_gadget().
> 
> The old "no race condition" comment was wrong - configfs_rmdir() can
> run in parallel with the composite bind path.
> 
> Add a mutex to f_phonet_opts, use scoped_guard(mutex) in both paths,
> add kernel-doc on the struct, and destroy the mutex before freeing
> opts.
> 
> Fixes: 00a2430ff07d ("usb: gadget: Gadget directory cleanup - group usb functions")
> Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
> v3: drop the redundant #include <linux/mutex.h> in f_phonet.c -
>     u_phonet.h already includes it.
> 
> v2: scoped_guard(mutex) instead of open-coded lock/unlock; kernel-doc
>     on the struct; mutex_destroy(); remove the wrong comment.

You did not use the Assisted-by: tag as you should have :(

