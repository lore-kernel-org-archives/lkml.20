Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794617041;
	b=eMDalo2MRbhmMCOFyQVROCLsxq2POOBaD7n5qq5larJ7nSR6Rs45WdQ4oaQIfKBIsIbM
	 Oo5c/v/yvHjSA/VUxi983NsOUe9rIxqRiXhEn8Fw37mHrTwHeh6TuttlecK+i+A9VXw3a
	 t1vKmziqoxUJ48CGYP77QuX32xU8Nd8rN6Tcq2whP+zc8htMUcO/n9hPAx5Cs4zC+ykCa
	 3iw3yrZweVcqAHdm7KaO7ZsTOkdvgWE8hx4jUgrxIKp0wBirXi0FEKdotxSHgrBQoonDZ
	 Sf9zdLEymsRn+k5IuRivErBp2x5Zg2HBzMQxDrQyYcNNcB32BIUgl+PzNaIi9n3Z8lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/SKaeZs9UUdBSjEG4Yxl5VUOK2mO4Vo9Wp0bSATsDS4=;
	b=Zt8hKPrEYZz9NxwO93zHuo2At+d5U9zevDHaXOIuY4rX94PdTl108x6rIzrqFb/uw90X
	 GyrYSziei9sVX/jGbLie1APaRU8o1Io2zyewhwJs3Iw2dd00TdrwRmHBozu3QRTmm9qx2
	 36a/BSy1hWVxfiGcMdE+PguMjpnljelww04b7VX9ArwCtoT3wplaKqapR/zBKpeRcuCc4
	 QXNN/J6fyjc4hpPNg0umwmvZELDFHMKAhLWWWEcScCrLePA1XZTLSUEvj8qlW57sk0/DY
	 1GSdKcMtHza2yj2u+LIaV+Vh7EmZ3AfqLKiBygBdbTZbAEu8RaaRnS3+0QmtwAqQW+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIiPboA7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A03606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A03606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIiPboA7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31448caccso13998547b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794617039; cv=none;
        d=google.com; s=arc-20260327;
        b=OiN0PVaRCfxTJEt9f358N2i/3OLGHk330XqBMdkvUiDg7mGA3JvI/6CbMDXC+fXibj
         O+hGPKUyX04k6kAD2N9j+F2PnSmF7wE7StpYPo8Z8giiwPlyXFxC2tWxf9X2bqz/VQp7
         nxAhqxFnzvEzEH8uKkZVNFSUMPhLw+hYpruvpRt5f6R9p98kY8oaPldn8sQPz3YqQb0L
         xE/nLpJzfHkpi6EoPPqMf9HNw4DzxnNXG5VQFSPLbM8UCuy5QQ25DXRgy1+zvZUDB4lz
         oB5lqL6EHWAgzDJCskCvQirk2qJZ1dqri+jrwDdtnquAgis/7jM3KROSRLAkREWt+1xB
         KE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/SKaeZs9UUdBSjEG4Yxl5VUOK2mO4Vo9Wp0bSATsDS4=;
        fh=rXq9zrBqwZpYcSznmx+dzWM9CbmwJDVpsKZ8OkbktDI=;
        b=cvykczkQ2+ujG10UqhA29qfBt9N4sbkvMgeX97fxeASvXpnsOCsQPjPGYy9G1L/UX+
         ieIMpoEfou80biNjoeC2He64bqWDc2IIWPEV1ynCVQKGf+SZNZmSjAqenonfIpnEGYmf
         B7WEO39UJQOMTYH7li4B2AE78tzKfxvgZSYA1gVvGmBL0z+MNDdUKzwVPQFr8KI7nMHt
         0gNHPEsqQRCYkRbWlO8fnwk5vls+RwUz5C1H4O6nSQOfatfcE7DyzAAWd5IXqS7K2BaB
         1KvAXyhYSop6vy5UpH/3FUVBDe6WwUq6pY/+YLXtFeJKbapyy0U4/yKenivRHRI5Tdab
         f6Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794617039; x=1795221839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SKaeZs9UUdBSjEG4Yxl5VUOK2mO4Vo9Wp0bSATsDS4=;
        b=uIiPboA78aaT02qyAK9e0HV66ew/kw/OpyXLc3uqKLYOPk1Lgs21MBaZ7q4hblGQRw
         ccjGyokUt3cE2wr0PzhUl31atqOVXAzUNPzCityIwJhNcrCEUIbZLiPLG67zk1WieQgJ
         zLaSXOHfRmzHNdJlIzGCrziyAFI8AXZTTvW5JT1NOihgGQpLIADFNNCcpLAWK+hHmP30
         PPnRHHqyC0P3MsH3nOYJRjhcA0Gb3pGvrLyhF13yraB6cu077aQdwfhSmWIGsBmvjmbe
         6MDL8rfeJJ5/E/vDYMFeN8Og9VYBk79NzyWvyHIKiVMgoBPqarpqxotNrziuZhR73dLX
         xvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617039; x=1795221839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SKaeZs9UUdBSjEG4Yxl5VUOK2mO4Vo9Wp0bSATsDS4=;
        b=G29VGXE8HtI34TcJbsqlUwpbg+0BufGLD7kRmc0tbQ0ViZnr23xsp+Xj84yVz11loo
         xk7Vm7PndKsdMuZaD8GRYFkh7uLakDeHpeEIjYrQRVzV89ND5MGcpvsucGnWjcciB6sa
         MOBAK813qvL/CBpK/ngDBAqJmGaPvyEXN2HKF+QpRo6L73G7zjMVTGsDETC2xL2b72+L
         yto7cSwvwmx7qJ+dfIcLX2gpJ49xrd+ScuXCSgBBuZiHHZa0PacRWmMTzZQuyhw1RhfL
         Y0TBDXdu3+CEbVoYReKl0/HqrLmleAxiGJPhulL7g3nP+0lovqsgs1dP9fOMfLaiOkNg
         ZaGQ==
X-Forwarded-Encrypted: i=1; AL+hErEB6KVpCN/Gn41c2cL5jOgOF2mggeAfnLZtvnO/s6yqPEHc+fDkH21IQgcGeiJ71XMF2lrD8GZy166arvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyxPIi9em/aTw4LDmpcoifFfxq1UOhvVfnyVeM5/biPLiqKmM
	RMt99Pqdd4kcj7uKb+r8ewQ+eRHHYqw/7yQeMyPN29xVwnhfxy+Q70/0dJaxXj7qWPaX40AwKqH
	dqCESQpNpb/PnSazfuaQlWyWAdamiSdA=
X-Gm-Gg: AYBFou1CbWMI/lP1EmhCS7YEVnC9h4Wa0QWL/lK+OSRZruGab0dTrainLFEGS1HiQDb
	cNJ/gs7PWQjm95DFJUWq+nQflWV5jQjqd6wdWbGYIYzVwb+HPvD58IQ0Z/maFjPK0oyace9W0vR
	IWhW7c/Diu39sQtBMj45EFQs2pExnPq9H4rBJthHTIEz6c7IcMj9V2WZsEuxMQzlbKKnCy4Gxxt
	dIYHVenuP3kDR+jLdICyCWxRz1yypK1OOMLG+T1HekPJ7+2jF2jq7i3B1xe+cCHJwh1DOndvWFc
	hk7Hby/HhV1KH43/8V3TvPBx/Yui1mg6+MoZzcORnbbeGczLHWbvhBSuTd1BjWSBeQmFf4eTbMB
	1nXTqwFngZYLfqUXHAd+txvlUlJrsU7+U02/nZQ2GjrUQLaVvjy9RzrocCdUAz96/QLFw7yGjnM
	6PqwiQtd9LAZW7cyU2xJUq6GdsF8jDZSBTI8IL1wye66Hnol0BnBSibamAhfcY8dQTBi567UDBv
	KKcX5ojqjFzRVbic7D1Ney7QwvsCjQelodDXvt1AGFd0/obCGU9tNmbMg4Ydw==
X-Received: by 2002:a05:690c:8d16:b0:8b3:2b25:36bc with SMTP id
 00721157ae682-8b4aa2f2afdmr26285117b3.14.1794617039086; Fri, 13 Nov 2026
 16:43:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Nov 2026 02:43:23 +0200
X-Gm-Features: Aa3M54ojF2yrHM1uxVyVfHXLX5WfMRHRX0zeARiKfpiOLu5uw4jzzevx3BI1kbU
Message-ID: <CAHp75VfyTSD1zeKjZSoqz8VSBMrwoNmf9pPh+f25tiH1yC7mWg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Input: tsc2007 - drop unnecessary cast in tsc2007_calculate_resistance()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:02=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The resistance value is already bounds-checked against U32_MAX before
> returning from a function returning u32, so the explicit cast is
> unnecessary. Drop it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>


--=20
With Best Regards,
Andy Shevchenko
