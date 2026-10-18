Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E830346E5D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321296; cv=pass; b=pJ36lemkr1GdW+xrLhnztZhLfLYDWdUoRJNLW9fv5HUJXXkhT0RSxbFc1PhJHVqVO/6C3SoAzH6u5+Y9WD69vFUP7xpHAwM9feo2ifN7iGuhzmekKeufFXb+wdgvYsHGpfvofRD996cMgnLomoc/7uRA2b2yyXez88AexAkGtCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321296; c=relaxed/simple;
	bh=yfqpp8WYOenmjb3oYHuHBnzp/XrvWdHp+mrIFBFp1P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seICNrcYp73iBw6J2ZCCJfuNbBMK2hy9KZQUKbyIAhN696Ke5/lTJtiJvThFN/lO36xUttrrpHQqYfOz02V6nhVzVHXvX6RyI7QqxvdFH/ydsd1dsx2Q8og86PIL5IF4QHPgX7WwPb8TxRgvIJTVl1IFZx2l/pUFuFrsXj6c4wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4TAq7QJ; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4TAq7QJ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8acda240937so9002617b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792321292; cv=none;
        d=google.com; s=arc-20260327;
        b=KdjcnGcBMJJUJUG9wD1UE20W7fvw/y6ItyDYLdAdDUN/QFgMDizhE4MjR4NfFVgiDW
         jTW2NyWnvnSt9ki0eCWcKYBYUJxfgKLO87VN4b0Y+UDznaSFkAqeqLwp7DmVgVCLUbCa
         4U2HqS5rob8AKmNhsjhoKmAf/WGzUER68XYKDHtSwSPtq3g6WvRaCSDifwV/p/RubOCY
         P5AkQDuTEt/T0Plf7i79eVkt3mCrNg+9CN+yvWC4Yj6MY3XlU7VwkylBTPcnau74RPPr
         vVhEKsqtf7yAcjnsl19Ff1hjswKALvPY6bBMua8bYwicjaimuGxW08aLdHlwaZ+G+oX5
         6L+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        fh=1KrSsXe0pjQq0qrbIrnkmfyyD984ZTcxPsb2vuYDWss=;
        b=aKZvR1vCzEbM2tCOVnmyAopO/DOvN86mp2/qKCd0Opvkg7ZOL4IYbxMTRwGQplI/a4
         B4SkghY3UGqJPCCrFTfnp1axH1LWLiERV/Ik46pA8RYhTNm4MiKoW8/oAjZvNPL89SJw
         /6uHL3Z26EkZ5O3q6Ef5bYB5IhaS+B8R+5YBv65uRiElUpPGUhlCLZsVZifWNLpkfR49
         D7MqL8/bIhMNYCnk1tGGxps74jNYk6XFprLvIEMmicnCnY1ndHyBdLMR+T7dJTpyL8Ba
         TNB+sYCLE/k0HdLqSRjmIeMJIRN6RjOm/WY7fMWU4cAsOqA0yTYzHIdDpA/MBTG1Xjup
         990g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321292; x=1792926092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        b=c4TAq7QJJBL9dlSRrxQCpk9oyce6hB0woIYKJFS9r6rbmd5jjc2heRT2GCc8xySk26
         TmMsIjG734+5YicmvQZbah/HtH+n8dDalk6fXYgwCZl2OLuqIxrhQo23w3LbDhwAWiul
         DUGL3IAda+bMMrTZte8U2ziW7J09qxRO2qXy2YloCOdqaMHILramMN5A6HtfwYKYOHAj
         vJEGsumXH2+mQ1/0EBa619gcJMPSSlepT8uQ91a1SOVingNRFFIuQn4xLGwbDGCPRXGD
         kupctFxlIOZAqM22H1XZeh43/RU48w5CWSLJ7VfCupy6Dmh0t0OopNxBNI8WnG7dVAei
         wRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321292; x=1792926092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        b=U0uM3OovBFBGDVXojblh4IytVIPQEfCfLnRGk7Dxn4mljzM6RPmOiaBQxL44y1OBDG
         fJ7O2TVsQALB3xzcmveKA4N1KH68fws4z7mFn56SaGeinJgqsY6TV7PQOtjHSCgcBSs7
         CsN5mbSp6U85jdlVNhWHXDgsdcsEWw7WNysRSGKPIGGGjtfIG3cfBctMn/yy1FiJXy7U
         Umdiei+4A6V5hDNFzqjv9JdjcwgW35xmga3eh8yRHeGu5dc184tEYZqiIkYrTzl5RaCV
         WrGFS4dKORhAi+4omSX0uoRboDdvYRv8vXqZUyY4A/kD+6V+uDLH7zmVf2iQDpiw+AWl
         hS1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkcOQcEZ219+fJ+Z5R5NZxfZGLrHYw7g9BHA694AJ4swv7CAF/ruOQ+UYtJgaiIMu9FjDnOnzRk9bEhqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcWIvzSh1zrA83MuUbrEPpdhwhxgWsUnA1RVD1NSg5zhirdr2j
	nm+YtcKKKVh2or3jCv2x2s9bVsSqrK84gbEMGQDOv9DPmc9i93boVZM0Y5CETw4SWiLyacVvVw8
	rc+q0LP/VpWgoNaeiAljeplqEZqLHuuM=
X-Gm-Gg: AYBFou2PFLFaHKfwo4c2tDDhJgQlBIue9pFxiDcLlbBO1yVi5RWdo6z2Jkmbz27tGpd
	/UMPKs2AQG9Sf463bLygtVx5wQQBc2Z9B6NUiGsbcoG+y58bT58KPWxYa7tZWpU/iPSykwX+gKc
	8IXJmd/H2p51jRv6fkzejoKvHnC4cl8FgQf6I7AeRFWytaOJtQusrvT2SKtN30Bx1b1HDl18Kwh
	UofPz/3qkKgFa/s0hi/uYMk+TeD8ZduW19RSgCbUWB4t4viA612v34BCxPB773P3vgfyTUBhMq1
	PZIAOf6JHdRC2DLPBhgoyDzhIED9fSzdPmB61KSMkOcyKKsX3oVvBQu7h17mWOoJTxNgV8pa8zH
	7BjqVfH7d14+SzMlyGcuTdQssJZcOJ2V51V52l9C5yY5COXbJi7lVSFA=
X-Received: by 2002:a05:690c:d87:b0:8b0:a8f3:bf69 with SMTP id
 00721157ae682-8b0f213a4fdmr14586047b3.12.1792321292329; Sun, 18 Oct 2026
 04:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806080018.10050-1-kartikey406@gmail.com>
In-Reply-To: <20260806080018.10050-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:31:19 +0530
X-Gm-Features: AclHuK-AoWK7tKNVkf-gKvfJPvt-qsoCPL8hIasuPDqutLeNvQ4YAPBMihpV1tg
Message-ID: <CADhLXY76C=O9x5iecg=tFVonu0dWCDK0QqGbsU4oXo=XA7gK4A@mail.gmail.com>
Subject: Re: [PATCH] Input: sur40 - fix use-after-free in sur40_open()
To: dmitry.torokhov@gmail.com
Cc: kees@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:30=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> If any of the registration steps after input_register_device() fail
> (v4l2_device_register(), vb2_queue_init(), ctrl handler setup,
> video_register_device()), the error path frees sur40 via
> input_free_device() + kfree() without ever calling
> input_unregister_device(). Since the input device was already
> registered, it remains live and openable, so a racing open() (e.g.
> from udevd) can dereference the freed sur40 via sur40_open().
>
> Split the unwind so that once input_register_device() has succeeded,
> the failure path properly calls input_unregister_device() before
> freeing sur40 and its buffer.
>
> Fixes: 08b936012964 ("Input: sur40 - switch to using polled mode of input=
 devices")
> Reported-by: syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D683f6c071b5abfc266c1
> Tested-by: syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/input/touchscreen/sur40.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscree=
n/sur40.c
> index fe63d53d56db..b0958422ff76 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -808,6 +808,10 @@ static int sur40_probe(struct usb_interface *interfa=
ce,
>         video_unregister_device(&sur40->vdev);
>  err_unreg_v4l2:
>         v4l2_device_unregister(&sur40->v4l2);
> +       input_unregister_device(input);
> +       kfree(sur40->bulk_in_buffer);
> +       kfree(sur40);
> +       return error;
>  err_free_buffer:
>         kfree(sur40->bulk_in_buffer);
>  err_free_input:
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
