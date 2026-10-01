Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2A43D510;
	Thu,  1 Oct 2026 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833356; cv=none; b=YV+kAfDndT42Wp0DsS/uESE9wWpcLVFoTCe/u3KT8uByLwkfut/jiwbE9mX1vFLdaCTT4quNS80w+gB2VcRS+IzJsi4vmrciX1Y5Da0VyUYv+S+g9leFtM2PUh7aYZBjHTtYhjjeRohnRr65FJrh27ow1WzRz01fi9qDAH4lctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833356; c=relaxed/simple;
	bh=kqq0Mc9za7LEpPEg9nYySb7qNnA96Muq1SKQVs8d7F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsUDFlYwissu5sdSwhfWOyQEYyq7n4uOQiMV1uYXmamuKgO594zai6OjbrOW2VQzqOpRzmGsBeMb5OK1wNZlBmrUqZCr3/hTBZ+bNq//AhS1s1r+X0LS/+4SHNZ2pBE+YGz/t/ibyTwmUHND3iYSFX/ydDla8TI2kCqQSRwqbOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n7veUeEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n7veUeEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC961F000FF;
	Thu,  1 Oct 2026 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833354;
	bh=/87ExxWE0hZ1KqhxTwlm59aQ63nyqH9jmsBk1ZiFzsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7veUeEUTsoh+uqkmtoi0kxnmCBiqy2jKG9+acQSiS+hJzGOgFoekwEkNmE64sR/q
	 RvvwhdCN0PRlAqCKoHKRcgW5/CMuArpXDl90CgQAvjWCmQA06p2/1bxDrtqVbVsnZq
	 mUM4bDcUt8UsYi+IKjS8MYa3SC551bB24nTpLkc8=
Date: Thu, 1 Oct 2026 07:42:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Enzo Frese <freseenzo@gmail.com>
Cc: m.steinmoetzger@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch style issues in
 odm_DynamicBBPowerSaving.c
Message-ID: <2026100116-blubber-wimp-5419@gregkh>
References: <20260909215608.117443-1-freseenzo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909215608.117443-1-freseenzo@gmail.com>

On Wed, Sep 09, 2026 at 06:56:08PM -0300, Enzo Frese wrote:
> Fix several checkpatch.pl style warnings in
> odm_DynamicBBPowerSaving.c:
> 
> - remove unnecessary blank line after opening brace
> - add missing spaces around '&' and '>>' operators
> - add braces on all arms of if/else statements
> - remove trailing whitespace
> 
> CamelCase naming issues are left untouched, as renaming
> these identifiers would require wider refactoring across
> the driver, as already noted in the driver's TODO file.
> 
> Signed-off-by: Enzo Frese <freseenzo@gmail.com>
> ---
>  .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 36 +++++++++++--------
>  1 file changed, 22 insertions(+), 14 deletions(-)

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
