Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE9471CE0;
	Tue,  1 Sep 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256873; cv=none; b=ZpoF6mL31HwFwEKiylrfB4VtEzclPkVmnSiVb+ssuDVjsozamNPolBQ6otYBjbEjgySQdqUs59uLKfJ2+WId+szERDNFJssnh422fZR0ctS7I6+cZB338VkO8Fu8AYv8VDdlRs4X8g7nAZeQIjHZOilKmal80x6whztWxp0PY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256873; c=relaxed/simple;
	bh=/3YKQMEpTCa0m8Z+JkZGPmz2ATUlrF2jbZ4wM50q5Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bz3ytTivC+b2D1DTsBdgpWCtuaRlcWkLSkhcIhL2dw7l+3C1zqK9jwcdOHaixMDME14GZcWL1IVBvMSfJs98/rTxufjIGsBp/qjVdrKrtbuN+rxlSuhNMpL5IEfu/V7ZN4T1UC5OZy8ixTfLqb8HT7Cbm7HmdrqH835aF3sq1jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nzg6S4A6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nzg6S4A6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EACC1F000E9;
	Tue,  1 Sep 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256871;
	bh=EgndG3pV+o3sy0yPD/YgmUFFfItgrNvoxewRP9KagBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nzg6S4A6KYsquoTleEB7c5BZZh0l6Dh5snThIZj2DdFLhgty8aHbreNSE6BfSX6d4
	 VOVO6+x/9lXqwpMBeOGIMcysRTDzKbY73cQr40bWtDXE5XCAdy1XOOYlJUrQdfpB5s
	 QiwTQk8ywZGraDCrtRLbehDpxL870b4PkIaRI5qs=
Date: Tue, 1 Sep 2026 12:01:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Burns <oliverburns.kernel@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove CamelCase variable bAllow
Message-ID: <2026090156-banshee-unguided-950d@gregkh>
References: <20260815203711.36973-1-oliverburns.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815203711.36973-1-oliverburns.kernel@gmail.com>

On Sat, Aug 15, 2026 at 09:37:11PM +0100, Oliver Burns wrote:
> Fix a checkpatch.pl warning regarding CamelCase naming conventions.
> Change the variable 'bAllow' to 'allow' in rtw_cmd_filter() to
> conform with standard Linux kernel coding styles.
> 
> Signed-off-by: Oliver Burns <oliverburns.kernel@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b932670f5d63..aa4a810d8322 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
>  int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
>  {
> -	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
> +	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */

Shouldn't this now be a 'bool'?

thanks,

greg k-h
