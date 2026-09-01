Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647F3A16A1;
	Tue,  1 Sep 2026 04:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237202; cv=none; b=Ym5Oy+K38gV3QZHZrp4NAuoaVtiT6rJpGjSkvAzquj5XBYDj8plAIkKWiWH1I57hPDS+1OB/CXklKAkiK+4F8ghbSaMCjaR1JazjZDzsvyD//7kvAGHfCkTJGAgdpvrrlvUIDW10LUtWGNgsOmhyx9C0e9RmbgKVYaEFjDgIS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237202; c=relaxed/simple;
	bh=JqGiFpCstWSg2rot+jsJQ6OBJWXftWxJLBFxSB8150w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFWwNkP3ouaG42RVE6UTZsh5WmuvWqvGPUqqIC5snrXKYgE1caFp1TgkD44BCBSECjNR7hsEZM928d0jnjmsIIQEW5BvD7qkJE/4LA6VaxeOQOQBNw2oIxCXj/22zH+KAVtujXUsusVLXit+uuZVz3MNMdKSvRO2ByXGpgWTjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JR5zirKO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JR5zirKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03531F000E9;
	Tue,  1 Sep 2026 04:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788237199;
	bh=kgwJ+Fc0UWOd2U7A/1P9FjxeMymAFkdTbMeLkORaG50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JR5zirKOWHcpRHOXs9Fr7UMyS6cwZxugzsUf3h27MzIl5XphnFkBcPxsZ+VyK1FTR
	 a2GxGiCG01Ogw75MLQS29UHswdQnzW2MXwPIlcYNfHu6smOw+uHH3ckq1QlI7CwrEf
	 bikpJOT1LxgaEQG4IOq936S++tV/hRY3+zlXnOvU=
Date: Tue, 1 Sep 2026 06:33:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Julian Oes <julian@oes.ch>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
Message-ID: <2026090142-walrus-zipfile-70d1@gregkh>
References: <20260901034949.118739-1-julian@oes.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901034949.118739-1-julian@oes.ch>

On Tue, Sep 01, 2026 at 03:49:49PM +1200, Julian Oes wrote:
> A USB serial port can go permanently silent when its bulk-in endpoint is
> halted: the read URBs complete with -EPIPE, which the generic read
> callback has always treated as fatal, and no further data arrives until
> user space closes and reopens the tty.

Which is good, as the device is obviously broken at that point in time :)

> Recovery from a halted bulk endpoint is CLEAR_FEATURE(ENDPOINT_HALT)
> followed by resubmission of the reads. That needs a control transfer, so
> defer it to a work item as cdc-acm already does.
> 
> Use a dedicated work item rather than the existing per-port work.

Ok, this is just llm-generated text.  Please rewrite this in your own
words.

> The
> latter is scheduled from every write completion and must not be
> cancelled on close, as the line discipline depends on it. Stall
> recovery resubmits the read URBs and must therefore be cancelled
> wherever the reads are stopped, that is, on close, suspend and
> disconnect.
> 
> Schedule the recovery with a short cooldown. The stall can persist for a
> few milliseconds, during which the resubmitted URBs stall again as soon
> as they are queued; without a delay the recovery becomes a busy loop of
> control transfers. Rate-limit the stall message for the same reason, as
> a stall is now a recurring condition rather than a terminal one.
> 
> I ran into this with an FTDI FT231X behind a hub that halts the
> adapter's bulk-in endpoint whenever an unrelated CDC ACM device on a
> sibling port is disconnected. With this change the FTDI port keeps
> receiving data across such an event.

This sounds like a broken hub, why not just replace that?  It shouldn't
be causing transactions on a different port to stop.

> +/*
> + * Cooldown between attempts to recover a stalled bulk-in endpoint. A stall
> + * caused by a transient fault can persist for a few milliseconds, during which
> + * the resubmitted URBs stall again immediately. Back off a little so that a
> + * persistently halted endpoint is not hammered with control transfers.
> + */
> +#define USB_SERIAL_STALL_COOLDOWN	msecs_to_jiffies(10)

control or bulk?  This comment does not make much sense.

thanks,

greg k-h
