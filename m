Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C4511189
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859169; cv=pass; b=psc5Zmsj0UOhXbJC6BnA7WBbUpVLVs+4H9J6aUfk8rBQmc2fu5KkhiUpfqQM5NCvIydR9ab97sip+iyUJwzD6SnMlwOz7thZ6+h1WNEVwLMUDRtEs5SqCxauGE4+xUmv0lG3zAzpv5zWQPLuLphZ9JDVQxVYnJkZehmfD9VvxHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859169; c=relaxed/simple;
	bh=1CJ3Fj5ZeETTIou3X8k81+BylqMvg1us8lXgPWVlAw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqxGccbSy6hFe2pGa8cy4uGnnL3pfs7U1FVfBp3ttWlS7bSCiSpU1d9EwThgt9z/MdHxBfqrtOv5n+MbZuI9YS97zDmfvyMG7HtEHp4yF64dCkRPgY/Uz7V5SvUyKQN+mEqpSZkk3tEOYB8LQTOMCreNaYAUt7Ukffq5vkdBk9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+XC3HIE; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+XC3HIE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6f9e2f681so47236285ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859167; cv=none;
        d=google.com; s=arc-20260327;
        b=gqKwJR0e/DgEZtaIoLK+9JKTruKjVcKnGqq8qNvmEJ2gRZV8pU10rpYc2AA4SltnlO
         UFexY7IWNBVW+3EZbQ3W72YwoKFzvpPsGAA7MFnaWlpYBzqy79jlYZ4tJNnsmRoQgB5B
         m2s346kz67eLU0mH3EP5Nd8o0WoZo04Wi6yS36RGzZXz3mKsi2hzjQKkGE2/rnrpYxFF
         XoMI7xN+MJule3tjYKDib+DssNsOPFVe9871e23Byf2yELBlGHb4AYpbCZGYxP+mP/O7
         dPOYF1rSRJz1v5K4Ml4jx9Y25kMfZ6wgR/8MtDiCCp/DCXnTmYk2cydgB6t/IwXdZTh6
         NFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        fh=sEFd+WQL9V24BrIbuXtEEtQ+pc3P1TuzXCmTxlZ1dms=;
        b=dymmC3lNorkzSaY/hFXF3WWeyocJGxE4Y1zn6l7MDCRlUaj85Onw84iZjMsuNy6raB
         +zQxyULz0zdAKXO3R0qScn4Nk7MBqJgD6fyrZud7eu32A2Bm9c7pkpmW7zSb784nTCUH
         SkOhtC3xEtenkIbkIdHu7JlG9A/j4nWgcUcTl0wtVQ08taPCRX1CTHGjNRWZT8YNzyQ3
         /bhfqA22nVnhvrm4IJpL7u367JT+Xj+WEkcAQ8vEg134VEkL+fE6VreCoOOGREwldiRm
         PMcDuePghgXBj41HPxjUeJgbPGKnqAjPPhH/QMsV1fAdya73GkfnaY0ssLWp7kdbvGMN
         KrHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859167; x=1789463967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=O+XC3HIEh4BvShXFCFAaXRAFIX46peg6MtueGCced9Gl6ZE3xOxNkfco69Lfy3plI3
         szB4t5ssfobRGXsPxZgr8QvO/8va2hII6m/9oMSj5+0rD6wWoFT4BScsIJL9lO5gWEWX
         gDItRBp2o/heh/OfsLdLVFnlS7VWf3B4sZenYi804DwdILHrM2TzosHoRq4R3X0ldary
         VBP1R9T+LCZZivgjKOTkvUCYyWWfbxkyx91fQIF/j25ldADwBKnBgtfJt8T+iBBcqVh0
         1ytdA2H2jShNv5YGSmnMpi2Bm9dYa1HFfB5YbZmAxgfAEv7+/6ls9rDEboZlhOpJKm0q
         lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859167; x=1789463967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=SU+msSr9jBcgabEMGlVux/S/YSHwZZgG7H+wtRcN27240Y+lqLKrQ0P6KAUue5KYe/
         l3Yw5TSj0eDgGPmYhE34kit8DZHSWqVobr6iDRE1u8rqhQ0GbFOTPCuOcau5rJ+BETxu
         jX3PA3QGIQywEgNJdHhbpIsuVnAMKW9oEC4mNzf4ETHFpU6/seFfMWWoREYxCOM59NtW
         XyzE1sbhvmF6Z7Bp90hKXwpGFz3wIuhP7wa9akv4WECZZX61vuBM+XKE8/gsGkSiruSn
         eRUSSvIUqi6FJZc9OC4XrBLSG6oUtn4f/QoyZEA3VQESYfI2v1be1VNnN1AJX2m6dbzu
         hdQA==
X-Forwarded-Encrypted: i=1; AKwUvBzcyZMCP/FFrv5bnCckYYDdUTQ4xcbLYdKSOMdRFR+ON1JNo5QX8Fu+HZluEiQipjdnqLCYCZlC/qV+C44=@vger.kernel.org
X-Gm-Message-State: AFuF++kV7/noqTShJTAXyazdt9lauo0di8Qptmu6DQgjM8ojY09L653O
	bygzNk9A9BaiUaSeGQFe5K9aOT+fhjavHG1lOgV2rRvNpeoZrgsmDH/kRUJOU9RJregYR5sO/tH
	GrLuh5qOlSDb8xVjFeRfbDbUPOEUly4U=
X-Gm-Gg: AYBFou0lPxMdpuhU65zAqwZtBo+9fpIP4DMkoNEbxPXHwAv0QqRVTL6rjx16lQ1yT+c
	gHkYb+WmExqX/qqQ7wgOh6cBtMfSgQKKqbJJXKpoEcDuVWftceZLUUSfSPV6HW4oFDhjMVH/W5a
	TGuSbm6AlpozBKU4MZLM3S6keTjaSlgIrj29gGhRJATrV7q0df2ccxWtYNjf+Fua+RPzVPz0Nb7
	s+WGeTqu118Qz9tjoPpPpMapU1eCjpMt5Lccnpet3pqVUJhDEDFkKn7Yp8ODwwjEpPdYHW2RDZF
	KWl5HFGPO/Q0/19gtCe8gKDDwsVkNfs2295PomOpdSqdRWOcUAZwgBJUxGlqlgz+JqI7T5j6UXk
	lO0VlM30P33aPtJ1+BN3zushxRzARGYC577pRWgyerq8O0T0d10D2ptlf
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2db12106896mr426721305ad.0.1788859167169; Tue, 08 Sep 2026
 02:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <20260908090448.3332-5-ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 16:19:14 +0700
X-Gm-Features: AcwNN1VpPKN1gkIiS51yj4BLA5N52CV9eNK9WOCJ4im1zZlIaPxLmU_uBzBetZQ
Message-ID: <CAABR9nERV0bGkEQm=4kLNBZVfurr+6c-Q_to9=XixJV9CT=vyQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> +       ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +

I think we can return the error directly here, as devm_request_irq()
already reports the error.
dev_err_probe() would result in a redundant error message.
