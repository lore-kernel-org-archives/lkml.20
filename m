Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794050144;
	b=eirYFCQEY1ymbB5Wd1fgU4+qYqwWJpDEaMLhF8Gl9wpp0Xj3MlVGPZN2NcQ/8JQ593YR
	 jLYaW3yjEGat1F7EZDvJgqb7/mil6IKmLr7FU4BAy04BnBwPlKLPzAbVeojlHlJ5wCfiw
	 IlJBTAtelqDObsjohUqSAnAXnD7pXPJGtA8K3nyrcN2dK2Mji6QcQ3eLNYWX/9Av0evl2
	 sqtWUdRJKPolVFi1328en2Wm9j1b6d1yX+6kQY3YJnX+WPuiXxNZ66PuKDks9A4VMYlNy
	 FJDHK2f5u12uFi0G/D22p6eROwBB3EXSRnJYz57cRSeB48J0ZUhHR2YF1etx29CAQfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
	b=avibCyG6RRW4V2P5Wh8TBXtJjo6TIcvcbr54mSqAewMAZ3O17MRW9K+yfDb2xKGOdClV
	 jYs7GyTQCX0D+/sbeteOFWEVZLf8I1s+IcnAqeaXiyq42Ch+y/tNaKnSphb+tC5yhtMMG
	 3ksx60aNtxtOtQCTY/doMR1ygyWk4eLHhEo1+vmOxBfizR3MyuNdtUtAZ6lkY90cIgHXL
	 ZbmRj5hEk4By4/4IieoyrcdxhgfmCM7HUwwTknKhbQ5ukuy6s+RtkyZCuY57fB9jj2unf
	 YI/WOzMILfS0G6TRgxvuWn17Xr47ApUa9WUxcbfaAFzmtTX2d/R/WmGcYKbd2MiRGgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGAZmRWQ;
	arc=fail smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2154C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGAZmRWQ
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b331cad3cfso11380167b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794050143; cv=none;
        d=google.com; s=arc-20260327;
        b=fiE9lKl4pz8ZjambYjVuSQaxQcj3XgrlFf3uFakHSqsLmF0EUkhY5yHEAEdHHpzPsm
         quZFmYigEpWYzfd2hBeQIjMwgb29u4I9LjILZGXJtvf20db7f+GzPUKEaFfEjoB2zygv
         1TfnUymkqVK/yi2zip+lJbm5BWih5w7o6AzlmL+FzXDWoW7Elvffx37qAkZE/q7mVSpW
         qAythgppSEMwVVI3rWim0GoEeAR3m+eNx4IkTXszgkyknUlX0xST1bhIqu4yNO8r8SFo
         WrJdSx2gOr3dP3ZjwBHc3gGLAgfVbLQW8f9oN/DKRiX+aNkK9/PQtr+QCZ06hq/xxiFq
         SEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        fh=bvGbyPjtUTZSzuaS0dp8tJ1U3+xXHbUhzfF8UaStB6A=;
        b=iPQ1lTfkCVAumu3OP38HhPsp0hJ3+uXgrbyDPCAMMemQeE7j6tM2za6wt1U1RGano4
         mcjdtnzLgXVixevYVKp/A6/Y4vmeysEmgY5hCwpi+UUUC2SGWD4a+RCGQm/T1I0nDb/P
         2BsBlzPBb5hz8FwgVdgc/xd2/LKdIpfdfG/2C29Bbb0/X1jVs7DAe0PwSjL99bqsLYUk
         FHJxKkfJSWSa2jvsLXDTPB2bMRyXHupgBbSOVrjedCwcdROuiYQxC9lkrTqUiUniIU/u
         Vv40LpR2JxNtODmvrBttyfk1ppKgmxB0HcpcLFM8lkpuY096NUFyCCLjyQro6Z5m8ILh
         LVIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050143; x=1794654943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        b=XGAZmRWQx6mLwFv8/yCKATDy5MtBDRhngwjAjXpXlZPMTz9crPtxgiDQ6ic8RkYx+Q
         b3zaal0mwySuURptH4A/DMPx1BERxU/LFOxcBe8eMt+QwcSRtPXr/3OQxGp4iPtcAmNg
         Rb/U2egfEzii3F7w6W2d6ltigRz8qaDb2FiXnuzhNLI35IheNKXeRH0xMzKxRqjSX1sT
         V8qSsh7xUeuc7jkkeYsIhOXTybHi1D6gURy69AD/dta1ZKZvLKbzgisWVIWunwB+vZ2p
         oyVfGYWf6GfLJmMePpIZk5moatKyXBJxzQF7vLATfefuNH8SCFJCgz3x2vg7BuIIXOLH
         o98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050143; x=1794654943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HSmB0DZjHvws5cEwelRodlMTqP7Ejl6doLTNQjKzKA=;
        b=IOxOP422n2eWEvLyeVUe0LnhfQlZbSMiIzaT8iOrJS3uwB/yBy1CFVKun/MMqTUCo8
         8M23TNxN2MIsxbuhUtfeur2OFc5TWws1r5xLeKZvJ4FM0tBLeatJfXnjBhW2/4u3gTci
         IFv1LjMDkDEyMmDY+yDmt9pWLi614D8FucrgIqksr4aa1KUeSJdwrYVaIUbeaqlJJBzA
         EHEKWSo4tyCOB53H7TqH2i1bR+G908/OgknUzPgLiSzl0CipcunxuDsA//7wGaVGhP/A
         wPpnEjiWXFocxBd1xXtHG9NXUoQTlka1XjBQzIdEchB1IcUBK9KpjoW1yMcWp95aXtxH
         7OzQ==
X-Forwarded-Encrypted: i=1; AL+hErH2NAXOzj1nr2kUbL0MAai+nU+0w4dRlS9xstX1R4j1y+UMSmHKpqptWym9tYgRC3k2yNIHN9bmnzWk2C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/251fHMJsTx+KaFDy3NJTLTvU1xzKHNCKUpupbfTCbvAtr9ODQ
	vFnMmgmfjOMgTxM1LMpUM1ALStvGQBzZwRLH3OGhW41j/e9YDLbUXEQGBZUpNP75wUMS9K2pQ0m
	gEbtgb0PJ6zhanS9DOqS+UARlrm4S7Ws=
X-Gm-Gg: AYBFou3dRECd9/nopCatGr6Ov9W0EalTYrqpe1Tvfvm8s4c6OkAP7ybLr4Yw2O02dSP
	TdKcqVXsqB9YNUjV3DkvNvtnAkFMv3oKw+ZGp7GiBhCPKo+1NXdLvXO9hwOUEQkTqv/bd31knmH
	Nv0lUrmeQIQzggvIen8ys40eW+1VX+r4+9/21sSofJRkHYGwQOL5kZOuHKkZxzR/8N7n+I9LJLt
	IHRz8Nnr41TBTb7s08iteQFu9DFVQ0s1bXNzrGkBfq5xkDSRcB+m40ab5ZW9dlOLphvX4nfItUA
	DGC6x32xGLH3rqAyLbx3fG7uQnCtN9OCKN0aGO2V7Q92WNyP5vQJcpGeenRmETpFlaPE2E/+T/9
	xOgX4Kd/VJmXidJuGU0qIFLqiZCq/ycOIrMcNMP+u+7rkrS1seqfJaQOtBSkr3gEVf8g6CV+I9N
	ccFRiN1M9Ty6q247XWVCq7Jqh3DHzGDfzchW4OBNpTn0IaeUlAvbAOVu8bZxIewJDKSPkh71yE2
	Tn+VPI4BxyPqqqpewrvPiP5D/TjsFqJNSRgY4rwc2J4L8j+NMxA8YbXIA5PYA==
X-Received: by 2002:a05:690c:f8b:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8b341947fcemr31396197b3.23.1794050143143; Sat, 07 Nov 2026
 03:15:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com> <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:15:06 +0200
X-Gm-Features: AclHuK-AuhNYR5_8OMU43ye9BksXkryOCBq9XAGKYISL53Li5pqA0n8BIGvcR4U
Message-ID: <CAHp75Vfu8vtRXj04Z4+AW9tkK6e8p7hFyatJ=PO7X1M29TE9OA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] gpiolib: use %*pb format specifier when printing
 array masks
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In gpiod_get_array(), the dev_dbg() statement prints get_mask, set_mask,
> and invert_mask using %lx after dereferencing them as raw unsigned long
> pointers. This truncates masks wider than BITS_PER_LONG to their first
> word and relies on the raw unsigned long pointer representation of
> bitmaps.
>
> Switch to the %*pb format specifier, passing the mask size and pointer
> for each mask.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--=20
With Best Regards,
Andy Shevchenko
