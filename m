Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15B3B6BFD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459481; cv=none; b=bre27CKFboeGOc9IG6Ji4LFFQdlKLpaoUsux+IhEGRYweXqKfO6QsnyFDj/OKl0JPnPiQZbLezZhy/Lw8JJF9/e8xPiCK8F9ITcNZrwGjmq6GCCAa3FJaRqHaL8ijhtbhIc6ceIwyqroJIK1/mq5prWlA+H7f3YmeHVt/uw8xik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459481; c=relaxed/simple;
	bh=MrgS91ShigTmW6eO46xSubcaE3kR1feFb31hbEANW+E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW/HMi2ckCXhsdVJx9rsMNqhdVh++g6Zw+9Cu2Q6hNCOrU45ExZ7lz32iY21pxcmhepjozENgO/AOZp26rFUbFNUJd7d5rF9LDJPuj8Um7YHvb/mNu1Gk0WHuFlf5TjtTQoVYjwDeMqn9B4aS0Neh8yYERU6sa8etqrAItzu3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ionagze+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ionagze+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A081F0089C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789459479;
	bh=rsG00H3X29c/2KMDCujSblcz4vgqgpQDzlk45QaDBZc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ionagze+rDB8EyNkY8VHTNtJMcsROcNXHMeukzeG0xymUV+zRFL/CvraJSSX6rpmj
	 rjI6lGa7ZRBH1VPxMrSeZvNCGxc1Qh08m2XcFEQTHfDIJYfh94hc++tH2yJW/8hZmL
	 OYpshaUQMQhqOkUkx029RmOw4gyD4sduVpQXuLwR9LWPW9NOYN+Za7sVtwESrGtL/E
	 v6lrx8S4/vwGCCv+9BWfCr7T9ES3gy352El+KXafwpAtcoJNYBmcLIKJ9ZEaG6Oq0d
	 tad3PwnKgzXhr4d/mmt2fUNHyckrNkfgeeip2hziLYICBeOnCMUu5JzAY7ffWNTPdM
	 MG11fv0q7YjrQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so8461e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxM/nvGNtIcZ7vXg33olxG/4/wP84/5wfdAOMgdpqJxSxSAUpDyZ98uvwAMfqSZZVNuP/1Szurbp4WxWN4=@vger.kernel.org
X-Gm-Message-State: AFuF++mrWnyFtm0c3f881vcpKQBmlB7t2ywCKczzV4txGPTGeOZB4mJQ
	68YEz9lSHy0QQojlXaJiI62iUZXqEX+Iv1nmBO1pgCkTYClZTOuiuiyd+zzAD1a5KGHcJC10xF0
	3ECj6giq3KS10lY0wRzJARJfY65ycVlgcLHm6RBy+YA==
X-Received: by 2002:a05:651c:a382:10b0:3a3:a3:3560 with SMTP id
 38308e7fff4ca-3a5d836a18dmr196901fa.6.1789459478071; Tue, 15 Sep 2026
 01:04:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 03:04:37 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 03:04:37 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915051948.1727882-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915051948.1727882-1-vulab@iscas.ac.cn>
Date: Tue, 15 Sep 2026 03:04:37 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
X-Gm-Features: AcwNN1XW7NfnANW-I2Zs8w7V-vdvlDVqSq069SE8R4u2kbHCng7fsug6QCK_Y7Y
Message-ID: <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
Subject: Re: [PATCH 4/6] clocksource/drivers/davinci: Fix clock reference leak
 in of_davinci_timer_register
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: daniel.lezcano@kernel.org, linux-kernel@vger.kernel.org, tglx@kernel.org, 
	lkml@vger.kernel.org, stable@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 07:19:48 +0200, Wentao Liang <vulab@iscas.ac.cn> said:
> of_davinci_timer_register() looks up the timer clock with of_clk_get(),
> which takes a reference on the clock, and passes it to
> davinci_timer_register(). That function enables the clock and keeps it
> enabled for the lifetime of the timer, but it never takes ownership of
> the reference and never calls clk_put(); only the error paths of
> of_davinci_timer_register() dropped the reference, so on success the
> reference obtained by of_clk_get() leaked.
>
> Drop the reference unconditionally after davinci_timer_register()
> returns: on failure the clock has already been disabled and unprepared
> by davinci_timer_register(), and on success the clock stays enabled
> while the consumer reference is released.
>
> Fixes: 721154f972aa ("clocksource/drivers/davinci: Add support for clockevents")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/clocksource/timer-davinci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> index 16ee0687ef31..54700738fcd4 100644
> --- a/drivers/clocksource/timer-davinci.c
> +++ b/drivers/clocksource/timer-davinci.c
> @@ -376,8 +376,11 @@ static int __init of_davinci_timer_register(struct device_node *np)
>  	}
>
>  	rv = davinci_timer_register(clk, &timer_cfg);
> -	if (rv)
> -		clk_put(clk);
> +	/*
> +	 * The clock is left enabled on success, but the consumer reference
> +	 * taken by of_clk_get() is not needed anymore in either case.
> +	 */
> +	clk_put(clk);
>
>  	return rv;
>  }

I'm not following. If we keep the clock enabled, we must keep the reference. We
just never disable it anywhere, so you correctly don't see the clk_put() in
success path.

Bart
