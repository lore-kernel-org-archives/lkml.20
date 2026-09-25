Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9273672A8;
	Fri, 25 Sep 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361095; cv=none; b=ZX3BoPM5idI7R05GVIPVOfcP04xvgUytNGz0byc9lc6FqylG/HTkwsDF0icfNPjQbABq1u/md0j21NQ5HI+3RbvLANsSk7X6FdSPmpdhgC6KrpxS4wtPg26cbUZJcd8q0UAMNKMddBumGT6CIr+DietwLxOe9nIhF634Y948SZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361095; c=relaxed/simple;
	bh=GhWSGXgb6ez4OOrQiFVWLTGHIi3aVeLSqI5fxtUPyJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjm0D0sJFXEUKt9/LFUZyUOlyfeI61kTGXKiNzt4MVXxcuqK6tEKoRQpi/rZ6oIkq+FAcp4av94tEqRb7tfgR38bMtfdPUBCPFnU4ORFGCkkGGAr6Ker1aRzcXFnsVRhay9AiPAGLn2mMKWcyMlWzBn8HI7o/JagOAWNwl+OuV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=OfYHt7Ka; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="OfYHt7Ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790361084; bh=GhWSGXgb6ez4OOrQiFVWLTGHIi3aVeLSqI5fxtUPyJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfYHt7KaVKjMMMuMCiLtQ8+0J0j7VXGxdimP72otOLHqJA2GE1h4EA0QIMVcJp12B
	 8jhRMbCgfK1XszzV/UuHfMHxq0tLGq8LPGOSjhemOHwj1yZV6a0jC6zl089dzxxZ9L
	 Qn6rwNj1XZEdpGcUw8i7dLpb0X1QGJkv4iCvzFfcI3aOVX79ZPUFOedQrXn+OAcB5z
	 FOIBrviUFrIv5YbrPVDxXnLOxjE4VMfflEBNaxIJOuo9cSoNTknqTo6VL41MtrCapo
	 OWVZcKEy8H9WaVL7kGtKE8S6eDjOrdqcmUQgW/WWv91nm8iE4knkVNcbrLmzYNgdQv
	 9k9mOW9GYzBXQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 4D67740B86; Fri, 25 Sep 2026 19:31:24 +0100 (BST)
Date: Fri, 25 Sep 2026 19:31:24 +0100
From: Sean Young <sean@mess.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: redrat3: unregister the rc device when probe
 fails
Message-ID: <ara9_KQVA4qPK37y@extorris.mess.org>
References: <20260925170711.22447-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925170711.22447-1-ngocthang2710.1999@gmail.com>

On Sat, Sep 26, 2026 at 12:07:11AM +0700, Nguyen Ngoc Thang wrote:
> redrat3_dev_probe() registers the rc device, whose input device points
> its name and phys at strings embedded in struct redrat3_dev, and only
> then calls redrat3_enable_detector(). If that fails, the error path
> frees rr3 but leaves the rc device registered and leaks it. Reading its
> "uevent" attribute afterwards dereferences the freed name/phys:
> 
>   BUG: KASAN: slab-use-after-free in string+0x4a9/0x4f0
>   Read of size 1 at addr ffff8880272bf758 by task repro/4968
>    add_uevent_var+0x183/0x3a0
>    input_dev_uevent+0x162/0x900
>    dev_uevent+0x2f1/0x870
>    uevent_show+0x1ca/0x3a0
>    ...
> 
> Unregister and free the rc device on that path, mirroring
> redrat3_dev_disconnect(): stop the URBs first, since their handlers use
> the rc device, and only then unregister it.

This is already fixed in:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/af452b9e01331b5338a1e5141624f17607239207?anubis_answer=mango

Thank you for reporting and writing a patch, it's appreciated.

Sean

> 
> Reproduced with a raw-gadget RedRat3 that reports detector status 0.
> 
> Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+2a123f6269da57ffefaa@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2a123f6269da57ffefaa
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
>  drivers/media/rc/redrat3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> index 3f828a564e19..e9dd563e9cb3 100644
> --- a/drivers/media/rc/redrat3.c
> +++ b/drivers/media/rc/redrat3.c
> @@ -1111,13 +1111,19 @@ static int redrat3_dev_probe(struct usb_interface *intf,
>  	/* might be all we need to do? */
>  	retval = redrat3_enable_detector(rr3);
>  	if (retval < 0)
> -		goto led_free;
> +		goto rc_unreg;
>  
>  	/* we can register the device now, as it is ready */
>  	usb_set_intfdata(intf, rr3);
>  
>  	return 0;
>  
> +rc_unreg:
> +	/* URB handlers use rc */
> +	usb_kill_urb(rr3->narrow_urb);
> +	usb_kill_urb(rr3->wide_urb);
> +	rc_unregister_device(rr3->rc);
> +	rc_free_device(rr3->rc);
>  led_free:
>  	led_classdev_unregister(&rr3->led);
>  redrat_free:
> -- 
> 2.43.0
> 
