Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CC282F3E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494373; cv=pass; b=J2NdkuvD/uJSG5NJER9wTQM2sXk319GRhLrExNTPb5NdXO8Ik/5OkCepQJeIQMrPsH7yXg5OtZWF/O3NgauWuOUsV5ncbbmf3immO4X1B0rpREpE2cZ9YcSFLETKe+ZM3j7I7B4K4P14Fbn8orq9FASAFp4504jRsLAEq4WVGT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494373; c=relaxed/simple;
	bh=E5PfAaIVq0MISekmDqM7CK9/H58mzYvIuVEP+DV6XSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezugYj7exrESg8EANysjbdqUMwswPnwLye5CGDS4sL2rDy6WbXCmdfHdPdGHvWuWe1+R/dHAgkL0r5tTeZHsYji/sxtkat0kVKZrHJU+oz898MqhEW6r48o4bSrhnCVXkzWi7c2HQzcaMo3aMrQAUa+TGMtgedRmufg5mGQjY2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArWkYGEZ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArWkYGEZ"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1b327so1692293d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790494370; cv=none;
        d=google.com; s=arc-20260327;
        b=OnHQiShI1zpGAtZjfCYmlr/xJtYA3Nl0wP0Du/tFKj6ZwaPFLarq61cx88oeiJYI42
         luBpZwQaGjjyfQ0Vg8eoPz3Y2Jk2K2LCaRiVtOaveqFbTWDh1GwqE6RmvgYmm96QEhG1
         FO46CwYnTa0wTqC9qpcQoTSAdocrD8BLE1Dj1lP7kkxEPm8SKUqXbCg3Xr6S93Ca5lHu
         Y4QpKJsRl6KhtqOOHAvxl78hrV+vWGDzyfuX3es9teZtodhoi0TNbBMRdjsLwNXZAZIr
         to7v3d3Cvoczg+71nmI+2pqjg5Z1wFf5ubeeZq9P8dBwS1RzjNJxuTen1nhdtRvI2vVd
         HhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7r2qzE8VmtZGIPj5zpAwWvL7rfoEciHBnDUrevpGbA=;
        fh=8ozkUAmRG88G8dmRimx9zSYOba4jeiHAlc6xJN9qm0w=;
        b=CmGLlVb9DWf07Ixs9/ecGF/+haSyUPLxNIOlZJQWZW7YjTAsnjFx6RZhqYCakF5Kcq
         Je7w88/I5xpMLoE5WCDQlreRn4aQ6kU6w3o/CeSJie7ox/KP25i/sOuj1Aar2jKI4Lo3
         sntywPel0gequdUs7iNf14J4oMOxpmc22AUM66/5MQh5kQvt+Ghh1SnnGhROO77CT9T5
         UTTcXq8Ezvc1XoR6xAY5jU9jOzF8p24cPrRXRVfris0acGLdEnRWhTiUmhVISlcopm+s
         RZVMiMkTvdp5Z+aVEQEn4QYpZjOiTugCTP1p3YNevEwqST5cIMaWsH0TPhiRTml1wlgU
         rvZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494370; x=1791099170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7r2qzE8VmtZGIPj5zpAwWvL7rfoEciHBnDUrevpGbA=;
        b=ArWkYGEZfiB1gtY3mXrkaDMKCqWXQh0uHDO+6pKHLSFNKX8/c4bH/EZi9QYl6nygvl
         y5B/EGSV0u6BX+MWbuSJEKiXLLUQI21xTGFcPyUFbiuqun5Aagapw+cbXulldApDYpza
         VaKSCXyJBIOyFepFeMO1//C45M5Gahacz31a0wZ+iLJ3SckcFW/nWSPOfh0NKUmxAKiS
         D+6vgKoJvRvHbbgoSsJA2gULeA9OJ6Yj4Wd5kmjyUpD0R8eoyHszHIr++GWYIEFN4GvF
         3pVcaIFtinoOeBEGYhX54JUBKr1Mnh1HfVgnJDZ2o9qOC/qiFMlVw45sBy/tVioON9jk
         ym0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494370; x=1791099170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7r2qzE8VmtZGIPj5zpAwWvL7rfoEciHBnDUrevpGbA=;
        b=ckvSLJfUMMNpNN1OIE3ZtZpmRnZ+Nn9TBDzeysBjyRo3LLrJsKcYqnuY1kMhmSvvVy
         6Bg+CVjtLOFA4EHlERms9OVGxhI82MQQjIsKE6LALyZWwAMwxsGTtQPn+YhOHpWevNQj
         Ci4Nl/LLKXLJx2lH+9dFqTAE8ofeHiHaku38w+pqmyc4ZgcTvVcMQaZR10IxiJ05GmOs
         3mDZfKZ77ke8Qklf1C0j6CcVfhrO1iNUCTMg57vq9y0lSYDwaZNfc5CrWg2mtEAIcP7h
         qpScyxShMGcHDTjFxIVYs55PqBbpS+i9EiDm3DAv2B2TfrrW8pKQZgTbPtyKVV5gh3di
         nE2w==
X-Forwarded-Encrypted: i=1; AKwUvByvqmhGiNdfCML4PZKqv9/xcnMpso8wFztnUXaPsNwhYjMFsxczIvke36OzCeGz4vQpHR10IQkiKrGUInI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlh3KskfuX2LyrBLCGRw/LFZG+SoXZwZgTFi+R2T8pnTpy+Dlq
	MMrThgpltxzbKIhG3RfinBihXh+sAgMkiwb+JpJ/ZNdMIjIhPjJ52zRxp60SKJyGc+yK8p71img
	Vwe1XBijXWctDrA9AITmcsLV7lHewJ7tcHfb5JpY=
X-Gm-Gg: AYBFou2+J/EVVytY1GiJ6ns79AtQNHZuqS3sBQgNbl2SXnn7WcakQeL3t+8aQnozGnc
	xYLYQJwqId1DHUzyF1VWYepw3S6ejgbe5dlswlO18uuNEkMICODFyBE6nnz7zghYtOUxVRovxax
	NtrNozjf+pOVunCuWi7dskl/Bs8gw6alDarKuKsNGlCRget70jMXOjZh1ulc8ymaXwxswxnSsta
	TWutBc2wiK4mPcHmqwGzBuU/eyXg6lUx4AuKGVe+3oN8rMWrOVBjRKaJfCXRIqiaorsUMX7Yj1B
	RMCpVDPFbhBwmXw1AmsjMnzvIfdTIkEXSb2ALVFoyruzGDtkoSgp
X-Received: by 2002:a05:690e:14c7:b0:672:f0b6:2619 with SMTP id
 956f58d0204a3-672f0b638cdmr4819744d50.8.1790494370535; Sun, 27 Sep 2026
 00:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921163828.111061-1-ekffu200098@gmail.com> <arO-ssiDvVjJ7TIn@pathway.suse.cz>
In-Reply-To: <arO-ssiDvVjJ7TIn@pathway.suse.cz>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sun, 27 Sep 2026 16:32:39 +0900
X-Gm-Features: AclHuK-vlhS51e9Ftq2lU51WG7rPcPBiozv7h2e1nny-mUFkLw8Y7UYUpS0srac
Message-ID: <CABFDxMEwPV69-6uTc+_k4xqGBwfkTd2V05zLZ26My3V_5YmVkg@mail.gmail.com>
Subject: Re: [PATCH] printk: fix wrong number of CPUs required to increase the
 ring buffer
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 8:57, P=
etr Mladek <pmladek@suse.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue 2026-09-22 01:38:27, Sang-Heon Jeon wrote:
> > The default LOG_BUF_SHIFT is 17, which means 128 KB, and
> > LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.
> >
> > By default the ring buffer is increased when
> > (num_possible_cpus() - 1) * 4 KB > 64 KB, which requires 18 or more CPU=
s.
>
> Good catch!

Thanks for the review, Petr.

> > Fix the wrong comment and help text.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  init/Kconfig           | 2 +-
> >  kernel/printk/printk.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 60448fd4ee12..446cbb59a43b 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -843,7 +843,7 @@ config LOG_CPU_MAX_BUF_SHIFT
> >         with more CPUs. Therefore this value is used only when the sum =
of
> >         contributions is greater than the half of the default kernel ri=
ng
> >         buffer as defined by LOG_BUF_SHIFT. The default values are set
> > -       so that more than 16 CPUs are needed to trigger the allocation.
> > +       so that 18 or more CPUs are needed to trigger the allocation.
>
> The number 18 is pretty ugly. It was supposed to be a power of 2.
> I would prefer to fix the computation instead.

I agree. If possible, I also prefer that too.

> >
> >         Also this option is ignored when "log_buf_len" kernel parameter=
 is
> >         used as it forces an exact (power of two) size of the ring buff=
er.
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 00f8e1291564..c7d961256c88 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -1087,7 +1087,7 @@ static void __init log_buf_add_cpu(void)
> >
> >       cpu_extra =3D (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN;
>
> If we remove the minus one:
>
>         cpu_extra =3D num_possible_cpus() * __LOG_CPU_MAX_BUF_LEN;
>
> The it should be > 16 and we could keep init/Kconfig as is.
>
> > -     /* by default this will only continue through for large > 64 CPUs=
 */
> > +     /* by default this will only continue through for 18 or more CPUs=
 */
>
> Right, this should be > 16 with the current defaults.

Ditto.

> >       if (cpu_extra <=3D __LOG_BUF_LEN / 2)
> >               return;
>
> Would you like to prepare v2?

Sure, I'll send the v2 patch soon.

> Best Regards,
> Petr

Best regards,
Sang-Heon Jeon
