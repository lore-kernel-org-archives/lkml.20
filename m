Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC323C09EF;
	Thu, 10 Sep 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029497; cv=none; b=G2TTCsz4rqTxsoGv22CL6paoQbTCsb7sUmluTaJSRXBCOO4vSw++GmgBjl1UXh7Bjk+fzyXEWaRf3Gm9ltI41QJ7n72ijCCyOemgyIcIBAGS8912N/nbRU46WgI6/aCuyj8y6caP5qdoA8LGWKxkvO8fEInSBE62H4h+jXG7v4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029497; c=relaxed/simple;
	bh=gzQGhhbVeK7EkXy1JQsNg62SZ3XSyRCbgiGYtc89JFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ9hga0Je16Q7LOkNtFE82+JNj5kSnuMT5t/hokcn1P8XXIX5IVPM8FGVS6oETZz/E36YrWviYmJWc5aDo16T/hWDYk9DKII8w6IPAp7jcLDK/oiJUErG6hdOmK8xFsryiINZPQUEYBniFDVA4ucNzaNOTf567aThCOsAqWzat0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vuz6wuD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vuz6wuD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B161F000FF;
	Thu, 10 Sep 2026 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789029493;
	bh=xJE0w7P5Xr2Tj1b+BThpv49DkNX1CrBe7rg21sTMgjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vuz6wuD9Ky9rC7WKEH/vXyWDXvAvGysfbIvmgTJ5XP1mX6PHSvGr1clzzEtBNw1mi
	 zm+U/nt8Z1pFUpa6x/5rhe2Ie9qc7QvwORg0lovmxAjvzKnQgPXQ9jrSyOfzZkrrpR
	 ZYGP2oBMZOrwtVK8fktyT7oP6acKZ2UHnofgVYxY=
Date: Thu, 10 Sep 2026 10:38:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
Message-ID: <2026091034-slicing-same-692a@gregkh>
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>

On Thu, Sep 10, 2026 at 01:17:19PM +0500, Syed Tayyab Farooq wrote:
> syzbot reports a slab-use-after-free in tty_init_dev()/gs_close()
> involving struct gs_port. The port is allocated when a gadget serial
> function instance is created via configfs mkdir (gserial_alloc_line())
> and freed via a plain kfree() in gserial_free_port() when the instance
> is removed via configfs rmdir(). Nothing prevented a concurrent
> open("/dev/ttyGS*") from racing with rmdir: the tty core could still
> reach gs_open()/gs_close() and dereference the gs_port after it had
> already been freed, since the ports[] table entry these functions
> looked up was a bare pointer with no refcounting tied to the tty core.
> 
> Fix this by giving struct gs_port proper tty_port-managed lifetime:
> 
>  - Add gs_install()/gs_cleanup() tty_operations. gs_install() looks up
>    the port once under ports[idx].lock, takes a tty_port_get()
>    reference, and stores the result in tty->driver_data. gs_cleanup()
>    drops that reference when the tty_struct is released. This ties the
>    gs_port's minimum lifetime to the tty_struct using it, so it can no
>    longer be freed out from under an open tty.
> 
>  - Give tty_port a destructor (gs_port_destruct()) that does the
>    kfree() that gserial_free_port() used to do directly, and
>    switch gserial_free_port() to tty_port_put() instead of an
>    unconditional kfree(). Also, tty_port_destroy is automatically called
>    when the reference reaches 0. The struct is now only actually freed once
>    its last reference (held by either the ports[] table or a live tty)
>    is dropped.
> 
>  - Stop gs_open() from independently re-deriving the port from
>    ports[port_num].port and reassigning tty->driver_data. gs_install()
>    is now the single place that looks up and pins the port; gs_open()
>    re-deriving it separately could, on an unlucky race with the port
>    index being freed and reallocated, leave tty->port and
>    tty->driver_data pointing at two different gs_port instances, with
>    the one gs_close() uses left unprotected. gs_open() now just uses
>    the already-validated tty->driver_data, while still holding
>    ports[port_num].lock across the first-open kfifo allocation to
>    serialize concurrent first opens against each other (kfifo_alloc()
>    needs GFP_KERNEL, so it can't run under port_lock).
> 
>  - In gs_close(), a tty's .close() can legitimately run against a port
>    whose port.count is still 0, e.g. when gs_open() fails and the tty
>    core unwinds via tty_release(). The previous code treated this as
>    an impossible state (WARN_ON(1)), which trips panic_on_warn on
>    syzbot and isn't actually a bug -- it's an expected outcome of a
>    failed open. Treat count == 0 the same as any other "not the last
>    closer" case and return quietly instead of warning.
> 
> Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
> ---
>  drivers/usb/gadget/function/u_serial.c | 64 +++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 7 deletions(-)

Did you forget an Assisted-by: tag?  And did syzbot test this?

thanks,

greg k-h
