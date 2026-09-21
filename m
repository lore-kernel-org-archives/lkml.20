Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1F4BEE3F;
	Mon, 21 Sep 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005061; cv=none; b=nKODoEBcxmszFLycFSqCz/mn1e2UJR6a8kve35jcLaXYksrwsUpY1tKNwDgBnOymA8PeQ5+NPvSKN1Aym+v42HrJfRgezbP4w6z3gMMiMZKN0j6EZ/Flz9WZD+tA45E9mOpYzq2ixQGRgYpXqa5or6F1vlUWAUAExAUdqhOfYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005061; c=relaxed/simple;
	bh=VE27zaF0kRh+O1Q4hLrr4q6/gFwKz9ulspizTQ/7eGM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZSKvcULnlkQwdu6vlG3koaP4Tyc+2dt0La17VcWSF0UM0wShvGIEvNF0QXAxDn275N9RpJ6ljG5Zk8W1q0QqfSM/yTTmLFVOB5DeefvocAhZu+uEkQI4U62btXQRfthVUW/4fOddiuBJBcGLA/7PJ95ZCxlbeHREfCZrSencts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id D5EF413F861;
	Mon, 21 Sep 2026 17:37:24 +0200 (CEST)
Date: Mon, 21 Sep 2026 17:37:12 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Alban Bedel
 <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <20260921173712.5b41e1ea@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <aq1RJuZw9MLKIMbl@hovoldconsulting.com>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
	<2026091739-spousal-linked-2a36@gregkh>
	<20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
	<2026091756-unmolded-fructose-a018@gregkh>
	<20260917172152.1b1cb540@OMT-CWNXR4TFW5-LHT>
	<aq1RJuZw9MLKIMbl@hovoldconsulting.com>
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

On Fri, 18 Sep 2026 16:56:38 +0200
Johan Hovold <johan@kernel.org> wrote:

> On Thu, Sep 17, 2026 at 05:21:52PM +0200, Alban Bedel wrote:
> > On Thu, 17 Sep 2026 15:08:11 +0100
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:  
> 
> > > Please read the archives for why we don't want to do this unless/until
> > > serdev is "fixed" to properly handle dynamic device removals.  
> > 
> > All I could find is the "USB-Serial serdev support" thread from last
> > year which sadly doesn't provides much details. Like Marco Felsch back
> > then I tested disabling/enabling the USB port and didn't have any
> > issue, the serdev device get removed and added back just fine. In my
> > case the serdev driver provides an I2C bus, all devices on it get
> > removed and added back again as well and work just fine.
> > 
> > I really fail to see an issue in pratice, would you care to explain
> > what I'm missing here?  
> 
> Serial drivers use hangups when tearing down their ports. Serdev does
> not support that so the port is shut down underneath the serdev client
> while still in use, which can lead to all sorts of issues.

Hangup from modem status are ignored because serdev set C_CLOCAL. So
that only leave the hangup sent when the USB device is disconnected.
But in this case, right after the hangup, the tty port device is
removed, which in turn remove the serdev device. At this point there no
way to comunicate with the tty anymore anyway, so I don't see what
signaling the hangup to the serdev device right before it get removed
would add.

Over the weekend I did some further test with a loopback cable and a
test serdev driver that continuously read/write on the tty. I could
disconnect and reconnect the USB device without any real issue.
check_tty_count() produce a warning because the serdev open is not
accounted for but that should be easy to fix.

One thing that I can see going wrong is if a serdev driver if waiting
on a write with a very long timeout. If the tty goes away while it is
waiting the wait is currently not interrupted which prevent the device
from being removed. But this is a more generic issue in serdev as that
could also happen by unbinding the serdev driver.

Alban
