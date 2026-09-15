Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64D355055
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468823; cv=pass; b=T0ngzzyzFqMpdi8D9fwcSXqU3FcSv7vFh2MCnudYVnG07lKJhsp3bzzuMicugDAzjHFxVspDoO39RrpbZl3JcB95AMV8VNizCPnENABxGYGrpqvcIYPGTeCZQgnXMlvh6ttoiqUJ8zBaW3ZZc77LN2hMMtLR85XplK4i6/v+YmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468823; c=relaxed/simple;
	bh=1dPvPHlQ14j0yBmcnl+yP4L2b4M/3WUmrDKtwyEqswI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMqRbH1aWAhrrdflOjqGqi0h1V3RwGJ9rzTk4uwzxO1XyeYjrULM+uWDR9bx09n6sU9I4rctR1QqNJ9H74Y6YdfDgPI7xKaaR8uwjq0IT+XRCq7+kyOflb8tfGQ5z2aD+46P2TuioIOcY+iqP8TN5B8eEn8zKibiQrZp6bKqxqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVG5S1QK; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVG5S1QK"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1039927a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468821; cv=none;
        d=google.com; s=arc-20260327;
        b=jZkDh3ZlndviOYxAlOAAQkNSIihDbwHhMBip68uG8OJ7Psdpl/IJoorqCiEuf9OJxP
         TMl0AsGEZPjeQ8JlDaQeVZWTn/FXGvaSjYWE4pisDXHARiwYmQJyVMAuaARN+sKXta3+
         jNx0ZZtRXxbjFunwBPl8DmhVDcFV7j08q7YvomXYASctlsxHX8hQr+MEu0VdXZm+95lK
         zy/qrB+wWSuD71z38B5BHCjfGhz4ciVCx2yZbU9qxxp4/R7cKv2rdMdE/zjsc+GUL7dR
         vybIHaa1kRQ1EPHF7YQU5szsHzq6NNsoBPcQBBzXPVIdYryECyA1BezoyD/LOVWVMdkb
         ujJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        fh=Mnr2njHIO037+vJzuSokxGev3s+x0yYaeeyhTpASulw=;
        b=IVCIhmH/GYR1xEm0kvcO2ydobJaiv5RfsrM6w31CAGEkRq1ML4SdrojyOaNTzR8PzH
         6eHJ94jdWORK+QoGYZS+C1AxjWTuKJabeuuJhVGfIdLQZg1D+lMQgBW3/XqGcjGR/VRM
         AV6yIcxz8HuZ0mBE0wEZxx9/v/MSM1AxKbIy3z7cM31B/2EbwyZjCSwNz/3ece0r3Wnw
         RMe5ECRSf0JYWh6h16CXnpRshJzhaKVtVNaxuxh/rHMGiZj3QjDQQ66yeOw/fn/IdSuT
         7KTq5IG+wbIUIhh/XLJ4JbftOTXVDdnbiFblLp4flri0NPOzFVJ10p0RG+7GlRJ7PNIE
         sUzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468821; x=1790073621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=KVG5S1QK86uTjPLi0yGWquWIxL014Sg6gIv6IgKSVCc8AUgN7QmD3L/xWgaeJd/ruI
         7m/z4XX4k+FCZGLAIt4HnRRFTwejwD45Fv9PD0ZIRkHHOP29AwuztpDGbCw4gCyusXCC
         fNytTUDKtm4a6ZbSSxPNGeN1GcuAL3a195dZGnkECWuhWoVE1Oz+S51vBC5HEPvKk3WE
         LB5SstkLUb0RhunJjIVl70GVHt2q6YJoVFhht7RBYsNbvFVz2v2JTz7OzQZRUxS29LB+
         r7RBDtQ3FJ6+dd4QndOXXXaZGMo6J82FQU0ZafCBXApGsR6xfowxAGulOXGon8OBSVsb
         pVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468821; x=1790073621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=PT+2yd/2hFQ1rOyQS+vQOvwIr4XohaZ089ooA2xMccLHJNKt8EflpQZ4+HeruqsNoS
         d1Uf4VkgJ648HSNWI9nPYbws0QBeAzDWGnu75+4MVdqLsn2GX3s9WzB+h2ohy+Ec9Tur
         CcSXDcbB+PGHZ60yVDcmO5cyjhZCPwH1QemKyX8nb2RKPTpn+dp+Oc6rZvBgHsjbN6Pe
         28+MWMZ1nT87d41dlvm8WQYcoFzSyfjZ2DSf1J0FKlRuTUqax0PS7XuV4yiV4MI/bPDH
         TGtcyOXZf7jmpwxtanJTYE0GTLN8pUtK7VqMzLV1skvCkuNFzXAITWRB1jIYaiisho/l
         QQNw==
X-Forwarded-Encrypted: i=1; AKwUvBxfM2AKDNjHPXh55TX0ekda1SSSH8wqUT8jx2KHOTTWbGoVpB9t3cPKMbUJIYZKRX3DNc6VZqE768hQ1a0=@vger.kernel.org
X-Gm-Message-State: AFuF++lDkCCpG6Q1MdIdnEDpqkG9FJYDiTZ0IrQiq/i3gJG9r2BIOu2l
	tsJHEEXAVCNASHdd3ZNmP7JaIxccvWwCQiucWC54BlqprufUVy0CvYQIsJK18GADcdY4j6UKji2
	cKDlIcw8IOKyh54NejGWJpMg6C5D+QSs=
X-Gm-Gg: AYBFou18ROcNeMTX38ZrxyOrRm2X309ZphnlBmw1rSLKcA/KSkGrxTTMh0qm4AiyCtv
	3f7+ABePGFB508BJXvCTrdP6kdwKRIp4sNOCW3JAdCmAXnj71fuaEhIxIuPxrePxWQ/KZQpTqhg
	rAQuEZaREZ9MVYT/ytgTgrKq8mkriP0hXicHGTW40WMz9KSphp1CnJ8v9+9f4cuNwVHkDupwAvg
	mt90Y7f0ZnlnTaCNSjnr4IOIKB8zQmuu8uThUnsEkrZCcXFpmycV/kQT5fV4H1hNWahqOp8p+SM
	u7uJVS+nAqouCR2CIszpRFsq7ektPpgophKpSq0iU56hCe0jPYCmOdccNnQ2+6oWt+gIaFQ1c95
	mdCf4fJTuFt62MkP1lotpdNzPD9dK20HaJ6GNA6fql7KeSZo746zQwA9GLuzC+PMapM8=
X-Received: by 2002:aa7:888a:0:b0:857:73c3:4469 with SMTP id
 d2e1a72fcca58-8708c367516mr4031436b3a.24.1789468821304; Tue, 15 Sep 2026
 03:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com> <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
In-Reply-To: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:40:08 +0700
X-Gm-Features: AcwNN1XiIsKmvO7R4Fhz5E7d9MTMT7jOpXuiLatg0K19TloBrHHj0Z2OJFenKUg
Message-ID: <CAABR9nGWG8hpkvQP_0d+JytRpW7oRYPDW8RvUOTxL9kuXyEN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You have reasons, of course, but have a wider view and check the full picture:
> apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.
>
> That call can only happen if the device is not in suspended state, so can happen
> only after a call to
>
>         regcache_cache_only(afe->regmap, false);
>         regcache_sync(afe->regmap);
>
> is done in mt8189_afe_runtime_resume().
>

I don't think runtime resume always succeeds.
However, with the code as it is now, it can indeed return success as
you described.

> > If that assumption were ever violated by a bug elsewhere (
>
>
> > a PM race,
>
> That would have worst consequences, and your system won't be saved by this error
> check because it would crash way before reaching that...
>
> > wrong resume ordering,
>
> If limited to ASoC, that would break most (if not all) sound drivers, as that'd
> happen at the API level, and would get fixed immediately since that'd affect way
> too many platforms and architectures.
>
> > a register missing from readable_reg, etc.),
>
> ..and that would be a driver bug, which is not the case here: the error check
> though would be useful during development where you definitely want to paranoidly
> check for literally everything, even "useless" things... but this driver definitely
> is not in development stage, is it? :-)
>

Oh, being upstream means it's already past the development stage now? :-)

> > this is where it would
> > get caught and reported,
>
> ...but then you still wouldn't be able to do anything about it during runtime, as
> there would be no way to handle this and fix it: the driver would still act in a
> broken manner.
>

I agree it may not be recoverable at runtime, but returning the error prevents
the driver from continuing as if it succeeded and makes the failure
visible to the caller.

Best regards,
Phuc
