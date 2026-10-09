Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46FE4CB8B8;
	Fri,  9 Oct 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545587; cv=none; b=GGVK9+6UvF8UDy4h5QrXNSWDIvIi4F9eDUALoOrNjbSEHPr+v02P3B1V8y77Kb5jgB7yTQ8uWRsmnaPjad3yBiKhpIeai0uDdOhnfsflMy1sIhFolDyRDkgoclFlNuLFrXJto81NNV25/yO8ObcOf9F02db108ztGBaiYspI8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545587; c=relaxed/simple;
	bh=z5aEDYn46/Rah5/v3ES417Z60fjjD21TcnkEvWmnJ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHYkLqnKkHus7fpMgEeBuwFfwFpiYVW0nPYsmSaVKhmQGHF1XFD6L6xCAOlE9SqLJAnlgf2UUzQ7tFSz8Mzj+bBWCs45Q+pIdUbQmiag8+DAjTK1INQuIMZjlbrwZ5HWjvd1gS5g4ufLcLDL32mt2TH2xu9vsYOBmY9LyDXnh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aeIdbDZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aeIdbDZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2061F000FF;
	Fri,  9 Oct 2026 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791545575;
	bh=1TATMZV82HPA+UYPELErnG3JuDM2v3RmbEJ3bvUFlwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeIdbDZ6tV5Cgc6h5ww0qAomP8LWTdS8U4emwByw7Yi/HuH/13rRQvUBOocV3AuZW
	 EJ04Qkim+A59/RpufsRQUYsHGq89Hod1EQvRYlnhCYYMApDbx03gSJn1ryQc+W0l3+
	 IJRiXtIq57ltgftZggMBuq3y6z5aCMEsTITp0LqE=
Date: Fri, 9 Oct 2026 13:32:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Zuo An <zuoan.penguin@gmail.com>, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface
 file
Message-ID: <2026100906-wildfire-mountable-6aca@gregkh>
References: <aseApS_MWoP3Jtp0@gmail.com>
 <45fffbff-1653-45c5-8e24-d5a580faf5aa@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45fffbff-1653-45c5-8e24-d5a580faf5aa@rowland.harvard.edu>

On Thu, Oct 08, 2026 at 10:22:42AM -0400, Alan Stern wrote:
> On Thu, Oct 08, 2026 at 11:38:13AM +0000, Zuo An wrote:
> > A path was misspelt with the delimiter between the USB <config num> and
> > <interface num> as "-", when it should be ".".
> > 
> > Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
> > ---
> >  Documentation/ABI/stable/sysfs-bus-usb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
> > index cad4bc232520..400237db166d 100644
> > --- a/Documentation/ABI/stable/sysfs-bus-usb
> > +++ b/Documentation/ABI/stable/sysfs-bus-usb
> > @@ -60,7 +60,7 @@ Users:
> >  		PowerTOP <powertop@lists.01.org>
> >  		https://01.org/powertop/
> >  
> > -What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
> > +What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
> >  Date:		January 2008
> >  KernelVersion:	2.6.27
> >  Contact:	Sarah Sharp <sarah.a.sharp@intel.com>
> 
> In addition, Sarah has not been the appropriate contact for ages.  Greg, 
> would you like to remove that line?

Yeah, that's a good idea probably for all usb sysfs files, the
"contact:" field isn't needed anymore now that we have get_maintainer.pl
which should always handle the right people/lists for figuring this out
properly.

thanks,

greg k-h
