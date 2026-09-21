Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E1486B9B;
	Mon, 21 Sep 2026 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993800; cv=none; b=OjYUEYOfXU6xaa99cvpOEiAMQDrpA3DiD1ISs77aYB/R624tYJ3k+vTqYHiGnr4j0YTZCWht6OFK6JmzXAdlOXwSOh5r21mlG9wfAH68bRPBOS/DeIRvRNRylgOwoe9YpXwLrtzmTPKNYd6KPzlHb9FH5vjKyDWVYBLP3x40hRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993800; c=relaxed/simple;
	bh=LYNkO2KzVjp1hja6gH92CNFl1iR82eZtAzzmg9UQd6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D00R/usZG6TCG5gYNiKWG4QhZ0lkdm6Xlx+oZc+V52uvGxMou2R4mGCy4nFhxWXvV2mRmK5JVj4LhikTos5ahXiqFo3kAaEDWv35ab54LtXZKLknZClIMP1pKPfw7BAod+rUH0MNR5Tyen1Ayw+p/cxDhr4Fk18sN/79KYm1UfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j1xuU3op; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j1xuU3op"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6381F000FF;
	Mon, 21 Sep 2026 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789993798;
	bh=uU37JOf3gLcTGP4X3TXjV69UtwcgK/WIFge0EooLFeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1xuU3op/RwEje958a3yNbXo5gGboq7+qCNCT2dysFz/dBhWgs/LZNYhiwK3JC2bl
	 SZUtTmHJgpkKNaRpPC8yuT6swENWAnyHwIaxWpve4KSiL3y0VfMXjafuxrhHaObaft
	 q23s0KcchMviUQjFmdzQQZoWvpCdFoZmdVTWV37c=
Date: Mon, 21 Sep 2026 14:29:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: CJ <firefly0158@163.com>
Cc: balbi@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: gadget: KASAN slab-out-of-bounds in gether_get_ifname
Message-ID: <2026092126-obligate-purge-ab18@gregkh>
References: <670670d.84d1.1a0c3282df0.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670670d.84d1.1a0c3282df0.Coremail.firefly0158@163.com>

On Mon, Sep 21, 2026 at 04:49:45PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting an issue triggered by a syzkaller reproducer on Linux
> 7.3.0-rc2. The issue is reproducible with HEAD commit
> df2908090cda368b01ff43709f51890076c56157.
> 
> 
> The reproducer mounts configfs, creates a USB gadget with a phonet function
> (config/usb_gadget/g1/functions/phonet.usb0), and then reads the ifname
> attribute of that function without ever binding the gadget to a UDC.

Great, can you please send a patch to resolve this now that you have a
reproducer?

thanks,

greg k-h
