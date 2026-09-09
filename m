Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26913D5259;
	Wed,  9 Sep 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946450; cv=none; b=ZzwWy4IBYqRtCHcpS4HAVtsxDF7zYk8MyE5K4AK7kWrvW214dP5HF2gJ5qjSWB1pNyaZbWrLAzgiKWg0hI+kyzrBHsxEE4sTy69Q049eph8BgfkahrZ8mL1hIB+CPoWcWoLZK0Jbci+pBmHrfPnqZcTNcAePNrp4kqK9v2T4NHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946450; c=relaxed/simple;
	bh=bK6uGbR+arNcPwGSMi9GQLc4WcwCaboBqC7sX6jJVeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n38MAp2HRm3KmKYVLZhwnfKEbNdH65GM8xcHE1wgV+6+UATSHlmfIq9DUigqSPkWxb7xrnsX+9fAb43KTfZTCYOihBhpCPIq6dMfZ3pIFOXpLPpTofy4//Hy2uZ6RJY+WZX9/ZdA1SnaA2H/T6g/l+asGMv/BytI4UjICcANNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fi7HjBVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fi7HjBVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77741F00A3A;
	Wed,  9 Sep 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788946437;
	bh=R0xd+kGPMMkszBtuzEOEh5zJ1Uv18+wxjjPiEdG9ayc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fi7HjBVm/yVlbRft3UA1vR6KzaMuUDoRzdPkrtwm83oi3zFpNxKOU0EKC4OSQqLhH
	 qnOZSDsfKDyZglee8ovkuzi1wXmEwwaiKaW4JU03mtarXJlOECRdJwlqFMBZttguAt
	 BRHB5blA0/dRblLbMVYqW+xe5UygcahHEAf2Nl4Y=
Date: Wed, 9 Sep 2026 11:33:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Isaac Aneek Sarker <alvasarker2004@gmail.com>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Minu Jin <s9430939@naver.com>, Anirban Bose <boses156@gmail.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unnecessary else block with only
 a break statement
Message-ID: <2026090924-tiger-unaudited-e9f3@gregkh>
References: <20260909083010.13064-1-alvasarker2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909083010.13064-1-alvasarker2004@gmail.com>

On Wed, Sep 09, 2026 at 02:29:38PM +0600, Isaac Aneek Sarker wrote:
> Warning found by checkpatch.pl : else is not generally useful after a
> break or return. The function would reach the break statement after
> if-elseif block even if the else block is not used.
> 
> Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 3c82012fdc6c..a203ef8bd6f6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> -			break;
> +
> +		break;

Did you test this code?  It looks like you now just changed the logic a
lot, right?

thanks,

greg k-h
