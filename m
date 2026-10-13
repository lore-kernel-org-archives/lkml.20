Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA0514745;
	Tue, 13 Oct 2026 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908315; cv=none; b=dsqEl/1m5WtBFMBvgUK1j5VKXkRAbIWBbHmVBCu1Do3elTCEWQfv2qCR1KuHZrCFw1qN+qQC/YLxaXo00QLJVBpfSYMT/9UrsyiIj01Y6kGGAvPQtNfq9ZiGniptlq1IXabcPzo0bm9IzH4F434gqSbZSDl1+wybdQn9afP2Pgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908315; c=relaxed/simple;
	bh=XQup88UT6PiSJu0+YoHe5gxZVVWGjSYaQQ4hNIxMu0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dz/0eTiW9u1dj5vgTEBY+7hfoN4UVOpE/1rH2+H1TEaRX7CACrXSN5EW8HyTlwV9FMHkCvOkk4EZXtLehUEutklKtD6S+0dI02VUeElcV/W7voWdR2b/qPmhJF7CNoF2953+lROAhVd2h14KzwPIJXhOxyvpc8vqZpLQ8QHsjC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KvRliqgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KvRliqgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02651F000FF;
	Tue, 13 Oct 2026 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791908313;
	bh=yWHKi7MVqdfx/DpOMOOAPC5vE5HK0iieymazQG6LzPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvRliqgWpzcklCisFLZ0oY+SdYu5MXgOjNiAGzftmNkniBRkRPXP413aXeD6+x3us
	 fJDpYtAWMlk0Rf5/PdzsQPr0ghPGQbahsghKehOqzALs1c3Noa7oEWbzP/sgsgBy+1
	 YL1ER6PowNUKY11ZHF2hiakZYzNJ/d8lRANj1Jyc=
Date: Tue, 13 Oct 2026 18:18:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Yongjun <jun85566@gmail.com>
Cc: stern@rowland.harvard.edu, digidietze@draisberghof.de,
	xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
Message-ID: <2026101310-crier-december-be03@gregkh>
References: <20261013132033.4352-1-jun85566@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013132033.4352-1-jun85566@gmail.com>

On Tue, Oct 13, 2026 at 10:20:33PM +0900, Lee Yongjun wrote:
> The Option device initialization path issues bulk transfers
> without a timeout. If a device does not complete a transfer,
> the USB hub worker can remain blocked while holding the device
> mutex, causing usb_device_read() to hang.

So a broken device?

> Use the timeout-aware bulk transfer helper for the transfers
> in option_inquiry() and option_rezero(). This bounds the wait
> for each probe-time transfer to 30 seconds.

That feels very long, are you sure that works well?

> Tested with the syzbot C reproducer under QEMU/KVM. The
> patched kernel repeatedly completed USB device initialization
> attempts after approximately 30 seconds without triggering
> the previously observed hung-task warning.
> 
> This patch depends on Hongyu Xie's pending v3 series:
> https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/

This should go below the --- line and is why sashiko is confused.

> Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to leave unrecognized devices alone")
> Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7317196294d50d6e55c3
> Assisted-by: LLM
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>

No blank line above here is needed.

thanks,

greg k-h
