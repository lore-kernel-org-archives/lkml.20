Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E73AFAEF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380181; cv=pass; b=s0iX7L9mcm2xgzfGsT852vLq86oWga5p748MJj8bv+zftz8vlRZGrF+cQ+jZrLM6fC6a+ZvX/zTtC0zKu04UPNsrujmG1hBRP64GYaq5XkwW+72jxFblKS5TsHAo5Ow6tn9Tsm4vOFv2Q8iABPTW+bw1Kz2d51yPQoKln8VCiE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380181; c=relaxed/simple;
	bh=X8UYCgmRSd/S74rBcA7BLikNmBhdmEtIgctQKY56qBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqQiBznBmG8U5YtajyfruiHq3a1ogcVCFrRYE1rpWxRpT/oKQXekt3H4PotnT0WahabVJTKxrVv9DdH3kGrieNSBWtbvPFUsjgBgB+lgOPfavJdLXlZ+VpWkTObpn0pkvja2AZi4RRxC6+vaHPiQUPdpZNl02sI475gY1KSF6Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ey8dGutF; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ey8dGutF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so2332225a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792380179; cv=none;
        d=google.com; s=arc-20260327;
        b=cvlcZr18GKD8Ft6ggR9TFo573xTVR6YQMfXeRDfpmeTeezW/tI7Nbd7FwvxA90cN8Y
         S/WMhgj8pEVE31czX146Fq6AVrUtcN8QNEywfaH4bgy1mP48CFhX4KROcRrbvaZiP5eu
         ZRhFzGwTQHSbYjWnbnd6a+zGY0tlS2zqwZem/wbu0A76U57Cb82JdgccHhkeW3/mkbOs
         jwlX2ilizy1smq/moJezCc178F7uGvcSw52a1kgaqPDCKdmtmTl3RJF/NW3Wwh9sBBOA
         KAzlleKZLfqcN6Uf1VLHbVlKYMAJLFOBc+o2L4r6s4tTg2I7KhPo9IL3Te8+pfoKaVar
         ixeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X8UYCgmRSd/S74rBcA7BLikNmBhdmEtIgctQKY56qBY=;
        fh=SqNyWmilmoULQkGY2DMl232oTm3FzgFQ3v7WuRc1VT4=;
        b=lmpt+nbjcDXqT3TH4dTF6UcXH6qZ/Sii9dhOROn/cE2xDy2ayccysOuUU6BY9AgVeh
         rBUyrZuBIplb+YtkFWCRcq7K+cyXgzpkZU4OWL3bNlckYpbI/xwyF39Sr5gHBe+7VQRJ
         IK2j/TTwtS89J8mV5Omub6d44FgCa0A4l6r9MdUbO9RAwkCiZNlW+5+d5mXbv8w58hxz
         WDsyFn10JJTWYPm28Yyt/naGXzyf7vbOIuRmtoxmPHZTE8lWuwIDNVQIfxEJzHvGngqW
         eRce+Rkz+kyO069K81xZGdaR3U2aVKKxh2fHSJ9FG4P3CSFsedXmKqEAqYvre0pRuH+l
         p6kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380179; x=1792984979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8UYCgmRSd/S74rBcA7BLikNmBhdmEtIgctQKY56qBY=;
        b=ey8dGutFhlYGuCzOB8nsogdpcAKhYJuVI9R41VUjSS+T2ZCEO0wAhQanXLt+JpFqbj
         c73P+yiJLoyVW738WTfP/Xq5rtuRkdXekrnqCF47OhumfCpbCzzsevOvUTHnSgtu7lLY
         Mqn0N0NbXupX0HZUtLYOyKt+86IFfHbwwkKIUnNzhHyVeMpRrVVtqTwu1OjJohqgOifJ
         QMYiQnEvg0seDpdhHL7j5bkxBC3K7ONv5hvZ9Krj/ZNmsS/10q8Tb7EkIGDm4HCBl6p3
         I2bx18kXIuEwxNwLCYkXtnHTmjsPg8JrTCM1d7I7I9cIB6jmBJVGhjGVQXa9hdq0fpa8
         cV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380179; x=1792984979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X8UYCgmRSd/S74rBcA7BLikNmBhdmEtIgctQKY56qBY=;
        b=ObrwUKw3XzzahHeUNCMudR0g8gEeV3VKIHVcCzVwuZHlufsNCJSPN1KSX7Wm8ZmQ+D
         xXY8rb1uhW/rGwOJXpaL9jqX1QPz3FMHGqTuZQTkrIjiZLvYIKzLdRx+d/KReQ3kHQQP
         cEW80xwfgShtUWMhLLV78S2bGkboDOXOj6S546qa8fe1HKUrnqc2yHpHWzwM8CDVtKF0
         UOC8tSe4uksux1rwurK7Lf7dm2Wq9ArXZMHbxQB+897F5p+EIr4fMfOtuvmkj4jMDe1A
         hfq0ltHrXv1xTO3YV89pHH9/A1pv4R+8AsxMo5AOX2OpZjO+4mnl0h8PhQnwX/6Y5XbD
         y8ug==
X-Forwarded-Encrypted: i=1; AKwUvByblFTk+LV0tDk2Py5o50t4znxtdgNVuSmp3lUuVc6qdL/LAz93ebGM87Cy4YevO4LZ+9kKPSP2Vgabatc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGVqUsoGKf0pMuooIRAY/IpXwhrxMKlitOOhLJg3TOuyexPhbL
	jPU05RnEilTWUE+WWboNLC1a5ZYNeALpy83ypbxXI7D7hodfV4LTs5M0hDABQSc875LLLYwGr8H
	dNzEWOPhYBJJtNq0ahKzNUqZKRk/Hlts=
X-Gm-Gg: AYBFou29spMKqyJiS1yrJphCVgacvoze9MnLcIjeX9ySAUPGQE1gm4K18BKYx2rRUqu
	Pdq9A84nrOCFemFavNmujHs8jYWOaVavrSSJJ9ok9agb8JxNAeyI3nEF9RNNp6LOtsUSzxEkeo7
	UftlqDTpmad7qRavEW8YGa9QC0HDHstirRf1OsP+JYUw97uEkVbatlPNumEadLcVtUwFf8xuAcm
	LFXpLw2Qe6Zm3SCkApXyAfw9CRxkrwXFcOt2ldvEHlkIWJgzor9oyJN6dbfxOsxspB5a6E4D2vu
	ht3uMlo4htv943TvwqeL+PyO0jIjDDrVE9wnVcdnzrU9R+Eu2y69EUDESVjbcnFbzHa796wC6/M
	iH0gTQU8P5/8A/l9jww2tlQ==
X-Received: by 2002:a17:906:c103:b0:c2e:3b23:1468 with SMTP id
 a640c23a62f3a-c41a0cd2aa0mr418234366b.48.1792380178629; Sun, 18 Oct 2026
 20:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-6-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-6-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 00:22:46 -0300
X-Gm-Features: AclHuK98fG096I_kHqarkQnfuU-ZnCrJiV3Y7LamgWacbZNZdujtbnhCv-KJfjw
Message-ID: <CAJq09z7+1abRR2qetn-_Cd9sZUuiNKpLA1yaP-XdBC7GDepifg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 5/8] net: dsa: realtek: rtl8365mb: store the
 egress queue count per chip
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Store the number of egress queues in the per-chip info structure and
> advertise it through ds->num_tx_queues, following the ksz driver
> (struct ksz_chip_data.num_tx_queues).
>
> The queue count is a per-chip hardware property, and this driver supports
> several chips of the rtl8367c family. All currently-supported chips expose
> eight queues, but keeping the count in chip_info lets the QoS code that
> follows program the priority-to-queue map via the ieee8021q helpers for
> whatever queue count a chip carries, so the 802.1Q collapse is correct
> rather than hard-coded to eight.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
