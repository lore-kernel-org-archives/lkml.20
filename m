Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9032C08D0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240073; cv=pass; b=TZS0PFPfefqsBunKwzfwomUay2F0I9b5XOf3kgWh+XobvZzbARP7f5AurBRRTsBCBDlzvj+jmR+7AxpxYAQjfbeCm4zJC4wj11eF2fzPTorhzD1caJwKggHHJWMTsA6iLzNVJ6Gf+ElS/uDYutXsUAX0tGlroC301DwDgDsOVlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240073; c=relaxed/simple;
	bh=vBGRoQcJXlxAMtSg/Ev+xruoEjdajUUrjRvI4ba6Pgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWD205Y5aCrimH/5v1Uk8V6WBEUZ/2DHT7fHzXDg7ExbFKiL4AvwzQwtRPqtQLbvDMeM8ZJVT2sjzqJV3XotN40ItPZECKvUbPIDe/AzWwUGWLEUVCAztzY6ntwa9j4JnIBkYN/Aw4s78p1Jv2OEoIE0+wlOhzLecAcfvFOQgb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkapOxgQ; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkapOxgQ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-87ffa98d4a9so18064717b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240070; cv=none;
        d=google.com; s=arc-20260327;
        b=iQgA3WyceOEclCotNFIWbnRFd50knUO939u2GMPEMg4EXRuIVGNGAAviONoIMGnNhW
         k6HZ16ijVmlJcYdgTCT7EAH5+0UBfUQZa/dMYAKi7K3NRc+4EfhSSemOV15qnbPwR4Jk
         BqCF0l+TyXO63Kfjdb289SMiIzyEWOW9abcwWz8Li/VMt6+usYe7zvXkceQXtam40BZE
         Obqe4Bez32JCBJIftGBX9RdEkM5pIdvNEvytadx034nJz0RH/qDvisOqwBwyw9IHacV3
         /rAP7HBhdyX7tapkJa8d1/29ttX+/fYqaiR+DJ60BOPYd/gCv/Mx57WOUp4WVOzhbxtk
         38xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=oruRdUAFKMFIoVJJ5g71ua1AuYMKHc/KmQWej0Zrs10=;
        b=OYH6udMYWv9/i1rV9uIukBL6t22Ylp8wHFTebU6P8ESe9Od1LIUqhOYLw0ORCioiZn
         bKwdlvSUxaf0ipb/mx0fqXbd7iPnLAgKIZByKesdcMIW08zIKiBM718cAnwdDxoJqjyn
         1nYuTC4BNbQUGjhNINBjJ4zdQ8uqI8A43un2yKTgdkx4b8MqHSY5kOnLnojgsMeiSSMv
         KtPkrB7FxIFnBnwykuAwExBf4YnfYY70onUAUtJhybY5SDfZ6QHUfwo8Z8li+QG/ZSxf
         Sfrl17aWEbbbph5S25p3YdeiUTFpqx1WvoDb6z6RGvbu4jW6dpk588zokwEtR8UOhCsC
         pozA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240070; x=1789844870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=JkapOxgQXv5ET8Qb94XeyLO5pdOFXllOR0Q2jHzDfQFmE5TApts78X36dzgsP4lV2F
         AJpPEUcDjvOL9fMptDgklbypBepaL7YvWJbxaU730rnc/MoZzNy6Mhu2h+zxGE+CJc5M
         k2hgcKXkNs6qxCDziHeQObBXqeI0kQpb+nlsaaUMYz0ugBeDOBKsSZK1/hu3sLnnrDSq
         hf6LcnHprhEv4+71lL8LrKSogYSjPi/n9si1jW/+mhYjriYOk1P037UAE/S8G2X5R7av
         pmPULYCr5onjsvJKFLbXL0cmoqgxlAq4gzR6aQ/7jJhtlhxPZVHM9fSYbghe748bl4rL
         qYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240070; x=1789844870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=NniKk1PMeCUmhTrLF5+6xGuUbZ6c6bgVCr9l9j4X3QCYLEXEN55GwqQC0AHt3IAA+I
         pt8dvQrLEmgQFdmIKe/KgkXaSxjf0siVIUQvK5uyekw4EJpKgBFo+4k+3htSP5iRuqnt
         OW+c8aT5yZcRt0WPq9nQ7vtRmOOONDYVoIg/352MU1Co7Lm5jS2e6DOUYdClqj/knluP
         HIrYv9JGBL7S9V1O/JFWBe89u92yEyDzBbgvWB8RR6BVb7DAeOgdjutZ6jiSLQT0EEOv
         xlY8zx+/Om2EeUCmKdrDAb9aTVqb5sohaufNco6MqOsLVS8pUvSLt2MqJ0XLuHIbyNrF
         iLWg==
X-Forwarded-Encrypted: i=1; AKwUvBy3mFexXxJZ4hVlS0IASdN4vI92Ua18DySP03Awb8wdAheCI4bu5A5AiWhbxStbUksCjAWsT0aZyQySdIA=@vger.kernel.org
X-Gm-Message-State: AFuF++kToCuaDgMlXLy9DFfKdTUCMJl0PBu2TCNv/mY1s+yriFvcBgqT
	M7t3UK6o+zYvN83t/iOcDDu5Hws6+50MLxJ6D2iIGhbMoHAPSPaD3ytmJsZDO5mJE6mdq8WE1oO
	27RMiqB5HS6QWPkAX3a09xgLXYw+gWhg=
X-Gm-Gg: AYBFou1wtE3dwyStDq/iAbwY0QA+SYOmSvXR1PKDkRbrUXPKKr4WBqFKk+3b3YnbLJB
	3Baw8tIMO+iDljJkVZyO0GRhb++4MybzKbv0deJXBjlFpmXWnDkfu5xTRDxdMBFhKolMfcwennJ
	yoYjgg6727oSf7ne33LRmYhKOaevmsCVPtFMZMNzsanMiL3wyK/tF+0y7HPCNk6U0Zcu+xXuPMY
	NslqkEDKBFO00tAtJbIXrsAN+fGfzKZyS0FpX1G9/pMJQm+cUn6JEdHtw9ZysAL31mdVNTfZDyd
	q5+ACkKmvRYLDq+hfHF63ZMwH7kSQ/Mz+G/LXLFvEtaFujENeZM/
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof
