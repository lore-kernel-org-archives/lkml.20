Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155B4F5E0A;
	Wed, 14 Oct 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976638; cv=none; b=BG+vsUZvU0UIOE+aYx2UMK7P+sFTyhy4JfsoJR8pI0i10aoA6D3d3+nOXkn6YtZ0PN6/rwgP66YZtHVqq8IocHpZb3qDa1VNorkJYYU56oVheI9u4gMnA7efk18yyj9OLBlX5nIYRNqtXSeXyW6HjnAaHXBIYQVSrPVdl8OZ7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976638; c=relaxed/simple;
	bh=udODNmUQkMHWCyM4sAmAZNNFHa5ZTzIHnrkCyJXtQ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF4jeaAjg7cBf9KkoG9JR6x0hP3lFYmiRsvFh3wOA7K2ZdKFxLrBKA0/t2dI+kldeCX1L0SGZGMDHR9jGuW0SppMTCzWPeTZc4oveUlFtQca7crnUTWTzRsGIQmZt8YSp96/qTmo3a5EHNe1fsgP3IzrnvW4zhOOUGhQnq7Fd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ar0JYFRe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ar0JYFRe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCC01F000FF;
	Wed, 14 Oct 2026 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791976637;
	bh=/7ZhQyyPiUXLNHxtWb3djaoZkqvs2oBkM6OLHfE+Qh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ar0JYFRecZAZX2+/j2ZLatbdAhbMxp2rYXMtmQ55HJ6IJHcBsRZL08sFmaYFCNqPI
	 p718j4JBMEf0Al1hvNZeFYzEeYo0lakm2wH7spaQOoE2vN5V2ENzchSFGm+atE8LyD
	 Xw/+WvPf0hlV1bWvGQ5Lf5wBbEkBK18Ub3zGPYyY=
Date: Wed, 14 Oct 2026 13:17:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: host: Mark dwc->xhci as null if xhci probe
 fails
Message-ID: <2026101452-wow-scarecrow-c7d8@gregkh>
References: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 04:27:11PM +0530, Prashanth K wrote:
> Currently dwc->xhci is not cleared when xhci_plat_probe fails,
> leading to null pointer dereference in dwc3_qcom_read_usb2_speed.

Why would that happen?  What causes it and requires it?

> Mark the xhci pointer as NULL to prevent this.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

What commit id does this fix?
How was it tested?

thanks,

greg k-h
