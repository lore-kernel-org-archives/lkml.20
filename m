Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5875357D18
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240237; cv=pass; b=g4YgNRfupECH2ycdBujIt4ETc1En/8BWrELLIW5oBtpfnYMDW9ECHyn1TjiFNFJmWozDXfL8k36SZflUAvmFZBewOpg4ldlWjP0dVG8ABlEQZ354FSvHUjLUvGCxHeSO47ryW2OkVhmH3gOTAs9WvRSSDlXoMEyGeKw6wi96REE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240237; c=relaxed/simple;
	bh=nC1HlSANXwPCu0TdcZsZ/ITYqsAJked312qQsvhydMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfjotLhVrZ8McjGo8FlDE4qbKarpaWCg0Jqzl+CPQDAwoR+J1wfye3n2VO55XgNy2mxTft8pywtWK54iNg+hCEFR9OYCOVbE1E7AQQc99FaF0sOSvqFs8QJWAQd/w099EnQF1c8VA0TvenS7izNez+sX9RQ2bWWyYHw8PRepWDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM3eExt7; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM3eExt7"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo9279737b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240234; cv=none;
        d=google.com; s=arc-20260327;
        b=HuDN1NdH1e/mUQGzv2PWYEYCK2zJp7Jw76iGAS3buTJFQpAjwLsJwA9zT47xOhRUwy
         /0BgnTwikoZaEV9cMxQ7MEgrkoWQoKao0CUshInwLPFU4zDQsDL7gweDaNpIbcqYsJqZ
         tgcSDWC8fhdzN4MIFSKtNZBixX2uqxhaslTpDHPhoVUo+yebIMF6MUGjxsjCtWhAXegY
         QcPO0BMQUUf7tgBSdwZkg2sFOHSrNFDm+3XkrtcWxOTXdBrX3MHvpdGJgjINJAEMo6Nd
         DQXXjYR3atG//W97tKE+lKA2ic24m8Fgmvd2SWLrSgDyODaPt9YPiTQmRHGPZvp1NHy5
         8Wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=vKELELr4YejrctvXQcMr6WwdQzuDzskAKmBTfAR7w48=;
        b=al7zG58oZ1Ybpp8edrMWNBMgHzhy/n/FrKivYQBSFT4VBkszAATfQv50Y924eFEyqn
         JL3EezAH974wvs4alfAZVY2vM7WLsbevPXErIHomL9MSbSpqtx2ftyC0/p8BD1G8Ha3h
         c/NfK801GVfhYjRhEaBl/hSg4hlRIZ3aDByoChdWCPaMUD83hOHoaOIKzrQ57t/5yCbx
         dzaKMfDWOhteupXQNlaXJBVOowGOAL6f1zfALjBs+MwNNxhyesTI7NZmMqVsC0t3ITHs
         Ebds3iJ1PpBvtrxGBfvg+KiFRxhcqfTbAnkTjom6++nePFy5vWw1UJb2w9q+90z9rnN9
         c/ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240234; x=1789845034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=UM3eExt7dIEMPJGPVysCGiZoJvVhl544RBXMSKbBfawBd4i4ZIIrytcZCFRMvLVM3d
         5eiLXNBDNhGUMAKnG6+WP65Yk3S5t/+rAwzH/7NjWzps65qzaYK5evMfM2Ot0BwfJKKV
         Ur9kMpPKFdo6S1W2rH2aAcvBKX0zTWg5fXJq+vpV0d9RLgrOa+S+PC9HyUoFTSQCjtFd
         JD4zSgPlW2NuoroUQpoOJwihbV7zD0Cg/GWE0WN2p7DYdnNKSzI3g+aNV8qr42Zoe0Gk
         JFif1loFi4gJt8pMKaQWUrcfxAo0tHc55cAf0+3XSSY9XfGaK7lJQrhx3Hx1KnuPFD73
         RZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240234; x=1789845034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=dJDrseAlcgIfke/uUep1z4hLA87y+uXcDb3IfQVvXEFAfF6esZ589SAr1S1SxWt+RU
         GX9KfJp/+F6lKJKYKoQLS4lqleKSfdTNJWBXvYh3oFP57H6dXNQHDg8n9u/bO+YWK19K
         I8zqaENpbQSdFWNfVFeiNgdMDvTf65kHbu1MCrRv58QC6lxr1enKBkO2L4rUfLuhWI+8
         Sa1iTiatMs9z3McwHvxixr4foLj+a+UebRf4Lx0x2QEydvVKl+BNfTWCF49tTBazKTAw
         7ASE/3zwTchgN3CrccxhOrgaOk2JHOEjv9HB53gFHX12mCOPHd0usPbPOpUvrTZaeKID
         rDXA==
X-Forwarded-Encrypted: i=1; AKwUvBw/Ky1YFko7wgfm3s6V2Ph+yzEBRq44t7QkjvT4b+1LFgww06TK3fhMfoe6we5HJLVWu/FnD95EYeuunKo=@vger.kernel.org
X-Gm-Message-State: AFuF++nqbaZSC6LiUQGUBhwzb8o3Ff22b0KOHfXzEtxJiMdkZqxB97s5
	ezwe3jgN07JAhGrU8bcy6HjeQksr0Eziax+i4PPEojqQsEQGlijDlbC1k7+CpGp3hu3YoraxCD9
	EqRO2sWLTiNa2ulfXdQbBBxA2hMI3z00=
X-Gm-Gg: AYBFou2xpN7mbfg1DzzUf4KR3tvGZHtfL321TT0mRyT0Q8KSLR52LBUHyhVWgl9XghA
	JfbKEGSG/c4OXxzzT5os7hlrjmP8fDkAzU98sYiPBYZF6tsav2fGiqg1pvRGmuBce1bBZ3tRpU1
	74OMSpRrgcv2Ny0Kr5DYGhOzRpdehk7eu9SEQCXRmxaFcBxnoi9lAqSQfPdQUi8Aop8DoS5VBrK
	fhEBNHw/c3oCVWasUY5MvE4mUUnVVE5qes2M+2TlkLY885tqVeK+P69fk7QryYKdAMpMZjxM9kZ
	g/IqlER9h8JhoZQ9hf4xC7ub9ixrc5AMANT3ysdMBM5prKnpiJ58
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
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
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof
