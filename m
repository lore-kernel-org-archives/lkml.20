Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F33EC687;
	Fri,  4 Sep 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529011; cv=none; b=G6/fEiT3vTgyXcWlnTwOf8hLx9mIbENkiSLOgNMR95MM2tEMZ2q8FyvWRWHMrJh6IAUQqR5TJ6GYRtYwcQ85EU2nUqaURsEt7flAS7fmJqSLQFBIxPIsR/mUqsNf2O+znHXW5jAmKN1Z58fhuF5TB3h4GA4fjpU4/Wj7U4JDAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529011; c=relaxed/simple;
	bh=0icSFSNEnmNMCi/02d7P9wcic8jxWEXn9hAZv9tKbXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGEjgYdJKjjpCeTyKKwW4ZAeA98nMq5ROWAyEOhAM4N5P4i77opGGauuk7TDgaDk1Db+pLzbEkXNRK1+dXC6MkFFZHL96aq4XMB7mZtasA1WHHXpXw8ZxutB8c/pQWKJ8q8cAlK5yXI3ieq+rPNskMQ8mXD3MCoAP8xKjVDi3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rclMmYqf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rclMmYqf"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8627A1F42;
	Fri,  4 Sep 2026 15:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788528914;
	bh=0icSFSNEnmNMCi/02d7P9wcic8jxWEXn9hAZv9tKbXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rclMmYqfJKnr4q6OtVFtplMX++p7KCYVuwvasxZiY6pRgZ2dLKvy7pGaxZgGmatJN
	 4VpVhv/QmO7ABGEV6cCz8SffW+SjHNYqZCRNsHtnOKa0O7i2BCeKnCzmQiBBhVuIhY
	 bN3fgpTY357nIgNXuzyBnAy+ulETMFutsXTDMEQs=
Date: Fri, 4 Sep 2026 16:36:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: fix repeated words in comments
Message-ID: <20260904133645.GA795906@killaraus.ideasonboard.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
 <20260904113450.15838-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904113450.15838-3-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:04:43PM +0530, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.  Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5

This is not a good use of reviewer time. NAK.

> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/media/i2c/adv7175.c                   | 2 +-
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 2 +-
>  drivers/media/usb/gspca/ov519.c               | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
> index f1caab8e2abd..b6f0e1b24383 100644
> --- a/drivers/media/i2c/adv7175.c
> +++ b/drivers/media/i2c/adv7175.c
> @@ -209,7 +209,7 @@ static int adv7175_s_std_output(struct v4l2_subdev *sd, v4l2_std_id std)
>  		/* This is an attempt to convert
>  		 * SECAM->PAL (typically it does not work
>  		 * due to genlock: when decoder is in SECAM
> -		 * and encoder in in PAL the subcarrier can
> +		 * and encoder in PAL the subcarrier can
>  		 * not be synchronized with horizontal
>  		 * quency) */
>  		adv7175_write_block(sd, init_pal, sizeof(init_pal));
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> index 6430f2ec8b32..8257759421f3 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -649,7 +649,7 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>  	dl->post_cmd = NULL;
>  
>  	/*
> -	 * body0 is reused as as an optimisation as presently every display list
> +	 * body0 is reused as an optimisation as presently every display list
>  	 * has at least one body, thus we reinitialise the entries list.
>  	 */
>  	dl->body0->num_entries = 0;
> diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
> index bffa94e76da5..57219a738c73 100644
> --- a/drivers/media/usb/gspca/ov519.c
> +++ b/drivers/media/usb/gspca/ov519.c
> @@ -13,7 +13,7 @@
>   * Copyright (c) 1999-2006 Mark W. McClelland
>   * Support for OV519, OV8610 Copyright (c) 2003 Joerg Heckenbach
>   * Many improvements by Bret Wallach <bwallac1@san.rr.com>
> - * Color fixes by by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
> + * Color fixes by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
>   * OV7620 fixes by Charl P. Botha <cpbotha@ieee.org>
>   * Changes by Claudio Matsuoka <claudio@conectiva.com>
>   *

-- 
Regards,

Laurent Pinchart
