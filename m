Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8E3E3D98;
	Mon, 31 Aug 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170773; cv=none; b=Q5+zkn5avZgmjgRAn2C99WDcfo8VnDcgMqkm7zWf+GT01V2b4U/S6iV6+EUPLY9gQeaHGsIdvh7XAscA74fCoeq9wpwRd9oc0z4TOlD9PHmNrrZCEsd46/uqiQvrVmH9ZcuOe5bTx1w0dMONeDYD66zJP8bbRZ2OKgFf/I7t/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170773; c=relaxed/simple;
	bh=yeCRA2/V9LS/s6wg60R85OsMNtm1dn7vIhbMQA3Hb1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwacD+NqNRernpj9EA+E1Uc6mvGt5hBcBMlYctQd+4eeZ+gvHXVeJ2GIEzi9NT6tww1/H8G23fc1sZ76GV/C5tcpJXk695HtuVgeRLfapS/dcX9T84sG2TA3hgvuGYAO7Y0uSakJ3h7+rkAWXdDVUBNa66r25tWA70om1UN1zQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MJsFwI3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MJsFwI3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3491F000E9;
	Mon, 31 Aug 2026 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788170772;
	bh=za4IgtL+rR/4ElpkiV708a34ozd17nbELld5eOh+Xr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJsFwI3nKHZiXSDAZ+XOkPj+AtcuTevxCEYZppotC51bD4OeKanJmOLinQl9zUDkh
	 no9RTz8eoNhLv9Cx3PWZs+ZtOA9O3/kdQ6VzQGmYPxlsJHLUedQ5+7Hxpz3AJwwj0N
	 2nmjdFLd9szVioxyfDnuEimaUt3o6qUt+q659tkQ=
Date: Mon, 31 Aug 2026 12:06:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	yuyang.du@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs
 attributes
Message-ID: <2026083154-choice-platform-51c9@gregkh>
References: <20260816061034.17769-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816061034.17769-1-kartikey406@gmail.com>

On Sun, Aug 16, 2026 at 11:40:34AM +0530, Deepanshu Kartikey wrote:
> The vhci attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> attach attribute is live while only one of the two hcds exists: it is
> created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
> survives the first usb_put_hcd() on removal. A concurrent write to attach
> can therefore reach a NULL or freed vhci_hcd_ss.
> 
> Register the group as dev_groups on the platform driver instead, so the
> driver core creates the files before probe and removes them after remove
> returns, and drop the sysfs_create_group()/sysfs_remove_group() calls from
> the driver. The attributes have always been created only on vhci_hcd.0;
> an is_visible() callback keeps them there.
> 
> vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> platform_driver_register() so the group is populated before the core
> reads it. The attribute array is still built at runtime because the
> number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> preprocessor cannot emit a variable number of __ATTR() declarations.
> 
> Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
> Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmail.com/T/ [v1]
> Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmail.com/T/ [v2]
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---

Did you forget an Assisted-by: tag?

