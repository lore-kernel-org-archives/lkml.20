Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F12E06E4;
	Thu,  1 Oct 2026 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847168; cv=none; b=WQ+jSulL9rXmT9+r7KGPijzevUHiYkAMtYv2RiJtccRy3VCc/IWEW/EiQXeXVzQZt78YTJ1CxhPZD1RNZYhDnFzP6eWFQbimuwrysbndj4msZ8Mes86OwvJC0GZX6ad9sLteEuVPeZM7LLgJBH5zKwMvuhGtzwgodnJUlfrMTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847168; c=relaxed/simple;
	bh=XJiueADghLyLwbIZc3AcKR0IvPahUz+22530pqlb2/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV8lLsslDUO0U8oVZl0lsFec2tf0tserLWgyM9tGE4jLmNCzG3j5Z1cY5uLQ6kmdicm+Fd9eJDXaUz5IJ8x+zgb7GRJCzHJnKFPuBpzKZoOFYzfHhohqdByOHbW6Imdqymq0P415EcyfYNjdm79PR0cZ/LGxuCTyNDJ3P/B0QTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yd+y2I/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yd+y2I/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A931F00898;
	Thu,  1 Oct 2026 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790847167;
	bh=5Fct3uDnKb2lV3DBFo3WSMgmxCqbWrG6VAqWnzi8oBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yd+y2I/vHFz8JDGpkbV/BOvvYiGEBfptIBxPOMGF47wGaDLXS6z4kThL4bdjO+QKV
	 XpYXp8tEdcli+mRs5CtDtw0BXejEItiESl4ash+MeTrXe/6vti/fk5puno12Urgeka
	 GShEdLufQDhoMpJohsjzRGiaNqtVNw3aH0/cryvU=
Date: Thu, 1 Oct 2026 11:32:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs : remove dead commented-out 8192e code
Message-ID: <2026100130-sulfite-operator-a572@gregkh>
References: <20260929130716.61119-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929130716.61119-1-timo.joannin@gmail.com>

On Tue, Sep 29, 2026 at 03:07:16PM +0200, Timo Joannin wrote:
> The rtl8723bs_hal_init.c file contains a commented-out
> call to rtw_write(8) referencing REG_DWBCN1_CTRL_8192E.
> 
> A grep of the driver in the rtl8723bs codebase shows that
> REG_DWBCN1_CTRL_8192E isn't defined anywhere else,
> meaning it could never be uncommented without breaking the build.
> Remove it to clean up the driver.
> 
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 6a4a13544ca1..748567059af8 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1903,7 +1903,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
>  			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
>  
>  			/* SW_BCN_SEL - Port0 */
> -			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
>  			rtw_hal_set_hwreg(padapter, HW_VAR_DL_BCN_SEL, NULL);
>  
>  			/*  select BCN on port 0 */
> -- 
> 2.55.0
> 

Someone already sent this change before you did, sorry.

thanks,

greg k-h
