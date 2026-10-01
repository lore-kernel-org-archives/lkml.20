Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45278433E66;
	Thu,  1 Oct 2026 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833474; cv=none; b=Gr2OjMJf3yawCDYOdrZxFc1S8rDV5FblUwNMhMsJuXu4AubanUgOtQ8Wtmj1yOBkkLh1pY6VoLmmPe/lfo+Y2C125cFI3xpmBPGm19u2F/L+0RZZYpYe9r0x+0XobusiPkIbxKXP3AZYWfgvCFeS49bMcFFyHQPRymgwFcBA9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833474; c=relaxed/simple;
	bh=e9TOgl4yg9a5i9iDIxmxCE4x7ZIuMFSzPESbUP2Mp68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkSQXFozXbbsC5MZQ8GjqgqyJTmchS+fhVH3iWdYnyCqnDtVvhk/lYnCrx6lNMcFRb+pzWZ/IlSyIVNf0Tua+ndkRGezM3vMg0ylI1dD9Y7YPd1POlTgGzrahGW+jMAJvn6jR7iCh9EbLZ2gXQRK/F0EWBebk828l6gUHLHsEyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y5UMhY86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y5UMhY86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ECE1F000FF;
	Thu,  1 Oct 2026 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833473;
	bh=9V8QYghNRsqRYmOUnMK2mKl5uZWsvcoCapFpaBEm7ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5UMhY86sW7baIPHIe8TyO7xXAy3JtCYuUeQrjFlMbuaUFNK++Rgj5c1CZYOLWBUr
	 oZQm7lWcoKsEavnQd8kPlbZrfn77ai0tXkQrsXT6S+fgP8b90KHbGjnbI6F+M6kv2S
	 ko9mQrcyUGZoqh/aQRst7u0gcfAmJ+dkI8qHI33w=
Date: Thu, 1 Oct 2026 07:44:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gowtham S Bhushan <gowtham398gs@gmail.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Lin YuChen <starpt.official@gmail.com>,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Archit Anant <architanant5@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: avoid linelength > 100 in
 rtw_security
Message-ID: <2026100105-hangout-cannabis-36f2@gregkh>
References: <20260911054908.37690-1-gowtham398gs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911054908.37690-1-gowtham398gs@gmail.com>

On Fri, Sep 11, 2026 at 11:19:02AM +0530, Gowtham S Bhushan wrote:
> Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 2217cffac5f2..e82392938805 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -34,7 +34,7 @@ const char *security_type_str(u8 value)
>  
>  /* Need to consider the fragment  situation */
>  void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
> -{																	/*  exclude ICV */
> +{					/*  exclude ICV */

Why is the comment indented like that?  That's very odd, don't you
think?

And there was no changelog text :(

thanks,

greg k-h
