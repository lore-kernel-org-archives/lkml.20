Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794208512;
	b=iK9Eew0UHTVikfY62nt5mgKCu3aIC5s+8EX4YTDfLg/OfFQVgLdfbq0acZjP3BU4LJOM
	 M1ePxXUPGPRfQ9+sRv0U4Jb/PjbtIfqw6VjfIMXIbxlbOPF6TakluKIftL//eQdWEnfF9
	 FahKYBMhFGq0Q9rX/sRt0Lm1i14d4Q+YkVj8X2N8maWkY8+8SKdqFxCMjSa7pWPlFwCZ8
	 e/vrK3Pi8hWCtd9t+j7RtgNX+0+Iaxx7MrypWrvFUScaI5uwFvYaPylamTzEo4RdTnjsa
	 2mIKjfk6WgZQZ2j977ykSXHo7B3p6FWDn7CFnFzV0KXZ5Kzo7YUkRe3lRgEf1BDNWDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
	b=HlQ+oUIOQWNEcoonIvAx9rfpAGc7Mt89RnNB8P3eAGaTKpA4s5nqh/P5L2CC3tFa0uIZ
	 7HaZ+5mA98dp+5zspEZHoxxeR6hCkoNQ0KoUfyGcRpMIiq9Zkj08bGZPADdT1zm0tonQX
	 hm9Fq0E0a+bAZneHANJIZnA3Mc4dwVzR6sl4VxzDhB7GNRuCmKe/4/N2XnMLsf7pMREzw
	 DzzdZ3NI3nKLEntk1qtfDjYVOx7Fw6EyiXGOEKbQQp1Z8fW+WfLlmEgxJEOeaqC9wJEQl
	 TAiMH9D6sdWxWNH0cDJ8vgpxmzoE6Su7waJC46eJwT9NI+O1kSgPoNVgQZ244zt7NeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csU26nM3;
	arc=fail smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955E606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1955E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csU26nM3
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b31fc13124so3196037b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208511; cv=none;
        d=google.com; s=arc-20260327;
        b=W7dcX+i2QtygLQtzLjNlTqX62SS4m+Rz7GOvXAfKGggEu8BEDGYXRl1ojJKtpdp3HF
         bWSKDVCTasKa6Vlo8xjZRY1BRalxsx7lC7iK1dSHD4uTwJATqj6rccyAT4OtdZw1Ilvf
         ebDEm2rxOMiKlBpJA6FaVwnZaK9YVKBhuPlvscM8Bp9/2z3ZM/vR/0Qu2MnNfrHExk94
         d6b6tjyUZ7S8HrLEaktlJfLfLf4Ovg3XYm1zcIqM3F6BLMZBGctvay2dnvVTEGiCteNK
         /pb0i/9X+btAQ8HrGPf8wLc3DiyKAthAXyeWHZe6am81qSmhV0YwUmVfGvGmmd+vONOC
         zFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        fh=7nMqT/eXZ5r514Q3siMy1cKl2V7pGNnRxZvTPTP5XcA=;
        b=cb61tv7AsfEtzwPr9AfksRTVBhqHKYysgsYY0WFWwMPppdiQHwGNxZ1z9wXcVsrC9L
         3azXWFuCwR3hObZ/dBd2Y6OHdXttuqECBoIFzi1p/Wo+LeJiKthJScxz9Qrvl92jgt7V
         hV5kUFcUul6+ZPT4rSms8mWEBTYl5dRIQXUemBAs5YIS3iwAtp71kJecliabNEN06dIH
         5ha0ic7FIvhSzVRfqNHUPdw3jdBJQ63mlntUZoP2y+bMIZS8zVt4uV4Uspe9Bh7pzNMX
         pdmAHPssNaXmMqlZL9vw3gPm1/xMF0VYsomn0X6CwkkRs0FtshOrbtA6KlR+EWulXl8q
         dsKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208511; x=1794813311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        b=csU26nM3k4fPR6c+45FXgNSnRd6mcGiFaUu5fBYpJCB35zLotT2fORe0o7XeUCLaY/
         hjVDjwdD4kDmKRqzjXaYFFBeZ5XabH172MZi+LniP7uqs7p9+8Sho2n/M//EeF2v+Z0Z
         bIF2rTnHM52w4rZ8UxueOZN/q3swm//FfuG3oAXlS5lfeHcFWFpPrLhH+FMQCJh9n98Q
         g1fMq00h5DXiDnowP5J2Cysl3dMXpGL3+AmNLAcUnzIALcCARYG/n5E+0yNkz4QouzUr
         akOFfvi4XQndFgLZBxT/3aR2OWfzVUkGzg5mR5kAq34rjnqlsOPJKhfC/MfQwatFvjmA
         7HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208511; x=1794813311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3TH+FpKDkN9+upkUl+wnaxnw+xID6Ayvvs9bsXe9Os=;
        b=SpSN0QlAyobisIhaRPzqnjZ9GESvWxe0PVoFxrx9gvB+42nI3WZBY8wtYPsHTrrBR7
         ZgtriIMhpmzsq9YLY/6mUp5aoHlHgcGnnoUpOXXfPvh+lGHHh+KuAuzG2xnNa0nVd8lz
         Ly4WsPsOqvIezig+OfOCGb9wCSBVEbqqg9r30c6pXPoqOpi6fh+R18CCrKbDz+vxIRQq
         xl5OEkDfU0vdr8TOnonv5yCwKE1AGbKZVYdJ1rJsaYlPraezBVVrjvWJgPev62krqrUd
         GI5ZCf+SL2+UJVBzGkfkFO3YngXKWwMLbOHxFMXnw+NKAjl9Advtn1uQ14fP2EXVKwjH
         gjRw==
X-Forwarded-Encrypted: i=1; AL+hErEL5qQzZocA7xx+vamP/ArejLINmDum+SIAgElbSusZq5nxuT05f6MveO3y97ur819TS4yr9C06sZAdCc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IZ+ridhWhs4Bwi0GA/ZwTl9OT7r4Gz+7b4bC7l0FH7FXN+Jb/
	V7o1YlKDmVtCdk386dl2x6JKvHb2fG/7IVZAwMEZlkvcBsB8KTS1955uzkQcxTQpgyMFl4oqqaz
	jU0UlDTgep+s/ykBNdknp0s+h4z4NHTE=
X-Gm-Gg: AYBFou3VDJ0ULmN/kouqtB9bHVQfjAEwwUOpLfGApbdVrjlyZelLLkpA6xbO0ilvMOz
	x8Xnuhg1uEJR87Im12Sv/9Z5d/XoisGD/hWFZXk157Ekv96tjhYmoDzUAKLmxLlc9D0wuJICGFj
	4Qfr50zZpLRXQaU4Aho5stu88vTKJ0TBM8UmziW7NAoWpwda4uEoIAB9vgsj7V1sIVQYNo/B6NB
	5c7OyQObb5bnPAZ5Rm/K5ZfoLHYYliYJtiPaxS2H2Dk54LdZgv9tO2KNTAfaX+OnzMOxGM4x7O2
	xA8S1tYC14rbZGEG2tbCL11dpjTFFQLXk6UBLiVla4pYYFhoS5tsdEfxGQCQ+AFsEcWCYhACteO
	3SRH2Vyp/xAWBWuc94ssfS6EUq8+qX46fPeqoTa7X9hHe6lHq83b7IcFoOzgUhsnl9BriMoDKPn
	ICVp94Q4PzGWtl6/QABCqLobLcGC85ZEt/hKxnZeHoi0LYXqj0RrWVE5qDL6zznI83etltRoKle
	pKsA1MM+YEFfsxkGM4io3Tc2TTSlsRCMYiogHWgKgSTQrgskUVDD4OtSiMhow==
X-Received: by 2002:a05:690c:a4cd:10b0:8b3:6430:6728 with SMTP id
 00721157ae682-8b36cb77a09mr16346547b3.53.1794208510681; Sun, 08 Nov 2026
 23:15:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <20261108213656.13031-3-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-3-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:14:34 +0200
X-Gm-Features: AclHuK-MowMPC7nsIXdyGu4QxS5XFSL9LJIdTkFEgLEwFauodytJ5sllsbRZ9KE
Message-ID: <CAHp75VfuW1Xz=UeEqCUtnwQF0+auziyTa4nyhHWSa6=QuZMV-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/surface: surfacepro3_button: don't load
 on amd variant
To: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
<antoniovazquezblanco@gmail.com> wrote:
>
> From: Sachi King <nakato@nakato.io>
>
> surfacepro3_button binds to MSHW0040 on the AMD variants of the Surface
> Laptop 3 and 4, where soc_button_array is the right driver.
>
> surface_button_check_MSHW0040() evaluates function 2 of the MSHW0040
> _DSM, the OEM Platform Revision, and binds when the result is 0,
> assuming that only a failed evaluation yields 0. The AMD variants
> implement that function and legitimately return 0, so this driver binds
> there as well.
>
> Decide instead on whether the device implements the function at all,
> which function 0 of the same _DSM advertises and acpi_check_dsm()
> reports. Of the 32 Surface models carrying MSHW0040 in the ACPI dumps at
> [1], only two do not advertise it, and they are exactly the two this
> driver is for: the Surface Pro 4, whose MSHW0040 device carries no _DSM,
> and the Surface Book 1, whose _DSM advertises functions 0 and 1 only.
>
> The driver currently reaches the right answer on the Surface Book 1 by
> accident rather than by that test. Function 2 is not implemented there,
> so the _DSM falls through to a trailing Return (Buffer), and
> acpi_evaluate_dsm_typed() rejects the type and returns NULL rather than
> an integer. The revision is left at 0 and the driver binds.
>
> Keep evaluating the revision when it is advertised, so that it remains
> available through dev_dbg().

> [1] https://github.com/linux-surface/acpidumps
>
> Fixes: 64dd243d7356 ("platform/x86: surfacepro3_button: Fix device check"=
)
> Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io=
/
> Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Sachi King <nakato@nakato.io>

Same comments to the tag block and the commit message as per previous patch=
.

--=20
With Best Regards,
Andy Shevchenko
