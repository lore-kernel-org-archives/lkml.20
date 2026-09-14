Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85035F16C;
	Mon, 14 Sep 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374900; cv=none; b=be/GP/SvYczacN/5kdYK7YjMEoCj4D/mb9YmC5UwMaOW8Cw4vTvNfiP5R1U4GvgNDnhfOuVAWrXiFOupg37Xw62bjysQ4QTbaKu/bl/CMgWLOtH9oQQ1iq6N2uHW40IE6MKuh0WHGFbx2/qxVh8qD9asus34kA237mux6BvOCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374900; c=relaxed/simple;
	bh=p2O0AFyvs5/7ZNI0oeDRA42QiFrcGG3sbWSKTgR1DV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8FguEYN80e0AyQ9JRqDz08EHoX7TkbFzCQ+fVA+siY01bixCBLc2Ar2eOQGYrDpYBm/fHb4wHpFxDNG2yt/wbWFATCfmpO6FmpaVn7U26K7ZLgNadN/feiCTJKOdN3+PAaR4WGdfBWxA+ebl3qLciihBGJJ77R+W7GysFX8ahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iUfCTouM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iUfCTouM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51E31F000FF;
	Mon, 14 Sep 2026 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789374898;
	bh=rxx8B1w3xIz3jG8+k/uTEDqQjidwEidLPqZwuCRaVj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUfCTouMNK5/y8ZQ8p46qIw7r+mgSaIdyFc4KaRHOitHm/mOWZA2AaJvRG7oJOau8
	 gO4iAZUTNxjMy3DkjYYzbxnKRO8FdRh9/YrzAzOk8zDYhIKB3gc6lsVsnMY95YbndX
	 hDCRsJnjy5yxRlYNuvT6Xjp5dMU3/npld62iAfaw=
Date: Mon, 14 Sep 2026 10:34:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: CJ <firefly0158@163.com>
Cc: oneukum@suse.com, n7l8m4@u.northwestern.edu, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: mdc800: possible circular locking dependency between
 io_lock and minor_rwsem
Message-ID: <2026091404-dipping-stubborn-b658@gregkh>
References: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>

On Mon, Sep 14, 2026 at 03:36:36PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a lockdep-detected circular locking dependency in the mdc800 USB
> driver, triggered by a syzkaller USB reproducer.  The issue is reproducible with
> HEAD commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux
> 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic USB device through dummy_hcd that enumerates
> as the mdc800 camera, then opens the character device node.  No filesystem or
> image input is involved; the trigger is the connect-then-open sequence on a
> device that binds to this driver.
> 
> 
> Opening the device reaches mdc800_device_open through the USB character-device
> file operations, and lockdep reports that the task is acquiring
> &mdc800->io_lock while already holding minor_rwsem#2 taken by usb_open.  The
> existing dependency chain in the report shows the opposite order, so the two
> lock classes are recorded in both orders and lockdep declares a possible
> circular dependency.
> 
> 
> One possible cause is that the driver's private io_lock is acquired inside the
> USB core's file-open path, which already holds the minor rwsem that guards the
> driver binding, while another path takes the same two locks the other way
> around.  This looks like a lock-ordering problem between a driver-private mutex
> and the USB core file-layer lock rather than a use of a single lock.  I am
> reporting the ordering as observed; the driver is legacy and possibly unused, so
> if the intended fix is to keep the lock order, please treat this as a report of
> the deadlock potential only.
> 
> 
> This appears to be a recurrence of the syzbot issue whose external id is
> 1050c0099ec5bfe7ee4e, title "possible deadlock in mdc800_device_open".  It
> remains reproducible on v7.3-rc1.
> 
> 
> Reproducer:
> 
> 
> syz reproducer:
> syz_usb_connect(0x2, 0x40, &(0x7f0000000000)=ANY=[@ANYBLOB="12010001000000085f0500a800010000000109022e0001010080320904000004ff00000007050102080000070582030800010705030240000007058402400000"], 0x0)
> syz_open_dev$char_usb(0xc, 0xb4, 0x0)
> 
> 
> console output: https://pastebin.com/raw/2jB0d1Lm
> kernel config: https://pastebin.com/raw/YZiwabxk
> 
> 
> Kernel:
> 
> 
> HEAD commit: cee9395acd8043be0644b25c34bfa86623f2b935
> git tree: upstream (linux.git), tested through the v7.3-rc1 annotated tag object
>            e5e04726cdd043e309677071ab1b65a4b18f422b
> kernel version: 7.3.0-rc1 #1 PREEMPT(full)
> tested tag: v7.3-rc1 (Linux 7.3-rc1, 2026-08-30)
> 
> 
> Let me know if you need more details or testing.

Great, can you provide fixes for this, and the other reports you just
sent out?  Otherwise there's not much we really can do with this at the
moment as we are drowning in real fixes, and probably don't have time to
spend on reports-only.

thanks,

greg k-h
