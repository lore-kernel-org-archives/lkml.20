Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA8331EBD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404325; cv=pass; b=JAj7/o6lV8S6p0hy0iIHvWYuW9vSZgs3oKcc9Z7h6L974RyWiFptNgl69UMh96cWjrIGVoWrZv7jNoDERgx5V9bGT4rbTzD6K4+oFzSlZfupgxJZpvy/IR9vl2Sw72rHL2xCGXFfunDzKdGKdnsOgUNx3Hd3eakUy+lEMN/PNYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404325; c=relaxed/simple;
	bh=Qb1qBBijm4jWoo8sA449MyT9wTONvNTsdJy4cOWMpyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgL4qniItvUpK6LHmFiwpSWDjVLTPVpGXfKJoIjJjLooG4kAr+IY5Q2f90diUdZZrUlF0LveDZf4MxmGLvfRT/tCBWQhp5Z5iNvSm26SdQVR+LuQFMvTHDslyIuyJXHUeuxZlnuAoSzWoSK6SfWKoRBISzMcI3O8kdw+Nn4+AQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4aXsoZD; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4aXsoZD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e27035206so1675376b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404323; cv=none;
        d=google.com; s=arc-20260327;
        b=n/35vkTf8g6ofllXvM0E+oXZkZJv3nUb+I6bY4A3FXnIAMvzEzmNRTlecR/3AR7VDm
         ly8YUt7nyIaAbFoD9F931BaIT5BlVhFVV92xLsKz8C1o769jQAG92ziwoNcW8eFFQBB+
         LGtuSMxd9zfi7I+RXTYsMDBldEBEsqir+9mLFleG99gei6oJkzoFDxwtoyLBF8G4g2Ab
         CI2tJJnFWAwEZ6TZK0aivp42nV1IV1SFjW083nF4RZgTwHKsI5YHpFNJ9ogfPEGm9i+l
         Zen9IlB3kHROiadbysZVX4wOR42kGjrTk7RE0f35+o7xcki58Zw1qtW/9RR3X/Lblhkj
         Ht9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        fh=L3QnOi0MkjIP/RhZhXsnaikxGXUloA7ZojBO+Xk4tpY=;
        b=EjrGm3NTelxEU+TyoXaYhvvs9AcwEnXqpnDFT1NgjQIafrOOCjIUiH0+r13n7Jw7gZ
         tw/rj4oP8De1uSOO7xOKLZcxZcAKb9+NI+E9RdZReOAWha8elmX2H3F46QqNhRAdKRTK
         jPdmrbwa7v+rTEWWGSZBMu0d4ZkSPPT9MBJTQLf2SOX208qKylDBW0ypsH/tuozNr065
         fIv9+ktwi5w9uA0X/RcxJnZWFEdH8oRx2svKg5YBK46ZY6FghPKfXBWB2GmMWJ7Lpebg
         bmiTuq29NMZpXyzh7oUmOfaBGHqpJZfK84YDj1v9x7LKiACGHyQviKdQ3m8A1FrCn+j1
         F6kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404323; x=1789009123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=n4aXsoZDVfc+HLkCWbw19ZeNg6aRx694pzhpnu97+A65dsWlRyb/zbirsawXgO3N28
         0irtN/ZPG+qawvfsdha3P8mRFms3uLN7SmYQ6AK/YINrFwmpD/XiwWkRltGaKmCJxgmr
         98BsHe+bbJPt213fONW6Cp5wFeIom00bU0SARyNb25xiJc1E+3dJJOAcxG3QNowG1BOL
         jNZUaJr73pfkRA4n1NEYE2vmbAoEUYfewZWTpRKU85/vkY61VQ/7ozdok+AKzm+ZCtcB
         Tr+mTnubDXkHjKMiXGIRAgLxL7S6w0YoMk/NDPYfMKsq9mawTnqu6qUvm2RiJHepn2Sy
         6P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404323; x=1789009123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9JyJMF/geV1z6omONvEP0twAdQNCLLyw0zl1sl3pjk=;
        b=rcy3nEIkE7f2+RAzL5nREBnOitW/ebMvhDcX7MW9h+hFCtLMQnxtp8JXKuvFM0hBZl
         /UlBeXQ3jyULlHVJqzevVTzEyg8qF4ukMqm5R0RKGn9gZrvbjjPRzjqkcXJ61WQ7XxPx
         gBB17HmfEU42zf4bO+/c1bLvg/vSnUUoNG+DGKrs3po5R6jYqJDkY6wv8XhdwLj2UroT
         scFKCMd4FlcsSrCNzo5HT4qKLjK9pY0sfIekNRot66XVMCEymhqle8Wmbo9urdk8nqKl
         YrmTrAVu6y9/fsqHBq5qoB0KgNTdQ36js6o1Oem3iRMF2evbIG0zNqXzkzfPtErMOcdW
         5zig==
X-Forwarded-Encrypted: i=1; AKwUvByn+xywZpg7DCIrA2gXvXA0EaxlBksuRv26SAJB5QkK5ymYc9f64xNN8HWt3su6I7aA00OCm+K8ON+2+8E=@vger.kernel.org
X-Gm-Message-State: AFuF++nLN5oNlkrr5LE8wv7yQp4rBBE8fp10ZvN1xWRBbbdMwwUV3xD6
	TMrMWl4iu5RH95ljyY+c3m9hILwwHsttH9qM3OvpScAcIfWRuVd29tumTj0tKLcJ6GLmt2Ok5LK
	uCtLlPJ9SUaHN3AxFbZnZCcIB5kbnbjg=
X-Gm-Gg: AYBFou0yMqe6PVo/hkuI8kmODfXf/GZP+CrBbA+/KFhW7lnE9zlrUmaKSFyYTOsTIym
	bvyP0OFwjAKfNiMDsomfp96ZrpJhsLleFSaMZq8eq+cKwR/FO3DbFC9wXAobIhVGS8C5SlZvy/m
	aYkUk3WqGvhy5MW8Uk59rUvHj6ZRM5UtQHpGtYUQ9kQhE5Lsg8RbuLXCzawlhISAgJLNyXgx6+l
	Iy2VJFKpvN8OKJQqI1L7jx1E4tucrq71Xs1lNDfL5fwhUvNnCNk5qXhjvfVnRJaBEmvnraQnn5a
	fObaCxn/ujf4lDtyUMYoAXgmkIMLlJhJFiWr8DBUy8azP6FIXeFuPIJ1qp4+U3ptbhf0OPxQa4i
	r5i+/LCVuQ8VWBr83B/gMwjoQ5x23YFDkqQSLfDPDV4feMq1J0tJSuu7e9cdpDdmsKLAh
X-Received: by 2002:a05:6a00:10d5:b0:852:38ff:b4b6 with SMTP id
 d2e1a72fcca58-85ed3f6cd26mr11933247b3a.17.1788404323051; Wed, 02 Sep 2026
 19:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-3-phucduc.bui@gmail.com> <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
In-Reply-To: <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 09:58:31 +0700
X-Gm-Features: AcwNN1U5zeKxmI35EGDwvUZzgzhqsl97lW_cejqy0aA9Qkk84c4bJui1c3m3NJ8
Message-ID: <CAABR9nH5dcpaxDSyo3jjimorTJ35nf_OjFF067Mr63aiCO3Q+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the review and the suggestion.

>
> I was thinking off a typical teardown procedure - everything is permissive:
>
> // the disable path:
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_ENG2)
>         if (ret)
>                 // just error reporting
>         ret = clk_set_parent(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>         ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_2)
>         if (ret)
>                 // just error reporting
>
> or, if one wants to do this properly: split apll1/2_mux_setting()
> functions into:
>         void apll1/2_mux_disable()
>         int apll1/2_mux_enable()
>
> You do not have to go for the split, the first option is just fine.


I will follow the first approach and use a typical teardown procedure,
where all steps are allowed to proceed and any errors are only reported.

Best regards,
Phuc
