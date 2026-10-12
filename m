Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A4C372EC1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796919; cv=pass; b=MUDBxzskzc04TZYyIrXjruGlF97lB16tIXQmdM6tL1GKyRKWwEnFz4nixyehSDdCXadIoVUlFC9nPYPaJgyF0HO7CUhBTt9GslxDrreDfukvTfwvibjb3mKlK7C4vCTcivEXGEguBMBsCzh+LyS1zneqowYrxgMyWQWkcHvvijg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796919; c=relaxed/simple;
	bh=HMgUswHA9/JW7E20urE69ecFRmmPCiIt6XwvKa2U4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hbvb4t1QZc3KWQhWfz4eMo6t5guaKnXdzAXwExhAuJNHHri/BbdNsnn1P29+QsCVhy6BnFhB14liZZPyFBRQsjH0yrdeewVkqIH7h3qsKZkuUMNZ3zYu1LS9T5quukNHr6IFdyEp3h/L6Bk7THaap6OKdU8dgCbDXFOr4k4cx+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+pySmuR; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+pySmuR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso273929866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796916; cv=none;
        d=google.com; s=arc-20260327;
        b=cHf2zI3IGJ/63iLbCJLugy6v/otsPi5VXtqSlh/CpUZvznBF4ugUX0X3eVJ/PiI7k5
         RMkL9yOV6doughvg9qt/aaq+4kYzLezZnM/KC1o+mzmfc0lrxa1dXmkrPrjx/EVWPKk/
         JBC3m84kNTNQnQg6A7YhMTCoHX7ZjKNjA9m1FTknFXWYQX0LP+QWr1wkiLl4t5wh2z6i
         Wb8vr2FydaPu7EX50Dl5DiMkgkxJ2ewiudrssZMWfnfMBpw3y6zagl1crftSIwg7tL7f
         jsxon5xRVk5xfrg23oZL11Oip1azg2pKLS5GfU78D/3grTxEUIJod5m8Nf6qc1/DsTvL
         fPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        fh=hqfPTqtBNw02kzMUmNgu6of6lGCY53p+GhvoWJheGfk=;
        b=qCMLCbMJS/yxUFOZUzI1+TiCpuDJqFSiNAa9uaZYhL/L7YtQzc4T+l7Lwzz6Gd3wal
         Wmyu3CZ0mjoDTx0aozcEJFLjGiCJwORMC/l5XbnxPDbxabSFRE87heXVGMY8nvOrX80c
         7cdXWcrH0QOrli3s8M4tArLqB6WIlAGFPwSRNZ7aadGI8Oiaexc0cR1IJ26gefk0io+c
         awp5W5uKh80fyZroLIq8jZC5waztT6iHWIBlgLmB6OYZTRUTGNk4KN0DoeDR1B85Gwtb
         ZAC1oPBbUb33smZDbGDm9QFS+vBhYATnCx86kpp7pqiI8Xga4J6gLp8ZvD1ael4wPP0J
         IR1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796916; x=1792401716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=n+pySmuRoWj3EdZu8a0WLkYYnm/urNB1fQn2a2TEt8nurHb+HpyPyTkqZ1rK9E/f+O
         AU6QLh6Esq/7qd2EjhfWnTmFcc5Ld8n/NFNfNgB/O2n5KEef6zzMK2aypxLoKT2CYejU
         zMpuAYXaTtaPgfXmLmf+bNtF8VmDIfICQunqW05IVIp6pihM48cUF7+MVbk8QZzrC4wq
         Ti4TPJF7np2OngOTcw9nz7vzj0jIdwfYBX2araz33JfG/gseAbu0BwUUTywxdpVRFydY
         zudlLmD+kOkTaStP8kKclpZZAvmJrL0wiZHJTQIszrzKtObwybyDF5NpiaI/PqwjTTQh
         H77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796916; x=1792401716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=1CfW3GLxMc4xlQ/PeKlnOE2mXgsx+6THPsMLMvCQC0HyIkLyWIydOkPsTNh6jg51mr
         8YzNB+rPyNRTi+V3u4cP0+e4A8/lmavAO5WrO8al3eZpXVJBJLADpir+qndCYhVeiKkI
         puRSMDK6+zr9NJ1Q34pB4F4JwspICS7cmHOvCejK7Ta2kFvQ6RTwv+uHUmPHMvx3hQNz
         2ttG+BqzAr/R1HWpOS5XqyAlwxukCxeiu/+HTlAWmPK29uUgy4Vm1qzy+jyz8hNvOQrg
         +ReaPQnSbC5PsIWg3PotPeWd6uDvjYspGGD64nNVENDEjHJgUl2YMs8eIueb+EgUZnbf
         IclQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAOlYYljbuESI7wQu7KUQIlr0093MGe5Djd1PMAWjXLQtibX6MDT6MKyj481eUnfATUX7hmYQWlJkUal4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1KEYswHTjZEQQMP5gX+6lTrguWyyDQvi0Xcd4nFn8xRT9StYS
	Pe21e9+zeNLTuJXgc4D4Sntl2AL64smSUDGYiRBahiGywtetZoihOA8gF5boSG58phzfi5pY7As
	Jz3UrfRZxf/3pzmtjNB8kvZSweNrvj8M=
X-Gm-Gg: AYBFou3zJdY4I1xBa/nkFKSANIK2Ec5CRLCAEHLn0CYpBH5tRvvY2b2S5qpCRsiXwGy
	zzchHiNrxT8O+yzrHd7oSeKzGhaONxCn44DEOqjEhjI3/G3QFYqbY8JE0K0aS335DL7++rPyDUP
	H9QMGW61IvNIpJwxR3/CkgBWV8m8u48H49TrSvrmShgrkg7tsqzitCVLekcfWzCXryOEN28xCtE
	eEydlnVwUCKFW9tCm8FFBISpWnXJyytzEJ6Tno0riXdDx0i8svhfxdgnRkdLggwESm5KyfWPK4c
	TPFq3RA6pk2JxeJ/7pWn3mC5+K4c2rLceAN6LFyeQr1eLARtGoKcygCGdNEt5bIc9ADImUhZF6H
	MmfJhWe7f4U3RpfuEd09WV4jskPePZ/aEDy6dyGJ+CvHq+ZQuu44GA/RADe7T+/42qhsDOznJqL
	/A8bfJ9zvxj5OIZ8wjUJqiwJ+RglrMJE0vjxd9T6FM
X-Received: by 2002:a17:907:3d09:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c31a9fd33dcmr927229366b.9.1791796915831; Mon, 12 Oct 2026
 02:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com>
In-Reply-To: <20261012044724.160902-1-mhun512@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:21:17 +0300
X-Gm-Features: AclHuK8b6tUYO5p5GU84erIeD1vnrAS30oFKa_UyF3wbpOcD8fRDiFjk41OAN6Q
Message-ID: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> The threaded IRQ queues assert_recovery_work, which can stop, reset and
> restart CSS. Removal currently tears down CSS and the CPU latency QoS
> request while recovery can still be running.
>
> Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> available until recovery finishes. Then release the IRQ before CSS and
> firmware teardown. Apply the same ordering on probe failure, and skip
> the uninitialized recovery work in PM-only mode.
>
> This issue was found by static analysis.

Nice, have you read the code that you sent?

...

>  error_unload_firmware:
> +       disable_work_sync(&isp->assert_recovery_work);
>         atomisp_pm_uninit(isp);
> +       devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>         ia_css_unload_firmware();
> +       goto error_unregister_entities;
>  error_free_irq:
> +       disable_work_sync(&isp->assert_recovery_work);
>         devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>  error_unregister_entities:
>         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
