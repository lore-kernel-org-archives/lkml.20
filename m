Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E122A4F1;
	Wed,  9 Sep 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939737; cv=none; b=J0Np5iGH/eCgL8/kP84/NGwtu2HlEJVaRvjtS/gJFrpGfiwV0VYv6sf40Jcwq2OSXJd6M3U5NgEUfRH26FIaqGwwWmxmoGQuqpSJp6Y9xS6J0AuqbVN0JcS90NLfebE9L5HLPn6KxEhc62LM29DbmO2PdWu0OkhzbnUkom3XhkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939737; c=relaxed/simple;
	bh=IGK/5Y4kNWD1Ap7GspLzth20aBPpet7ygARTsLlDidk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DycKBzuSP8X6qZphg/TFnCeEA9p+85hplDmRWaekfZQyU0CY19OdBQEqcLohjZiNwwYaCSurGsxRCLngd2aNqXt7z6zQ8qXjJgFDLTeYc90fu7oBTilRDdr4b2z86NpNz4h3ZAZh5fW71wcwL9CPyardAGK4EbE17yehmyUZiL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hIf80Lt+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hIf80Lt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FE1F00A3A;
	Wed,  9 Sep 2026 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788939735;
	bh=UVqwwhHJQ8OHnqxqDLMedGCWjBVA5AePETD/60WnvVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIf80Lt+vfHQ9wuGbbxEVTD54chua8wHqQ/RGrfOQRh89RTejCW6X0OxZY/mMW2j4
	 Ri/BNqbznUBES0POuQIAm/zAXUZx/RQuCVn8oJE9+9dkBkhWkG/U4YDUCtdL9ZxgZI
	 XoWmq7qDTpIyt5LFuzN3h06eIe0PU1GMVjODtlgI=
Date: Wed, 9 Sep 2026 09:42:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: AJ39210 <predescuciprian99@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: update TODO list for completed
 cleanups
Message-ID: <2026090945-astronaut-relative-0e01@gregkh>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>

On Tue, Sep 08, 2026 at 09:34:27PM +0300, AJ39210 wrote:
> Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
> ---
>  drivers/staging/rtl8723bs/TODO | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
> index 34c216e6d..8de062b47 100644
> --- a/drivers/staging/rtl8723bs/TODO
> +++ b/drivers/staging/rtl8723bs/TODO
> @@ -1,7 +1,10 @@
>  TODO:
> -- find and remove any code for other chips that is left over
> -- convert any remaining unusual variable types
> -- checkpatch.pl fixes - most of the remaining ones are lines too long. Many
> -  of them will require refactoring
> -- merge Realtek's bugfixes and new features into the driver
> -- switch to use MAC80211
> +- Partial: remove remaining code for other chips that is left over. Unused
> +  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
> +  removed, but more legacy code remains.
> +- Partial: convert unusual variable types. The channel control APIs and rate
> +  helpers now use kernel fixed-width types, but more legacy types remain.
> +- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
> +  have been wrapped, but many warnings remain and will require refactoring.
> +- Merge Realtek's bugfixes and new features into the driver.
> +- Switch to use MAC80211.
> -- 
> 2.55.0
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
