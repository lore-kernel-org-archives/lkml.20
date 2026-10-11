Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B8E453A25
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744058; cv=pass; b=pSV2PkhNast0h0cQT8IIvmMfWr4MmeVPfHnOOWeC4cGVRM5aMMyoDt2hRVzYcSfc5KU7w9J6bq+LchJ2DitGPt23lbGznsXnlL2BXXiyC9g624gVHQsFMN8RLKG173fM+myP6HkfUpw45u9lDjd3u1op2EeaeimlO9Tdxd6veH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744058; c=relaxed/simple;
	bh=ru1HcpddrF7ZhWjbyLCYjSKdq9ZS1lfVzrbw0XuDiFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9O9aApU4EAIdT6XgQsvFCzuYVEyFs6+YxqBzONB9eZR+fgHsBiepFakCVu4MXggRilol0VnBXRoy71oyCWsRDtt7KH1ttcwTqE9rDtDQ7fcvCdQe63K8LHstJSLsDWis/WHN3xDTddA1MdOIRvN4ziePtQJScf1KZXV+qD0NPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1mQJNyS; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1mQJNyS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1643391a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744046; cv=none;
        d=google.com; s=arc-20260327;
        b=sb2Gn8HhV3yiXf6vwRnyKePwTeD2USbxnI9jvn8dLsI+pZxbiaA/FrHVAUGTQQ93XU
         8KFyfAYU8du4GcmTenPMjjPKA/4fNadE0Z7LJYdSgd4iArDo/vDDd5MGQ4YUwEB6hU9W
         G923jB7DC6GgC4Fs8G8+vss9+/joNM8PiimSUx8F1IMbvVxSvwqRz4k63FJcy1eAZhZN
         xutP7G++3Mf3U9nUhCmXni6iVliBN+Ec8pzGFX/b35Rdsxh6byZaJjzrIYlgQa3M1Wsd
         AXLJUnage8Njhj7TV68ScC0mN3pMltKzc54nMSwRcT1CYR6z1E7tgJfUK/BdTRwpMYbM
         QHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        fh=WO2OPLL4g2nmH+/0VxltIoRyDNnpNpcBegMlMMjLTuo=;
        b=OxlJKJi0qKkn5jL/CkhN3MQ42sU0Yxct8HnZdcA2uFKnuuB/agt0saUuEoO4dGCSkB
         6DiEc5+2cRCUeCPCCCNn77bfTtUtbIVtYy6USkyubbjfmg3d9oz8nWLY9jWWdyGiOPkh
         MGaa2uqciAhVzOpE59xkC4qWpegsxmfusZ8rwBxu6123qdTYnVbzLqmH6Ip107TTfG0y
         lZnKtww8/oaAWeQC8hjivZb55A1eSCm3VOL3dk0o8xrtnwL9QU2QM0vC2hS5TI9LPJp7
         pSrjhW/SNmrHrbo1pwFh7YFVstnwMhgIrBGHhURUt0iiAVtDG+AfGXB/tEar8kLLWYoZ
         MFkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744046; x=1792348846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        b=L1mQJNySaSlewL5YnVM5JaiCSNBCnwmwoBSuSX4LtwnCUiEN749tQ3JEIw9ZvMxnMo
         O5yCmRgMHUykDdRgpVwccRP/GORjIGzdN7ZNaiKQ5MhULnNt1rWejU/1u1guN1F1FZQA
         p/2takMmjSb4Ch0HQB4uhhE1JuWGeKDhTZxt5Cr1q2B3Olvnpiy77jPablt3fyrC61Hi
         ztaO6wRdYK7Hkr+m0oDMQsUFME+AW/gUKbGH6t/bNtQn51ZbszKYSQGH5sE7HcAdHxOF
         stj8kxk6/f++Ma7/oCWw/Lva6Qv1LmcFbZIfs3vVaYNau1FlYQ/+odnmnKe2+Qhi7a6R
         /rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744046; x=1792348846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        b=QbUmQPFlCubNTGTl2s1qOmxdmTKa2ErC8voWg0fcscrwtlqMamB3zqYDx4kpDpWG3C
         SRTOHLV9ZTk1D5OMvXMT61cK8EYsDwuFBFIAUC36Qij/fVRFwfBQ0yihzwgqDBMHB/V2
         qU1qxBOk9L6ntecfVtX/VI57bRqPkOB2RyiK4DwZu3UjFXbPHiOknYDKoZ2fl2QtIKru
         W7H/AY3gCzbehFnziHxBOG4qjr7JsIv/7FaVbRK2CoYZseaZocEi2VWLedCeIrpnTIc0
         P+caqWQVj3xCGdtbzO7ciwd+6GqKilPJyQPG81qYD5W//V3w477WcFpKMUodCE1YYNWJ
         ohOg==
X-Forwarded-Encrypted: i=1; AKwUvBxhVQLSlgbSAr+IP/4tExwvnpMa2R6skBogPfz6OxnP2K4FusvRHYra0nvKeR/kxioxMm2lpzUvWHPHvs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeJ9MtCM3mKlVgFWFd2g+gPTOglNEHxnqKrheeXWP3TYPuUWeJ
	EAYo9+H8LDWdoWD8ZAtq2aHxt6BqGsgmuZ/58I3vORlk+xhoaOAc75GViMLQ5NSpzHYJnqLHURJ
	krJA7qMnvZaW2M4yy9CPVy8EGfwDGsmo=
X-Gm-Gg: AYBFou1QDraHrFeQylgBziX3yDZ9J5GLR7Xg+XzO7Fjgiqc8GXw1jFeeJLFwH1B1+Y3
	sPHNKgCHsrYP+9+XHYPamkXawQxfOfOiQMrbDNuz30MkAD03deaepTm97EBTJeVq+MduPx641rN
	5ySsS6/MIc0oxG8SOu9h/yjJUlwQPoy/D86Go4dXoXVt/Jnq6DYVUYCBatntboU35RBe2Q8BmeZ
	3NfREmb21a7sAyutnw3XRlh8fbggnmeYcZwU1lu7BsYuguJ9Z5FQ3220exSAgCtciZ7rn+lFcNg
	ZIg+24Ufj7PgSH9WY1/Y8Iqq/FwPPbjyVvHTHd0mH1m9PTLQPprBgwdaMsKwUP+YfZ3Aah0S3gx
	ZXJjsL3fujmwgv8l+c0vblRAZWDRBMqUCane7duSZ
X-Received: by 2002:a17:907:3e8d:b0:c26:36c4:858e with SMTP id
 a640c23a62f3a-c31aa018731mr740472366b.25.1791744045539; Sun, 11 Oct 2026
 11:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002191434.58529-1-meatuni001@gmail.com>
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sun, 11 Oct 2026 23:40:33 +0500
X-Gm-Features: AclHuK_PQr1apdUCLCKqAhzYay7IqnMzIHODUR1hbQE3Linc1QaibmLRagzo2j0
Message-ID: <CADqcGBnsAO9UN9KOGtp7uHOe8Q2tTuheDrFbUOd7Cib3VbXE5g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] platform/x86: hp-bioscfg: buffer handling fixes
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have sent v5 of this series. [1]

Link: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.=
com/
[1]

Thanks.
Muhammad Bilal

On Sat, Oct 3, 2026 at 12:14=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> Buffer handling fixes for hp-bioscfg.
>
> Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
> handling, 6 the sysfs store paths, 7-9 SPM and integer parsing.
>
> Changes in v4:
>  - Add patches 4-9
>
> Changes in v3:
>  - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
>    and declarations (Andy)
>  - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
>  - Drop a blank line in the declarations in patch 1 (Andy)
>
> Changes in v2:
>  - Split the hp_get_string_from_buffer() fix in two (Ilpo)
>  - Drop the lib/string_helpers patch, use @only of string_escape_mem()
>    instead (Andy)
>  - Add patch 3
>
> Muhammad Bilal (9):
>   platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: fix non-ASCII truncation in
>     hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
>   platform/x86: hp-bioscfg: allow clearing current_password
>   platform/x86: hp-bioscfg: fix off-by-one in password length check
>   platform/x86: hp-bioscfg: fix heap OOB with embedded NUL in store
>     paths
>   platform/x86: hp-bioscfg: validate SPM state returned by firmware
>   platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
>   platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
>
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  2 +-
>  .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 20 +++--
>  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  8 +-
>  5 files changed, 51 insertions(+), 65 deletions(-)
>
> --
> 2.43.0
>
