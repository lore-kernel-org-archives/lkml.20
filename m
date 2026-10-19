Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E94A8FD8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401438; cv=none; b=BNCTzeiUxaJrX8CWCgiFbKRa4GeYNq0GA9M+d41uoWSREWw0mV18tRf5I7KwzBVooU2PGLfaJJ4upI1gGsTmZ87DuDFNZ2CLOl8bNSi722574iWc72z+g2N4i3YChpQmgCcvzv6zySVni0jPRSviQFqPHGgqpXh1ftNKt7JpiBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401438; c=relaxed/simple;
	bh=JGCN14DSdkaYDz0L1wUcX1YfgAZpVl0MxngkUJepzpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+LFnx8XgE7Po0r2w2EKcFfID9Gw0gj1l8GXHiYpzCU5FPO6NfMPIZKyJXQ5r0+nscLsGd386tOtGfGn6UuJQud/Rjl4GkYHpVBNtLsvfQknRf8QT+zRA60DtG2xdTFNg7QlzbnGc3hHIPIvcZs5J4WXoKM2Ez5slSs+rTllPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chNaX8GQ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chNaX8GQ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3923161eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792401436; x=1793006236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GGRHuFuy9q3u8gF9aGqTkLAN78SoDlwfASLSUJHutQ=;
        b=chNaX8GQTPvGnyuBjZO5W02xJoXRzGKvEXoNwmP9VTdh6jwdrG67iGwflPaXDdy1z5
         +iE7Xr1+XeNTzwgU+964/9G+UYvoz53n/buxnlXtAL3p77HbiGvbtdOJkZXaCdA0IL9i
         26F98+Pe/zBoaihQ9jXTIDvCnQ6DhkQfxtyJQhzGJzgdiOMUoyXJnMGX1GmQ9LuEB3uQ
         WHYPHZoP+tp0YRTP/oDYf5hxed8Qur+OcUVCW5HiRJb8pH2E73YphQIWAn+qWxdHrxBi
         ZUC2mvi+zhndO4gYNKOfu2UOMeoWyp/VTcLtbsil/5UQvEdwl2KVDcIejt/g/7PMjQXh
         TzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401436; x=1793006236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GGRHuFuy9q3u8gF9aGqTkLAN78SoDlwfASLSUJHutQ=;
        b=JYWtvD235RaKnytRX953/jq9y/hdF/8anzuQ4wNEi36XAmowrrwa3LcUFMqfnWOszX
         Tn8RMJgrkNSSk6dJrZNM3Nk6ba7pAuS/M6gnrWaqV66gR9Kh101tOE2xV8NfYBLWW3JJ
         MgY+Z2GkwaEPjZQjs4ldiEO3cz+gZF9Yd67r9+UBgH4fAXhN4NlUYqfKXKxo+hf1UkUu
         kiMRjt8WwePx4IctoUeQThZHTv5TaZrYRhd70GniviDwkD5MczeIsW2eh4MfRN1R2bXv
         kCoNE5HHGyeGFKjqrTnV7vI4t9Irp68DHNGm61eM4qG+OM/g3dlY+RATYyVgLhjnQfsL
         z22Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdaBy8zJcWo32EowY+NxPmombHr/juymUONqkPK0N/4O8S3OEDO+GTsbb5I2RyOH/PfcmdW/NcSLG3tXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcG+XdldiZ2FvAVJ4gOIIqfFg2MBlmQUaXkitTTRK98xMHnJm9
	X4G2I1m/iU6spBfdpNEb13wMUQRozNUVplXg290HzFkE6+5lNTW1jMnQ
X-Gm-Gg: AYBFou3YEMX2ykuI5o4c/EXhagpXQ/A9sp4OIg8B1jCJ3kcqJcacQmatQ6HYXHDwYEt
	b5rl9HKxGW6DQaG95vcWWXfNTHX3cAyCxLKUF7nwPNpuRynPkjvMGP0JSwH7umXAQuLPoblwwlA
	LZ5IQideFabDC3qc5cDxSY4rAbm82udW/Za413CWoKUcxhnzWeE+ujHMkiiJxFayTx2IeYLgVnl
	vwAGxIDma22wNj1vJQ506DRrqtsw3SVtIsAUyr7nWkJ1EqIJvRMP5GDXg+ifCG/wAWHbYmkE3PH
	+J+OweW7QEo/M9lqA9AH/HhSxBOgJnbB6VnQcdedLxAi8/OtOVuyTk0/dDk3OL8C4myLV/6ltT7
	5DwimGl4FZweiNfpMukEkZ4vISQT61hMOK3rcOccBIKn6P1XaE58vqWiILY9KUU6eBYwEemtizB
	iEZiAI5evrul1TkSah8HZ16orVSfuXPmQbjFF3VFt0PSOICpk9NgLMGmF47+gkj4mV9JBPtBPxY
	6mhVOmrNrzL1u5w
X-Received: by 2002:a05:7300:a9c:b0:353:5908:36fc with SMTP id 5a478bee46e88-361a1b517e8mr10639911eec.17.1792401436187;
        Mon, 19 Oct 2026 02:17:16 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:3246:597c:c4cc:181c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ea7e5csm29714408eec.15.2026.10.19.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:17:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:52 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, elder@kernel.org,
	dtwlin@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v5] staging: greybus: use %pe in error messages
Message-ID: <atXgBFNsXG6w30EQ@user>
References: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
 <atXDvg_u1hQAZiYX@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXDvg_u1hQAZiYX@hovoldconsulting.com>

On Mon, Oct 19, 2026 at 09:16:14AM +0200, Johan Hovold wrote:
> On Sun, Oct 18, 2026 at 02:19:25PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Use %pe to print the error pointer directly and display its
> > error name.
> > 
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > ---
> > v5:
> > - Drop arche-apb-ctrl.c and arche-platform.c changes because the
> >   files were removed.
> > - keep only the uart.c change, as the fw-core.c changes are already
> >   present in staging/staging-next.
> 
> The commit summary (Subject) is a bit misleading now.
> 
> > diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> > index d47f00751e7a..74c9898c0eed 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -956,7 +956,7 @@ static int gb_tty_init(void)
> >  	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
> >  					 TTY_DRIVER_DYNAMIC_DEV);
> >  	if (IS_ERR(gb_tty_driver)) {
> > -		pr_err("Can not allocate tty driver\n");
> > +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
> 
> There's really no need to print the errno here as it will always be
> -ENOMEM if we ever hit it. You could even remove the error message
> completely.

Since the error message is no longer needed, I will remove it in a separate
patch rather than in this revision.

Thanks,
Pavan

> 
> >  		retval = PTR_ERR(gb_tty_driver);
> >  		goto fail_unregister_dev;
> >  	}
> 
> Johan
