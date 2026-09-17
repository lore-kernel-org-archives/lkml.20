Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD9331EBA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608049; cv=pass; b=YEhvSf7Gu299U/2g2VblTVHGCp2JR5WVOmxQFHUuzxcOPUrH5tsr8stC+PHoJQNDN97HlJYdxgnqHMdrcfzs+v1TsrjqMXuYD9m0hWXzoz8WFGM3XRGK2ZbKXCCpxAI9KKXzGE2bRRBSGFUGfLhBwvSlFY8+tFnGfs8vhIMDFj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608049; c=relaxed/simple;
	bh=JE6JhFt7uwibX+/JwtwXQf+od6j4Kxf+0SEGWI7CQAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3st6OpRZcKP76meU/lju488JPHa3QhcaKAtMZde+xNPDdRP5EQNlWWniwPnl+jo0ZhSkPLp4ug6hsycecT21aZrdefbfFy9FOj1xCeJzkcCA/gW5bs/LU/1W+k7R6XfzJuf1MTadtkzLCdBBXyZ9VUTZRPjtJeGXEWAhiHQbOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgdmQjr; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgdmQjr"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso2740661fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608046; cv=none;
        d=google.com; s=arc-20260327;
        b=jx5P85dDczJKFphLf+JSR6PMDew9YTa4GcDHvkTw44dHX0m+Cu55x3PfuPbuxhEbJw
         EUylN5Q8ODaviCUSrWxAEmsg/E1zrx6IIdbchL/9z1ZMiESAxL5J8/5MlfGoTv6d5g1Q
         jvgjswmmhwFclzCv2m4QSR3OfpAR0Ig7kILR/aejlTTFXrhxmdPVoCEvWi1dwwdcN83l
         6cMcCBh1GGUt6kCk+8XgjUbQC4okhxUTE96Q5CJv/haxL4NIOoGq2Y36wKM+w2Aqx3gd
         bYlRAiRvDOeCjazFF+i3RffFOoyzV1wDyFhAUP9Ah0RpgqlUiK/qzR9dQmPgLdecprIo
         uq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        fh=PiMVznodrur1SEBMNEeELcf6pRvpf1H8jzqF3ZKr8q8=;
        b=lV/3nxQ1H8MnedrxF01gVd8ElrecZKDhFjpQ/U/1EsaaeEGSsMHLlADrBwKJVYdtWa
         wVf7YrQXNe7/4aU0BPTjCKKg/NhnAebyyJT/1jKW6Nci6jAxzbFj0hD+SXNxPVlmEXX5
         Yrzr/6uom/yre4W+P90cEGMmYCIe1A3UWqNYtGtLZ1N6rDpToHjjy/kjKgxGeITBoXBE
         1D7rqwCdptWorWnVqUPW8OZoD8r4S/Dtud0MvZpHTerqMX7T5gOLLOVamWtfqure7H30
         dzFk2djppAQ884sFWdR9ozQB9ONd29ssOCh3UkSegzC97XbUhcxkgTt4M/mu2c4T2bRD
         7DMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608046; x=1790212846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=dvgdmQjrb1SXh7DQfch2NI+Wmlnb/4wTBgmBRnr7A8k/LlGOtY2X2bSagtfGEzJq6l
         fRDRuk/dhYSQ/QpTgzK/wgEFGDuSQzuLeCHKBrYW4YS+8nylX7Fd7IM9dFdLmSx3K2FI
         NGrw31WenG4IQ3MMICRGJuTMEF56Cthio/+kt4SBV8PeFnn6xezAtOoClYQpseo50uax
         2UhKzRqYg5qn1lvTqmcJXY5/ZdnCGc/kBLiZbReqSqFraGDqGXaLRCBV1Hii8soQadr6
         frT2sNCtv5uJzKNL98ZDHFbrTpAcYIW982z/+ZumgSe7fL4ooX58xxriv9KipAtraGaH
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608046; x=1790212846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=Vy6fxcAkceeE58HWiWP5618Kutr0k3nevm43aZd3+WnTHWLwaraiS4wEwouqRVpHgA
         fhr5/mgg0vvL+gBBTvpux68HQCY0P757oGh3lKvb8payiC0Y8kcQQHrSTrbCmGPvJLCp
         Zg+ooG96GVI7eRJWrGF2PE84bKjCxufuieAr6YwC2Ei+n5V5DlD0CtAJ2rFq4buyTDu+
         Ifmsdgta96lNrhvdKvs1oJBWpCCvAnrDSbm8LaMyRSHlCnsju7jAHAUIF+nqSQZpb2cD
         DOclTg+kziuv5NQ8nOLeDa90gRAfVyakfnMM4IugYAl5TPtgolWJBTMzPdGisikJRp6p
         lSmA==
X-Forwarded-Encrypted: i=1; AKwUvBxIF4B+0HRU/SmQWdTjLSI54X7EHiBDEmaNI3BHEop+g4bth4VWaesau4ey5lVYKDCvz18+YFDT3CEPXdc=@vger.kernel.org
X-Gm-Message-State: AFuF++nijFFqGSsP807V/m0c2yRHcs+txLZtiPfWFQN1zurErpIQPaMa
	F9MroXPCtSmKTRkl50V3eyl3RxQxqoBqUiMnmgaDa3vIIWRpIwd0FgcHr4CUy2As9yUr830gZoY
	CptVcaMyGoAk6Cco+PeXIo6CxOB0vUtY=
X-Gm-Gg: AYBFou0//jNiAOh2JEycI8HCwTT4BxJA6uS4zRE+/tqkDmR+WfYChFECOhTNTInZxGX
	+b+70On9mRC4iW6XdOl802PTh2jFpGNkHIj3AESFF0JVOn0xvTBdErFxA8OoAgingIPMwt9uVkP
	kN8SfcvdGGMQHhaAnBMtkBJnblRv4qtY53QyA8IGzEvSCszSbPaDYB5nksJyvLEjii3iaFWVNFJ
	AzqJdXFSx5nyT84CAxUQKPQMmm8nREPTqg1tIbw8QPwjeefselyA+SsyzsBuDpKL63GIBLvsnKz
	eVfqaGmxD8sQeIXz7RII+epapDV+kOaO5D0eFv1uWAMHmDuh2ECceUSKEHUWW6ysHxPdAwHvJ1V
	cx2UrNg4ImyrADg==
X-Received: by 2002:a2e:bc1e:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a5f041da54mr299311fa.17.1789608045973; Wed, 16 Sep 2026
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
In-Reply-To: <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 17 Sep 2026 09:20:33 +0800
X-Gm-Features: AcwNN1UXSRHVsaDtbTNimMW42Y1gjHq9uS4TxC2W27XMSX28femBTxPDTsjGqk0
Message-ID: <CACW=pY7u2wOzgc05gHfRVJFx12CXGvZe7fCwgPZ_y8dSo02PSQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=BC=9A

> > @@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
> >   {
> >       struct lm75_data *data =3D dev_get_drvdata(dev);
> >
> > -     return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTD=
OWN, LM75_SHUTDOWN);
> > +     return regmap_update_bits(data->regmap, LM75_REG_CONF,
> > +                               LM75_SHUTDOWN, LM75_SHUTDOWN);
>
> Drop this change.
>

Thank you for pointing this out. I will address it in the next patch.

Thanks,
Sheng-Yuan Huang
