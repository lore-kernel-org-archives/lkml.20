Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846553E4C96
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277433; cv=none; b=kaBIocFHxuJz/t7GdMKnWl+tX8o92dJD4Cm4tMHJs/xfwhmhQ8bfAOtRD8Qh8u2yJGkCaJNUN0q2GQHtdSsoBFt72uMCUKo6hKh0OmIwwYbxm2IyVkEK89eEFRhT5Ebfb17UjwCBMbw3rtRSSs+QuOlok9+uvewB11K5Fc8SJ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277433; c=relaxed/simple;
	bh=Do+SToxO4bBqq16MzgfCnw8c86idIxeG43rUvJtatlc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=abl3T3r5EneHQMJciPU6R8Uehm2jscwGPk7IDhXWdVKIrgukYkS/q4Pki40HTvuOqysX9wKvbmFxKFQqZEZW213R8iy8LGsYc6PP+i5C78Qb/ayXFHJ9lkE3b/60pNPybv1goYUhMM167Qs4rjIwlXAFkehhNSliLtZ2I9v09Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47b7f5b898aso187267fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277430; x=1790882230;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u6Zo2YjzBYgo48wThZ8L5cZxgCoFZKsPtxAFNP9PHaw=;
        b=x1jqi+1zHRXOTvZ4Mmgz1Tey6TiRTH5KO4K6crliNSDwX/TsouoVeoPTrxmvcbug6O
         kvWF889ZTWhfV4paXZ116fWlx0txP3fhQdR4lQO9rQxVnCzLXfE4XT/Z5mQhLZMjkJTx
         bD+jifGbzCHXLblyq0FHHgy1w8mwQY00JPCKvgMVPzkLVkUKnocPViBDtP2X6oyirZm3
         bZIdouNAfrLWjaB+02hYFxecmZda4FuChc8bBziAkjEh4KvxKuyiKUCM1eJDIvFoalr+
         xSfSIoedF/0i/+qMCiQys6xT1lHYOLuiKBAk7a1zUWOiMOP2uFFRCT7o9Z2Qrwey7QI2
         PBHg==
X-Forwarded-Encrypted: i=1; AKwUvBzbYVbfFjdEFOMnA8dUDa4u59r5BvCuZmf4Rk9Urq/E3wlJ9xcCR4elHuGRPmPaMk+OyRHUHlQBPltzW1k=@vger.kernel.org
X-Gm-Message-State: AFuF++kHQtpHiMBxoNCv0nCa4L5l2DuFD86UjGU2cur7oiZUIJBjPYOh
	9q52PQ5wp1Pb8zYHO0TeFAT4EufSs72sEO/PJrOk919+1F062eILu/kSUts/Vv1i/cnVB4y//Rp
	Mtg3JVc3AKRmgYB2KzZKKimXD1CAjLUs0oKzG7mCPE+tY8GAwwgUvavqAy3Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a6:b0:4b9:a88b:8895 with SMTP id
 5614622812f47-4d72c738d4fmr4507322b6e.43.1790277430411; Thu, 24 Sep 2026
 12:17:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:17:10 -0700
In-Reply-To: <CAG21Q81aiFDj+UDw2LMipYvvJFh=mRVVE4bDEgEo3FXfR1nTfg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab57736.80e1c6cc.1e8e5f.0015.GAE@google.com>
Subject: Re: test fix
From: syzbot <syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com>
To: igorpetindev@gmail.com
Cc: igorpetindev@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

This crash does not have a reproducer. I cannot test it.

> master
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 95774b0f1484..030735da6b8c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -3210,8 +3210,15 @@ static void serial_core_remove_one_port(struct
> uart_driver *drv,
>   /*
>   * If the port is used as a console, unregister it
>   */
> - if (uart_console(uport))
> + if (uart_console(uport)) {
>   unregister_console(uport->cons);
> + port->console = false;
> + }
> +
> + guard(mutex)(&port->mutex);
> +
> + if (tty_port_initialized(port))
> + uart_shutdown(NULL, state);
>
>   /*
>   * Free the port IO and memory resources, if any.
> @@ -3227,7 +3234,6 @@ static void serial_core_remove_one_port(struct
> uart_driver *drv,
>   uport->type = PORT_UNKNOWN;
>   uport->port_dev = NULL;
>
> - guard(mutex)(&port->mutex);
>   WARN_ON(atomic_dec_return(&state->refcount) < 0);
>   wait_event(state->remove_wait, !atomic_read(&state->refcount));
>   state->uart_port = NULL;
