Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F127E049
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987424; cv=none; b=UfPUJi9PN/d/OhJRiZSQ5b4pyX8Xl/HNiI073gPpL1DkI47mXvVbpmIDBA7cqqB/+mZW5OHsnEbxxJCPr6a0eyUkmyDfeljpa3/7A6Ie/job/jqT8r8mDHCbkAQvtVDO25dGJsIbnbH+c4+EP5nDqbI2A06bRKZjjVkknR1tcrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987424; c=relaxed/simple;
	bh=aoOkQEAwwH5U+jDOGujZ+40gV3lf6MyBTMNAG5e+hl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad69JEifHHa8pkxwJn9BQaH3WfP6knJHF/9TOujLxMLNT4AWt/iMvh+pfp3jYuMMa6j56hY/Oh8Epavfew4tbJWmQk2vgzIL5KtvMzOnmWDMTuE8ljn50caLWkuu6fazCX5JVbZADp4x+qHWFpP5U03sSEZt2vm03F74Wg+cPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZV87i2rw; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZV87i2rw"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e320322edso51508666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790987419; x=1791592219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8Wy+FwTnIXNNxZip+qLn/CBJlGylUrO5j7SNbuEFEs=;
        b=ZV87i2rwZurTN1gt3HSn6XNHIKHYp0CG6VCD/1QN+I4IyCcaAc/YhPKS295b3Oxcnv
         uoXEm3qc3RSqNNcXR+FbNzfs8ai16B/2BTDqH00ihpy1PpakG4MnBOrBj7NX8Qrg4hkg
         g8EVflwhUqzOoDOuIAlPDlyBzf8y04LkPWRHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987419; x=1791592219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8Wy+FwTnIXNNxZip+qLn/CBJlGylUrO5j7SNbuEFEs=;
        b=m8x42H+H8A8hHV7bpdr2m5W3obiZAdg+JQT4UF5xbNxUKd1KGDNwi+YpUy6XWCUS8T
         GOQNoxuMQs1eO8rSN7sucqAPPdh/QGBM+jQ+PpaD9THrbh+1DuQPu2WLgUHY9OzlwVOM
         /ve8EEjE8SofeIUG7Ty1fI84m9mkubQZIkGEkB/7nM6MC01fJKiK9xde3IiCGbg4EUzg
         ezWupowaaZrfELMESs3CV/ORJdgvRJOge0QCxIobNSYCl3maV/rh53XsW6nDDccttYmy
         Mt32cLuBSzLMck6SETEJDgbpgOkPYxg8vuVzWfIjGvL2z/77UyAFRVTWZuaaKp8v0/Bp
         bSFg==
X-Forwarded-Encrypted: i=1; AKwUvBwPaZtVCR4HN3XoNAUOWUQzp7DfroFy41VHM3pNZ21ve+RQW+zC7E2w6/kB/V4CroZzsfVpH+BJ+EiPAug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAYwmiDaZWMDmjEa1Gp/yNmSZiF1obIT0AKd+p+1fnO83eH6Es
	FELge6Q/s97viHD2iHth1C19Vg2oIMHrWatKLvS+2OiMpmPgOMFah7ACX1LfOP/yqOwiRB1jAp+
	01i4=
X-Gm-Gg: AYBFou08ZwmrkMu13mLr2nt35Tvi8JRAi7lCk+AHc85NAEYY5mfwhf+TvD0Rd/xUc4m
	7blvTaTFQKK36yJQKkJoHhzmkzRxb04++xIVigQtUKZIKFPck+VwtDBqt7hOgrHWq7Gvp7iMHzk
	zqYZ/6NU/8bA+4BsVnaMmMORzB/c9rx1JKzNe8PpAYcptoC5J07DOq782zo0g4UY3NYgWuiX2jq
	XnTRdXTlsmLFPCZkGR6ioVtLQetc7A9U8N85k7A7hhJcZJ1zF821WtGVmFd8ROnIrjQxOAJxhPk
	/MaR/XMSQn5Fr+uyjo6vRaxtDu0aM6up/QFAMiMLOm9hPeYpkE5zF4kjpj9V34g0IANgpfkBdY5
	svkWhzQSfu38i/G2RqFYY5g4UVeDRK+7+aW5Wf/PdgDwwqHuRVGILmkCN0IE7xAc/gaFPHrWvBr
	aVeaL3HHlNea9mojIl3dR9PdB/7SaylFZ/JZc48BqeoYmYmzXWumAheSgNmkR5kf5TATQ58ZznP
	tiE+tx4WuMGL1JvzfgEOqAT4ApxLOCEtzECoKo=
X-Received: by 2002:a17:907:7208:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c2e4afe1430mr345603966b.41.1790987419244;
        Fri, 02 Oct 2026 17:30:19 -0700 (PDT)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com. [74.125.225.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf8f224sm141580766b.65.2026.10.02.17.30.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 17:30:18 -0700 (PDT)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so10077f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4WiPXtgazlMP3H9jU+RpYP+3Sgc3RlkBAn7xiTsEwelVcDR86My3ZIGTgO77Nxl4OfWwhK+mhEd7+9Hg=@vger.kernel.org
X-Received: by 2002:a5d:5e84:0:b0:48b:1147:3d75 with SMTP id
 ffacd0b85a97d-48b1273e48bmr7348711f8f.45.1790987416939; Fri, 02 Oct 2026
 17:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002175000.1-brads@mainlining.org> <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com>
 <20261003000800.2-brads@mainlining.org>
In-Reply-To: <20261003000800.2-brads@mainlining.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2026 17:30:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDQyHTT=Mm72am7hCnRYWvZXJFw3TKA3Ty-e1WccY=uQ@mail.gmail.com>
X-Gm-Features: AclHuK-UHSPygbQGQtIEqnmdJ-XKJOmQCKJagnVn54CcIHjh5jg7oi_oRrBSa2Y
Message-ID: <CAD=FV=XDQyHTT=Mm72am7hCnRYWvZXJFw3TKA3Ty-e1WccY=uQ@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog/perf: fix off by one in the raw event config copy
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 2, 2026 at 5:06=E2=80=AFPM Bradley Morgan <brads@mainlining.org=
> wrote:
>
> You were right, the truncation was the bigger half of the bug and my
> v1 only closed the corner. Fixed both with your len + 1 shape.

The above should have been "after the cut". Where you have it now,
it'll end up in the commit message.


> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
> manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
> manual buf[len] =3D 0 with strscpy(buf, str, len). That count is one less
> than the code needs, strscpy() always reserves the last byte of the
> destination for the NUL, so the config loses its final digit.
> nmi_watchdog=3Dr300,panic for example ends up with buf =3D "30" and arms
> the raw event with the wrong config.
>
> The same count also drops the empty case on the floor, strscpy() with
> a zero count writes nothing at all, so nmi_watchdog=3Dr,1 leaves buf
> uninitialized and kstrtoull() reads stack garbage.
>
> The old code was safe on both counts by accident, strscpy() filled the
> whole buffer before buf[len] =3D 0 overwrote the comma position, so the
> worst outcome was a truncated parse failure.
>
> Pass len + 1 so the copy includes the character the NUL replaces, and
> reject len >=3D sizeof(buf) like the code did before the optimization,
> which also makes an empty config a clean parse failure again.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove man=
ual NUL-termination")
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/watchdog_perf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index cca0485ba28c..a4f677c16b20 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -301,10 +301,10 @@ void __init hardlockup_config_perf_event(const char=
 *str)
>         } else {
>                 unsigned int len =3D comma - str;
>
> -               if (!len || len > sizeof(buf))
> +               if (len >=3D sizeof(buf))

It looks like you sent this atop your previous v1 patch. You should
send your v2 patch as if your v1 patch wasn't applied.

Also, you probably don't need my Suggested-by tag. I just gave review
feedback on v1, which usually doesn't warrant a Suggested-by.

-Doug
