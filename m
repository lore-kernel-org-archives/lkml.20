Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDA357D1D;
	Tue,  1 Sep 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273028; cv=none; b=D1ZXTX3D7Bv+i1jzDIQHlkouZUwNcZnScOiJSezcmY5QN8cyOjKbH3rhZRi0MFEdfNnmMsuspVanZcORvEUwei4Mj4jJ3BiM7trhe7ELysXZdoVHKwjeq5Qa/z0n7GDlErkO+zEt36AkkxkPHtnAjhHMl7x8oMkQK/VWhQnkbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273028; c=relaxed/simple;
	bh=jW/b0dVDpVU5rrJm9PMAuWF//BvEI6N5koUfbL2MkEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NN5YgmHq/3E7G8sGU0eQp480T5CgYkPvC4lsBfuO7evWIkKJ7ygZDqNFtAfDv/H2dHMQSW2yX3pK58B8ciu0snc8Loeg7XDMVqNt2KVnAZu6E35lWJY/SAYDe0ulz2vtkJq3DCmO+zy0XZxaGMqq1ngYbgpANWJ/lTfSnot4Z1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SoGHclln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SoGHclln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7241F000E9;
	Tue,  1 Sep 2026 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788273027;
	bh=qt2R7D8fZGD+BqqoxpVpzjKc3dyooMj4QRi4L8plzHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SoGHcllnD9wijuVaVDlVh9k+a9lG+OPXa4WVUj/ZMDLGo8SWIAZpK8KlgVkKq0qVZ
	 NAa1SvhtIjUwqtsClxCBPG7DbDFMPit8IVAW+bH3D42ViGPH7SvIPIVzRG6qsYQSlI
	 iJZLs6LrvQUSY0JXClKXXnZNrxQDeDYU7Ouz3WsY=
Date: Tue, 1 Sep 2026 16:30:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
Message-ID: <2026090159-aspire-vanquish-da99@gregkh>
References: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
 <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>

On Tue, Sep 01, 2026 at 02:17:54PM +0200, Oliver Neukum wrote:
> 
> 
> On 19.08.26 12:04, Griffin Kroah-Hartman wrote:
> > Change the kmalloc() calls in usb_mdc800_init() for irq_urb_buffer and
> > download_urb_buffer to kzalloc(), avoiding potential stack leaks if a
> > shorter message is received in mdc800_usb_irq() and
> > mdc800_usb_download_notify()
> 
> Hi,
> 
> thanks for the patch, but is this the right approach?
> If we get too short a reply we shouldn't process it
> at all.

The last time we tried to do that, we broke a bunch of CAN drivers
because they ended up sending "short" messages that no one noticed :(

With old hardware like this, let's just stick to this "obviously
correct" patch, and if someone with the hardware ever shows up, we can
then test short message information like this.  As-is, this prevents a
simple "leak kernel memory to userspace with a hand-crafted-device" bug.

thanks,

greg k-h
