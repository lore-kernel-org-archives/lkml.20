Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E356C257855;
	Tue,  1 Sep 2026 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256802; cv=none; b=r+EGaE4txO2NgpRbol0VuSrKacd2WkX2qG7n7YZP5qp4Kqisq9TMrBByTJPKMUSj+B9ppq4+uAkmo2xAqmuHKAqoLRA+JEqJ/aIn0twiAY6qgCVP3D/uZ/MV+pL5C+KOgsFm+TY5GAr8N2xG6peWnuTB8eUZaw9dWOpevWuDTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256802; c=relaxed/simple;
	bh=qqFbmuxK2lw97zIhIYQvVSwEoLDY1DMNmZaboZdQ30A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQXSSBt9gijoqzvoxX9htxd8pTlwx5ejB7kMjV5VptF0jHKL/2vEeNvCg0riVKiUaKmKRQJb9DrZDUFeIvMzp1ROP4y4eLLhoP7X4IiGOhX/n+fPvEm7Yei4G9w8oO2q8F+sInTNkTa/u/FiYO9lYtCd9KLqwqhyusNVhejEJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YqZ/WjGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YqZ/WjGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB741F000E9;
	Tue,  1 Sep 2026 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256800;
	bh=Bi6HPjlHgAJcODQ4PkC2SRjJz6kcOfKj13UnPKGDgHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqZ/WjGQCEXG3VGzFdcE9F0U8FJ1rTQxcOpWWc5TY5j7OUNeL4AlKUBrMCHQP+Ov3
	 ZdxR0yJhIJyCIC1GVNVblkdK+oJmIpKpb8PnmIzNlevPP2NCEuvDro7/iyBvlKq1GE
	 Km0IYhtf/bDqsmjl6QWHn24MPcinbC+o6pjILlcc=
Date: Tue, 1 Sep 2026 11:59:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jonggeun Park <ndamin221@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: remove dead RTL8192C function
 declarations
Message-ID: <2026090145-frigidity-gigahertz-ea54@gregkh>
References: <20260811142355.60533-1-ndamin221@gmail.com>
 <20260811142355.60533-3-ndamin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811142355.60533-3-ndamin221@gmail.com>

On Tue, Aug 11, 2026 at 11:23:55PM +0900, Jonggeun Park wrote:
> include/rtl8192c_recv.h declares two functions:
> 
>   rtl8192c_translate_rx_signal_stuff()
>   rtl8192c_query_rx_desc_status()
> 
> Neither has a definition or any caller in the kernel tree.
> 
> Remove them as a step toward the TODO item "find and remove any code
> for other chips that is left over".
> 
> No functional change.
> 
> Signed-off-by: Jonggeun Park <ndamin221@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index 1f86654f0..b63625ab4 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -30,7 +30,4 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
> -
>  #endif
> -- 
> 2.43.0
> 

This patch was already in the latest tree, sorry.

greg k-h
