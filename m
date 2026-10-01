Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5B2165EA;
	Thu,  1 Oct 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832748; cv=none; b=MjBpb6oSe5SRume0xtSxXt6hYzn8IfYUcJWuiPRLrmCB4fpJRZnQTB/13NQ3yz+DsnerIqC1Q81WlBs4kHehOjiejTkhLx9Cgvm3tKAK/ziYTw9F6ZiHnCAqeU5DglQjcoBdbVhTj2BPmy/JNq5qFLwVYTssVXUq74GABbjYsqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832748; c=relaxed/simple;
	bh=i0xJqkI15ZYPJ/Ndx5kdcWF/iV5bU3r00HoIodJCxng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+/LfZ6sAt4QOPBV+2kGOKM9EWQJlAYVDdgxuo8FSfQusCHPKLro5/F8DtyIF/iN7raHq8Que/4/jIjNP/snuBXhz0rPUa/CwBQJLoSCwMTo5r+LNsE+YYQl7OvZcnGpZlku7lMJUGqxngT+s8YCDHLghksZ88vA2tw/k63rx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OqbQfh4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OqbQfh4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B3F1F00898;
	Thu,  1 Oct 2026 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790832746;
	bh=7RnO2tto6gzGmnwdjn29tV6/jpks6S6zWwGZDI70hqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OqbQfh4haj69ohQXAJwWm9EEfPJeCxCKeThuKgl/AGIDog8L4mg6OSEKJ+kD9xRPp
	 ielN53yOFfrVkxF0BIVWAD4fhQuzeM2+AoDSmE26E4/+VlqyZ3P1EKlMikhytm/yDK
	 TpCYYIxoSBv0MSWWvsh4L4SenadnRbzUth43jfpk=
Date: Thu, 1 Oct 2026 07:32:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: AJ39210 <predescuciprian99@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: cleanup and style fixes
Message-ID: <2026100157-gaming-earflap-3f7d@gregkh>
References: <20260908191033.13798-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908191033.13798-1-predescuciprian99@gmail.com>

On Tue, Sep 08, 2026 at 10:10:31PM +0300, AJ39210 wrote:
> ---
>  drivers/staging/rtl8723bs/TODO                | 27 ++++++++++-----
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +--
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 16 ++++-----
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  2 +-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 34 +++++++------------
>  drivers/staging/rtl8723bs/include/hal_phy.h   |  5 ---
>  drivers/staging/rtl8723bs/include/ieee80211.h |  2 +-
>  .../staging/rtl8723bs/include/rtl8192c_recv.h | 33 ------------------
>  .../staging/rtl8723bs/include/rtl8723b_recv.h | 16 ++++++++-
>  drivers/staging/rtl8723bs/include/rtw_ht.h    |  1 -
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 +++++++----
>  12 files changed, 70 insertions(+), 91 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
