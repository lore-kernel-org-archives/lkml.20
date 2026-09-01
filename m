Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B0279DAF;
	Tue,  1 Sep 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270834; cv=none; b=BPeC2J3eIBkEry6KoBNMPhmm7/MCIfkXHBMR6zG1g/xwFdI84DCgkxsHob0UCuppVZau1qEynW38oTPOqzx+Gas+Dnm4yCNsGa+jht9X3tR41SwtYgnWJGYxIwU9zZgG5g5vPn9X6o6oGyH31ViDxDLg8EiWc9B3ZrpvneHR0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270834; c=relaxed/simple;
	bh=OldaB7H2UR+Rag5ACGkbTma3E46xEDBNJpnXjcrHyIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiRafPKp7CIUIkujZbSCRB2ZSW63U2YCvcjDxbe86V5/kr/Dd17y2kcQoyL/1A240zkQFIEoSq8JdfhYPW2oUa7ZsJ9I1FWRHSZARLJOMudO2KFqj1iKO78OO+9DwgnnsWnsoWo5VxH6a0ijbGd4I61FxR6lswzh21vCN1CVsNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WJule4/X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WJule4/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B2A1F000E9;
	Tue,  1 Sep 2026 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788270832;
	bh=qfmRFBs8rpVmdCREt9mjtCanxBp2gr59HJ2Ln8qZ0GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJule4/XcNIV56Sas0fFE5xG5tPlFlE9Wz4AqXf12TfnF9uYeuE2lbHXnD84Xnlhp
	 pOQyon3vt9JbLVYCmn4RxBwaE6Ieq+Skq/aAYFeEYkt11XJA29U/zgfM0QzVrwHkEx
	 MKW8Oi7SWvAA5wfluI8lGLc2tvjrzumF6nAQjnrY=
Date: Tue, 1 Sep 2026 15:53:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Godana Emiru <godanaemiru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: split chained assignments in
 _rtw_open_pktfile()
Message-ID: <2026090109-stoppable-mockup-b819@gregkh>
References: <20260827062137.12937-2-godanaemiru@gmail.com>
 <20260901110437.37588-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901110437.37588-1-godanaemiru@gmail.com>

On Tue, Sep 01, 2026 at 02:04:37PM +0300, Godana Emiru wrote:
> Fix a checkpatch CHECK ("multiple assignments should be avoided") by
> splitting the two chained assignments into separate statements.
> 
> Assign cur_addr and buf_start directly from pktptr->data, and pkt_len
> and buf_len directly from pktptr->len, rather than chaining one field
> through the other. This avoids making the reader trace a dependency
> between the two assignments to see that they end up with the same
> value.
> 
> No functional change.
> 
> Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
> ---
> v2: Assign each field directly from its source value (pktptr->data /
>     pktptr->len) instead of chaining one field's assignment through
>     the other, per Greg's review comment that the v1 split was harder
>     to read than the original.
> 
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 7a9d2fabc..9f0d84e2e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
>  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  {
>  	pfile->pkt = pktptr;
> -	pfile->cur_addr = pfile->buf_start = pktptr->data;
> -	pfile->pkt_len = pfile->buf_len = pktptr->len;
> +	pfile->buf_start = pktptr->data;
> +	pfile->cur_addr = pktptr->data;
> +	pfile->buf_len = pktptr->len;
> +	pfile->pkt_len = pktptr->len;
>  
>  	pfile->cur_buffer = pfile->buf_start;
>  }
> -- 
> 2.53.0
> 

This was already done in the 7.3-rc1 kernel release in commit
cb08dcd0a896 ("staging: rtl8723bs: Split multiple assignments in
_rtw_open_pktfile"), sorry.

thanks,

greg k-h
