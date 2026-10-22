Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661033;
	b=EBVIY1tY0DSOpHHTjj5+tW/2rhQWlchz8L3UsbYexzA87FVadAPFa7/yo2WpXY+8cXMM
	 l3dhqNqCPxj9Pa/09gMlCt8RaITDlm5qBUhh2CYSzE9YS1l1ZWtAU5r7SsD2tvaRdURCg
	 5DjxvypJuaQO4m01vUPfPH+KBwwr+HtXLze6x9+cYvw9W6Aa4NC25XiAsRKlaZuk0TgHH
	 puXeeHDg/W8V53cuMC+qwJcvfnLw6IO9+sN3pRjvcQGmGAX/OtXitFE5MLNzaXdtFBQOq
	 Fpplr8ty7wngfErATnFqh393jJn1HCC/NqvECuWBXW2SsReO8AyHzEyUi4oDJrhdFVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661033;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gkhBBRoKjdMjfG0Ulhfds5pPtjNKOakoMGJLQPu1F7U=;
	b=VGNiIToDbYPglBSxhNLIlhCNohUYt6TEmxD/+VzbhF8l6UAw34+b8HtPOYEcrqL0ypCg
	 4eRrhcGH9dWIhcU/18TvTTYLjoUkF+ZKdket//Ox072CTvxuHHG84T/6ss//MJqKxO5ks
	 1ZyX8QwjFCCyzfvXuf9+wqbEHQPZF+ojmyAWYnAj02vEE34TcQRP/S2H4Hg0K2o1q5FcD
	 H1qRnDBJTeQ1Hb30mrAA1BMPLUCL87+nynbGwoV+pl8WYBKlxMzGa+ZdUaoF/hPq7jXFe
	 KiIoI3/u8qcBSzoxf2GNcMtMnp4wtrZdpexCMSMyYkpBhtIoESViqUGgLhqkNR3clww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858D8606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so630667e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661031; x=1793265831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gkhBBRoKjdMjfG0Ulhfds5pPtjNKOakoMGJLQPu1F7U=;
        b=CGBTEfziQmZxaRYSyxG2r32ZFa8LgTYiRgW4y3Cq9pr+BN2TexO0DSpRDvnfl8+Hyq
         jsoRCaGLpkFNk9wQxpG2WAddKZ/zSHDtX/EvpBULlMTiwyjR3BWMwUdy2ehzvr6k7/kK
         OgMI74i7aBBK61krqXuRx8wSWs6ZQ9/gq+qVxjNKTtuyt9Otqa2aTA9gQT4O7fSK+kid
         Cy5aaZhA7jesA9+PhksL8CfhbazxvoI+qV5B3ayKvoNH7DZJE7S/TM6NyQLMAgUNs+SU
         tZNN4UfyfBMrB2D2vcYPw9Kfnv6STvalmkJA7tM+MMnFhxPYMDLCbFnKl4cRCkin+mBj
         hFiw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ9+pQulCejgm2olBinkCuLQewuobU6G5drs7dgjuKqEgQDhsMcWcjAVZV/Jyd3AX0HfT46HAjKDqsUr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF5ZsWIAfRgxlhiFNmFmd3SmNrfnIMG6IGKQHgMQlKgMxr10lw
	cpdW2Ikvxzg2nJHlJ/CfcZt4z+ofZgkzVxrHgXZ5CFqvBG8WUJ7+VcgAenoZpmcK
X-Gm-Gg: AYBFou27BCXy2EaN3IMdBnqjnSrr60lQbkE96SXHEAxo86NnNn2wIQtfzEBru8VlrWk
	epL7BnWPxfFbKct8cIkh6FUn5x0DKlV2latGxCencM5V00tBtIw5wikRbYE19wf+yrlmROhy5UV
	C58u4XV6+Ortq72U31xZFLMjEYHVdH3aAqcWM8H9lU9LX7cwfe6MBX0mt4xWO7Nj7UvCvLGHNk4
	noduvLF0Aihf4/3hA3XToALdeBfpUqUXfpOd5aUUhC3giPuUM8UgWI/BCDC8mfDXCSsVe3W+ANj
	6eEXFXyp0KPh3OVjMN1aofr9gH9Colat4QFjXttP+o65mP5uoN/wtNFxbcRcx8ZrJPYleOJE023
	Rf8ZouNIfDamZi/UXA6wJDmmSC7kjbtYxja4xvzutE87dXPQcme7q2xRRXwCJQyLjAI67dgvc+Y
	G6kFzeCYYKBO9WLhZbjwxtHJcFJqRl2BwDBsj1fw+/h+91c1UDOdTW0EQZhDHuTv5bSDv5X2/tA
	7lZ77Pi6a0QV1ryIjgSBUUY+7SZqV1XK3r1kgN6+3oSZra2R53O6ghZW6XDy9JXzNB38M3eLQ0z
	cjI/EnWmL43ShWWBDg==
X-Received: by 2002:a05:6122:180e:b0:5ea:c984:5ad4 with SMTP id 71dfb90a1353d-5eafa330f88mr589989e0c.2.1792661031573;
        Thu, 22 Oct 2026 02:23:51 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97be404sm6208704e0c.7.2026.10.22.02.23.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:23:50 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so566201137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2XVvB5Cu/TprrbB7dcKEpwDf11DKVVTsqRjSg/EIPj7geA6wdPLF8yMXV1EvgO+dlDYaP7edCQRS6bUg=@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:7b1:3ecd:3d8d with SMTP id
 ada2fe7eead31-7cca9a1a007mr483763137.7.1792661030261; Thu, 22 Oct 2026
 02:23:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021235818.3059519-1-briannorris@chromium.org> <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
In-Reply-To: <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 11:23:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNuVOnn9KwYuRm5TYsMEf362V_4fSwQGp3fOfR_i7jkg@mail.gmail.com>
X-Gm-Features: AclHuK9DeixcMDu5pJYEJIO6mwWZklXvy1cHSqlxPpUgEBM8a99XYlxTEG_tKGQ
Message-ID: <CAMuHMdWNuVOnn9KwYuRm5TYsMEf362V_4fSwQGp3fOfR_i7jkg@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] iio: adc: rcar-gyroadc: Discard
 pm_runtime_put_autosuspend() return values
To: Brian Norris <briannorris@chromium.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 02:01, Brian Norris <briannorris@chromium.org> wrote:
> This driver propagates the return value of pm_runtime_put_autosuspend(),
> which is not particularly useful.
>
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.
>
> For this reason, modify this driver to simply discard the
> pm_runtime_put_autosuspend() return value.
>
> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
