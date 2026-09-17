Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AB585969;
	Thu, 17 Sep 2026 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654614; cv=none; b=pIUQ57sH1KAv04+Q0HoHb5emxRraStf550pLfLCRznvFrrxmr2XRdqXdOXH+9Ykp+Y+bWWa7M/PMSxTa/+bxN7Q9dWid2dzkvPCLrc+ASw5yTt3m7W9AutR7wdg3rJQkRL6gD839A7OmEErgtH2KJqrjK3G3qn1CKakG3nBQcGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654614; c=relaxed/simple;
	bh=qUQpEwEAf03ydxY/z49pwtC0JzrodVH85vpCXMSp9WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgIw7IklN4ru4lGzmrxTQazDjxkneVmD/x1reEJsCch2/hB/vHuAu0d7mZj23E8D6/uwNcJ+5UXgQWEp/Y5K4snfwndhwvxtUCQK/OgqC+vpHeVhMY4nr3pClDYzkhYkuaKlsRePfQiFYt8bV/aO/kEhRQleVjabekjQ/nw7U8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hrYW/0cB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hrYW/0cB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9061A1F000FF;
	Thu, 17 Sep 2026 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789654611;
	bh=eDW8IouqkovElgfc32IDNMAM4R26qJXqrPUo54akiM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrYW/0cBcIW3w0qdxci8Ag7Mm3r2foDbv4BzufAfK/AdMnQNHKVnH8Z4A7RQ1qO8m
	 grW0JgXa+mlrfFhrHczGGrB/PO7R8dsWEKab5VWv1Oj9JP2WJFtE/nXIW/7tOP12FA
	 QN1U6rH5k0y1qcP2RafoaTlAzPc/AuqveahpapZE=
Date: Thu, 17 Sep 2026 15:08:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <2026091756-unmolded-fructose-a018@gregkh>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
 <2026091739-spousal-linked-2a36@gregkh>
 <20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917153736.600061de@OMT-CWNXR4TFW5-LHT>

On Thu, Sep 17, 2026 at 03:37:36PM +0200, Alban Bedel wrote:
> On Thu, 17 Sep 2026 09:27:42 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, Sep 17, 2026 at 10:11:03AM +0200, Alban Bedel wrote:
> > > Use tty_port_register_device_serdev() to allow attaching serdev
> > > devices to USB serial ports. Also set the ACPI companion device on the
> > > USB serial device to let the serdev matching work on ACPI systems.  
> > 
> > "also" should be a separate patch, right?
> 
> Will do.
> 
> > And I didn't think that serdev could handle devices going away at any
> > point in time, when did that change?  How was this all tested and what
> > ACPI device wants to use this?
> 
> The use case here is an x86 embedded platform with a soldered USB serial
> adapter connecting to a MAX9265 GMSL serializer. As everything is on a
> single PCB there is no question of anything getting disconnected at
> runtime.

You hope :)

> But I now see that I missed that the bus remove also need to be
> adjusted to use tty_port_unregister_device() instead of
> tty_unregister_device().  With that done the serdev device get properly
> taken down when I manually disable the port. With a small fix to the
> serdev core it also comes back up when the port is enabled again.

Please read the archives for why we don't want to do this unless/until
serdev is "fixed" to properly handle dynamic device removals.

> The ACPI part is a custom DSDT overlay that defines the chain
> starting from the USB port. At this level there is no difference to 
> classic UART where serdev are already working.

So acpi now defines USB to serial devices?  Is that new?

thanks,

greg k-h
