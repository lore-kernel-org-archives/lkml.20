Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E5B2D0C92;
	Fri,  2 Oct 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952991; cv=none; b=IFfGxhB0DzDJmodYMnwJf603aPI1UX/8WWViAixkTMwMqJpCHpjbB7GaaUSvzyTw75W6Qf475SZFzZW2Z2DlQ+VHqIjTqIhR0sjreassYI2HCbIQ+3bXp3IShGNGCRYCVYCMkNO8VOsa5F1uIBKxpGzR+YAZf5ID+oSRe1YWL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952991; c=relaxed/simple;
	bh=YACqoRRD/66CKvHTvNeAFase+iU5cFN8XjwLNq5/zV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rm4qCyS+hYesDy6MXucDV+bmwyEM1O/0bdBshlVy56M278VQwGC6FKWLea2mA+k56Iiz1Y3qtVkNRcEJs61fMkEMZ82IuLMytHcPAYJcCbFFApDwFILs2pDHus0N7W+kOytsN1w3lqSTxnYFETFYWUkvkTpbfAsX3i3w8vJWBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM+tQXUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM+tQXUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4380E1F000FF;
	Fri,  2 Oct 2026 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790952990;
	bh=tBvVq/p+7C7hTdIJh3LESmoF+EeGUiLsF68CeaDW2QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fM+tQXUekLCVS0caURrlTRbW6sUI2pZw/UW5QlgZ1bQMBWXzRzusHxepO8o+W32zi
	 qUId1MI+B/mlKyqEOine7A2sUxadSJep9tUqGcJ6kjSKcbepaMagCvDFTANrb9tp8+
	 VvKYRKO5umrsmHeIvp6/Va4Z+gS2DQYl5wneNgbf2gEuuIsrhlGswtox59jduPjfMA
	 rO+LstbIBigwjcRNVx4iMATJWQJFfgyAK4f+DLy+bPmnVia8qR/WJ1olJ+90+WcBKt
	 Tj5loN7pM7k8jPCOFmTANC7nd59ijd8QHaZtwzurPxHln9nKrdMjWPtl9ebM7YP5BD
	 K4OURa/F0xy0Q==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xCegW-00000009k8A-1OaJ;
	Fri, 02 Oct 2026 16:56:28 +0200
Date: Fri, 2 Oct 2026 16:56:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <ar_GHJpNwit_wxkQ@hovoldconsulting.com>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
 <2026091739-spousal-linked-2a36@gregkh>
 <20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
 <2026091756-unmolded-fructose-a018@gregkh>
 <20260917172152.1b1cb540@OMT-CWNXR4TFW5-LHT>
 <aq1RJuZw9MLKIMbl@hovoldconsulting.com>
 <20260921173712.5b41e1ea@OMT-CWNXR4TFW5-LHT>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921173712.5b41e1ea@OMT-CWNXR4TFW5-LHT>

On Mon, Sep 21, 2026 at 05:37:12PM +0200, Alban Bedel wrote:
> On Fri, 18 Sep 2026 16:56:38 +0200
> Johan Hovold <johan@kernel.org> wrote:
> 
> > On Thu, Sep 17, 2026 at 05:21:52PM +0200, Alban Bedel wrote:
> > > On Thu, 17 Sep 2026 15:08:11 +0100
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:  
> > 
> > > > Please read the archives for why we don't want to do this unless/until
> > > > serdev is "fixed" to properly handle dynamic device removals.  
> > > 
> > > All I could find is the "USB-Serial serdev support" thread from last
> > > year which sadly doesn't provides much details. Like Marco Felsch back
> > > then I tested disabling/enabling the USB port and didn't have any
> > > issue, the serdev device get removed and added back just fine. In my
> > > case the serdev driver provides an I2C bus, all devices on it get
> > > removed and added back again as well and work just fine.
> > > 
> > > I really fail to see an issue in pratice, would you care to explain
> > > what I'm missing here?  
> > 
> > Serial drivers use hangups when tearing down their ports. Serdev does
> > not support that so the port is shut down underneath the serdev client
> > while still in use, which can lead to all sorts of issues.
> 
> Hangup from modem status are ignored because serdev set C_CLOCAL.

I know since I added that in commit cda64188ca91 ("serdev: ttyport:
ignore carrier detect to avoid hangups") for this reason.

> So
> that only leave the hangup sent when the USB device is disconnected.
> But in this case, right after the hangup, the tty port device is
> removed, which in turn remove the serdev device. At this point there no
> way to comunicate with the tty anymore anyway, so I don't see what
> signaling the hangup to the serdev device right before it get removed
> would add.

You still have a window where the serdev driver is bound to a port after
its port has been torn down.

Johan
