Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04523BCD36;
	Tue,  6 Oct 2026 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320856; cv=none; b=ptzR1OnBqZ6UtOqDOGx02I+9CcXztYBJmgE00y/sK0EvZexTPUs6W90Vg2WMaY6VyIZ+S7yS7fkQ2nktCxHBTi3fyow7zBS+lQAGZnZQ+4dUeIHGGTp9wG7K3nc+2TEW4jf59rnOL7IC62hwYOWd0xlRwK52jTFdQMY3DfEggMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320856; c=relaxed/simple;
	bh=uJIdjlstm/Kc/bgRDmdLhvnK+fv5bV80nUNLynMc+Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R18wZKu73NyVo1rhtVkrAaIXkdyzOKL86Xmn5kY5cZ85eVBdFWM3Je6ibX2hwEQK/GWximG8K5jaNKPRrV8I+wUBxvlEy5DyFSzLoxny+Aut97kOnhjKGJhRWtSSvcxMT8zJ+zidhN/gfqGec7ySGMOqIlYIwvi1KZ7h3L0Y/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dIQPYrLt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dIQPYrLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76BF1F0089C;
	Tue,  6 Oct 2026 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791320855;
	bh=9AZ47+uSZVu8Zk5SOSvF9k3fUVij1g4cZKnHL1J6E/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dIQPYrLtvCiXWKu+6cA4jiZTO5wPgNbWf7zmj5QzDeULwRuLJyNqxB4X4GvtzMP/d
	 +dWnwi6kMzeSIstZqsCH90UwtXcYfL0TtH3nzowFBXGDzq+sXITmF7SrkkhnRRh3yo
	 6HRqH7o5cPEdkxWJru+y01f0kiCkXQGDVO20jX5U=
Date: Tue, 6 Oct 2026 23:07:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Desai <contact.pranavdesai@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: replace uint with u32 in
 hal_intf.[ch]
Message-ID: <2026100644-willing-nucleus-82ce@gregkh>
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
 <20261006200751.819332-2-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006200751.819332-2-contact.pranavdesai@gmail.com>

On Wed, Oct 07, 2026 at 01:37:50AM +0530, Pranav Desai wrote:
> The non-standard 'uint' type was used for the return values of
> rtw_hal_init() and rtw_hal_deinit(), as well as their internal
> 'status' variables.
> 
> Since the underlying hardware-specific functions
> (rtl8723bs_hal_init() and rtl8723bs_hal_deinit()) explicitly
> return u32, replace these 'uint' occurrences with 'u32' to match
> the underlying types and conform to the kernel coding style.
> 
> Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 ++++----
>  drivers/staging/rtl8723bs/include/hal_intf.h | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
> index 1443875d1369..1290631a2158 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> @@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
>  	rtw_setopmode_cmd(padapter, networkType, false);
>  }
>  
> -uint rtw_hal_init(struct adapter *padapter)
> +u32 rtw_hal_init(struct adapter *padapter)

That's very odd, shouldn't this be 'int' and return either 0 for
success, or -ERROR value for an error?

thanks,

greg k-h
