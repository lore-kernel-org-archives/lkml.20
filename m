Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207404;
	b=g/v61/baf/8/oAF//7TqGfWuudljwGvAq7BIei5NdQkrEUbQa0WXCAGISpBKK0DgaFmp
	 uHFhy2zqiEZPm+Ggt0tQ96gFIxrvJm+zLffX11UddXpHzte/6XKLY+d57r1CUc5/Oqzhx
	 TBQol0yD7HF0RautjMVER+LQI5LZf6teInQryaVgzAYd2hZoLivTFQq5JM+inAsfP6Fcf
	 X4/WEzW86jXL2NIbIr5yUKwdfRNMf1JzCEeUlkz0NodQrJFc16Ordgzbd5mlCAR3f4sCA
	 nISSjmvHlVFHXZAyht2mN0pBBolycx0rhzWOwFFRIhFwVQEvkR8jSn1XbGRLxQmGadw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SzNNzVDXWgiSV1/YGhcZlrCyI10PMQDXKdaQ8ngsDPE=;
	b=KNmLtEtjzZqRgWqNWaFy3ofjp3n+JspoJbKZT+zTgOhAbKR9FMHbYikskO0SdPCvdb8b
	 +K5x5l33uW9Rosu0oMm3jUlq3l0tZXQ1apk2kyFKYdH3yski3tDzSRbm0TFSsBSCayycS
	 ABhMWIZZpnYwAc/P/LioDtLCCECSkcwW24WLlveGH2fvjT1OGT7d9kYB0OdrN9pamncfW
	 ESwSRh41Lw4CBSu4BSZGVDlD+Av2ZeIRv4Scsi2SWxWfuGpFhTbrjf+Dbq8AnnDdTrrdt
	 E2e00hwS4hRpg84fH0JYARci949FmcO79LgybIocwGms9i84QV+fapd1srTGqdjUXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2+CUOiK;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FA606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2+CUOiK
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so1746815eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207403; x=1793812203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzNNzVDXWgiSV1/YGhcZlrCyI10PMQDXKdaQ8ngsDPE=;
        b=Y2+CUOiK+rdCHsUnimafxxE1iYgLSjGd7A0Bzh16RaF+HJWB7N+oQ1579sakDOI8A9
         RA0RA0HmXAK5PFAp721QH8n7yyLReE9WgWZwNEloKPS016ZZ9zqDgQHhVWp0Ow8WdCIJ
         bKandakugFBx4lNGYX96JfJaXdm/2MLToFJ1I3GCTY7MuPySCg9WXFbuYYsPRuxVMxdb
         nfnFMy5ErGAyAIGG4s6VQUk4pb3Z9VagqaGYuANDVPH/KJ95uAjn0kv6TMdCv5oVl1fm
         2LHV9/I5uAESzr7/HfnyiNJcfUfWWLWfJfKQWM94GoPzh+rtCOWeDAq6eSdFu9Tg7cqp
         eJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207403; x=1793812203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzNNzVDXWgiSV1/YGhcZlrCyI10PMQDXKdaQ8ngsDPE=;
        b=W5Oa4ErfTF6AlHd2oBE8p/LvpbbJGi5An5VcTmrFiQSy+DGfkAraKE/696NSai8pXt
         IGDtuRiM/po2JWqm3eLOShIlhPKBsRWi6Ooenz5SYiLqiaeVWDEkkbTjW1pBQXBHlSxp
         r2pt2CmyAf482zS2QyswdKoX6MjlDI0h6y9IlOqKckeBaGVCw1XpAOT937Bi0NbXw0sI
         2AQz25R2m7IGyqYBu/iK9oDRnOULUL1LcznHPFuLjZtMiFoGmgcqOUyiV7ilKB9cQaD9
         bRMLhx5wOzaWocE6h3RbjQfJLemJmbSek83Kr4AlDJ54Kp9cQpjhiJ1KIi03zkKWOGaF
         hC+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3c18jCthFgPwxBzTfmM6T3FrE1umQB7tu9uAuwS6ipYMIIIqfPplEBt0BWQ4/xXWGJcuvu1Cx/YwQMvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF9mgYitV+QWN+jUU0sFs5PfbMoxhmDSBW9nbJWn1emXuNudRP
	IY4rTmSSw3PiAGM+Vv6P1/WNQUHVm16zEGivlCSAyqlkmizdvI4W7vin
X-Gm-Gg: AYBFou2kog/t7EiqB9xsjxJHKVpMmrjV+ep0e+V/0U3/Qkp00WGZWTjEUjRMWfSRdG7
	h571aA6c0rHt8VqR71OX6Snj8NVBpueW5sq9DGjXDrvZkzhcJPNeCP8VWX+eVDUuHfNJtJhgrtG
	bR3bMTn3uslsbASAUR4Z+xhCiW3xogyCeacYRStRP020DTob2DMiOrxI7hQ7XPx9jU5nqI/M+50
	yev0afJFRpjlSEeNcjdn4WQp/wS9qYJKFUKxYMcvYruHa953+QTtc0C+EeKn7hVPZWE/30kwXA+
	i2/HpUYczD4iogTF/6i0eQnsRfnuWvUqrtFzF3bDbmAtB2dunCSA0vT+lUSCcYqTpoK62OWXsDz
	DJN15cPG39ZMXjT80oVp7B+J1oO+4111Mjzv0UiE59M2AI6VQahO3LqvwBPUjPeL7evpq9ILEdJ
	wb81qi3Ae24AZ7JLGYODgBe1HxNlKaL4wcJ9kH43JUBuhWHD5CHt4w4L5L6b5UicqMdHAKNDxNb
	4ZTTO/0kVg2fKq5bsU9MVzabAPnuATvON6QP24tpijEc54+1aDRIbcI5der7pk++WzB4s1Bg4bw
	9x8w0YfCFDtCdHfs/svs9ZVuuRDuN/B4U780HeCWjLW8dH8BASBWENCblOp4ZneWCdBYlSo=
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr4718660eec.36.1793207402170;
        Wed, 28 Oct 2026 10:10:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm12474280eec.23.2026.10.28.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:10:01 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:09:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: serport - defer write wakeups to a worker
Message-ID: <auIsPu4hA0f1SpRX@google.com>
References: <20261028-submit-serport-write-wakeup-v1-v2-1-c05d96259985@gmail.com>
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
In-Reply-To: <20261028-submit-serport-write-wakeup-v1-v2-1-c05d96259985@gmail.com>

Hi James,

On Wed, Oct 28, 2026 at 01:14:19AM -0600, James Hilliard wrote:
> @@ -54,6 +56,11 @@ static int serport_serio_open(struct serio *serio)
>  	guard(spinlock_irqsave)(&serport->lock);

I changed this to scoped_guard() and applied.

>  	set_bit(SERPORT_ACTIVE, &serport->flags);
>  
> +	if (serio->drv->write_wakeup) {
> +		enable_work(&serport->write_wakeup);
> +		set_bit(TTY_DO_WRITE_WAKEUP, &serport->tty->flags);
> +	}
> +
>  	return 0;
>  }

Thanks.

-- 
Dmitry
