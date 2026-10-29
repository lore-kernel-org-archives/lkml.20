Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280771;
	b=k6XOn5GEIc6rPngQlEubXUxpg/tQxOi8PeHRBwMSDH4MvDQ/rfaAoslAfV3XC45HiY/8
	 349A9yPQXV1OGPsHSiIoXQI/XsI9ek0GDCaqL8yetNAecw5PwIMQ1lF0q4BtwQ9HEyHZu
	 LcfLX8m09UY5LQRL5BscrIZSKwvoeQzBG768jjM0JlglMJww1YDd0gVJFQ4Rk0gnCHak3
	 Xbbx9WhQ6KEnSJ4ZFpiX/Z7njf+Px7MDzBQz/NHbvCVT+2iU7rWHdk2AzqZLVxKNF3b3z
	 Z9pmVLGivgfoIGUPhDdqgGsfqJqRo2nsx7ovVFiq+7kFmt5Gox7U+/u87iTnc7NyXIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
	b=hx/SYtGl+y0bkBWnJgp3X6SJFTi5DMS7zz5DBQbmqO2yEeIKE4TacGAsKgnBa4RmSi4p
	 vciUrnyElItLpwTF34g7HxTeSbDnLGnJdPatXlA4505RnhjKzyZoi/D1hFxXxZvtfIrvz
	 ipx6BQUoZtGfA5q2XEIeMklLorX6229oIbo+0NYSbxJIHX50k0nDXjvixivj42sPRP8Vj
	 rph70EfnJEAEMWrZUkEOWNB68bID5PQ5yhV1TBgHMBC9jCZ68/9haK6FBO1iypDptGYmb
	 30lD6/l9zK/VtDMvD23zUkKqXHuDegxGdbiRZ2UenRLOf8xD5aNJu11A0yIiQPdBsaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Srb3liYE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A28606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Srb3liYE
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c79f306e9so22403096d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793280770; cv=none;
        d=google.com; s=arc-20260327;
        b=bPKdJRu8xFA8rTNyacrg99EiqYqO7T1jOEKe805BXkInGnQgCAab1EpPVSJLuOi8CZ
         J7d/lV54czfsD+Iyj9xD8v9a8GsxE+1nV27LgxKNfijyPt5Jw1Mhc2PsEyDyRmeGzjsM
         8UwrISgDB0heLXQWszwslv4Rszff89PP1vknbCrNGq1B7RcC4GR4Z0Z04WqV1nUCgIs9
         FwikZe4hKTkNLIbuDoZsvmsEnNwR/E2R9XW9Auikk00RP2suJq3d+8W9sR/KKKUcPBMI
         tOMHZU9d7vGSrW9yXPC18OHWZiS5z8fiOySfT2gb8XlHZAUDpRGOGP2dYvKiDBJU0hoS
         mw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        fh=37qyNa0bSQ2j57F7qEzUbFEN5jXqn/bF0Ndezxl8id4=;
        b=Yo+QwLd2XfqLil0k3v7n97z+8G4zDcoQnnfO80At1NumJAvSZLy6jmPuGlt+M1oBju
         9cVKwhQP/eYxREH65dJluUEv0/Vpn4iA1Dqn/h+KAfCznC57RqmBpmMi2Fw7kY48WKrH
         lSzoxxK64kmZK2uSuXe04nJ+Mf92a9J8lF6GABo23tY2E4srzjdkkP7XSLQNLThVvMvD
         osHkvncNdd3Rkh15J4iWxI5/3s1FSsgcH31QNLg4HJuX2HgMUyMksK3DDx+TFfU5OC5E
         AgugkL6034E9H8io6pj2Q3C2o4ak7YvVJLeNypac7CdU1QSfDMV+i3x4llskI1YDIUZD
         /C3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280770; x=1793885570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        b=Srb3liYElFHkYRqKVWbEuMwxViG99JwI03Un5lq/mUw5A+b6LkBHdE74VDLbToywRZ
         MWKsDrJaES1Kkv9gwi/SmpxXnKMLNmmhI3h/153V34Qw6qWz63zmzvvkQdWypliUFAVn
         zocflyr+2DooMgDyIBJmnJtTEtT/unIkuW5L0tyjEcJa0+V0ipX1ycubIdnMCfTLv+5w
         lMR4NHhMAId1WRtp8Gp2xdrGP3S86o5cKdGFm5jZTU8hkAIbufizJ2Aber13UXQJYcTu
         RxvrI6Y/mSFkTp1OnzkQHIcIyrxsLe7c8pPBIRU7plA5qMp43mHbLtovsOajOK9NDtwF
         kYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280770; x=1793885570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vg2B31cd/hTXKCM5yDVSJOCgmQGwulQy1RtYoOwjjyI=;
        b=Wmdoki9vrvJl2xg7b61k+GFHlOpxISclNum3faU6oFdaZWSNZsn6L+bW0/wlMqzkD7
         BYB94gFvltc4OHTf57aIzEnjjaLF9siqrLABTXQE9ivjb5/2/JBE4vKRKe20LW0VHAdF
         f3kHcntNiH30HWDC0LOWY1NFvdQtQvSrt7crSZlnqMM4DrLMngHVAdk25McLmGUpbJ0/
         4B6ma6/STaWZ4QE4bB1oEI0wi5zMCw9ZVip9euypLisB1SZghyOXkXqjVFguK21qvOar
         7YsWtKvJy6FFQ6SEl88KtpgoMyXg/N0BMi9fCt/hh8rCO2EoTHjhVFHXe8OxWTdcD4Qc
         8cIA==
X-Gm-Message-State: AFq9FYJqTIajall0l2x76QopXy5Ax66FdylL1nfK5Y/BkHeupN/9sCfl
	JuUN/FBiKjribUSy2ey2NdiujtidmxAQ4RCnottIKEkv7hx1nxcQIUnJJFfHczbbqaCDj5NTYQy
	ltSuZvcIVYzEoMem8Ol893WSDyeyKdLg=
X-Gm-Gg: AYBFou0PEifYXM0sp2ct+xlO+O/o6CDjxeLdID8kEYu9QGwE+GrxJ+oX41Bjv9mq6g9
	MUHfGOg1/TwN6ZW2KKiN3Yhz0lpkHVBJQRdDKcJIIIPHj7bWrnRf7S0eq7J58jKGtf7hlnlsT9p
	iTMcGyrZqNT67gVe0OMXQZIp0+NBXzphRpsUZ62Ww9aSodtAsPO13rsQ1sG7PNoZg4Qdk+yrngI
	J/X70LCd680nuz0BCVvIL4cEOXBnIltE7hJYz7w/gPp/mYP8gw52RFoCkevMlYknwHs0SGFOzhy
	OEx5PR3ne/vDwT8enKrlZsmXDebA7jJMejbO504j8Bmq2yt6DML+1DskdCpfK0j7p3CofiSFWNb
	CG0eCNOPBio2ZykB6iUUyPqNm/926NO3DCRJzqg==
X-Received: by 2002:a05:6214:21e9:b0:912:517b:844 with SMTP id
 6a1803df08f44-91c7d1e7b9amr85298716d6.40.1793280770237; Thu, 29 Oct 2026
 06:32:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261028074946.12728-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Thu, 29 Oct 2026 15:32:38 +0200
X-Gm-Features: AclHuK9IYKidWvC4mXwsbb5Jri0C59sT2rp2wR1GLRuJjUbsYEIhucnxykJmH7Y
Message-ID: <CA+YDrKAaU1EXGhCtJ_yqBrVxKRs0ykyAibvtevVhRwWyU-BLLQ@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode array const
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 09:49, Iva=
n Tverdohleb <mbkchelofficialdev@gmail.com>:
>
> Make g_fbmode array const as it is not modified after initialization.
> This fixes a checkpatch.pl warning.
>
> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm=
750.c
> index 21e310274..47d2917cc 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -12,7 +12,7 @@
>  static int g_hwcursor =3D 1;
>  static int g_noaccel __ro_after_init;
>  static int g_nomtrr __ro_after_init;
> -static const char *g_fbmode[] =3D {NULL, NULL};
> +static const char * const g_fbmode[] =3D {NULL, NULL};
>  static const char * const g_def_fbmode =3D "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview __ro_after_init;
> --
> 2.56.0
>
