Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC9386C36
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768935; cv=pass; b=Wk5bKrJE+HwFYewNfNF8iu2+4OjW8XKbTsJNgSS1+0chqAFULjjdFyGB2sXl2VCyN8N64vTNnwkMYenFYxDWc6WvAvdrTMHOdvQC+7sIv9jQAaac+Anx7t1Ah1x1D+IGz91R5IwJ+I8ZQUZsV+a+iLAKKtiqsHmef+PgVQUhz5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768935; c=relaxed/simple;
	bh=MWjvWkkPwyfWYHHELX/PMM9+30Kt6P7OKSDvO5cu+9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dhp471Xf2fIafRv4Yb50ZMX710IINqusbIYxRRmUdZQezmEHmTm0Au4jQiZLe434DX6wvPecOJUhOTq1P0EDil6im9XRWwaCYIMgLDSXVsbz0sqw6T4J+y9GP1z+mLYOfWz8sKCQ1F2XtV4GNKpFCeiV4bz9hnWhmTZtdJOUuIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHusvovj; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHusvovj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so1726228a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768932; cv=none;
        d=google.com; s=arc-20260327;
        b=T5f65GD4kMqVwWZio39QFucrouEiXCL72+j2BR3L4gI6l4sCV3XuXh+ob4W8fN8Lry
         ciI8E0wpLpho09243wBTJQ8Gu8+VeTfWskvwgRtTKbkwJTLF+YNsff8cKReJ7gcU9xKp
         HV86kCTJV7W8RTq1oeTEnlX+VEvfWRelNYBaEUqxAPPRaqVZ4a9Mk+mmwbJuQZFxhhyh
         aGtQPrLyDuG58m1inO1mgi6EZsIoGpQbK/afDMQ0s35iEsKnFC+lbDxl4kMe+kKxoJwh
         n+kIvqi9L93nxRB4w6LvkF6uT53VLhs3GIileY8a+eLH51V4I6eTb9RJxOmhM0b1tr4b
         VepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoR9NEoIErL+2TbnevvINQDuo7n5mgemEQNQFCIh1Ks=;
        fh=6neHV8l+9OO0qvlm1Khxhg9H2sIjEzbGr2oX9gCv9xk=;
        b=g6p+EZ7pMkyimPn7C23ZzbSpWcYoi8Bx3O3X2nYDeWN5ppXz6svH4XxWbmCn1hlQXN
         Tv6GviOi9i9oHJPVRHzK5dUrgA21N4L6yWcJZ+a4ixMcUKm7RZPu5BsOWrVTxAagYKVG
         boWyqyC/2fcrCqZFleiQMf9MTRncX0wYKs3N6KW3y+pbrpicuuLoyeZ78OkA8lbovntA
         mN8a9Lsguzn9k44y09LBNQpmE3dDfv4Pnb1LrXmX5hrWqHZvA9XKoVqoqeH2z5kVtIVu
         IyR5farfm272ELmbccdGzYi40v79650m8JbpdCcRI1kE6sz+Q3j3yeGH9YIj/YhAzV87
         rzyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768932; x=1792373732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoR9NEoIErL+2TbnevvINQDuo7n5mgemEQNQFCIh1Ks=;
        b=jHusvovjX4HaG4nJ5fy8Ph7aZhy1chd3UV+GpLg/A9oSuFGu6/j+tZ+wsmV76kK65C
         +cWLrYXkkgKiYFYlPIH60r9V6hXvWQrGXQX5wyvn7nQUEzAXAPYv+vQzXJbJHTjN+z0X
         UJIJ1ad0jMfY2XUUdtr0LKlwPW2Ed51soNm+52AAjP0erwPWR8lqBxCPJgBfYFjApQ9G
         4VWBrPax4oSCaMFEGCQGDVWBjjdwWm3SrSVSKKRdtUXjxIXZaU0GtLRCtD0/lI2SwxXv
         MHoDFankfVDyPuEgChg+T3cZHRhqijRQ3EgpfxC4QxXj85scxau//aSJkFwQsiUoA4vG
         QJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768932; x=1792373732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoR9NEoIErL+2TbnevvINQDuo7n5mgemEQNQFCIh1Ks=;
        b=bSq37qvIJTKj+oIpY6Su/xO+5bYUhFQLN51BxsOSQMXh5VpIadmHq610kfCMRN5k82
         LP1uN69cPdWBKxUZnixS2iKUnlokkbEv8JKdiJ5VC+nJFbBLiH8gXOw421bhqpGVnif0
         MAD2ViVYkIqM68UgCADqhJ2MfqaZfiOsvzhVs4hY29l5qXTtlZJZEqqDRrXoWMmv8UQ0
         61MJkH7Sz9qTyXYVdwhYiSgATswMdTpLjQDrpIwNfi6bWgAIQ6WkakAVsZ4OnLDn/q7Q
         xfhNuWXLxwt4xNm1C28v+wI9mOeyS0Ns4duXi8MN1LqRoS4oX+B6qgmHIwzO9sJo0/fX
         FeyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz13vkriZQyUrygoBzwgHKXjH+OTGQOXImV9dLndz/oAbYJqcmp+uZc3HF1zH3+8iTADDtT7kayFMKp5Wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqP5omaT+c3Z3W9IhsjvNterjVreQJ+u/a6OonUkwgwkKZ5wCQ
	/PXvmNlded/ygJFfjBAjts4M0ejnT7BFfohLPEySgQ9klkjUhb36kMI2cAZHOg8/t2tqtAyyGKl
	vf4gJDOQPc9HLFUHpR56UIG1fVQCIsDI=
X-Gm-Gg: AYBFou2ylwEIyYLgeNVsHvDql15Hp3b68Ho7bKYVyO8NLCqMJkhkQuo47ZTrURg+E+J
	XDbIWZ/Yb7bKDFn8/KzkAKlBK7UUC9nDh1DMZbNBylFixua6P7qUaGc5XB47BAUAdnrITI2OS7m
	ehmkQBJGu42ZEl7l66FkHx8C6BGCwCcw0tFkP4YPpUGhgcK0yMdMm6dgLdOTVXfBZYtMSjVQwjg
	uoraVQFdZFT0Q15qycVS9SAjhEKR3jYXVmbHxGyvtEeZ4mVvTuOgE8IhYvELi7bDZIP0qTCg/fM
	Piz1LfnAnKPG68TptSTLHV3lG98dHhZAZTqkBm2PI3NRt36k5bUPUjA=
X-Received: by 2002:a05:6402:2b95:b0:6b1:d313:d56e with SMTP id
 4fb4d7f45d1cf-6b1d313db6bmr88532a12.20.1791768932313; Sun, 11 Oct 2026
 18:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904061939.4039320-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260904061939.4039320-1-runyu.xiao@seu.edu.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:35:18 -0500
X-Gm-Features: AclHuK-WVZj6lLru9SXw9PdtwdjgOvOcHc_I6ucLMItGFN5juVc-ly692F7grV8
Message-ID: <CABb+yY3pLJ5nYnbFkZc0Dum7sQ+dztUKBc8UgDaEtnq07syHbA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: altera: shut down RX polling timer on channel teardown
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tien Sung Ang <tiensung.ang@altera.com>, Ley Foon Tan <lftan@altera.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:19=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> w=
rote:
>
> The RX polling callback unconditionally rearms the timer after it
> processes mailbox data.  altera_mbox_shutdown() uses
> timer_delete_sync(), which waits for a running callback but does not
> prevent that callback from rearming the timer after the deletion.
>
> Use timer_shutdown_sync() for the final polling teardown so the timer
> cannot be queued again while the mailbox channel is being released.
> The timer is reinitialized with timer_setup() on a later channel startup,
> so polling mode remains reusable.
>
> Fixes: f62092f6d77d ("mailbox: Add Altera mailbox driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
>
> diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-a=
ltera.c
> index 17278c257..7cb91413e 100644
> --- a/drivers/mailbox/mailbox-altera.c
> +++ b/drivers/mailbox/mailbox-altera.c
> @@ -270,7 +270,7 @@ static void altera_mbox_shutdown(struct mbox_chan *ch=
an)
>                 writel_relaxed(~0, mbox->mbox_base + MAILBOX_INTMASK_REG)=
;
>                 free_irq(mbox->irq, chan);
>         } else if (!mbox->is_sender) {
> -               timer_delete_sync(&mbox->rxpoll_timer);
> +               timer_shutdown_sync(&mbox->rxpoll_timer);
>         }
>  }
>
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi
