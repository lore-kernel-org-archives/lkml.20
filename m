Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEC3CEBBD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120476; cv=pass; b=VTg97ATDTOR4G+mDW/zkDjcjtGBimYXCXtenynsD2m4TX2ItKHNNyeN7Pa2SlRij5XhMD2tSedpZKoG/FLH9oynUsjhg0FfFwK5qMTGLCOzXsVoK/H8+x6AqwLOTo4oAg4j8LYx9WdiBjQxo7iBA3OWiTSaPzRCIVJtL/YzZHxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120476; c=relaxed/simple;
	bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgpdVjO5rVFaWE11DVmkYUp9wSXN4SKd1dZyObeW03FP475YMkU9Q5M5j82lyTyIv8FDcuvN7N5UyQETLxbZt4pe5tGDD3Ab3V51SA76aPkZZ8rUR6nAraaGg3QVYkIkRSUmhGOlDoZfhIzKZ6YykZgnHdny0K4tL6c5Ko8HuCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RStG1qwx; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RStG1qwx"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f4f53975e6so794702a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789120474; cv=none;
        d=google.com; s=arc-20260327;
        b=VCtXMyApPYTH0IQCNjV20qVUL1jgVzPs90DQkDBVbOtCG6y+Pa72SDVuA8wFq2Yo0Y
         UlsFVnL+NmprMpaFCwv7orDRlMMcvlO7ugdVJbNG9glD0qAqER+HZvJghJSqDurMRIpw
         c8MLydvKbesw6iFqaBJV687c6FkGFBU8xQtViUP/ATmZrnccgo5U1xRm2YzkmrlmUnkW
         ZYeaFi2qf9AA4TD004r56FyXTKnSuHaDwDZPygmim/4BtNvyYW0u/R//lqhwOh9MtXxI
         U32D5Rkr7fuEobyQSE9I7kgQHcJ28POT09TbiA4Wu30eJF+r8gQ/u2J7rN/PdSkIsJRn
         tZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        fh=IiWdqz7ycgM7LPy5JN/rEDyeG02486pqDEaekz0Y4AI=;
        b=fnqSb/jsfoqlJxDWcbKKZZUVx+5zyLr9E6PquT11w9cf8PimgC1+1gkoodaJCvOZsJ
         5YQnzYifKTu0mxrVnBeSx7/1CwswCj1VMloYGRedlKdDa8zx43znd79AO+dZimOXpsiv
         ITwcIQbH9ACqyHGS/5VhqMXt9JEKGLzyk8o+cPCOnv45X6K0t/wcNrwL3sgOjcUtf/AR
         hr7U5e9HdjdtyardWu8Ux/kyLsVQIHLqh2H1HSRCc6hQT3dDz+MkUPEnvihCmw44YsTy
         c/bc+EZrviRkFncRj8sgknszC5OxI69AzPPcYk0Svpuw++N7sYhcOUk44lecF3jKFCLo
         Myrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789120474; x=1789725274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        b=RStG1qwxGVgK/4N9ZBGWVzVbKICczvDyu85Ctz3aG8c+go527GpD/ZAaUOcJ4Ye9H4
         15XeChf2kr6dnPUJza7Svd5cV4f27OH+h/O0aDV3iF15s+kjSRM09wj4JANeHkbYx/lg
         31qrF1zinkFtqPhrEik7w0u4UuDEHTIcU4ERWpXAdiLDE2+XgSpC+pxPL5QAwcGwLE9+
         fnEd3yv66ZaqPj+NcfArCduHqrk5t7TGym7j5JVHNWJNvbVvZREJCbIPdD1UKxwm7sU+
         P/wyjLEA5Q/LfX4mzwWNbQaDxoo7NGqbQQMSKoWPda8cG9z5mWDYuztrQdnvl/7pbFgE
         2a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120474; x=1789725274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        b=bIy5YehegqEVKhay2tdNIdpbWJX1nkQ3wMzeSvZtW3cQp2s/6EYf9a4N7Hydf3U5hu
         P7gE7YtkTLNypIKQdtATobJmWkAx4RYoOTk2n2OMpSGWdu6R9LzdaggoQZJSNCGK/1FD
         6ZaOTNIl7y8pZULQ53t15PcBtjebewK4UgdxC1OWw4ltc486BZrcr8jalxufmdCEOGD5
         6KO1qKdWhTkUtnv+CfL3AAA2fCPf4Q5vSOp5dtl6sGSDrUOih1iJS/AMysHT8ywksmn7
         mJflHxiPoGODTYE2nXfGEzcU9PtVfNDaTLltcB9lrDHCFW6AJYXf6OOQABY1l7z/m7NM
         TXcg==
X-Forwarded-Encrypted: i=1; AKwUvBydyksDcTtPFFak7GybYYUbb7TWRna4miNkI67jj/IwHQp4Wat2LSvSpQc9X1GUiW9vrrBsYfky0oiYNAE=@vger.kernel.org
X-Gm-Message-State: AFuF++lCMV4LdPxoEu+xqGW3Fcu9GtB1+0jFHX2VTYoWlyMQ47ya6BUv
	ClsDCHfo0s/jZT1WnOEpeA4OkVNP44yjN3ekNQQ7jrhZp3ji9H2rh5aaippCBohDdD4U5SkiEgq
	v4mKRlyX60J7IGOklgQYK3vnck6mJy9FgJqHfrJvH
X-Gm-Gg: AYBFou1ld8xqxO3iWB73HSbFIQvT006pnDtnR+VSxAGx6DjCHiSbGomCSMzZOC5JzFj
	1ZAJmE+bTtnObkT1BBfv056GIAwWMdDG6rZMZzUCeSNRI3MtKctSPocKYKUHy62nqEFvtzoiwGI
	UG/OXuA+k8XlF/8nFf+vjIzBVL4tEcMqmI9PyxVKvTWPOkSRZy+GKAy6gQkHbLtHMYoPN0wTiOZ
	sLNz6N+5Gw8VIF5dxKacFmhyN1doWQX4d3I2bsu5C7rF8O2cpZf9cathLGBl/obx27SeZQFiZFc
	hOaY9R5ixH/DejxWUYDMOznPN7c+OxNME2utkdxmOhLfr6C7Hp7/FO/9q7hY33NweI8ZosHPYkA
	wZIbLwUTtLGFI26vo6J6zT+7y/uWh93PuFn7hN+s3MxuxH10k23o8xiuRmKo6yt8EI0y/mXPK0u
	HyQoUGROrSvvBQWOCLYxI+wjgP
X-Received: by 2002:a05:6830:f98:b0:800:d883:9988 with SMTP id
 46e09a7af769-803fb6cb448mr2828620a34.0.1789120473081; Fri, 11 Sep 2026
 02:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com> <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
 <20260905104331.6d4288df.michal.pecio@gmail.com> <2026090536-numbness-enlisted-917e@gregkh>
 <20260906123835.56902ed7.michal.pecio@gmail.com> <CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
 <20260907102252.6eff5c54.michal.pecio@gmail.com>
In-Reply-To: <20260907102252.6eff5c54.michal.pecio@gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 11 Sep 2026 11:54:21 +0200
X-Gm-Features: AcwNN1U9QqScehaKOEShCisWyOXNyJs7MHAC8Id3_uKnwcGvz7UQHjUestEfjCk
Message-ID: <CANp29Y66ZREv=wr6PWBt-KORVJ+BdinM8J1B+RC_QoCzy1s1Ng@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>, i@zenithal.me, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 10:22=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Mon, 7 Sep 2026 09:59:36 +0200, Aleksandr Nogikh wrote:
> > On Sun, Sep 6, 2026 at 12:38=E2=80=AFPM Michal Pecio <michal.pecio@gmai=
l.com> wrote:
> > >
> > > On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote:
< .. >

> > > >
> > > > That will taint the kernel in newer releases, and syzbot has alread=
y
> > > > been told not to do this, it's not "valid" at all.
> > >
> > > What cought my attention is that Google apparently has some capabilit=
y
> > > (human, machine or otherwise) to understand how this repro works, and
> > > yet they keep reporting this broken pattern.
> >
> > As Greg pointed out, we've adjusted the fuzzer to stop using this
> > kernel interface, so there should be no new bugs of this type.
> > However, we haven't yet invalidated all such reported bugs, so some
> > notifications like this one may still leak. I'll look into
> > mass-invalidation of them all, but in the meanwhile let's close this
> > particular one:
> >
> > #syz invalid
>
> Thanks, that should do it.
>
> Nota bene, this can be triggered not only by the per-device
> 'driver_override' files, but also the per-driver 'new_id'. While
> I haven't yet seen your syzbot instance using the latter, I have
> seen others, so this needs to be filtered too.

Thanks for the suggestion!
I've looked through the open bugs, and none of them seems to be using
new_id indeed, but I've sent a fix to prohibit that just in case:
https://github.com/google/syzkaller/pull/7888.

Please feel free to ping us if you notice any similar false positives.

--=20
Aleksandr

>
> Regards,
> Michal
