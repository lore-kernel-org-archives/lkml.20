Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84C368D65
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791611690; cv=none; b=NF5zg7Ul0Q68rgcVFm79+Tb/rP3LVM7KyIeV9BYMRMImUH7eAOsWiR6a31h41gKcLDwgLAWrZUr0iW3MqCh/hBKmg23dW36toXz+m77dF9ANE0M2dbGGDiYulGzC1E0Y2ejr1QNLpDj598OUPuZa7d6ZOaw1fIb1mTW6D0ZKxB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791611690; c=relaxed/simple;
	bh=GeEEc1StfAFpUbNkQDGIQi1nJjgSiBxGHqYT2yi1JZQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=MtofXuaOjucWnqNLAb8vItq+jcmvl75uU5aAGwHlMXjzfoWY1lvQ7CORTawCjdkX6x7c8IQidE4Dj39Svzl99YGzc0aLW+9NhO/cKXZTqIDakL6K9l5imm1FsJuEXLR8T3Xh9jWd4h5EvEL9NPj56L52ZQgr3QfaPARqON1gn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4f652f9bso472656b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791611688; x=1792216488;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eh81BJlfW0jDoKTY4TtIawg0o3eqIecrBPrkYFRh02U=;
        b=k6A2gfKN0aIwwIAQx+5eH0Bx13AgN38BREuLPaDBX3/5H/xS62sQZZluMl6HVAUOSf
         C3st/8wByNIfbaFpPTOLzHGVYFNTvV2jh7Px8YQ1dj/BJqsGudCKFVGMy0Tc1PqdHHV1
         VspVB9ZJ9zy59MpULkmAvL8doIJrhnbGZvwnBBsc8bKcYvufhbsBLqafSYIXo6GmoceQ
         s5b7lCXC+mmV2Phr54smQ9QWu+rVzNL5hRohu6HwISWt60fF2J+Nx3xn+Lh+j4filO3S
         TBRMwFPL47WBNTLUvZqOT9A/TeT65pL+9cHus0fXhBbUsa6w/r5aVckPck1SzRudMLkn
         DdKg==
X-Forwarded-Encrypted: i=1; AKwUvBwrd6n9y9jrBp4wA5najjQiZwLkX3ICeqESpOhG8DnjzGI3aDTWRvC6FGS7fFGNNKZ/4aHCTeBDsMeMKVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Sz4QwXD8MvzYir/6rf1cINEDL7MT7zfBVfMDSOQhIbhJA/ic
	AblCgcC04A6YdDlZLoJBHlud79Z+loOKyvlwLsRTSgBZ4QoPTrT9ScAKnjKVKuOqI9WLq+ODDFX
	q8/C5aVjtnYcFAx48E/XL06GDYBsUATCbBAd74I91jiUduVZrykz/xyc0rWM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f94:b0:4c3:e93e:e331 with SMTP id
 5614622812f47-50c516e45d8mr3031592b6e.30.1791611687843; Fri, 09 Oct 2026
 22:54:47 -0700 (PDT)
Date: Fri, 09 Oct 2026 22:54:47 -0700
In-Reply-To: <asnOH-qMnurm8RH1@fedora>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac9d327.a150a118.27e199.0026.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_dbg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: seedandsyntax@gmail.com
Cc: seedandsyntax@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: upstream

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

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
