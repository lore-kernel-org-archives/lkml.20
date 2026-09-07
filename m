Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C051A72B;
	Mon,  7 Sep 2026 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798191; cv=none; b=gl/ikhHP+gaNgs83urOGcVzU+gcr5OwMoOPhUQc2nMT3TuQxvZ+lJj9cYz9aNWuZMtHv+kfmVJCkbuQ89vFnc/veXXzWKkTF+Z8uBsbupvfOLMMdmNXFpDl73ZEZZpdQzIHtYsR8fMsCkAdIH4tpZ2acQxDATbwqeLLbNDRwSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798191; c=relaxed/simple;
	bh=56nGEoQQtQDGsDF5PSPevFCwnA0PbXkmHryYjxDZki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSQ5BdOX9Dp6CaxOHOw8HMPdPi8CyCNhyal44DV4MaMwD+eaMg5BYhED0Y9R75nkSLC7ZHPqgRqlp/+eU9ZSLE8u8nICHJxJlbM410YkmvAxx19nmjm+WUR8tnDKdqKTUWYYV8gIbaI3ECumogb8TIoA/tosi51PpHHjg6ymf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jMsjw6A7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jMsjw6A7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5400E1F00A3A;
	Mon,  7 Sep 2026 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798180;
	bh=08b2rxZyKFYEjkQ9T3OdobuoQLF2+QblwT2CkVa0mvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jMsjw6A7Hx4tT24ivoWTClS5p+R4P0h3ZYFwnnLT7hloZRsdEAVfpCLolHzPi9PER
	 S1Mi8QrrvljizdjN2RXPpepYw9efNKHzP+hQVYOj3USIpbaoswn9ZpiaiqcG1QPUHQ
	 5qUQKVpnjvJUv7JBM76wXqrMUYxRVYB9CggjFOFI=
Date: Mon, 7 Sep 2026 18:21:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Message-ID: <2026090748-decree-version-df72@gregkh>
References: <20260902105004.1935-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902105004.1935-1-nsvatoslav515@gmail.com>

On Wed, Sep 02, 2026 at 01:50:03PM +0300, Svyatoslav Nikolenko wrote:
> The manual ifname allocation via dev_alloc_name() is redundant because
> the networking core handles interface naming automatically during
> register_netdev().
> 
> Remove the ifname module parameter, the corresponding field from
> struct registry_priv, and the rtw_init_netdev_name() callpath.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
> Changes in v3:
> - Added missing changelog.
> 
> Changes in v2:
> - Removed rtw_init_netdev_name() and the entire manual naming callpath 
>   instead of hardcoding "wlan%d", as suggested by Greg KH.

This does not apply against the latest staging-testing branch, can you
rebase and resend?

thanks,

greg k-h
