Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A053C3DA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918713; cv=none; b=lkM75CNAhBu5QmIELZxMgbrgJdN1yn9wTww6tg48F9iVYpEkZfzH5xhqctomWmY1qfL8Ln8gL3xMEKSkFaaTMCJr3gxep1AN6B2zhKqN48gSqMaowigxsCT9lFviR4FsdqPIL2DQnHTtDK28cdLFO1c5kI7XAQoHtgGq77Q1XUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918713; c=relaxed/simple;
	bh=3HuQAdiPdsh0jwsZb5sHsgSWrdEkCX/qTBEkBhJKRIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHV7JWuZVV3PWHcNPM850+VCgMaRd6Gqz7wRSacvX+ohzBJKhz24iQLj91FAYGkPwVyOdLdHvfrOsS44yV29Df+YtCIhPhQ4ILahiASddkHup8wPGF7fVJaUuJ+HRqZ1MLedhshQ5e/Bxi8KaazYKJ3IAh8sq3FrRE5wL7+2Qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jYB5HlbR; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jYB5HlbR"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5350c1b9e0dso42899641cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791918710; x=1792523510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=jYB5HlbRG5U/2bWjeQZ0e1BIVUMFP+thLqGog9vaQfAEiKHAPsF198vD52pAlmjbu3
         wzhTppJOCWuUFd6tzpAxIpKlGqshaJ3Ap8ACpWD9T0UbdCfbIEmkUMO6h7yX/0dB+45L
         nbirKPSHlsE7kepk2T70UlSzu17r5edw7hmV3/DlCvvRPMmHH+aURwXGw1Exgz8eVujJ
         NQKVFkwMXILXElBEKaYr0VU8uYpIcMFQU6T5kdutbaH3VI1X55DyFvzLuS5UdkAR/uuW
         0jGQvTFiBCwlNc4U3yhH/kmtaO4lctSTz3+EhBP9Ah/xhUT9cV/+OuAdw/G4HZd375QO
         CviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918710; x=1792523510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=RPF8JuNZBIgd+mwOBk5esBkKO4OQSo2G8waHgwLRXHQhA5wtP53ewWma9y1aoqetEe
         eX2MuVJgn5H+pzJocNrlvP8cX4SeWZvfZX//oNLSQFs8fH8dV8C4LZSbJy94sjzGZSDp
         ++kOERvvcey986sZSqYj9j/8F/B+zE4t5GvI2h+S+Z6raQqJ9tvHjUIR6ejiRLnGVzi1
         IATbSS7h9v7bU9PWoiOVCjOhNI/JdQSBDvQNCOPFw+/P9bgEUtZmYdw0r8UF12hZWqs4
         kz542rW9+8fDl4X9lqQdPxSClf+6hNL6wsLyotjaarBKOlUv0G3ZyYEWzZ1vxnZ+sJRn
         wlsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX+YZ4NmlUe7nFKSJaq9ToNn4gjY2Ai8AdclZlxvORXvf8s/EhPtOzxr+zMj8dHFuxAzU+Qv8yp0VNqso=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLH7kOYn69z4AP/G3d4ZwoneGr9XFjY7TI0ege8cvKwZCRqd39
	uVFY+F0T2dkPI9Ey2QYL190QPT/2uEIfTQvwWdY+rXTBvpJ5QheN69DIsZDlwCpxAg==
X-Gm-Gg: AYBFou1ShwNPlIPHzlCVgbsmxKEw9rA1WukA283022hVOqp+BogePPXfIm0tBjKGWDw
	+A6oGkCz9zkvCWJ+NaMKniGCcVh+/wt/hyv5T8/a9zu1MjWSji278BNIu0sbdv3udI6JwCrX2zn
	N10iA9loJvEEpyzHhLTd8QsUYzYW9KE+H6XJA2001rPlNabpqe9x76w+bBW/L+uGbWnZVi5/3X0
	tfumy0Gn6U3Ys7f81GUoTxRpxDZmOz40zF1nrgClW18LIoZTXUvHMy92xLpkqFysmn03i9MelOI
	sDmc462dW1Rh3zQTWnd/A3LQsxwyVcsJvIF5C0RX0ApZoOoABzuzGBuAX94P1HFvBT/deSzcfnN
	N5zNiQaVWXiPu4lFLVR8K3qFM2/kMJLLZca2XqvH6L7yF2zDR9SBat/GWhDaH4zObFxudQqK+ri
	XRhVrURsWNjSSOlllGBm7WgQNdPevrklfYhKUZalbRo2iZrvI3Tde3SSqWcnnQfuUqLiDAdmCdu
	YO23LoPYKdinwbD9gEXvEqF4+LuvxXJPhJHVSZaBw==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id d75a77b69052e-535a5fb84aamr206754931cf.70.1791918710428;
        Tue, 13 Oct 2026 12:11:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ad30csm109382571cf.23.2026.10.13.12.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:11:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:11:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: take parent lock on deferred probe
Message-ID: <ba24846a-7403-4bb1-a0cb-869cf1d44e05@rowland.harvard.edu>
References: <20261013140615.1226992-1-johan@kernel.org>
 <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>

On Tue, Oct 13, 2026 at 07:43:08PM +0200, Danilo Krummrich wrote:
> On Tue Oct 13, 2026 at 4:06 PM CEST, Johan Hovold wrote:
> > +void bus_probe_device_deferred(struct device *dev)
> > +{
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_lock(dev->parent);
> 
> This looks like it has the same potential UAF as the other patch.  It's quite
> unfortunate we need the whole need_parent_lock thing just for USB.  IIUC the
> main reason USB needs this is because interface devices share resources of USB
> devices and we need to keep the locking order to avoid inversions, right?  Is
> there more to this from the USB side of things?

That's pretty much it.

> I think we can probably do something like this
> 
> 	struct device *parent = NULL;
> 
> 	scoped_guard(device, dev) {
> 		if (dev->p->dead)
> 			return;
> 	
> 		if (dev->bus->need_parent_lock)
> 			parent = get_device(dev->parent);
> 	}
> 
> to avoid the problem, but it's still a bit ugly.
> 
> > +	__bus_probe_device(dev);
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_unlock(dev->parent);
> > +}

Wouldn't it be simpler just to make each USB interface take a reference 
to its parent device?  And likewise for USB devices, if needed?

Alan Stern
