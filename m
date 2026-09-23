Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830B445AE6;
	Wed, 23 Sep 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155937; cv=none; b=o0S1U45cdzBsYi6pFRq0jGAhMw8hBS+nOhtEAYkSftfl0vyRO1ZvyKh4U47dRrrcEuDRIn2g9yuYIB7uBY+VJrUh2I16vKTHH+YlODbzFMTuFQz4qxN4T0D9yROj89uHo+XDmKnywPqMVbqqPKB6C4Yx5Tq5ZXCmWrkb3s5hzgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155937; c=relaxed/simple;
	bh=x4bUg7+JY1XyzRObjIvH11HFX7ffTSmx+T3zOV3KB1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACDQyTJo/3UK1iZjhkjq+DmQ7RoJkFXc1y42s7uvqMuYHWdGJAZSNj0lM43zmSFeAQ5tq+bkiCsGi4nA2JK/7dkGYYcfr+qBXRBvmaQYecCgwV8TDcIhUEZK2mfdXOK4v09/xtbmFBL706/aQeF+NVvtAfr9WvNYK50z+a24mys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nKOe3KXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nKOe3KXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06C91F000FF;
	Wed, 23 Sep 2026 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790155935;
	bh=+MhfrJq802x57nhWy6AyvHV2FqGGpA4o/mj47hetU1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nKOe3KXURRcGU9m2nUuxhFNaq6C7xJlzx1X4ITLxHEFI2+N3/iCQa4qNy+Lr7ZyWn
	 2mgd/V/LiLT6j74WbRPYTj8ClzM3sUOzLNigDF4eeRnxIH6Jyrgzqfq8CXKYN/SmOX
	 Ej//Jlfl3L8+5ZyJ/9k6e5s6yDQXglUhan544S0Q=
Date: Wed, 23 Sep 2026 11:24:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: By <xiaobai050@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: dwc3: pci: reject matches without software-node data
Message-ID: <2026092326-stricken-album-d1b9@gregkh>
References: <20260923081006.89175-1-xiaobai050@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923081006.89175-1-xiaobai050@gmail.com>

On Wed, Sep 23, 2026 at 04:10:06PM +0800, By wrote:
> A PCI driver_override bind can reach dwc3_pci_probe() with the dummy ID
> from pci_match_device(). Its driver_data is zero, so dwc3_pci_quirks()
> passes NULL to device_add_software_node(), which crashes in
> software_node_register().

As it should.  Don't do that.  See the archives for many details.

> Reported-by: syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com

This is an invalid report, as has been said in the past.

thanks,

greg k-h
