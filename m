Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E44ED182
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977584; cv=pass; b=SEV4qtmVBiH9h08YNzUtGq3B+v8+SkqTQqAzgfB8Fd+GGk6E1SPqPiiU+oZu5g3Cb77LtXpEXWzQSfdmKJqkCYrZ6JsmeNZU03mvETeXg39GvjtgiiLCQylvVGM9YrDOCVyNc0eaRnKoVHb09HSuYOn8ahGyVr30H8BqD5qeafo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977584; c=relaxed/simple;
	bh=12GPgwdr3qj0TkfPxuB7Od/agzSF8FGX9L8FNnB9lOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJm0gcU2DjYLvt1oNH9+/0Z2tuIbaDQR32BBk2K97MW6hiVAC3fv7kQWsvnQ5GOnEYAAaVAtpfJaRJOFGaxRzt8d1fhKxT47lR1rLXf7oSZL2o+EgJZaCgqfznTCwfKfPiFD+4Xmd0gvGTMZ7BQdVY1BG2nQ+L+CPIAyuUe7lg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsJJ5IHJ; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsJJ5IHJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e608cd460eso21265045ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977582; cv=none;
        d=google.com; s=arc-20260327;
        b=pOq6E7uC4OvDIdi5ogg71LdsrOvYOyvQRxWt4R0i9DJWr1tTAOat85aCfrqlGy+NSB
         CQfwBLskf8Ia0O2bR3kxD5AGhNxEFJt+SZqpYiILRdCR24nocHXYIWjw6FgasPXc8qXJ
         SxRa9VO+reIZGDmq21LnkHzKKyoaoaqpq4/JJ7J1Rqn9tW/5PsiQTXFEXxWmm9WMe80u
         7a322vGIiv0Nb4q5lIXdiq0lUMEKG4o7VHxY9wp6cQttyNhWQ/QvF1DQFL4uZNG7KfDc
         OxPalVh71usnAmwwjkJooB83tsRmsOnSQHU09tyuAi+Kc+h8jImZozBD4tI42PTTs+gj
         n/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        fh=IQa4NBjTocZdaJNenEpuys7IVCLD2IEVkbnnjz9mdT0=;
        b=KUAEZhHvCsvQxY9/G4NEMBqb2kyAWM0c7V9D9pgLY2q1CZnl94AMI1PZ06XBmw1R/T
         MvW4QE7abyDc6j2wOhFpOauFT4WI6v9raRt0APouDkt9vXrk58BjgS+4MDC3+73jkIGA
         duil5W4gumQADFOaneMqgzEnq4hSccMnLOwjPbmW72kHeQruVWvU/X/KmjT6Hylm1JiR
         9sxr7U8sq838ihJxQTrSvYkn8WoE6QJeaYEGX33e0RuLrcO5lA8YLbVXd9HHWM++IJAw
         5PHukcE0owA+Qha+ggf3euwZ5UYcJKky8MRUfUygLGJ0OHeQzNpwz+Ele6LTDWFo3TFQ
         Zifg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977582; x=1792582382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=SsJJ5IHJVvYN3OqMbEyzvONiRhLOUCwcl59EpepImMqFowX1Ubj7WQSQSVdF6u+qp1
         M980aG7tYdA1267LECI4iGH2W0g+0l3rOs08S9wsoZhPdaTxL/NPO2DNKu3wdYXQQ4q2
         vbvPWuV9ATvNqO8iOyUs/r0an+LBAzC2Ic2a91Qr6v86oTLPShbOp4Pu4fwAS1HuvYTS
         j+g75Gq8Bkjf790xF6PHZv7ME1sLO6G0aVusA0z0pvgsU0vIfcWQYbIoPVaTfvfmyz9S
         XBy3gpz1cdFoAVKZcEgQXRj2/IUIKIrTxHAOPn2corJb0m6UfkjbXTay1IC2bPQDt8w2
         5h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977582; x=1792582382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=z5q+FoaPw+JihAEsEekq3EHPHjtCvs2Z7IXZkH18W8RjNKmMSpAAzomOoqBfOaaq+A
         jMq2bQ48JRaeKSNvdcfvFoQ1ftBlm+AFJ9bgD02zxBGSlA3QYHNwC7zX2x8TtRF0KOsb
         4I6lS/F2DVQ3iWSnsSVY9Hbl3Tf6QKaN3lf00XTpz9fsaqxm96pKFAzl/BI+Q8b89KGX
         7XOVUqFab0eTbv+HzjxMQDvS+KH+y8MLQA+zMLHGthIFkileLBTHggw467Cq8LiS5h92
         lJCHHPJxgFqEE36kNhh6+p9WdOuMn9urIFjVVbp7zekubvhUISUepkLQz3lYCKGT79lE
         duGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbBb9TEiOVNkyv0svQKcQ559jgHkN+V9zo9RFVYn58+RpwOT/ZbqWjh0j8tpy6NC5PTXz9O3Dvl5ICPRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2x+sXJNfGzO6ODD7bMnsmXg6S7IRLFKoDGZPAZSBirN8GO+3z
	fiIX9NLI3qNMfml4lbx90Xfn0nGY09sl5YdL++dT7DkNZ2Dmp9wIx1R7PTxRcTfn+Jv5AgR/AKB
	YFlPK+IoedUxHprflCiZyTYO0Ot0cTAc=
X-Gm-Gg: AYBFou3n5gbyGUJ0ZQ1uQND3/LqSaGO2L/wbru8QhQVWdltS3Ra18LqFojzEgeGkppy
	yY6/TaUSb57oA5oga5KT2XkJc3q159HYs2pSQp5IawJ9dxsC/stTifJHlapb4qLakYFTMoHMd+2
	88VsPP4iaW9ERhNoTWTzDN4CyrDtxLJ3aFgd/HelMVN7OpFx5cieSbhmmg/M6liEhqrqZjSndHd
	GxWGr9PactOE0brjTqw05QFVOOz2soRryh1Zzpx2Dj2MgUfU1YYAxOAj8WMbqOKiyPdUBQ3N8vz
	J9fIGYvfJ1u4g7fyi+hKOK/8Dn1wk/TWKU4156k+zVfisAgv4wrwuKhwjhaZ+RPETSt9uu2M3Li
	B8WwVBhO+H0JY3OUMZ7nEAdEDgskC5Gvbvubkb0p4tNJtLxcemANsP2ICjSTjP34Gg60=
X-Received: by 2002:a17:903:1b63:b0:2e7:ff72:203f with SMTP id
 d9443c01a7336-2e842bd0f74mr119079465ad.61.1791977581942; Wed, 14 Oct 2026
 04:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <179192410143.1606900.17860222773161459120.b4-ty@b4>
In-Reply-To: <179192410143.1606900.17860222773161459120.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:32:50 +0700
X-Gm-Features: AclHuK_s2zGX3VihBvP-h606hGOl6LIyL74TJwbiVFCd2fpUtb4C574mAt5YBhc
Message-ID: <CAABR9nHZ2+AD=-SoAbXSuCMD4UU3VVEQJNEF4w57Z_c6Q1a5vA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Tuo Li <islituo@gmail.com>, Rosen Penev <rosenp@gmail.com>, 
	Garlic Tseng <garlic.tseng@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
>

it looks like v2 has already been applied, hasn't it?

https://lore.kernel.org/all/179138999054.2423942.10212092263791353501.b4-ty@b4/

Best regards,
Phuc
