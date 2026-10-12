Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD241F7EE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800530; cv=none; b=WbSgziemPNGRQl2yplN4ZiORqJjDn5YDG6SQMS3Nrr4ksXXd6hararYMilZypGxSmoXIM2Rt+MLHJ26QSrqRdUXne51LZ8fAlZaeXrYUO4eDjL2G7WjCefBHpvSTB9eqxNy/i6Io5fVDs+S4Rj2ha9RzsZ4txmPKP7yOIL7gZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800530; c=relaxed/simple;
	bh=KTzcEEIV8+14IdfGz+5QCVuiMenTgSz2gLNd0nToSAs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Dixt3ibCLj+TP1QNpK+HA5Qo77WhKycEKugESm7RbUnZBefAMJ74kV/9uOGfU98sEhCzgiFMzD2G/fHt2fWKebgc6S09pq6CGIwC3iFmByaD93OBDSQZGQ1fTOMBWIKg0Wtum1J3dMDf77JNQ4mPiMjD0I/36s9pl6m0SEJzRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nX9givu6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nX9givu6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso11342805e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800515; x=1792405315; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=nX9givu6ac6FoFgoWGJH91a/ZycQICyRPn3wCQtNndEAYxvS+jBuRwiu07OKg+0XG0
         xWZOeFEGms5UMp11JpIy2SeZMchu4zJpLQt1Cpiqnl5UVxyPGGFeru9LpN/nJ4Dxi0MZ
         uzy2rv3Wx+CcnS1t5g6EQA26a9YNe1PGVEEpOurVrHiFoR8Nd8Yft/S0noBnYVS8Hw+m
         sWkDWoQUW6ZL3/8duwcseX2nDBeueSCqNTSBVAOGTW5hPsNfTRMHSVlZ7eZkDVaqkZy7
         B4JWLzsJ5enuLK5V0zTS4cpl1/ElgpIKQNt2iX5Pdvocrq8BW+FKSj488PTrEprdtn+p
         e5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800515; x=1792405315;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=N4MiNtPvHxOVH52n+8GjESxN6o3+jkwDIkC69/wPTCO2ycmVcSugjQx6tNKsUQXVaI
         T664/z2W3hohIxCoZQNtiXyA96POgeCLbbStfbA0Ts5s0OQcfy7Bo45cd8X2XE6iRpnT
         wEdB5OCZz5VIDrqZa0hWCauoN1FTG0ukol2XgRSlcdZEZLeI50/XDsiYQcMzJkV66Pke
         pdYcXUnHO2z+qCdvFbgm2m0I0+u+vMxTF5C/hqX1eImOlmoKaT58Iw26cd7ptfSp5qrn
         NpTuu/3S9xX/eGPYGLv++qH6t3m1ArUet7VQeZU9knB6rpOAAjreeqgfkw9j2bjU9W4E
         f9WA==
X-Forwarded-Encrypted: i=1; AKwUvBzwpq7wMhbVFKD9ZNkCVM0xJzE9SRq55fv3gu98jrh8A0Gt0PdCE6fd61qF+22pT3mXSw66CAETbfRxL7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn1K9mkLFDYGbndUwfxdJv5u692F7erIsZ/9OtEmEvSyEkP+0U
	zKxB2ksCj8Ui2u5TXTq8t3gojsRUjyp0VQkJ0aV148dtT1c+GI5LzTlpNOjbqfDMmjE=
X-Gm-Gg: AYBFou1rbn3TcdHGFwxNk1KBaXmP6vI2usxd1RatWWBKvgRQyWS7ZC3QhiNgjuCTj2T
	8JTEiiD8S/iBD47LFVR1Kafzh2xb7kUIXDmcBivLOAwXLdLWA3P0u4yX/+5Goj4KeswEEY19EH0
	ZZ4sXZqnMtUU6b02ChF8nQHnAud3a3Dfkb2ns05Jatp85kGWSIvu1aF4gq2kxDMM8+8Kj6kqdoa
	cJmZaPej7ii/sE0CiQnm1s78B8hRAPnl/wsjXewBnk8Zby+IDu3ug+nYkzPFlfFmPuOOMQhHaUi
	hSZcwSZW+NpN1VFLHIEpFnoNqkYfgz0I1s1MRkPVIovRrENngwfG/fsTyAqy22t0OJLhIDyQl2f
	ckbG5iETo3cqL/fwECL0h30oyzaupJmYqYtaLvPgIq87A5yu+BL/jSRb9cfkyXXAhPJx1E2Mq3l
	K/sYI+dEGXBLrQFA9KsmDpMjbroIhrPZ/mDOGSB3FAbP4ODtaP3lNbMfcVpHfhq22J+mzDuFLkT
	4XjdG4I+9jOsS+rlw==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a1a45a08f7mr10336415e9.20.1791800514835;
        Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm217256615e9.1.2026.10.12.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 02/15] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-3-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-3-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.12503537219212348990.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KTzcEEIV8+14IdfGz+5QCVuiMenTgSz2gLNd0nToSAs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuzPP8dXy6Hr7ZO152eGBWOgUS/bpau8T2csOdxxT
 Sj8zfWojlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkbTDD/7pj0c87FNevWHG1
 a452YO0SH3a59MS5FbdNrxdybVry8ykjw6bjd1TtJc8WC+b4f46K0zzHpCwlInF3m4bNw+ir6Vl
 irAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> [ ... 238 lines skipped ... ]

> +
> +int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
> +				     const char *adev_name)
> +{
> +	struct jh71x0_reset_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev = kzalloc_obj(*rdev);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->base = priv->base;
> +
> +	adev = &rdev->adev;
> +	adev->name = adev_name;
> +	adev->dev.parent = priv->dev;
> +	adev->dev.release = jh71x0_reset_adev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(rdev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(priv->dev,
> +					jh71x0_reset_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);

Could you use the helpers provided by the auxiliary bus instead ?
such as auxiliary_device_create() or its devm_ variant ?

A lot (if not everything) of the auxiliary related code here seems to
implement what auxiliary already provides

-- 
Jerome

