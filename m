Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B06381AE0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597923; cv=pass; b=mFBjz0mKiK+hWt8R5Gf3voltuhmuZFrnWqcPluOyffiU0Uk1P0Hg6VD63PdPcHtrBXlV/jZiz3YHtmT7vdAxaw5sUD6Lw34LOdAeh4fsHICHbrm/GomDYddsEO/wqq7QSvtWYepeKIdOoPtRIVwfhWWlUZTN64hNzZXL/NRhOuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597923; c=relaxed/simple;
	bh=TijKxK+nK3xx//VQ9rSkkM6WufIlRHmW8yc3Q92XXuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYCZbVDQuV3MumZ3BnSvHXI/ggb4aVbeXDhlHmKPTdgJ47Y1k6YUoKABtYJazxrwierM0oZcEuZUHT+60UR7WqggjlxWZPzMBbgmQjx9H42db+3N4lsfeqlxIVfTP/0iMrOH33fb8NatFfkFAQhK2GYFWrazlxSaIsF4eon8UD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMe7q+kr; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMe7q+kr"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729c4030f0so2554316d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597918; cv=none;
        d=google.com; s=arc-20260327;
        b=qPl4Q9DZMXzn/Nuh41VUCbdN1BHNaURDkExRSj0rzPOB4Omt4ZYuGgVNkxAq3AsMm4
         OUxOjdmX0gVc1uhUoPlUOSttjAYNKpHHIyD7OG1xU+PQqfTDG2SuHMG42nlqLcq3bsJ6
         b2SDztgN8v4iQuTJnTXuexWR/xL4ev48wbK+6+OGS8vSUspY05WcKHwqC23G+4PRhi7X
         eSUEgYpI7qMrWgcClZK4FU3lDcVC63p4Zv8QPeXvu5X7SC8/1BoFubm0Hp8CbFFJ1zQT
         j4jmbHyaQO92LkvVtLlpTnRp8krzpwh3iy+8ZRBVO4rKze3zM3oUzlQGIpv2HF8sfsE2
         kUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        fh=7Ksqj88uhe2LR9m7gberGIr8GSaja7GXFyDXaEk7X5g=;
        b=nBY4/OUR7VPp1ziBxhi90kXvfyM13Rh5/g/Ed+mHYQpuPMLp9Q8EXBKoPxIeQV/ZD2
         Z6mgpgiBxfUd81RFrQpZZh9ibDCWVI4fymBVGuqDzYwR5nBg8OkSY6xgfvlL1vLKZYyP
         WbOomBIdndx0fZwbK5Ehp8Qk+tFl4pn4MKINi2A7EfyvVmOGKs3OIFT8+AGO+Ti22ruM
         4GTGA6+WyvsSjIaaYm3jElfhPhzuFigAjhIhTWgh4y7nI1QV0TM683de6VDBftJ58Px+
         dW6w21MvnKZR18IwzKbKIRTB5jgCotsVzQAG5tLACHyWYYhohiaTp/L4Fof94QPwhpEx
         G08A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597918; x=1791202718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        b=aMe7q+krHZT5jfGanu6pqnmHEhYF/VajLq9iHFSn69rjtntsEn+eoUrqSz7fTsN9Df
         B4I/wwoDgitHtf9jiDtrA8y8B3lIeINYP0eCtEbavwD8CtkdVDiBWciJll8vI+kqxxss
         sD3WQtAn4QtdMvHkkXtRimuVpbIFR44/ntg89+HeNp4Is5ZDs/sE/kTagn/pm8EQYY7C
         EWhWa5c22WGX8NpPkDXToMzC7sieIMuKtEqrcRC3ZMRnfQxuCdTYetXN9HIhLdB0dSDr
         nyeNOxUowbkXZDV/hPQlyGNAbFTO2KhWGdmTpzJwd3wi0tnm9R2BrOIU9taBz9htQq7X
         8WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597918; x=1791202718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        b=vW3XQTnPG14SvTdWmfMqCRcU0P7RGIllCXWlOfey8SReavbm9BTOVzy1eWqJHuHum5
         a4zWWOy1MOLbvtpzRlkdxDK0N9SboWu+S4F4+kgr9KKJuTovyiTR7C8nwtHuWlqi+hNn
         W2HnkBk6qI8q0d0w3aaB/KdIYNc1kdzb1/DxdvA5cY3bjkUJ0jfZJS8nW7sSfccSgciC
         23pw6rIPVNCDlu/RhDe7x3LERHhW/+h3Z6l44I5DFcKAFoCmqDVpljAX76xYQMEF2EK1
         lJRoNpsq8ZSZ/Qc6DD9XkwmPJBUVsvleoUEKylCNVg881wIjFChbmXdRA6HjRYg7Wr+A
         v4BA==
X-Forwarded-Encrypted: i=1; AKwUvBwaVMh/9PqXzjkl1WoXQPSoCi8jv+/J/tv9pnATUPfjkPM99iTERQrxCICXh4zzw8Z8aHBP3xOV0Y7TKWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAnoCI1xaTGFbwkOhjcjiteSbK/whGNHltUTfxWJ+ojmoxtBuA
	+4i6mAnJBQaGlYDaQu/PsemvXfyblSuKxydTDZnMuqwXiT94sZmdrrStdGKKvjptX7Pm8bxH1nb
	fiWv7FMKtNaVKLUU98WkwaBHa1rltHbGvQw==
X-Gm-Gg: AYBFou2kgn91MXSu6cEoo426K9gqv8aajRlGgP+JHPReZ2gxkoFXu1dODPXKfFKEA8U
	xZTbVWVBmhv4wtp9vTIifDSLJoUiFEqqjyLtSEOQY8DO9GBGGOjQgcS51TVNTjvQ8I5KoxUJpZm
	uhZMiyESDK1PaF1/tuqdAjijoVTiHvjLvdL+ZoAlAbOyZC3nxiThZKhnUxmPmaD0XVtBIENzRG/
	NYjg+HZUGZCnDWDpAoH9/Pv2sFzh8/kLmOOecRFGL3/Vy0vnI11sQRVUf/bxTl4eodqbY3Ur+Pt
	1Xh6/KBCBu9pEGaXxKq6R0TQCCB9kuN9Mbkqe5kr4TPV8WZVLbYnbORuG9eAxteB+PD/soAS6Y2
	VXQBiZ+NV6UpOJ5zQxO/+AD1A8ka4ywZtBiPR+s+idcc=
X-Received: by 2002:a05:690e:12cd:b0:675:13fb:ef4f with SMTP id
 956f58d0204a3-67513fbfdccmr1784360d50.93.1790597917899; Mon, 28 Sep 2026
 05:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121230.35359-1-kartikey406@gmail.com>
In-Reply-To: <20260928121230.35359-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:48:26 +0530
X-Gm-Features: AclHuK8HSa-2KM0ooi_5xiqzSTVbPS3E0wHbBsge4xM3DW_Ub-G1EbMualq28Oo
Message-ID: <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>
Subject: Re: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
To: sean@mess.org, mchehab@kernel.org
Cc: jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> ictx->dev is a raw pointer to the usb_interface's embedded device,
> cached in imon_init_intf0() without taking a reference. On
> disconnect, usb_disconnect() can drop the last reference on the
> interface and free it while a userspace fd for /dev/lcd0 is still
> open. When that fd is later closed, display_close() dereferences
> the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
>
> Fix by pinning the device with get_device() when ictx->dev is
> assigned, and releasing it with put_device() when ictx is freed.
>
> Also drop the dev_dbg() in free_imon_context(), which only printed
> a debug message and is no longer needed.
>
> Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708fc
> Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail=
.com/T/ [v1]
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2:
> - Remove the dev_dbg() in free_imon_context(), as suggested by
>   Sean Young.
> ---
>  drivers/media/rc/imon.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 049a73b5f882..562a70186db4 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context *ic=
tx)
>         usb_free_urb(ictx->rx_urb_intf1);
>         kfree_rcu(ictx, rcu);
>
> -       dev_dbg(dev, "%s: iMON context freed\n", __func__);
> +       put_device(dev);
>  }
>
>  /*
> @@ -2253,7 +2253,7 @@ static struct imon_context *imon_init_intf0(struct =
usb_interface *intf,
>
>         mutex_lock(&ictx->lock);
>
> -       ictx->dev =3D dev;
> +       ictx->dev =3D get_device(dev);
>         ictx->usbdev_intf0 =3D interface_to_usbdev(intf);
>         ictx->rx_urb_intf0 =3D rx_urb;
>         ictx->tx_urb =3D tx_urb;
> @@ -2314,6 +2314,7 @@ static struct imon_context *imon_init_intf0(struct =
usb_interface *intf,
>  find_endpoint_failed:
>         mutex_unlock(&ictx->lock);
>         usb_free_urb(tx_urb);
> +       put_device(ictx->dev);
>  tx_urb_alloc_failed:
>         usb_free_urb(rx_urb);
>  rx_urb_alloc_failed:
> --
> 2.34.1
>

Please disregard this patch.

Thanks

Deepanshu
