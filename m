Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEC37204A;
	Tue,  1 Sep 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257025; cv=none; b=FICfYEItvPlFiM/oVfDTGH6/YfH32WJWavV2tXOBVEkCUDngUnOiCGRXh/IWmfidRgBk7RjjQHyn/zfJ81LWcai3sNjnwbsnfZ6c2PR9XSo7ueG/g2y3k/DVoibKOGYBpd4VlQSuQqHS+wjJijplB8f5DpCbKROZvMmRbqQYoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257025; c=relaxed/simple;
	bh=x8Vufq/I8A0wAAJKlesyZUTH/mZORhnfdUNpVREEDC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYDGq1+vRhXIVlIvlCqZjawHg9CQC4VThV2dtRSMocOgRK8Dgp2UxR8ymXrL9jRRVLkBZ1JPkfX0ZiTCxFwWCFgsVuSg6tXEoIJeSCED0dr/pexk0DH2tdC3cjAjn3ItqM4QkKYHyJBLVOR3/ozBE+daDbkLaJeKWamcF6XZMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kH7RnwYV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kH7RnwYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A1C1F000E9;
	Tue,  1 Sep 2026 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257024;
	bh=4OI0q8A8JBPLvwPo94oZ9RhKROuN7ZcAiUOa5L/xAcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kH7RnwYVat5oB0dRF8h5CGJE0f0yhZ/S390z6t+fAT8yRvS/asava6WDGOhm1Bq/4
	 MMj2mR1VpUE5cGFqnHXNzr/NjBcY/Svg5P3+m5tLA2wwo+TCl4kiWo0tIOJO4VN5yM
	 7E2ncAFnsYgm0UGYpF+vZTfviMVpjb2CkJVGPq6Q=
Date: Tue, 1 Sep 2026 12:03:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: define EEPROM_DEFAULT_DIFF as -2
 directly
Message-ID: <2026090122-situated-situation-f599@gregkh>
References: <20260815191030.24989-1-skunkolee@gmail.com>
 <20260817210507.26168-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817210507.26168-1-skunkolee@gmail.com>

On Mon, Aug 17, 2026 at 03:05:07PM -0600, Ivy Lopez wrote:
> EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
> (254) but is only ever assigned into s8 (signed char) fields used
> to store signed TX power calibration offsets. The value -2 is the
> intended default offset; expressing it as -2 directly instead of
> 0xFE avoids relying on implicit truncation of an unsigned-looking
> hex literal into a signed field.
> 
> No functional change.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
> v2: express the value as -2 directly instead of casting 0xFE to s8,
>     per Dan Carpenter's suggestion
> ---
>  drivers/staging/rtl8723bs/include/hal_pg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
> index 7cb9c441fc01..83bf5f117e2d 100644
> --- a/drivers/staging/rtl8723bs/include/hal_pg.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pg.h
> @@ -40,7 +40,7 @@
>  #define	EEPROM_RF_BT_SETTING_8723B		0xC3
>  #define	EEPROM_VERSION_8723B			0xC4
>  #define	EEPROM_CustomID_8723B			0xC5
> -#define EEPROM_DEFAULT_DIFF			0XFE
> +#define EEPROM_DEFAULT_DIFF			-2
>  
>  /* RTL8723BS */
>  #define	EEPROM_MAC_ADDR_8723BS			0x11A
> -- 
> 2.55.0
> 
> 

Does not apply against the staging-testing branch, please rebase and
resend.

thanks,

greg k-h
