Received: from smtpo75.interia.pl (smtpo75.interia.pl [217.74.67.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109043230F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.67.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790333; cv=none; b=s9DQWp7iFtFY45evO/AcWa6GTF9wHTsA1Y8F6x7sNORhLLaXzaC43gafa223+ocBwa6HAweUD0g1+63h6j2UTV9PcnR8idxKUlpeWckExuhQF+lJtGFoP0ucBaH8nv4VNZoR6pGzbuunWN3oiuVKffFMyz5DmJqAwcomD7SDT+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790333; c=relaxed/simple;
	bh=nefdXpyTjpgAvnb5sYYxsz/H3+G6J8C5YdjJn6IFld8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1aons5/3WxNowOp/SEYuga6BaLEJnvHgLYr6QMm/ap3luokZyzVszo9XvqRE36yXk8imjTT0nNBRK8vQIJkNeTsvVbEBy0kPZydNEfLR6pnMexfLzQ67Sp3eI2IF/ZXGxBkE2UwcxLE1CWJDbEuLF71InvMY3d9ukT6dYaPHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm; spf=pass smtp.mailfrom=poczta.fm; dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b=o4ZE3/0s; arc=none smtp.client-ip=217.74.67.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b="o4ZE3/0s"
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Mon, 12 Oct 2026 09:30:27 +0200 (CEST)
Date: Mon, 12 Oct 2026 09:30:24 +0200
From: Slawomir Stepien <sst@poczta.fm>
To: Mirza Ishan Beg <seedandsyntax@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: dvb-core: fix OOB read in
 dtv_property_process_get()
Message-ID: <asyMkMz-T1LvvrFi@nr200>
References: <20261009142303.166373-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009142303.166373-1-seedandsyntax@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1791790229; bh=OwsW1spIcVxZgAlzlVYhVWpbAMGWXja9Bxwr2TdjnAU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=o4ZE3/0sj9UOzP5d0EM5Aukeq+epTK7fTbzbGi8F1b6iStX7bDlvHK+wrS6nQEStT
	 5N6KCEqPR/wvb7AC9+pyi0A6LPylmSGiLRId0HYn79fLh4tcTZAw99sNOQctQDluYR
	 K67OVInu9Bl9TgJa7X7UnDsSUkJRfNNxrMw5OBqY=

Hi

On paź 09, 2026 19:53, Mirza Ishan Beg wrote:
> dtv_property_process_get() switches on 'tvp->cmd' and, in each case,
> writes a different member of the union 'u' in struct dtv_property.
> 'u.data' carries the scalar commands, while u.st carries the
> 'DTV_STAT_*' commands, and u.buffer only DTV_ENUM_DELSYS.
> 
> After the switch, a single shared dev_dbg() reads 'u.buffer.len'
> and 'u.buffer.data' via %*ph, regardless of which member the case
> wrote.
> 
> struct 'dtv_property' is 76 bytes and union 'u' begins at offset 16:
> 
>     u.data      : 4 bytes at 16
>     u.st        : 37 bytes at 16
>     u.buffer    : 56 bytes at 16 ('data[32]' at 16-47, 'len' at 48-51)
> 
> For commands that only write 'u.data', 'u.buffer.len' is never set by
> the kernel and keeps whatever userspace supplied to FE_GET_PROPERTY,
> because dvb_get_property() copies the array in with
> memdup_array_user() and does not clear the union. A large value (the
> reproducer uses 1163001896) makes vsprintf() emit "field width ...
> out of range" and hex_string() clamp the length to 64 bytes. The
> read starts at 'u.buffer.data', offset 16, so 64 bytes reach offset 80
> and KASAN reports a slab-out-of-bounds read past the 76-byte object.
> 
> The DTV_STAT_* cases hit the same shared print. 'u.buffer.len' overlaps
> 'u.st.stat[3].uvalue', so the debug output is meaningless even when the
> read stays in bounds. The same applies to the clamp added by
> 60f0618d157b, which writes to 'u.buffer.len' and therefore into the
> just-written stats payload.
> 
> Fix by storing the point of writing which union member each case
> populated, and by branching the final dev_dbg() on that stored point.
> Add a local enum 'dtv_get_shape' with values 'SHAPE_DATA', 'SHAPE_ST'
> and 'SHAPE_BUFFER', initialised to 'SHAPE_DATA' and set in the
> 'DTV_ENUM_DELSYS' and 'DTV_STAT_*' cases. The final print then reads only
> the member the case actually wrote, and every branch stays inside the
> 76-byte object. The clamp and the now-unused 'len' variable are removed.
> 
> Fixes: 60f0618d157b ("media: dvb-core: frontend: make GET/SET safer")
> Suggested-by: Slawomir Stepien <sst@poczta.fm>
> Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
> Link: https://lore.kernel.org/all/2a5ea27d-445e-4ffe-9447-9d7bfccd4a36@mail.kernel.org/
> Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>

Tested-by: Slawomir Stepien <sst@poczta.fm>
Reviewed-by: Slawomir Stepien <sst@poczta.fm>

Thanks for adding me! I think this patch is better than the v2 generated by syzkaller.

> ---
>  drivers/media/dvb-core/dvb_frontend.c | 73 ++++++++++++++-------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index 0286da57f..f4b599a1a 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -1342,13 +1342,19 @@ static int dtv_get_frontend(struct dvb_frontend *fe,
>  static int dvb_frontend_handle_ioctl(struct file *file,
>  				     unsigned int cmd, void *parg);
>  
> +enum dtv_get_shape {
> +	SHAPE_DATA,
> +	SHAPE_ST,
> +	SHAPE_BUFFER,
> +};
> +
>  static int dtv_property_process_get(struct dvb_frontend *fe,
>  				    const struct dtv_frontend_properties *c,
>  				    struct dtv_property *tvp,
>  				    struct file *file)
>  {
> +	enum dtv_get_shape shape = SHAPE_DATA;
>  	int ncaps;
> -	unsigned int len = 1;
>  
>  	switch (tvp->cmd) {
>  	case DTV_ENUM_DELSYS:
> @@ -1358,7 +1364,7 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
>  			ncaps++;
>  		}
>  		tvp->u.buffer.len = ncaps;
> -		len = ncaps;
> +		shape = SHAPE_BUFFER;
>  		break;
>  	case DTV_FREQUENCY:
>  		tvp->u.data = c->frequency;
> @@ -1536,51 +1542,35 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
>  	/* Fill quality measures */
>  	case DTV_STAT_SIGNAL_STRENGTH:
>  		tvp->u.st = c->strength;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_CNR:
>  		tvp->u.st = c->cnr;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_PRE_ERROR_BIT_COUNT:
>  		tvp->u.st = c->pre_bit_error;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_PRE_TOTAL_BIT_COUNT:
>  		tvp->u.st = c->pre_bit_count;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_POST_ERROR_BIT_COUNT:
>  		tvp->u.st = c->post_bit_error;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_POST_TOTAL_BIT_COUNT:
>  		tvp->u.st = c->post_bit_count;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_ERROR_BLOCK_COUNT:
>  		tvp->u.st = c->block_error;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	case DTV_STAT_TOTAL_BLOCK_COUNT:
>  		tvp->u.st = c->block_count;
> -		if (tvp->u.buffer.len > MAX_DTV_STATS * sizeof(u32))
> -			tvp->u.buffer.len = MAX_DTV_STATS * sizeof(u32);
> -		len = tvp->u.buffer.len;
> +		shape = SHAPE_ST;
>  		break;
>  	default:
>  		dev_dbg(fe->dvb->device,
> @@ -1588,15 +1578,28 @@ static int dtv_property_process_get(struct dvb_frontend *fe,
>  			__func__, tvp->cmd);
>  		return -EINVAL;
>  	}
> -
> -	if (len < 1)
> -		len = 1;
> -
> -	dev_dbg(fe->dvb->device,
> -		"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
> -		__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
> -		tvp->u.buffer.len, tvp->u.buffer.len, tvp->u.buffer.data);
> -
> +	switch (shape) {
> +	case SHAPE_BUFFER:
> +		dev_dbg(fe->dvb->device,
> +			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
> +			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
> +			tvp->u.buffer.len, tvp->u.buffer.len,
> +			tvp->u.buffer.data);
> +		break;
> +	case SHAPE_ST:
> +		dev_dbg(fe->dvb->device,
> +			"%s: GET cmd 0x%08x (%s) len %d: %*ph\n",
> +			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
> +			tvp->u.st.len, (int)sizeof(tvp->u.st),
> +			&tvp->u.st);
> +		break;
> +	case SHAPE_DATA:
> +		dev_dbg(fe->dvb->device,
> +			"%s: GET cmd 0x%08x (%s) = 0x%08x\n",
> +			__func__, tvp->cmd, dtv_cmd_name(tvp->cmd),
> +			tvp->u.data);
> +		break;
> +	}
>  	return 0;
>  }
>  

-- 
Slawomir Stepien
