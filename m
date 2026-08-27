Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0DD46EF94
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836165; cv=none; b=OdESsEy+Sv6zIboSwLPmlQQxUFJuLIOSZbDKf96dmdGRvHDzQXkiqrvqzn3g4jpfqQsZWW8ZEF8BCG3j2PeEsx/shm9vSDejY+KkqaPqbjAMUmN+iUjZ10Ab4bTyBwH/4kdjAsQ21E0IfQjX2+f1ToD1tgc9ez7XUYTUa5jnLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836165; c=relaxed/simple;
	bh=dqLzRTCo+L0EQjgbjzQjQe0D7hZOV3ykAmOsZdQxIfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6+uhDWb6uTmvYFhiIR92j+1enYsxREKN7Yy49nrwbVfEqws99t8DrZLmE996jNoIMBcuIJ7+Sl1giBle+K6ywy2AAaeq+y8drnTVa6a1zUqq46HUlgfvQeVcgWGRK5Z1drsO3YG2f/ZYi7aLME+mnjrYUhFH/nvvypY05DeOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4679f619d3bso314981fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836152; x=1788440952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WzKYk3/+V+rOzh1rTxaW+egKeE53pqTO5dJe7JNkRn4=;
        b=hBkBYXLjnWBDBwS5fZmdn1XbkpIOCWEfAZWu4oKJCqokVhvN0MFf8TmV0T34+hj1oK
         Ct4LS6a5B9Nws+Z5MiEy17N2nmI/qSlWilSNnanuT/rQPpxgbtzr2RnBgOKTguNQ8ol7
         Wx0gIfuLGdtTbA4k49LbZeGXGL3eYcN2RM4uOEfx/rbgQFdb5WyZ69FbRJMFdXHwdn+c
         DEFg+A5PT8n9ENuzp+Ncow/4CNWnUJH+Kln6CMlcMWmX2rbjKGI1pRAv6urCIr617BMg
         DbBNgRLfJJFtv488xT2CeOmaRimx8oxl5xl4RICrMI3cj11hNYMdycTgSx7euqh4X2qz
         t6TA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1nR5A+qcawcOhtQN0WIw2lUrTQ7K07/X/YJd7S/4YS0ANtZwvsVqMNoebBoQj0ch6PVk+/V1Xy1PRpXk=@vger.kernel.org
X-Gm-Message-State: AFuF++mdl9EbdrNyyHGtDy19avWU6C3qhe8y23LPsqlviSZrCYMBMDwd
	XHa1gNQ5e/ddEEYC7JYI/CigadC/6hke7zPLD7KmgdxMlN5a+gGcKGI41RthYJvk
X-Gm-Gg: AR+sD11XuKN3cKPiW6WiCl/n9J8sP8A4kYzxVR3MMio8Fuxlsljnvoc4f3OSxptqgtg
	7ssf2jErcE76PNbSrqXw73EsF1uAVj3cvsn4fMCO4iRUraPFz5GzZDD5zvpWtbu0iDLo3rcnypS
	+prBp29c+tRZUZF25lR5HwYPxU4nykuvgK1vWs+cxOa+genldNI1OLuK5ZpS0947twKy2VqJC97
	a8P+uT8oU/sXF0Xms+TszNcVTZSoerH+hZsk8rYxTELgu86mzCyIzEYyNdf9Tu3fTq3WzBQKr+B
	jfNEIg8/f2Vw8NeohpoE4Laql7rsaJl9TdfN89P/bkAeIKAPtIU9rZxBvHXKo5QXULH7ftqh+Cm
	CYSY38E7gU1TlSCZhSlrAvTzXR2Gjd1Wb9jlkq0N48IaUZQz88uRjw0z5SazcWR7Jv3L6Dmjf/S
	RrInNkDS5N0HpHHpeSTg2PYXMi8SsuMJv8IPs83q3jechmxdDWEr9VkjEjcqs1PWa9vB6d+dIW1
	UMFz0Jz2oKSGK6eJsWyrWENrQ==
X-Received: by 2002:a05:6870:65a4:b0:448:c6ce:9617 with SMTP id 586e51a60fabf-465996feb6emr15310776fac.5.1787836152114;
        Thu, 27 Aug 2026 06:09:12 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-467366b6351sm1920240fac.7.2026.08.27.06.09.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:09:11 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-448b69cfc6dso2338529fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruJSLFG0FA9MV0jBDDOa8/0l1itUN0kbcZ9Yj2cy35s5DIa3gECWk6Lj6d1Q5FhbKE6ehXXKcCIgHdqLk=@vger.kernel.org
X-Received: by 2002:a05:6102:8499:10b0:782:e392:2ba6 with SMTP id
 ada2fe7eead31-782e392308fmr3427230137.9.1787835823964; Thu, 27 Aug 2026
 06:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f2Kf9GYn1lKR5S1dbvGVtykMxK1RlgP5z8sW@bugs.sh>
In-Reply-To: <f2Kf9GYn1lKR5S1dbvGVtykMxK1RlgP5z8sW@bugs.sh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 15:03:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPF3vzpTQWWJvjPmrHahXcdo_USyWX+LxK9bHppuc1tQ@mail.gmail.com>
X-Gm-Features: AcwNN1X2bkBw8SIWU4yTCrO5AX2qiaKB8yFkpoNbbPhB8bGMcoiC2Ojl7dqCiOA
Message-ID: <CAMuHMdUPF3vzpTQWWJvjPmrHahXcdo_USyWX+LxK9bHppuc1tQ@mail.gmail.com>
Subject: Re: [BUG] drivers/video: use-after-free in _copy_to_user()
To: co <co+c25629c98ba36ebe@bugs.sh>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Petr Mladek <pmladek@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Song Liu <song@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Oleg Nesterov <oleg@redhat.com>, Andrea Righi <righi.andrea@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Co,

On Thu, 27 Aug 2026 at 14:43, co <co+c25629c98ba36ebe@bugs.sh> wrote:
> We found a bug reachable in:
>
>     path    drivers/video/fbdev/core/fb_chrdev.c`, `drivers/video/fbdev/core
>     crash   use-after-free in _copy_to_user()
>     commit  843bc34db94b
>
> Config, environment, the sanitizer report and a C reproducer follow.
>
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
>
> Reported-by: co+c25629c98ba36ebe@bugs.sh
>
>     Everything in this mail is validated by the reproducer below.
>
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
>
>         patch.diff  https://bugs.sh/b/c25629c98ba36ebe/patch.diff
>         report.md   https://bugs.sh/b/c25629c98ba36ebe/report.md

Thanks for your patch, but both links are almost empty:

    No artifacts published for c25629c98ba36ebe yet.
    Request them from co@bugs.sh, quoting the bug id.

>     This is an open science project. The code and the full set of PoCs
>     are not public at this moment, as we intend to disclose our findings
>     in an ethical way.

Please read Documentation/process/submitting-patches.rst

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
