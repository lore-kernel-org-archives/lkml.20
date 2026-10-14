Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726EE2931FB;
	Wed, 14 Oct 2026 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954087; cv=none; b=oioqPhgAj17jU8zqvBiEIysnW7ENQxb+vUhGpyER+kwtZEUGIjdIZT21HkEDDNW2OuI9KWrDmurrdOvr/1d2EqOz7zov7MdLTzlEKK6z3I3RY8qePTEKHh5l9pEoFzgkDfMJYO0K8bPT8OFTnAsuPuxP+3FnUhOy7YYlp78/S9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954087; c=relaxed/simple;
	bh=6NjnpfpfXmm0tK3iMsNcWy1R/OZoGK6mpI/wOQWA504=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyDEE4Y4xnvKjG8dfNrYk+UVsckK0435t26pXQWhqdZzhipmGdJMqsTjc0A+u0NlXu/yvMq0cdh+b36Ec9q8CBRcu+yDuBMLa9YSxrJshTlsGBgzpV4kOT7S+EPQhaGIgNbrFURQZEBRkWHJTdfeW26anLB1UgQcHQyY8LDF0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zmj7Bg6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zmj7Bg6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737701F000FF;
	Wed, 14 Oct 2026 05:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791954086;
	bh=dvp2MnZGyz4TCYY4bOldhCQXpFhZkzQswKXfILlGTSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zmj7Bg6kYiGA9VS8ewMvYvPMh/Rkw/dkUY/kWlYPd1iNrgirh0a6vlhvA2pqKIp9t
	 923zw34+bOAWe/YE4fr6TgC7ofx7veEp6oFYU8bPCVijWDc7jRcAb09+MqNArbfST+
	 upFF5PifaoxvIn3EbiQApPou9gk7sk/nzSvXxlR4=
Date: Wed, 14 Oct 2026 07:01:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fabien Sanglard <sanglardf@google.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
Message-ID: <2026101410-undergrad-deniable-44c0@gregkh>
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
 <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
 <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Tue, Oct 13, 2026 at 09:48:21AM -0700, Fabien Sanglard wrote:
> My original patch focuses on fixing the silent failure for usbfs
> drivers (like ADB). Since other drivers survive a reset without issues
> from a user space perspective, I wanted to avoid being disruptive to
> unaffected systems.
> 
> That said, unifying the behavior upon reset would be elegant. My main
> concern is whether some existing udev rules or netlink listeners in
> user space might break if we generalize this behavior and start
> emitting unexpected CHANGE events for interfaces that successfully
> rebound (which already emit UNBIND -> BIND).
> 
> But it might be worth "trying". I am unsure what the kernel team
> philosophy is in this regard. If you all agree, we could trigger the
> KOBJ_CHANGE event unconditionally inside rebind_marked_interfaces()
> instead of conditionally inside usb_rebind_intf().

Please try and test to verify.

thanks,

greg k-h
