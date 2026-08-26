Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6284448B8E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758206; cv=none; b=Ur5RusIAxcbWA5ccMeKfIjoX0jDfTHzvf5lov727HjqMarEEp48/k9Vd1C0WWHlzi/pOKBk+y4dYGf1qtz3cPyJ51uVy1TfhzAIALKkFclkAY1r7vRk/Ey/Oej35B9VHwJMRj1EgEEZ9IP3zlf2fjLpk5iBQ/Dpd1GW4O5iowzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758206; c=relaxed/simple;
	bh=/pUFy2bN0U1mx8574mk29IWEVuQVMmm+/XhoJVim9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMOGyEz8VsGRiAGu9AeP4ILiPPrC2ZmhUSLDOuIWObTDgUAmCFHfce5etaLVXCTSfuFivl5QQnjJzykELI9FSv38UsYRAbv+1RgEmsqXDDhe6AOLo+yLnns2XPycZwu3IoCe3ka6w++xqw/spmYMDpNdqobEf+j0WJmFRMMgZ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ly3iIjF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ly3iIjF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867E61F00A3A;
	Wed, 26 Aug 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787758203;
	bh=k6tE54JsOXGWnymkbDWNSeh5+QlIjTDp3evyuDhduM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ly3iIjF8vrPg3jrQLF/nF767ivHea1dAnKQAiWc6jNbw2fkWYpMi6kaMbQSA3phH3
	 IB5WpUHi8We7f1pibZJ8JVU5dO4LNUH2m5Kr9pUUVoLNWPAseaZIlelvsQUGlVr7tm
	 6BEFKNA1Ohr/rPyoxOKNVf0MUFVfrq4jT/d4PPeo=
Date: Wed, 26 Aug 2026 17:30:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: 3237174131@qq.com
Cc: linux-kernel@vger.kernel.org, tglx@kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: fix file descriptor leak in
 read_spdxdata()
Message-ID: <2026082634-diner-thyself-0378@gregkh>
References: <tencent_0D1CF77320A0C199EB46300A4E82DADEA209@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_0D1CF77320A0C199EB46300A4E82DADEA209@qq.com>

On Wed, Aug 26, 2026 at 07:53:25AM -0700, 3237174131@qq.com wrote:
> Hi all,
> 
> This is my first kernel patch. Please let me know if anything is wrong.
> 
> Signed-off-by: Xia Zhoxin <3237174131@qq.com>


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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

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


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
