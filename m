Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA6340E8C1;
	Mon,  7 Sep 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777456; cv=none; b=XXVRJAY7eC7yQ4ioccCRxVBWEUY5ya2VT2CLzsfZk8f9FQtvn8aFRA0/oFbyQY3XlP0UGi0ViI2yVYJg5yG2ZlAaif2vOYZW16xwK34eIKVWiF9XIUxUiVqo/dwzQ222CfMW8GmfoUuc0bcSoF0ScW7WLXNWfzS++OYJPAgt+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777456; c=relaxed/simple;
	bh=nC01GbWkcbqOJAQ7WmLxzXZy/Px4NgVP70yydgECWQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwYLi5p/n1NAdl2t50DBVu2UmhPt8qeMJyZGtUOUgb8/5wXRL0f8OhN3Ka5yzq/USNYMbE3Bl8BcdekuoK4HRU7zrUiENAp7AGmtGJio6fNQaqpWhmw1BULgigukGo2eIljoneqGRbXGAqGEaSZS5Q62czcyNbXTARfpeJpZrTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=wUtN1Gj/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ryygnn8u; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="wUtN1Gj/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ryygnn8u"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AD3F01D00125;
	Mon,  7 Sep 2026 06:37:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 07 Sep 2026 06:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788777453;
	 x=1788863853; bh=QHECxCxsMSHy2+f0P3KbC00s373RUUJzdC1ylW0/MXs=; b=
	wUtN1Gj/Hr8K+wtof/ts6eQQ1hOWIjXXAUx0aTaLKMyujkRydKyi8TucjgTekHAc
	pk+T1VJpBZ7mu1fLqWD4CLSI98p2SfhiSzGV4ZtFi5AoDyaYlewIn51RWhmEniyh
	ulBZiZd3op1YhXQBnnMfVrnoOHlWFViaLXpfPa8udQJKL2hu1Ajb8J7ugMBM/aF8
	WXswYtnnZ2DpyC1nyrhMfpWbkk5EVG2kupG+miJSH3zRUk1oRx66IhJzyOZTRjgE
	WekTr5RCKB/N78EcImsPYCNkTQXPnGNsr2RC2w5ALkpvWkduEc+yVm6fWlPbjfeg
	J/J1gaHTjAG3oczC1UhdFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788777453; x=
	1788863853; bh=QHECxCxsMSHy2+f0P3KbC00s373RUUJzdC1ylW0/MXs=; b=R
	yygnn8uFu/VHuy8fOGzjQSw/LH3iWZbGjL3YqRrzvI6lx9/XR609u1SxiGdEXbut
	eTpN8g8JLwj2Q+OWdYe9eVVp/jj/aqGjQE+gZSFcjOHYZu98xbXixKO8cYzM32T3
	p7UcLj9TGecm5I6bxkVJs79FfiHtdsbeCNf46QnM4FSxHXmtPzKxj4O0/KwVvoNh
	E+CUvgWlJ8UI+q5nMBg3VKxekTPgChRQ6lMv//12gAaDtIC0FZOWDDZTHHnG94uN
	fQQu76RNwzx0C3M1WQA5HXOrYbOrCPN+hb7i6Vio7ImS3MYiqk6CEnKg7JQm2dYR
	/BD9nOGLR9jr5muavTGLA==
X-ME-Sender: <xms:7ZOeaqNQHbbgHd3T9_GltbmdFQb0n5dlxH1VJ41Drheh76Uilch8ZQ>
    <xme:7ZOealiu_Qh1tDnVa9Fi-ma11Knx0r7qIN6ZpT605z7FqnohrwzFnM29DJHV0RmE1
    cLZKTyNOEz7iD5ZFTlI_ZbNO05jMDmFUMsICbRfiy2DAIZW_XjhnQuQ>
X-ME-Received: <xmr:7ZOealuEbDvFJotJH5pbp4EHjF9TQrxKJKPywsYzhuc_1WGVnu0cUTTwvuaEdnl0_EVh8Xo4pt3e5i9U9CQvBAPT__Dy4xM>
X-ME-Proxy-Cause: dmFkZTFRifovugG/Mk8kz9VBjjBhciiK9ZZH/xj+dIoFAqGF4KkkmjO2NIX9TYzN6/20c2
    wLUprgT5t9RDKgd3PVxR3DYmSddRAkuIZuxlg5iUPDpqUyoFzPUB2HgFMSaGVKkAabcN1u
    Pl5VsBRemP0VrnzNPc00r3jHkESsysOVNnzTQwD74YdGEmwawQPFvAN+8fyYpqWfZXU76W
    7MN/Mk0mA1ZT7oAhg29gdrWX1Q7YBRaCKKF6ZRsbUJ9ukJxi7uJyHybdO7dmkiWbhPJTLk
    hojJ6Km03b5S+uWNFRGzmoIdN2xxCkDr2L3wmy/J5FtkdPIbbdqAb0ayu+40STZ8r70VIU
    YJ/LCPi/IOQFvyGfDhLV3Fefw+sNX3vV9bE79UiplVna+uPlTlyJL3FiHUrfqjxGqXZrxH
    z3DO0AGgx0TADSe+sHYHgKJQkbJxErUhTfa+jzQYMkvsSJoLr+icBqhRdTbkiOaw6Cul9c
    wM6zxlzd5OF7udf3LIzboD/x+gw97GlxhSIrN/YAy52q07GXSkcX12rmbASyJEciS9ANU3
    4uBzyR4jtTn7WFdeRHa6uxCLx1IrnN9ELsIqz8yLVF8m4Freg8poDxzBlteDVd3cZGYoKr
    rdetUlpAeEUk77EAsWaHvFS/5ZjAUzOmP8ThmD6zmjCFXgXLIGvpdSHvYE4Q
X-ME-Proxy: <xmx:7ZOeahged-raDFeafOke-hXtr1eQUXPGwXNpmE_lpPP2xqdp5Yd0wA>
    <xmx:7ZOeajY4_8Nw3dg4cIuawoJIRj11zzVw9XHsLMF5u_Hc542D69FIew>
    <xmx:7ZOeaobq9T5V98KyqeYyzS6iM8RNls--QxH6IBSZjAqwqK9uxE-vzQ>
    <xmx:7ZOeagyosbqnh5yUnW2c47NvnSu-t8qelAZdCgNF-lMORTXmBjZ9Ww>
    <xmx:7ZOean5Sec7Xq6KlsaZ1tujDYPDw6V1l-5JxB1-q9zte6Krp_59scNss>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:37:32 -0400 (EDT)
Date: Mon, 7 Sep 2026 12:37:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 01/11] media: rcar-vin: Fix comment related to stride
 handling
Message-ID: <20260907103725.GC3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-1-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-1-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:54:54 +0300, Tomi Valkeinen wrote:
> The comment says the stride has to be aligned to 16 bytes, but it should
> be 16 pixels, as VNIS_REG register is in pixels.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Fixes: 40c6da8a9c0f ("media: renesas: vin: Fix RAW8 (again)")

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index f9af9177e02f..d6c69c674d57 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -678,7 +678,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  
>  	/*
>  	 * VNIS_REG has four lowest bits always 0, i.e. the stride has to be
> -	 * aligned to 16 bytes. This is done in rvin_format_bytesperline().
> +	 * aligned to 16 pixels. This is done in rvin_format_bytesperline().
>  	 */
>  
>  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
