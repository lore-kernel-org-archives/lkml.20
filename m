Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8E3E4106;
	Tue, 29 Sep 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688236; cv=none; b=sjaVqRJp3B9MO/S6D1DWaSIBK2v8FQB7CWC8J7KLvc6PgiBDLXxRU3Tv6DKzO133Fy7i2GYBwjIzcluGa11DnFoq+FwqRuSiRMMiNHcNgzX0ziPJrR5Hah7X2pb+JmDYjLvNoNHMLYv1hVNthLuKPDe23OEC3um0WC+W60UXWro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688236; c=relaxed/simple;
	bh=xHxwiDeZq7L2wt51F8Qm7ClYHwkgZ0cBXSOz515KatA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bevdPflJYGRO4zAEcpzmFz3FxE8u1yt1cT6vuCOCcdZ9jE1Ph2JPCc8SNnBrix1lbOtb8R/3jLgwf3AdadFQoC70yX+lIt5tJF8sbqAlZIjnAd5XaoeGt6A0ZzcT0VZC5TOW14Dzantjp37Ets0ij3L3qniOz6OtMsENfUw3h5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RUJfwNDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RUJfwNDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF52E1F000FF;
	Tue, 29 Sep 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790688235;
	bh=sgbsnVzbaF2JP0dXhwqPl6l+cHOMlrsPEy71mTmO5Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUJfwNDTL1ez80vSyfPPo7MgfVX3oF+XHMHbE8maLbAy31zTwknS/yS0h4CPSESgq
	 SRo4dJBQ9Flgvq9kHrY5V2g+m5xLmxCi44zyV3q6jlK7GljQyViac+3Z7h+XTp0u/k
	 XgWiT6MOCGfRX2iT+DF0OpzhUO7T7h0kqTpyqNo8=
Date: Tue, 29 Sep 2026 15:23:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
Message-ID: <2026092925-licorice-strode-7905@gregkh>
References: <20260821114854.12218-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821114854.12218-1-kartikey406@gmail.com>

On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> u_audio_get_playback_srate() unconditionally locks and reads
> uac->p_prm.lock/srate, but g_audio_setup() only initializes
> p_prm.lock when p_chmask is set. On a UAC2 instance configured
> without a playback direction, this results in acquiring a
> never spin_lock_init()'d lock when a GET_CUR sample rate
> request targets playback, triggering a lockdep "trying to
> register non-static key" warning.
> 
> Reject the request with -EOPNOTSUPP when p_chmask is not set,
> before touching prm->lock.
> 
> Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
> Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---

How was this tested?

Did you forget a Assisted-by: tag?

thanks,

greg k-h
