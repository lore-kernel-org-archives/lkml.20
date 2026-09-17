Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610A53CA76;
	Thu, 17 Sep 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652278; cv=none; b=he+i8jxKCWQvVzwtUX5dk4lK+zzqCXBBMpKl0mC/vovgi66RJqKrmnAPJ4IjVVdBupdujDTpy+cY10aVBA3IdnxWg8hZ2Q4wWVPwXMB2yGAVI+lw0wJe5Fbni3t42f5XHuJS04PbhSIUTtpnmk1y8cPoWTtS07y1VHHdfFyLavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652278; c=relaxed/simple;
	bh=+Mav/8AnNGlq86rf2YmOGxNH9RIAU8iyzCwURNunyg8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2gNYUhcUAEaBs52J7R7rJUg9LDhRFDwBG20mYNXj9KCA4RdbSgstEM/z4oAf4aMWt85Ubusx9rIcrXzopyw/whdl0iwSJUCO3ZFjl4Qwu67ZpXFln8+ImQAVjhBW53FOP0pkGwuhF2puseyhSVEmFq3HLwMrlFm7NCbPMvUkbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id A3DA813F8B5;
	Thu, 17 Sep 2026 15:37:42 +0200 (CEST)
Date: Thu, 17 Sep 2026 15:37:36 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Johan Hovold
 <johan@kernel.org>, Alban Bedel <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <2026091739-spousal-linked-2a36@gregkh>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
	<2026091739-spousal-linked-2a36@gregkh>
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

On Thu, 17 Sep 2026 09:27:42 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Sep 17, 2026 at 10:11:03AM +0200, Alban Bedel wrote:
> > Use tty_port_register_device_serdev() to allow attaching serdev
> > devices to USB serial ports. Also set the ACPI companion device on the
> > USB serial device to let the serdev matching work on ACPI systems.  
> 
> "also" should be a separate patch, right?

Will do.

> And I didn't think that serdev could handle devices going away at any
> point in time, when did that change?  How was this all tested and what
> ACPI device wants to use this?

The use case here is an x86 embedded platform with a soldered USB serial
adapter connecting to a MAX9265 GMSL serializer. As everything is on a
single PCB there is no question of anything getting disconnected at
runtime.

But I now see that I missed that the bus remove also need to be
adjusted to use tty_port_unregister_device() instead of
tty_unregister_device().  With that done the serdev device get properly
taken down when I manually disable the port. With a small fix to the
serdev core it also comes back up when the port is enabled again.

The ACPI part is a custom DSDT overlay that defines the chain
starting from the USB port. At this level there is no difference to 
classic UART where serdev are already working.

Alban
