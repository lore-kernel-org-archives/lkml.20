Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793964844;
	b=AGyFJlI8mh8S4env2xqCcVGY7/nUwCPwRr0BOj/Kh1R+U/9K98nY3KkWFV3YBeUmcOJo
	 AfbcKmNnhmBsLESRk9J/Yk5FeSOOLdAjrH2IjzClqf8cGepwfxmOVmN4G/WHsYxeG642r
	 tqrL4a9piZr9cvWjRy3/irNVmQfAJCDKMuqHLTMFsC/9G1iDYhPofJZ+W/JuB8vw5mNgU
	 xFEZShTyX7NaoluWEx0LGiY2lnZz85l3dD06js8pv6zDx96zZLe5XlJepiietRSgGeuzH
	 aAycBKHTD6eoNOJkVzEXh776bZyBs/5q8MedbtQuI0iZu0UufcRGAKxtJruvxio5cTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
	b=NvIEFzczUltDkXcckYTKcQ/EPvmJoXIJGLxXpdmLihaDf6jAgg4yKn7HvPFNRr3zwtgQ
	 Dy/Q2LmqK3CoYQZhWxq1rzxY8Sn7QZbRxagP3Kns9DXo5cDlDEsmmjpvRhoLTOU+wqDAP
	 jSiYS1o/5m8eYLPQy5sGIzWIHjrhJp1cBJnY70+XUJ6i239Rwm+ggvVgPY4K/andA2M9V
	 hNa20xvMb53/fjA/OLcXXO8IEIebTV5YSD0fqDVf9ZKzS1rVtbNyfWh9ZTiQxjc4Lrqp+
	 nj//iH2ElKu21qr3Q07eC3s78rLjgXX1fM1Yt7NAEFFtfoCrDQBEWaHSOFJAq7WpvRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=rRj1XUD+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336F606D82A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D336F606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=rRj1XUD+
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5430f70c827so5626421cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793964841; cv=none;
        d=google.com; s=arc-20260327;
        b=q6nsaLimA3FWmQzfX7IhVRsxNk4g3EE2G8MFHWtLB1f57q0E8SOPhG/US7qSyeHAzo
         7yCo2EXOmfzLDr1HGgnAeCP0hbfqls58t5Hjam0d4vO2uIk13yEKspE15SMX29cTovLB
         n0Ne3YNCQICx3ZBwoGTtXxIZJYg/r4t3cUifZtkkVbmrqwVrjSg9WscNXlKFA3sjaMem
         wHj+z/zbF3vaZ2bCFQdBCyCK0GIEt4Xf+IoTR/epKn0Ydg3q06Fn+N4w+XZPnhqNm98v
         /2uP77UacFkyt7uA62d7/xGRJel58Uya0iU7B+yUlEvlujOoieuRbkSeDP+0v7zIcUnM
         reew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        fh=ZIeHr24PHCJbJ4Si+4EUogMztw4GAdyNpWAUDjarP/8=;
        b=Iqda6A2YXzs7B9L7nhSqXTZUBUWR87DTVOXQ4YHvNk+nyr5GFZoerFMhHDs+y7gmOl
         Dr+4py7xw1wmNqIj67W0NOogpPl7L7Zv6PD1KnZhjT3ohcPeiAzA0Tp/WCzwYrEWuD+J
         kw9XqBKt1cJCWLo4yeRJrBgNQMYwl/nqp6tbqjXseLMyyi5dW0dfKkjp2GxUnIWyKAUU
         qODBCFBwHLqFIgKjIwIINzNfI6oCx8Rxs5xf6u+mcU/36ws4X5urq5DfojUb+bbuCNa9
         Uzc+oQT3YvhnSmTWGhWU9U5ocGiIyCskOiUd3vLWPy22yp5iWFSNYEabfEdE+nWI2YiY
         W3hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1793964841; x=1794569641; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        b=rRj1XUD+TjJFwXd0EOIFgrt1Smlyx1gkGXjjCZuYABKTgZWWpwFbzrSTOmGZg7AXMi
         FxkXf4cgQ0n21uN2KgG0pTm+KQ9IVC9vRPCdq6Cbf/qFM3fcZ/h1zTIitWlYHwDL2e8b
         MSmMkkoIGDciUxrlCmVt2MQYMAvjsEpceH59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964841; x=1794569641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEmGMlO442/bmobtd8MSxOkmFHXwe6d62JQ5dsryEAY=;
        b=2CJQ/4j/sg62+5oT0yN7/YP6MWepnqSHGavypv5umI2KY3yVXuRSH337cGdfA7UHJc
         04l0KtLmrVETJWvyIIaqoBYFbHIkt/w19d4tbMb7DXHj/IbQVlloxzkrF+XE0Y2aiysA
         2S6Od7B5kzoM3w8YatUUqyrLChQC4MApunolfxqN4m+dHgD7mdnUrBvbpO8/yqOeyemC
         AANIXYJtUaimQygXnmWk87g+TMQZDX+2lhnrAXyIIiRfojOrDd5AfBzE8/U8kwHUHdF3
         M4sx4l1AaJ5W6TF0Lim9BtDyzUfaS9Oq2nEwQGVOo/cnm8umGoV8bpYqN7RqeNC3XW5b
         VcIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpYUv7E9I5vimsDZFMbLbShlwM/yU+amNKyK4iZJmaiP9jQAxoS3YXiTIE+Paias1nqSpgk3/pr5g/UKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YFvEmwvgqyMFkeq4LrYyUk+D2sFaHpLBEQgTymwfdLEqeA6l/
	AFB0bLUkt7X/N6eXXCKopYGteC2blWRAXMvGZFW5EEqmYm+ERGT+Ck6MWI4s4T2wf3xrKV65kZu
	qQyD17AgVv/43bYMlKJTCDQZDLsWwMzL8g+k0bGReYA==
X-Gm-Gg: AYBFou3Oef4o1m+tjoxdLZqYA/+LSBTkl37/hqRxeo4MBmyfKT1mMVnLmcj6Svte4XV
	DsLLbOrVTUwXAYOkxYT3/fLSQ+WqOFB0M+yoYvIUgCGTBqHf7uZKWH4e+NDcYWxijguuCx6dq7o
	nU+zxsbqLKnDB5FUdEQdzX2AxROw4XUtQDdfGlB0ksAwaBAnF9HTl5QDi9QeXWnpVEm24BE2bNJ
	Y6rbAlTPADS840BEhhM7bJSwwRHohD+yLNcvV6FhQSv6ytzODjaqGauNFDCLHMBnIlVJgeGhakh
	aIYfCSJczV+UV8TQaG1c4FxcjtVlAVILU0DftdduPosvYzVEpqnngQCVWoFI7IKwhLI9Rizx4p3
	xmwlMp8eJy8XbMQKQr+1zSwv0x7XEjguQRf4VlnXP8wwFSqZiDFsiilBpeawerpqTcTYAsv4=
X-Received: by 2002:ac8:5dcc:0:b0:536:71f5:5361 with SMTP id
 d75a77b69052e-54e0feea19amr34246971cf.11.1793964841597; Fri, 06 Nov 2026
 03:34:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019125329.17932-1-luis@igalia.com>
In-Reply-To: <20261019125329.17932-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 6 Nov 2026 12:33:50 +0100
X-Gm-Features: AclHuK-A7gQ6M-Qg-M-xE8M7BDOMgO2XZ1t3Ke_Qh_brPD2YLJrfyo7d4Y5WNzw
Message-ID: <CAJfpegsXsZS7CaA-=kAB4_oiyPWeZ8ULpG+kxBNHczM-XHbqng@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix 'inval_wq' parameter setting during module initialisation
To: Luis Henriques <luis@igalia.com>
Cc: mszeredi@redhat.com, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 14:52, Luis Henriques <luis@igalia.com> wrote:

> @@ -62,11 +61,14 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
>
>         *((unsigned int *)kp->arg) = num;
>
> -       if (num && !old)
> -               schedule_delayed_work(&dentry_tree_work,
> -                                     secs_to_jiffies(num));
> -       else if (!num && old)
> -               cancel_delayed_work_sync(&dentry_tree_work);
> +       /* Only start/stop workqueue if we're past module initialisation */
> +       if (!module_is_coming(kp->mod)) {

See sashiko review:

- kp->mod might be NULL which will Oops module_is_coming()

- it's still racy against fuse_dentry_tree_init

My question is: does the inval_wq_set() even need to work before the
module is initialized?  Can't it just return an error and it wouldn't
need to deal with the race.

Thanks,
Miklos
