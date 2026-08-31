Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB69342CB3;
	Mon, 31 Aug 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173147; cv=none; b=Sp0EQmWD1dIg7vpG7CfElKnPK4TMJgHuvYxms8eq0lgXp1MPRHfK9pJ4TqNkVW/pohIr22zXhv/Xf6cqO66EwyNWCqkt+mCehhJkmN51ONWRqqAiZgunSzrdGigtrDyxLk1d6TmQnR0yAsy2V7AQvvELbRm4/jxG8xSlutrdg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173147; c=relaxed/simple;
	bh=3AComLKj4m4dG7nK0Hj5lY3D8puCW5qfqazfEbsCihA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdK5LW/WLGlB+PpucN5BgNWyIznfYxLT7IPeZjyBSOxoWq2JVMVOKZSjydDlgq6Z4ckhgs4whh5qlsO7034zpswiCqrFmzRUOBAUtaStzWxsz2IzG2k3e/C/HqZf636f51132YjUa/avPLAwkSG7EkuhIBk9TDtOYQ4fNY/71oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n9u3LenJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n9u3LenJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC5B1F000E9;
	Mon, 31 Aug 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788173144;
	bh=jYGpLewQiOsuagxOxZpA10RqTV5SBMCe8EHk8Sa1VmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n9u3LenJ7AuU0T9e8JtLL/U+xVhurgn8avK4yYafTzF41ZI5i+EyaBKg57vwShmcU
	 KyMu+D+kzPOfJ/ZlJF6UvlmAfkKORgkpaUNaNi21qKKv7989M92rHoKEZtdO/vOiPr
	 wxSis5Iu1cECg5NusbO9wqdCXKN3nnXFJqooVX28=
Date: Mon, 31 Aug 2026 12:45:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: appledisplay: validate interrupt report length
Message-ID: <2026083125-garbage-actress-84bc@gregkh>
References: <20260830142410.37791-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830142410.37791-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 10:24:06PM +0800, Pengpeng Hou wrote:
> A successful interrupt URB completion can still carry fewer bytes than the
> two-byte report consumed by appledisplay_complete(). The callback
> unconditionally reads urbdata[1].
> 
> Resubmit short successful reports without parsing them.
> 
> Fixes: 069e8a65cd79 ("[PATCH] Driver for Apple Cinema Display")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/usb/misc/appledisplay.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> index 16883592f7fc6..4543545793e27 100644
> --- a/drivers/usb/misc/appledisplay.c
> +++ b/drivers/usb/misc/appledisplay.c
> @@ -82,6 +82,8 @@ static void appledisplay_complete(struct urb *urb)
>  	switch (status) {
>  	case 0:
>  		/* success */
> +		if (urb->actual_length < ACD_URB_BUFFER_LEN)
> +			goto exit;

This should go above the comment, right?

thanks,

greg k-h
