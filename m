Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1F396D1C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117085; cv=pass; b=HyZUfxLdKDA6aM+8BKMcwVlA+xySZYuOFCAuCchWuGgcHL12pxb0xuvC6OPIPkPn2PoZHXyddpOCq4guwzVG/bgtSOnq9ZGvZTkAB8wo3k8lXn/wxrMcdLiPxYmN1qyhCEyet0fMyx/tIvhRa9NONRgMlsxcThVne15RNsVOJsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117085; c=relaxed/simple;
	bh=WMoaHnDN0Y06ITTfRIbQrAFTUkyQpyCsDLwooGLQ7rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx3DgluOGuMHawqjyuFuUh7bww1tM5A5EBmqZp6n99nWKOjRYPd3A4aems7xyE3vzLI6ouIMAWoSn2L/gRc+PEzTXt8Z46VmTIVAHOHBdjvhsU4A2kNDLW4qxZ1/KCRT+FMlxZOXiPLrOMAFxRcRrDANz4GYdYT4WVxDOFPygSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvYRNRUg; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvYRNRUg"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso1379870eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792117083; cv=none;
        d=google.com; s=arc-20260327;
        b=MFUyZcKwmEF8LXBygNRFZBHSJ68yu/PKKECXSNHsdikSv4q3WO2LEQR9zGpzaLskr4
         8VR+myB7LfTWJENlT47F3OfMUCtXr7LY4xxY1zO9VTmZlkcpBQplJPqI6jMdmK2FI9Ie
         jgbRTs+R2JKHkzEj8kBFEb/tHp+eJJ7ZAtfxcBgWYJjFoouomwmuxNpPo+OmHz+kOofY
         K400L8R57m7ErIOO+PQGtPA66DfBaEG+rvwNNbKQFC3EFWD+GNrinf7rpkEJhvQSsMWt
         z7qGgS4ffuOuNJbiy+pSGf90jKp3ObvTE0YmXF/14wRYijfyaj36aRFTUsCT2hB4loKW
         mFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8J+MbQGeSC2E2cIQrbkQR0RrcGScgMLwxEU9E2XMPU=;
        fh=NSv2t+qAxASvk4U/iy65Rq7KyC8Zn45fFoCZRQNhLrQ=;
        b=srFROteEEGibWjnnvPk+KJBVIeFARTc8rjV3OSv3xBjn+QQEf6/u6VcAfaHy0tYFlO
         ewIJz0V6O/N4GVPeez/xZ25CzZEOmwif677M2+dYzxBcd5Xt5lolylw8MagzNPjmrwm9
         r5UzVeVwNLq7B8GmDYm5ivUvcLoHt6ZIPcM5IuwKDO210ysU7PeOH7peJf7t3hr/rOdz
         Vt0UVqvdCn8E1r3xbFzTvBGoZzF4iokXGZ+AzFyOiZLmdn8JP7NyVkJ3v9bh6s10FGo0
         RWpYB9UWI2Ucs7wU7t47bkpTEEyZwOfuyAs1oAgJcq0RESE9LEiGJdzb2wpwQIo3d4UL
         /uug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792117083; x=1792721883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8J+MbQGeSC2E2cIQrbkQR0RrcGScgMLwxEU9E2XMPU=;
        b=CvYRNRUgqITnYdxa3GUa/JUT83QbbsI67Q2k+aDHB5dWQ8cO7uP3iJT17EDbEPoCt3
         CPQ6loVrAkmwyyAjL8iD1WyX+un4uXGZVriDDPegn9Bp5DF81j7IGkMtSRBaxjnzM0Vr
         A4cSZUZ1LQd5dQ6mQ+wFsyrkiZJlDn3yaxT1z9ZGPGS+XE7WfFs+E8Z4yO0v/xYXRAFt
         hoIvX8p1jEPLpeM3mdWQcx4YTudzOB7FuFe8UmeUyaOsXz23zZkAKc5Bnn8C07VVCB7B
         9GF3ePb5XYz+iKFqN+TGJVDp3IBOkWZYtfDYFgfYDpdWWs571mZfgyaJQPCyGd7RteRF
         x7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117083; x=1792721883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8J+MbQGeSC2E2cIQrbkQR0RrcGScgMLwxEU9E2XMPU=;
        b=mb1o1pXdek+neVS47H6dl5Hx+PpLsnDaTFeE3KUl71sxbtg2KBmOmqGx7JOk6AGYIO
         wzlkftkmCH6sml+F0clA2yCIs4aHuhTDXxdqp0L1YyZKrjO01SQjwTwnVBJt25QO5Qgj
         tLZ1lEdeQzMkc2oX8i17wWBhYspb9ydSBu2N/vFnk2/27ZdONt9h9eTAWnFsyvydR+l5
         ASfGjYsaFICXn9D1JMOl3xSBfT0JNzwZg8wS/be3nm7V8xUbnG4EJ/Na7iYzqXTZ3tRL
         SyZhjYVvBhOM/gS2kMdGZnQBN5yHOZ33V5spsEK339R0fX7IdCXvWvSnHXl6T+dZPEt+
         rttg==
X-Forwarded-Encrypted: i=1; AKwUvBzbQnyZCIIv5/Wi+2OxPXgYZox0sdMkQCcbScWEZJPt5veekUPBVjS/DF/WK3+AABM2nyPPtNI49xV9is8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs31kTmtEvT+XkLTt/CFY1kgcAvYopEOdLUKXeShL6VuJWZGVF
	FzuDzOaeOYvkEPys3lWnE5Jas3sVK0NYJVI8D22Oxru0m0uyEQf2LL/oqL3VvF55EVm25kIP2W7
	0VeCAzKKuz1Oxjh5tDQfr48xSBwtBoMI=
X-Gm-Gg: AYBFou3lPzn49xDw2ykZKb1mCEu0XM/+KDsLT33AvHmBFsVYQnQtf0ZnarKN/trqqT+
	cK4HcZbIu6i1EPbwy9MFYks8YodsfXtbUyMjA81xjpt5x9UeH5YQzXXCYV9FGSp+5NhdbiKwxMB
	3p1WW8Oq4/VEF/TKbgCYDS+36gfLx7xtbYu3Hd/L2eQ9wpYbMmeSuVKpkVJKBEY9axN6n6oPpBl
	ACx5Dmp0bB5xtonzo1UEhNRlP+V8IxSczy4EFlo/4f09jHtIc5peuRGXx4fGS6gXoUJEGXomMse
	oEed7MIoXu3U93IkNwVskFRUx9Xn3LcK9dAqZUPYMbVIs8IHBf0lcGWK+QqJP67SAjT9vFCTpW9
	LuszDAbnfTGT7rJ3lvG6un6ig8hxcxnuUAK1usChts84jjylbsbSIrR4=
X-Received: by 2002:a4a:ee10:0:b0:6d8:4e2e:9978 with SMTP id
 006d021491bc7-6ef0f7afeb5mr15006342eaf.21.1792117082607; Thu, 15 Oct 2026
 19:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015120654.241354-1-sono7ri@gmail.com>
In-Reply-To: <20261015120654.241354-1-sono7ri@gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 15 Oct 2026 21:17:51 -0500
X-Gm-Features: AclHuK80oQQQEs0WnePVYvVi2mzpo5E302hrIEVEp9c_Zj1kKcbWADJ0Eg4LJ1s
Message-ID: <CACVXFVP5KQ3=cxKsJJ1ktqVdGa281kZ88SVxPgW5C=Yws7a=-g@mail.gmail.com>
Subject: Re: [PATCH] ublk: pin module while release work is pending
To: sonotri <sono7ri@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:07=E2=80=AFAM sonotri <sono7ri@gmail.com> wrote:
>
> ublk_ch_release() takes a device reference and queues exit_work.  The VFS
> module reference held through the file operations is dropped after
> ->release() returns.  A queued work item does not acquire its own module
> reference for the callback.
>
> Consequently, normal module removal can start while exit_work is pending =
or
> executing.  In addition to the worker callback itself, the final device p=
ut
> can invoke ublk_cdev_rel(), which is also module code.
>
> Take a module reference while ->release() is still covered by the file
> operations reference and drop it only after the worker has completed its
> final device put.  A rearming worker retains the same reference.
>
> Merely canceling exit_work during module exit is insufficient.  The worke=
r
> is the terminal path for the device reference taken by ublk_ch_release(),
> so its cancellation would strand that reference and skip the associated
> cleanup.
>
> Fixes: c5c5eb24ed61 ("ublk: avoid ublk_io_release() called after ublk cha=
r dev is closed")
> Cc: stable@vger.kernel.org
> Signed-off-by: sonotri <sono7ri@gmail.com>
> ---
>  drivers/block/ublk_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 66eb55e71..71556c34a 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -2613,6 +2613,7 @@ static void ublk_ch_release_work_fn(struct work_str=
uct *work)
>
>         /* put the reference grabbed in ublk_ch_release() */
>         ublk_put_device(ub);
> +       module_put(THIS_MODULE);
>  }
>
>  static int ublk_ch_release(struct inode *inode, struct file *filp)
> @@ -2625,6 +2626,8 @@ static int ublk_ch_release(struct inode *inode, str=
uct file *filp)
>          */
>         ublk_get_device(ub);
>
> +       /* Keep the worker's callback and final device release code resid=
ent. */
> +       __module_get(THIS_MODULE);
>         INIT_DELAYED_WORK(&ub->exit_work, ublk_ch_release_work_fn);
>         schedule_delayed_work(&ub->exit_work, 0);
>         return 0;

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
