Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F1383306
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304683; cv=pass; b=spaAuuPtDAoTK6tkMK+/oDNIyE5b48ZOrC11SV2Jg8Ogxv3d3YmGPvDOOKcauhs+PdpKY2bzWO6duj5WIdBUJ8LLCmtkcgqAKmFawZCN20+mvGUkjmuBzAVmpmwzQFsDoghZwYLR5956vseJfdhsTLTbC9bAI6qLQzgS/2sPvqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304683; c=relaxed/simple;
	bh=UyC4TmoiMCI58j6Mo9O0xej2YXLg+tRwPll9c4knmbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUuF0+zPyxBuB+erBtLPz2DmmE1vfHkD3j1eR2QIEruo0qOTNv+xSVTYTylipwmUBvVQG0InoRqJ3LFHmo5pkCTQ+l8GndWxjaWIAYnt9Vmh3r58J6CmtO2UR/OmcU/WWSxGI3Iyl0m+4z2yEUP3vDa6f6Cwuh8CArVsARKgudg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFREzumn; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFREzumn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so664672a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304680; cv=none;
        d=google.com; s=arc-20260327;
        b=OEDAd3R7u/RZGngJ/68hxupnGdiXjBWRq6CsmUrtWZCDjB6ALo0OTDqwyit6AStspQ
         BMOV+PaZalWGM7/7V+1+K2XkzNZNZRqbG1BZF2uZhVb1Ktud3AQ1eToWiUjqrU8MBqIc
         psKgfDXXinGQRe/jF3/DjX/GKFPYYI+dRZj0QQuAbmBum3Eqog2Nv8qMu7My0WKmr2kd
         CuWCc/S9HKN/vq94umZF3orYUybGeKiw28cssDw+AQWkZXWjUDKmD0HvGxkiyuu1Iki0
         Qf0K+WXvZemcQOGzswv0xTLv1USCeVurUA/X/gubpKswCqZwUMQ2BG3Shc9EYcTKRS7s
         EXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        fh=20WylXGx1T/EeMg+y3YbgTlRUrTsEUIuUPKgbBwSqyw=;
        b=Messg+fMjFnpaqMUHuTXBRgWB1aeB6msZEnESakKyA+vIFJZaIfuAaUUZXPDlvff1y
         L5aXAWo3NwFXyyddXgB+0a25UzZsVCD9EHDXCouMzlKSSi0feCyXDtL1pWSezQh/k4Lr
         Nev3oqoxXcYVvbQwgDZtcMyns7wmxJV+EzBdy36wQ96b8Hnm1LRdhTrpBGH1EiGuLROn
         vTjwuG1WEQLKs9izizM3TVQZ7qOKeo+UxTcESNrWECtzY1OJKfR87VOyNUxAZoLJDV0B
         ziHv46XvlN1R+9SVA5rc9PuaQtN71lSWVeYFrGsNhs/KckAjDsCHwYg0hGKvvN4iZkND
         8CFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304680; x=1788909480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        b=SFREzumncTogcz30kj/2AolpAkBQoj0T906I+BPA0nKYSlurOrTu1q3BwR/HbqFKsV
         0Gdxqrf02kr2qXWC8jwJQZ1OkTIqG7rxZ4xU3MAnXArsXB4HPjDvkWnGXZM1iGzd0Lzo
         bprtS0nl9rhIsM+ZNqB7R+zQh0wHGHYT9Do/JVf9bbhtiw2Wm4PNmA5wekJJZ0EuEMM+
         p9kZL16LcQqZrWTApWqr1JuNE971EwNvtIct4zJSIPQjZIdGbjZl8lw0QsvrGQClKH2Z
         +HRS7Xy20Eu3dbx2jtKClWDneJ8n1doBbknulO9hpM4HqOJW6V3+xfOL10WRPkmRlZPr
         8L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304680; x=1788909480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1NUNpozkrWM9J4tTdSVIJ0LhMAIputYc/5EJgCm5FE=;
        b=a34XqDyEOUnmo8P8fzOr+AcXV6Yc5HqZBg+5I7eOtfUHZppxG4L9B1JfUlvWqiRpyy
         jmNRMiedXW4ejoMO2oWygi/sMH+rYbPsh3nshMlF0SF0T1xpp/m8goHDqi3lHOEj9kFn
         8Zq9KmZMa5AnZU0akpbwOsKZvEhrMiKI0pF2HPCuWDv+QkboIJzoOyAWs4Q9xKNplx7c
         +Vp0VuN2lAIi68JJ1SbF55CDR0yXZUF+ukYwG/ds8mDOgqfvACwaXNO/6sD71BgIa0n7
         Cazqb2Vnf8x9x2dJ00v0LARqtZV/zgq+CrO/ZDVPgw2E/2O9H22T6Z+iGyPIw1G6ySmy
         pbXA==
X-Forwarded-Encrypted: i=1; AKwUvBzlTK5Gdru72gmKGvi7JgozSHNpqYa6fioOvzzYUVYszAyBWWz6vrYPS1ru1FvekDBjjWaCktnK/eeH/m8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKVPCeuKWoZQOUTKHvkyN4Bu9AYnaosnkcBpcqzKQpiAwSAMSn
	sjNSFyQQHFn+AgL5nJ6ys8/+y3LzbUeqsVW0f2wbgbtiatvWkEbidrIDjbcc7oXd4Ilv295T+IB
	f+UfkHkSi557/5ar/tfbkLUjhj2/ucbs=
X-Gm-Gg: AYBFou2qGGtblIKAfJau3qfLA6BkrXndnrbhwI2cz6U+NqN8LafgkPrMftjsMLhWYI+
	K+J/xY3tIY3fgk8WL7ef/IACS4A02mtOnVRr3GvT/AF39vHmCgvAC6yukcHI+I9Kp5MPqhVuN6n
	vJfvipCAFVUv+QIF3jfQ/0/0LunnNFtdFfX4X0Jg7ZDWAHedo0AC8BtwYQeh3/AlXCHTG+wz+CG
	m2UYoOGlCrRJ3Tw4Ej1O39j5RPkCdziYM4Yd+PbDRfwZ/9r5q/DoZ5YTbGZ29iMvFig5Ymr3/G/
	U9ElyK76lzT4rMrN/8FjijZr8hdyYqIiYD+Cd5QF2ygw0g4aLVLtnADg8iw8v2E/nm3C+R7iq+g
	Mjhd8GR6qwZUMM5sMq174jJ3/moRYWYM=
X-Received: by 2002:a05:6402:428e:b0:6a6:32e3:9bb with SMTP id
 4fb4d7f45d1cf-6a685355737mr219693a12.11.1788304680434; Tue, 01 Sep 2026
 16:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
In-Reply-To: <bceafe2ff479886d45eb410d8cd4db0027050bd4.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 01:17:48 +0200
X-Gm-Features: AcwNN1X_Iv9XjGSFQ8VW6iWQHe9ti3jzAg9aVEBv_Kn7TDfBYPU8baP1_PNzJSM
Message-ID: <CA+=Fv5Sp89A1RMBi_oJ6evVVRdHQ3NmoqJ6=4oq2u1kQsESgjA@mail.gmail.com>
Subject: Re: [PATCH 06/24] alpha: select EDAC_SUPPORT
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The EDAC core builds and works on Alpha; it only needs the architecture
> to declare support.  There is no Alpha memory controller driver yet, but
> the core is what a future driver, or the existing machine check error
> decoding in err_ev6.c and err_ev7.c, would report through.
>
I tested this on an AlphaServer ES40 with CONFIG_RAS=3Dy and
CONFIG_EDAC=3Dy. The kernel built and booted successfully, and the
generic EDAC sysfs hierarchy was created under
/sys/devices/system/edac/mc.

Possibly we could adapt this to have EDAC support, I know it was
mentioned on the list:

https://lore.kernel.org/linux-alpha/20251125224352.32034-1-linmag7@gmail.co=
m/

Either way, this looks good to me,

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
