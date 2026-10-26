Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032397;
	b=GbVTUAHcHah3MZVsltb2z5AhrPdMSgEMHTZ/mq+/ebl6LtZEwokEic84Y4Vo56K7/PRW
	 d0tqUxvtauqX7OeKJOEWlc1Z0I0SE9O1JAvZbmzhLgE3PUynkfvqP3IWLi1FJ+w8NNNWm
	 9NnvoaMsjUWTTueBLrZ6KRg5fc/wo8K+MiZJoJZ9R+TageuIx22S0va2ije8foiUNJwfE
	 JQf1DZykovScC9BdXTUngqB1gibKSGComXLiTQqASxD7WQM4aCAqIvPd4FighU9p7Nvtb
	 5oyJJxKGhkbi5ob9peWehMr3hDvGp8w8FriuA8fET6k1yPcw8pwEdJ09ovNMeeXIa4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HQVmRinHyVUSzW2nBKzDIx/T1n7zM5fRFjloGHsG9rI=;
	b=COlaZuBfg5KbR2nl1VE5Ua74BGYtwirJd9AJ2rey4y4A42rNVf3rHz6CGHVK63gmPh3u
	 JV0eOsUL0JGN7BUHrC1DvsC4I8PLdOcR1dFCfsRVQ8NU2k8L6HwUwtZo/ePfW7Ahohg9Z
	 T0x7LlNwz8YqEgQ9Ec7JWH3WtSCn7G92nNSSfITx/QG6yyOz6vGnuoDRegMPXzLvVsFj0
	 M+uFT2oTRkStdmrDo1NgGSGmyVmAVX5dZBX0BpMHGRH5gVnVe7jsxgB06PRKGZlDk4dUk
	 XgHi/5guYNKRAxVbw85nTHb7SUeXEkPB+r5dA89jP5f8mBEPc39lUmEgjycnEwrfe9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oVgXQGZ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F9606A31A;
	Mon, 26 Oct 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oVgXQGZ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C874D1F031E5;
	Mon, 26 Oct 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793032396;
	bh=HQVmRinHyVUSzW2nBKzDIx/T1n7zM5fRFjloGHsG9rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oVgXQGZ8nEuiGBNOWWM6YF7ppmz1ESP2aXHRZbox9zaEgltOfUExGehx2bWyy7bIa
	 CGY5LPBrvkFbzvwvONMRQkHcRLfqliFp+xQ1k6QzEkYr+h7a8B8mR3923kBl8Uq7K2
	 gegoomTSLFol68rKdpVc2IHlIotp69zolfrupm6Q=
Date: Mon, 26 Oct 2026 17:33:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in
 atomisp_freq_scaling
Message-ID: <2026102606-dagger-data-6f98@gregkh>
References: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 04:10:58PM +0000, Abdullah Mohammd Sifat wrote:
> The local structure 'curr_rules' is declared on the stack but is
> not initialized. Initialize it to zero using empty brackets '{}'
> to prevent potential information leakage of stack garbage values.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index e66a7d1c7a0e..d4de2bd9a0a5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
>  		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
>  		return -EINVAL;
>  	}
> -
>  	return 0;
>  }
>  

That's not what this change does here :(
