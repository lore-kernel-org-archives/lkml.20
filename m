Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E7C316199
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796993; cv=pass; b=R90uNonObYUT+S9XSW2DRCzLnlYecO5moFrH+ZsowVIQ5WkNjNe0rOUErGdKjCeyEQSjOJHxhGBkPN6j8cUN2joPDZ1scO7Ux/rOZoLUcvOj+ZYW/GI6iNatyHFJTvEpOIQAdUfwPFYqvS+5TOrU4as/hCwYJmCLZAYtJmIb49U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796993; c=relaxed/simple;
	bh=ll0F4+vG9+cFqrbPEv9fSbXH66s1+84h5qNxoLkrJMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IniDO4Z49XKoUXNpyUXURWqpDgUN07qN1TzpgqZev8JGkb96ntlwbRvR10AN1v0vSxEPHVCWDZ2fvjRT3nqKWU6COxEN7AXKk2bEMKJKR8fmQCKbLQpO+3IAMaXF1jeBYP6t4ms2v5jcHtJBc2ZJc9l/NX7M4AVMd1L5jneURBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqwNlNjU; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqwNlNjU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso14413601fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796990; cv=none;
        d=google.com; s=arc-20260327;
        b=UcQgnisaz5ljhjNLcRJ42wRvrfGHzyE2St4H7ZMJJGKp/6IExFyQAX5pJZAQguqkZ3
         zzhxrkRNW+s6OkLOmwh3uRLx5aZhjq728cZ4m7Z+ewWMVREManaznHpBj+SVIxK7X7TP
         gdYVtXvnWE0bJWA47eaGhTMlFVHBBLhHDHmkWXzAcQyX+oNL1daKiuU94lPoXqy1xabO
         6gM9UpyJoWVpyQgjoOoNl4Gv5acmWdrwiTIRAn6sx6+0XK6odn+v1jnm+g1jDq0fsMcK
         ThKFoYHrfzxgK5perK24f9hfCU666ttuNOSdpLwsuQoHmItIuM4ZhXIfzHse5QZOaaqa
         6tYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        fh=dTYiKdZnxVk8DjiL5PY9gNqdq7s4YOMRqxRP+/wS0NI=;
        b=YS0Fk81ZKpUbqcX/qlOChe+fZ9Zy94ikKyolYssIF7/ckwJj15EQF8ggJSp0Qp+3id
         8uAQkFzrT3gnawI+iTLrAnV9c0TMWX3doBwG7pI6EVTb2m4o4CycNYwzc5LLnqBPTX88
         HUz3GUnzUivsPXpD6c80uSZFGUONqw3YvZQClFfzpBDevZvUYOi7ha/K3bPg1YrbKsSs
         NSwVjXAAtgE7OhRXinj85vQQXC4Ul4k3+XUs7pJaAmbRVil8UMqA2bFlEF2gn+rH2niA
         0PJk9S90oisNq37AfvrxYFD8jpPLNL+CzSpddPEWkBYwciNwsj2++EwC0jvl1qLzvxlU
         DDKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796990; x=1792401790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=EqwNlNjU7RB2xdPdWA/AnpA4UvV17uy+EdMlAzKO/PZPrMPNqSPlSI85yTJwzaP9Pr
         96KpdkNgFe8giqc5U04Ozbnovk52gX/ZF3eQIXbjCGiQix81SpvDQHlrDAv0Z54H7JEn
         4VCU80SIGOcr3ovd3tFr2/wZ1dtL7wxVrMQJEt0OqQkiBaVNV8Uz6NYHa7emVVPwm4l3
         UhcRyYvChDslLuC0u5J3EtgSgZoHoyn7xAGM7bTmhO96Lc7nM0ZvmhtRGmxE0qm5Gwo/
         K4WZEOfQbI5x4MrEuAvJ7a5hdQ6qsUU+UrEkA4j+ERyptGWryyOWfjazT90zmXgleS21
         QUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796990; x=1792401790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=Lfw3DLCrH/t6JxEniWYAKhoxq6dx14nv8M6CECFYKOEos5cNq40vyeX+oZaH5GtGz1
         HLPXzn/FdMyCqm/iXtC/AOuV1jW1mbuj33sa6uxB/hKfXrtQfTq7nPLYhkbMDuAGQIS6
         TJYkeT2fLLN7v6h4MOsqgvUNG3RJc+/dJShZ+Wb/i9YsVsLI4tn9C6mnqOcgtaFvUXWH
         qCvn2eY6curxjyp8fsXeN1iHfqn7J4FOv95wNT2AZIRK+U6BbThpBxD/LYINsaOn2hdc
         jAZ9w2z1qYQzsFGW9GlOB0CeSD70+6cFjNIr7VlQ03N2KpGxVremh6LxYD21IL1uZJdb
         tRvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqXiFihotzzGNbcblvjzkUtCbSblHCqqh2q6UkLAKo/GPG7KZ4ypOjbqvt8PmtB8medZ0YgVagyEu93sA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzpv9kEqFmCAaxKxuRVQrQBjlVAsg3xDySS7tIJ6pOUoMO2Jij
	AtLUVDA0o5/vzXFyZP5I/69tSb2rEGaSCp8yt+lt4TWqdIJqLN2q8U0fJxf/d5HWpSzqF4jR5NX
	RdO2VbxwbIsGJhDT+LO2Z9jh659Tio6k=
X-Gm-Gg: AYBFou1xaOETtMahxOb1rZoTjKjAUCGG8YVpfg2EPaFGp41t/mNRT9qi8sYTnQbNbCE
	eXoAUqkLFWh9YuPBRRre2lwjpxtc6WRNI1jAWBDVMin798ek4JEnrxyE1T1ZZrFbWpRVDDwC3Mk
	vAv5Vdl2JJexpYFHfocMAnySNUFNSdKHyUEHyjHcAxaKRtTFthick1EmEO8lpij8SccxlOBQwjM
	Dbw6Oi5QQQo5EIYzmvEFIBGSGKaIjhGhB1TKoyJSSMItJ2mdFxX0vwKEM3nxX3K0Wrwn/W3S/n/
	9HVy8YIGZJRzrPxnDRDcfzZSNRysMiO3zdQuocKx6Y01aFTra6ByEpkKFW8gt0RmFQKTvl4TqwW
	y0Xn3HxsudDaVHm+rGGKgmpdH/BN1sjwQwEF81LgJLyBCOLdqGZuoAJWHeOdfNSnPY0VIcsFXEN
	TwS2BTTJqZ0od1QCwEovvMp9W11vYri+2FFQtebt8dNz4kJE6cdSc=
X-Received: by 2002:a2e:a99e:0:b0:3a6:5b2b:c50e with SMTP id
 38308e7fff4ca-3a9c539af0cmr21768881fa.4.1791796990083; Mon, 12 Oct 2026
 02:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com> <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
In-Reply-To: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:22:33 +0300
X-Gm-Features: AclHuK8GqFu8wnVI0Mxk9MM920njTXHSZpz9wCgu1uvRmpNlSfdJXJ1wA6pAW-o
Message-ID: <CAHp75VfJu3mWgfBrKiiw59mVCCJOGEHZ-CCjtORV_CvfS4PjRQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > The threaded IRQ queues assert_recovery_work, which can stop, reset and
> > restart CSS. Removal currently tears down CSS and the CPU latency QoS
> > request while recovery can still be running.
> >
> > Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> > available until recovery finishes. Then release the IRQ before CSS and
> > firmware teardown. Apply the same ordering on probe failure, and skip
> > the uninitialized recovery work in PM-only mode.
> >
> > This issue was found by static analysis.
>
> Nice, have you read the code that you sent?

Next time, please also test this on real HW.

...

> >  error_unload_firmware:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         atomisp_pm_uninit(isp);
> > +       devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >         ia_css_unload_firmware();
> > +       goto error_unregister_entities;
> >  error_free_irq:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >  error_unregister_entities:
> >         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
