Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243069;
	b=ciCh6uzFnjUNOBEXo0trIuE8zx1eR20PzhHpLLLosD5ajCkhO8LSxSkORk08/W51ue/E
	 C3+eajPofaueQtC36aTg9EnWEz67fnK0VozefR5rJp6eckyv+VjegmFnWZ87rStyQqSux
	 1qSWUAQJuoKHFk6XDhyhIpj9bfT9V/zCnOIdYJ0tsHKgn0Lc18s1rRbsaERCcRCSaEpwm
	 YyrdDGGeRiWjqnyrmabuxz3CuFvbZSxapfXJXPf5XnM/wCiSefylhzLf5a3UCQu9ihBeB
	 jRk5+Kca/l9qAMHq+3vmMBmcDU4mBEM1NLIzpiv/Hm1Zh7TsOW8iLcPGsEw09CCP27w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
	b=rl6QXjlESbCeGAwklX6zfV/qMnwS4r0Dd0f3xusTP7rdA8XSYBZQyEUqw22GeqnmPPb/
	 d0GTiatYKaWPfjT70YIehduRG0tWup+BAZ/T2D794v+V/DiMKhpmqA4TRofGh4mR5GtvE
	 F3fF/bOrIiRFF1i9bMGSPyPu37cX+xBpKZ/ZsD5XN3ZDhv54gVPN7oPt5Zr7H7NS3V3TL
	 JA552pUGyVDF3kkXjLc9vrjIJuGGyRJHNCBjkWc0J83UgIbuSRouGIUApnyFlCPZIt98w
	 RwUubChCU8ESohkvu4SOmpFp0o9QtlIseb88qUgyFDRWv6t1lk0r1vyC/bXLlv/ycWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eVUtPdlI;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11AA60A2627
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11AA60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eVUtPdlI
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ebdf1c2d1so11931716d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794243068; x=1794847868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
        b=eVUtPdlIxx2K2Thn4bqSyzcFLOC9yflVfdzDBaB4D+MZJCGwgOy31UmzpcqO46/0m+
         NqWjbSsE1jkuTeEv23cQkZpnXMJAhTVCr5b1jIlfQ6X2NXmuFQvqIA4hPTtsZaHKBZJG
         6gjTfeUHOhB45RMJCn8msDinbGOCyzFB9RzGNN9IMDXOiShevnhn6LLswqZqui2OdzcL
         bEDax1ClcWmvMhK3nGHlz50MOXdBGC7DHdg3Q7evUMrq2fJWPAhFYJvqFC0ZwE/mPUsY
         XqJfT7QBn8XjXpnh4GqL9BuuEedeOkge01onJ6F/wC2JYQyl0aWoW4Y/OkIDSzQNqsdT
         FAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243068; x=1794847868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
        b=yHcONRVNFUc4ot5aTXaGCdD6WKcF17TEOXRI7PEsjHy8r8rkkFRV2eC9dPveMbpSgc
         b4D/jzGlMA/15kW1HWh2EGWEXF/J2AeRl3WN0RlbbtoGB2EXDHKLW6+i4uXb6CQoFcKf
         12E+VCtBqF6R3+odlXTtYxVSqtVlJDK1+ouBkiaUNcnx2Pl8VZRtC/9rGLJuTTFPwZmc
         uFGjBLJiAKuSRNzx/lYuNbW7ej9vjYhqbS3He+cONXJICW9CS2Hn5ah3sZkZLy27J7Fv
         /xaqSN1p+6svVZrrDGkAVivBJxNRzW+ceUq8CPDxW/0Kd140qCc2Eh/sq5y3P2rJjFZp
         XcBA==
X-Forwarded-Encrypted: i=1; AL+hErGbp0YtsG87v6y8WfphqYjul7kgrd8sg6MkuiuBRv9cBeEMI1rWyTgPHLKsMdei3Y2LUNDuj/h47Co3UCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jqzBUFg38IUSAiK35exX8uBNyFK/1Au/KqAmi+8WF658e9u4Q
	muX4qwuVhLibIDmmd/yNaU1LYTugC9YjtZr0YRsHrrNjEdvTsyl+JqFYYXUf/co+jw==
X-Gm-Gg: AYBFou030GgjDx0zhWKB3x8SLWgL79dScXZ03wJKnEnxNJ+4rSoOLaYs8UvOJepWd2K
	bHom/IywsF31QeEOfSe8HG3tZChsZeztkqSw+sdpL8qfelBhoLDT3qEH7XSb0fa7ksvX3aEKa0P
	nb9zOBH2oCvT3QP1i2J5SKI+E3qd41hh0DusJ7tYHFQ3I2c7zG8UhFkNJzIcJ6gXjehnyXLXMEE
	jIvqMBjRa6aW+O0gJ8oVHIACp9z3mrLTiEm/XL7Ctwn6mk/AgzNosbekaI9zzului4FB/5EyQps
	0u73xa57vCjgZQaipVIy2rvbLVH9dn3eNqIOFe4ebg3PvQ9GjZZH3Q47LmOGY5qX7u/xsZhhDGw
	MKbSTLN7XZyGaP1v4gOf8kHWH1ivsTBEE+qSfEO0uE71tOaXdqT0+su2W0vU8iexoYnSjE0IsUY
	tw40SELYH6D6dYRagUlAg+YqIlxQ3Bsyz+ArCi0OoWQOSVI2OqfnMEJkVqxrqHhKrU/l1iosGmp
	aI3nQYlqkl4s5yQ2vRJsW51/+tiV4LDhsi4TrPBzfB8CYglb6kynj7K3l8Nuj1VpTvqUkTUKXDK
	UYuHvAj1LQF9PyusFt6l8HOXUFfF
X-Received: by 2002:a05:620a:2b8e:b0:945:f5c0:a63f with SMTP id af79cd13be357-9479f228752mr4974385a.5.1794243067581;
        Mon, 09 Nov 2026 08:51:07 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ce960sm12830485a.31.2026.11.09.08.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:51:06 -0800 (PST)
Date: Mon, 9 Nov 2026 11:51:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Message-ID: <72c56e59-9e78-4536-a0e8-8007aaa46fda@rowland.harvard.edu>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>

On Mon, Nov 09, 2026 at 02:50:51PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
> 
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed.  This
> triggers the warning in dummy_free_request() and a use-after-free when
> dummy_udc_stop() subsequently drains the endpoint queue.
> 
> gadgetfs_setup() and the userspace copy helpers also race on dev->req and
> req->buf:
> 
> 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
>    is queued by gadgetfs_setup() and completed by ep0_complete(), which
>    leaves the payload in dev->req->buf and sets setup_out_ready.
>    ep0_read() copies that payload with copy_to_user() after dropping
>    dev->lock, so the copy can fault and sleep.  If a new control transfer
>    arrives during that window, gadgetfs_setup() reuses dev->req for it;
>    for example, GET_DESCRIPTOR(config) points req->buf at dev->config.
>    When ep0_read() resumes, clean_req() frees whatever req->buf points to
>    at that moment, which is now dev->config.  The following
>    GET_DESCRIPTOR(config) dereferences the freed descriptor.
> 
> 2. ep0_write() versus gadgetfs_setup().  For a delegated control IN
>    request, ep0_write() prepares dev->req and copies the response from
>    userspace with copy_from_user() after dropping dev->lock.  A control
>    request that arrives during that copy can point req->buf at dev->dev
>    or dev->config, so the userspace copy overwrites a descriptor buffer,
>    or it can reset req->buf to dev->rbuf, so the request is queued with
>    the wrong buffer.  Completion then calls clean_req() on the wrong
>    object.
> 
> Copy completed control OUT payloads into a separate setup_buf in
> ep0_complete(), copy control IN payloads from userspace into a stack
> buffer before preparing dev->req in ep0_write(), and reset req->buf when
> control transfers finish.  Track whether dev->req is queued, reject reuse
> while it is queued, and dequeue it without dev->lock before freeing it in
> gadgetfs_unbind().
> 
> Only the buffer allocated by setup_req() belongs to the request, while
> descriptor responses point req->buf into dev->buf.  Track the allocation
> explicitly so clean_req() cannot free a descriptor buffer when a request
> is destroyed while an in-kernel GET_DESCRIPTOR response is active, and
> wait for the asynchronous usb_ep_dequeue() completion before freeing the
> request.
> 
> Count setup callbacks and recheck the count in ep0_write() after
> copy_from_user(), so a control request that arrives while dev->lock is
> dropped invalidates the stale response instead of having it queued for
> the new transfer.
> 
> Wake an ep0_read() that waits for a delegated OUT data stage when a new
> setup aborts it, and include setup_abort in the wait condition so the
> abort is not missed.
> 
> Consume setup_abort through one helper that returns to
> STATE_DEV_CONNECTED only when the state is still STATE_DEV_SETUP.  This
> keeps the following event read out of the control data path without
> overwriting STATE_DEV_UNBOUND when gadgetfs_unbind() ran concurrently.

This seems like a lot of material for a single patch.  You could break 
it into two separate patches, one to handle the ep0 abort races and one 
to wait for outstanding requests to complete before freeing dev->req.  
Maybe subdivide it even more, if you think that would help.

> The setup() callback runs in interrupt context and may not sleep, so a
> mutex cannot be used to serialize it against ep0_read() and ep0_write().
> The shared request state is protected by dev->lock and the payloads are
> handed off through private buffers instead.

This sort of material (saying what you decided _not_ to do) doesn't 
belong in the patch description.  If anywhere, it should go in the 0/N 
summary message.

> @@ -1073,13 +1123,20 @@ ep0_read (struct file *fd, char __user *buf, size_t len, loff_t *ptr)
>  			struct usb_request	*req = dev->req;
>  
>  			if ((retval = setup_req (ep, req, 0)) == 0) {
> +				dev->state = STATE_DEV_CONNECTED;
>  				++dev->udc_usage;
> +				dev->ep0_req_queued = true;
>  				spin_unlock_irq (&dev->lock);
>  				retval = usb_ep_queue (ep, req, GFP_KERNEL);
>  				spin_lock_irq (&dev->lock);
>  				--dev->udc_usage;
> +				if (retval < 0) {
> +					dev->ep0_req_queued = false;
> +					clean_req(ep, req);
> +				}

Here, and every other place where dev->ep0_req_queued is changed to 
false, you need to call wake_up(&dev->wait).

>  			spin_unlock_irq (&dev->lock);
>  			retval = wait_event_interruptible (dev->wait,
> -					dev->setup_out_ready != 0);
> +					dev->setup_out_ready ||
> +					dev->setup_abort);
>  
>  			/* FIXME state could change from under us */
> @@ -1781,15 +1883,29 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued = dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
>  
> +	if (dev->req) {
> +		if (queued) {
> +			usb_ep_dequeue(gadget->ep0, dev->req);
> +			/*
> +			 * usb_ep_dequeue() may return before the completion
> +			 * routine runs.  Do not free the request until the
> +			 * controller has given it back.
> +			 */
> +			wait_event(dev->wait, !dev->ep0_req_queued);

Otherwise, how will this wait_event() call be triggered, if it is 
waiting for a failed submission?

Also, it would be worthwhile to create a separate subroutine just for 
submitting dev->req.  The same code is duplicated several times in the 
driver.

> +		}
> +		dev->req->buf = dev->rbuf;
> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req = NULL;
> +	}
> +
>  	destroy_ep_files (dev);

Logically, this destroy_ep_files() call belongs before the dev->req 
stuff, because ep0 is created before and destroyed after all the other 
endpoints.

Alan Stern
