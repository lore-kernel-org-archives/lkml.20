Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC7394EB7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458938; cv=pass; b=WX8GA/Y9U4TBFnz6oEckNkNUcGYC56X0WjVqVEE/B47Cv9OrxTXdFegiYQN40IuQzhmeGdH5cdAlB37lSP+CLuSgzMDQBtIU309WVtD6aXgNrFUR/IeoEvk8jv0vTskd5xXTn9jRRhxBxpmmpbSp9rToxaPqgMKfyEVgyANmrVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458938; c=relaxed/simple;
	bh=MCmnREfTZM3eEhy1qIdIvvOYJ/hTWjGqL24nR5iVWes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WefrrjVz576xAlSystRvPlAxOioeWCU4zP90WsMoOP53LhZlZnCg544aiIBEtGf+/KEuSiAmEJenp3DHNvPt34DGADtH53cphaQ9je9NV9uwQjHYfH/IKkhYPCjq4gl0s6f2sWiRBURJoWHYHZEWfBSmbnYQ0Hci0hU1y+RpELg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiXFELF3; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiXFELF3"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso68872866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789458935; cv=none;
        d=google.com; s=arc-20260327;
        b=dfY2RPtMHvO/xw9leMpLOcOBzFugUwBhuRyrfFulOWCiH8jdOP/vZdtKB3u6ngSo/b
         wKqepSVeHrLcMlNrnWi7L6FRXrvkfKjqsZfV57fNiYdHTAMCKoWG8cLw1T8cL+l36VoK
         wvC4mX5yUGv0bUe426MyhpPDxybI3TnuHesADA9w2vQAVajg5TYGyURzr6L4zvb8zWlT
         xX5RyJ1pWkYsueGAtL/h42Pam/qONg13KPehRa5Rmw06UoJ1wj+Dfx30QhwiLGEvxgOx
         KNIEDKAEsWQlx84tfBQqxvvpnqOECERm4Lnr1BNfzV5qQt1IYiDLXFZz3XwWpPhMeEZ1
         2Sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        fh=tO4XnPo4uo92NiyAOrQpBi5v9R9/rmAy8HHgR8UFaNw=;
        b=MfGVkxvEQlP9wuWXivI6tRnfWLoW5JPvcU8mlmJW2XQ22RCZeaAItYWQ4ntyrTp6UE
         H8/l9eeJD8HJRX7rTpPc4yJ6+3T19yXn7s6zIa8BQcp7qbyG+AmaqNmcVerlvGcwvAM0
         LqvdOD8RfpjkABfukkBxr3qP9pnRF2IJIgCXb8Rr7vjy4SGN1hZ2VDGzjOmh4Q6Xwju6
         aC+PIfn/BJKSlWTz7E+Wg7RaKbg3JxzC/CjoIYU/x9xQIDlclxNni63o+awvvm7k/Lk3
         dmt/uUq4j/7v4+YfsBbQ6dxGXMvZbtetlNiDMKF8qYIocsKtr4RRtKYxNojynnBnRnDb
         hAZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458935; x=1790063735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=KiXFELF3EeVlIOaxeLxbMAHBZPRirg4qdOzBTXxtQ8yj8zU8hf+/oilZZOSv++OXW6
         dnRNgOkFwZOW8CbpkDPsj8bgfXk8OJeuZD20Mo9ZaHWYYvGUCKEz9mCOWLoNsNv23aIg
         rBlZPsmcedlb8SzOJ8MsA8ncwWn+DGoCzRjH+F/AveBu/lRUbKAcVcIODBtKK2UFHEfL
         McO+24I/C7yVW1KfkJlhZK7NAgokUaczqJlo7MsIJkq59tFoXQ22uQw4uqUKHf2VccmG
         m0VyRGhunnm2ioVNcumWQIwnTuEBDcV1mFdFuGOlY8/ApNI2bfY1wTyAgOTn+OPVlAC9
         Qmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458935; x=1790063735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=z1fWA0XhprRsRqoqDuoyjhOgBiYQChNoDEWTmEiYY7REpw9oBkGBg3VsACCEcDGHqT
         U/OAaL/GRsXV1Tj0m0lGzW1+6QXrBOqExdLZmVbQReq+PT6UuOO+VDect2MRNXFDGm1J
         vfM9o3GvOTcrMHBwsfmNs6CJxk4K/SF7EKIhgr+7f1B4oFyGg5ZddeA76KFb4bvBUPWA
         J7Wpb0/Hac0gS6RuPusBKX9EcoMub8pPfOdlLndW7JL8G8ydkVpriOWk+TEp5/hmsZAf
         mZSIudENeONWSMizBTEWxMJPVUkUymgsvH1OTPBo/TPohSRjbtbXIRN5aNTayL6MBat+
         hhhg==
X-Forwarded-Encrypted: i=1; AKwUvBzSU0KeAggOy9IVxN3cUNzua6d9P97xNRcT3EA7drMLVnuOqoviEjw+MDQ9ybpn1EUx8jhZPWkH7ZcW92U=@vger.kernel.org
X-Gm-Message-State: AFuF++n2YFtMaDFJqm7ASETvpT+cBKKTL2UiPga0k3hvFM8gyComvQEN
	KmOI3IllTVz/4NnlsHpBJ0BqUrL1WZDcpA+O3pTbBLzbALwiWjDhKYFWJtbdgTrRutnLqyD8sMi
	fbjWHwlsSmMxQSgjaLR7OYxXMfBndBxY=
X-Gm-Gg: AYBFou17Nkzl5htquJ+sBa1X3IjAu5ynvzHxfHQqTvLBUvodo6LAYb4oeg7d168io9a
	SGV8419VTdP1/Qbo9L96+TmdAJ4kisRtoXFYiox47gpUdImkiZogKF/pDQX7oLuHNeuIj877+Fg
	sb8WggaBLflY95f/OoE045FaYIyJEIx93PSWLDzMQEb3PMkcDlKx+5Fd4x/fHDYdK4q4tye0H/E
	RtpHxtqyLN5oDeyjZy83Bmx1sT9IbJOGw57opt193/9TlReh92QFrvhagtUrf7f+eBhtKdHamn6
	hX09wvlVlj2hr8gr7Hby6dZRtpzmbYzcoJUc1YC1wBRhVy82YzEG0t/bhQQVNzf6Ihg+XMfeUKt
	QY3zej9VQrfP+cEf/++3Lj4ctRmdEZiSddNNIaE8OVexKQ4j/t2Jnk7TN9w1DorSWHvI=
X-Received: by 2002:a17:906:6a06:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c29c896c418mr191111266b.12.1789458935020; Tue, 15 Sep 2026
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
In-Reply-To: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 14:55:20 +0700
X-Gm-Features: AcwNN1XHHQHyucAHdm0EW7r7ZxJRYduxWbuLcSKyAsTdoDPrrcNWVh8BQ68F-UQ
Message-ID: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

Thank you for your reviews.


> >       if (!afe->regmap) {
> >               dev_warn(afe->dev, "skip regmap\n");
>
> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> correctly checked for error as in, if any, probe will fail.
>
> So... during suspend or resume or anywhere else in this driver really, the regmap
> pointer can't be NULL.
> The right thing to do here would be to just remove the useless check.
>
> Mind you, this comment applies to some other commits in this series as well.
>

You are right. devm_regmap_init_mmio() returns an ERR_PTR() on error
or a valid pointer to a struct regmap on success,
so checking for NULL here is not correct.

Also, if devm_regmap_init_mmio() fails, the probe will already fail.
Therefore, I will remove the if (!afe->regmap) check here.


Best regards,
Phuc
