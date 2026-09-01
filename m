Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E847A87D;
	Tue,  1 Sep 2026 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255822; cv=none; b=I2FsURJQv4/z0aVrV/qZ54G0ell+SZ4IfwZk/xTb4FtcQK0j1Yb95e/ZvPXXvfLpF/Mvgw8fzpFancEbTbNhchlRFtAE5XgO7RprJuYmInBjjhKhH914rPwCS14ztreQyQ2QMMb3v/q6mVkeUjZlu+lc5iBC9aIc9nsXNy32leg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255822; c=relaxed/simple;
	bh=7HapLf1+R4Vm3KLbYXKcq4W/hYH5/TFMYsPShNihSgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sc3EbzFS+Kdz0ueHJES9G9Lbki8T1NPjw6n90hDa6iSIrcz+28CVMUzXupQdakYJ3cBoYNZXW2zdbAH6uKZ9XHYME/7I1wJ8x8FBvaUODpns4m2o3zKL82ALr68LFLi4jINcWEEwdJ5qhUnT2JUsanh0VLZ/llxvWg0TnwnKdsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C6lhCvoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C6lhCvoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D654C1F000E9;
	Tue,  1 Sep 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255812;
	bh=v5CYzTESfIeAUHNBPjVk818TqfTYTSBhCDiiCAvWge8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6lhCvoQjqav7lw2Bhfta3Hma93O1cYO2Ak8e907qoxRDDRdMd9aszC/CKQU+ot3X
	 LW00sAAJM7bynLQlGu/8EuzNe7RrIfttWvFJ/Z6S81CyxmUASLEmwYC5fvOp9A74+O
	 etxr6d4z5+DCuGmYBJRFKNn7pWp9gp9+apptKms8=
Date: Tue, 1 Sep 2026 11:43:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: use kfree_sensitive() for key
 material in rtw_set_key()
Message-ID: <2026090117-apron-posing-5434@gregkh>
References: <20260730231315.79688-1-skunkolee@gmail.com>
 <20260804200540.78104-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804200540.78104-1-skunkolee@gmail.com>

On Tue, Aug 04, 2026 at 02:05:40PM -0600, Ivy Lopez wrote:
> psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
> from psecuritypriv before being freed. Use kfree_sensitive() instead
> of kfree() so the key bytes are zeroed before the memory is released,
> consistent with how psetstakey_para is already handled elsewhere in
> this driver.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 1196ec011455..fb45f7295386 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1926,14 +1926,14 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
>  		break;
>  	default:
>  		res = _FAIL;
> -		kfree(psetkeyparm);
> +		kfree_sensitive(psetkeyparm);
>  		goto exit;
>  	}
>  
>  	if (enqueue) {
>  		pcmd = kzalloc_obj(*pcmd);
>  		if (!pcmd) {
> -			kfree(psetkeyparm);
> +			kfree_sensitive(psetkeyparm);
>  			res = _FAIL;  /* try again */
>  			goto exit;
>  		}
> @@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
>  		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
>  	} else {
>  		setkey_hdl(adapter, (u8 *)psetkeyparm);
> -		kfree(psetkeyparm);
> +		kfree_sensitive(psetkeyparm);
>  	}
>  exit:
>  	return res;
> -- 
> 2.55.0
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
