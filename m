Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F525D53B;
	Thu,  1 Oct 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847278; cv=none; b=RKUxJiYxxfzbP3BEV2yzMIQ2KaV4OLII3JV9kXv1IBI+z5nqLpFgZ+VM4X73BSlIkLGrJ1QmBtdxY9fXSUPPtVAkpNSYKVRqQLZRKa3U2cCCH9GL9JwYpN4n7V2N7OgulGr4HkLP6/U6F4SXkuTfe+7Jj14H+JTHUaW4iw0lwss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847278; c=relaxed/simple;
	bh=hQYZDHQMcbw/d8KXo+HpSMl5noUx9NArgKqldP3vg+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnUf6BArVZl59Zb3lqg/yD56LMdWcidpsmhwpiPPjE71uDxKM5s2z4UyiMOwmfgcrQj8xhyxgjOo/VV6I/YDkEg5SkAEb+/nkWXfzLjUZYwrJTTRQOsOK8I3SV3njPEidS++VFJ388KnBzP1m52q+1oGSMBdnQGOqJOLk3tHENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YoWAbQxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YoWAbQxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0921F000FF;
	Thu,  1 Oct 2026 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790847276;
	bh=CrzPDLLP2wDEefnTNd8ytoRC5YCbDnBS8U835v19rQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YoWAbQxqx7mS7tZ3iLUsaHfuc8lacD5ocD1C0l9grTfWRVXUzHT5iNjN+sXwzm8Mu
	 khZM9hmptKZ4ROO02hAVdGZysW2OdIMMk1i20PRkBmeeJQcpRmhmRrZ24fgnZ23YLx
	 QsEkhZ2isAR+c4RlCwEgXOKjQSw/QN/0Qgp3OELE=
Date: Thu, 1 Oct 2026 11:34:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Eric LI (Honggang)" <eric.lee0305@gmail.com>
Cc: Hungyu Lin <dennylin0707@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
Message-ID: <2026100121-chirpy-stomp-9fbe@gregkh>
References: <20260924151606.333467-1-eric.lee0305@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151606.333467-1-eric.lee0305@gmail.com>

On Thu, Sep 24, 2026 at 11:16:06PM +0800, Eric LI (Honggang) wrote:
> Refactor the function xmit_xmitframe in rtl8723bs_xmit.c to
> reduce the leading tabs

Refactor it how?

And is the output the same before/after?

> 
> Signed-off-by: Eric LI (Honggang) <eric.lee0305@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 43 ++++++++++---------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 7f55448d544e..46895b05538d 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -231,29 +231,30 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  
>  				/*  check xmit_buf size enough or not */
>  				txlen = txdesc_size + rtw_wlan_pkt_size(pxmitframe);
> -				if (!pxmitbuf ||
> -					((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
> -					(k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1))
> +				if (pxmitbuf &&
> +				    (((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
> +				     (k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1)))
>  				) {
> -					if (pxmitbuf) {
> -						/* pxmitbuf->priv_data will be NULL, and will crash here */
> -						if (pxmitbuf->len > 0 &&
> -						    pxmitbuf->priv_data) {
> -							struct xmit_frame *pframe;
> -
> -							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> -							pframe->agg_num = k;
> -							pxmitbuf->agg_num = k;
> -							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> -							rtw_free_xmitframe(pxmitpriv, pframe);
> -							pxmitbuf->priv_data = NULL;
> -							enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
> -							/* can not yield under lock */
> -							/* yield(); */
> -						} else
> -							rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
> -					}
> +					if (pxmitbuf->len > 0 &&
> +					    pxmitbuf->priv_data) {
> +						struct xmit_frame *pframe;
> +
> +						pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> +						pframe->agg_num = k;
> +						pxmitbuf->agg_num = k;
> +						rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> +						rtw_free_xmitframe(pxmitpriv, pframe);
> +						pxmitbuf->priv_data = NULL;
> +						enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
> +						/* can not yield under lock */
> +						/* yield(); */
> +					} else
> +						rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
> +
> +					pxmitbuf = NULL;

This jumped out at me, why add this new line?

thanks,

greg k-h
