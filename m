Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0726B2CE;
	Mon, 31 Aug 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169293; cv=none; b=EhaENpzdkRlDcSA98MvxaYx14+FnybnjQH/wfNMRXBfY6DD1tvKBTAE6rrDb2qr1H0KGBqT8SEpotaOJWLRV9oMMXNk2MsPqV0s+mvyAf6ai4GbDuhBXyaqoQrQvLWZMxEnAUaKSFT7MLMmzP+B3MK35q248+iDrKowLsvVd5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169293; c=relaxed/simple;
	bh=lUed+Pcqvu/J6gvYpsHlH6J2lp7O1Z9U6eDL9xxq5Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1qosVrR3rHUZ0fM7xZOgJkErSiSj6Qm2w/RSQrv/iDTQhqQ+iYyRKfx2kwvxpCp8kylPANnFGy+4d9ACFJxsE8hQxhbIgZ8Wjdlz6Yw5qOgcVIf9ozhJSXPSinvcUlBm3gj5PFId34cQyF2hgdYimv/9Gw8zdxV4owh/YwVjUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iRRuDiLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iRRuDiLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86821F000E9;
	Mon, 31 Aug 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788169291;
	bh=1RCvV47ZIovskQwwJ2Cf5orHzYQ8NDUYy3Pq+RF5hp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iRRuDiLS/NA0Mr0rAmBwZwKvh6sI7rbxIj6M95q3nsI5kwFrTpYUCiGQgHa//Q5br
	 yslx2MbcI25nwhDu9Jdq9mxW8RT3qiRZopnRYaBhsHoJEsq1K4xwedn89Q8Qd4phvU
	 VCeflxX0wph27yoiJsgh2VkmBzicyfTssdPQfPg0=
Date: Mon, 31 Aug 2026 11:41:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianying Wang <wangxianying546@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	kees@kernel.org
Subject: Re: [BUG] usb: gadget: dummy_hcd: general protection fault in
 dummy_set_selfpowered after unbinding dummy_hcd.0
Message-ID: <2026083113-krypton-ultra-49ae@gregkh>
References: <CAOU40uBQG6_o+wU7UbWgRzZq4865QmLfJBdK0RP+iqLNy7Q8ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOU40uBQG6_o+wU7UbWgRzZq4865QmLfJBdK0RP+iqLNy7Q8ew@mail.gmail.com>

On Mon, Aug 31, 2026 at 05:02:28PM +0800, Xianying Wang wrote:
> Hi,
> 
> I would like to report that a previously observed
> syzkaller-triggerable crash is still reproducible on Linux 7.2-rc3.
> 
> The reproducer first unbinds `dummy_hcd.0` through sysfs, after which
> the kernel logs show that the dummy HCD/UDC instance is removed and
> the emulated USB bus is deregistered. It then writes `dummy_udc.0` to
> the gadget's `UDC` attribute through configfs, which triggers gadget
> binding.

Fun, but you do know that "unbind" will taint the kernel in the near
future :)

And the dummy_hcd code is just for testing, it's not a "normal" driver
that any user will ever hit.

> During the bind path, `configfs_composite_bind()` calls into
> `composite_dev_prepare()`, which in turn invokes
> `usb_gadget_set_selfpowered()`. This reaches `dummy_set_selfpowered()`
> in `drivers/usb/gadget/udc/dummy_hcd.c`, where the driver obtains the
> backing dummy HCD from `gadget_to_dummy_hcd(_gadget)` and dereferences
> it. At that point, the associated HCD pointer appears to be NULL or no
> longer valid after the earlier unbind/remove sequence, leading to the
> reported KASAN null-ptr-deref / general protection fault.
> 
> Based on the call trace and the reproducer flow, this seems to be a
> lifetime/state validation issue in the dummy UDC path: after
> `dummy_hcd.0` has been removed, binding `dummy_udc.0` is still able to
> proceed far enough to call gadget operations that assume a live
> associated HCD.
> 
> This appears to match the previously reported `general protection
> fault in dummy_set_selfpowered` issue, and I am sending this report
> because it is still reproducible on 7.2-rc3.

Patches are gladly accepted to resolve issues like this.  Why not make
one as you have a reproducer for it?

thanks,

greg k-h
