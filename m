Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA41380FD8;
	Thu, 17 Sep 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632549; cv=none; b=INC1JJNbxpK4C5T8m6DTD6bqYgwoO+AFprHuKrvg6DVEN4VOpqjssXMApBt7p1/j/5+lu+p68HdSFhHwQRTvPRQrd9KaFmFtK5vPPGAB1UJfWvZ1UTk4sf15d3GGhxGEms25Yv+4rGuEajz/JJtqBYqLEircpLELtl+75gdYLLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632549; c=relaxed/simple;
	bh=gwWkMGJjjSbsocRZTBOxGibjPdweYuDPyAE7Jq1gZGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bhm1d6l2DAdNGgItlrqxIumAXufQ9iM3OHTjIiN+ubitmu9pXUn0vVQodBu8ajTXHpHYUuW3x9VAtF63VfRKwqCEtf1cmSHTw+FOiXQOOfL2kgHIpapQoUtxFY/hEOx1sEbQYSivpI8QL46KzCyBXxsLKp+oeZFZFcu0FC6LNKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sCAcVDGK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sCAcVDGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43D21F000FF;
	Thu, 17 Sep 2026 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789632544;
	bh=ktt0LKwu42At/FK2VP2oPtkN1yqBjuI7vtR1o1qh3y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sCAcVDGKo+bBGxol8ulI0U6qTix6SNSVI5PnVvU7NrVxb36rLXLOTO3MBmNt0r1sQ
	 iKQE+mZqWYR8A3t1ZySuUn0glbDBHxI1xxHSeGrKou5C1h7Rt8p319Z71SZiHRod5G
	 Y6DjMjUcgkLUD1Bf5BforQ4xj1OL+khG0r5ubqDI=
Date: Thu, 17 Sep 2026 09:07:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: CJ <firefly0158@163.com>
Cc: stern@rowland.harvard.edu, kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: dummy_hcd: general protection fault in set_link_state
 on unbind
Message-ID: <2026091724-upcountry-dental-3e1e@gregkh>
References: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>

On Thu, Sep 17, 2026 at 04:00:00PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a general protection fault in the dummy_hcd link-state handling,
> triggered by a syzkaller USB reproducer.  The issue is reproducible with HEAD
> commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic HID USB device through dummy_hcd and then
> unbinds the dummy_hcd.0 platform device by writing its name to the driver's
> unbind attribute.  The failure happens during the teardown that follows.
> 
> 
> The console shows a general protection fault for the non-canonical address
> 0xdffffc0000000000 with a KASAN null-ptr-deref in the range [0x0-0x7], and RIP
> in set_link_state.  The path reaches it through the gadget disconnect and
> unbind sequence (usb_gadget_disconnect_locked -> gadget_unbind_driver ->
> device_remove) while the dummy UDC is being removed.
> 
> 
> One possible cause is that the link-state helper runs on a UDC whose private
> data has already been released by the unbind, so it dereferences a NULL
> pointer.  This looks like an ordering/lifetime problem between the platform
> driver's remove path and the gadget disconnect path.  I note that d5e5cd3654d2
> fixed a related giveback lifetime issue in this file but does not cover
> set_link_state.  I am reporting the fault and the path as observed.
> 
> 
> This appears to be a recurrence of the syzbot issue whose external id is
> 83e39b821587064bd7a3.  It remains reproducible on v7.3-rc1.
> 
> 
> Reproducer:
> 
> 
> syz reproducer:
> syz_usb_connect$hid(0x3, 0x36, &(0x7f0000000140)=ANY=[@ANYBLOB="1201000000000010d804dd00000000000001090224000100000000090400000103000000092105000001220500090581030002"], 0x0)
> mkdirat(0xffffffffffffff9c, &(0x7f0000000000)='./mysys\x00', 0x1ff)
> mount(0x0, &(0x7f0000000080)='./mysys\x00', &(0x7f00000000c0)='sysfs\x00', 0x0, 0x0)
> r0 = openat(0xffffffffffffff9c, &(0x7f0000000100)='./mysys/bus/platform/drivers/dummy_hcd/unbind\x00', 0x1, 0x0)
> write(r0, &(0x7f0000000200)='dummy_hcd.0\x00', 0xb)
> 
> 
> console output: https://pastebin.com/raw/1CNVfMHw
> kernel config: https://pastebin.com/raw/19YvTSEp
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

As you have a reproducer, why not make up a patch to fix it as you have
a way to test this?  That's the best way to get things resolved given
our HUGE pending patch queue to work through.

thanks,

greg k-h
