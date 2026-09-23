Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD60491587;
	Wed, 23 Sep 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160122; cv=none; b=tLVzs/TOeFjVh9U3rtXge0zvF9iZVT3WgOkRQ5NwnG29bDIfdEjzdKcZdnuXAHbPNy5bjuNMBIvYGzsrcoG7CkvMm+4JobtTf2smS2Galwax9O6hvK/lBJKTFfHOC0S37Jmk43SpbKfMiLXfFr+lz426iMcSRnY6NtPj83L7cmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160122; c=relaxed/simple;
	bh=pj68++RF09kbyh7mKp+fwYD4nq0DodJcgRce/L8eM7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxqsgG+OGYSaT4rEX+Q0OHC8+Ycr83ohdz+yiz+bcoatNVIWmHxRbQdEQdjgGqia6GHcQNbzwx79fMICFgdih/HO2FguGW9jyp8HxaVSauiyaX83xFQrkWpVVbKQCdWf0oAJ27J5fMpq6R/aS9nqS2KQGFE2pmpv4BKWizFYQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0w4HjVgH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0w4HjVgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1001F000FF;
	Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790160107;
	bh=sNKF1E39DVJpugroPrH1ftw8ZSVVQLuIpd5aI83EFf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0w4HjVgHGXcfVd9rMTH8D18TjFWyv1dL3h/2QRTzLid9wPuFhrSJhmhxB7oJ2fRzr
	 laWWspLNvWY+2teeENeOcLOpYgSNxqcGQGd3BGUr4Lg+oEsrZpBZ1CPGWQImMSV+WV
	 VM5VFb95pmfw6UjkL0sQp/LSrLoQs9kFzwGCi/OE=
Date: Wed, 23 Sep 2026 12:41:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Murali Krishna <muralikrishna2444b@gmail.com>
Cc: srini@kernel.org, ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: misc: fastrpc: is a ctx_idr IDR -> XArray conversion wanted?
Message-ID: <2026092308-landmine-entire-2aa8@gregkh>
References: <20260923082254.15312-1-muralikrishna2444b@gmail.com>
 <2026092338-banking-tactics-2cfb@gregkh>
 <20260923094040.18397-1-muralikrishna2444b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923094040.18397-1-muralikrishna2444b@gmail.com>

On Wed, Sep 23, 2026 at 03:10:01PM +0530, Murali Krishna wrote:
> On Wed, Sep 23, 2026 at 11:28:52AM +0200, Greg KH wrote:
> > I doubt it's really needed unless you can prove some sort of advantage
> > for the change?  Is it faster on a measurable path, or less memory or
> > something else that would justify the churn?
> >
> > idr is still a fine structure/api for many things, they don't all have
> > to go away, otherwise we would have done so long ago.
> 
> Understood, and I cannot show such an advantage. struct idr is already
> built on the same underlying tree as the xarray, so there is nothing
> measurable to gain here in speed or memory -- it would be churn for its
> own sake. I will drop the conversion.
> 
> Thank you for answering so quickly, and for explaining the reasoning
> rather than just saying no. That was useful to me.
> 
> If there is something in fastrpc, or elsewhere in drivers/misc, that you
> would actually like to see worked on, I would be glad to take on
> something small and learn from the review.

Please help with review and testing of all of the patches that keep
getting sent for this driver, that would be the best help at this point
in time and will show you what needs to be done on it in the future.

thanks,

greg k-h
