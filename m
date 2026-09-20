Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7F31D39A;
	Sun, 20 Sep 2026 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881650; cv=none; b=hcqTMpYOH2Xvf59RBLaSjs6oOWNASGnqTmMAir+mnGlTrVETHkFiOd2ee+I/JndK8cb4RIpQtsMb6qRZeqJH8euuQk1axIodk5kgHGroTdGl+R8ZQwl+LiAW1EcpWKnsWuEU/IHy475vCoVtXV+eIOBkX+zQVWvUlhuYq1qzhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881650; c=relaxed/simple;
	bh=96lakhEdc7AtXHwvXLdmRu323OF9ZtO3PeKLNyHpPmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gdw67m01RnM0YvL6lc96TJ9uonQSRQWnPe4lrhf83GvP7GVnSWC3ub3MfGtopxJt5mKsZqU+sJwfbB43+lkkMXGnjjw+8Oq5q3qC2TIl6ynjAeiNmOojHfMhoFVdttB7nKNHN58Nw0Uccr1hQsUONQmGbZ9nO6hTt0SXWk/F9JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IzxrvECA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IzxrvECA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C227B1F000FF;
	Sun, 20 Sep 2026 05:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789881649;
	bh=ixSrPjNTu0ij6JXNjNfwvR83oCrjs+i49zeMfAE8la8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzxrvECAMIYSxK09oy2aCC9o007pgo9Q+40fz9zgpEpidvM5fzSzLAGkSElTkF5Or
	 SsTQemDDzS40bfn/J3Rjm5zhj8vlzjExbiqLixhhk4xveiwKR8yxJh52/bL3mMH05w
	 xDJpHUIy01GngTDCeqUKEhzh5MBhWcmld86+wWlM=
Date: Sun, 20 Sep 2026 06:18:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: validate ISO packet descriptors and URB lengths
 in vhci, vudc, and usbip_common
Message-ID: <2026092058-obtain-angles-cb4c@gregkh>
References: <20260919223519.3890269-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919223519.3890269-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 10:35:19PM +0000, Hui Peng wrote:
> In drivers/usb/usbip/ (usbip_common.c, vhci_rx.c, vudc_dev.c), validate
> actual_length, number_of_packets, and isochronous packet descriptor
> offsets against the transfer buffer capacity before copying payload
> data.

Why?

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM

I think your LLM didn't read the email archives well for this driver...

> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index 100f8920624b..8bd9af7ebfc8 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -482,7 +482,6 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
>  		if (rpdu->number_of_packets < 0 ||
>  		    rpdu->number_of_packets > urb->number_of_packets)
>  			rpdu->number_of_packets = 0;
> -		urb->number_of_packets = rpdu->number_of_packets;

You are removing this, why?

How was this tested?

greg k-h
