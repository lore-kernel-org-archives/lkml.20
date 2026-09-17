Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D04E0216;
	Thu, 17 Sep 2026 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658534; cv=none; b=ZsVyiDUZgwslwOlf/hIbtqJpZLkcW6dWh2Z3WkdyeLk9VaZrlZbcidqvwLBqPXRM338AsVb6m+9oGM7v9raXOIC1uEbuMRqpEWqIZ15jUthFy6mGXuMLQS11BVz8KohBVMaf4j3LZMYTPQo/ndDoOo7NpNWB/5ueFtIhysbHRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658534; c=relaxed/simple;
	bh=A94HsU69g5I66yksg+106KqVV8VdZ7lpjKXhjsYT1PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sel5a9/CYiN4NaVVg5EvBS9qgAktQDffMGxZg5lQJBuBpUCAUybCWbTrjDk2wsAdwM25CV4R+ZC+46ByVIt9nK3CzgSepWl99BTD1BCA/M0OJ2YpA7oBbf3jLZUyq9nNgZIkEWn6FpEZsMxZoMp8omPYm6FSD/amombO0Kb9R8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7177E13F880;
	Thu, 17 Sep 2026 17:21:57 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:21:52 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Johan Hovold
 <johan@kernel.org>, Alban Bedel <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <20260917172152.1b1cb540@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <2026091756-unmolded-fructose-a018@gregkh>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
	<2026091739-spousal-linked-2a36@gregkh>
	<20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
	<2026091756-unmolded-fructose-a018@gregkh>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 15:08:11 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 17, 2026 at 03:37:36PM +0200, Alban Bedel wrote:
> > On Thu, 17 Sep 2026 09:27:42 +0100
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Thu, Sep 17, 2026 at 10:11:03AM +0200, Alban Bedel wrote:  
> > > > Use tty_port_register_device_serdev() to allow attaching serdev
> > > > devices to USB serial ports. Also set the ACPI companion device on the
> > > > USB serial device to let the serdev matching work on ACPI systems.    
> > > 
> > > "also" should be a separate patch, right?  
> > 
> > Will do.
> >   
> > > And I didn't think that serdev could handle devices going away at any
> > > point in time, when did that change?  How was this all tested and what
> > > ACPI device wants to use this?  
> > 
> > The use case here is an x86 embedded platform with a soldered USB serial
> > adapter connecting to a MAX9265 GMSL serializer. As everything is on a
> > single PCB there is no question of anything getting disconnected at
> > runtime.  
> 
> You hope :)

Obviously anything can fail, but I don't see why that should be treated
differently than an UART connected via PCI or LPC. The link could also
fail anytime.

> > But I now see that I missed that the bus remove also need to be
> > adjusted to use tty_port_unregister_device() instead of
> > tty_unregister_device().  With that done the serdev device get properly
> > taken down when I manually disable the port. With a small fix to the
> > serdev core it also comes back up when the port is enabled again.  
> 
> Please read the archives for why we don't want to do this unless/until
> serdev is "fixed" to properly handle dynamic device removals.

All I could find is the "USB-Serial serdev support" thread from last
year which sadly doesn't provides much details. Like Marco Felsch back
then I tested disabling/enabling the USB port and didn't have any
issue, the serdev device get removed and added back just fine. In my
case the serdev driver provides an I2C bus, all devices on it get
removed and added back again as well and work just fine.

I really fail to see an issue in pratice, would you care to explain
what I'm missing here?

> > The ACPI part is a custom DSDT overlay that defines the chain
> > starting from the USB port. At this level there is no difference to 
> > classic UART where serdev are already working.  
> 
> So acpi now defines USB to serial devices?  Is that new?

UARTSerialBusV2() is there to define devices using an UART, the
specification doesn't mention any limitation on the kind of UART it can
be pointed at. What is the issue here?

Alban
