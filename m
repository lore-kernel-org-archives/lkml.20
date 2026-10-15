Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF53ABD90;
	Thu, 15 Oct 2026 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052911; cv=none; b=SctlcUvpFiYmgxwaPIGeSrkei0XBNb3goZM/08eH0919hELNP+tSpzGlV0kAsFBfTQcqJkZn/dIqS3/Fu3HU9jDNakZ88lJ4rl+vkhvon1WBMwWP1KlSfBviv32qvPnEJM2KkomR6z5io7JEAAJvG3A9O19e4rWX/ggpymT2OqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052911; c=relaxed/simple;
	bh=74/xrUjBmhy/hBYGQNVx7rE7cCVNyFMGw8kk5FZHCgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj9axwbfNqHqd75MLghaG3us7Q4aBP8Q35M1gA+cFFERNV9EyHVTnHykg65A82/wy9HNcOhwEheqAftblsQZawHrfoJ00AzjtcJncGyTYcwMs7jmn1aF8fEQnOUHtREI0FrhrAXC8IujHKNlBBXFGaOv4JeQotFCkhE8kcH46pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3Ysde+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3Ysde+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACD11F000C4;
	Thu, 15 Oct 2026 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052910;
	bh=Syv2U7qOHInP7OCx7Iw4cZz4BGPR69oUDoJy54aqFf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3Ysde+zzfc1ttiANHu5w7bbYCc7Jz9EyabJCzufWXNC2c6VOpx6x02mi8MuqA2Z3
	 29EljYGKLcXS1B1ZI0KsCrTfn85CLoeuTCKO+aKFD4vnhg1EydWoGALOVjH7/x4Bu/
	 S3lE4fF5VzQq+E73RZkjPplnM5wvVGG6hvEqnbF96TI/A1v1gRtJ7FsSwSpQju+Zwm
	 RUK7jbeKBVA7J6PQ/xI59kvsoUsl/1TsfxvOC2wYC0o9/dYuBfGz17Th6qv86IEBJV
	 mYuOUHaw+G+EM6bl/2AQh0H4cVURVbmBiKK9A3ga9hh89rwos7UFDKeNTJnUfkk435
	 QvB4MCzo1e2aw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHGp9-00000005xZf-4AQ8;
	Thu, 15 Oct 2026 10:28:28 +0200
Date: Thu, 15 Oct 2026 10:28:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <atCOq_kAAoUzKGRw@hovoldconsulting.com>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM59BD7BDUHZ.2BON4KMXDR086@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM59BD7BDUHZ.2BON4KMXDR086@kernel.org>

On Thu, Oct 15, 2026 at 10:08:36AM +0200, Danilo Krummrich wrote:
> On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > USB interfaces hold a reference to their parent USB device to make sure
> > they do not outlive the parent.
> >
> > Add a comment explaining that this reference is specifically needed for
> > asynchronous device resets and the device type need_parent_lock feature
> > (to allow driver core to lock the parent when only holding a reference
> > to the interface).
> >
> > See commits:
> >
> >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> >
> > for further details.
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> NIT: Maybe add that the reference count must be held until release().

I think that's implied as the comment refers to the lifetime of these
objects.

> In any case,
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks for reviewing.

> > @@ -2209,6 +2209,11 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
> >  		pm_runtime_no_callbacks(&intf->dev);
> >  		dev_set_name(&intf->dev, "%d-%s:%d.%d", dev->bus->busnum,
> >  				dev->devpath, configuration, ifnum);
> > +		/*
> > +		 * Make sure the interface does not outlive its parent (e.g.
> > +		 * as needed for usb_queue_reset_device() and
> > +		 * usb_if_device_type->need_parent_lock).
> > +		 */
> >  		usb_get_dev(dev);
> >  	}

Johan
