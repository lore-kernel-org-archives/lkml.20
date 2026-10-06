Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD03B14C9;
	Tue,  6 Oct 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320761; cv=none; b=RNlY/vNQxPsS8sdYt94vxvckf6w3j/vkZo2YOCmSKNehASTJhkumOt43oWrCiuKBbxTKqYVxSU7bcfcxO53idtbZkHOXCN2qK9rdfIkA2eY3czCUV+xWndSmS6uTJgYUokbqxbu/alKrDZwsJbZNg398zps9Lr/L9TiZ3XNaOME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320761; c=relaxed/simple;
	bh=NmR5gVwQWWIOGR3hR7QqW06E90iGHrFFAS1pw2E5OOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJhpSkzjH92styFpRVpoG7Rzy241cyVR19LMWpd/rlkM54sdGDUZptAF6Y4UkA9V6mOKjBQkLsQmD2YC+3CB0T312zpX07NUrIL18CrAua3zM2E5gmtnDrhHFPvM3MeUU13p+3pl2rNJrZg5kRUvqsPvGrm4spT79PELlu2a5IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ybqbQ8JM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ybqbQ8JM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857911F0089B;
	Tue,  6 Oct 2026 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791320760;
	bh=xP2soKYKKhSMkNsQ+lXVD4yz/+XexG96nmsjcAz3RPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ybqbQ8JMEJo44oCRMnqyS+Ti2HmbRmWDpsazKuY8f6oLk4xisqEvtuFdpktS0yQR5
	 7fvDNiboTFuIdOg2dooaVpjYK1+uxMG7EhneSrHGfznY/Kr27lBlEFeRFFw8EvVjZP
	 xYQxiACcrjSMI1tZczHRYZ2XcFhpVf9vmF3oEm5Y=
Date: Tue, 6 Oct 2026 23:05:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use u8 instead of unsigned char in
 NDIS typedefs
Message-ID: <2026100639-yin-headache-cdbe@gregkh>
References: <20261006200622.41856-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006200622.41856-1-ampr.mhd@gmail.com>

On Tue, Oct 06, 2026 at 11:36:22PM +0330, Muhammad Mahdi Amirpour wrote:
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> index f4c1456f1..df541e956 100644
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -15,8 +15,8 @@
>  #define NDIS_802_11_LENGTH_RATES        8
>  #define NDIS_802_11_LENGTH_RATES_EX     16
>  
> -typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
> -typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
> +typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
> +typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
>  
>  struct ndis_802_11_ssid {
>  	u32 ssid_length;
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
