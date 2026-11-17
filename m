Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913869;
	b=lUSS8cAOjjh9yZabNac7o4Lk1Krk/6p7biGunr3vX1SMlFqryQsH66+zHR3ZBzTl1G0P
	 4lMBkVx/Am99yWnIDBXXCHH4kEtm8ZyhfBginVsYnClPAo1154ZvVFAYH2kX2N4Okravs
	 m/Q7QfezAPx/jnI44cQdNDj9GV0B1kYw8kqw1pMaqGwkXMmtuRQP6e3gMQFh0CnKGo2O9
	 ttEnZuWu/2kTvy7fP5BNReqYOXFF+UkgDeZNXPQbT+gEj4UPcdl6lhMoe4JKgcyeQiF1+
	 ixf5blfOdwfetDCrPDUDRNNRYwHSSdwsZgikAECaKcjJFr6PUYASTusZf4xNb9WyCTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
	b=vZxLgTwYSNNR2s4ozsaNnoNE8lHOICmChFHUsw2GYk0J7qtfs2nMXkTXm0cY8i8566Fi
	 F39+YmS1sFcYBjf6pHJd0NQQpxmIj+VVALt3K6R7p84Y0TZJ5AaozO2W7Jy6WsBqoSfSj
	 wfcY6VbST7Ph3wJQz6cg1JXObCORcaHHZc8FM0k9zHS1ANAIL9FQP6rgycve2RIcT8q9E
	 iyFKkj5mDVvI9jzXlHF1jRtymmO9W3zHwS9CGumKMJHcp0TDMLTezjBELngL5pm0xFI4A
	 CxNwspAEdbkZhDV6bXDPXzV5TWIwXKVrq6l0r17LlkSA9/Ucy9MgQX5PGMM4poY73aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F943606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F943606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so5449295a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913867; cv=none;
        d=google.com; s=arc-20260327;
        b=J2u5l9JuQM2O4et/SFWrf80aOVhmTdFbnobAlUJisbvRs70WpxU1xuel6q7VWJuBzz
         sCvp4fLhdw5wP6J18H+bjjc/vDjWibNScz+vCLbFBjiJe6/84JsZM6iGRc56XIeEa/dY
         2u2uZPsaP6mgmk1B0A1dqUb7t77NNq5U4qVvkTYyzP9N530y4T9GBpDi6pqp2mC/9+KB
         +reVGUx1fTMZPhC5g+idCWI1/+rMjK3YJjtBrgTIcKiXO02VjZ2OneWUD3gB1Gssttn4
         TDRjYU4LAeMjP44Cfjnz86ahLOEHgsYEdJo1caqGiYEhLXy1kG2VCmvA6RB2h1nA9N/r
         hegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        fh=vH6qc+E90X6wTywWPmREo5VVWEdSmboCOcVFDd0AFhI=;
        b=pMOO+CIMj4HIb+6f/lKZmi8gLgBujY7NZ0yl71mQfVlT8VObHznfAtDAiBAjWojWRS
         mLS0XrDZrGB64JN193cEo2HBGB4o58h0h7xw8qPqnZ/PM/nzPrc8F8NOKcHeFKLTODIV
         uwN9V1PeyC5AYvfd3Cb/CBOoyQWrsIIB31tRr35cFWxUk83tR74bCbovWKr+ZGZslXW0
         98yzsMJhe47FFhAJmjaJxsw4srCExb2PJXHDbKH42+A6paA2gFTwok/Vrmbq2nzzJP2Y
         Ddf/uFyAq9r5VEPWjz04HHtcdNVQG8BMWxiLjlDM7aIopewbQHVObyOg0RpK5h0tLoss
         b/7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913867; x=1795518667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=moIxETzHa0Oq01n7L4mzCWZwm33Qlqm57PUEdjACdCaFiZo0ueGyZTZaC/wKy5SOMK
         oXI0FM9+gSkDnkpXkD6q1VLY/HTVf4Z4buQ9pQMLMXvVB7vUyLnBFQbzotk6yVCr4iC5
         PfqYo4e11phlxLS+s6bPmjvyYm9H2cEjqvYUpvv60l+cCAz4oo31FFdQZuofiiHnUXk4
         9ZwUdgDAc0puWw+LIme2GDkOcXdRnvM/sLPo6bULbEvwYYc0NSjyfWsLmydzKblH1JO7
         hX9DD6A2nVioNZfFT60yg7Q397SzaWnpnFkWdV/ovcu7DMmLQhPK+iKjZG6jsXS5WS9s
         vP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913867; x=1795518667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=rAgxmJM4AEUBRuLO+WtpNbBE8t7Qt0S/WA/bDJn2esl3zwhHYqSna45pAf/m/U74YG
         oE5I62ad/ngcVJHukSUs6ivWPn04hz2QQfQuOcGkDK62q8jZ2yU/+1FqSEIhdHKz73CL
         aM/IA0d7rzyFpvQDdmnP85U6UwQovyAl3eCILBaLO36FaKVssC5iJSvckzBbEu4pHOOx
         lTZS1PHJEXbXqUtUlSyRn90hy9lWODqtcQNK4VnEVulf9nRzji7+lcY2IR12rKBG+bVO
         CLC0bG6/Q/X3yHZWW0than02qtSPguQuEQosa1OD43TbhzEvPk7FgSEp25yjDO6O2rFY
         IErg==
X-Forwarded-Encrypted: i=1; AL+hErHp9dfxANDt3UH0+Okpunx5zTcGEw1kqXu5ZcmhVx8JwrXsqy9YbQ1du2DGrFPPQ6sag+RcxhI4a3z/2Ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QCcp0pQ8r5IObui05WpaJe0mXOvUy2xTHI0fWeGhwTROMCIdO
	iLyW6kWrJbv2HrIFEeUwKGhyfdTQDSlpysbDMbxNtDoSIOserTsIXnEht+AR3YkSqnh87BOecZX
	XHisdRiNIvzrQ485hyfmrDAmVuRsa/kM=
X-Gm-Gg: AYBFou2MVWQc9Unhbhp9GuFi5OBc8mwxL4asGRRgDe8/UAunwrhZ/R2NKmq7LyO/DUj
	UhMQZBOGwSVqmKxjusrnIBmd0/ejMRoM/CrNNHuNg4hnJH3Ft1j4AfAygfCAWuocbJOzo+iylZ5
	d32LaWaquts/2fhiNwp1BAT6oimY1a7L7kO2bTlgH7h3WQdMT9resH03cLjvlnqYnFrlS9uIooB
	uP4e0mJnXyP311DN/Zvb5G0GxlPHPOEedKcWEnzRrpllh+f/FxKRA5TaFkndKY8INmoRlM8NxUt
	DF3TU4r+GCuwzCahm1dcnVEby+8NRtkmZZ/KxwAWMnikWRtBxXR6NznOag31tkxk4f/2ZcUpoFX
	PuY/+FkWyFv9VON7I307ZXtkPm9fynGDZyO8d1mtl7oVs8y9XFQqaK/s4Y9Uf618W8i3INIatHA
	hthsdG7ALcEs7ddyL/1XirUKk=
X-Received: by 2002:a05:6402:c711:10b0:6b7:8b36:93f1 with SMTP id
 4fb4d7f45d1cf-6b7c098803fmr6702619a12.10.1794913866951; Tue, 17 Nov 2026
 03:11:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:54 +0100
X-Gm-Features: AclHuK-uU12m5JYQTGHnnby9FLfe8TB5m1Dddww0eP2k7bEnEFbxsuNSOldafTc
Message-ID: <CA+=Fv5S9+y3vuSpFd2MHFEAFOwa3Q_8gqPV=yei-ej0Zo-V-9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] alpha: marvel: notify environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/marvel_env.h | 5 +++++
>  arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> index 16ccd2002a11..dbbf827a18ad 100644
> --- a/arch/alpha/include/asm/marvel_env.h
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -2,6 +2,8 @@
>  #ifndef __ALPHA_MARVEL_ENV_H
>  #define __ALPHA_MARVEL_ENV_H
>
> +#include <linux/notifier.h>
> +
>  /*
>   * Ask the console to refresh the environmental readings of the GCT node=
 at
>   * @offset from the start of the GCT. Returns the console status, which =
is 1
> @@ -9,4 +11,7 @@
>   */
>  long marvel_cfgtree_partial_update(unsigned long offset);
>Reviewed-by: Magnus Lindholm <linmag7@gmail.com>Reviewed-by: Magnus Lindho=
lm <linmag7@gmail.com>
> +/* Called from machine check context on each environmental system event.=
 */
> +extern struct atomic_notifier_head marvel_env_notifier;
> +
>  #endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 46c521cea9a0..6e0b0aabdaca 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -17,10 +17,14 @@
>  #include <asm/smp.h>
>  #include <asm/err_common.h>
>  #include <asm/err_ev7.h>
> +#include <asm/marvel_env.h>
>
>  #include "err_impl.h"
>  #include "proto.h"
>
> +ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
> +EXPORT_SYMBOL_GPL(marvel_env_notifier);
> +
>  static const char *
>  marvel_env_state(u16 state)
>  {
> @@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_=
subpackets, int print)
>                         status =3D MCHK_DISPOSITION_REPORT;
>         }
>
> -       if (print)
> +       /* The frame is processed twice; notify on the printing pass only=
. */
> +       if (print) {
>                 marvel_print_680_frame(lf_subpackets);
> +               atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL)=
;
> +       }
>
>         return status;
>  }
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
