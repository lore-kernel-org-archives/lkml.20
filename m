Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029D403AE6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339823; cv=pass; b=Ft5pdgYyQKHEPOyhZL0a0+nQ5kDeswsFbyi9phLa79Go4Hl2I2dbQbThHNO16eBlUy+GAoorOyL4PPlWuNNY+9BDZwNOPu28Bmgq+FIWi7+DnI6BCA2KsTtQlULPg7OYfozNBk5oTOpLQDWFiqZEQmUlN3gZaQfHXJMlBz728IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339823; c=relaxed/simple;
	bh=ZB/9ngpvGgh1rm2Qklw/z6rGOssH6r1+wEp1S8b620A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ci3MslhNy6M50TTE8BU+zqB9+MZX+etvSfhPk3Gr5J31dUGKyLyR7JEf/SvlRDFo5Dcrupe/SNW7DZ5EkGVGzTNKN6cZZLJShnE0Qj6nIKKb4h345I4aubQ6iyDoQIxZRgD2OGmBZTsJipDbWnNJFldC72UXsQr8gcu5gEw7QhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iptOE9aH; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iptOE9aH"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so298513241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339821; cv=none;
        d=google.com; s=arc-20260327;
        b=nubIRz+k0FzEGLOjl3KXuDd9shaR0qNMKdkS88C6KPnB2GIEI6fmELOQZcPRNFnMf4
         n8ljYe9vQ/rneQxlIvlOUBBSQ9DZmzvbb/mUAk+3UcMCUi3QaoKkhcyz/ZYQD2OWOtJ3
         9Vz+bRf4plxVqXnLgt1h9iy/u6Q4N82JAEO5Ah5cW6Gp23PsbrNAc9XxHHbJj/D6WRmF
         hOIRuOXDxmBbTvjG8qC/gtVEj/udQLms+l1XpOclZVtA1Oe/Qew++7RkFZAl0pn3AhNM
         1X2GjrrAIXV8ImgW3RnFQsyhmnuUcLdrNk9r37DgHIJrT2MCd2dIzwS/zTjAvcKz4T35
         pYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YkZZkC4gsq97UcRVGWrKmuFIoNEN9InKHcyGDJRFeaM=;
        fh=ul8qO/ZrHGTaUkeAr349k0LT70z4X2f1XuQWktgyELE=;
        b=Yp0yPmVkFPNVEi7ur166hGMKCEIGt6Df4m8essnBPDHUDOhGyWripw2AKNRpqCveTj
         7bjuQsCqbEh/Y286fT1i25RoGPZBiqqVVdAnpRYbonIyw00rdBY47qMMmrhE5ZqQctZ5
         8tXpdZPxVSswu6c0SOcOLHrdQgLiJFkOJzNOWywPZ4hmU1gnVjXKrZbVzpQ8aSI8MJ7S
         3kckcX91TdAz/1c4U13Dg2NLXrwD9Re5rsKRvjmBWdTmd7A+Fvg1iGEQxbNm94kEBmSm
         1a1Pkpu0HRcwsdf37DwP3jHIiZdngCboBz5uzuSgbT1ptOKAZxNjDkYHd6it++asb48+
         bA+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788339821; x=1788944621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkZZkC4gsq97UcRVGWrKmuFIoNEN9InKHcyGDJRFeaM=;
        b=iptOE9aHOgfcmU04qO4snhWy1/Y1ARv0Y3kYtQx5dE0Jv8yEQmjeR3Qct+0MIvQJks
         W9xZNkGLq8CodkNw+o5NZfiQafR1sVCslcMPT8zKXoImMuaaZWkpNB8i2XVvgm6TPbTo
         N+d+btMORTSLxzHGjCeKiUUjO3M2+FvSumgOc+iMYdmayKtH+r7algzy72USb8ycypjE
         DFOaHzSCP45lGmcpgekV2YLHGe55M2ggBZZUZZhwiiWTSSipuDy2vjvhXiAv/XawWCqs
         FBPMQLwplDrE70OJDLWwvMMB5uipw9n5KK8aGEwIcFJiBspG4g4pRo0O2+YUZkLEfEJB
         I8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339821; x=1788944621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkZZkC4gsq97UcRVGWrKmuFIoNEN9InKHcyGDJRFeaM=;
        b=Y0At/Zh6gguVF274tk6uRVAKAjlpxsnPWP/LdiewUANlIy0z6w+iHb3rkXzsGVsm67
         OC/TRAPAN760CE9UBSpKZp0qPwQxS3zjXk0IkKo2SRjwfRPrnAuenc/jOe1tchvuGn3X
         fSWn+Xh0zk4H1ZrwoTa+Iw8/EEF87HS0n62gbjaqOMKpP+uirQJrd0zfp7/y7Vt7i/VX
         usPi5c1qwv1cXB9TwlWbfqBx3DmFMSxaBXHPbEhwEbBgArEYFCd3fE1u5bmsXdNwB77h
         y7R2b0QCp0gbRGKBMWIVqICYB/6uEaTq2XxrMpswI9KEtrVMoc/MvNJ3mSXNxfwjdAQV
         loIA==
X-Forwarded-Encrypted: i=1; AKwUvBwfp5WSfTY9WVOtW1GuQbfGRQcR1wAI6lLU/8SLhaBI6psMFjlPYpaM/5kU84ne6BNq81nG2zbJe7H/8PE=@vger.kernel.org
X-Gm-Message-State: AFuF++mxA2DIb2+yPTZpKIvVQAu4t3if26xq64UNl18DEa+z3UMLQ5Os
	Rhg9lJ2MAr4KWtE83qpm+3ez/3MeOpgFX4STlFdg8cA6hUL+9Seh2Eq48mVxQiF3JN4aY6iW784
	nUZT+YveTw2KTOFQ17833gIPDo5oj8Br2uhIUpZq0
X-Gm-Gg: AYBFou0tV58QUq6d8A/mQteMv/n9ISLyG8/YDHph0WCehxOjifTudX/DZXr7Eh5RPJZ
	/+vpGmBuZIY0dPn5ei2dnWad3eDLJk3UL2SRB4ov8VeK8yAvFwvj2P/qZrN0iPYT8vevgukeatr
	kZZfX/tGhGVlVCJsdOsIRcv7/OSpeZ7fnzz1WlZ69zzi0HEzXH6sJgI8qCTLMsMzU5Hg6VLs88z
	HotMJ52E/8qXFKFj8WZ8MO/WskFrv94sL97cx77HjzeE1r1nvOTKkcUSptJD5DNIXR8Wa00+AhH
	VQlE+aE9AMbnvMBAY7K3UUm8cztncNZmuIGv1PydiF0kMVU/II8qellQK+8QRBwSTNRxBhpanw=
	=
X-Received: by 2002:a05:6102:6441:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-78a1f2e063amr916613137.8.1788339820556; Wed, 02 Sep 2026
 02:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902085643.16309-1-liujing@cmss.chinamobile.com>
In-Reply-To: <20260902085643.16309-1-liujing@cmss.chinamobile.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Sep 2026 11:03:02 +0200
X-Gm-Features: AcwNN1VVJDdJtpLVkG9nJXNGJaL4XfWXPCp1y0Sa0aj4Ivq1HDRBY3Bb76Pb24Y
Message-ID: <CAG_fn=WbSdcf9Qj=15df=P-b+ZjugRZ5-sdeYePFwkMpBfc0TQ@mail.gmail.com>
Subject: Re: [PATCH] kmsan: test: check vmalloc return value before use
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: elver@google.com, dvyukov@google.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:56=E2=80=AFAM Liu Jing <liujing@cmss.chinamobile.=
com> wrote:
>
> In test_init_vmalloc(), the return value of vmalloc() is used directly
> without a NULL check. If vmalloc() fails under memory pressure, the
> subsequent buf[0] =3D 1 and memset() calls will dereference a NULL
> pointer and cause a kernel panic.

Out of curiosity, have you actually observed vmalloc() failing under
memory pressure during this test?

> Add a NULL check immediately after vmalloc() and skip the test if
> allocation fails.
>
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
>  mm/kmsan/kmsan_test.c | 6 ++++++
>  1 file changed, 6 insertion(+), 0 deletion(-)
>
> --- a/mm/kmsan/kmsan_test.c
> +++ b/mm/kmsan/kmsan_test.c
> @@ -352,6 +352,12 @@
>
>         kunit_info(test, "vmalloc buffer can be initialized (no reports)\=
n");
>         buf =3D vmalloc(PAGE_SIZE * npages);
> +
> +       if (!buf) {
> +               kunit_skip(test, "vmalloc failed, skipping test\n");
> +               return;
> +       }

While at it, can you add similar checks to other allocation sites in this f=
ile?
The problem is not specific to vmalloc()

>         buf[0] =3D 1;
>         memset(buf, 0xfe, PAGE_SIZE * npages);
>         USE(buf[0]);
>
> --
> 2.43.0
>
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
