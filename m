Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA64A8FD8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369115; cv=pass; b=DYwq+enXbtpuImrj0W1BIGiIvxzbiXWrK+wxh5e8pN1yqgR3BTwufFXRVer27X2uMCEBqZeGPkqX85egMvAw9RqZmNSiYuxwGSYMLYfL1nMSt9MboIjSDpBsn+5GD8mrVDVEcinK9y5xU1VBlWSe8ZBaN/C1Lj2ko9ISN72IHtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369115; c=relaxed/simple;
	bh=CAYWGXwkwt8+u/LxyR1chbCwCtu6a8KVTc22slh2Qj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBVcr9lDciS5RakiPMjRpXzUaa+/6+U0LBFYUVfh7KfimtOSOiIrizLpUj+v8qpJFRYyInZf2YliTo/CSf4nvgCwh7tOowUdTHBPngEUeVQIzxMVwK+v0AKQEFUqjUcn8QVx97B3UQZxt9yvt3XVJUiH75DanNXnNk0kXpy+vDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXu9lepA; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXu9lepA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso13689145e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369112; cv=none;
        d=google.com; s=arc-20260327;
        b=kTJ+DUwZJjYAuJ21lYcYkVRtv73LXx1353CXrEcnapVsf8AVsW0EIJjEdaIWxpehgi
         UANJqMXcJ3MYIRCC5y8su89pokQU5cqDBeKCJYClOO+GsKzrP2ZO1PWONGQiQtGITVic
         D2ADkyPncKXigPrgLI/9t1JLwmFaIYc6ociD+26EErF0GESLCcVOELpSBhUoWe5i7knT
         QKQr+evXp6BqVC8R6ILapKhPUA1bYRd5RhvhbxLRKEzzID1Olr3hfZvzLOYlWFnDnsXq
         rLqXHNoOtoNiWrQsc/GM+AVAPqzT/BdycEUM3y8ul0KVPUhvSVhFogMGZShkNYWIgpjX
         vY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        fh=yhqhqX5hm7O/k5kmHx6iN7diFiDWTtHZ4xfssmUEHlk=;
        b=aLrAQB15yohM6YJ3Gh2pPsWYYvrHCVENux9ZKXgqabgkiY3KrQ/VyNtVD0hIc/9QSZ
         qNFbzguIo2mMSEORcyb96t4D0Z6trMjYWKUpBno8PAiAMcG4jZavXAgLQK32pPlYUqLJ
         A7uYoEw7Ld2Y4tMrviGVr6/20wMX26KiSHoQ+qBqhu3dX9dSZuJhs50SN/sowJWOI/oQ
         ktsElv36ytRrTcxw0Ns0F6hITqtXibS6fw0rOOkSr+dChp1cqTe8RT7zBuZbEFkoypg9
         /cw+4f2k/UCqRO34lHlXQZU46cRNROF0qXlzBXTmDz71+8fI/SLDffMX7q8/KbF9Xy2i
         DQVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369112; x=1788973912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=GXu9lepAWHOiYOf9rNfaoVePGplEnX5Or2SbLk6+y9uPSjLFJFqjJv5gkE60U3QJv7
         EaglYNxaAdpmcnx8q4C2DMhOdyNvOorhuJeBiAzslo/l7Og6sTyiC0rPoIFi9tmXu8MO
         K4tafOuQxc8adkA0rhF6zGwI9CeEiGjFp6hwRj//UM1XOGorkJWxww0XbgpCsaDV2AwX
         EfbDNSj/R/mtiPucSjERLfsBMgSnWafHnfWnQsiuZHklt4T4TwdYOGuXCmck5/LFh+xg
         IGmQcHufBt//T7aYnLqYG0bVVHtHTSHn+279qx7GHVXbe7Rv5CP/zcxBJb+5n/dmByvl
         GG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369112; x=1788973912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=j7xgujX1NEgDJjTmmzlp6sC0WrtfyM5jFeljdzxFNauIQQpg10QkjXKmYUzdd+YXp7
         E4WdWePlLz0kVttzJsnpj6WF/CNdceZJSG1V7Xyburk6WtIZBSZHazMMoJt7A5WDBtkM
         qofbzgrKFuK8/mvulQ7417lALfQyMP029/3OE4e+A2aCfQxbdydbIjSN6OgObjyvFHOS
         swsFMzXB09KPAk3fzlIh/Hwp+cYgSuNnQitLkPLn6A+eMu3W3LePF1LfnpS0HfTXvo32
         R56gDyCOrngtPD5+WC0DNS7U96jT/LaydVkfPyAwEA1twN0q05kcLuyqOgQMV813FRhW
         6/Lg==
X-Forwarded-Encrypted: i=1; AHgh+RqdtKYZkyeN/xeZXrcsyKh62uHdFBlbf6symUDHP4eCeqxpGIGe9XpJDBSYA3TAHOB45Rd5uOU5vPpJfzE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8BLuUusdN1yQrVZxyeO91PK+WzSb5FzpDW/gNW1Glh9HP2ETl
	fAIknTqvdHtTwKfmw7aMBpigKuyNvmkhkOxvKPEV8Ic7FKNlJ8Ct79Nie0fDI3zDZHTtcg08bLS
	jkiLnqpetD9u2RuVfeG4wBL23oSbdMkAk5v9W1sh8
X-Gm-Gg: AR+sD13qcmY3cShIoCu5tcbatKS30rtQT4pIfMYmc3gb1Krt/+wDbxXJZeehrS/WEyb
	Ddk+pqQSGBk5Qh178tUtmrWY7WKOduZRZqQHevOLusws7zfit8ezJO1MhHWMfU/uxy14l/jzjqs
	ZiXgAc+OFVSAazocjM3OcAdHDBzhbKk+NpryWKDOsAHjuT2IJW6k7rLjFjUZjuQbhXJBYlBYJBZ
	Yeb+gnBh8vvG/rNmbU7T0R2d7xORA2Yd7skLJoYBfFr52Y29fmSEfy+i3GaDrcF6FUknwt08Eyy
	3AJpgPMm/8anJBpjTTZSzi7/hY9dnTL0UPjTGVbaoHQStbeWUiVGK/ZFJY2/t2dxDE82SRkqrH0
	dT4Zvmt9m3ka7agh5nxQoPvrS8Zr+Qe8WiZPAoWax+P+TDrNSFsqEIojv0rbsZSjEHw==
X-Received: by 2002:a05:600c:4e86:b0:49a:77c1:d246 with SMTP id
 5b1f17b1804b1-49ce5852589mr112274565e9.15.1788369110872; Wed, 02 Sep 2026
 10:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
 <aphSYUS7xGJjj2gT@SMW015318> <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:11:39 -0700
X-Gm-Features: AcwNN1Xmy-BrINuLcPwv_tFccFrs29sUnSKtr5FfgrTjlEDRCX8NohA0W3QuOR8
Message-ID: <CAKwvOd=P+bnKm_wDaZjBJQUcYKvVHb55MtOLKWO4k99By8emNA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:10=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> >
> > Nick Desaulniers:
> >
> >         Is this patch good to pickup?
>
> Yes.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> It does depend on
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/
> though, so you might need to coordinate your PRs to Linus with Nathan.
> Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-=
error-v1-1-b27015390901@kernel.org/
> going via kbuild tree or what?

And make sure to pick up v5, not v4. Was just looking at this thread
on lore, and it seems like Frank you replied on v4, not v5. My RB tag
is for v5, not v4.
https://lore.kernel.org/llvm/ca86be7a-7439-49cb-9deb-8d565ca0b1dd@yoavmoshe=
.com/T/#mc0e4f1537fba074b962de6b4338f289dbb26c81e
--=20
Thanks,
~Nick Desaulniers
