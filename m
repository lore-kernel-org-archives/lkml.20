Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F53A16AE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979171; cv=none; b=ky3ZbVQ2M7ZqrFLpuHMKoTU1Jh+2sUeDXUSdjdbqOaGlVszEy347p3T0IXkl1zZnj6WLNr3Gmfm9/2fY2rw2D/M46WXzwf1Xu4VCOe9/nvSwQXvC0IuD8Rsh8rXpjqo/N16nY1G5Zf3WPJg9CLzmMos9DdIxoBU9u7kHLOUhbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979171; c=relaxed/simple;
	bh=F8qek3Nj+oyj55d7lIpNUFqrXt6O3kJiMCkMio199Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIt2oyd3dMjUDpNxiudisgjAl6hQcRbJbLchDzeOhQwn1RVizS/Tcc4aXE+Invkx6cX9T8beo6uVh9V+nRe2/zdaMB0S1sdeV90F9ZPm43L1BezCXTR550ILSlPMFno7ygOFLZO0gnAG2pm17pB1gZZHxhZ+ZEH/Os8PTvpPjcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c7jZcyXF; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c7jZcyXF"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so60529966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790979168; x=1791583968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDrcNx+YymWTB3jxR2mrD39Mvw+RjCAmbQr7dMYlGpw=;
        b=c7jZcyXF7BWCVmvs0y+yv6uaq55Uhwu0ASz8s3zP3GEExadx7mxN782GDvUkGD5Kv+
         eh/7CxlK2HqYxuFUkpn8UnvB4JNNGg5azc1DIohMvt/hr2IyNYWoNnxs6KgrdCU/NfwD
         s7qCO0GQQ/byOt56yg/+XCkCracuJMXEDJfQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790979168; x=1791583968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDrcNx+YymWTB3jxR2mrD39Mvw+RjCAmbQr7dMYlGpw=;
        b=0LpFtCJ54XRitQqsB0HS17qlWkhk3q77T0QICXHGJX18M1uP84nrJHQbtAseqhYSLt
         Rl5hQQycCptEMAMQWGjqRYgGHrUoP/OjLgdT17batAD64SY34k9IDH8Y+drGESlE0es5
         8Mb7banpPd2sWTIn8hvEOBH3yg/djPyPfn+3nhy9kEiD0wdoOggmbYbL9hpYdo7N/b5m
         MZLNPNHXUIKQO6G64OYb5wjwimqUPhwGfiQld6WaHQF3AfvN0wy5i4DxZPYFVhuxOrM4
         JF9d0FiXNjq2QByuNiDGbt+5nI5c/kPt7Cr4Q0v2d0dX1bpNQHnb9ja6X+eVwHRojo40
         YtYg==
X-Forwarded-Encrypted: i=1; AKwUvBzVlZJsa8jOXof22Sw37z5Ml8X1HYgO40XeoQUjDR1DazBioNDTDaKILg1heqbr/9BnMj1uL6TG1EYiUWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo4wX6tZYRlUFZ8Au7sZ68UlQqQKYKEmDqcVA6HgCp/3hqijYP
	LhKtr8kfksiaHh+ZHzcBLCQLzxPTGIV8z1lDR3t0FsulCrqD3qXB+Mb92H8Bbgdc5LvdkzNmAbq
	KDLlBRA==
X-Gm-Gg: AYBFou1tnrKUPNU49ykKQh90PbSiiYrKcCaUrXPfm1wZ5+P6bg5obBGNDZbYDRc6P/C
	EW4tinV0HYpLlRflSl53M1kzSeNzSTaOASnuL3gzGKPQloxiepDHqwz35jgx4yCDnp9d6GXvHJ/
	msanB9kYVNx1eFyN9i9gFsvWr9jvxMmslohE5USy6ItuuVHRG22tKE/gc1sTD8MkCu8DJnFDrOk
	qxxffnrT6BQsvIjmBnejH23Lo+UdYzYqgr1/O9Igil1uF3w9Gp6u8kRiyx3kKXL6Nt9pHEtzUqi
	m3F4RlCFKG6R+G3waOTauFLILRpzOJ9cHzFMQwR04bHHcOsk55xv7/EpRCkR0aaSOJ3NOPgl/cF
	rof0/2/B/Uzs4IeCTbnGTD38DPW4imVbfmN3T0U9DcByFkyEbmqZcvvZxIqwd3oN1GUwWjtX8IC
	mimhujghonyhkjmDRPvEBZiGW6lyIZv/WlqL0IhpGn2nxthFxGynUVa/A4aWfGyTgGF1GXzY0WJ
	umb5YsiCg4N5FgiUxhxuEpe2Fc9LW2uJqap7VwAXQ/YJ1Ml
X-Received: by 2002:a17:907:3e96:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c2e4ae36202mr350761066b.34.1790979167661;
        Fri, 02 Oct 2026 15:12:47 -0700 (PDT)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com. [74.125.225.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4ce407b0sm135827566b.39.2026.10.02.15.12.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 15:12:47 -0700 (PDT)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so198101f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGMSr7FPKnwPneKfrn3Yjg0g+4Z2rM7FMaP95PZ5HApgtwVNOb9IRJkogXevg7MoSXT2L8rrawIa8F88U=@vger.kernel.org
X-Received: by 2002:a05:6000:288e:b0:48c:43a3:6a74 with SMTP id
 ffacd0b85a97d-48c43a36a8cmr4964515f8f.12.1790979165786; Fri, 02 Oct 2026
 15:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002175000.1-brads@mainlining.org>
In-Reply-To: <20261002175000.1-brads@mainlining.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2026 15:12:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZZpWUBEQzr9HAOCqC+KkF63=wU2rpw1YMcC8JYxnOWQ@mail.gmail.com>
X-Gm-Features: AclHuK_ykAqjE6smLyXlXs3fyMcExTjUCch3AoQZne-BAbdaPmKpeUJt9_Yo9vw
Message-ID: <CAD=FV=XZZpWUBEQzr9HAOCqC+KkF63=wU2rpw1YMcC8JYxnOWQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog/perf: reject empty config before the raw event parse
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 2, 2026 at 10:46=E2=80=AFAM Bradley Morgan <brads@mainlining.or=
g> wrote:
>
> Date: Fri, 2 Oct 2026 17:39:13 +0000
> Subject: [PATCH] watchdog/perf: reject empty config before the raw event =
parse
>
> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
> manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
> manual buf[len] =3D 0 with strscpy(buf, str, len). strscpy() writes
> nothing at all when the count is zero, so on a comma directly after
> the "r" prefix, nmi_watchdog=3Dr,1 for example, len is 0, buf stays
> uninitialized, and kstrtoull() parses whatever stack garbage is there.
>
> The old code was safe here by accident, strscpy() filled the whole
> buffer before buf[len] =3D 0 overwrote the comma position, so a zero
> length just produced an empty string and a clean parse failure.
>
> Treat an empty config the same as an overlong one and return early.
>
> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove man=
ual NUL-termination")
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/watchdog_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index cf05775a96d3..cca0485ba28c 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -301,7 +301,7 @@ void __init hardlockup_config_perf_event(const char *=
str)
>         } else {
>                 unsigned int len =3D comma - str;
>
> -               if (len > sizeof(buf))
> +               if (!len || len > sizeof(buf))
>                         return;
>
>                 strscpy(buf, str, len);

I fed your patch to my AI, and it wasn't happy with it. While you fix
one corner case, the larger problem is still there.

Image if `str` is "300,panic". Then `comma - str` will be 3. Passing 3
to `strscpy` will copy at most 2 characters so it has room to use the
3rd character as termination. That means `buf` will have "30", not
"300". Oops.

My AI suggests the correct fix is to change the "len >" to "len >=3D"
and then pass "len + 1" to strscpy().

if (len >=3D sizeof(buf))
  return;

strscpy(buf, str, len + 1);

-Doug
