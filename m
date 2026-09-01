Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803D4766B3;
	Tue,  1 Sep 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256754; cv=none; b=EA0JfBKShuGMOJxCsOtln2muIkMnFgeQ/y6m0zVKyOVWSrOIreF9fZeq4SGVGp1r9vp2SsumnjAtYRUjeNDhlrbmgUVGSFFvPNk7tWT2XsdTEWeAb1NldT9KUnHF80nfRb/TRcmIhppZfa4xiMSMjW7UtDLdCoPWRZ7ta/i8ZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256754; c=relaxed/simple;
	bh=7pI+0qhxAKcuGbcxDDdmszTRumq8OhjFsEHhyo+JRtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJlZhV+0XPwF+KxumxXmwMtQhiK/KOAKUfnw0Y+wbUu/gjlDEqpP7uWnN19VoGnMh6bn6CVbohsBZgWEEhXkskpnQLHkjo7c3gN9uPZ50UMqwhhQTxM0ojQPzPU57Q2r7G9sokINVmgUI2yP5UnUzdpY9A4sOX7MGHKizPHbNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vHGkJnyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vHGkJnyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F101F000E9;
	Tue,  1 Sep 2026 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256752;
	bh=e8ZMP+danBPh55Hc6MTSpKH22xAjmnQmTWqJR+CJ3ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vHGkJnyM8vJteNSMjcw9rjsiQVaW0DWsD57SSbftF+IYHK0kDPBk5uPSlyMeARcPf
	 pHFhONdkmX8fVcB37sUDFxobSr7Bjp+txZ298x9KmrqrCq0n7tyPwrs2ReJDMZiTvN
	 5zVqWrNaZLoJHoNq0TSYBU6bW0i30pZfn/Y6qE7A=
Date: Tue, 1 Sep 2026 11:59:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andria Shengelia <shengeliaandria9@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rtw_ap: fix line wrapping and
 logical continuation checks
Message-ID: <2026090153-heaviness-computing-998b@gregkh>
References: <20260809144355.161212-1-shengeliaandria9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809144355.161212-1-shengeliaandria9@gmail.com>

On Sun, Aug 09, 2026 at 06:43:55PM +0400, Andria Shengelia wrote:
> Reformat multi-line conditional expression wrapping in rtw_ap.c to fix
> checkpatch.pl checks regarding logical continuations being placed at the
> beginning of lines and lines ending with opening parentheses.
> 
> Signed-off-by: Andria Shengelia <shengeliaandria9@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index a6dc88dd4..9c14ba1dc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -258,11 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
>  		} else {
>  			/* TODO: Aging mechanism to digest frames in sleep_q to */
>  			/* avoid running out of xmitframe */
> -			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
> -				&& padapter->xmitpriv.free_xmitframe_cnt < ((
> -					NR_XMITFRAME / pstapriv->asoc_list_cnt
> -				) / 2)
> -			)
> +			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
> +			    padapter->xmitpriv.free_xmitframe_cnt <
> +			    (NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)
>  				wakeup_sta_to_xmit(padapter, psta);
>  		}
>  	}
> -- 
> 2.55.0
> 
> 

Does not apply to the current staging-testing branch :(

Please rebase and resend.

thanks,

greg k-h
