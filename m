Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867113;
	b=FtRLaAZ5LA7UfDazmR7EJhe9lesHpl0a3CJ79X1xrZpgJ1XP5bOrlt6ebJjhZmZrzxTr
	 t8zGnL+oB7xYKSz7jVOybirsTpxHj1rquuUoMUA9+3m+ws9bY20t0yBR5CO+xM6Dr0wV2
	 3bIjqcZlrTwXne1JGdaGYn73L+GyH3ea6OjJkPq4E2Jh4IetOUYC9xyxGvMkROZ2S0Aoh
	 fHK5KZ/1s9VkXMgy0rsiGFfegPiPTqjwJS5dq65q2dArIXTC5aaYhX9G1rdGaRApORfFz
	 ixza2MUyh0/Fyy+0lHYYwcPIs8Uin5parNwh1Gq+GJbZuvUQM9cFiLcq5KaUX6KT3nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
	b=cCjxVc68DsZ6NMT8wMmGCBznBzG7j6XVlH1o7+vSalgErLDa2xx9sMRQ1DmIX/VSO+H0
	 QsEIYJVp8MJ+lbtet0m44XSVNAmVLvSrZS9grH1ys00x6KT3IubHAMgFDQu6mfjwua4iC
	 h4ih8lUc73mhAiQU/fsFx2VB1lHzIJRb55iJVrhz4eDPkTNtxd0i06pKl8W50H4s501e8
	 wV5GzVQCfznf6zgy9PmKjCUGbdhEo1TZ5sOr3WorKJnLKo6UneeUkfNZou28tvnuMUL7C
	 RY4h512MgH2GkPPJpFy7Riqqu8QwOi//r2kYb7npxodf11/m/G/u8HDnkg819eJ/6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqGAMV0I;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqGAMV0I
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so6382438a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794867112; x=1795471912; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
        b=lqGAMV0I50rZFiPx27w7QnxS6xlytaJwIzGMrdQhAk0fYIkPLxw/dmrWf5ALxxMVGb
         yT9RRzV4JSYR8q4I4q0wcWV6Q/JpdvtIEHKxvB7Y6mty7jNqWfVaszchw3OUJ5+ibi11
         cjM1FStPHuZO50pPVsq2DL1yVeB6jMTJFyiRKebGMcgebTvrdAnBvQm5wlvD63glsyIh
         3iuNbu4lPunRuxr75CfCanfRrd8MCbrl+ftFpR7eYZnHDdeEYUz0x4FBz4XZA4WxQ4sP
         yEWIp9a1QbCHPNtggkgHX9DcTpDM+SseGBCDntWYlHKKJjtPzf/7+rdzCElb1IP9OodK
         EhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867112; x=1795471912;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
        b=j3//NCGixyq9P46Eaj0lKyafiQ9m5UgooA5Z9zP7zJbVw31mwy5lRh7/cV5mSU27tZ
         qUUwdiGejoCdIOb+3VJ4wER/pEe7Q0lyR9Z9vnIJgFcy58lyMFCLt3kGyDraVuVQv5hY
         GZFUCCri0pLCAzmWQqSC2uJtT2bfdHq3iqqtfUfozt/5iL4K+ramQokpIQg5dyZ7OH8q
         1sto1nn7QEc5tXMcxiSQtCO6b1j78h11/rh/YNon+nV7GdPaIbSmSE9cu14FsaFjFZ4M
         L47W4OoKv/fRKIomwdeVQ43ZMj6lm1CyKQP9yNlZ29cp+l32kJdTOz5q86Oq6uBo0REL
         IpqA==
X-Forwarded-Encrypted: i=1; AL+hErHICIkPeC0xwtgLZkFSSjdf5lvDx2YQ/EuhOX63LDj07OlRBj3S7oLRCehUPlPUlxtYLR/fPn8kfqHjW70=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wKWmh53avrC1lDBgsYMrLJ9bG29YMSpb2aDqCUu6WIMHXwLD6
	UdEF2bQ0R/coPfZkiEUv2eiA1IOfjgRaGi7n00fvlAOkf7V6byYtT5q3WxtzCd7MGkQrEAcjTct
	ui4hQqEnOug==
X-Received: from pljc7.prod.google.com ([2002:a17:903:3b87:b0:2e5:712c:5c7])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5608:b0:3ac:c024:b275
 with SMTP id 98e67ed59e1d1-3b1b089e262mr11929294a91.9.1794867111923; Mon, 16
 Nov 2026 14:11:51 -0800 (PST)
Date: Mon, 16 Nov 2026 22:11:47 +0000
In-Reply-To: <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com> <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
X-Mailer: b4 0.17-dev
Message-ID: <179486710796.2938203.16103592872804674838.b4-review@b4>
Subject: Re: [PATCH v3 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
From: Neill Kapron <nkapron@google.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: nkapron@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> The second copy_from_user() in f_hidg_get_report() is called while
> holding hidg->get_report_spinlock with interrupts disabled.  If the
> user page backing the ioctl buffer is not resident, copy_from_user()
> takes a page fault and sleeps, which is not allowed with a spinlock
> held: it triggers might_sleep() warnings with
> CONFIG_DEBUG_ATOMIC_SLEEP and can deadlock the scheduler on other
> CPUs spinning on the lock.
> 
> The first copy_from_user() into the freshly allocated entry is
> already done before the spinlock is taken; only the "report already
> exists, update it" branch still copies inside the critical section.
> 
> Since the data has already been fully copied into entry->report_data
> before taking the lock, updating an existing report only needs a
> plain assignment between two kernel-memory objects, which is safe
> inside the spinlock.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..b778eb633b79 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -654,6 +654,11 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  	if (!entry)
>  		return -ENOMEM;
>  
> +	/*
> +	 * Copy the report from userspace into the entry before taking the
> +	 * spinlock: copy_from_user() may sleep, so it must not be called
> +	 * with the spinlock held (and interrupts disabled).
> +	 */
>  	if (copy_from_user(&entry->report_data, buffer,
>  				sizeof(struct usb_hidg_report))) {
>  		ERROR(cdev, "copy_from_user error\n");
> @@ -668,13 +673,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  
>  	if (ptr) {
>  		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */

Thanks for the patch, however it duplicate's Yu Zhang's previously
reviewed patch in [1].

[1] https://lore.kernel.org/all/20261020051446.92179-1-yuz08559@gmail.com/

-- 
Neill Kapron <nkapron@google.com>
