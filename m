Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4679418A22
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028484; cv=pass; b=j4IC1YFfzxpzlhj3roFCu5aKdqU8bTNkS53t7OKBeUyE1lIDTBKh6ZtZJ0PB3/PhyA3AW6xL6CDDU+Zg8mtxeicxzuCBFSpbjTmaweJ+mjw4lhwsyykSIAoWfig8+W73QF+zcZoVXBcqUsgDiISEUMUjjzFG46f98EeW/bRADo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028484; c=relaxed/simple;
	bh=tW30C4gOY3Z4+diiNN9rry3cF4JPQrHbh8csErsc7Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrx5oLczwpQf5Q0eWzCypsr7MgJDRk68z3l1xpFzXouxYMaGtVgt29CqNAYnDLiv5bDCApxnPb28NpdLbqT/gFTwMq+n2dnJHI8gY6re/RmiYmGjweX/Dx+n95YjzITbMFGRLNOOEariHP6qH0ftmF3ODplCHGjYfA/3ndiEb6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i19xLT0X; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i19xLT0X"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2670331a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788028478; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJ9vndRUYjGfhTpPrjjCV28v7rBHq3Q7yQQ/J9QUeAds3QBEi6YURvGohcZ+mSGKsR
         Iv9DUW7UG+Fn6pfY47UoFe82wGEitXSBy9582ecMFQwZGUcZ81wHl3isdnTbVmL6Uoqf
         XSgpXWsGZCaRAQY553MvGMlA0xULv7EJv/1f0Elg4htYTjhrNtGYEAFXh29CCBF39a5H
         cr9WoEdQ5T+f/9YSLxQpPmsZg4zqP9pYGxP/xViXDAiT394ANbXa8wdcj9SPghp+fRDk
         uhQFpOOp83vRyycftioXUOaWo7Jo5rFIi2Rsm4hbeEf/dOr1IamUFBjgW3hU5PybsFO1
         Tccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxySuSJTNKHJC/xfEjR8zEsk03gGnur0eoevwy4Hv20=;
        fh=ccrg+1YVPf/57Dj/N5tQLqSIKOC83hoVDU6NU8Ziijw=;
        b=otA2261XMrPLFuynAIPcMAkpjKstS/PQVDv54l+EiV1r9riVB1er8/OvnitcxowmHV
         PM17diGcDAzzGLiV9NAqAkUrvZQC5fa84vQFjEhPA8fQDSE0k33D2qO+vYdvIww5DBTW
         VpWOmYG2wFUoK7zA6+ZCUyLhm/YVIpp4yUo5iPndxvx4kAiEC9Yw0sOH6tCEMMdj+Arn
         u/a3SkWJLyF9JFFiM4uVmJvkycDm9q0V0aH8gmvcIzbBvxKqXyHgAE2qYLXR0RbOBmWj
         gGWSgC0OWuipej/CpIkT7pgmpUVNFaV9NBn3zc7OHoC6tWdK91A4BFkfWnF6LVwS+oqv
         gneg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028478; x=1788633278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxySuSJTNKHJC/xfEjR8zEsk03gGnur0eoevwy4Hv20=;
        b=i19xLT0Xh9BkhSDiSkRINCsSCYVvwrMIGdY9NK18nGcAZUMX/jidc345gCROpBJjsZ
         0mnL/sT02Yi6HuQFaAq6O8uHOv3pFggrdujFZJsKGlpJDbNCOJp9/4it9/D11mH2d3HU
         e2frDE6aTIgWmzA/YmJ/6bKtgaDYZdgM2HtLwj/viWWBepYp4hoVyt7La2+ACXgTIzb6
         tyqo/R88d4rUL97jQiPT/gkxzcFGvVegrv+pk3f8rlpa+ZGUnjtRdZf1yamMir0PyhqH
         c2kyH5gRoW7DWMLf/kBJKRdcpTZ+Ded5eaU+8J1ikT5CaKp6DSNfYcmMG28qA0fsV7r5
         YTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028478; x=1788633278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxySuSJTNKHJC/xfEjR8zEsk03gGnur0eoevwy4Hv20=;
        b=a38KSKlLhwqpnjLgoSgvOtIZ03qqoeqc6tynuOTM6DNxq4OzxZZOdlQMp6Yz2Bz2r1
         DmbVallU6R0vEiGt6pEfDCaDyUgZPUq8GRBHnsWfCF5yRfpSlkweYXb391GYmZNFPQeY
         2TS+N7biegckQGmUT90SVAHFaLLP9Jrotad7DHRMDz9O9JKDgp+KG/dEnMhNq43beorJ
         IJEUDf8YBxrjZ4C/LkexTWx6Au8qsHRADSgDbpcdIAjL9BHT9wGIKziUtVLgXUKMCD5o
         YuhVI7phRwofYiJNqVZjFQ6F+TaHYmxm6lcejtqfPMHGzPH1NuMq2oXPcRpGQ+QnWLft
         V+sg==
X-Forwarded-Encrypted: i=1; AKwUvBzpILD5N1CVbKlqewJRi1ruFzXmIznJ4PjmYKCEgyfiCV+5MXgVl8aNWY37Ze7mnKlwgU8EF3txknfW/r4=@vger.kernel.org
X-Gm-Message-State: AFuF++nBkN16yOftsTbjawnSjcY3Mwamhsb9rD/BNln589YI3HJ+ctTD
	ELp0SbYRqIKOjZlOOxlkX5xbSTef9V+o68TLCM3CO9muU2mDh0JId0JgYdkI7+1Dth8QEH/AeU3
	lYN2dYU7NOAEUP2V8qRlW9hnG6uHvQ2M=
X-Gm-Gg: AYBFou0dCcgVNjcVDNQA0/P5715QegJnvTfmGgUHU9PH44la83GBglKEdKv9W0uPiMK
	nZ+Mdrnpq734l9IDIOlhJdXE7N+3Co6WS7gSNoKNcGVf0JfpeHNyczFtmuNxySuFAlUUG1hz7/U
	mREx8Z9s1LnIlDfN+5ANl3wFlRQ5kzVF6gi+C5OKaWTSbegGtP4HEzPxj3O33l3V5ZMvRx7pXXi
	ykjtbPJul3+Fse3y35CjTB3UwaShVsQndJZBZvnbWoXIm+YKS0ne3TQTaF/M1cx4TF4EmpcpIE/
	ozvNNdBmK/rInCBzUVwdYQqLOyy8306TW8xqbPGXUhLGlOx9s1Kboks5zAB/vfeJ0QuIkhBeP0L
	Z9QI=
X-Received: by 2002:a05:6402:5418:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a60d3b384dmr10419034a12.11.1788028478183; Sat, 29 Aug 2026
 11:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829164945.2691317-1-samuel.thibault@ens-lyon.org> <20260829164945.2691317-3-samuel.thibault@ens-lyon.org>
In-Reply-To: <20260829164945.2691317-3-samuel.thibault@ens-lyon.org>
From: Weiming Shi <thebestswings@gmail.com>
Date: Sun, 30 Aug 2026 02:34:01 +0800
X-Gm-Features: AcwNN1V9KtG8SrYpsXXYYxYM1PVbFmhtio5CYS_rfRmw3khsCuCHGO4aE8ypct8
Message-ID: <CANgPUi3PnuhZUPzN-LwyviZAWbCiaZVF549shZ4JoR6GhC7Oig@mail.gmail.com>
Subject: Re: [PATCH 2/2] Fix NULL pointer dereference on VT switch + selection
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kirk@reisers.ca, 
	w.d.hubbs@gmail.com, co+e5693071d903b832@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Samuel Thibault <samuel.thibault@ens-lyon.org> =E4=BA=8E2026=E5=B9=B48=E6=
=9C=8830=E6=97=A5=E5=91=A8=E6=97=A5 00:49=E5=86=99=E9=81=93=EF=BC=9A
>
> When selecting/pasting very quickly after VT switch, the tty is not set
> yet, leading to a NULL dereference. We can just abort the operation.
>
> Reported-by: co+e5693071d903b832@bugs.sh
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: stable@vger.kernel.org
> ---
>  drivers/accessibility/speakup/selection.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/accessibility/speakup/selection.c b/drivers/accessib=
ility/speakup/selection.c
> index 1713ce4e0ba5..a04a7e8c307b 100644
> --- a/drivers/accessibility/speakup/selection.c
> +++ b/drivers/accessibility/speakup/selection.c
> @@ -61,6 +61,9 @@ static struct speakup_selection_work speakup_sel_work =
=3D {
>
>  int speakup_set_selection(struct tty_struct *tty)
>  {
> +       if (!tty)
> +               return -ENODEV;
> +
>         /* we get kref here first in order to avoid a subtle race when
>          * cancelling selection work. getting kref first establishes the
>          * invariant that if speakup_sel_work.tty is not NULL when
> @@ -120,6 +123,9 @@ static struct speakup_selection_work speakup_paste_wo=
rk =3D {
>
>  int speakup_paste_selection(struct tty_struct *tty)
>  {
> +       if (!tty)
> +               return -ENODEV;
> +
>         tty_kref_get(tty);
>         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>                 tty_kref_put(tty);
> --
> 2.47.3
>
>

Tested-by: Weiming Shi <bestswngs@gmail.com>
