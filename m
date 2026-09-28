Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA4547074;
	Mon, 28 Sep 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598326; cv=none; b=Uc6YgSIdd9eoGuCgBZyGOXhCbnYCSfN/5/PAQc2gK5IAVbc5cpSGquUl2Xeq9D65NnDb9JHDqdiG6WzJqLcK5F/V1NByqgrnWcUT0dGnPZAtVYtXLV5Ojjey3/HPcVR7knaQpAQUMx7YjCkBsq0H6GPA4JCFug+h2kJalCxBYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598326; c=relaxed/simple;
	bh=8wTHdAaoNQm5PRddYaD4dcWLmI8zdkkCWppLwdtVilU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtXOp2KdlILJ30eu3/b4MEzhXEmhC4cDK1LTZS5KBSdY5BPQZpF1iS3sHpj/w8z6b5ZSugzsQTLNJWvUonzR0aXO5LKS0ngF/OAKeJXDg90hO5OvPmP9uZI/av0T5onB1PVmb1n4o5rQVf8v3scmiN5BFjNYMlRI/Wzmga77IG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ZwvMcyLB; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ZwvMcyLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790598316; bh=8wTHdAaoNQm5PRddYaD4dcWLmI8zdkkCWppLwdtVilU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwvMcyLB4JO71cRdB2VE1cXQ5UoTO/QU5QqbcTueDfKhCsYJGp62WCoKwZY+Dtz1Y
	 QiXiaavpxoLFhVg3eq4dw4AVOVP7tMJFchs8IZ/zm82WEE3QzBOqWh9OEx5CK6GSqQ
	 RLOW4e9O9nCxdn7Td3IOBGb8YbmcqImJ5wQ3p4e4XHkkk8eLHhaju5ITcM3PaGhK+h
	 ZpTwrgJ9B9wyTVaiXoRHQJl6X/UnKAGys9snlpNBYvPDjgIXf17MzUoUxQ6H8CWzyG
	 A3h85T0s/zyMFORs/PvllzdaeraVu4Tc945+FYoSh8AgWH/rHr3UC+tHWg3Dl/4r/1
	 WBNXHHPkjDZGg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id C217C40B86; Mon, 28 Sep 2026 13:25:16 +0100 (BST)
Date: Mon, 28 Sep 2026 13:25:16 +0100
From: Sean Young <sean@mess.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] media: imon: fix use-after-free in display_close via
 dev_dbg
Message-ID: <arpcrKbhue-aRud9@extorris.mess.org>
References: <20260928121230.35359-1-kartikey406@gmail.com>
 <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>

On Mon, Sep 28, 2026 at 05:48:26PM +0530, Deepanshu Kartikey wrote:
> On Mon, Sep 28, 2026 at 5:42 PM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > ictx->dev is a raw pointer to the usb_interface's embedded device,
> > cached in imon_init_intf0() without taking a reference. On
> > disconnect, usb_disconnect() can drop the last reference on the
> > interface and free it while a userspace fd for /dev/lcd0 is still
> > open. When that fd is later closed, display_close() dereferences
> > the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> >
> > Fix by pinning the device with get_device() when ictx->dev is
> > assigned, and releasing it with put_device() when ictx is freed.
> >
> > Also drop the dev_dbg() in free_imon_context(), which only printed
> > a debug message and is no longer needed.
> >
> > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
> > Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail.com/T/ [v1]
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> > v2:
> > - Remove the dev_dbg() in free_imon_context(), as suggested by
> >   Sean Young.
> > ---
> >  drivers/media/rc/imon.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > index 049a73b5f882..562a70186db4 100644
> > --- a/drivers/media/rc/imon.c
> > +++ b/drivers/media/rc/imon.c
> > @@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context *ictx)
> >         usb_free_urb(ictx->rx_urb_intf1);
> >         kfree_rcu(ictx, rcu);
> >
> > -       dev_dbg(dev, "%s: iMON context freed\n", __func__);
> > +       put_device(dev);

Why do you need put_device()?

> >  }
> >
> >  /*
> > @@ -2253,7 +2253,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
> >
> >         mutex_lock(&ictx->lock);
> >
> > -       ictx->dev = dev;
> > +       ictx->dev = get_device(dev);

Why do you need this?


Sean

> >         ictx->usbdev_intf0 = interface_to_usbdev(intf);
> >         ictx->rx_urb_intf0 = rx_urb;
> >         ictx->tx_urb = tx_urb;
> > @@ -2314,6 +2314,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
> >  find_endpoint_failed:
> >         mutex_unlock(&ictx->lock);
> >         usb_free_urb(tx_urb);
> > +       put_device(ictx->dev);
> >  tx_urb_alloc_failed:
> >         usb_free_urb(rx_urb);
> >  rx_urb_alloc_failed:
> > --
> > 2.34.1
> >
> 
> Please disregard this patch.
> 
> Thanks
> 
> Deepanshu
