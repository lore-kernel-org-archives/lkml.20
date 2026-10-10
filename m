Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193A353A77
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612275; cv=none; b=gANLdVafzYZlnXpOxON5q9jkfTq+p9h1GK26bmjXuaS/DE/jg84AUru2KmrAYVcuDXrFjAjPkpn6GS7bPy1SmA66LiPcOrGErk7qqAfy7eJE2CKWiRnDzp9E+kEpM/GnPWv24HmyacO/kFki1C47o0N7ScSq+pkWjOrY5dCPamU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612275; c=relaxed/simple;
	bh=s3WjJB5DjAWV4Zy2dhGxEfXx1Yik9KKeXo7z4nrcQm4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=V3QRdYXia8CZFSrfA+v+pzw+w1Hvt5XR5RI1lLfJK0ecd4LT1Ip+KXIO4YVxR800jK1xCN7/koSH++7UDDclYp5BUHx6Df8hPXCyoyFMNm4KV0OswTMsFEggfNPNh8X6kgnF1/g4hHoALivfeC+HhtAuED3XvucWMqf36QLBoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso935199b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612273; x=1792217073;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPTpKFmPPige6wlKox3s9hz3BFSq6k2o3cz35j5UlAo=;
        b=O62y9ArVTOYxV7TUyyvE+MBOaNdjx1k6F9+rczC7YmkMjecIhSh/ITy3rWepqx6xln
         1W9r12r71FMOyFLMsA4j7nW/Kn5KHLmf5x+djW3syY6phPxt1g3mH7GmNflSkVW7hCka
         PqDiUgNbVKlo7w/oiTmt2UCBQMbai7LxhekYk+9hI4iRZXY3C28E99DFuttDbHb4Lsfo
         nSIftzgpY+tGpfal1n9zqSZ4W5rr6M0C6b9yywu5Zt4/GUrSJGmAaQ/A7sBjz+Kg3TJS
         W0V+Oq4ZpEI3TiFEt9jd5jsbpDS/xvfTud+IgTedrY8UomTQE6M6MB2gwti9E6DKWmnf
         5piA==
X-Forwarded-Encrypted: i=1; AKwUvByDAMmmrPxp4zwQ44+I8DbJj0NTeowrOqI3XvvsBuQW0B1lqljosx+0Ff/xL7OdCKefAqvH+TNVn9c02yA=@vger.kernel.org
X-Gm-Message-State: AFq9FYItuAVRz3hObfvj+7rK83FnxW/cckoyf2TWGXiZIGQIW315UwcN
	TUlo9hzPBi4kZS1m0iWU3jVknhYDMVAXzPIAKXkRUYr45jQnB7uO0ehLpq0rJx5lCVsB+3HBws4
	MX10uqr91Fx6YVf8tGmu67VHo/6WG0Kmg7ma2Qs4PboJuST4Xv4l9WQOHTBE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2221:b0:4d6:9133:cfe0 with SMTP id
 5614622812f47-50b6609f24fmr3021486b6e.37.1791612272894; Fri, 09 Oct 2026
 23:04:32 -0700 (PDT)
Date: Fri, 09 Oct 2026 23:04:32 -0700
In-Reply-To: <asnUffnt_gdJ59XH@fedora>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac9d570.8cdf6287.1eb53.0076.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_dbg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: seedandsyntax@gmail.com
Cc: seedandsyntax@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

>
>
> From 77bcfa549c94b68a2d3c78ac175b03650efbe31a Mon Sep 17 00:00:00 2001
> From: Mirza Ishan Beg <seedandsyntax@gmail.com>
> Date: Fri, 9 Oct 2026 19:16:10 +0530
> Subject: [PATCH] media: dvb-core: fix OOB read in dtv_property_process_get()
>
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
> -- 
> 2.56.0
>
