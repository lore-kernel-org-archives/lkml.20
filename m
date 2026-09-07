Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09D51C32A;
	Mon,  7 Sep 2026 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798530; cv=none; b=uhLg7FkZ8CJ401wsMG8yDeqssEosMaRRr6xwS5d8kRiq1x8ONf0rxsQDCdZMahQ5zZSfbWhyx5MMZTdafhRS0Ou8O319+NzL0SRtCSDTVDvL27nOb+dZ8iLQv489FaOJsEB3ZMO6yNI6Htoxquho9qOXKJ6IK0FziIuoZvTp1Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798530; c=relaxed/simple;
	bh=E/jlsf872zdL3EtKm5Y/XoVv1q0n9nvGAD6RqIza8FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1j6Rzn/p7iX6BDYnxN7pGtomRNUogMIH8KIxxuEwHffk2nliP5Csz8iEgOwEf9vmqATGBKkusbtj85mPNEI3YQ+dbfF9iGmhrR7WV3tjtygBYtjyugu62wLFPUiQF/HVCtWR4KeAhuMPNHFIMJO4kFMInwF8Cayl5piO3WAn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aK9KEJNK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aK9KEJNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF141F00A3A;
	Mon,  7 Sep 2026 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798527;
	bh=Z65WBBBF7G92k960PKXScovbivXMHjLFEkoVlOcc44s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aK9KEJNKgdyfh05DTdwFpNo1+9ySTuXwdpPtGn+xr0+JfkFF4oizgOjwfZa6/hP4Y
	 Z5j7+zaKObZ7SyzGZYibsRiW6950kn/tr3ObF61xzGWn/DY7AjBqdwQbiWBEjOL7cZ
	 PCA34G4IrLq3MGH7scL7gR0VupQkPLlumQcYP2KM=
Date: Mon, 7 Sep 2026 18:26:50 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: contectforbusiness@proton.me
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"elder@kernel.org" <elder@kernel.org>,
	"greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] staging: greybus: light: add comments to mutex
 definitions
Message-ID: <2026090735-rental-bloating-4d77@gregkh>
References: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>

On Fri, Sep 04, 2026 at 05:56:25AM +0000, contectforbusiness@proton.me wrote:
> checkpatch complains about:
> 
>   CHECK: struct mutex definition without comment
> 
> Add short comments describing what each mutex protects. The
> channel lock protects the channel state and lights_lock protects
> the lights array.
> 
> No functional change, just quiets checkpatch.
> 
> Signed-off-by: Vaibhav <contectforbusiness@proton.me>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
