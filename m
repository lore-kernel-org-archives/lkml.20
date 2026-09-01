Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70744471D03;
	Tue,  1 Sep 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257607; cv=none; b=dmyHxXO/26ucnmKoy4Bc/k2PucKZmMMS2y8CUj0J60Qm3Dc+e+/3IxQB4RmntKAqV7/H4Wie6UkfQrVSRjuC3FNYiAv/jj+ad7I3fTdTkrUmrh5Vz4Bljwkn9GwZImWS9YwZpZWJYIvKxxUx2djQ6EDr2ssIIJge7sdC41/+9pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257607; c=relaxed/simple;
	bh=2pq+Aqq4jYZvFwNTDsWbLrV7Cf3s6mybBSFyHKXU33g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAeRL2FBI1U9Pz4pBGdf7SuBLEEshIiMPBIVTNZOxVImPtNe4UVSDtK/vWYNG1WXbT+eOeKYWLDbH5c8T2o2sKvRYzQMgrwxvuMpKsTej5uR1ozWKt6teAlyjTqHaliWCtaJD0SPKwAQUObmFEyxREiskCj5zt2KvGZT9qWXeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bcCzaOcH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bcCzaOcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E511F000E9;
	Tue,  1 Sep 2026 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257605;
	bh=hdySn/5UrvLE5Z25ojJOkbvNgQ35SLR6YKvo9YbuP98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bcCzaOcHSwGOLMHKc18uaSVDrBs3MFJhQOjxyZAQglRN/FEZAOdBDC7e1J/TP76zr
	 30okywR37FYhaV0Vl4nFqY/QEhvsp+rd6MgaGzkvrofFXYUDptdq9SG0ZlzPuRAFHd
	 ydKb9wRx0k1/NGzNS27QS7AKNQDotfPYp0AtJV+0=
Date: Tue, 1 Sep 2026 12:13:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Godana Emiru <godanaemiru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: split chained assignments in
 _rtw_open_pktfile()
Message-ID: <2026090102-scrap-scribble-a9ae@gregkh>
References: <20260827062137.12937-1-godanaemiru@gmail.com>
 <20260827062137.12937-2-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827062137.12937-2-godanaemiru@gmail.com>

On Thu, Aug 27, 2026 at 09:21:36AM +0300, Godana Emiru wrote:
> Split the two chained assignments into separate statements, one
> variable per line, preserving the original assignment order.
> 
> No functional change.
> 
> Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 7a9d2fabc..c5f90a906 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
>  void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
>  {
>  	pfile->pkt = pktptr;
> -	pfile->cur_addr = pfile->buf_start = pktptr->data;
> -	pfile->pkt_len = pfile->buf_len = pktptr->len;
> +	pfile->buf_start = pktptr->data;
> +	pfile->cur_addr = pfile->buf_start;
> +	pfile->buf_len = pktptr->len;
> +	pfile->pkt_len = pfile->buf_len;

This is harder to read now, right?  Please see the archives for a
suggestion as to how to make this more understandable.

thanks,

greg k-h
