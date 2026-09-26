Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827F3E49F6;
	Sat, 26 Sep 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423792; cv=none; b=fwkH8uMJTqZO116/eSJIgh5mqRNMtJV46GaJz4XyJ+5Gd7QW2lt2jU/HwSicGRcsz6fuEF6ov3swp42m0dUVj9puO3CPG8P5v0ynxZqxzOUykCm9hcw4mkIQTuxLz+Y/r/BTQupH0LSWKLo8ZpzWeRyaqu5NKYaixt9JXrfxrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423792; c=relaxed/simple;
	bh=DLK/a0bgIiILfFs7CmjwZmIMl5wvayMUL2KfBC/TYFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3tKbp8Pj0q6ei3/062ewstUDH+GvLmJADRzaYRTdwKVGfKXWb/GAT7YQAHN9CKXc7OiS4c0Zo7aedoevC7dQ9Op9kMcSjc/uoALP+ieavifI1sXtgH9PV1a/GQYUtEh8/kUmRVWUjmafEeZJjoeyQe0NmhD01y1YwkNkxvj280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=k37r3kJi; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="k37r3kJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790423788; bh=DLK/a0bgIiILfFs7CmjwZmIMl5wvayMUL2KfBC/TYFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k37r3kJizpEKjCkeAVcE2TRlrdcJuLmPsHCi26nRWuIJ4Z9X9zTmzGUG+I8oyHpaA
	 9ueDE5YEg79QO5mE9CNqPP8opsfEtwTyta8cxYPoUVgjBeybOEjT3O+Ti4bWTuFRGb
	 mZNPtWXhvEbT0EaY0kgtLkAwzoVH2yKEhGn73vpI3cGy5DCS90Ja28gpOraGlpLfQk
	 fZgVDRTyWCWyMb2NYnkGQnm05A1+9ojXvXd5rWTGlKpYm+6CShiiaGV4b3M7LhCspQ
	 oFSjmWwl7/6XghSZHRR6fovnsZ5FqqVDXoaZflTeNDUUMAwA2OPXlpLQmcgicUhiqH
	 /NBlTo5k7TINg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 2674040B86; Sat, 26 Sep 2026 12:56:28 +0100 (BST)
Date: Sat, 26 Sep 2026 12:56:28 +0100
From: Sean Young <sean@mess.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: imon: fix use-after-free in display_close via
 dev_dbg
Message-ID: <arey7Lyzlb2lq09P@extorris.mess.org>
References: <20260918054851.26083-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918054851.26083-1-kartikey406@gmail.com>

On Fri, Sep 18, 2026 at 11:18:51AM +0530, Deepanshu Kartikey wrote:
> ictx->dev is a raw pointer to the usb_interface's embedded device,
> cached in imon_init_intf0() without taking a reference. On
> disconnect, usb_disconnect() can drop the last reference on the
> interface and free it while a userspace fd for /dev/lcd0 is still
> open. When that fd is later closed, display_close() dereferences
> the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> 
> Fix by pinning the device with get_device() when ictx->dev is
> assigned, and releasing it with put_device() when ictx is freed.
> 
> Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/media/rc/imon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 049a73b5f882..9341dbe03b57 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -502,6 +502,7 @@ static void free_imon_context(struct imon_context *ictx)
>  	kfree_rcu(ictx, rcu);
>  
>  	dev_dbg(dev, "%s: iMON context freed\n", __func__);

The dev is only referenced in dev_dbg() here.

The debug statement is pretty pointless anyway so why don't we remove
that instead.


Sean

> +	put_device(dev);
>  }
>  
>  /*
> @@ -2253,7 +2254,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
>  
>  	mutex_lock(&ictx->lock);
>  
> -	ictx->dev = dev;
> +	ictx->dev = get_device(dev);
>  	ictx->usbdev_intf0 = interface_to_usbdev(intf);
>  	ictx->rx_urb_intf0 = rx_urb;
>  	ictx->tx_urb = tx_urb;
> @@ -2314,6 +2315,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
>  find_endpoint_failed:
>  	mutex_unlock(&ictx->lock);
>  	usb_free_urb(tx_urb);
> +	put_device(ictx->dev);
>  tx_urb_alloc_failed:
>  	usb_free_urb(rx_urb);
>  rx_urb_alloc_failed:
> -- 
> 2.34.1
> 
