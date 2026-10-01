Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C478249E123
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856509; cv=none; b=h3COgIjn5PqB4xgDOSCQ4KhEzn4zIuDB+lwprx91C0HnSEYU3e4wSi+vdcGiCPySxs5xxmGuh3xRyVIdJPXoII7TGsRDbxInxeVkWHFsSE/XPwdEGYnGBfXc8yjG+/yq7FGexh7FrRYB0Cz8j+T7/NoFMvM+GGCWBU+Cwod6bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856509; c=relaxed/simple;
	bh=MJaaaiBRJp2QQd9fCF0yx4zBeek/eSwiPCS/THk63jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkC4T5mMpjoTQGZJ0YM+73/dPZODosoYfHp9M9cZz61LyByD8y7QrjE1uvhe9XpxX1kd4aIxBSUrMBeHtJ5Tn5KO2GqtE+KODYDm21OI8SZIFawSP6tIVWGrzkSXegw+80foMil0mr4lCtKrsIWoOdj224a6TCcqy8fkbmsLqnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LYVObL1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LYVObL1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C161F0089A;
	Thu,  1 Oct 2026 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856489;
	bh=Ah8AgwD8DazwVgsIZKemt6y5rvFI/je2QLh9kfLO9iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LYVObL1YKrJpbS9ydQ8GPAKLfWL3hEz0P5WMYcpNdDQEeccPCXYHUb75sd9TXvbOv
	 QhBnQFwOchpnn3HVWno4YnY0l7M6g0GtdtXk8PQY7Ggje/Tq8Kp5l9vGRCE4UsQK6z
	 VBNCfSjct6cno86mJzP9COmRSqWD7YvF0ALeaXHo=
Date: Thu, 1 Oct 2026 13:54:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anh Khoa =?utf-8?B?VsWpIE5ndXnhu4Vu?= <khoavna.tin.2225@gmail.com>
Cc: jirislaby@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: phantom: fix open file UAF after device removal
Message-ID: <2026100113-tribute-explore-922b@gregkh>
References: <20260831151326.131296-1-khoavna.tin.2225@gmail.com>
 <2026090121-bloomers-egomaniac-776b@gregkh>
 <CAK5ebCne_H-p9yaastoJnMk7k8SXtiaRohZruXN3xZGvsRa8zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK5ebCne_H-p9yaastoJnMk7k8SXtiaRohZruXN3xZGvsRa8zg@mail.gmail.com>

On Tue, Sep 01, 2026 at 05:30:08PM +0700, Anh Khoa Vũ Nguyễn wrote:
> Hi Greg,
> 
> Thanks for the review.
> 
> This was found by source audit, not by a runtime crash report.
> 
> I was checking char drivers for the pattern where:
> - ->open() stores a raw device pointer in file->private_data,
> - ->remove() calls cdev_del() and frees the enclosing object, and
> - already-open file descriptors can still reach
> ->ioctl()/->poll()/->release()
>   after cdev_del() returns.
> 
> phantom.c seemed to match that pattern:
> - phantom_open() stores struct phantom_device * in file->private_data
> - phantom_remove() calls cdev_del() and then kfree(pht)
> - phantom_ioctl(), phantom_poll(), and phantom_release() all dereference
>   file->private_data
> - __fput() calls ->release() before cdev_put(), so the enclosing object
>   still needs to remain valid for an already-open file
> 
> The remove path I had in mind was manual driver unbind while the device node
> is still open, e.g.
> 
>   echo -n 0000:BB:DD.F > /sys/bus/pci/drivers/phantom/unbind
> 
> That should call phantom_remove() even if a userspace process still has
> /dev/phantomX open. The open file pins the module via .owner, but it does
> not pin struct phantom_device itself.
> 
> I should have been clearer in the changelog that this was an audit-found
> lifetime issue and that the trigger I had in mind was sysfs unbind.
> 
> As for testing, I only compile-tested the patch and ran checkpatch. I do not
> have Phantom hardware, so I have not reproduced this on a live system.
> 
> Also, yes, I can simplify the locking change and use a guard/scoped_guard
> helper in a v2 if the issue is worth pursuing.
> 
> If this is considered too theoretical without runtime confirmation on actual
> hardware, I understand and can drop the patch.

Please test it properly and send an update if you wish for it to be
accepted.

thanks,

greg k-h
